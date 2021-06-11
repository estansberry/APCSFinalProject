ArrayList<Asteroid> asteroids = new ArrayList();
ArrayList<Ship> enemies = new ArrayList();
Frog user = new Frog(10,10);
ArrayList<FBullet> frogBullets = new ArrayList();
ArrayList<SBullet> enemyBullets = new ArrayList();
Wormhole hole = new Wormhole();
int level = 1;
boolean reset = false;
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
  enemymove = 0;
  //Ship to test mechanics
  if(level == 1){
    Ship s0 = new Ship(-2, 1, 0);
    Ship s1 = new Ship(-2, 1, 1);
    Ship s2 = new Ship(-2, 1, 2);
    enemies.add(s0);
    enemies.add(s1);
    enemies.add(s2);
  }else if(level == 2){
    Ship s0 = new Ship(-4, 2, 0);
    Ship s1 = new Ship(-4, 2, 1);
    Ship s2 = new Ship(-4, 2, 2);
    Ship s3 = new Ship(-4, 2, 3);
    enemies.add(s0);
    enemies.add(s1);
    enemies.add(s2);
    enemies.add(s3);
  }else if(level == 3){
    Ship s0 = new Ship(-6, 3, 0);
    Ship s1 = new Ship(-6, 3, 1);
    Ship s2 = new Ship(-6, 3, 2);
    Ship s3 = new Ship(-6, 3, 3);
    Ship s4 = new Ship(-6, 3, 4);
    enemies.add(s0);
    enemies.add(s1);
    enemies.add(s2);
    enemies.add(s3);
    enemies.add(s4);
  }else if(level ==4){
    Ship s0 = new Ship(-8, 4, 0);
    Ship s1 = new Ship(-8, 4, 1);
    Ship s2 = new Ship(-8, 4, 2);
    Ship s3 = new Ship(-8, 4, 3);
    Ship s4 = new Ship(-8, 4, 4);
    Ship s5 = new Ship(-8, 4, 5);
    enemies.add(s0);
    enemies.add(s1);
    enemies.add(s2);
    enemies.add(s3);
    enemies.add(s4);
    enemies.add(s5);
  }else if(level == 5){
    Ship s0 = new Ship(-10, 5, 0);
    Ship s1 = new Ship(-10, 5, 1);
    Ship s2 = new Ship(-10, 5, 2);
    Ship s3 = new Ship(-10, 5, 3);
    Ship s4 = new Ship(-10, 5, 4);
    Ship s5 = new Ship(-10, 5, 5);
    Ship s6 = new Ship(-10, 5, 6);
    enemies.add(s0);
    enemies.add(s1);
    enemies.add(s2);
    enemies.add(s3);
    enemies.add(s4);
    enemies.add(s5);
    enemies.add(s6);
  }
  //user.display();
  hole = new Wormhole();
}

Boolean skipintro = false;
int ellipsex = 500;
int ellipsey = 400;
float drawcount = 0;
int texty = 900;
int textsize = 50;
int mainx = 500;
int mainy = 750;
int drawcounter = 0;
int ellipsenextx = 500;
int ellipsenexty = 400;
int xsize = 1;
int ysize = 1;
int frogplace = 350;
int frogplace1 = 350;
int frogplace2 = 350;
int textx = 900;
int enemymove = 0;
boolean changing = false;

public void draw(){
  ellipseMode(CENTER);
  rectMode(CENTER);
  drawcount ++;
  PImage stars = loadImage("stars.png");
  stars.resize(width, height);
  image(stars, 0, 0);
  user.display();
  //skip intro button
  if(!skipintro && drawcount < 650 && level == 1){
    fill(#B71818);
    rect(900, 760, 150, 50);
    textSize(30);
    fill(0);
    textAlign(LEFT);
    text("skip intro", 832, 772);
  }
  if(!skipintro && ellipsex > - 250 && level == 1){
    fill(#478140);
    ellipse(ellipsex, ellipsey, 500/(drawcount/40), 500/(drawcount/40));
    fill(0);
    textSize(textsize);
    text("FROGGY", (ellipsex - 100), ellipsey);
    text("PLANET", (ellipsex - 100), (ellipsey + 50));
  }if(!skipintro && drawcount >= 90 && level == 1){
    ellipsex -= 5;
    ellipsey -= 5;
    if(textsize > 1){
       textsize --;
    }
  }
  if(level == 1 && !skipintro && drawcount > 175 && drawcount < 300 && (drawcount % 20 == 0 || drawcount % 20 == 1 || drawcount % 20 == 2 || drawcount % 20 == 3 || drawcount % 20 == 4 ||  drawcount % 20 == 5 || drawcount % 20 == 6 || drawcount % 20 == 7 || drawcount % 20 == 8 || drawcount % 20 == 9 || drawcount % 20 == 10 || drawcount % 20 == 11 || drawcount % 20 == 12 || drawcount % 20 == 13)){
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
  }if(!skipintro && drawcount > 300 && level == 1){
    fill(#F5EC36);
    textSize(50);
    textAlign(CENTER);
    text("Help ASTROFROG make his way back!", 500, texty);
    text("Avoid the ASTEROIDS,", 500, texty + 100);
    text("Destroy the ENEMY SPACESHIPS,", 500, texty + 200);
    text("And enter the WORMHOLE", 500, texty + 300);
    text("to get ASTROFROG home!", 500, texty + 400);
    texty -= 6;
  }if(!skipintro && drawcount > 540 && drawcount < 575 && level == 1){
    stroke(#B71818);
    strokeWeight(10);
    noFill();
    rect(500, 320, 750, 250);
    fill(#B71818);
    textSize(200);
    text("READY?", 500, 400);
  }if(!skipintro && drawcount > 585 && drawcount < 610 && level == 1){
    stroke(#F5EC36);
    strokeWeight(10);
    noFill();
    rect(500, 320, 500, 250);
    fill(#F5EC36);
    textSize(200);
    text("SET", 500, 400);
  }if(!skipintro && drawcount > 620 && drawcount < 645 && level == 1){
    stroke(#38D32B);
    strokeWeight(10);
    noFill();
    rect(500, 320, 500, 250);
    fill(#38D32B);
    textSize(200);
    text("GO!!", 500, 400);
  }
  if((drawcount > 650 || skipintro) && level == 1){
    enemyMove();
    for(int i = 0; i < enemies.size(); i ++){
      enemies.get(i).move();
      enemies.get(i).display(level);
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
     reset = true;
    }
    if(user.display){
      user.display();
    }
    fill(255);
    textSize(20);
    textAlign(LEFT);
    text("Level: " + level + "\nLives: " + user.gethp() + "\nUse WASD or arrow keys to move" + "\nUse spacebar to shoot bullets",10,20);
    if(reset == true){
      fill(255,0,0);
      textSize(40);
      text("Ran Out Of Lives\nSpaceFrogger Has Reset",500,50);
    }
    int random = (int)Math.floor(Math.random()*(15-1+1)+1);
    if(random == 1){
     int place = (int)Math.floor(Math.random()*(4-0+1)+0);
     int randomY = asteroidValues[place];
     Asteroid holder = new Asteroid(randomY,6,25,color(128));
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
      hole.display = false;
      for(int i = 0; i < enemies.size(); i++){
       if(!enemies.isEmpty()){
        Ship enemy = enemies.get(i);
        enemy.display(level);
        enemy.collide(frogBullets);
        if(enemy.colliding){
         enemies.remove(i); 
        }
       }
      }
      }
      else{
       hole.display = true;
       reset = false;
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
        level++;
        asteroids = new ArrayList();
        enemies = new ArrayList();
        frogBullets = new ArrayList();
        user.x = 500;
        user.y = 750;
        setup();
      }
    }
  }
  if(level == 2){
    enemyMove();
    for(int i = 0; i < enemies.size(); i ++){
      enemies.get(i).move();
      enemies.get(i).display(level);
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
     reset = true;
    }
    if(user.display){
      user.display();
    }
    fill(255);
    textSize(20);
    text("Level: " + level + "\nLives: " + user.gethp(),10,20);
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
      hole.display = false;
      for(int i = 0; i < enemies.size(); i++){
       if(!enemies.isEmpty()){
        Ship enemy = enemies.get(i);
        enemy.display(level);
        enemy.collide(frogBullets);
        if(enemy.colliding){
         enemies.remove(i); 
        }
       }
      }
       random = (int)Math.floor(Math.random()*(13-1+1)+1);
       if(random == 1 && !enemies.isEmpty()){
        int place = (int)Math.floor(Math.random()*((enemies.size()-1)-0+1)+0);
        float randomY = enemies.get(place).gety();
        float randomX = enemies.get(place).getx();
        SBullet holder = new SBullet(randomX,randomY,20,10,color(255,0,0));
        enemyBullets.add(holder);
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
        enemyBullets = new ArrayList();
        user.x = 500;
        user.y = 750;
        setup();
      }
    }
  }
  if(level == 3){
    enemyMove();
    for(int i = 0; i < enemies.size(); i ++){
      enemies.get(i).move();
      enemies.get(i).display(level);
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
     reset = true;
    }
    if(user.display){
      user.display();
    }
    fill(255);
    textSize(20);
    text("Level: " + level + "\nLives: " + user.gethp(),10,20);
    int random = (int)Math.floor(Math.random()*(15-1+1)+1);
    if(random == 1){
     int place = (int)Math.floor(Math.random()*(4-0+1)+0);
     int randomY = asteroidValues[place];
     Asteroid holder = new Asteroid(randomY,10,25,color(128));
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
      hole.display = false;
      for(int i = 0; i < enemies.size(); i++){
       if(!enemies.isEmpty()){
        Ship enemy = enemies.get(i);
        enemy.display(level);
        enemy.collide(frogBullets);
        if(enemy.colliding){
         enemies.remove(i); 
        }
       }
      }
       random = (int)Math.floor(Math.random()*(11-1+1)+1);
       if(random == 1 && !enemies.isEmpty()){
        int place = (int)Math.floor(Math.random()*((enemies.size()-1)-0+1)+0);
        float randomY = enemies.get(place).gety();
        float randomX = enemies.get(place).getx();
        SBullet holder = new SBullet(randomX,randomY,20,10,color(255,0,0));
        enemyBullets.add(holder);
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
        enemyBullets = new ArrayList();
        user.x = 500;
        user.y = 750;
        setup();
      }
    }
  }
  if(level == 4){
    enemyMove();
    for(int i = 0; i < enemies.size(); i ++){
      enemies.get(i).move();
      enemies.get(i).display(level);
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
     reset = true;
    }
    if(user.display){
      user.display();
    }
    fill(255);
    textSize(20);
    text("Level: " + level + "\nLives: " + user.gethp(),10,20);
    int random = (int)Math.floor(Math.random()*(15-1+1)+1);
    if(random == 1){
     int place = (int)Math.floor(Math.random()*(4-0+1)+0);
     int randomY = asteroidValues[place];
     Asteroid holder = new Asteroid(randomY,12,25,color(128));
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
      hole.display = false;
      for(int i = 0; i < enemies.size(); i++){
       if(!enemies.isEmpty()){
        Ship enemy = enemies.get(i);
        enemy.display(level);
        enemy.collide(frogBullets);
        if(enemy.colliding){
         enemies.remove(i); 
        }
       }
      }
       random = (int)Math.floor(Math.random()*(9-1+1)+1);
       if(random == 1 && !enemies.isEmpty()){
        int place = (int)Math.floor(Math.random()*((enemies.size()-1)-0+1)+0);
        float randomY = enemies.get(place).gety();
        float randomX = enemies.get(place).getx();
        SBullet holder = new SBullet(randomX,randomY,20,10,color(255,0,0));
        enemyBullets.add(holder);
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
        enemyBullets = new ArrayList();
        user.x = 500;
        user.y = 750;
        setup();
      }
    }
  }
  if(level == 5){
    enemyMove();
    for(int i = 0; i < enemies.size(); i ++){
      enemies.get(i).move();
      enemies.get(i).display(level);
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
     reset = true;
    }
    if(user.display){
      user.display();
    }
    fill(255);
    textSize(20);
    text("Level: " + level + "\nLives: " + user.gethp(),10,20);
    int random = (int)Math.floor(Math.random()*(15-1+1)+1);
    if(random == 1){
     int place = (int)Math.floor(Math.random()*(4-0+1)+0);
     int randomY = asteroidValues[place];
     Asteroid holder = new Asteroid(randomY,14,25,color(128));
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
      hole.display = false;
      for(int i = 0; i < enemies.size(); i++){
       if(!enemies.isEmpty()){
        Ship enemy = enemies.get(i);
        enemy.display(level);
        enemy.collide(frogBullets);
        if(enemy.colliding){
         enemies.remove(i); 
        }
       }
      }
       random = (int)Math.floor(Math.random()*(7-1+1)+1);
       if(random == 1 && !enemies.isEmpty()){
        int place = (int)Math.floor(Math.random()*((enemies.size()-1)-0+1)+0);
        float randomY = enemies.get(place).gety();
        float randomX = enemies.get(place).getx();
        SBullet holder = new SBullet(randomX,randomY,20,10,color(255,0,0));
        enemyBullets.add(holder);
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
        user.x = 500;
        user.y = 750;
        level++;
      }
    }
  }
  if(level == 6){
   //outro 
   drawcounter ++;
   if(drawcounter > 10 && drawcounter < 220){
    fill(#478140);
    ellipse(ellipsenextx, ellipsenexty, xsize, ysize);
    xsize += 10;
    ysize += 10;
    fill(0);
    textSize(50);
    text("FROGGY", (ellipsenextx - 100), ellipsenexty);
    text("PLANET", (ellipsenextx - 100), (ellipsenexty + 50));
    if(ellipsenexty < 700){
      ellipsenexty += 6;
    }
   }if(drawcounter > 175){
    background(#478140);
    for(int i = 0; i < 200; i ++){
      stroke(#6B9371);
      fill(#6B9371);
      ellipse((int) (Math.random()*1000), (int) (Math.random()*370),20, 20);
    }
    stroke(#4D3010);
    fill(#4D3010);
    rect(180, frogplace2 - 15, 5, 70);
    rect(320, frogplace - 15, 5, 90);
    rect(480, frogplace1 - 10, 5, 80);
    rect(710, frogplace2 - 15, 5, 85);
    rect(815, frogplace - 15, 5, 70);
    Frog frog1 = new Frog(200, frogplace2 + 15, 75);
    frog1.display();
    Frog frog2 = new Frog(300, frogplace, 100);
    frog2.display();
    Frog frog3 = new Frog(500, frogplace1, 85);
    frog3.display();
    Frog frog4 = new Frog(725, frogplace2, 95);
    frog4.display();
    Frog frog5 = new Frog(800, frogplace + 15, 75);
    frog5.display();
    stroke(0);
    strokeWeight(8);
    fill(255);
    if(0 <= drawcounter % 51 && drawcounter % 51 < 17){
      rect(200, 300, 110, 50);
      rect(800, 300, 110, 50);
      rect(500, 275, 500, 50);
      fill(0);
      textSize(40);
      text("WEL", 170, 315);
      textSize(45);
      text("COME   HOME   ASTRO", 256, 290);
      textSize(35);
      text("FROG", 756, 316);
      frogplace ++;
      frogplace2 --;
    }if(17 <= drawcounter % 51 && drawcounter % 51 < 34){
      rect(200, 300, 110, 50);
      rect(800, 300, 110, 50);
      rect(500, 285, 500, 50);
      fill(0);
      textSize(40);
      text("WEL", 170, 315);
      textSize(45);
      text("COME   HOME   ASTRO", 256, 300);
      textSize(35);
      text("FROG", 756, 316);
      frogplace1 --;
      frogplace2 ++;
    }if(34 <= drawcounter % 51 && drawcounter % 51 <= 54){
      rect(200, 310, 110, 50);
      rect(800, 310, 110, 50);
      rect(500, 275, 500, 50);
      fill(0);
      textSize(40);
      text("WEL", 170, 325);
      textSize(45);
      text("COME   HOME   ASTRO", 256, 290);
      textSize(35);
      text("FROG", 756, 326);
      frogplace --;
      frogplace1 ++;
    }
  }if(drawcounter > 200){
    textx -= 8;
    textSize(50);
    text("Congratulations! You returned Astrofrog back to his home planet. The frogs on the Froggy Planet are forever indebted to you. Play again soon!", textx, 600);
  }if(drawcounter > 725){
    exit();
  }Frog fakeuser = new Frog(0, 0);
  fakeuser.display();
  }
}

public void keyPressed(){
  if(keyPressed && level != 6 &&(drawcount > 650 || skipintro || level != 1)){
   if(key == ' ' && frogBullets.size() <= 4){
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
   if(key == 'W' || key == 'w'){
    user.moveUp(); 
   }
   if(key == 'S' || key == 's'){
    user.moveDown(); 
   }
   if(key == 'D' || key == 'd'){
    user.moveRight(); 
   }
   if(key == 'A' || key == 'a'){
    user.moveLeft(); 
   }
  }
}

public void mousePressed(){
  if(mouseButton == LEFT){
    if(mouseX < 975 && mouseX > 825 && mouseY < 785 && mouseY > 735){
      skipintro = true;
    }
  }
}

public void enemyMove(){
  int size = enemies.size();
  if(size > 0){
    for(int i = 0; i < size; i ++){
      if(enemymove == 0 && (enemies.get(0).gety() > 300 || enemies.get(0).getx() < 50)){
        if(level == 1){
          enemies.get(i).setDX(0);
          enemies.get(i).setDY(-1.5);
        }else if(level == 2){
          enemies.get(i).setDX(0);
          enemies.get(i).setDY(-3);
        }else if(level == 3){
          enemies.get(i).setDX(0);
          enemies.get(i).setDY(-4.5);
        }else if(level == 4){
          enemies.get(i).setDX(0);
          enemies.get(i).setDY(-6);
        }else if(level == 5){
          enemies.get(i).setDX(0);
          enemies.get(i).setDY(-7.5);
        }changing = true;
      }
      if(enemymove == 2 && (enemies.get(size - 1).gety() > 300 || enemies.get(size - 1).getx() > 950)){
        if(level == 1){
          enemies.get(i).setDY(-1.5);
          enemies.get(i).setDX(0);
        }else if(level == 2){
          enemies.get(i).setDY(-3);
          enemies.get(i).setDX(0);
        }else if(level == 3){
          enemies.get(i).setDY(-4.5);
          enemies.get(i).setDX(0);
        }else if(level == 4){
          enemies.get(i).setDY(-6);
          enemies.get(i).setDX(0);
        }else if(level == 5){
          enemies.get(i).setDY(-6.5);
          enemies.get(i).setDX(0);
        }changing = true;
      }
      if(enemymove == 1 && (enemies.get(0).gety() < 50)){
        if(level == 1){
          enemies.get(i).setDX(3);
          enemies.get(i).setDY(0.5);
        }else if(level == 2){
          enemies.get(i).setDX(5);
          enemies.get(i).setDY(2.5);
        }else if(level == 3){
          enemies.get(i).setDX(7);
          enemies.get(i).setDY(4.5);
        }else if(level == 4){
          enemies.get(i).setDX(9);
          enemies.get(i).setDY(6.5);
        }else if(level == 5){
          enemies.get(i).setDX(11);
          enemies.get(i).setDY(8.5);
        }changing = true;
      } 
      if(enemymove == 3 && enemies.get(0).gety() < 50){
        if(level == 1){
          enemies.get(i).setDX(-3);
          enemies.get(i).setDY(0.5);
        }else if(level == 2){
          enemies.get(i).setDX(-5);
          enemies.get(i).setDY(2.5);
        }else if(level == 3){
          enemies.get(i).setDX(-7);
          enemies.get(i).setDY(4.5);
        }else if(level == 4){
          enemies.get(i).setDX(-9);
          enemies.get(i).setDY(6.5);
        }else if(level == 5){
          enemies.get(i).setDX(-11);
          enemies.get(i).setDY(8.5);
        }changing = true;
      }
    }if(changing){
      if(enemymove == 0){
        enemymove = 1;
      }else if(enemymove == 1){
        enemymove = 2;
      }else if(enemymove == 2){
        enemymove = 3;
      }else if(enemymove == 3){
        enemymove = 0;
      }
      changing = false;
    }
  }
}
