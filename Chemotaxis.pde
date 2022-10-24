Walker w = new Walker();
Walker[] walkers = new Walker[1000];
int targetX = 200;
int targetY = 200;
void setup() {
  size(400,400);
  colorMode(HSB, 360, 150, 150);
  for(int i = 0; i < walkers.length; i++) {
    walkers[i] = new Walker();
  }
  noStroke();
}


void draw() {
  background(0, 0, 0);
  for(int i = 0; i < walkers.length; i++) {
    walkers[i].walk();
    walkers[i].show();
  }
}

void mouseClicked() {
  targetX = mouseX;
  targetY = mouseY;
}

class Walker {
  int myX, myY, h, s, b;
  float distX, distY;
  Walker() {
    myX = (int)(Math.random()*400);
    myY = (int)(Math.random()*400);
    h = 0;
    s = 74;
    b = 97;
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
    float distance = dist(myX, myY, targetX, targetY);
    float maxDist = dist(0,0,300,300);
    h = (int)map(distance, 10, maxDist, 0, 360);
    s = (int)map(distance, 0, maxDist, 74, 83);
    b = (int)map(distance, 0, maxDist, 97, 85);
    if(distance > maxDist) {
      h = 360;
      s = 83;
      b = 85;
    }
    return color(h, s, b);
  }
}
