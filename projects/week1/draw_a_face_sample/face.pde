background(0,0,0);
size(600,600);

//face
fill(255,0,255);
quad(width/2-300, height/2-100, width/2-240, height/2+200, width/2+200, height/2+300, width/2+240, height/2-200);

//eyes
fill(255,255,255);
strokeWeight(4);
ellipse(400, 250, 80, 80);
strokeWeight(2);
arc(200, 250, 80, 80, 0, PI+QUARTER_PI, PIE);

//nose
triangle(280, 400, 310, 200, 250, 400);

//mouth
rect(width/2-100, height-150, 200, 25, 50,2, 12, 0);

//hair
strokeWeight(100);
stroke(255,255,0,100);
point(0,200);
point(50,180);
point(90,150);
point(130,180);
point(160,165);
point(220,150);
point(300, 145);
point(350, 145);
point(390, 130);
point(420, 90);
point(480, 110);
point(540,90);