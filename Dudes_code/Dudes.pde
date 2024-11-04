public class Dudes {
  private color dudeColor;
  private float r;

  public float x;
  private float vX;

  public float y;
  private float vY;

  private boolean love; // True is love , False is hate
  private boolean otherLove;

  private float otherX;
  private float otherY;
  private float otherR;
  private float dis;


  public Dudes(color dudeColor, float r, boolean emo) {
    this.dudeColor = dudeColor;
    this.r = r;
    this.x = random(this.r, 400 - this.r);
    this.y = random(this.r, 400 - this.r);
    love = emo;

    vX = random(2, 10);
    vY = random(2, 10);
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
    otherLove = other.love;
  }

  private void move() {
    x += vX;
    y += vY;
  }

  private void updateCollision() {
    if ( dis <= r + otherR && !(love && otherLove)) {
      vX *= -1;
      vY *= -1;
      x += vX;
      y += vY;
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
