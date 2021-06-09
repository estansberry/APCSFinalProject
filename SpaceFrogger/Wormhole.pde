public class Wormhole extends Entity{
  public boolean display;
  
  public Wormhole(){
    display = false;
    radius = 5;
    x = 500;
    y = 60;
  }
  
  public void display(){
    fill(#1B0934);
    stroke(#1B0934);
    ellipse(500, 60, 65, 65);
    for(int j = 0; j < 10; j ++){
      for(int i = 0; i < 5; i ++){
        int rand1 = (int) (Math.random()*40 + 480);
        int rand2 = (int) (Math.random()*40 + 40);
        ellipse(rand1, rand2, 25, 25);
      }
      int randred = (int) (Math.random()*36 + 60);
      int randgreen= (int) (Math.random()*95 + 83);
      int randblue = (int) (Math.random()*30 + 148);
      fill(randred, randgreen, randblue, 100);
      stroke(randred, randgreen, randblue, 100);
    }
    for(int j = 0; j < 8; j ++){
      for(int i = 0; i < 5; i ++){
        int rand1 = (int) (Math.random()*40 + 480);
        int rand2 = (int) (Math.random()*40 + 40);
        ellipse(rand1, rand2, 10, 10);
      }
      int randred = (int) (Math.random()*14 + 21);
      int randgreen= (int) (Math.random()*56 + 21);
      fill(randred, randgreen, 77, 100);
      stroke(randred, randgreen, 77, 100);
    }
    for(int j = 0; j < 8; j ++){
      for(int i = 0; i < 5; i ++){
        int rand1 = (int) (Math.random()*40 + 480);
        int rand2 = (int) (Math.random()*40 + 40);
        ellipse(rand1, rand2, 1, 1);
      }
      if(j % 2 == 0){
        fill(220, 100);
        stroke(220);
      }
      else{
        fill(15, 100);
        stroke(15);
      }
    }
  }
  
  public boolean collide(Frog user){
    double distance = Math.sqrt(Math.pow((x - user.x),2) + Math.pow((y - user.y),2));
    double radii = radius + user.radius;
    if(distance < radii){
     return true;
    }
    return false;
  }
}
