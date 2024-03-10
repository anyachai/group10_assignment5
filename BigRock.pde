class BigRock extends Rock {
  float x;
  float y;
  float z;
  float rotate_;
  float scale_;
  Rock rocky;
  int mover;
  
  BigRock(float x, float y, float z, float scale_) {
    super(scale_);
    rocky = new Rock(scale_);
    this.x = x;
    this.y = y;
    this.z = z;
    this.rotate_ = 0;
    this.mover = 0;
  }
  
  void moveRock() {
    if ((frameCount % 700) == 100) {
      this.mover = 1;
    } else if ((frameCount % 700) == 200) {
      this.mover = 0;
    } else if ((frameCount % 700) == 300) {
      this.mover = 2;
    } else if ((frameCount % 700) == 350) {
      this.mover = 0;
    }
    if (this.mover == 1) {
      this.y = this.y - 1;
    } else if (this.mover == 2) {
      this.y = this.y + 2;
    }
    if (this.mover == 0) {
      this.rotate_ = this.rotate_ + 0.01;
    }
  }
  
  void display() {
    moveRock();
    pushMatrix();
    translate(x, y, z);
    rotateY(0);
    rocky.display();
    popMatrix();
  }
}
