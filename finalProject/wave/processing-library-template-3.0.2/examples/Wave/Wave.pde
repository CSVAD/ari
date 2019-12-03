import template.library.*;

Wave w;
int count = 0;
ArrayList<Wave> w_array;

void setup() {
  size(600, 600, P2D);
  w_array = new ArrayList<Wave>();
  for(int i =0; i < 3; i++){
    w = new Wave(this);
    w.setUpWave(75, random(100,500), width);
    w.translate(new PVector(0, i*50));
    w.spacing(int(random(10,100)));
    w.strokeWeight(1);
    w_array.add(w);
  }
}
 
void draw() {
  noStroke();
  fill(0,20);
  rect(0,0,width,height);
  for(Wave w: w_array){

    w.stroke(255,0,0);
    w.drawWaves();
    w.sound();
  }
}