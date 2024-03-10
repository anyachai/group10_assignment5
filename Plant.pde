class Plant {
  float x;
  float z;
  float h;
  int branch_num;
  float[] branch_pos;
  float[] branch_len;
  float swivel_init = random(6.28);
  float swivel_rate = random(0.02,0.05);
  float[] sway_init;
  float[] sway_rate;
  
  Plant(float x, float z, float h, int branch_num) {
    this.x = x;
    this.z = z;
    this.h = h;
    this.branch_num = branch_num;
    
    this.branch_pos = new float[branch_num];
    for (int i = 0; i < branch_num; i++) {
      branch_pos[i] = random(-0.5,0.25);
    }
    
    this.branch_len = new float[branch_num];
    for (int j = 0; j < branch_num; j++) {
      branch_len[j] = random(0.25,0.75);
    }
    
    this.sway_init = new float[branch_num];
    for (int i = 0; i < branch_num; i++) {
      sway_init[i] = random(1.17,1.96);
    }
    
    this.sway_rate = new float[branch_num];
    for (int i = 0; i < branch_num; i++) {
      sway_rate[i] = random(0.02,0.05);
    }
  }
  
  void display() {
    if (branch_num == 0) {
      fill(120, 100, 75);
      stroke(120, 100, 50);
    } 
    
    pushMatrix();
    translate(x, 700, z);
    
    pushMatrix();
    rotateY(swivel_init + swivel_rate * frameCount);
    rotateZ(0.2);
    translate(0, -h/2, 0);  
    box(15,h,15);   
    if (branch_num > 0) {
      branches();
    }
    
    popMatrix();
    popMatrix();
  }
  
  void branches() {
    for (int k=0; k < branch_num; k++) {
      pushMatrix();
      translate(0, h * branch_pos[k], 0);
     
      rotateY(TWO_PI * k / branch_num);
      rotateX(sway_init[k] + 0.4 * cos(frameCount * sway_rate[k]));
      
      translate(0,-h*branch_len[k]/2,0);
      box(10,h*branch_len[k],10);
      popMatrix();
    }
  }
}
