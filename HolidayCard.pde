int numFlakes = 700;
Flake[] flakes = new Flake[numFlakes];
float angleRange = 0.1;

void setup() {
  size(800, 500);
  smooth();
  frameRate(80);

  for (int i = 0; i < numFlakes; i++)
  {
    int cX = int(random(width));
    int cY = int(random(height));
    float angle = random(100)/100.*angleRange+HALF_PI-angleRange/2;

    flakes[i] = new Flake(cX, cY, angle);
  }
}


void draw() {
  background(22, 26, 50);

  for (int i=0; i<numFlakes; i++)
  {
    flakes[i].run();
  }
}



class Flake
{
  int x, y;
  float angle;
  int flakeSize = int(random(2, 5));
  boolean ground;

  float inc = random(3, 6);

  Flake(int xin, int yin, float angleIn) {
    x = xin;
    y = yin;
    angle = angleIn;
  }

  void run() {
    x += inc*cos(angle);
    y += inc*sin(angle);

    angle += random(-100, 100)/10000.;

    if (y > height) {
      y = 0;
      x = int(random(width));
      angle = random(100)/100.*angleRange+HALF_PI-angleRange/2;
    }


    if (x>0) {
      fill(256, 256, 256);
      stroke(256, 256, 256);
      ellipse(x, y, flakeSize, flakeSize);
    }
    
    snowMan();
  }

  
 
void snowMan(){
rectMode(CENTER);
   
// body
stroke(0);
fill(250);
ellipse(150,160,100,100);
 
// head
fill(250);
ellipse(150,100,60,60);
 
// eyes
fill(0);
ellipse(142,92,5,5);
ellipse(158,92,5,5);
 
// nose
fill(255,200,0);
ellipse(150,102,7,7);
 
// arms
stroke(0);
line(200,150,210,130);
line(100,150,90,130);
 
// smile
fill(255);
stroke(0);
arc(150, 106, 30, 25, -TWO_PI, -PI);
 
// hat
fill(0);
rect(150,55,34,40);
line(125,75,175,75);
    }
  }

