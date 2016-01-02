include <const.scad>;
use <std.scad>;
fn = 12;

module rightLegEngine() {
    translate([12,0,-83]) {
        rotate([90,270,180]) {
            servo_sg5010(false,false);
        }
    }
    translate([20,0,-125]) {
        rotate([90,0,90]) {
            servo_sg5010(false,false);
        }
    }
    translate([
            20, 
        (servo_9g_l/2-servo_9g_axis_center_right_margin),
        -165]) {
        rotate([180,180,0]) {
            servo_9g(false,false);
        }
    }
    translate([20,0,-197]) {
        rotate([90,0,90]) {
            servo_sg5010(false,false);
        }
    }
    translate([20,0,-270]) {
        rotate([90,180,90]) {
            servo_9g(false,false);
        }
    }
    translate([20, -23, -270]) {
        rotate([90,180,0]) {
            servo_9g(false,false);
        }
    }
}

module rightArmEngine() {
    translate([5,0,-40]) {
        rotate([90,0,90]) {
            servo_sg5010(false,false);
        }
    }
    translate([s(45),0,s(-40)]) {
        rotate([-90,-180,0]) {
            servo_sg5010(false,false);
        }
    }
    translate([
        45,
        -(servo_9g_l/2-servo_9g_axis_center_right_margin),
        -72]) {
        rotate([0,180,0]) {
            servo_9g(false,false);
        }
    }
    translate([45, 0, -102]) {
        rotate([90,0,0]) {
            rotate([0,90,0]) {
                servo_9g(false,false);
            }
        }
    }
    translate([
        45,
        -(servo_9g_l/2-servo_9g_axis_center_right_margin),
        -120]) {
        rotate([0,180,0]) {
            servo_9g(false,false);
        }
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
        translate([s(0),s(0),s(38)])
            cube([s(140), s(40), s(65)], center=true);
        translate([s(0),s(0),s(-26)])
            cube([s(140), s(40), s(30)], center=true);
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

module ssc() {
    color([1,0,0]) {
        cube(center=true,[64,10,58]);
    }
}

module esp8266() {
    color([1,0,1]) {
        cube(center=true,[13.51,10,24.36]);
    }    
}

module arduino_nano() {
    color([0,0,1]) {
        cube(center=true,[18,10,45]);
    }        
}

module transformer() {
    color([0,1,0]) {
        cube(center=true,[18,10,32]);
    }
}

module circuit_system() {
    translate([0,-30,-50]) {
        ssc();
    }
    translate([-50,-30,-60]) {
        rotate([0,90,0]) {
            transformer();
        }
    }
    translate([-50,-30,-40]) {
        rotate([0,90,0]) {
            esp8266();  
        }
    }
    translate([50,-30,-50]) {
        arduino_nano();
    }
}

module main() {
    //standard
    color([1,0,0]) {
        translate([120,0,0]) {
            rotate([180,0,0]) {
                cube([10,10,300],center=false);
            }
        }
    }
    //circuit
//    circuit_system();

//    translate([0,0,-40]) {
//        battery_18650();
//        rotate([-90,0,0]) {
//            battery_18650();
//        }
//    }

    //engine
    translate([30,0,0]) {
        rightArmEngine();
    }
    translate([20,0,-34]) {
        rightLegEngine();
    }
    mirror([1,0,0]) {
        translate([30,0,0]) {
            rightArmEngine();
        }
        translate([20,0,-34]) {
            rightLegEngine();
        }
    }
    //nick servo
    translate([
        s(0),
        s(servo_9g_l/2-servo_9g_axis_center_right_margin),
        s(-34)]) {
        rotate([0,0,180]) {
            servo_9g(false,false);
        }
    }
    translate([
        s(0),
        s(0),
        s(-66)]) {
        rotate([90,180,180]) {
            servo_sg5010(false,false);
        }
    }
    translate([
        s(0),
        s(servo_sg5010_l/2-servo_sg5010_axis_center_right_margin),
        s(-116)]) {
        rotate([0,0,180]) {
            servo_sg5010(false,false);
        }
    }


    //robot frame
    color([0,1,0],0.6) union(){
        translate([s(0),s(0),s(0)]) {
            head();
        }
        translate([s(0),s(0),s(22-110)]) {
//            body();
        }
        translate([0,0,-110]) {
//            leftArm();
//            rightArm();
        }
        translate([s(-20), s(0), s(-60-110)]) {
//            leftLeg();
        }
        translate([s(20), s(0), s(-60-110)]) {
//            rightLeg();
        }
    }

}

main();

