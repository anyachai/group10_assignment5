class LittleRock extends Rock {
  float x;
  float y;
  float z;
  float r;
  float scale_;
  float rotate_;
  int mover;
  Rock rocky;
  
  LittleRock(float x, float y, float z, float scale_, float r, float rotate_) {
    super(scale_);
    rocky = new Rock(scale_);
    this.x = x;
    this.y = y;
    this.z = z;
    this.r = r;
    this.rotate_ = rotate_;
    this.mover = 0;
  }
  
  void moveRock() {
    if ((frameCount % 700) == 350) {
      this.mover = 1;
    } else if ((frameCount % 700) == 450) {
      this.mover = 3;
    } else if ((frameCount % 700) == 550) {
      this.mover = 2;
    } else if ((frameCount % 700) == 600) {
      this.mover = 0;
    }
    if (this.mover == 1) {
      this.y = this.y - 2;
    } else if (this.mover == 2) {
      this.y = this.y + 4;
    } 
    if (this.mover != 0) {
      this.rotate_ = this.rotate_ + 0.01;
    }
  }
  
  void display() {
    moveRock();
    pushMatrix();
    translate(x, y, z);
    rotateY(rotate_);
    translate(r, 0, 0);
    rocky.display();
    popMatrix();
  }
}
