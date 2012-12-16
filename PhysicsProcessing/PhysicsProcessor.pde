class PhysicsProcessor {
  PImage fricMap;
  circ[] circ;
  int cobj = 0;
  int col = 0;
  PhysicsProcessor() {
    fricMap = loadImage("friction.png");
    circ = new circ[100];
  }

  //Ellipse Create Funtions
  int cEllipse(float x, float y, float widt, float heigh, color colo, float xs, float ys) {
    circ[cobj] = new circ(x, y, widt, heigh, colo, xs, ys, false);
    cobj++;
    return cobj-1;
  }
    int cEllipse(float x, float y, float widt, float heigh, color colo, float xs, float ys, boolean stu) {
    circ[cobj] = new circ(x, y, widt, heigh, colo, xs, ys, stu);
    cobj++;
    return cobj-1;
  }
  int cEllipse(float x, float y, float widt, float heigh, color colo) {
    circ[cobj] = new circ(x, y, widt, heigh, colo, 0, 0, false);
    cobj++;
    return cobj-1;
  }
  int cEllipse(int x, int y, int widt, int heigh, color colo, int xs, int ys) {
    circ[cobj] = new circ(x, y, widt, heigh, colo, xs, ys, false);
    cobj++;
    return cobj-1;
  }
  int cEllipse(int x, int y, int widt, int heigh, color colo) {
    circ[cobj] = new circ(x, y, widt, heigh, colo, 0, 0, false);
    cobj++;
    return cobj-1;
  }
  void tick() {
    for (int i=0; i<cobj; i++) {
      float ixs = circ[i].xs;
      float iys = circ[i].ys;
      for (int j=0;j<cobj;j++) { 
        if(i != j) { // || abs(circ[j].x-circ[i].x) < circ[i].width || abs(circ[j].x-circ[i].x) < circ[j].width  || abs(circ[j].y-circ[i].y) < circ[i].height || abs(circ[j].y-circ[i].y) < circ[j].height
        if ((abs(circ[i].x-circ[j].x) < circ[i].width) && (abs(circ[i].y-circ[j].y) < circ[i].height) ) {
          
            println("Collision:" + col + " Between: "+i+" AND " + j + " The X Difference Is: " + abs(circ[i].x-circ[j].x)  + " The Y Difference Is: " + abs(circ[j].y-circ[i].y));
            col++;
            if(circ[j].stuck==false)circ[j].xs = (ixs-(ixs/3))+random(0,ixs/3);
            if(circ[i].stuck==false)circ[i].xs = ((ixs-(ixs/3))+random(0,ixs/3))*-1;
            if(circ[i].stuck==false)circ[i].x+=circ[i].xs*13;
            if(circ[j].stuck==false)circ[j].x+=circ[j].xs*3;
            if(circ[j].stuck==false)circ[j].ys = (ixs-(iys/3))+random(0,iys/3);
            if(circ[i].stuck==false)circ[i].ys = ((ixs-(iys/3))+random(0,iys/3))*-1;
            if(circ[i].stuck==false)circ[i].y+=circ[i].ys*13;
            if(circ[j].stuck==false)circ[j].y+=circ[j].ys*3;
          
        }
      }
      }
      if (circ[i].x+circ[i].width >= g.width || circ[i].x-circ[i].width <= 0) {
        println("Off Screen");
        circ[i].xs = ((ixs-(ixs/3))*-1)+random(0,ixs/3);
        //circ[i].x+=circ[i].xs*10;
        if(circ[i].x+circ[i].width >= g.width && circ[i].stuck == false)circ[i].x=g.width-circ[i].width;
        if(circ[i].x-circ[i].width <= 0 && circ[i].stuck == false)circ[i].x=0+circ[i].width;
      }
      if (circ[i].y+circ[i].height >= g.height || circ[i].y-circ[i].height <= 0) {
        println("Off Screen");
        circ[i].ys = ((iys-(iys/3))+random(0,iys/3))*-1;
                      if(circ[i].y+circ[i].height >= g.height && circ[i].stuck == false)circ[i].y=g.height-circ[i].height;
        if(circ[i].y-circ[i].height <= 0 && circ[i].stuck == false)circ[i].y=0+circ[i].height;
      }
      //Friction
      if(circ[i].xs < 0) circ[i].xs+=0.01;
      if(circ[i].xs > 0) circ[i].xs-=0.01;
            if(circ[i].ys < 0) circ[i].ys+=0.01;
      if(circ[i].ys > 0) circ[i].ys-=0.01;
      if(circ[i].stuck==false)circ[i].x+=circ[i].xs;
      if(circ[i].stuck==false)circ[i].y+=circ[i].ys;
    }
  }
  void draw() {
    
    s.background(255);
    String tex="";
    tex+="Circles\n";
    for(int i=0;i<cobj;i++) {
      circ[i].draw();
      tex+="   Circle: " + i +"\n";
      tex+="      X: " + circ[i].x+"\n";
      tex+="      Y: " + circ[i].y+"\n";
      tex+="      Xv: " + circ[i].xs+"\n";
      tex+="      Yv: " + circ[i].ys+"\n";
      tex+="      Stuck: " + circ[i].stuck+"\n";
    }
    s.fill(0);
    s.stroke(0);
    s.text(tex,15,15);
    s.redraw();
  }
  //Ellipse Class Definitions
  class circ {
    float x, y, width, height, xs, ys;
    color col;
    boolean stuck;
    circ(float _x, float _y, float _widt, float _heigh, color _colo, float _xs, float _ys, boolean _stu) {
      x = _x;
      y = _y;
      width = _widt;
      height = _heigh;
      col = _colo;
      xs = _xs;
      ys = _ys;
      stuck = _stu;
    }
    void draw() {
      color ostoke = g.strokeColor;
      color ofill = g.fillColor;
      float stwe = g.strokeWeight;
      stroke(255);
      fill(col);
      strokeWeight(.1);
      ellipse(x, y, width, height);
      stroke(ostoke);
      fill(ofill);
      strokeWeight(stwe);
    }
  }
}

