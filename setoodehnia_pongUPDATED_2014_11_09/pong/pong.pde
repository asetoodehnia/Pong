float x=220;
float y=220;
float dx=random(7, 10);
float dy=random(7, 10);
float paddleX;
float paddlex;
float paddleY=10;
float paddleH=100;
int score1=0;
int score2=0;

void setup() {
  size(800, 500);
  textSize(30);
  paddleX = 15;
  paddlex = width-25;
}

void draw() {
  noStroke();
  background(255);

  //paddles
  fill(#FF0000);
  rect(paddleX, paddleY, 10, paddleH);
  fill(#0017FF);
  rect(paddlex, mouseY, 10, paddleH);

  //ball
  fill(0);
  ellipse(x, y, 20, 20);

  //movement of paddles
  if (keyPressed) {
    if (key == 'w') {
      paddleY = paddleY - 10;
    }
    if (key == 's') {
      paddleY = paddleY + 10;
    }
  }

  //bouncing of the ball when touching the paddle
  if ((x<paddleX+20) && (y>=paddleY) && (y<=paddleY + paddleH)) {
    dx = abs(dx);
  }

  if ((x>paddlex-10) && (y>=mouseY) && (y<=mouseY + paddleH)) {
    dx = -abs(dx);
  }

  x=x+dx;

  //bouncing of the ball when touching the screen
  if (y>height-10) {
    dy=-dy;
  }

  if (y<10) {
    dy=-dy;
  }
  y=y+dy;

  //score keeping
  text(score1, width/4, height/2);
  text(score2, 3*width/4, height/2);

  if (x<10) {
    score2=score2+1;
  }

  if (x>width-10) {
    score1=score1+1;
  }

  //reset the position of the ball if it goes out 
  if (x<10 || x>width-10) {
    x=400;
    y=250;
    dx=0;
    dy=0;
  }

  //Resume game after point scored
  if (mousePressed) {
    dx=random(7, 10);
    dy=random(7, 10);
  }

  //if the keyboard wins
  if (score1==10) {
    textAlign(CENTER);
    textSize(50);
    text("KEYBOARD WINS!", width/2, 3*height/4);
    if (mousePressed) {
      score1=0;
      x=400;
      y=250;
      dx=random(7, 10);
      dy=random(7, 10);
    }
  }

  //if the mouse wins
  if (score2==10) {
    textAlign(CENTER);
    textSize(50);
    text("MOUSE WINS!", width/2, 3*height/4);
    if (mousePressed) {
      score2=0;
      x=400;
      y=250;
      dx=random(7, 10);
      dy=random(7, 10);
    }
  }
}

