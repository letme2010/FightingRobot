include <const.scad>;
use <std.scad>;
fn = 12;

module main() {
    //engine
    {
        //right system
        translate([20,0,-40]) {
            rotate([90,0,90]) {
                servo_sg5010();
            }
        }
        translate([s(55),0,s(-19.5)]) {
            rotate([-90,0,180]) {
                servo_sg5010();
            }
        }
        translate([
                    55,
                    -(servo_9g_l/2-servo_9g_axis_center_right_margin),
                    -60]) {
            rotate([0,180,0]) {
                servo_9g();
            }
        }
        translate([
                    55,
                    0,
                    -100]) {
            rotate([90,0,0]) {
                rotate([0,90,0]) {
                    servo_9g();
                }
            }
        }
        translate([
                    55,
                    -(servo_9g_l/2-servo_9g_axis_center_right_margin),
                    -200]) {
            rotate([0,180,0]) {
                servo_9g();
            }
        }


    }
    
    //robot frame
    color([1,1,1],0.2) union(){
        translate([s(0),s(0),s(0)])
            head();
        translate([s(0),s(0),s(22-110)]) {
            body();
        }
        translate([0,0,-110]) {
            leftArm();
            rightArm();
        }
        translate([s(-20), s(0), s(-60-110)])
            leftLeg();
        translate([s(20), s(0), s(-60-110)])
            rightLeg();
    }
}

function s(x)=x;

module head() {
    color([1,1,1]) {
        cube([s(30), s(30), s(30)], center=true);
    }
    color([0,1,0]) {
        translate([s(6),s(15),s(5)])
            sphere(r=s(2), $fn=fn);
        translate([s(-6),s(15),s(5)])
            sphere(r=s(2), $fn=fn);
    }
}

module body() {
//    %cube([s(80), s(40), s(80)], center=true);
    color([1,1,1]) {
        translate([s(0),s(0),s(45)])
            cube([s(80), s(40), s(50)], center=true);
        translate([s(0),s(0),s()])
            cube([s(80), s(40), s(30)], center=true);
    }
}

module rightArm() {
    // part near to body
    color([0,1,0])
        translate([s(50), s(0), s(70)]) 
            cube([s(10), s(10), s(30)], center=true);

    // hand
    color([0,1,0])
        translate([s(50), s(0), s(35)]) 
            cube([s(10), s(10), s(30)], center=true);

}

module leftArm() {
    mirror([1,0,0])
        rightArm();
}

module rightLeg() {
    // part near to body
    color([0,1,0])
        translate([s(0), s(0), s(45)]) 
            cube([s(20), s(20), s(40)], center=true);

    // little leg
    color([0,1,0])
        translate([s(0), s(0), s(0)]) 
            cube([s(20), s(20), s(40)], center=true);    
    // foot
    color([0,1,0])
        translate([s(0), s(6), s(-30)]) 
            cube([s(20), s(40), s(10)], center=true);  
        
}

module leftLeg() {
    mirror([1,0,0])
        rightLeg();
}


main();

