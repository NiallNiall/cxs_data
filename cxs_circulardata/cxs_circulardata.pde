import processing.pdf.*;

boolean drawToPDF = false;

void setup() {
  size(800, 800);
  if (drawToPDF) {
    size(800, 800, PDF, "data.pdf");
  } else {
  }
}

void draw() {
  background(0);
  //noFill();
  //stroke(250);
  smooth();

  //float fullrot = PI;
  //float inc = 1.5;


  //float deg = 45.0;
  //float rad = radians(deg);
  float inc = 45;


  float[][] data = {{6, 18}, {18, 22}, {12, 32}, {7, 18}, {24, 48}};

  float startPoint = 0;
  for (int i = 0; i < data.length; i++) {
    float thisData = data[i][0];
    float thisGrowth = data[i][1];
    drawArc(startPoint, thisData, thisGrowth);
    startPoint += thisData;
  }

  if (drawToPDF) {
    exit();
  } else {
  }
}


void drawArc(float startInc, float endInc, float size) {

  float innerrad = 200;
  float outerrad = innerrad + (size*5);
  float startrot = radians(startInc);
  float endrot = radians(endInc);

  float clr = map(size,18,48,0,250);

  fill(clr,clr,180);
  //arc(width/2, height/2, innerrad, innerrad, startrot, startrot+endrot);
  arc(width/2, height/2, outerrad, outerrad, startrot, startrot+endrot);

  //drawArcMan(outerrad, startInc, endInc);
}

void drawArcMan(float rad, float startRot, float endRot) {

   noStroke();
   fill(250);
  
  float cx = width/2;
  float cy = height/2;
  float thisRad = rad/2;

  for (float i=startRot; i<endRot; i+=1) {
    float angle = i * TWO_PI / 360;
    float x = cx + cos(angle) * thisRad;
    float y = cy + sin(angle) * thisRad;
    ellipse(x, y, 5, 5);
  }
}