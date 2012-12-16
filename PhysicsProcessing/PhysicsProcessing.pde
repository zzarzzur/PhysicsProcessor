//Create the secondary window to display physics data
PFrame f;
secondApplet s;
PhysicsProcessor physics;
int balli,redi; //Varibles for storing Physic IDs
int px,py;
void setup() {
  size(640, 480);
    PFrame f = new PFrame(); //Create the new frame to display data
    physics = new PhysicsProcessor(); //Initialize the PhysicsProcessor
    balli = physics.cEllipse(width/2, height/2, 25.0, 25.0, color(125), 50000.0, 50000.0); //Declare new Ellipses
    redi = physics.cEllipse(width/2+100, height/2, 25.0, 25.0, color(255,0,0), 0.0, 0.0, true);//Declare new Ellipses
    //Previous mouseX and mouseY
      px = width/2+100;
  py = height/2;
}
void draw() {
  background(255);
  //Attribute one circle to the mouse
    physics.circ[redi].x = mouseX;
  physics.circ[redi].y = mouseY;
    physics.circ[redi].xs = mouseX-px;
  physics.circ[redi].ys = mouseY-py;
    physics.tick(); //Calculate Physics
  physics.draw(); //Draw Objects
  px = mouseX;
  py = mouseY;
}


//Just some Debugging
public class PFrame extends Frame {
    public PFrame() {
        setBounds(100,100,400,300);
        s = new secondApplet();
        add(s);
        s.init();
        show();
    }
}
public class secondApplet extends PApplet {
    public void setup() {
        size(400, 300);
        noLoop();
    }
    public void draw() {
    }
}
