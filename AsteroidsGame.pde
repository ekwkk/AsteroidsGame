SpaceShip astroBoy = new SpaceShip();
ArrayList <Asteroid> aster = new ArrayList <Asteroid>();
Star[] twinkle = new Star[200];
// Bullets bulls = new Bullets(astroBoy);

public void setup() 
{
  size(600,600);
  for (int i = 0; i < twinkle.length; i++)
  {
    twinkle[i] = new Star();
  }

  for (int i = 0; i < 10; i++)
  {
    aster.add(new Asteroid());
  }
}





public void draw() 
{
  background(0);
  for (int i = 0; i < twinkle.length; i++)
  {
    twinkle[i].show();
  }


  for (int i = 0; i < aster.size(); i++)
  {
    aster.get(i).show();
    aster.get(i).move();

    if (dist(astroBoy.getX(),astroBoy.getY(),aster.get(i).getX(),aster.get(i).getY()) < 20)
      aster.remove(i);
  }
  
  // for (int i = 0; i < aster.size(); i++)
  // {
  //   for (int j = 0; j < bulls.size(); j++)
  //   {
  //     if (dist(???) < 20)
  //     {
  //       aster.remove(i);
  //       bulls.remove(j);
  //       break;
  //     }
  //   }
  // }
   // bulls.show();
    astroBoy.show();
    astroBoy.move();
}


public void keyPressed() 
{
    if (key == CODED) 
    {
        if (keyCode == LEFT)
          astroBoy.rotate(-20);
        if (keyCode == RIGHT)
          astroBoy.rotate(20);
        if (keyCode == UP)
        {
          astroBoy.accelerate(0.2);
        }
        if (keyCode == DOWN)
        {
         astroBoy.setDirectionX(0);
         astroBoy.setDirectionY(0);
         astroBoy.setX((int)(Math.random()*600));
         astroBoy.setY((int)(Math.random()*600));
         astroBoy.setPointDirection((int)(Math.random()*360));
        }
    }

    // if (key == ' ')
    // {
    //   dot.move();
    // }

}






// class Bullets extends Floater
// {
//   public void setX(int x) {myCenterX = x;}
//   public int getX() {return (int)myCenterX;}
//   public void setY(int y) {myCenterY = y;}
//   public int getY() { return (int)myCenterY;}
//   public void setDirectionX(double x) {myDirectionX = x;}
//   public double getDirectionX() {return myDirectionX;}
//   public void setDirectionY(double y) {myDirectionY = y;}
//   public double getDirectionY() {return myDirectionY;}
//   public void setPointDirection(int degrees) {myPointDirection = degrees;}
//   public double getPointDirection() { return myPointDirection;}




//   public Bullets(SpaceShip theShip)
//   {
//     setX(theShip.getX());
//     setY(theShip.getY());
//     setPointDirection((int)(theShip.getPointDirection()));
//     double dRadians = getPointDirection()*(Math.PI/180);
//     setDirectionX(5*Math.cos(dRadians) + theShip.getDirectionX());
//     setDirectionY(5*Math.sin(dRadians) + theShip.getDirectionY());
//   }

//   public void show()
//   {
//     noStroke();
//     color(255);
//     ellipse((float)(getX()), (float)(getY()), 8, 8);
//   }
// }






class Asteroid extends Floater
{
  private int rotSpeed;

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





  public Asteroid()
  {
    rotSpeed = (int)(Math.random()*8-4);

    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -20;
    yCorners[0] = -15;
    xCorners[1] = 7;
    yCorners[1] = -15;
    xCorners[2] = 13;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10;
    xCorners[4] = -20;
    yCorners[4] = 15;
    xCorners[5] = -5;
    yCorners[5] = 0;



      myColor = color(128,128,128);
      setX((int)(Math.random()*600));
      setY((int)(Math.random()*600));
      setDirectionX((int)(Math.random()*8-4));
      setDirectionY((int)(Math.random()*8-4));
      setPointDirection((int)(Math.random()*360));
  }




  public void move()
  {
    rotate(rotSpeed);       
    super.move();
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

      myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
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

  private int myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255), 120);

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

