public class Dudes{
  private float r;
  private float x;
  private float Vx;
  private float y;
  private float Vy;
  private String state;
  
  public Dudes(float r , String emo){
    this.r = r;
    this.x = random(this.r , 400 - this.r);
    this.y = random(this.r , 400 - this.r);
    state = emo;
    
    Vx = int(random(2,5));
    Vy = int(random(2,5));
    while (Vy == Vx){
      Vy = int(random(2,5));
    }
  }
  
  public void update(){
    //Move
    x += Vx;
    y += Vy;
    
    //Check if hits the wall
    if (x - r <= 0 || x + r >= 400){
      Vx *= -1;
    }
    if (y - r <= 0 || y + r >= 400){
      Vy *= -1;
    }
  }
  
  public void show(){
    fill(255,255,255);
    circle(this.x , this.y , r * 2);
  }
}
