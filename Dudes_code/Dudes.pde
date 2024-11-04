public class Dudes {
  private color dudeColor;
  private float r;

  public float x;
  private float vX;

  public float y;
  private float vY;

  private int state; // 1 is love , 0 is hate

  private float otherX;
  private float otherY;
  private float otherR;
  private float dis;
  private float otherState;


  public Dudes(color dudeColor, float r, int emo) {
    this.dudeColor = dudeColor;
    this.r = r;
    this.x = random(this.r, 400 - this.r);
    this.y = random(this.r, 400 - this.r);
    state = emo;

    vX = random(2, 5);
    vY = random(2, 5);
  }

  public void update(Dudes other) {
    move();

    //Grab the other dude's stat
    getOtherDude(other);

    //Check collision
    updateCollision();
    
    //Check if hits the wall
    checkBound();
  }

  public void show() {
    fill(dudeColor);
    circle(this.x, this.y, r * 2);
  }

  private void getOtherDude(Dudes other) {
    otherX = other.x;
    otherY = other.y;
    otherR = other.r;
    dis = dist(x, y, otherX, otherY);
    otherState = other.state;
  }

  private void move() {
    x += vX;
    y += vY;
  }

  private void updateCollision() {
    if ( dis <= r + otherR && (state + otherState < 2)) {
      vX *= -1;
      vY *= -1;
      x += vX;
      y += vY;
      show();
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
