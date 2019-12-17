// MEDICAL LINAC GEOMETRY FOR A VARIAN 2100C
// PHOTON BEAM GENERATION
// GEOMETRY PARAMATERS TO BE SET
:P fieldX 40*mm
:P fieldY 40*mm
:P SSD 1000*mm
:P tank_x 400.*mm
:P tank_y 400.*mm
:P tank_z 400.*mm
:P tank_t 2.0*mm
:P lens_r 60*mm
:P lens_d 700*mm
:P lens_h 0*mm
:P lens_NA 14.7
:P water_height 360*mm


// CREATE THE WORLD VOLUME
:VOLU globe BOX 200*cm 200*cm 200*cm G4_AIR
:VIS globe OFF
:VOLU world BOX 200*cm 200*cm 200*cm G4_AIR
:VOLU container1 BOX 200*cm 200*cm 200*cm G4_AIR
:VIS container1 OFF
:VOLU container2 BOX 200*cm 200*cm 200*cm G4_AIR
:VIS container2 OFF
:VOLU container3 BOX 200*cm 200*cm 200*cm G4_AIR
:VIS container3 OFF
:VOLU container4 BOX 200*cm 200*cm 200*cm G4_AIR
:VIS container4 OFF
:VOLU container5 BOX 200*cm 200*cm 200*cm G4_AIR
:VIS container5 OFF
:VOLU container6 BOX 200*cm 200*cm 200*cm G4_AIR
:VIS container6 OFF
:VIS world OFF
:ROTM RMW 270*deg 0.*deg 0.0
:PLACE world 1 globe RMW 0. 200.0*mm 0.
//:PLACE container1 1 globe RMW 70. -265.0*mm 0.
//:PLACE container2 1 globe RMW 100. -265.0*mm 0.
//:PLACE container3 1 globe RMW 70. -265.0*mm 0.
//:PLACE container4 1 globe RMW -30. -265.0*mm 0.
//:PLACE container5 1 globe RMW -60. -265.0*mm 0.
//:PLACE container6 1 globe RMW -30. -265.0*mm 0.

// INITIALIZE THE MATERIALS
:MIXT steel1 7.76 4 
       G4_Fe 0.935
       G4_S 0.01
       G4_Mn 0.05
       G4_C 0.005

// CREATE THE TARGETS
:ROTM RM0 0. 0. 0.
:VOLU targetA BOX 0.6*cm 0.6*cm 0.04445*cm G4_W
:COLOR targetA  0.0 1.0 1.0
:PLACE targetA  1 world RM0 0.0*cm 0.0*cm 0.20055*cm
:VOLU targetB BOX 0.6*cm 0.6*cm 0.07874*cm G4_Cu
:COLOR targetB 1.0 0.0 1.0
:PLACE targetB 1 world RM0 0.0*cm 0.0*cm 0.07736*cm

// CREATE THE FIRST PRIMARY COLLIMATOR
:ROTM RM1 180.*deg 0. 0.
:VOLU upperCollimator TUBS 1.0*cm 8.0*cm 3.0*cm 0.*deg 360.*deg G4_W
:COLOR upperCollimator 84/255 22/255 180/255
:PLACE upperCollimator 1 world RM0 0.0*cm 0.0*cm -1.0*cm 
:VIS upperCollimator ON

// CREATE THE FIRST LOWER COLLIMATOR
:SOLID collim_cone CONS 0.0*cm 0.5*cm 0.0*cm 1.7658592*cm 3.2*cm 0.0*deg 360.0*deg
:SOLID tracker_tube TUBS 0.0*cm 8.0*cm 3.1*cm 0.0*deg 360.0*deg
:SOLID CylMinusCone SUBTRACTION tracker_tube collim_cone RM0 0.0*cm 0.0*cm 0.0*cm
:VOLU CylMinusCone_vol CylMinusCone G4_W
:COLOR CylMinusCone_vol 1 178/255 34/255 34/255
:PLACE CylMinusCone_vol 1 world RM1 0.0*cm 0.0*cm 6.2*cm
:VIS CylMinusCone_vol ON

// CREATE THE Be WINDOW
:VOLU BeWTube TUBS 0.0*mm 36.0*mm 0.2*mm 0.0*deg 360.0*deg G4_Be
:COLOR BeWTube 0.0 0.25 0.0
:PLACE BeWTube 1 world RM0 0.0*mm 0.0*mm 100.0*mm
:VIS BeWTube ON

// CREATE THE FLATTENING FILTER
:VOLU FFL1A_1Cone CONS 0.0*cm 0.3*cm 0.0*cm 5.0*cm 2.5*cm 0.0*deg 360.0*deg G4_Cu
:COLOR FFL1A_1Cone 0.0 0.75 0.0
:PLACE FFL1A_1Cone 1 world RM0 0.0*mm 0.0*mm 130.0*mm
:VIS FFL1A_1Cone ON

// CREATE THE MIRROR
:VOLU MirrorTube TUBS 0.0*mm 63.0*mm 0.5*mm 0.0*deg 360.0*deg G4_MYLAR
:ROTM RM2 0.0 12.0*deg 0.0
:COLOR MirrorTube 0.0 0.75 1.0
:PLACE MirrorTube 1 world RM2 0.0*mm 0.0*mm 175.0*mm
:VIS MirrorTube ON

// CREATE THE IONIZATION CHAMBERS
:SOLID ICTubeW TUBS 0.0*mm (2.0*2.54*10.0)*mm (0.016*25.4)*mm 0.0*deg 360.0*deg
:SOLID ICTubeP TUBS 0.0*mm (2.0*2.54*10.0)*mm (0.010*25.4)*mm 0.0*deg 360.0*deg
:VOLU PCUTubeW1LV ICTubeW G4_KAPTON
:VOLU PCUTubeP1LV ICTubeP G4_KAPTON
:VOLU PCUTubeW2LV ICTubeW G4_KAPTON 
:VOLU PCUTubeP2LV ICTubeP G4_KAPTON
:VOLU PCUTubeW3LV ICTubeW G4_KAPTON 
:VOLU PCUTubeP3LV ICTubeP G4_KAPTON
:PLACE PCUTubeW1LV 1 world RM0 0.0*mm 0.0*mm 157.0*mm 
:PLACE PCUTubeP1LV 1 world RM0 0.0*mm 0.0*mm 158.0*mm 
:PLACE PCUTubeW2LV 1 world RM0 0.0*mm 0.0*mm 159.0*mm 
:PLACE PCUTubeP2LV 1 world RM0 0.0*mm 0.0*mm 160.0*mm 
:PLACE PCUTubeW3LV 1 world RM0 0.0*mm 0.0*mm 161.0*mm 
:PLACE PCUTubeP3LV 1 world RM0 0.0*mm 0.0*mm 162.0*mm 
:COLOR PCUTubeW1LV 0.0 1.0 0.25
:COLOR PCUTubeP1LV 0.0 0.25 1.0
:COLOR PCUTubeW2LV 0.0 0.75 0.50
:COLOR PCUTubeP2LV 0.0 0.50 0.75
:COLOR PCUTubeW3LV 0.0 0.75 0.25
:COLOR PCUTubeP3LV 0.0 0.25 0.75
:VIS PCUTubeW1LV ON
:VIS PCUTubeP1LV ON
:VIS PCUTubeW2LV ON
:VIS PCUTubeP2LV ON
:VIS PCUTubeW3LV ON
:VIS PCUTubeP3LV ON

// SET THE XJAW PARAMETERS
:P x 0.0*mm
:P y 0.0*mm
:P z (320.0+80./2.)*mm
:P theta sqrt(atan(($fieldX/2.0)/$SSD)*atan(($fieldX/2.0)/$SSD))*rad
:P dx 45.0*mm
:P dy 93.0*mm
:P dz (78./2.)*mm

// JAW1X
:P X $z*sin($theta)+$dx*cos($theta)
:P Y $y
:P Z $z*cos($theta)-$dx*sin($theta)
:P beta sqrt((atan($dx/$dz))*(atan($dx/$dz)))
:P R sqrt($dx*$dx+$dz*$dz)
:P p1x $X-$R*sin($theta+$beta)
:P p1y $Z-$R*cos($theta+$beta)
:P p2x $X+$R*sin($theta-$beta)
:P p2y $Z+$R*cos($theta-$beta)
:P dist sqrt(($p1x-$p2x)*($p1x-$p2x)+($p1y-$p2y)*($p1y-$p2y))
:P rot -$theta //y
:P hx sqrt(($dx*cos($theta)+$dz*sin($theta))*($dx*cos($theta)+$dz*sin($theta)))
:P hy sqrt($dy*$dy)
:P hz sqrt(($dz*cos($theta)+$dx*sin($theta))*($dz*cos($theta)+$dx*sin($theta)))

// JAW2X
:P X2 -($z*sin($theta)+$dx*cos($theta))
:P Y2 $y
:P Z2 $z*cos($theta)-$dx*sin($theta)
:P beta2 sqrt((atan($dx/$dz))*(atan($dx/$dz)))
:P R2 sqrt($dx*$dx+$dz*$dz)
:P p1x2 $X2+$R2*sin($theta+$beta2)
:P p1y2 $Z2-$R2*cos($theta+$beta2)
:P p2x2 $X2-$R2*sin($theta-$beta2)
:P p2y2 $Z2+$R2*cos($theta-$beta2)
:P dist2 sqrt(($p1x2-$p2x2)*($p1x2-$p2x2)+($p1y2-$p2y2)*($p1y2-$p2y2))
:P rot2 $theta //y
:P hx2 sqrt(($dx*cos($theta)+$dz*sin($theta))*($dx*cos($theta)+$dz*sin($theta)))
:P hy2 sqrt($dy*$dy)
:P hz2 sqrt(($dz*cos($theta)+$dx*sin($theta))*($dz*cos($theta)+$dx*sin($theta)))

// SET THE YJAW PARAMETERS
:P x2 0.0*mm
:P y2 0.0*mm
:P z2 (230.0+80./2.)*mm
:P theta2 sqrt((atan(($fieldY/2.0)/$SSD))*(atan(($fieldY/2.0)/$SSD)))*rad
:P dx2 93.0*mm
:P dy2 35.0*mm
:P dz2 (78./2.)*mm

// JAW1Y
:P X3 $x2
:P Y3 $z2*sin($theta2)+$dy2*cos($theta2)
:P Z3 $z2*cos($theta2)-$dy2*sin($theta2)
:P beta3 sqrt((atan($dy2/$dz2))*(atan($dy2/$dz2)))
:P R3 sqrt($dy2*$dy2+$dz2*$dz2)
:P p1x3 $Y3-$R3*sin($theta2+$beta3)
:P p1y3 $Z3-$R3*cos($theta2+$beta3)
:P p2x3 $Y3+$R3*sin($theta2-$beta3)
:P p2y3 $Z3+$R*cos($theta2-$beta3)
:P rot3 $theta2 //x
:P hx3 sqrt($dx2*$dx2)
:P hy3 sqrt(($dy2*cos($theta2)+$dz2*sin($theta2))*($dy2*cos($theta2)+$dz2*sin($theta2)))
:P hz3 sqrt(($dz2*cos($theta2)+$dy2*sin($theta2))*($dz2*cos($theta2)+$dy2*sin($theta2)))

// JAW2Y
:P X4 $x2
:P Y4 -($z2*sin($theta2)+$dy2*cos($theta2))
:P Z4 $z2*cos($theta2)-$dy2*sin($theta2)
:P beta4 sqrt((atan($dy2/$dz2))*(atan($dy2/$dz2)))
:P R4 sqrt($dy2*$dy2+$dz2*$dz2)
:P p1x4 $Y4+$R4*sin($theta2+$beta4)
:P p1y4 $Z3-$R3*cos($theta2+$beta3)
:P p2x4 $Y4-$R4*sin($theta2-$beta4)
:P p2y4 $Z4+$R4*cos($theta2-$beta4)
:P rot4 -$theta2 //x
:P hx4 sqrt($dx2*$dx2)
:P hy4 sqrt(($dy2*cos($theta2)+$dz2*sin($theta2))*($dy2*cos($theta2)+$dz2*sin($theta2)))
:P hz4 sqrt(($dz2*cos($theta2)+$dy2*sin($theta2))*($dz2*cos($theta2)+$dy2*sin($theta2)))

// CREATE JAW1X
:ROTM RMjaw1x 0.0 $rot 0.0
:VOLU jaw1x BOX $hx $hy $hz steel1
:COLOR jaw1x 1.0 0.8 0.
:PLACE jaw1x 1 world RMjaw1x $X $Y $Z
:VIS jaw1x ON

// CREATE JAW2X
:ROTM RMjaw2x 0.0 $rot2 0.0
:VOLU jaw2x BOX $hx2 $hy2 $hz2 steel1
:COLOR jaw2x 1.0 0.8 0.
:PLACE jaw2x 1 world RMjaw2x $X2 $Y2 $Z2
:VIS jaw2x ON

// CREATE JAW1Y
:ROTM RMjaw1y $rot3 0.0 0.0
:VOLU jaw1y BOX $hx3 $hy3 $hz3 steel1
:COLOR jaw1y 1. 0.25 0.0
:PLACE jaw1y 1 world RMjaw1y $X3 $Y3 $Z3
:VIS jaw1y ON

// CREATE JAW2Y
:ROTM RMjaw2y $rot4 0.0 0.0
:VOLU jaw2y BOX $hx4 $hy4 $hz4 steel1
:COLOR jaw2y 1.0 0.25 0.0
:PLACE jaw2y 1 world RMjaw2y $X4 $Y4 $Z4
:VIS jaw2y ON

// CREATE MLC
:VOLU MLCleaf BOX 50*mm 5*mm 25*mm G4_AIR
:COLOR MLCleaf 0.25 0.25 0.25
//:PLACE_PARAM MLCleaf 1 container1 LINEAR_Y RM0 6 10 -60.
//:PLACE_PARAM MLCleaf 1 container2 LINEAR_Y RM0 6 10 0.
//:PLACE_PARAM MLCleaf 1 container3 LINEAR_Y RM0 6 10 60.
//:PLACE_PARAM MLCleaf 1 container4 LINEAR_Y RM0 6 10 -60.
//:PLACE_PARAM MLCleaf 1 container5 LINEAR_Y RM0 6 10 0.
//:PLACE_PARAM MLCleaf 1 container6 LINEAR_Y RM0 6 10 60.
// BUILD WATER TANK RADIATION FIELD ANALYZER GEOMETRY

// BUILD MOTHER VOLUME
:VOLU mother BOX 200*cm 200*cm 200*cm G4_AIR
:VIS mother OFF

// BUILD WATER VOLUME
:VOLU water BOX ($tank_x-2*($tank_t))/2 ($water_height)/2 ($tank_z-2*($tank_t))/2 G4_WATER
:COLOUR water 0.0 0.5 1.0 0.1
:VIS water ON

// BUILD LENS DETECTOR
:VOLU detector1 TUBE 0*mm $lens_r-4 1*mm G4_GLASS_LEAD
:VOLU detector2 CONE 0.0*cm 2*cm 0.0*cm $lens_r 3.5*cm G4_GLASS_LEAD
:VOLU detector3 TUBE 0*mm 2*cm 25*mm G4_GLASS_LEAD
:VOLU detector4 BOX 30*mm 30*mm 50*mm G4_GLASS_LEAD
:COLOUR detector1 0.0 0.0 0.0 0.1
:COLOUR detector2 0.0 0.0 0.0 0.1
:COLOUR detector3 0.0 0.0 0.0 0.1
:COLOUR detector4 0.0 0.0 0.0 0.1
:VIS detector1 ON
:VIS detector2 ON
:VIS detector3 ON
:VIS detector4 ON

// BUILD TANKS
:VOLU tank_x1 BOX ($tank_t)/2 ($tank_y)/2 ($tank_z)/2-$tank_t  G4_GLASS_PLATE
:COLOUR tank_x1 0.0 0.5 1.0 0.1
:VIS tank_x1 ON

:VOLU tank_x2 BOX ($tank_t)/2 ($tank_y)/2 ($tank_z)/2-$tank_t  G4_GLASS_PLATE
:COLOUR tank_x2 0.0 0.5 1.0 0.1
:VIS tank_x2 ON

:VOLU tank_z1 BOX ($tank_x)/2 ($tank_y)/2 ($tank_t)/2  G4_GLASS_PLATE
:COLOUR tank_z1 0.0 0.5 1.0 0.1
:VIS tank_z1 ON

:VOLU tank_z2 BOX ($tank_x)/2 ($tank_y)/2 ($tank_t)/2 G4_GLASS_PLATE
:COLOUR tank_z2 0.0 0.5 1.0 0.1
:VIS tank_z2 ON

:VOLU tank_y BOX ($tank_x)/2-$tank_t ($tank_t)/2 ($tank_z)/2-$tank_t  G4_GLASS_PLATE
:COLOUR tank_y 0.0 0.5 1.0 0.1
:VIS tank_y ON

// ASSEMBLE GEOMETRY
:ROTM RM00 0. 0. 0.
:ROTM RM11 0. 90.*deg 0.
:ROTM RM22 90*deg 0. 0.
:PLACE tank_x1 1 mother RM00 (-$tank_x)/2+($tank_t)/2 0*mm 0*mm
:PLACE tank_x2 1 mother RM00 ($tank_x)/2-($tank_t)/2 0*mm 0*mm
:PLACE tank_z1 1 mother RM00 0*mm 0*mm (-$tank_z)/2+($tank_t)/2
:PLACE tank_z2 1 mother RM00 0*mm 0*mm ($tank_z)/2-($tank_t)/2
:PLACE tank_y 1 mother RM00 0*mm (-$tank_y)/2+($tank_t)/2 0*mm
:PLACE water 1 mother RM00 0*mm -(($tank_y)/2-$tank_t-($water_height)/2) 0*mm
:PLACE detector1 1 mother RM11 ($lens_d-5)*mm $tank_y/2-($tank_y-$water_height-$tank_t)+$lens_h 0*mm
:PLACE detector2 1 mother RM11 ($lens_d+25)*mm $tank_y/2-($tank_y-$water_height-$tank_t)+$lens_h 0*mm
:PLACE detector3 1 mother RM11 ($lens_d+25+15+40)*mm $tank_y/2-($tank_y-$water_height-$tank_t)+$lens_h 0*mm
:PLACE detector4 1 mother RM11 ($lens_d+28+35+40+50)*mm $tank_y/2-($tank_y-$water_height-$tank_t)+$lens_h 0*mm
:PLACE mother 1 world RM22 0*mm 0*mm 100*cm