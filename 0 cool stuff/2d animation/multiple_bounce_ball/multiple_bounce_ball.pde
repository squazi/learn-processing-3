/*
title: Many Bouncing Balls
description: balls deflect off sketch window edges
created: August 9, 2005
by: Ira Greenberg
*/
// global variables
int ballCount = 500;
int ballSize = 8;
int ballSpeed = 3;
float[]xspeed = new float[ballCount];
float[]yspeed= new float[ballCount];
float[]xpos = new float[ballCount];
float[]ypos = new float[ballCount];
float[]wdth = new float[ballCount];
float[]ht = new float[ballCount];
//initialize sketch
void setup(){
//set sketch window size and background color
size(400, 400);
background(0);
//initialize values for all balls
for (int i=0; i<ballCount; i++){
// set varied ball speed
xspeed[i] = random(1, ballSpeed);
yspeed[i] = random(-ballSpeed, ballSpeed);
// ball varied ball sizes
wdth[i]= random(1, ballSize);
ht[i]= wdth[i];
// set initial ball placement
xpos[i] = width/2+random(-width/3, width/3);
ypos[i] = height/2+random(-height/3, height/3);
}
// turn off shape stroke rendering
noStroke();
//set the animation loop speed
frameRate(30);
}
// begin animation loop
void draw(){
/*updates background
comment out to use alternate
fill option below*/
background(0);
for (int i=0; i<ballCount; i++){
  /*To use this fill option:
1. uncomment fill call below
2. comment out the background
function call above*/
// fill(i*255/ballCount);
//draw balls
ellipse(xpos[i], ypos[i], wdth[i], ht[i]);
//upgrade position values
xpos[i]+=xspeed[i];
ypos[i]+=yspeed[i];
/*conditionals:
detects ball collision with sketch window edges
accounting for ball thickness.
*/
if (xpos[i]+wdth[i]/2>=width || xpos[i]<=wdth[i]/2){
xspeed[i]*=-1;
}
if (ypos[i]+ht[i]/2>=height || ypos[i]<=ht[i]/2){
yspeed[i]*=-1;
}
}
}