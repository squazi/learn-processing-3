/*
Finished Nematode
Ira Greenberg, January 7, 2006
*/
void setup(){
size(500, 300);
background(255);
smooth();
strokeWeight(.2);
noFill();
float radius = 0;
float thickness = .35;
float x = 0;
float y = height/2;
float amp = .5;
float angle = 0;
float angle2 = 0;
//ground plane
stroke(150, 100, 20);
line(0,50, width, 50);
for (int i=0; i<width/2-15; i++){
noFill();
translate(2, y);
// add some surface shading
if (i >= width/2-40) {
fill(195, 110, 105, 50);
}
else if (i >= width/4-40 && i <= width/2-100){
fill(195, 110, 105, 10);
}
else {
fill(195, 110, 105, 2);
}
//outer shell 1
stroke(145, 10, 5, 175);
ellipse(-radius/2, -radius/2, radius*.75, radius);
//outer shell 2
stroke(65, 10, 100, 150);
ellipse(-radius/2, -radius/2, radius*.71, radius*.71);
// organs 1
stroke(200, 200, 30, i*.8);
ellipse(-radius/2, -radius/2, segment(radius, angle), 
segment(radius, angle));
// organs 2
noStroke();
fill(150, 75, 100, 28);
ellipse(-radius/2, -radius/2, segment(radius*.7, angle), 
segment(radius*.7, angle));
// inner tube
fill(205, 110, 105, 40);
ellipse(-radius/2, -radius/2, radius*.25, radius*.25);
// inner vein
fill(205, 110, 105, 200);
ellipse(-radius/2, -radius/2, radius*.05, radius*.05);
y = sin(radians(angle+=5))*amp;
radius+=thickness;
radius+=sin(radians(angle2+=random(30)))*.4;
if (i==width/4){
thickness*=-.9;
}
}
}
float segment(float rad, float angle){
if(rad>25){
rad*=1.5+random(.15);
}
else{
rad*=random(.2);
}
float r = cos(radians(angle*=1.3))*rad*.5;
return r;
}