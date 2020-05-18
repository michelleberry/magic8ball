import java.util.Random;

class eightball{
  
  float xpos; 
  float ypos; 
  
  float aPt; 
  float bPt; 
  float cPt;
  
  float xlimit; 
  float xleftlimit; 
  boolean right; //right being true means ball is moving right
  
  String message; 
  
  Random rand = new Random();
  
  eightball(){
    xpos = 450; 
    ypos = 450; 
    
    aPt = 300; 
    bPt = 600; 
    cPt = 450; 
    
    xleftlimit = xpos-15; 
    xlimit = xpos+15; 
    right = true; 
    
    message = " "; 
  }
  
  void display(){
     refresh();  
    
    //8ball
    fill(0,0,0);
    circle(xpos,ypos,800);
  
    //white lining
    fill(255);
    circle(xpos,ypos,365);
  
    //inner black inky stuff
    fill(0,0,0);
    circle(xpos, ypos, 350); 
  
    //triangle die
    fill(238,130,238);
    noStroke();
    triangle(aPt, 360, bPt, 360, cPt, 624);
    
    //message
    fill(0,0,0);
    stroke(90);
    textSize(25);
    text(message, 400,400);
    
  }
  
  void refresh(){
    background(150); 
    //text instructions
    fill(255); 
    stroke(90);
    textSize(40);
    text("Click to shake magic 8 ball ", 10 ,50);
  }
  
  void shake(){  
    if(right == true){
      xpos++; 
      aPt++; 
      bPt++; 
      cPt++;
      if(xpos == xlimit){
        right = false; 
      }
    } else if (right == false){
      xpos--; 
      aPt--; 
      bPt--; 
      cPt--; 
      if(xpos == xleftlimit){
        right = true; 
      }
    }
  }
   
  void centre(){
    xpos = 450; 
    ypos = 450; 
    
    aPt = 300; 
    bPt = 600; 
    cPt = 450; 
    
    xleftlimit = xpos-15; 
    xlimit = xpos+15; 
    right = true;
  }
  
  void changeMsg(){
    
    int n = rand.nextInt(8); 
    
    if (n == 1){
      message = "concentrate \n and ask \nagain";
    } else if (n == 2){
      message = "jeez\ncalm down";
    } else if(n == 3){
      message = "nah bro";
    }  else if(n == 4){
      message = "it's a sure\nthing";     
    }  else if(n == 5){
      message = "stop \nthat\ntickles";      
    }  else if(n == 6){
      message = "most\nlikely";
    } else {
      message = "not\nlooking\ngood";
    }
  }
  
  void clearMsg(){
    message = " "; 
  }
  
} //class eightBall ends

eightball myBall; 

void setup(){ 
  size(900,900);
  background(150); 
  frameRate(150); 
  
  myBall = new eightball(); 
}

boolean doit = false; 
int timer = 0; 

void draw(){
  
  myBall.display(); 
  
  if(doit == true){ 
    myBall.clearMsg();
    myBall.shake();
    timer++; 
  }
  
  if(timer == 205){
   doit = false; 
   myBall.centre(); 
   myBall.changeMsg(); 
   myBall.display(); 
   
   timer = 0;
  }

     
}

void mouseClicked(){
  doit = true; 
   
}
