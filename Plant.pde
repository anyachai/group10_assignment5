class Plant {
  float x;
  float z;
  float h;
  int branch_num;
  float[] branch_pos;
  float[] branch_len;
  float swivel_init = random(628) / 100;
  float swivel_rate = random(2,5) / 100;
  
  Plant(float x, float z, float h, int branch_num) {
    this.x = x;
    this.z = z;
    this.h = h;
    this.branch_num = branch_num;
    
    this.branch_pos = new float[branch_num];
    for (int i = 0; i < branch_num; i++) {
      branch_pos[i] = random(0.5);
    }
    
    this.branch_len = new float[branch_num];
    for (int j = 0; j < branch_num; j++) {
      branch_len[j] = 1 - branch_pos[j];
    }
  }
  
  void display() {
    if (branch_num > 0) {
      fill(#efbbff);
      stroke(#660066);
    } else {
      fill(#41980a);
      stroke(#136d15);
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
      translate(0, -h * branch_pos[k], 0);
      pushMatrix();
      rotateZ(HALF_PI);
      translate(h*branch_len[k],0,0);
      box(10,h*branch_len[k],10);
      popMatrix();
    }
  }
}
