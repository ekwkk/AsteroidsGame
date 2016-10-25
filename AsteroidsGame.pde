SpaceShip astroBoy = new SpaceShip();
Star[] twinkle = new Star[200];

public void setup() 
{
  size(600,600);
  for (int i = 0; i < twinkle.length; i++)
  {
    twinkle[i] = new Star();
  }
}





public void draw() 
{
  background(0);
  for (int i = 0; i < twinkle.length; i++)
  {
    twinkle[i].show();
  }
  astroBoy.show();
  astroBoy.move();
  
  
}


public void keyPressed() 
{
    // if (key == CODED) 
    // {
    //     if (keyCode == LEFT)
    //       astroBoy.rotate(-10);
    //     if (keyCode == RIGHT)
    //       astroBoy.rotate(10);
    // }

    if (key == 'w') 
      astroBoy.rotate(-10);

    if (key == 's') 
      astroBoy.rotate(10);

    if(key == 'h')
    {
       astroBoy.setDirectionX(0);
       astroBoy.setX((int)(Math.random()*600));
       astroBoy.setY((int)(Math.random()*600));
    }


    if(key == 'a')
    {
      astroBoy.accelerate(0.4);
    }
}


class SpaceShip extends Floater 
{   
    public void setX(int x) {myCenterX = x;}
    public int getX() {return (int)myCenterX;}
    public void setY(int y) {myCenterY = y;}
    public int getY() { return (int)myCenterY;}
    public void setDirectionX(double x) {myDirectionX = x;}
    public double getDirectionX() {return myDirectionX;}
    public void setDirectionY(double y) {myDirectionY = y;}
    public double getDirectionY() {return myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;}
    public double getPointDirection() { return myPointDirection;}


    public SpaceShip()
    {
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16;
      yCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = -4;
      yCorners[3] = 0;

      myColor = color(174,198,207);
      setX(300);
      setY(300);
      setDirectionX(0);
      setDirectionY(0);
      setPointDirection(0);
    }

}





class Star
{
  private int myX, myY;
  public Star() 
  { 
    myX = (int)(Math.random()*600);
    myY = (int)(Math.random()*600);
  }

  private int myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));

  public void show()
  {
    noStroke();
    fill(myColor);
    ellipse(myX, myY, 5, 5);
  }
}







































//DO NOT TOUCH


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   



  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   



  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   



  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

