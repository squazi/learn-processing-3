/*
ImageMap
Ira Greenberg, November 4, 2005
revised, October 10, 2006
*/
/* IMPORTANT- to run this, you need
6 images in your data directory named
img1.jpg - img6.jpg. Images should each
be 250 x 250 pixels */
PImage[] images = new PImage[6];
void setup(){
size(400, 400, P3D);
noStroke();
//load images
for (int i=1; i<7; i++){
images[i-1] = loadImage("img"+i+".jpg");
}
// map images using 0.0-1.0
textureMode(NORMAL);
}
void draw(){
background(255);
//*center geometry in display windwow.
translate(width/2, height/2);
//rotate around y and x axes
rotateY(frameCount*PI/100);
rotateX(frameCount*PI/75);
createCube(100, 100, 100);
}
void createCube(float w, float h, float d){
//front face
beginShape(QUADS);
texture(images[0]);
vertex(-w/2, -h/2, -d/2, 0, 0);
vertex(w, -h/2, -d/2, 1, 0);
vertex(w, h, -d/2, 1, 1);
vertex(-w/2, h, -d/2, 0, 1);
endShape();
//back face
beginShape(QUADS);
texture(images[1]);
vertex(-w/2, -h/2, d, 0, 0);
vertex(w, -h/2, d, 1, 0);
vertex(w, h, d, 1, 1);
vertex(-w/2, h, d, 0, 1);
endShape();
//left face
beginShape(QUADS);
texture(images[2]);
vertex(-w/2, -h/2, -d/2, 0, 0);
vertex(-w/2, -h/2, d, 1, 0);
vertex(-w/2, h, d, 1, 1);
vertex(-w/2, h, -d/2, 0, 1);
endShape();
//right face
beginShape(QUADS);
texture(images[3]);
vertex(w, -h/2, -d/2, 0, 0);
vertex(w, -h/2, d, 1, 0);
vertex(w, h, d, 1, 1);
vertex(w, h, -d/2, 0, 1);
endShape();
//top face
beginShape(QUADS);
texture(images[4]);
vertex(-w/2, -h/2, -d/2, 0, 0);
vertex(w, -h/2, -d/2, 1, 0);
vertex(w, -h/2, d, 1, 1);
vertex(-w/2, -h/2, d, 0, 1);
endShape();
//bottom face
beginShape(QUADS);
texture(images[5]);
vertex(-w/2, h, -d/2, 0, 0);
vertex(w, h, -d/2, 1, 0);
vertex(w, h, d, 1, 1);
vertex(-w/2, h, d, 0, 1);
endShape();
}