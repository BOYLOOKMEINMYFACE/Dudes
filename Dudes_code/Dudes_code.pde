Dudes dude1 = new Dudes(#FFFFFF, 25 , true);
Dudes dude2 = new Dudes(#CCCCCC, 40 , false);
Dudes dude3 = new Dudes(#111111, 25 , true);
Dudes dude4 = new Dudes(#555555, 40 , false);

Dudes[] allDudes = {dude1 , dude2 , dude3 , dude4};

void setup() {
  size(800,800);
  for (int i = 0; i < allDudes.length; i++) {
    allDudes[i].setDudes(allDudes);
  }
}

void draw(){
  background(0);
  dude1.update(dude2);
  dude2.update(dude1);
  dude3.update(dude4);
  dude4.update(dude3);
  
  for (int i = 0; i < allDudes.length; i++) {
    allDudes[i].show();
  }
 
}
