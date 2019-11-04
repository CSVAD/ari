int dim;
float h = 90;
float s = 90;
float b = 90;
boolean linear = false;

import controlP5.*;
ControlP5 cp5;
void setup() {
  size(600, 600);
  dim = width/2;
  background(0);
  colorMode(HSB, 360, 255, 255);
  noStroke();
  ellipseMode(RADIUS); 
  frameRate(1);
  background(0);

  cp5 = new ControlP5(this);
  cp5.addToggle("linear")
    .setPosition(10, 55)
    .setCaptionLabel("radial/linear")
    .setMode(ControlP5.SWITCH)

    ;

  drawGradient( h, s, b);
  display();
}

void draw() {
}

void display() {
    fill(0);
  rect(0,0, 280,50);
  stroke(255);
  fill(255);
  text("h: " + round(h) + " press h and drag mouse in x direction", 10, 10);
  text("s: " + round(s)+ " press s and drag mouse in y direction", 10, 25);
  text("b: " + round(b)+ " press b and scroll up/down", 10, 40);

}

void mouseDragged() {
  if (keyPressed && key == 'h') {
    if (abs(mouseX-pmouseX) > 0) {
      h = map(abs(mouseX-pmouseX), 0, 300, 0, 360);
      drawGradient(h, s, b);
    }
  }
  if (keyPressed && key == 's') {
    if (abs(mouseY-pmouseY) > 0) {
      s = map(abs(mouseY-pmouseY), 0, 300, 0, 255);
      drawGradient(h, s, b);
    }
  }
}

void mouseWheel(MouseEvent event) {
  if (keyPressed && key == 'b') {
    println(event.getCount());
    b = map(event.getCount(), -25, 25, 0, 255);    
    drawGradient(h, s, b);
  }
}

void drawGradient(float h, float s, float b) {
  background(0);
  if (linear) {

    int radius = dim;
    println(h, s, b);
    for (int r = radius; r > 0; --r) {
      colorMode(HSB);
      noStroke();
      fill(h, s, b);
      ellipse(width/2, height/2, r, r);
      h = (h + .5) ;
    }
  } else {

    for (int i = height/2-dim; i <= height/2+dim; i++) {
      float inter = map(i, height/2-dim, height/2+dim, 0, 1);
      color c = lerpColor(color( h, s, b), color( h-100, s, b), inter);
      colorMode(HSB);
      stroke(c);
      line(width/2-dim, i, width/2+dim, i);
    }
  }
  display();
}

void linear(boolean theFlag) {
  linear = theFlag;
  drawGradient(h, s, b);
  println(theFlag);
}