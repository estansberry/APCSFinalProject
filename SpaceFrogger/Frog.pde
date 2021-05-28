public class Frog extends Entity{
  public int hp;
  
  public Frog(float DX,float DY){
   x = 500;
   y = 750;
   dx = DX;
   dy = DY;
   radius = 100;
   hp = 3;
  }
  
  public int gethp(){
    return hp;
  }
  
  public void shoot(){
  }
  
  public void moveRight(){
    //Amount is subject to change
    this.x += dx;
  }
  
  public void moveLeft(){
    //Amount is subject to change
    this.x -= dx;
  }
  
  public void moveUp(){
    //Amount is subject to change
    this.y -= dy;
  }
  
  public void moveDown(){
    //Amount is subject to change
    this.y += dy;
  }
  
  public void display(){
    float bodyRadius = radius/2;
    fill(0, 0, 0, 0);
    ellipseMode(CENTER);
    rectMode(CENTER);
    ellipse(x, y, radius, radius);
    stroke(#6B9371);
    fill(#6B9371);
    //head
    ellipse(x, y - bodyRadius/2.4, bodyRadius/1.3, bodyRadius/1.6);
    //body
    ellipse(x, y, bodyRadius, bodyRadius);
    //legs
    ellipse(x - bodyRadius/3, y + bodyRadius/3, bodyRadius/1.5, bodyRadius/1.5);
    ellipse(x + bodyRadius/3, y + bodyRadius/3, bodyRadius/1.5, bodyRadius/1.5);
    //feet
    rect(x - bodyRadius/2 - 1, y + bodyRadius/2 + 7, bodyRadius/1.5, bodyRadius/12);
    rect(x + bodyRadius/2 + 1, y + bodyRadius/2 + 7, bodyRadius/1.5, bodyRadius/12);
    rect(x - bodyRadius/2, y + bodyRadius/2, bodyRadius/1.5, bodyRadius/12);
    rect(x + bodyRadius/2, y + bodyRadius/2, bodyRadius/1.5, bodyRadius/12);
    rect(x - bodyRadius/2 + 1, y + bodyRadius/2 - 8, bodyRadius/1.5, bodyRadius/12);
    rect(x + bodyRadius/2 - 1, y + bodyRadius/2 - 8, bodyRadius/1.5, bodyRadius/12);
    //helmet
    fill(225, 225, 225, 160);
    stroke(0);
    ellipse(x, y - bodyRadius/1.75, bodyRadius/.9, bodyRadius/1.1);
  }
  
}
