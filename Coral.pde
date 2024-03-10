class Coral extends Plant {  
  Coral(float x, float z, float h, int branch_num) {
    super(x,z,h,branch_num);
  }
  
  void changeColor() {
    fill(frameCount/5, 100, 100);
    stroke(frameCount/5, 100, 50);
  }
}
