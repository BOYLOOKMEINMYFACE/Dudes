/**
 * Read This!!
 * This code generates dudes that runs around the canvas.
 * When dudes hit the wall, they will bounce off.
 * they will also bounce off of each other.
 * Except for the ones in love with another Dude.
 * Dudes have love hate relationships and they can be assigned a loved one.
 * If they are haters, they will only roam around randomly.
 * If they are lovers, they will chase the dude they love.
 * There are very strong competitions between the lovers,
 * So a dude can only be loved by one other dude.
 * Sometimes when dudes are forced into a corner, the lovers get them.
 */

Dude dude1 = new Dude(40, true);
Dude dude2 = new Dude(25, false);
Dude dude3 = new Dude(40, true);
Dude dude4 = new Dude(25, false);
Dude dude5 = new Dude(40, false);
Dude dude6 = new Dude(25, false);

Dude[] allDudes = {dude1, dude2, dude3, dude4, dude5, dude6};

void setup() {
  size(800,800);
  for (int i = 0; i < allDudes.length; i++) {
    allDudes[i].setDudes(allDudes);
  }
  dude1.setLoveObj(dude2);
  dude3.setLoveObj(dude4);
}

void draw() {
  background(0);
  for (int i = 0; i < allDudes.length; i++) {
    allDudes[i].update();
  }
  for (int i = 0; i < allDudes.length; i++) {
    allDudes[i].show();
  }
}
