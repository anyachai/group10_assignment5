// Initialize variables
Fishes fish_group;
PVector[] positions;
BigRock rock;
LittleRock[] littleRocks = new LittleRock[5];
color sea = color(45, 147, 234);
color sand = color(210, 211, 154);

void setup() {
  size(700, 700, P3D);
  seaAndSand();
  frameRate(60); // Necessary to run on M2 Pro MBP
  
  // Setup Rocks
  rock = new BigRock(350, 700, -450, 20);
  for (int i = 0; i < 5; i++) {
    littleRocks[i] = new LittleRock(350, 700, -450, 10, 100, .6283 * i * 2);
  }
  
  // Setup the fish
  PShape fishShape = loadShape("fish.obj");
  PImage fishTexture = loadImage("fish.png");
  PVector start = new PVector(-300, height/2, -300);
  PVector end = new PVector(width + 300, height/2, -300);
  
  // Create a Fishes object
  fishPositions();
  fish_group = new Fishes(fishShape, fishTexture, start, end, 0.0, 0.07, radians(10), 0.0, 1, positions);
  fish_group.fishSetup(35);
}

void fishPositions(){
  // Create positions to make a 'school' of fish
  positions = new PVector[4];
  for (int i = 0; i < positions.length; i++) {
    float offsetX = random(-100, 100); 
    float offsetY = random(-100, 100);
    float offsetZ = random(-200, 200);
    positions[i] = new PVector(offsetX, offsetY, offsetZ);
  }
}

void seaAndSand() {
  background(sea);
  pushMatrix();
  translate(-500, 720, 0);
  rotateX(-PI/2);
  stroke(sand);
  fill(sand);
  rect(0, 0, 2000, 700);
  popMatrix();
  lights();
}

void draw() {
  seaAndSand();
  fish_group.display();
  rock.display();
  for (int i = 0; i < 5; i++) {
    littleRocks[i].display();
  }
}
