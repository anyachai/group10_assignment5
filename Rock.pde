class Rock {
  
  PShape object = loadShape ("Rock1.obj");
  float scale_;
  
  Rock(float scale_) {
    this.scale_ = scale_;
  }
  
  void display() {
    pushMatrix();
    scale(scale_);
    shape(object, 0, 0, object.width, object.height);
    popMatrix();
  }
}
