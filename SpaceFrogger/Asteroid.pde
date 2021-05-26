public class Asteroid extends Entity{
  public int hp;
  public color c;
  
  public Asteroid(float X,float Y,float DX,float DY,float rad,color col){
   x = X;
   y = Y;
   dx = DX;
   dy = DY;
   radius = rad;
   hp = 3;
   c = col;
  }
  
  public int gethp(){
    return hp;
  }
  
  public void move(){
    //Amount is subject to change
    this.x -= 10;
  }
  
  public void display(){
    
  }
}
