int x;
int y;
import controlP5.*;
ControlP5 cp5;


float outsideRadius = 150;
float insideRadius = 100;

Controller zSlider1;
Controller zSlider2;
Controller triangleSlider;

DropdownList type_of_shape;

float depth1 = 0;
float depth2 = 0;
int shapes = 30;

String types = "TRIANGLES";

void setup() {
  size(800, 800,P3D);
  cp5 = new ControlP5(this);
  
  zSlider1 = cp5.addSlider("depth1")
  .setPosition(10,10)
  .setRange(-300,300);
  ;
  zSlider1 = cp5.addSlider("depth2")
  .setPosition(10, 40)
  .setRange(-300,300);
  ;
  triangleSlider = cp5.addSlider("shapes")
  .setPosition(10, 70)
  .setRange(1,50);
  ;
  
  type_of_shape = cp5.addDropdownList("types")
  .setPosition(10, 100)
  .addItem("TRIANGLES",0)
  .addItem("TRIANGLE_STRIP",1)
  .addItem("TRIANGLE_FAN",2)
  .addItem("QUADS",3)
  .addItem("QUAD_STRIP", 4)
  ;
  
  
  

  
  
  x = 0;
  y = 0;
}

void draw() {
  background(0);
  
  int numPoints = shapes;
  float angle = 0;
  float angleStep = 180.0/numPoints;
  pushMatrix();
  translate(width/2,height/2,-100);

  rotateY((float)(frameCount * Math.PI / 400));
  if (type_of_shape.getValue() == 0){
    beginShape(TRIANGLES);
  }
  else if (type_of_shape.getValue() == 1){
    beginShape(TRIANGLE_STRIP);
  }
  else if (type_of_shape.getValue() == 2){
    beginShape(TRIANGLE_FAN);
  }
  else if (type_of_shape.getValue() == 3){
    beginShape(QUADS);
  }
  else beginShape(QUAD_STRIP);
  for (int i = 0; i <= numPoints; i++) {
    float px = x + cos(radians(angle)) * outsideRadius;
    float py = y + sin(radians(angle)) * outsideRadius;
    angle += angleStep;
    fill(px,py,depth1);
    vertex(px, py, depth1);
    px = x + cos(radians(angle)) * insideRadius;
    py = y + sin(radians(angle)) * insideRadius;
    fill(px,py,depth2);
    vertex(px, py, depth2); 
    angle += angleStep;
  }
  endShape();
  popMatrix();
}