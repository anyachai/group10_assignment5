class Coral extends Plant {  
  
  Coral(float x, float z, float h, int branch_num) {
    super(x,z,h,branch_num);
    
    // Randomly selects where branches will be placed on coral 
    this.branch_pos = new float[branch_num];
    for (int i = 0; i < branch_num; i++) {
      branch_pos[i] = random(-0.5,0.25);
    }
    
    // Randomly selects how long each branch will be on coral
    this.branch_len = new float[branch_num];
    for (int j = 0; j < branch_num; j++) {
      branch_len[j] = random(0.25,0.75);
    }
    
    // Randomly selects the initial angle between branch and coral
    this.sway_init = new float[branch_num];
    for (int i = 0; i < branch_num; i++) {
      sway_init[i] = random(1.17,1.96);
    }
    
    // Randomly selects the swaying speed of the branches
    this.sway_rate = new float[branch_num];
    for (int i = 0; i < branch_num; i++) {
      sway_rate[i] = random(0.02,0.05);
    }
  }
  
  // Continuously changes the color
  void changeColor() {
    fill((frameCount % 1440)/4, 100, 100);
    stroke((frameCount % 1440)/4, 100, 50);
  }
}
