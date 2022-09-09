$fn=90;
use <./threads.scad>

function rms_radius(tight=false) = let(
    nominal_r = 25.4*0.8/2,
    adjustment = tight ? -0.25 : 0
) nominal_r+adjustment;








mirror_dim_1 = 24.5;
mirror_dim_2 = 27;
mirror_extra = 5;
fluo_dim_v = 35;
fluo_dim_h=30;
fluo_dim_t=27;
module cuber(){

bottom_gap=4;

cube([fluo_dim_t,fluo_dim_h,fluo_dim_v],center=true);
cube([fluo_dim_t,fluo_dim_h+12,fluo_dim_v-14],center=true);

};

module foot(){
    hull(){
    scale([1,1,1])
cylinder(r=2,h=0.01);
translate([0,0,3])
    scale([2.5,1,1])
cylinder(r=2,h=0.01);}
}

module mod1(){
    pitch=0.7056;
radius = rms_radius();
inner_thread(radius=radius,pitch=pitch,thread_base_width = 0.60,thread_length=5);
    
difference(){
cylinder(r=radius+2,h=5);
    cylinder(r=radius+0.45,h=6);
    
}

difference(){
    hull(){
        
         cylinder(r=11,h=3);
    
   translate([0,0,-17])
rotate([0,45,0])  translate([1,0,0])cube([mirror_dim_1+mirror_extra,mirror_dim_2+mirror_extra,2],center=true);
        
    }
    
    #translate([9,0,-15])
    rotate([0,90,0])
    cylinder(r=11,h=30);
    
    translate([0,0,-5])
    cylinder(r=11,h=10);
    translate([0,0,1])
    hull(){
        translate([0,0,-2])
        cylinder(r=10,h=3);
    translate([0,0,-17])
rotate([0,45,0]) #cube([mirror_dim_1+mirror_extra,mirror_dim_2,2],center=true);
        
        
    }
    
}





translate([-1,0,0])

difference(){
translate([30,0,-14.5])


difference(){
    union(){
scale([1.3,1.1,1.1])
cuber();
    
}
    cuber();
    translate([-35,-35,0])
    cube([70,70,30]);
}

#translate([9,0,-15])
    rotate([0,90,0])
    cylinder(r=13,h=50);

#translate([28,0,-15])
    rotate([90,0,0])
    cylinder(r=22.5/2,h=50);
}


translate([45,0,-15])
rotate([0,90,0])
union(){
inner_thread(radius=28.5/2,pitch=0.6,thread_base_width = 0.60,thread_length=5);
difference(){
    cylinder(r=32/2,h=5);
    cylinder(r=29.4/2,h=6);
    
}

}
}

module spacer(){
    
    difference(){
        cylinder(r=3,h=4);
        cylinder(r=1.7,h=4);
    }}

module mod2(){
   

translate([100,0,0])
{
     translate([14,-16,-39])
    foot();
       translate([14,16,-39])
    foot();
         translate([110,-19,-39])
    foot();
       translate([110,19,-39])
    foot();

translate([100,0,-15]){
 translate([9,15,15])
    rotate([0,90,0])spacer();
   translate([9,15,-15])
    rotate([0,90,0])spacer();
   translate([9,-15,15])
    rotate([0,90,0])spacer();
   translate([9,-15,-15])
    rotate([0,90,0])spacer();  
    
}
    

translate([100,0,-15])
difference(){
    union(){
        
        
        cube([30,42,42],center=true);
        
        
         cube([2,40,40],center=true);
  
        
    }
    translate([0,0,-20])
   # cube([20,15,20],center=true);
    
    translate([-1,0,0])
     cube([28,40,40],center=true);
    translate([5,15,15])
    rotate([0,90,0])cylinder(r=1.7,h=15);
    translate([5,15,-15])
    rotate([0,90,0])cylinder(r=1.7,h=15);
    translate([5,-15,15])
    rotate([0,90,0])cylinder(r=1.7,h=15);
    translate([5,-15,-15])
    rotate([0,90,0])cylinder(r=1.7,h=15);
    
    translate([-5,0,0])
    
    
    
    translate([-50,-50,20])
    cube([100,150,50]);
    
}



translate([10,20.1,-14.5])
cube([80,4,2]);


difference(){
translate([49,0,-14.5])
scale([3,1.1+0.05,1.1+0.13])
cuber();

translate([49,0,-14.5])
scale([10,1.1+0.01,1.1+0.01])
cuber();
    
    translate([49,0,-14.5])
     translate([-45,-45,0])
    cube([90,90,30]);
    
    
    translate([0,-40,-25])
cube([80,40,84]);
    
}
}
}

//mod2();
mod2();

/*
translate([0,0,5.5])

%cylinder(r=11,h=45);
*/



