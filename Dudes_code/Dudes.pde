public class Dudes {
  private float r;

  public  float x;
  private float vX;
  private float vXf;

  public float y;
  private float vY;
  private float vYf;

  private int state; // 1 is love , 0 is hate

  private float otherX;
  private float otherY;
  private float otherR;
  private float dis;


  public Dudes(float r, int emo) {
    this.r = r;
    this.x = random(this.r, 400 - this.r);
    this.y = random(this.r, 400 - this.r);
    state = emo;

    vXf = int(random(2, 5));
    vYf = int(random(2, 5));
    while (vXf == vYf) {
      vYf = int(random(2, 5));
    }

    vX = vXf;
    vY = vYf;
  }

  public void update(Dudes other) {
    //Move
    x += vX;
    y += vY;

    dis = dist(x, y, otherX, otherY);

    otherX = other.x;
    otherY = other.y;
    otherR = other.r;

    //Check if hits the wall
    checkBound();
    
    //Check collision
    updateCollision();
  }

  public void show() {
    fill(255, 255, 255);
    circle(this.x, this.y, r * 2);
  }
  
  private void updateCollision() {
    if ( dis <= r + otherR){
      float overlap = abs(r + otherR - dis);
      vX *= -1;
      vY *= -1;
      x += vX + overlap;
      y += vY + overlap;
    }
  }
  
  private void checkBound() {
    if (x - r <= 0 || x + r >= 400) {
      vX *= -1;
    }
    if (y - r <= 0 || y + r >= 400) {
      vY *= -1;
    }
  }
}
