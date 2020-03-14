// Noise3D  //<>//
// Daniel Shiffman <http://www.shiffman.net> 

// some modification ultraviolet.to

OpenSimplexNoise noise;



float increment = 0.1; 
// The noise function's 3rd argument, a global variable that increments once per cycle 
float zoff = 0.0;  
// We will increment zoff differently than xoff and yoff 
float zincrement = 0.01; 


ArrayList<Arrow> arrows = new ArrayList<Arrow>();
float TILE_LEN = 50;
int BORDER = 30;



void setup() { 
  size(1920, 1080); 
  noise = new OpenSimplexNoise(10);

  for ( int i = BORDER; i < height-BORDER; i+=TILE_LEN) {
    for ( int j = BORDER; j < width-BORDER; j+=TILE_LEN) {
      PVector loc = new PVector (j,i);
      Arrow a = new Arrow(loc, TILE_LEN);
      arrows.add(a);
    }
  }
  
  strokeWeight(20);
  strokeCap(ROUND);
//strokeCap(SQUARE);

} 

void draw() { 
  background(255); 
   float xoff = 0.0; // Start xoff at 0 

  int count = 0;
  for ( int i = BORDER; i < width-BORDER; i+=ARROW_LEN) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0f;   // For every xoff, start yoff at 0 

    for ( int j = BORDER; j < height-BORDER; j+=ARROW_LEN) {
      yoff += increment; // Increment yoff 

      float n = (float)noise.eval(xoff, yoff, zoff); 
      float theta = map(n, -1.0, 1.0, 0.0, TWO_PI);
       
      Arrow a = arrows.get(count);
      a.show(theta);
      count++;
    }
  }

   zoff += zincrement; // Increment zoff

 


  
} 
