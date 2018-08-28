#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#include "transforms.inc"

camera
{   
        #if( clock < 15 )//Zoom in
            location <0, 5 + 0.18*clock, -15 + 0.83*clock>
            look_at <0, 5 + 0.18*clock, 5>
        #end
        #if(clock >=15 & clock<20)
            location <0, 7.52, -2.55>
            look_at <0, 7.52, 5>
        #end
        #if (clock >= 20)//Zoom out
            location <0, 7.52, -2.55 - 0.25*(clock-20)>
            look_at <0, 7.52, 5>       
        #end
        #if (clock >= 35)//Tilt down
            location <0, 7.52, -6.3>
            look_at <0, 7.52 - 0.5*(clock-35), 5>
        #end
        #if (clock >= 50)//Zoom into Windows update
            location <0, 7.52 - 0.3*(clock-50), -6.3 + 0.5*(clock-50)>
            look_at <0, 0, 5>
        #end
        #if (clock >= 62)//inside windows update
            location <0, 7, 6>
            look_at <0, 7, 10>
        #end
}  

//floor
plane
{
    <0, 1, 0>, 0
    texture
    {
        pigment
        {
            White_Marble
            scale 4
        }
        finish {Shiny}
    }
    translate<0, -3, 0>
}

//wall back
plane
{
    <0, 0, 1>, 1
    pigment {checker color Black color White}
    //normal {bumps 0.3 scale 0.2}
    translate<0, 0, 4>
}

//wall backback
plane
{
    <0, 0, 1>, 5
    pigment {White}
    translate<0, 0, 14>
}

//wall right
plane
{
    <1, 0, 0>, 1
    pigment {SummerSky}
    normal {bumps 0.3 scale 0.2}
    translate<8, 0, 0>
}

//wall left
plane
{
    <-1, 0, 0>, 1
    pigment {SummerSky}
    normal {bumps 0.3 scale 0.2}
    translate<-8, 0, 0>
}

//table leg
cylinder
{
    <4.5,-3,0>
    <4.5,2,0>
    0.3
    texture { DMFWood4 scale 4 }
}
//table leg
cylinder
{
    <-4.5,-3,0>
    <-4.5,2,0>
    0.3
    texture { DMFWood4 scale 4 }
}

//table top
box
{
    <-5,2,-3>
    <5,2.5,3>
    texture
    {
        DMFWood4
        scale 4
    }

}
//laptop bottom
box
{
    <-1.5,2.5,-1>
    <1.5,2.6,1>
    pigment {Black}
    finish {Shiny}
    translate <0,0,-1.5 >
}
//laptop top
box
{
    <-1.5,2.5,-1>
    <1.5,2.6,1>
    pigment {Black}
    finish {Shiny}
    rotate x*110
    translate <0,4.4,-2.52 >
}

//screen
box
{
    <-1.5, 2.5, -1>
    <1.5, 2.6, 1>
    texture
    {
        uv_mapping
        pigment
        {
            image_map
            {
                png "winupdate.png"
            }
            scale <0.25,0.35,0.25>
            rotate<180,0,0>
        }
    }
    rotate x*110
    translate <0,5.1,-2.55>
    scale <0.95,0.85,0.85>
}

//lamp left
cone
{
    < -7, -3, 1> 1
    < -7, -2, 1> 0.1
    texture
    {
        pigment{Black}
        finish {diffuse 0.9 phong 1.0}
        scale 4
    }
}

cylinder
{
    <-7, -2, 1>
    <-7, 7, 1>
    0.1
    texture
    {
        Soft_Silver
        scale 4
    }
}

light_source
{
    <-7,8,1> colour rgb <1,1,1>
    spotlight
    point_at<0, 6, 5>
    radius 90
    tightness 5
    looks_like
    {
        sphere
        { <0,0,0>,1
          texture { Glass }
          finish { ambient 0.7 }
        }
    }

}



//lamp right
cone
{
    < 7, -3, 1> 1
    < 7, -2, 1> 0.1
    texture
    {
        pigment{Black}
        finish {diffuse 0.9 phong 1.0}
        scale 4
    }
}

cylinder
{
    <7, -2, 1>
    <7, 7, 1>
    0.1
    texture
    {
        Soft_Silver
        scale 4
    }
}

light_source
{
    <7,8,1> colour rgb <1,1,1>
    spotlight
    point_at<0, 6, 5>
    radius 90
    tightness 5
    looks_like
    {
        sphere
        {
            <0,0,0>,1
            texture { Glass }
            finish { ambient 0.7 }
        }
    }
}


//tv
box
{
    <4, 5, 3.5>
    <-4, 10, 4>
    texture
    {
        pigment {Black}
        finish {diffuse 0.9 phong 1.0}
        scale 2
    }

}

box
{
    <4, 5, 3.5>
    <-4, 10, 4>
    texture
    {
        uv_mapping
        pigment
        {
            image_map
            {
                png "tv.png"
            }
            scale <0.25,0.334,0.25>
            rotate<0,180,0>
        }
    }
    translate <0,1.35,0.6>
    scale <0.95,0.85,0.85>
}

light_source
{
    <0,8,-10> colour rgb <1,1,1>
    spotlight
    point_at<0, 5, -3>
    radius 40
    tightness 5
}


text 
{
    ttf "arial.ttf" "if(user.isDoingStuff() && user.hasUnsavedWork())" 0, 0
    pigment { Black }
    finish{ ambient 1 }
    scale 0.5
    translate <-5,7,17>
    //translate<-5,7+1*sin((clock*0.25)*2*pi),17> 
    //Rotate_Around_Trans(<0,10*clock,0>, <0,7,17>)  
}



text
{
    ttf "arial.ttf" "{ update(); }" 0, 0
    pigment { Black }
    finish{ ambient 1 } 
    scale 0.5
    translate <-1,6,17> 
    //translate<-5,7+1*sin(clock)*2*pi,17> 
} 

light_source
{
    <4,6.5,17> colour Green
    fade_distance 1.5
    fade_power 2
    shadowless
    looks_like
    {
        sphere
        { <0,0,0>,0.5
          texture { Glass }
          finish { ambient 0.7 }
        }
    }
    Axis_Rotate_Trans(<0,6.5,17>,10*clock)
}

light_source
{
    <-4,6.5,17> colour Blue
    fade_distance 1.5
    fade_power 2
    shadowless
    looks_like
    {
        sphere
        { <0,0,0>,0.5
          texture { Glass }
          finish { ambient 0.7 }
        }
    }
    Axis_Rotate_Trans(<0,6.5,17>,10*clock)
}

light_source
{
    <0,9,17> colour Red
    fade_distance 1.5
    fade_power 2
    shadowless
    looks_like
    {
        sphere
        { <0,0,0>,0.5
          texture { Glass }
          finish { ambient 0.7 }
        }
    }
    Axis_Rotate_Trans(<0,6.5,17>,10*clock)
}  

light_source
{
    <0,4,17> colour Yellow
    fade_distance 1.5
    fade_power 2
    shadowless
    looks_like
    {
        sphere
        { <0,0,0>,0.5
          texture { Glass }
          finish { ambient 0.7 }
        }
    }
    Axis_Rotate_Trans(<0,6.5,17>,10*clock)
}

background {colour White}
