ArrayList<Asteroid> asteroids;
ArrayList<Ship> enemies;
Frog user;
ArrayList<FBullet> frogBullets;
ArrayList<SBullet> enemyBullets;

public void setup(){
  size(1000,1000);
  background(0);
  fill(225);
  int starcount = 0;
  while(starcount < 1000){
    Double i = Double.valueOf(1000*Math.random());
    Double j = Double.valueOf(1000*Math.random());
    ellipse(i.floatValue(), j.floatValue(), 5, 5);
    starcount++;
  }
  user = new Frog(10,10);
  user.display();
}
  
public void run(){
  
}

public void draw(){
  
}

public void keyPressed(){
  if(keyPressed){
   if(key == ' '){
     user.shoot();
   }
   if(key == CODED){
    if(key == UP){
     user.moveUp(); 
    }
    if(key == DOWN){
     user.moveDown(); 
    }
    if(key == RIGHT){
     user.moveRight(); 
    }
    if(key == LEFT){
     user.moveLeft(); 
    }
   }
  }
}
