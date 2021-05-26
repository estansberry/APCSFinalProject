public class Frog extends Entity{
  public int hp;
  
  public Frog(double X,double Y,double DX,double DY,double rad){
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
    
  }
  
}
