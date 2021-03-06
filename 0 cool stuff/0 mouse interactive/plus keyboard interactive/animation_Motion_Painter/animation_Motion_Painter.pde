/* Motion Painter
Ira Greenberg, April 17, 2006 */
/* Begin declaring global variables above
the setup() function. */
int points = 5;
/*parentNode[] array holds x and y position of
center of moving brush shape.*/
float[]parentNode = new float[2];
/*shape[][] 2-dimensional array holds x and y position
of up to 8 points making up the vertices of each
brush shape. Each brush shape can have a minimum
of 2 points or a maximum of 8 points.*/
float[][]shape = new float[8][2];
float shapeRadius = 10.0;
float strokeAlpha = 255;
float speed = 2;
float rotation = 15;
float rotationSpeed = 4;
float xSpeed = 0.0;
float ySpeed = 0.0;
byte xDirection = 1;
byte yDirection = 1;
float strokeWt = 1;
/*strokeColor[][] 2-dimensional array holds
color values for each edge of the brush shapes.*/
float[][]strokeColor = new float[8][3];
boolean isWallSolid = true;
int canvasWidth;
int canvasHeight;
PFont font;
void setup(){
size(600, 400);
canvasWidth = width;
canvasHeight = height-100;
background(255);
smooth();
frameRate(30);
/*Initialize parentNode to center of canvas, which
is smaller (vertically) than the entire display window.*/
parentNode[0] = canvasWidth/2;
parentNode[1] = canvasHeight/2;
/*Fill pallete with random colors for brush shape edges.
Each shape can have between 2 and 8 edges*/
setPalette();
// Font for key commands at bottom of sketch
font = createFont("Verdana", 12);
}
void draw(){
/*xSpeed and ySpeed variables controlled by trig functions.
rotation variable is controlled by user, through keystroke
commands. x and y value of parentNode is incremented by
xSpeed and ySpeed. The brush shape is drawn around the
parentNode as its origin, ensuring the brush shape moves
with the parentNode*/
xSpeed = cos(radians(rotation))*speed*xDirection;
ySpeed = sin(radians(rotation))*speed*yDirection;
parentNode[0]+=xSpeed;
parentNode[1]+=ySpeed;
/*If isWallSolid boolean variable is true, the shape bounces off
the canvas edges. If false, the shape exits the canvas and is
remapped to the opposite side of the canvas. The isWallSolid
variable is controlled by the user with the keystrokes 'b' for
bounce or 'n' for no bounce.*/
if (!isWallSolid){
if (parentNode[0]>canvasWidth+shapeRadius*2){
parentNode[0] = 0;
}
else if (parentNode[0]<-shapeRadius*2){
parentNode[0] = canvasWidth;
}
if (parentNode[1]>canvasHeight+shapeRadius*2){
parentNode[1] = 0;
}
else if (parentNode[1]<-shapeRadius*2){
parentNode[1] = canvasHeight;
}
}
else {
if (parentNode[0]>canvasWidth-shapeRadius/2){
xDirection*=-1;
}
else if (parentNode[0]<shapeRadius/2){
xDirection*=-1;
}
if (parentNode[1]>canvasHeight-shapeRadius/2){
yDirection*=-1;
}
else if (parentNode[1]<shapeRadius/2){
yDirection*=-1;
}
}
/*drawShape() function draws a 2-8 point polygon, which
functions as a brush shape. The number of sides to
the shape is determined by the user pressing keys 2-8.*/
drawShape();
/*keyPressed boolean property
checks for specific keys*/
if (keyPressed){
if(key == '+') {
//Increase shape size
shapeRadius++;
}
else if(key == '_') {
//Decrease shape size
shapeRadius--;
}
else if(key == 'a') {
if (strokeAlpha>0){
//Decrease alpha
strokeAlpha-=5;
}
}
else if(key == 's') {
if (strokeAlpha<255){
//Increase alpha
strokeAlpha+=5;
}
}
else if(key == 'b') {
//Causes shape to bounce off canvas edges.
isWallSolid = true;
}
else if(key == 'n') {
//Causes shape to pass through canvas edges.
isWallSolid = false;
}
else if(key == 'c') {
//Set new random color palette for each shape edge.
setPalette();
}
//keys 2-8 control number of edges for brush shape.
else if(key == '2') {
points = 2;
}
else if(key == '3') {
points = 3;
}
else if(key == '4') {
points = 4;
}
else if(key == '5') {
points = 5;
}
else if(key == '6') {
points = 6;
}
else if(key == '7') {
points = 7;
}
else if(key == '8') {
points = 8;
}
}
//Bottom info panel
fill(130);
noStroke();
rect(0, canvasHeight, canvasWidth, height-canvasHeight);
textFont(font);
fill(255, 200, 0);
text("key commands:", 10, canvasHeight+20);
fill(0);
//left column
text("UP Arrow: speed ++", 10, canvasHeight+35);
text("DOWN Arrow: speed --", 10, canvasHeight+50);
text("RIGHT Arrow: rotate right", 10, canvasHeight+65);
text("LEFT Arrow: rotate left", 10, canvasHeight+80);
//middle column
text("',' stop", 200, canvasHeight+20);
text("'.' start", 200, canvasHeight+35);
text("'+' (requires shift key): size ++", 200, canvasHeight+50);
text("'–' (requires shift key): size --", 200, canvasHeight+65);
text("'c' randomize color: size --", 200, canvasHeight+80);
//right column
text("change shapes (keys: 2-8)", 430, canvasHeight+20);
text("'a' alpha --", 430, canvasHeight+35);
text("'s' alpha ++", 430, canvasHeight+50);
text("'b' bounce", 430, canvasHeight+65);
text("'n' no bounce", 430, canvasHeight+80);
}
//keyPressed function
//Check built-in coded keys
void keyPressed(){
if(key == CODED) {
if (keyCode == UP) {
if (speed<10){
speed+=.25;
}
}
else if (keyCode == DOWN) {
if (speed>-10){
speed-=.25;
}
}
else if(keyCode == RIGHT) {
rotation+=rotationSpeed;
}
else if(keyCode == LEFT) {
rotation-=rotationSpeed;
}
}
else {
// check for 2 more uncoded keys
if(key == '.') {
//start motion
loop();
}
else if(key == ',') {
//stop motion
noLoop();
}
}
}
//Randomly fill palette
void setPalette(){
for (int i=0; i<8; i++){
for (int j=0; j<3; j++){
strokeColor[i][j] = random(255);
}
}
}
//Trig functions draw 2-8 sided polygon around parentNode.
void drawShape(){
  strokeWeight(strokeWt);
float angle = 0;
for (int i=0; i<points; i++){
shape[i][0] = parentNode[0]+cos(radians(angle+rotation)) 
*shapeRadius;
shape[i][1] = parentNode[1]+sin(radians(angle+rotation)) 
*shapeRadius;
angle+=360/points;
}
// Each edge of the polygon (brush shape)
// has a different color.
for (int i=0; i<points; i++){
stroke(strokeColor[i][0], strokeColor[i][1], 
strokeColor[i][2], strokeAlpha);
if (i==points-1){
//If last point, connect to initial point to close polygon.
line(shape[i][0], shape[i][1], shape[0][0], shape[0][1]);
}
else {
//If not last point, draw line from current point to next point.
line(shape[i][0], shape[i][1], shape[i+1][0], shape[i+1][1]);
}
}
}