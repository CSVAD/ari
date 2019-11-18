
import processing.pdf.*;

size(792, 612);

beginRecord(PDF, "plot.pdf"); 
noFill();
//write code for whatever geometry you want to plot here.
float[] yvalues = new float[40];
float[] yvalues_cos =  new float[40];
float period = 3;
float amplitude = 10;
float dx;
float prev_amplitude = 0;
for (int i=0; i < 4; i++) {
  period += 10;
  amplitude += 5;
  dx = (TWO_PI / period);
  //calcWaves(amplitude+prev_amplitude*2, amplitude, dx, i+3);
  float x = .2;
  float y = 1;
  for (int j = 0; j < yvalues.length; j++) {
    yvalues[j] = sin(x)*amplitude;
    yvalues_cos[j] = cos(y)*amplitude;
    x+=dx;
    y+=dx;
  }
  for (int j = 0; j < yvalues.length; j++) {
    if (j%2 == 0) {
      ellipse(map(j, 0, 50, 0, width), (amplitude+prev_amplitude*2)+yvalues[j], i+10*i, i+10*i);
      rect(map(j, 0, 50, 0, width), (amplitude+prev_amplitude*2)+yvalues_cos[j], i+10*i, i+10*i);
    }
  }

  prev_amplitude+= amplitude;
}

endRecord();