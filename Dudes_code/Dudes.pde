public class Dudes {
  private PVector vPos, vDir;

  private color dudeColor;
  private float r;

  private boolean love; // True is love , False is hate
  private boolean otherLove;

  public Dudes(color dudeColor, float r, boolean emo) {
    this.r = r;
    this.dudeColor = dudeColor;
    love = emo;

    vPos = new PVector(random(this.r, 400 - this.r), random(this.r, 400 - this.r));
    vDir = new PVector(random(2, 5), random(2, 5));
  }

  public void update(Dudes other) {
    vPos.add(vDir);
    checkCollision(other);
    checkWall();
  }
  
  public void show() {
    fill(dudeColor);
    circle(vPos.x, vPos.y, r * 2);
  }
  
  public PVector getPos(){
    return vPos;
  }
  
  public float getRadius(){
    return r;
  }
  
  private void checkCollision(Dudes other){
    PVector otherV = other.getPos();
    float otherR = other.getRadius();
    
    if ( vPos.sub(otherV).mag() <= (r + otherR) && !(love && otherLove)) {
      
    }
  
  }
  private void checkWall() {
    if (vPos.x - r <= 0 || vPos.x + r >= 400) {
      vDir.set(-vDir.x , vDir.y);
    }
    if (vPos.y - r <= 0 || vPos.y + r >= 400) {
      vDir.set(vDir.x , -vDir.y);
    }
  }
}
