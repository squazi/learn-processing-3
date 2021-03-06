void checkGroundCollision(Ground groundSegment) {
// get difference between orb and ground
float deltaX = orb.x - groundSegment.x;
float deltaY = orb.y - groundSegment.y;
// precalculate trig values
float cosine = cos(groundSegment.rot);
float sine = sin(groundSegment.rot);
/* rotate ground and velocity to allow
orthogonal collision calculations */
float groundXTemp = cosine * deltaX + sine * deltaY;
float groundYTemp = cosine * deltaY - sine * deltaX;
float velocityXTemp = cosine * velocity.vx + sine * velocity.vy;
float velocityYTemp = cosine * velocity.vy - sine * velocity.vx;
/* ground collision - check for surface
collision and also that orb is within
left/rights bounds of ground segment */
if (groundYTemp > -orb.r &&
orb.x > groundSegment.x1 &&
orb.x < groundSegment.x2 ){
// keep orb from going into ground
groundYTemp = -orb.r;
// bounce and slow down orb
velocityYTemp *= -1.0;
velocityYTemp *= damping;
}
// reset ground, velocity and orb
deltaX = cosine * groundXTemp - sine * groundYTemp;
deltaY = cosine * groundYTemp + sine * groundXTemp;
velocity.vx = cosine * velocityXTemp - sine * velocityYTemp;
velocity.vy = cosine * velocityYTemp + sine * velocityXTemp;
orb.x = groundSegment.x + deltaX;
orb.y = groundSegment.y + deltaY;
}