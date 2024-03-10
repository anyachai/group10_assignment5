class Plant {
  float x;
  float z;
  float h;
  int branch_num;
  float swivel_init = random(6.28);
  float swivel_rate = random(0.02,0.04);
  float[] branch_pos;
  float[] branch_len;
  float[] sway_init;
  float[] sway_rate;
  
  Plant(float x, float z, float h, int branch_num) {
    this.x = x; // x-position
    this.z = z; // z-position
    this.h = h; // Height
    this.branch_num = branch_num; // Number of branches
  }
  
  void display() {
    // If there are no branches, it has the green color of a plant.
    if (branch_num == 0) {
      fill(120, 100, 75);
      stroke(120, 100, 50);
    } 
    
    pushMatrix();
    // Place plant/coral to its specified location
    translate(x, 700, z); 
    
    pushMatrix();
    // Rotates the plant/coral around a vertical axis.
    rotateY(swivel_init + swivel_rate * frameCount);
    rotateZ(0.2);
    // Creates the plant/main stem of coral.
    translate(0, -h/2, 0);  
    box(15,h,15);   
    // This creates the branches for coral.
    if (branch_num > 0) {
      branches();
    }
    
    popMatrix();
    popMatrix();
  }
  
  void branches() {
    for (int k=0; k < branch_num; k++) {
      pushMatrix();
      // Reposition along the main stem of coral
      translate(0, h * branch_pos[k], 0);
     
      // Rotate the branch
      rotateY(TWO_PI * k / branch_num);
      rotateX(sway_init[k] + 0.4 * sin(frameCount * sway_rate[k]));
      
      // Creates the branch coming out of the stem
      translate(0,-0.5 * h * branch_len[k],0);
      box(10,h * branch_len[k],10);
      
      popMatrix();
    }
  }
}
