// Initialize variables
Plant plant1, plant2, plant3, plant4;
Coral coral1, coral2;
Fishes fish_group;
PVector[] positions;
BigRock rock;
LittleRock[] littleRocks = new LittleRock[5];
color sea, sand;

void setup() {
  size(700, 700, P3D);
  frameRate(60); // Necessary to run on M2 Pro MBP
  
  // Using HSB instead of RGB for Plants & Coral
  colorMode(HSB, 360, 100, 100);
  sea = color(208, 80.8, 91.8);
  sand = color(61, 27, 82.7);
  
  seaAndSand();
  
  // Setup plants and coral
  plant1 = new Plant(60, -50, 275, 0);
  plant2 = new Plant(150, -100, 200, 0);
  plant3 = new Plant(580, -50, 225, 0);
  plant4 = new Plant(670, -100, 300, 0);
  coral1 = new Coral(50, -500, 400, 10);
  coral2 = new Coral(650, -500, 400, 12);
  
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
  
  plant1.display();
  plant2.display();
  plant3.display();
  plant4.display();
  coral1.changeColor();
  coral1.display();
  coral2.changeColor();
  coral2.display();
  
  fish_group.display();
  
  rock.display();
  for (int i = 0; i < 5; i++) {
    littleRocks[i].display();
  }
}
