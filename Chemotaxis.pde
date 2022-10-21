Walker[] walkers = new Walker[1000];
int targetX = 200;
int targetY = 200;
void setup() {
  size(400,400);
  colorMode(HSB);
  for(int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
  }
  noStroke();
}


void draw() {
  background(0);
  fill(255);
  for(int i = 0; i < walkers.length; i++) {
    walkers[i].show();
    walkers[i].walk();
  }
}

void mouseClicked() {
  targetX = mouseX;
  targetY = mouseY;
}

class Walker {
  int myX, myY;

  float distX, distY;
  Walker() {
    myX = (int)(Math.random()*400);
    myY = (int)(Math.random()*400);
  }
  void walk() {
    distX = dist(myX, myY, targetX, myY);
    distY = dist(myX, myY, myX, targetY);
    if (myX <= targetX){
      if((int)(Math.random()*370-200) < distX)
        myX += (int)(Math.random()*4-1);
      else
        myX += (int)(Math.random()*4-3);
    }
    if (myX > targetX){
      if((int)(Math.random()*370-200) < distX)
        myX += (int)(Math.random()*4-3);
      else
        myX += (int)(Math.random()*4-1);
    }
    if (myY <= targetY){
      if((int)(Math.random()*370-200) < distY)
        myY += (int)(Math.random()*4-1);
      else
        myY += (int)(Math.random()*4-3);
    }
    if (myY > targetY){
      if((int)(Math.random()*370-200) < distY)
        myY += (int)(Math.random()*4-3);
      else
        myY += (int)(Math.random()*4-1);
    }
    if(myX > targetX - 10 && myX < targetX + 10 && Math.random() < 0.01) 
      myX = (int)(Math.random()*500-(250-targetX));
    if(myY >  targetY - 10 && myY < targetY + 10 && Math.random() < 0.01)
      myY = (int)(Math.random()*500-(250-targetY));
    

  }
  
  void show() {
    fill(colorer());
    ellipse(myX, myY, 5, 5);
  }
  
  color colorer() {
    int h = 0;
    int s = 74;
    int b = 97;
    float distance = dist(myX, myY, targetX, targetY);
    float maxDist = dist(0,0,250,250);
    h = (int)map(distance, 10, maxDist, 0, 360);
    s = (int)map(distance, 0, maxDist, 74, 83);
    b = (int)map(distance, 0, maxDist, 97, 85);
    return color(h, s, b);
  }
}
