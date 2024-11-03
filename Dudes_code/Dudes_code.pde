Dudes dude1 = new Dudes(25 , "love");
Dudes dude2 = new Dudes(25 , "hate");

void setup() {
  size(400,400);
}

void draw(){
  background(0);
  dude1.update();
  dude1.show();
  dude2.update();
  dude2.show();
}
