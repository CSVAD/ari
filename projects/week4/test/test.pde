float phase = 0;
float zoff = 0;
int count = 10;

import controlP5.*;
ControlP5 cp5;

Controller amount, radius, alpha, zChange, phaseChange, noise, red_, green_, blue_;
int alphavalue = 30;
float noise_amount = 1.5;
int circle_amount = 1;
int r  = 1;
float red, green, blue;


ArrayList<shape> particles = new ArrayList<shape>();
IntList transx, transy; 
void setup() {
  size(800, 800, P3D);
  //fullScreen();
  transx = new IntList();
  transy = new IntList();
  transx.append(int(random(0, width)));
  transy.append(int(random(0, height)));

  cp5 = new ControlP5(this);

  amount = cp5.addSlider("circle_amount")
    .setPosition(10, 10)
    .setRange(1, 100)
    .setColorCaptionLabel(0)
  ;

  radius = cp5.addSlider("r")
    .setPosition(10, 30)
    .setRange(1, height/2)
    .setColorCaptionLabel(0)
  ;
    alpha = cp5.addSlider("alphavalue")
    .setPosition(10, 130)
    .setRange(1, 255)
    .setColorCaptionLabel(0)
  ;

  noise = cp5.addSlider("noise_amount")
    .setPosition(10, 50)
    .setRange(0.0, 5.0)
    .setColorCaptionLabel(0)
  ;
  red_ = cp5.addSlider("red")
    .setPosition(10, 70)
    .setRange(0, 255)
    .setColorCaptionLabel(0)
  ;
  green_ = cp5.addSlider("green")
    .setPosition(10, 90)
    .setRange(0, 255)
    .setColorCaptionLabel(0)
  ;
  blue_ = cp5.addSlider("blue")
    .setPosition(10, 110)
    .setRange(0, 255)
    .setColorCaptionLabel(0)
  ;
}

void draw() {
  //background(0);

  fill(255, alphavalue);
  noStroke();
  rect(0, 0, width, height);
//println(red_.getValue(),green,blue);
  for (int i =0; i < circle_amount; i++) {
    if ( i >= transx.size()) {
      transx.append(int(random(0, width)));
      transy.append(int(random(0, height)));
    }
    shape s = new shape(transx.get(i), transy.get(i), r, noise_amount, red_.getValue(), green_.getValue(),blue_.getValue());
    if (i >= particles.size()) {
      particles.add(s);
    }
  }
  for (int i = 0; i < particles.size(); i++) {
    particles.get(i);
  }
}