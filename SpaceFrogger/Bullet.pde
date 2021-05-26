public class Bullet extends Entity{
  public color c;
  public Bullet(double X,double Y,double DX,double DY,double rad, color col){
   x = X;
   y = Y;
   dx = DX;
   dy = DY;
   radius = rad;
   c = col;
  }
}

public class FBullet extends Bullet{
  public FBullet(double X,double Y,double DX,double DY,double rad,color col){
   super(X,Y,DX,DY,rad,col);
  }
  public void move(){
    //Amount is subject to change
    this.y -= 10;
  }
  public void display(){
    
  }
}

public class SBullet extends Bullet{
  public SBullet(double X,double Y,double DX,double DY,double rad,color col){
   super(X,Y,DX,DY,rad,col);
  }
  public void move(){
    //Amount is subject to change
    this.y += 10;
  }
  public void display(){
    
  }
}
