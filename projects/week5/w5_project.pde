import controlP5.*;
ControlP5 cp5;

import drawing.library.*;
import processing.pdf.*;

DrawingManager drawingManager;
DShape shape;

float distInterval = random(10, 100);
//variable to keep track of the distance 
//progressed while drawing. This will
//enable us to know when to start the next drip
float totalDist = 0;
//rate at which drips will progress down the canvas
float dripRate = 1;
ArrayList<DShape> drips = new ArrayList<DShape>();
float speed = 0;
Controller gaussian_, r_, g_, b_, toggle_;
int gaussian = 1, r, g, b;
int delta;
void setup() {
  size(1056, 816, P3D);
  background(255);

  drawingManager = new DrawingManager(this);
  cp5 = new ControlP5(this);

  gaussian_ = cp5.addSlider("gaussian")
    .setPosition(10, 10)
    .setRange(1, 20)
    .setColorCaptionLabel(0)
    ;
  r_ = cp5.addSlider("r")
    .setPosition(10, 30)
    .setRange(0, 255)
    .setColorCaptionLabel(0)
    ;
  g_ = cp5.addSlider("g")
    .setPosition(10, 50)
    .setRange(0, 255)
    .setColorCaptionLabel(0)
    ;
  b_ = cp5.addSlider("b")
    .setPosition(10, 70)
    .setRange(0, 255)
    .setColorCaptionLabel(0)
    ;
   cp5.addToggle("toggle")
     .setPosition(10,90)
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     ;
}

void draw() {
  //iterate backwards through the drip array list so we
  //don't encounter any issues when removing drips.
  for (int i=drips.size()-1; i>=0; i--) {
    DShape drip = drips.get(i);

    //increase the delta of the drip on the y axis by
    // the interval specified in the dripRate variable
    drip.addDelta(delta, randomGaussian()*gaussian);

    //stop the drip by removing it from the array list 
    // when it is of the bottom of the canvas.
    if (drip.position.y>=height || drip.position.y< 0) {
      drips.remove(i);
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    drawingManager.savePDF();
  }
  if (key == 'c') {
    drawingManager.clear();
  }
  //stop drips when s is pressed
  if (key == 's') {
    drips.clear();
  }
}

void mousePressed() {
  totalDist = 0;
  shape = drawingManager.addShape();
}

void mouseDragged() {
  drawingManager.stroke(0, 0, 0);
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  shape.addVertex(mouseX, mouseY);
  PVector v = new PVector(mouseX-pmouseX, mouseY-pmouseY);
  totalDist += v.mag();
  //condition to check if total distance is 
  // greater than the distance interval
  if (totalDist>=distInterval) {
    //reset the total dist
    totalDist = 0;
    //calculate a new random distance interval
    distInterval = random(10, 100);
    //create a new dshape object for the new drip
    // add a vertex at the current mouse position 
    //add it to the drip array list.
    DShape drip = drawingManager.addShape();
    drawingManager.stroke(int(random(255)), int(random(255)), int(random(255)), int(map(int(abs(mouseX-pmouseX)), 1, 100, 1, 255)));

    drip.addVertex(mouseX, mouseY);
    drawingManager.strokeWeight(map(totalDist, 1, 100, 2, 20));
    //drawingManager.stroke(255,0,0,int(map(int(abs(mouseX-pmouseX)), 1,100, 255,10)));
    drips.add(drip);
  }
}

void variableEllipse(int x, int y, int px, int py) {
  speed = abs(x-px) + abs(y-py);
  drawingManager.stroke(int(random(r)), int(random(g)), int(random(b)), int(map(totalDist, 1, 100, 1, 255)));
  //if (int((random(0, 2))) == 0)
    drawingManager.ellipse(x, y, speed, speed);
  //else {
  //  drawingManager.rect(x, y, speed, speed);
  //}
}

void toggle(boolean theFlag) {
  if(theFlag==true) {
    delta = 0;
  } else {
    delta = 1;
  }
}