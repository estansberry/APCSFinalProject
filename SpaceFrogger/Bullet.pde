public class Bullet extends Entity{
  public color c;
  public Bullet(float X,float Y,float DX,float DY,float rad, color col){
   x = X;
   y = Y;
   dx = DX;
   dy = DY;
   radius = rad;
   c = col;
  }
}

public class FBullet extends Bullet{
  public FBullet(float X,float Y,float DX,float DY,float rad,color col){
   super(X,Y,DX,DY,rad,col);
  }
  public void move(){
    //Amount is subject to change
    this.y -= dy;
  }
  public void display(){
    
  }
}

public class SBullet extends Bullet{
  public SBullet(float X,float Y,float DX,float DY,float rad,color col){
   super(X,Y,DX,DY,rad,col);
  }
  public void move(){
    //Amount is subject to change
    this.y += dy;
  }
  public void display(){
    
  }
}
