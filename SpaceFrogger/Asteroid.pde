public class Asteroid extends Entity{
  public color c;
  public boolean colliding;
  
  public Asteroid(float Y,float DX,float rad,color col){
   x = 1100;
   y = Y;
   dx = DX;
   radius = rad;
   c = col;
   colliding = false;
  }
  
  public void move(){
    //Amount is subject to change
    this.x -= dx;
  }
  
  public void display(){
    noStroke();
    fill(c);
    ellipse(x,y,radius*2,radius*2);
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
