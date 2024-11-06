Dudes dude1 = new Dudes(#FFFFFF, 25 , true);
Dudes dude2 = new Dudes(#CCCCCC, 25 , false);

void setup() {
  size(400,400);
}

void draw(){
  background(0);
  dude1.update(dude2);
  dude2.update(dude1);
  dude1.show();
  dude2.show();
}
