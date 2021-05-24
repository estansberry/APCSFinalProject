public class Bullet extends Entity{
  public Bullet(double X,double Y,double DX,double DY,double rad){
   x = X;
   y = Y;
   dx = DX;
   dy = DY;
   radius = rad;
  }
}

public class FBullet extends Bullet{
  public FBullet(double X,double Y,double DX,double DY,double rad){
   super(X,Y,DX,DY,rad);
  }
  public void move(){
    //Amount is subject to change
    this.y -= 10;
  }
}

public class SBullet extends Bullet{
  public SBullet(double X,double Y,double DX,double DY,double rad){
   super(X,Y,DX,DY,rad);
  }
  public void move(){
    //Amount is subject to change
    this.y += 10;
  }
}
