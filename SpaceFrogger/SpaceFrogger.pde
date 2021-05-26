ArrayList<Asteroid> asteroids;
ArrayList<Ship> enemies;
Frog user;
ArrayList<FBullet> frogBullets;
ArrayList<SBullet> enemyBullets;
public void setup(){
  size(1000,1000);
}
  
public void run(){
}

public void draw(){
  background(0);
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
