PImage gameover;

int state=0;

Boolean start=false;
Boolean restart=false;

Laser shot;

void setup() {
  size(500, 900);
  frameRate(60);
  lasers=new ArrayList();
}

void draw() {
  background(0);
  counter();
  ship();
  gameState();
  removeToLimit(100);
  allLasers();
  scoreBoard();
  println(lasers.size());
}

void keyPressed() {
  startGame();
  restartGame();
}

void mousePressed() {
  shot=new Laser(mouseX, mouseY);
  lasers.add(shot);
  //println(lasers.size());
}

void ship() {
  int sxOff=15;
  int syOff=30;
  int sx1=mouseX-sxOff;
  int sy1=mouseY+syOff;
  int sx2=mouseX;
  int sy2=mouseY;
  int sx3=mouseX+sxOff;
  int sy3=mouseY+syOff;

  fill(0);
  stroke(0, 255, 0);
  strokeWeight(3);
  triangle(sx1, sy1, sx2, sy2, sx3, sy3);

  stroke(0);
  strokeWeight(5);
  line(sx1, sy1, sx3, sy3);
  noCursor();

  stroke(0, 255, 0);
  strokeWeight(3);
}

void counter() {
  int i;

  for (i=0; i<1000; i++) {
    //println(s);
    if (i==999) {
      s=s+.001;
    }
  }
}

void scoreBoard() {
  int x=50;
  int y=10;
  int l=400;
  int w=100;

  noStroke();
  stroke(0, 255, 0);
  strokeWeight(5);

  fill(0);
  rect(x, y, l, w);

  fill(0, 255, 0);
  textSize(24);
  textAlign(CENTER);
  text("SCORE: "+q, width/2, w*3/5);

  fill(0, 255, 0);
  textSize(12);
  textAlign(CENTER);
  text("TIME: "+int(s*15), width/2, w*4/5);
}

void gameState() {
  int x=50;
  int y=350;
  int l=400;
  int w=200;

  switch(state) {
  case 0:
    setup();
    fill(0, 255, 0);
    textSize(18);
    textAlign(CENTER);
    text("PRESS SPACE TO START", width/2, height/2+(w*2/5));

    start=true;
    restart=false;
    s=0;
    q=0;

    y1=0;
    x1=random(0, 500);
    rad1=random(15, 40);

    y2=0;
    x2=random(0, 500);
    rad2=random(15, 40);

    y3=0;
    x3=random(0, 500);
    rad3=random(15, 34);

    y4=0;
    x4=random(0, 500);
    rad4=random(15, 40);

    y5=0;
    x5=random(0, 500);
    rad5=random(15, 40);

    y6=0;
    x6=random(0, 500);
    rad6=random(15, 40);

    y7=0;
    x7=random(0, 500);
    rad7=random(15, 40);
    break;

  case 1:
    start=false;
    
    if (int(s*15)<1) {
      stroke(0, 255, 0);
      strokeWeight(5);
      fill(0);
      rect(x, y, l, w/2);

      fill(0, 255, 0);
      textSize(32);
      textAlign(CENTER);
      text("^ S T E R ○ I D", width/2, y+60);

      pushMatrix();
      fill(0, 255, 0);
      textSize(10);
      translate(x-5, y+52);
      rotate(3*PI/2);
      text("By Bohdan Tkachenko", 0, 0);
      popMatrix();
    } else {
      state=2;
    }
    break;

  case 2:
    asteroidAll();
    break;

  case 3:
    restart=true;
    
    stroke(0, 255, 0);
    strokeWeight(10);
    fill(0);
    rect(x, y, l, w);

    gameover=loadImage("Gameover.png");
    image(gameover, x, y, l, w);

    fill(0, 255, 0);
    textSize(18);
    textAlign(CENTER);
    text("PRESS R TO RESTART", width/2, height/2+(w*2/5));

    noFill();
    noStroke();
    noLoop();
    //break;

  case 4:
    loop();
    break;
  }
}

void startGame() {
  if (start==true&&key==' ') {
    state=1;
  }
}

void restartGame() {
  if (restart==true&&key=='r'||key=='R') {
    state=0;
  }
}

float x1=random(0, 500);
float y1=0;
float rad1= random(15, 40);

float x2=random(0, 500);
float y2=0;
float rad2= random(15, 40);

float x3=random(0, 500);
float y3=0;
float rad3= random(15, 40);

float x4=random(0, 500);
float y4=0;
float rad4= random(15, 34);

float x5=random(0, 500);
float y5=0;
float rad5= random(15, 40);

float x6=random(0, 500);
float y6=0;
float rad6= random(15, 40);

float x7=random(0, 500);
float y7=0;
float rad7= random(15, 40);

float s=0;

void asteroid1() {
  int xOff=15;
  int yOff=30;
  
  ellipse(x1, y1, rad1*2, rad1*2);
  y1+=3+s;
  
  if (y1>900) {
    y1=0;
    x1=random(0, 500);
    rad1=random(15, 40);
  }
  
  if (dist(mouseX, mouseY, x1, y1)<rad1) {
    state=3;
  }
  if (dist(mouseX-xOff, mouseY+yOff, x1, y1)<rad1) {
    state=3;
  }
  if (dist(mouseX+xOff, mouseY+yOff, x1, y1)<rad1) {
    state=3;
  }
}

void asteroid2() {
  int xOff=15;
  int yOff=30;
  
  ellipse(x2, y2, rad2*2, rad2*2);
  y2+=4+s;
  
  if (y2>900) {
    y2=0;
    x2=random(0, 500);
    rad2=random(15, 40);
  }
  
  if (dist(mouseX, mouseY, x2, y2)<rad2) {
    state=3;
  }
  if (dist(mouseX-xOff, mouseY+yOff, x2, y2)<rad2) {
    state=3;
  }
  if (dist(mouseX+xOff, mouseY+yOff, x2, y2)<rad2) {
    state=3;
  }
}

void asteroid3() {
  int xOff=15;
  int yOff=30;
  
  ellipse(x3, y3, rad3*2, rad3*2);
  y3+=5+s;
  
  if (y3>900) {
    y3=0;
    x3=random(0, 500);
    rad3=random(15, 34);
  }
  
  if (dist(mouseX, mouseY, x3, y3)<rad3) {
    state=3;
  }
  if (dist(mouseX-xOff, mouseY+yOff, x3, y3)<rad3) {
    state=3;
  }
  if (dist(mouseX+xOff, mouseY+yOff, x3, y3)<rad3) {
    state=3;
  }
}

void asteroid4() {
  int xOff=15;
  int yOff=30;
  
  ellipse(x4, y4, rad4*2, rad4*2);
  y4+=6+s;
  
  if (y4>900) {
    y4=0;
    x4=random(0, 500);
    rad4=random(15, 40);
  }
  
  if (dist(mouseX, mouseY, x4, y4)<rad4) {
    state=3;
  }
  if (dist(mouseX-xOff, mouseY+yOff, x4, y4)<rad4) {
    state=3;
  }
  if (dist(mouseX+xOff, mouseY+yOff, x4, y4)<rad4) {
    state=3;
  }
}

void asteroid5() {
  int xOff=15;
  int yOff=30;
  
  ellipse(x5, y5, rad5*2, rad5*2);
  y5+=7+s;
  
  if (y5>900) {
    y5=0;
    x5=random(0, 500);
    rad5=random(15, 40);
  }
  
  if (dist(mouseX, mouseY, x5, y5)<rad5) {
    state=3;
  }
  if (dist(mouseX-xOff, mouseY+yOff, x5, y5)<rad5) {
    state=3;
  }
  if (dist(mouseX+xOff, mouseY+yOff, x5, y5)<rad5) {
    state=3;
  }
}

void asteroid6() {
  int xOff=15;
  int yOff=30;
  
  ellipse(x6, y6, rad6*2, rad6*2);
  y6+=8+s;
  
  if (y6>900) {
    y6=0;
    x6=random(0, 500);
    rad6=random(15, 40);
  }
  
  if (dist(mouseX, mouseY, x6, y6)<rad6) {
    state=3;
  }
  if (dist(mouseX-xOff, mouseY+yOff, x6, y6)<rad6) {
    state=3;
  }
  if (dist(mouseX+xOff, mouseY+yOff, x6, y6)<rad6) {
    state=3;
  }
}

void asteroid7() {
  int xOff=15;
  int yOff=30;
  
  ellipse(x7, y7, rad7*2, rad7*2);
  y7+=9+s;
  
  if (y7>900) {
    y7=0;
    x7=random(0, 500);
    rad7=random(15, 40);
  }
  
  if (dist(mouseX, mouseY, x7, y7)<rad7) {
    state=3;
  }
  if (dist(mouseX-xOff, mouseY+yOff, x7, y7)<rad7) {
    state=3;
  }
  if (dist(mouseX+xOff, mouseY+yOff, x7, y7)<rad7) {
    state=3;
  }
}

void asteroidAll() {
  asteroid1();
  asteroid2();
  asteroid3();
  asteroid4();
  asteroid5();
  asteroid6();
  asteroid7();
}

ArrayList<Laser>lasers;

int q=0;

class Laser {
  float x;
  float y;
  
  private PApplet canvas;

  Laser(float xx, float yy) {
    x=xx;
    y=yy;
  }

  void display() {
    strokeWeight(5);
    stroke(255, 0, 0);
    point(x, y);
    noStroke();
  }
  void move() {
    y-=10;
  }
  void hit() {
    if (dist(x, y, x1, y1)<rad1) {
      //println("hit1");
      q=q+5;
      x=-100;
      y=-100;
      y1=0;
      x1=random(0, 500);
      rad1=random(15, 40);
    }

    if (dist(x, y, x2, y2)<rad2) {
      //println("hit2");
      q=q+5;
      x=-100;
      y=-100;
      y2=0;
      x2=random(0, 500);
      rad2=random(15, 40);
    }

    if (dist(x, y, x3, y3)<rad3) {
      //println("hit3");
      q=q+5;
      x=-100;
      y=-100;
      y3=0;
      x3=random(0, 500);
      rad3=random(15, 40);
    }

    if (dist(x, y, x4, y4)<rad4) {
      //println("hit4");
      q=q+5;
      x=-100;
      y=-100;
      y4=0;
      x4=random(0, 500);
      rad4=random(15, 40);
    }

    if (dist(x, y, x5, y5)<rad5) {
      //println("hit5");
      q=q+5;
      x=-100;
      y=-100;
      y5=0;
      x5=random(0, 500);
      rad5=random(15, 40);
    }

    if (dist(x, y, x6, y6)<rad6) {
      //println("hit6");
      q=q+5;
      x=-100;
      y=-100;
      y6=0;
      x6=random(0, 500);
      rad6=random(15, 40);
    }

    if (dist(x, y, x7, y7)<rad7) {
      //println("hit7");
      q=q+5;
      x=-100;
      y=-100;
      y7=0;
      x7=random(0, 500);
      rad7=random(15, 40);
    }
  }
}

void allLasers() {
  for (int i=0; i<lasers.size(); i++) {
    shot=lasers.get(i);
    shot.display();
    shot.move();
    shot.hit();
    //println(i);
  }
}

void removeToLimit(int maxLength) {
  while (lasers.size()>maxLength) {
    lasers.remove(0);
  }
}