class shape {
  shape(float transx, float transy, int rad, float n, float red, float green, float blue) {
    //translate(0,0);
    translate(transx, transy);
    stroke(255);
    strokeWeight(10);
    noFill();
    beginShape();
    float noiseMax = n;
    for (float a = 0; a < TWO_PI; a += radians(1)) {
      float xoff = map(cos(a + phase), -1, 1, 0, noiseMax);
      float yoff = map(sin(a + phase), -1, 1, 0, noiseMax);
      float r = map(noise(xoff, yoff, zoff), 0, 1, rad-100, rad);
      float x = r * cos(a);
      float y = r * sin(a);
      vertex(x, y);
      stroke(map(transx,0, width, 0, red),map(transy,0, width, 0, green),blue);
      //println(red,green,blue);
      //stroke(map(transx,0, width, 0, red),0,0);
      strokeWeight(1);
    }
    endShape(CLOSE);
    phase += 0.003;
    zoff += 0.01;
    translate(-transx, -transy);
  }
}