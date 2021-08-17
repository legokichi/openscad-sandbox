translate([-40, 0, 0])
cylinder(h=20, r1=8, r2=8, $fn=3);

translate([-20, 0, 0])
cylinder(h=20, r1=10, r2=0);

translate([0, 0, 10])
sphere(10);

translate([20, 0, 0])
cube(10);

translate([40, 0, 0])
cube([8, 15, 20]);

x_margin = 20;

for (i = [-10:10]) {
    translate([x_margin * i, 0, 0]) {
        if (i % 2 == 0) {
            cube([10, 50, 10], center=true);
        } else {
            cube([10, 10, 50], center=true);
        }
    }
}
translate([-40, 0, 0])
union() {
    cube(20, center=true);
    sphere(14, center=true);
}

translate([0, 0, 0])
difference() {
    cube(20, center=true);
    sphere(14, center=true);
}

translate([40, 0, 0])
intersection() {
    cube(20, center=true);
    sphere(14, center=true);
}

module ring(r1, r2, h) {
    difference() {
        cylinder(r = r1, h = h);
        translate([ 0, 0, -1 ]) cylinder(r = r2, h = h+2);
    }
}

module magcup(height, outer, tickness) {
    inner = outer - tickness;
    handle = height / 4;

    union() {
        difference(){
            cylinder(h=height, r1=outer, r2=outer, center=true);

            translate([0, 0, tickness]) {
                cylinder(h=height, r1=inner, r2=inner, center=true);
            }
        };
        rotate([90,0,0]) {
            translate([outer, 0, -(tickness / 2)]) {
                ring(handle, handle - tickness, tickness);
            }
        }
    }
}

magcup(100, 40, 5);