ArrayList<Asteroid> asteroids = new ArrayList();
ArrayList<Ship> enemies = new ArrayList();
Frog user;
ArrayList<FBullet> frogBullets = new ArrayList();
ArrayList<SBullet> enemyBullets = new ArrayList();
Wormhole hole;

public void setup(){
  size(1000,1000);
  background(0);
  PImage stars = loadImage("stars.png");
  stars.resize(width, height);
  image(stars, 0, 0);
  user = new Frog(10,10);
  //Ship to test mechanics
  Ship s = new Ship(5,5);
  Ship s = new Ship(5,5);
  Ship s = new Ship(5,5);
  Ship s = new Ship(5,5);
  enemies.add(s);
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
  user.display();
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
   hole = new Wormhole();
   hole.display();
   hole.collide(user);
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
