
Wave s, s2;
ArrayList <PShape> shapes = new ArrayList();
  
import processing.sound.*;
SinOsc sine;
SawOsc saw;


void setup() {
  size(640, 360, P2D);
  //fullScreen(P2D);
  sine = new SinOsc(this);
  saw = new SawOsc(this);
  s2 = new Wave(1, width+16, 0.0, 40, 80, 0, new PVector(0, height/2),"");
  s = new Wave(100, width+16, 0.0, 75, 500, 0, new PVector(0, height/2), "");

}

void draw() {
  s.calcWave();
  s.renderWave();
  s2.calcWave();
  s2.renderWave();
}