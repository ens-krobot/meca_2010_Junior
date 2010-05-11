
$fs = 0.1;
$fa = 5;

lng_tige = 35;
lrg_tige = 10;
diam_ext = 65;
diam_int = 51;
e = 5;

dd = diam_ext - diam_int;

rotate([0, 0, 45]) union() {
    translate([-lng_tige - diam_ext/2 + dd/4, 0, -e/2])
        polyhedron([[0, 0, 0], [lng_tige, 0, 0],
                    [lng_tige + dd/2, 2*lrg_tige, 0], [0, lrg_tige, 0],
                    [0, 0, e], [lng_tige, 0, e],
                    [lng_tige + dd/2, 2*lrg_tige, e], [0, lrg_tige, e]],
                   [[0, 1, 2], [0, 2, 3],
                    [0, 4, 1], [4, 5, 1],
                    [1, 5, 2], [5, 6, 2],
                    [2, 6, 3], [6, 7, 3],
                    [3, 7, 0], [7, 4, 0],
                    [4, 6, 5], [4, 7, 6]]);
    difference() {
        cylinder(r=diam_ext/2, h=e, center=true);
        #cylinder(r=diam_int/2, h=e+5, center=true);
        translate([0, -diam_ext/4 - 5, 0]) cube([diam_ext + 5, diam_ext/2 + 10, e + 5], center=true); 
	}
}