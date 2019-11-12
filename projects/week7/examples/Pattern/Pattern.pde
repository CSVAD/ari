import oscillatingPattern.library.*;

//create a oscillatingPattern object
OscillatingPattern oP;

void setup(){
  size(600,600);
  background(0);
  oP = new OscillatingPattern(this);
  
  //setup the pattern with (width, period, amplitude, size)
  oP.setPattern(width,10,10, 2);
}

void draw(){
  
  //draw the pattern with (height, period_change, amplitude_change, size_change)
  oP.drawWaves(height, 10, 10, 3);
}