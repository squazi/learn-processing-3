/*
Polygon Creator
Ira Greenberg, December 26, 2005
*/
void setup(){
size(600, 600);
background(127);
smooth();
/*
//complete parameter list
makePoly(x, y, pts, radius 1, radius 2, initial rotation, å
stroke Color, stroke Weight, fill Color, endcap, stroke join)
*/
// makePoly function calls
makePoly(width/2, height/2, 72, 420, 270, 45, color(0, 0, 0), 
16, color(255, 255, 255));
makePoly(width/2, height/2, 16, 300, 250, 45, color(200, 200, 200),
10, color(20, 20, 20));
makePoly(width/2, height/2, 60, 210, 210, 45, color(255,255,255), 
8, color(0,0,0), PROJECT, ROUND);
makePoly(width/2, height/2, 60, 200, 155, 45, color(120, 120, 120),
6, color(255, 255, 255), PROJECT, ROUND);
makePoly(width/2, height/2, 50, 280, -200, 45, 
color(200, 200, 200), 6, color(50, 50, 50), PROJECT, ROUND);
makePoly(width/2, height/2, 8, 139, 139, 68, color(255, 255, 255), 
5, color(0,0,0));
makePoly(width/2, height/2, 24, 125, 60, 90, color(50, 50, 50), 12,
color(200, 200, 200), ROUND, BEVEL);
makePoly(width/2, height/2, 4, 60, 60, 90, color(0,0,0), 5, 
color(200,200,200), ROUND, BEVEL);
makePoly(width/2, height/2, 4, 60, 60, 45, color(255, 255, 255), 5,
color(20, 20, 20), ROUND, BEVEL);
makePoly(width/2, height/2, 30, 30, 30, 90, color(75, 75, 75), 10, 
color(60,60,60), ROUND, BEVEL);
makePoly(width/2, height/2, 30, 28, 28, 90, color(255, 255,255), 2,
color(60,60,60), ROUND, BEVEL);
makePoly(width/2, height/2, 24, 10, -25, 45, #000000, .75, 
color(255, 255, 255), SQUARE, MITER);
}
//default - if no args passed
void makePoly(){
// call main makePoly function
makePoly(width/2, height/2, 4, width/4, width/4, 
45, #777777, 4, #AAAAAA, SQUARE, MITER);
}
// x, y, pts args
void makePoly(float x, float y, int pts){
// call main makePoly function
makePoly(x, y, pts, width/4, width/4, 
45, #777777, 4, #AAAAAA, SQUARE, MITER);
}
// x, y, pts, rad1, rad2 args
void makePoly(float x, float y, int pts, float rad1, float rad2){
// call main makePoly function
makePoly(x, y, pts, rad1, rad2, 45, #777777, 4, #AAAAAA, 
SQUARE, MITER);
}
// x, y, pts, rad1, rad2,, initRot, strokeCol, strokeWt, fillCol args
void makePoly(float x, float y, int pts, float rad1, float rad2, 
float initRot, color strokeCol, float strokeWt, color fillCol){
// call main makePoly function
makePoly(x, y, pts, rad1, rad2, initRot, strokeCol, strokeWt, 
fillCol, SQUARE, MITER);
}
// main function - called by other overloaded functions/methods
void makePoly(float x, float y, int pts, float rad1, float rad2, 
float initRot, color strokeCol, float strokeWt, 
color fillCol, int endCap, int endJoin){
float px = 0, py = 0, angle = initRot;
stroke(strokeCol);
strokeWeight(strokeWt);
strokeCap(endCap);
strokeJoin(endJoin);
fill(fillCol);
beginShape();
for (int i = 0; i< pts; i++){
if (i%2 == 0){
px = x+cos(radians(angle))*rad1;
py = y+sin(radians(angle))*rad1;
}
else {
px = x+cos(radians(angle))*rad2;
py = y+sin(radians(angle))*rad2;
}
vertex(px, py);
angle+=360/pts;
}
endShape(CLOSE);
}