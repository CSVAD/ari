package oscillatingPattern.library;


import processing.core.*;
import java.lang.Math.*;

/**
 * This is a template class and can be used to start a new processing Library.
 * Make sure you rename this class as well as the name of the example package 'template' 
 * to your own Library naming convention.
 * 
 * (the tag example followed by the name of an example included in folder 'examples' will
 * automatically include the example in the javadoc.)
 *
 * @example Hello 
 */

public class OscillatingPattern {
	
	// myParent is a reference to the parent sketch
	PApplet myParent;
	
	float[] yvalues;
	float[] yvalues_cos;
	int period_change = 0;
	int amplitude_change = 0;
	int w;
	int prev_amplitude = 0;
	int p;
	int a;
	int p_;
	int a_;
	float dx;
	int h;
	int s;
	int s_;

	
	public final static String VERSION = "##library.prettyVersion##";
	

	/**
	 * a Constructor, usually called in the setup() method in your sketch to
	 * initialize and start the Library.
	 * 
	 * @example Hello
	 * @param theParent the parent PApplet
	 */
	public OscillatingPattern(PApplet theParent) {
		myParent = theParent;
		welcome();
	}
	
	
	private void welcome() {
		System.out.println("##library.name## ##library.prettyVersion## by ##author##");
	}
	
	public void setPattern(int width, int period, int amplitude, int size) {
//	public void setPattern() {
		w = width;
		yvalues = new float[width];
		yvalues_cos = new float[width];	
		p = period;
		a = amplitude;
		s = size;
		p_ = p;
		a_ = a;	
		s_ = s;
	}
	
	public void drawWaves(int height, int period_change, int amplitude_change, int size_change) {
		h = height;
		if(prev_amplitude > height) {
			p = p_;
			a = a_;
			s = s_;
		}
		p += period_change;
		a += amplitude_change;
		dx = myParent.TWO_PI/p;
		calcWaves(s);
		s += size_change;
		prev_amplitude += a;
		

	}
	
	private void calcWaves(int size) {
		  
		  float x = (float)0.02;
		  float y = 1;
		  for (int j = 1; j < yvalues.length+1; j++) {
		    float h = a+prev_amplitude*2;
		    float y_sin = myParent.sin(x)*a;
		    float y_cos = myParent.cos(y)*a;
		    myParent.fill(255);
		    myParent.ellipse(j-1, h+y_sin, size, size);
		    myParent.ellipse(j-1, h+y_cos, size, size);
		    x+=dx;
		    y+=dx;
		  }
	}
	
	public void animate(int height) {
		  if (prev_amplitude > height) {
			    myParent.fill(0, 100);
			    myParent.rect(0, 0, w, height);
			    p = p_;
			    a = a_;
			    prev_amplitude = 0;
			    s = s_;
			    ;
			  }
		  myParent.delay(100);
	}
	
	

}

