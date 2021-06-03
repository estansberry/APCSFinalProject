ArrayList<Asteroid> asteroids = new ArrayList();
ArrayList<Ship> enemies = new ArrayList();
Frog user;
ArrayList<FBullet> frogBullets = new ArrayList();
ArrayList<SBullet> enemyBullets = new ArrayList();
Wormhole hole = new Wormhole();
int[] asteroidValues = new int[5];{
 asteroidValues[0] = 400;
 asteroidValues[1] = 450;
 asteroidValues[2] = 500;
 asteroidValues[3] = 550;
 asteroidValues[4] = 600;
}

public void setup(){
  frameRate(30);
  size(1000,1000); 
  background(0);
  PImage stars = loadImage("stars.png");
  stars.resize(width, height);
  image(stars, 0, 0);
  user = new Frog(10,10);
  //Ship to test mechanics
  Ship s0 = new Ship(5,5);
  Ship s1 = new Ship(5,5);
  Ship s2 = new Ship(5,5);
  Ship s3 = new Ship(5,5);
  enemies.add(s0);
  user.display();
}
  
public void run(){
  
}

public void draw(){
  PImage stars = loadImage("stars.png");
  stars.resize(width, height);
  image(stars, 0, 0);
  if(user.bulletCollide(enemyBullets) || user.asteroidCollide(asteroids)){
    user.x = 500;
    user.y = 750;
  }
  if(user.hp < 1){
   //Restart game
  }
  if(user.display){
    user.display();
  }
  fill(255);
  textSize(20);
  text("x: " + user.getx() + "\ny: " + user.gety() + "\nhp: " + user.gethp(),0,20);
  int random = (int)Math.floor(Math.random()*(15-1+1)+1);
  if(random == 1){
    int place = (int)Math.floor(Math.random()*(4-0+1)+0);
    int randomY = asteroidValues[place];
    Asteroid holder = new Asteroid(randomY,8,25,color(128));
    asteroids.add(holder);
  }
  if(!frogBullets.isEmpty()){ 
    for(int i = 0; i < frogBullets.size(); i++){
     FBullet b = frogBullets.get(i);
     b.move();
     if(b.y < 0){
      frogBullets.remove(i); 
     }
     b.display();
    }
  }
  if(!enemies.isEmpty()){
    for(int i = 0; i < enemies.size(); i++){
     Ship enemy = enemies.get(i);
     enemy.display();
     enemy.collide(frogBullets);
     if(enemy.colliding){
      enemies.remove(i); 
     }
    }
  }
  else{
   //wormhole appears once all enemy ships are eliminated
   hole.display = true;
  }
  if(!asteroids.isEmpty()){
    for(int i = 0; i < asteroids.size(); i++){
     Asteroid meteor = asteroids.get(i);
     meteor.move();
     meteor.display();
     meteor.collide(frogBullets);
     if(meteor.hp < 1){
      asteroids.remove(i); 
     }
    }
  }
  if(hole.display){
   hole.display();
   if(hole.collide(user)){
     asteroids.clear();
     user.display = false;
     fill(255);
     textSize(50);
     text("End of Demo",350,500);
   }
  }
}

public void keyPressed(){
  if(keyPressed){
   if(key == ' ' && frogBullets.size() <= 10){
     frogBullets.add(user.shoot());
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

public void enemyMove(){
  if(enemies.get(0).getx() < 100){
  }
}
