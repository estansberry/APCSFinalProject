public class Ship extends Entity{
  public boolean colliding;
  
  public Ship(float DX, float DY, int order){
   x = 70*order + 500;
   y = 200;
   dx = DX;
   dy = DY;
   radius = 50;
   colliding = false;
  }
  
  public void shoot(){
  }
  
  public void setDX(float num){
    dx = num;
  }
  
  public void setDY(float num){
    dy = num;
  }
  
  public void move(){
    x += dx;
    y+= dy;
  }
  
  public void display(){
    int rad = 75;
    size(1000,1000);
    ellipseMode(CENTER);
    rectMode(CENTER);
    fill(0, 0, 0, 0);
    //ellipse(x, y, rad, rad);
    fill(#542A83);
    stroke(#542A83);
    rect(x, y - rad/6, rad/2.75, rad*.6);
    rect(x, y, rad*.9, rad/15);
    rect(x, y, rad/7, rad*.8);
    //
    fill(#135F2B);
    stroke(#135F2B);
    triangle(x - rad/5.5, y - rad/6, x - rad/5.5, y - rad/2, x - rad/2.75, y - rad/2);
    triangle(x + rad/5.5, y - rad/6, x + rad/5.5, y - rad/2, x + rad/2.75, y - rad/2);
    //
    fill(225);
    stroke(#542A83);
    ellipse(x - rad/5.5, y - rad/6 + rad*.3, rad/5, rad/5);
    ellipse(x + rad/5.5, y - rad/6 + rad*.3, rad/5, rad/5);
    fill(0);
    ellipse(x - rad/5.5, y - rad/6 + rad*.3, rad/15, rad/15);
    ellipse(x + rad/5.5, y - rad/6 + rad*.3, rad/15, rad/15);
    //
    fill(225);
    ellipse(x - rad/2.75, y - rad/6 + rad*.15, rad/5, rad/5);
    ellipse(x + rad/2.75, y - rad/6 + rad*.15, rad/5, rad/5);
    fill(0);
    ellipse(x - rad/2.75, y - rad/6 + rad*.15, rad/15, rad/15);
    ellipse(x + rad/2.75, y - rad/6 + rad*.15, rad/15, rad/15);
    //
    fill(225);
    ellipse(x - rad/3.5, y - rad/6 - rad*.05, rad/5, rad/5);
    ellipse(x + rad/3.5, y - rad/6 - rad*.05, rad/5, rad/5);
    fill(0);
    ellipse(x - rad/3.5, y - rad/6 - rad*.05, rad/15, rad/15);
    ellipse(x + rad/3.5, y - rad/6 - rad*.05, rad/15, rad/15);
    //
    fill(225);
    ellipse(x, y + rad/3, rad/3, rad/3);
    fill(0);
    ellipse(x, y + rad/3, rad/9, rad/9);
  }
  
  public void collide(ArrayList<FBullet> bullets){
    for(int i = 0; i < bullets.size(); i++){
     FBullet holder = bullets.get(i);
     double distance = Math.sqrt(Math.pow((x - holder.x),2) + Math.pow((y - holder.y),2));
     double radii = radius + holder.radius;
     if(distance < radii){
      colliding = true;
      bullets.remove(i);
     }
    }
   }
}
