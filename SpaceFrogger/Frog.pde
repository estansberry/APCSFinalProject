public class Frog extends Entity{
  public int hp;
  
  public Frog(float X,float Y,float DX,float DY,float rad){
   x = X;
   y = Y;
   dx = DX;
   dy = DY;
   radius = rad;
   hp = 3;
  }
  
  public int gethp(){
    return hp;
  }
  
  public void shoot(){
  }
  
  public void moveRight(){
    //Amount is subject to change
    this.x += 10;
  }
  
  public void moveLeft(){
    //Amount is subject to change
    this.x -= 10;
  }
  
  public void moveUp(){
    //Amount is subject to change
    this.y -= 10;
  }
  
  public void moveDown(){
    //Amount is subject to change
    this.y += 10;
  }
  
  public void display(){
    float officialrad = 100;
    float x = 500;
    float y = 750;
    float radius = officialrad/2;
    fill(0, 0, 0, 0);
    ellipseMode(CENTER);
    rectMode(CENTER);
    ellipse(x, y, officialrad, officialrad);
    stroke(#6B9371);
    fill(#6B9371);
    //head
    ellipse(x, y - radius/2.4, radius/1.3, radius/1.6);
    //body
    ellipse(x, y, radius, radius);
    //legs
    ellipse(x - radius/3, y + radius/3, radius/1.5, radius/1.5);
    ellipse(x + radius/3, y + radius/3, radius/1.5, radius/1.5);
    //feet
    rect(x - radius/2 - 1, y + radius/2 + 7, radius/1.5, radius/12);
    rect(x + radius/2 + 1, y + radius/2 + 7, radius/1.5, radius/12);
    rect(x - radius/2, y + radius/2, radius/1.5, radius/12);
    rect(x + radius/2, y + radius/2, radius/1.5, radius/12);
    rect(x - radius/2 + 1, y + radius/2 - 8, radius/1.5, radius/12);
    rect(x + radius/2 - 1, y + radius/2 - 8, radius/1.5, radius/12);
    //helmet
    fill(225, 225, 225, 160);
    stroke(0);
    ellipse(x, y - radius/1.75, radius/.9, radius/1.1);
  }
  
}
