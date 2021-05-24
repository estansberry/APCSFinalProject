public class Asteroid extends Entity{
  public int hp;
  
  public Asteroid(double X,double Y,double DX,double DY,double rad){
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
  
  public void move(){
    //Amount is subject to change
    this.x -= 10;
  }
}
