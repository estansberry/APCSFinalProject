ArrayList<Asteroid> asteroids;
ArrayList<Ship> enemies;
Frog user;
ArrayList<FBullet> frogBullets;
ArrayList<SBullet> enemyBullets;

public void setup(){
  size(1000,1000);
  background(0);
  PImage stars = loadImage("stars.png");
  stars.resize(width, height);
  image(stars, 0, 0);
  //fill(225);
  //int starcount = 0;
  //while(starcount < 1000){
  //  Double i = Double.valueOf(1000*Math.random());
  //  Double j = Double.valueOf(1000*Math.random());
  //  ellipse(i.floatValue(), j.floatValue(), 5, 5);
  //  starcount++;
  //}
  user = new Frog(10,10);
  user.display();
}
  
public void run(){
  
}

public void draw(){
  PImage stars = loadImage("stars.png");
  stars.resize(width, height);
  image(stars, 0, 0);
  user.display();
  fill(255);
  textSize(20);
  text("x: " + user.getx() + "\ny: " + user.gety(),0,20);
}

public void keyPressed(){
  if(keyPressed){
   if(key == ' '){
     user.shoot();
   }
   if(key == CODED){
    if(keyCode == UP){
     user.moveUp(); 
    }
    if(keyCode == DOWN){
     user.moveDown(); 
    }
    if(keyCode == RIGHT){
     user.moveRight(); 
    }
    if(keyCode == LEFT){
     user.moveLeft(); 
    }
   }
  }
}
