public class Ship extends Entity{
  public Ship(float X,float Y,float DX,float DY,float rad){
   x = X;
   y = Y;
   dx = DX;
   dy = DY;
   radius = rad;
  }
  
  public void shoot(){
  }  
  
  public void display(){
    size(1000,1000);
    //float radius = 75;
    //float x = 500;
    //float y = 200;
    ellipseMode(CENTER);
    rectMode(CENTER);
    fill(0, 0, 0, 0);
    ellipse(x, y, radius, radius);
    fill(#542A83);
    stroke(#542A83);
    rect(x, y - radius/6, radius/2.75, radius*.6);
    rect(x, y, radius*.9, radius/15);
    rect(x, y, radius/7, radius*.8);
    //
    fill(#135F2B);
    stroke(#135F2B);
    triangle(x - radius/5.5, y - radius/6, x - radius/5.5, y - radius/2, x - radius/2.75, y - radius/2);
    triangle(x + radius/5.5, y - radius/6, x + radius/5.5, y - radius/2, x + radius/2.75, y - radius/2);
    //
    fill(225);
    stroke(#542A83);
    ellipse(x - radius/5.5, y - radius/6 + radius*.3, radius/5, radius/5);
    ellipse(x + radius/5.5, y - radius/6 + radius*.3, radius/5, radius/5);
    fill(0);
    ellipse(x - radius/5.5, y - radius/6 + radius*.3, radius/15, radius/15);
    ellipse(x + radius/5.5, y - radius/6 + radius*.3, radius/15, radius/15);
    //
    fill(225);
    ellipse(x - radius/2.75, y - radius/6 + radius*.15, radius/5, radius/5);
    ellipse(x + radius/2.75, y - radius/6 + radius*.15, radius/5, radius/5);
    fill(0);
    ellipse(x - radius/2.75, y - radius/6 + radius*.15, radius/15, radius/15);
    ellipse(x + radius/2.75, y - radius/6 + radius*.15, radius/15, radius/15);
    //
    fill(225);
    ellipse(x - radius/3.5, y - radius/6 - radius*.05, radius/5, radius/5);
    ellipse(x + radius/3.5, y - radius/6 - radius*.05, radius/5, radius/5);
    fill(0);
    ellipse(x - radius/3.5, y - radius/6 - radius*.05, radius/15, radius/15);
    ellipse(x + radius/3.5, y - radius/6 - radius*.05, radius/15, radius/15);
    //
    fill(225);
    ellipse(x, y + radius/3, radius/3, radius/3);
    fill(0);
    ellipse(x, y + radius/3, radius/9, radius/9);
  }
}
