public class Bullet extends Entity{
  public color c;
  public Bullet(float X,float Y,float DY,float rad, color col){
   x = X;
   y = Y;
   dy = DY;
   radius = rad;
   c = col;
  }
}

public class FBullet extends Bullet{
  public FBullet(float X,float Y,float DY,float rad,color col){
   super(X,Y,DY,rad,col);
  }
  public void move(){
    //Amount is subject to change
    this.y -= dy;
  }
  public void display(){
    noStroke();
    fill(c);
    ellipse(x,y,radius*2,radius*2);
  }
}

public class SBullet extends Bullet{
  public SBullet(float X,float Y,float DY,float rad,color col){
   super(X,Y,DY,rad,col);
  }
  public void move(){
    //Amount is subject to change
    this.y += dy;
  }
  public void display(){
    
  }
}
