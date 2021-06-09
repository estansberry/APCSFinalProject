ArrayList<Asteroid> asteroids = new ArrayList();
ArrayList<Ship> enemies = new ArrayList();
Frog user;
ArrayList<FBullet> frogBullets = new ArrayList();
ArrayList<SBullet> enemyBullets = new ArrayList();
Wormhole hole = new Wormhole();
int level = 1;
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
  background(#478140);
  //PImage stars = loadImage("stars.png");
  //stars.resize(width, height);
  //image(stars, 0, 0);
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
  //user.display();
}

int ellipsex = 500;
int ellipsey = 400;
float drawcount = 0;
int texty = 900;
int textsize = 50;

public void draw(){
  ellipseMode(CENTER);
  rectMode(CENTER);
  drawcount ++;
  PImage stars = loadImage("stars.png");
  stars.resize(width, height);
  image(stars, 0, 0);
  user.display();
  if(ellipsex > - 250){
    fill(#478140);
    ellipse(ellipsex, ellipsey, 500/(drawcount/40), 500/(drawcount/40));
    fill(0);
    textSize(textsize);
    text("FROGGY", (ellipsex - 100), ellipsey);
    text("PLANET", (ellipsex - 100), (ellipsey + 50));
  }if(drawcount >= 90){
    ellipsex -= 5;
    ellipsey -= 5;
    if(textsize > 1){
       textsize --;
    }
  }
  if(drawcount > 175 && drawcount < 300 && (drawcount % 20 == 0 || drawcount % 20 == 1 || drawcount % 20 == 2 || drawcount % 20 == 3 || drawcount % 20 == 4 ||  drawcount % 20 == 5 || drawcount % 20 == 6 || drawcount % 20 == 7 || drawcount % 20 == 8 || drawcount % 20 == 9 || drawcount % 20 == 10 || drawcount % 20 == 11 || drawcount % 20 == 12 || drawcount % 20 == 13)){
    fill(#B71818);
    stroke(#B71818);
    strokeWeight(10);
    textSize(100);
    noFill();
    rect(500, 300, 890, 400);
    textAlign(CENTER);
    text("HELP!", 500, 200);
    textSize(60);
    text("ASTROFROG is VERY FAR from", 500, 300);
    text("his FROGGY HOME PLANET!!", 500, 400);
  }if(drawcount > 300){
    fill(#F5EC36);
    textSize(50);
    text("Help ASTROFROG make his way back!", 500, texty);
    text("Avoid the ASTEROIDS,", 500, texty + 100);
    text("Destroy the ENEMY SPACESHIPS,", 500, texty + 200);
    text("And enter the WORMHOLE", 500, texty + 300);
    text("to get ASTROFROG home!", 500, texty + 400);
    texty -= 5;
  }if(drawcount > 600 && drawcount < 625){
    stroke(#B71818);
    strokeWeight(10);
    noFill();
    rect(500, 320, 750, 250);
    fill(#B71818);
    textSize(200);
    text("READY?", 500, 400);
  }if(drawcount > 635 && drawcount < 660){
    stroke(#B71818);
    strokeWeight(10);
    noFill();
    rect(500, 320, 500, 250);
    fill(#B71818);
    textSize(200);
    text("SET", 500, 400);
  }if(drawcount > 670 && drawcount < 695){
    stroke(#38D32B);
    strokeWeight(10);
    noFill();
    rect(500, 320, 500, 250);
    fill(#38D32B);
    textSize(200);
    text("GO!!", 500, 400);
  }
  if(drawcount > 700 && level == 1){
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
     asteroids = new ArrayList();
     enemies = new ArrayList();
     frogBullets = new ArrayList();
     enemyBullets = new ArrayList();
     user.hp = 3;
     setup();
    }
    if(user.display){
      user.display();
    }
    fill(255);
    textSize(20);
    text("Level: " + level + "\nLives: " + user.gethp(),50,20);
    int random = (int)Math.floor(Math.random()*(15-1+1)+1);
    if(random == 1){
     int place = (int)Math.floor(Math.random()*(4-0+1)+0);
     int randomY = asteroidValues[place];
     Asteroid holder = new Asteroid(randomY,8,25,color(128));
     asteroids.add(holder);
     }
     if(!frogBullets.isEmpty()){ 
      for(int i = 0; i < frogBullets.size(); i++){
       if(!frogBullets.isEmpty()){ 
        FBullet b = frogBullets.get(i);
        b.move();
        b.collide(enemyBullets);
        if(b.y < 0 || b.colliding){
         frogBullets.remove(i); 
        }
        b.display();
       }
      }
     }
     if(!enemies.isEmpty()){
      for(int i = 0; i < enemies.size(); i++){
       if(!enemies.isEmpty()){
        Ship enemy = enemies.get(i);
        enemy.display();
        enemy.collide(frogBullets);
        if(enemy.colliding){
         enemies.remove(i); 
        }
       }
      }
      }
      else{
       hole.display = true;
      }
      if(!asteroids.isEmpty()){
       for(int i = 0; i < asteroids.size(); i++){
         if(!asteroids.isEmpty()){
          Asteroid meteor = asteroids.get(i);
          meteor.move();
          meteor.display();
          meteor.collide(frogBullets);
          if(meteor.colliding){
           asteroids.remove(i); 
         }
        }
       }
      }
      if(hole.display){
       hole.display();
       if(hole.collide(user)){
        asteroids.clear();
        user.display = false;
        hole.display = false;
        level++;
        asteroids = new ArrayList();
        enemies = new ArrayList();
        frogBullets = new ArrayList();
        setup();
      }
    }
  }
  if(level == 2){
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
     level = 1;
     asteroids = new ArrayList();
     enemies = new ArrayList();
     frogBullets = new ArrayList();
     enemyBullets = new ArrayList();
     user.hp = 3;
     setup();
    }
    if(user.display){
      user.display();
    }
    fill(255);
    textSize(20);
    text("Level: " + level + "\nLives: " + user.gethp(),50,20);
    int random = (int)Math.floor(Math.random()*(15-1+1)+1);
    if(random == 1){
     int place = (int)Math.floor(Math.random()*(4-0+1)+0);
     int randomY = asteroidValues[place];
     Asteroid holder = new Asteroid(randomY,8,25,color(128));
     asteroids.add(holder);
     }
     if(!frogBullets.isEmpty()){ 
      for(int i = 0; i < frogBullets.size(); i++){
       if(!frogBullets.isEmpty()){ 
        FBullet b = frogBullets.get(i);
        b.move();
        b.collide(enemyBullets);
        if(b.y < 0 || b.colliding){
         frogBullets.remove(i); 
        }
        b.display();
       }
      }
     }
     if(!enemyBullets.isEmpty()){ 
      for(int i = 0; i < enemyBullets.size(); i++){
       SBullet b = enemyBullets.get(i);
       b.move();
       b.display();
      }
     }
     if(!enemies.isEmpty()){
      for(int i = 0; i < enemies.size(); i++){
       if(!enemies.isEmpty()){
        Ship enemy = enemies.get(i);
        enemy.display();
        enemy.collide(frogBullets);
        if(enemy.colliding){
         enemies.remove(i); 
        }
       }
      }
      }
       random = (int)Math.floor(Math.random()*(10-1+1)+1);
       if(random == 1 && !enemies.isEmpty()){
        int place = (int)Math.floor(Math.random()*((enemies.size()-1)-0+1)+0);
        float randomY = enemies.get(place).gety();
        float randomX = enemies.get(place).getx();
        SBullet holder = new SBullet(randomX,randomY,20,10,color(255,0,0));
        enemyBullets.add(holder);
       }
      else{
       hole.display = true;
      }
      if(!asteroids.isEmpty()){
       for(int i = 0; i < asteroids.size(); i++){
        if(!asteroids.isEmpty()){
         Asteroid meteor = asteroids.get(i);
         meteor.move();
         meteor.display();
         meteor.collide(frogBullets);
         if(meteor.colliding){
          asteroids.remove(i); 
         }
        }
       }
      }
      if(hole.display){
       hole.display();
       if(hole.collide(user)){
        asteroids.clear();
        user.display = false;
        hole.display = false;
        level++;
        asteroids = new ArrayList();
        enemies = new ArrayList();
        frogBullets = new ArrayList();
        enemyBullets = new ArrayList();
        setup();
      }
    }
  }
  if(level == 3){
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
     level = 1;
     asteroids = new ArrayList();
     enemies = new ArrayList();
     frogBullets = new ArrayList();
     enemyBullets = new ArrayList();
     user.hp = 3;
     setup();
    }
    if(user.display){
      user.display();
    }
    fill(255);
    textSize(20);
    text("Level: " + level + "\nLives: " + user.gethp(),50,20);
    int random = (int)Math.floor(Math.random()*(15-1+1)+1);
    if(random == 1){
     int place = (int)Math.floor(Math.random()*(4-0+1)+0);
     int randomY = asteroidValues[place];
     Asteroid holder = new Asteroid(randomY,8,25,color(128));
     asteroids.add(holder);
     }
     if(!frogBullets.isEmpty()){ 
      for(int i = 0; i < frogBullets.size(); i++){
       if(!frogBullets.isEmpty()){ 
        FBullet b = frogBullets.get(i);
        b.move();
        b.collide(enemyBullets);
        if(b.y < 0 || b.colliding){
         frogBullets.remove(i); 
        }
        b.display();
       }
      }
     }
     if(!enemyBullets.isEmpty()){ 
      for(int i = 0; i < enemyBullets.size(); i++){
       SBullet b = enemyBullets.get(i);
       b.move();
       b.display();
      }
     }
     if(!enemies.isEmpty()){
      for(int i = 0; i < enemies.size(); i++){
       if(!enemies.isEmpty()){
        Ship enemy = enemies.get(i);
        enemy.display();
        enemy.collide(frogBullets);
        if(enemy.colliding){
         enemies.remove(i); 
        }
       }
      }
      }
       random = (int)Math.floor(Math.random()*(10-1+1)+1);
       if(random == 1 && !enemies.isEmpty()){
        int place = (int)Math.floor(Math.random()*((enemies.size()-1)-0+1)+0);
        float randomY = enemies.get(place).gety();
        float randomX = enemies.get(place).getx();
        SBullet holder = new SBullet(randomX,randomY,20,10,color(255,0,0));
        enemyBullets.add(holder);
       }
      else{
       hole.display = true;
      }
      if(!asteroids.isEmpty()){
       for(int i = 0; i < asteroids.size(); i++){
        if(!asteroids.isEmpty()){
         Asteroid meteor = asteroids.get(i);
         meteor.move();
         meteor.display();
         meteor.collide(frogBullets);
         if(meteor.colliding){
          asteroids.remove(i); 
         }
        }
       }
      }
      if(hole.display){
       hole.display();
       if(hole.collide(user)){
        asteroids.clear();
        user.display = false;
        hole.display = false;
        level++;
        asteroids = new ArrayList();
        enemies = new ArrayList();
        frogBullets = new ArrayList();
        enemyBullets = new ArrayList();
        setup();
      }
    }
  }
  if(level == 4){
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
     level = 1;
     asteroids = new ArrayList();
     enemies = new ArrayList();
     frogBullets = new ArrayList();
     enemyBullets = new ArrayList();
     user.hp = 3;
     setup();
    }
    if(user.display){
      user.display();
    }
    fill(255);
    textSize(20);
    text("Level: " + level + "\nLives: " + user.gethp(),50,20);
    int random = (int)Math.floor(Math.random()*(15-1+1)+1);
    if(random == 1){
     int place = (int)Math.floor(Math.random()*(4-0+1)+0);
     int randomY = asteroidValues[place];
     Asteroid holder = new Asteroid(randomY,8,25,color(128));
     asteroids.add(holder);
     }
     if(!frogBullets.isEmpty()){ 
      for(int i = 0; i < frogBullets.size(); i++){
       if(!frogBullets.isEmpty()){ 
        FBullet b = frogBullets.get(i);
        b.move();
        b.collide(enemyBullets);
        if(b.y < 0 || b.colliding){
         frogBullets.remove(i); 
        }
        b.display();
       }
      }
     }
     if(!enemyBullets.isEmpty()){ 
      for(int i = 0; i < enemyBullets.size(); i++){
       SBullet b = enemyBullets.get(i);
       b.move();
       b.display();
      }
     }
     if(!enemies.isEmpty()){
      for(int i = 0; i < enemies.size(); i++){
       if(!enemies.isEmpty()){
        Ship enemy = enemies.get(i);
        enemy.display();
        enemy.collide(frogBullets);
        if(enemy.colliding){
         enemies.remove(i); 
        }
       }
      }
      }
       random = (int)Math.floor(Math.random()*(10-1+1)+1);
       if(random == 1 && !enemies.isEmpty()){
        int place = (int)Math.floor(Math.random()*((enemies.size()-1)-0+1)+0);
        float randomY = enemies.get(place).gety();
        float randomX = enemies.get(place).getx();
        SBullet holder = new SBullet(randomX,randomY,20,10,color(255,0,0));
        enemyBullets.add(holder);
       }
      else{
       hole.display = true;
      }
      if(!asteroids.isEmpty()){
       for(int i = 0; i < asteroids.size(); i++){
        if(!asteroids.isEmpty()){
         Asteroid meteor = asteroids.get(i);
         meteor.move();
         meteor.display();
         meteor.collide(frogBullets);
         if(meteor.colliding){
          asteroids.remove(i); 
         }
        }
       }
      }
      if(hole.display){
       hole.display();
       if(hole.collide(user)){
        asteroids.clear();
        user.display = false;
        hole.display = false;
        level++;
        asteroids = new ArrayList();
        enemies = new ArrayList();
        frogBullets = new ArrayList();
        enemyBullets = new ArrayList();
        setup();
      }
    }
  }
  if(level == 5){
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
     level = 1;
     asteroids = new ArrayList();
     enemies = new ArrayList();
     frogBullets = new ArrayList();
     enemyBullets = new ArrayList();
     user.hp = 3;
     setup();
    }
    if(user.display){
      user.display();
    }
    fill(255);
    textSize(20);
    text("Level: " + level + "\nLives: " + user.gethp(),50,20);
    int random = (int)Math.floor(Math.random()*(15-1+1)+1);
    if(random == 1){
     int place = (int)Math.floor(Math.random()*(4-0+1)+0);
     int randomY = asteroidValues[place];
     Asteroid holder = new Asteroid(randomY,8,25,color(128));
     asteroids.add(holder);
     }
     if(!frogBullets.isEmpty()){ 
      for(int i = 0; i < frogBullets.size(); i++){
       if(!frogBullets.isEmpty()){ 
        FBullet b = frogBullets.get(i);
        b.move();
        b.collide(enemyBullets);
        if(b.y < 0 || b.colliding){
         frogBullets.remove(i); 
        }
        b.display();
       }
      }
     }
     if(!enemyBullets.isEmpty()){ 
      for(int i = 0; i < enemyBullets.size(); i++){
       SBullet b = enemyBullets.get(i);
       b.move();
       b.display();
      }
     }
     if(!enemies.isEmpty()){
      for(int i = 0; i < enemies.size(); i++){
       if(!enemies.isEmpty()){
        Ship enemy = enemies.get(i);
        enemy.display();
        enemy.collide(frogBullets);
        if(enemy.colliding){
         enemies.remove(i); 
        }
       }
      }
      }
       random = (int)Math.floor(Math.random()*(10-1+1)+1);
       if(random == 1 && !enemies.isEmpty()){
        int place = (int)Math.floor(Math.random()*((enemies.size()-1)-0+1)+0);
        float randomY = enemies.get(place).gety();
        float randomX = enemies.get(place).getx();
        SBullet holder = new SBullet(randomX,randomY,20,10,color(255,0,0));
        enemyBullets.add(holder);
       }
      else{
       hole.display = true;
      }
      if(!asteroids.isEmpty()){
       for(int i = 0; i < asteroids.size(); i++){
        if(!asteroids.isEmpty()){
         Asteroid meteor = asteroids.get(i);
         meteor.move();
         meteor.display();
         meteor.collide(frogBullets);
         if(meteor.colliding){
          asteroids.remove(i); 
         }
        }
       }
      }
      if(hole.display){
       hole.display();
       if(hole.collide(user)){
        asteroids.clear();
        user.display = false;
        hole.display = false;
        level++;
      }
    }
  }
  if(level == 6){
   //outro 
  }
}

public void keyPressed(){
  if(keyPressed && drawcount > 700){
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
