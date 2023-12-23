* Developed by [SHINA ANAFI]
 * Student Number [23358986]





PImage scene,bottle,rubbish_bin,seeds;                          // Variable to store information about an image
                     // Start bin in the middle of the screen
int ScreenWidth = 600;
int   rubbishBin_x = width/2; 
int bottleS_x;
int bottleS_y;
int speed = 0;
int seeds_x;
int seeds_y;

int score=0,lives=3;                   // Set initial score and number of lives
int quit_flag=0; 


void setup()                           // Entry point (start of program), runs once
{
  size(360,240,P2D);                   // Create a Window, must be same size as scene
  int   rubbishBin_x = width/2;                      // Start bin in the middle of the screen

   scene = loadImage("240_F_526304237_fyJTnrJ8ft1fEmoB3mkgQZqgPX3FuMQw.jpg");// load backiground image
  
  bottle = loadImage("bottles.png");        // load image of bottle image
  rubbish_bin = loadImage("360_F_170934520_TopSomxiXUVUxu0nN9K7LoidrEgJ53lO.jpg"); 
  seeds = loadImage("seeds.png");
   
  textureMode(NORMAL);                 
  blendMode(BLEND);                    // States how to mix a new image with the one behind it 
  noStroke();                          // Do not draw a line around objects
  
  bottleS_x =(int)random(width);         // Choose drop starting position
  bottleS_y = 90;

}



void draw() 
{
  
  background(scene);// Display background image referenced by scene
  
           // bin part
  rubbishBin_x = width/2;
  
  pushMatrix();                      
  translate(mouseX,height-20);          
  beginShape();                      
  texture(rubbish_bin);                   
  vertex( -20,  -20,   0,   0);      
  vertex(20,   -20,  1,   0);       
  vertex(20, 20,  1,  1);           
  vertex( -20, 20,   0,  1);
  endShape(CLOSE);            
  popMatrix();                     

            // bottle part

 pushMatrix();  
  translate(bottleS_x,bottleS_y);
  beginShape();                    
  texture(bottle);                     
  vertex( -20,  -30,   0,   0);      
  vertex(20,   -30,  1,   0);       
  vertex(20, 30,  1,  1);            
  vertex( -20, 30,   0,  1);
  endShape(CLOSE);            
  popMatrix(); 
                 //seed part
  pushMatrix();  
  translate(seeds_x,seeds_y);
  beginShape();                    
  texture(seeds);                     
  vertex( -20,  -30,   0,   0);      
  vertex(20,   -30,  1,   0);       
  vertex(20, 30,  1,  1);            
  vertex( -20, 30,   0,  1);
  endShape(CLOSE);            
  popMatrix();            
 
  
  bottleS_y = bottleS_y + 3 + speed;       // Make "dbottle" move down the screen (two pixels at a time) 
   seeds_y = seeds_y + 2 + speed;       // Make "seed" move down the screen (two pixels at a time) 

  
  
  
  
  if(bottleS_y>height-20)   // If y value is entering the grass line
  {
    bottleS_x =(int)random(width);         // Choose bottle starting position
  bottleS_y =0;
  lives--;   // lost a life
  if(lives==0) exit();      // If lives is zero then quit 
  }
  
    
 if(bottleS_x>mouseX-20 && bottleS_x < mouseX+20 && bottleS_y > height-40)   // If y value is entering the grass line
  {
    bottleS_x =(int)random(width);         // Choose bottle starting position
  bottleS_y =0;
  score++;   // lost a life
  if(score % 10 == 0){
       speed += 1; 
     }
    
  }
  
   if(seeds_x>mouseX-20 && seeds_x < mouseX+20 && seeds_y > height-40)   // If y value is entering the grass line
  {
  seeds_x =(int)random(width);         // Choose seeds starting position
  seeds_y =0;
  score = score +2;
  lives = lives + 3;
  
    
  }
  

  textSize(32);                
  fill(0,0,255);
  text("score "+score, 10, 30);        // Display score
  text("lives "+lives,width-90, 30);   // Display lives



  
  
  
}  



// Refrence 
//Lab 2 for the paddle moving ping pong game.
