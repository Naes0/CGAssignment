#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#declare YMove = 0.15*clock;
#declare ZMove = 7.5*clock;

camera
{
    location <0, 5, -15>
    look_at <0, 5, 5>

    #if( clock <= 15 )
        location <0, 5 + YMove, -15 + ZMove/9>
        look_at <0, 5 + YMove, 5 + ZMove/9>
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
    <0, 0, 1>, 1
    pigment {White}
    translate<0, 0, 20>
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
