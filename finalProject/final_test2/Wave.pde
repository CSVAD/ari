class Wave {
  int xspacing = 16;   // How far apart should each horizontal location be spaced
  int w;              // Width of entire wave
  float theta = 0.0;  // Start angle at 0
  float amplitude = 75.0;  // Height of wave
  float period = 500.0;  // How many pixels before the wave repeats
  float dx;  // Value for incrementing X, a function of period and xspacing
  float[] yvalues;  // Using an array to store height values for thesine
  float rotation;
  PVector location;
  String type;
  Wave (int xspacing, int w, float theta, float amplitude, float period, float rotation, PVector location, String type) {
    this.xspacing = xspacing;
    this.w = w;
    this.theta = theta;
    this.amplitude = amplitude;
    this.period = period;
    this.dx = (TWO_PI / period) * xspacing;
    this.yvalues = new float[w/xspacing];
    this.rotation = rotation;
    this.location = location;
    this.type = type;
  }

  void calcWave() {
    // Increment theta (try different values for 'angular velocity' here
    theta += 0.02;

    // For every x value, calculate a y value with sine function
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = sin(x)*amplitude;
      x+=dx;
    }
  }

  void renderWave() {
    noStroke();
    fill(0, 20);
    rect(0, 0, width, height);
    pushMatrix();
    PShape shape;
    noFill();
    shape = createShape();
    if (type.equals("")) {
      shape.beginShape();
    }
    else if (type.equals("POINTS")) {
      shape.beginShape(POINTS);
    }
    shape.translate(location.x, location.y);
    shape.rotate(radians(rotation));
    shape.stroke(255);
    shape.strokeWeight(10);
    sine.play();
    saw.play();
    for (int x = 0; x < yvalues.length; x++) {
      if (amplitude >50) {
        sine.amp(yvalues[x]/amplitude);
        sine.freq(x*xspacing);
      } else {
        saw.amp(yvalues[x]/amplitude);
        saw.freq(x*xspacing);
      }
      shape.vertex(x*xspacing, yvalues[x]);
    }
    shape.endShape();
    shape(shape);
    popMatrix();
  }
}