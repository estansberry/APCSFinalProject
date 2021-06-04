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
  ellipse(100, 100, 50, 50);
  frameRate(30);
  size(1000,1000); 
  background(0);
  PImage stars = loadImage("stars.png");
  stars.resize(width, height);
  image(stars, 0, 0);
  user = new Frog(10,10);
  //Ship to test mechanics
  Ship s0 = new Ship(-2, 1, 0);
  Ship s1 = new Ship(-2, 1, 1);
  Ship s2 = new Ship(-2, 1, 2);
  Ship s3 = new Ship(-2, 1, 3);
  Ship s4 = new Ship(-2, 1, 4);
  enemies.add(s0);
  enemies.add(s1);
  enemies.add(s2);
  enemies.add(s3);
  enemies.add(s4);
  user.display();
}
  
public void run(){
  
}

public void draw(){
  PImage stars = loadImage("stars.png");
  stars.resize(width, height);
  image(stars, 0, 0);
  enemyMove();
  for(int i = 0; i < enemies.size(); i ++){
    enemies.get(i).move();
    enemies.get(i).display();
  }
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
  text("x: " + user.getx() + "\ny: " + user.gety(),0,20);
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
   hole.display = true;
  }
  if(!asteroids.isEmpty()){
    for(int i = 0; i < asteroids.size(); i++){
     Asteroid meteor = asteroids.get(i);
     meteor.move();
     meteor.display();
     meteor.collide(frogBullets);
     if(meteor.colliding){
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
  int size = enemies.size();
  if(size > 0){
    for(int i = 0; i < size; i ++){
      if(enemies.get(0).getx() < 50 || (enemies.get(0).getx() < 250 && enemies.get(0).gety() > 310)){
        enemies.get(i).setDX(0);
        enemies.get(i).setDY(-1.5);
      }
      if(enemies.get(size - 1).getx() > 950 || (enemies.get(size - 1).getx() > 750 && enemies.get(size - 1).gety() > 310)){
       enemies.get(i).setDY(-1.5);
        enemies.get(i).setDX(0);
      }
      if(enemies.get(0).gety() < 50 && enemies.get(0).getx() < 250){
        enemies.get(i).setDX(3);
        enemies.get(i).setDY(0.5);
      }
      if(enemies.get(0).gety() < 50 && enemies.get(size - 1).getx() > 750){
        enemies.get(i).setDX(-3);
        enemies.get(i).setDY(0.5);
      }
    }
  }
}
