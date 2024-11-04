public class Dudes {
  PVector vPos, vDir;

  private color dudeColor;
  private float r;

  private boolean love; // True is love , False is hate
  private boolean otherLove;

  public Dudes(color dudeColor, float r, boolean emo) {
    this.r = r;
    this.dudeColor = dudeColor;

    vPos = new PVector(random(this.r, 400 - this.r), random(this.r, 400 - this.r));
    vDir = new PVector(random(2, 5), random(2, 5));
  }

  public void update(Dudes other) {
    vPos.add(vDir);
    checkBound();
  }
  public void show() {
    fill(dudeColor);
    circle(vPos.x, vPos.y, r * 2);
    println(vPos.x);
    println(vPos.y);
  }

  private void checkBound() {
    if (vPos.x - r <= 0 || vPos.x + r >= 400) {
      vDir.set(-vDir.x , vDir.y);
    }
    if (vPos.y - r <= 0 || vPos.y + r >= 400) {
      vDir.set(vDir.x , -vDir.y);
    }
  }
}
