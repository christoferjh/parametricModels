// Author: @christofer.jh
// Golf ball stencil
// Link: 
// License: CC-Attribution-Noncommercial-Share Alike


//Only two letters
initals="CH"; //ABDOPQR 
//Lines on or off
lines=true;
//initials on or off
text=true;
//thickness of stencil mm
thickness = 1.0;
//pen size mm
pen_width = 2;
//for best print
rotation=135;

//golf ball diameter mm
/* [Hidden] */
ball_d = 43;
textSize=9;
rotate(a=[135,0,0]) {
difference() {
stencil();
ball_neg();
}
}
//text_neg();

module non_floating_letter(letter,h) {
//union(){
difference(){
linear_extrude(height = h)
            text(letter, size = textSize, halign = "center", valign = "center");
if (letter=="A") {
    translate([-0,-0.2,0])
   linear_extrude(height = h)
            text("--", size = textSize, halign = "center", valign = "center"); 
}else if (letter=="9") {
    translate([-0,2,0])
   linear_extrude(height = h)
            text("l", size = textSize, halign = "center", valign = "center"); 
} else if (letter=="B") {
    union(){
    translate([-0.93,6,0])
   linear_extrude(height = h)
            text("l", size = textSize, halign = "center", valign = "center");
            translate([-0.93,-1,0])
   linear_extrude(height = h)
            text("l", size = textSize, halign = "center", valign = "center"); 
    translate([-0.93,-6,0])
   linear_extrude(height = h)
            text("l", size = textSize, halign = "center", valign = "center"); 
    }
}  else if (letter=="D" ) {
    union(){
    translate([-1.3,6,0])
   linear_extrude(height = h)
            text("l", size = textSize, halign = "center", valign = "center");
    translate([-1.3,-6,0])
   linear_extrude(height = h)
            text("l", size = textSize, halign = "center", valign = "center"); 
    }
}else if (letter=="Q"  || letter=="O"  || letter=="0"  || letter=="8" ) {
    union(){
    translate([-0.15,6,0])
   linear_extrude(height = h)
            text("l", size = textSize, halign = "center", valign = "center");
 translate([-0.15,-3,0])
   linear_extrude(height = h)
            text("l", size = textSize, halign = "center", valign = "center");
    }
} else if (letter=="P" || letter=="R" ) {
    union(){
    translate([-1,0,0])
   linear_extrude(height = h)
            text("l", size = textSize, halign = "center", valign = "center");
    }
}
}
}

module text_neg() {
    
    //linear_extrude(height = 10)
    //        text(initals, size = textSize, halign = "center", valign = "center");
    union(){
    rotate(a=[45,0,0]) {
    translate([-textSize/2,0,ball_d/2-4]) non_floating_letter(initals[0],10);}
    rotate(a=[45,0,0]) {
    translate([textSize/2,0,ball_d/2-4]) 
    non_floating_letter(initals[1],10);
    }
    }
}
module lines_neg(){
    rotate(a=[0,0,45]) {
     union(){
    translate([-pen_width/2,-ball_d,ball_d/4]) 
    cube([pen_width,ball_d*2,ball_d]);
    translate([-ball_d,-pen_width/2,ball_d/4]) 
    cube([ball_d*2,pen_width,ball_d]);
     }
    }
}
module ball_neg(){
   
    union(){
    sphere(d=ball_d, $fn=100,center = true);
    translate([-ball_d*2,-ball_d*2,-ball_d*2]) 
    cube([ball_d*4,ball_d*4,ball_d*2+6]);
    if (lines) lines_neg();
    if (text) text_neg();
    }

}

module stencil(){
    sphere(d=ball_d+thickness*2, $fn=100,center = true); 
}




