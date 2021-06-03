ArrayList<Asteroid> asteroids = new ArrayList();
ArrayList<Ship> enemies = new ArrayList();
Frog user;
ArrayList<FBullet> frogBullets = new ArrayList();
ArrayList<SBullet> enemyBullets = new ArrayList();
Wormhole hole = new Wormhole();

public void setup(){
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
  user.collide(enemyBullets);
  if(user.hp < 1){
   //Restart game
  }
  if(user.display){
    user.display();
  }
  fill(255);
  textSize(20);
  text("x: " + user.getx() + "\ny: " + user.gety(),0,20);
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
