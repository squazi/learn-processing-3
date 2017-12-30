size(500, 200);
background(0);
float cellWidth = width/50.0;
// find ratio of value range(255) to width
float valw = cellWidth*(255.0/width);
//vertical lines
for (float i=cellWidth, v=255; i<width; i+=cellWidth, v-=valw){
stroke(v);
for (int j= 0; j<height; j++){
point(i, j);
}
}
float cellHeight = height/50.0;
// find ratio of value range(255) to height
float valh = cellHeight*(255.0/height);
//horizontal lines
for (float i=cellHeight, v=255; i<height; i+=cellHeight, v-=valh){
stroke(v);
for (int j=0; j<width; j++){
point(j, i);
}
}