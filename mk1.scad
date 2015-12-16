fn = 12;

module main() {
    translate([s(0),s(0),s(110)])
        head();
    translate([s(0),s(0),s(50)]) body();
    leftArm();
    rightArm();
    translate([s(-20), s(0), s(-60)])
        leftLeg();
    translate([s(20), s(0), s(-60)])
        rightLeg();
}

function s(x)=x;

module head() {
    cube([s(30), s(30), s(30)], center=true);
    color([0,1,0]) {
        translate([s(6),s(15),s(5)])
            sphere(r=s(2), $fn=fn);
        translate([s(-6),s(15),s(5)])
            sphere(r=s(2), $fn=fn);
    }
}

module body() {
    %cube([s(80), s(40), s(80)], center=true);
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

    // hand
    color([0,1,0])
        translate([s(0), s(0), s(0)]) 
            cube([s(20), s(20), s(40)], center=true);    
}

module leftLeg() {
    mirror([1,0,0])
        rightLeg();
}


main();

