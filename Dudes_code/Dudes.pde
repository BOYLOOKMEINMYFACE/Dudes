public class Dudes {
  private PVector vPos, vDir, otherPos;
  private float velocity;

  private color dudeColor;
  private float r;

  private boolean love; // True is love , False is hate

  public Dudes(color dudeColor, float r, boolean emo) {
    this.r = r;
    this.dudeColor = dudeColor;
    love = emo;

    vPos = new PVector(random(this.r, 400 - this.r), random(this.r, 400 - this.r));
    if (love){
      vDir = new PVector(random(3, 5), random(3, 5));
    } else {
      vDir = new PVector(random(6, 8), random(6, 8));
    }
    velocity = vDir.mag();
  }

  public void update(Dudes other) {
    //gets the other dude's position
    otherPos = other.getPos();
    
    //check the love hate relationship
    //love means the dude will follow the other 
    //hate means it will go how it wants
    checkLove();
    
    //moves the dude
    vPos.add(vDir);
    
    //check to see if it hits another dude or the wall
    updateBounce(other);
  }

  //redraw the dudes
  public void show() {
    fill(dudeColor);
    circle(vPos.x, vPos.y, r * 2);
  }
  
  //getter functions to grab the other dude's position
  public PVector getPos() {
    return vPos;
  }

  public float getRadius() {
    return r;
  }

  //main function for updating potential bounces
  private void updateBounce(Dudes other) {
    otherPos = other.getPos();
    updateCollision(other);
    updateWall();
  }
  
  //check collision and update the movement
  private void updateCollision(Dudes other) {
    if (collide(other)) {
      afterCollision();
    }
  }
  
  //checking collision
  private boolean collide(Dudes other) {
    float otherR = other.getRadius();
    float dist = dist(vPos.x, vPos.y, otherPos.x, otherPos.y);
    if ( dist <= (r + otherR)) {
      return true;
    }
    return false;
  }
  
  //changing the dude's movement after colliding with another dude
  private void afterCollision() {
    float angle = PVector.angleBetween(vPos, otherPos);
    vDir.rotate(180-angle);
    vPos.add(vDir);
  }
  
  //make sure dudes bounce off of walls
  private void updateWall() {
    if (vPos.x - r <= 0 || vPos.x + r >= 400) {
      vDir.set(-vDir.x, vDir.y);
    }
    if (vPos.y - r <= 0 || vPos.y + r >= 400) {
      vDir.set(vDir.x, -vDir.y);
    }
  }
  
  //change the path for lover dudes
  private void checkLove() {
    if (love) {
      vDir.set(otherPos.x - vPos.x, otherPos.y - vPos.y ).normalize().mult(velocity);
    }
  }
}
