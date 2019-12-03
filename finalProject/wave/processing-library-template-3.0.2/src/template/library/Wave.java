package template.library;


import processing.core.*;
import processing.sound.*;
import java.awt.Color;
import java.util.ArrayList;

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

public class Wave {
	
	// myParent is a reference to the parent sketch
	PApplet myParent;
	float amplitude;
	float period;
	int spacing = 10;
	int width;
	float theta = (float) 0.0;
	float rotation = (float) 0.0;
	PVector location = new PVector(0,0); 
	float dx;
	float[] yvalues;
	int r;
	int g;
	int b;
	int stroke_weight = 10;
	String type = "";
	public SinOsc sine;
	boolean sound = false;
	int count = 0;
	
	
	public final static String VERSION = "1.0.0";
	

	/**
	 * a Constructor, usually called in the setup() method in your sketch to
	 * initialize and start the Library.
	 * 
	 * @example Hello
	 * @param theParent
	 * @param theSine
	 */
	public Wave(PApplet theParent) {
		myParent = theParent;
		sine = new SinOsc(theParent);
	}
	
	public void setUpWave(float _amplitude, float _period, int _width) {
		amplitude = _amplitude;
		period = _period;
		width = _width;
	}
	
	public void drawWaves() {
			yvalues = new float[width/spacing];
			dx = (myParent.TWO_PI / period) * spacing;
			theta += 0.02;
			
			float x = theta;
			for(int i = 0; i < yvalues.length; i++) {
				yvalues[i] = myParent.sin(x)*amplitude;
				x+=dx;
			}
			renderWave();
	}
	
	public void renderWave() {
//	    myParent.noStroke();
//	    myParent.fill(0, 20);
//	    myParent.rect(0, 0, myParent.width, myParent.height);
	    myParent.pushMatrix();
	    PShape shape;
	    myParent.noFill();
	    shape = myParent.createShape();
	    if(type.equals("")) {
	    	shape.beginShape();
	    }
	    else if(type.equals("points")) {
	    	shape.beginShape(shape.POINTS);
	    }
	    shape.translate(location.x, location.y);
	    shape.rotate(myParent.degrees(rotation));
	    shape.strokeWeight(stroke_weight);
	    shape.stroke(myParent.color(r,g,b));
	    for (int x = 0; x < yvalues.length; x++) {
//	    	shape.stroke(myParent.map(x*spacing, 0,  yvalues[x], 255, 0));
	      
	    	shape.vertex(x*spacing, yvalues[x]);
	    	if(sound) {
	    		sine.amp(yvalues[x]/amplitude);
	            sine.freq(x*spacing);
	    	}
	    }
	    shape.endShape();
	    myParent.shape(shape);
	    myParent.popMatrix();
	}
	
	public void spacing(int _spacing) {
		spacing = _spacing;
	}
	
	public void rotate(int _rotation) {
		rotation = _rotation;
	}
	
	public void translate(PVector _location) {
		location = _location;
	}
	
	public void stroke(int _r, int _g, int _b) {
		r = _r;
		g = _g;
		b = _b;
	}
	public void strokeWeight(int _stroke_weight) {
		stroke_weight = _stroke_weight;
	}
	public void type(String _type) {
		type = _type;
	}
	public void sound() {
		sound = true;
		sine.play();
	}
}
	
	
	
	
	
	
