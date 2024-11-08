public class Dude {

  private Dude[] allDudes;

  private PVector vPos, vDir;
  private float velocity;

  private int R, G, B;
  private float r;

  private boolean love; // true is lover , false is hater
  private Dude loveObj;

  private Dude collider; // the dude that is being collided on

  // constructor of Dude class
  public Dude(float r, boolean emo) {
    this.r = r;
    love = emo;
    setColor();
    initializeDude();
  }

  private void initializeDude() { //assigns birth position and speed
    vPos = new PVector(random(r, 800 - r), random(r, 800 - r));

    if (love) { // when they are lovers, they reaction slow
      vDir = new PVector(random(3, 5), random(3, 5));
    } else { // haters are good at running away
      vDir = new PVector(random(6, 8), random(6, 8));
    }

    velocity = vDir.mag();
  }

  private void setColor() {
    R = int(random(0, 255));
    G = int(random(0, 255));
    B = int(random(0, 255));
  }

  public void update() {
    //check the love hate relationship
    //love means the dude will follow the other
    //hate means it will go how it wants
    checkLove();

    //moves the dude
    vPos.add(vDir);

    //check to see if it hits another dude or the wall
    updateBounce();
  }

  //redraw the dudes
  public void show() {
    fill(R, G, B);
    circle(vPos.x, vPos.y, r * 2);
  }

  //change the path for lover dudes
  private void checkLove() {
    if (love) { // adjusts @param vDir to chase the dude it loves
      vDir.set(loveObj.vPos.x - vPos.x, loveObj.vPos.y - vPos.y ).normalize().mult(velocity);
    }
  }

  //main function for updating potential bounces
  private void updateBounce() {
    if (collide()) {
      updateCollision();
    }
    updateWall();
  }

  //changing the dude's movement after colliding with another dude
  private void updateCollision() {
    // link for vector reflection: https://www.youtube.com/watch?v=BCmFsYFln2k
    PVector normalVector = PVector.sub(vPos, collider.vPos).normalize();
    PVector bounce = vDir.copy().sub(normalVector.mult(2 * vDir.dot(normalVector)));
    vDir.set(bounce);
    vPos.add(vDir);
  }

  //checking collision of the dude with all other dudes
  private boolean collide() {
    boolean collide = false;
    for (int i=0; i < allDudes.length; i++) {
      if (!collide){
        collide = checkOneCollision(i);
      }
    }
    return collide;
  }
  
  // check whether the dude collides with one of the dudes
  private boolean checkOneCollision(int i) {
    float otherR = allDudes[i].getRadius();
    float dist = dist(vPos.x, vPos.y, allDudes[i].vPos.x, allDudes[i].vPos.y);
    if (dist <= (r + otherR) && dist != 0 && allDudes[i] != this) {
      collider = allDudes[i];
      return true;
    } 
    return false;
  }

  //make sure dudes bounce off of walls
  private void updateWall() {
    if (vPos.x - r <= 0 || vPos.x + r >= 800) {
      vDir.set(-vDir.x, vDir.y);
    }
    if (vPos.y - r <= 0 || vPos.y + r >= 800) {
      vDir.set(vDir.x, -vDir.y);
    }
  }

  //Setters and getters
  public void setLoveObj(Dude loveObj) { //change which one the dude loves
    this.loveObj = loveObj;
  }

  public void setDudes(Dude[] allDudes) { //Telling the object all the dudes
    this.allDudes = allDudes;
  }

  //getter functions to grab the other dude's position
  public PVector getPos() {
    return vPos;
  }

  public float getRadius() {
    return r;
  }
}
