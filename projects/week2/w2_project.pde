int xspacing = 1;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 3;  // Height of wave
float period = 20;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
float[] yvalues_cos;

void setup() {
  size(600,600);
  //colorMode(HSB);
  background(0);
  w = width+16;
  
  yvalues = new float[w/xspacing];
  yvalues_cos = new float[w/xspacing];
  float prev_amplitude = 0;

  for(int i =0; i < 20; i++){
    period += 10;
    amplitude += 5;
    dx = (TWO_PI / period) * xspacing;
    calcWaves(amplitude+prev_amplitude*2, amplitude, dx, i+3);
    prev_amplitude+= amplitude;
  }
}

void draw() {
}

void calcWaves(float h, float amplitude, float dx, int size){
  float x = .02;
  float y = 1;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    yvalues_cos[i] = cos(y)*amplitude;
    x+=dx;
    y+=dx;
  }
  
  noStroke();
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  float min = min(yvalues);
  float max = max(yvalues);
  for (int i = 0; i < yvalues.length; i++) {
    fill(130,map(i, 0, yvalues.length, 0,255),map(yvalues[i], min, max, 0, 360));
    ellipse(i*xspacing, h+yvalues[i], size, size);
    fill(130,map(i, 0, yvalues.length, 0,255),map(yvalues[i], min, max, 0, 360));
    ellipse(i*xspacing, h+yvalues_cos[i], size, size);
  }
}