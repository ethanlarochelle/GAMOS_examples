//----------------------------------------------------------------//

// BUILD MEDIUM PROPERTIES

:MATE_PROPERTIES_TABLE mpt1
:MATEPT_ADD_WAVELENGTHS mpt1 600*wvnm
:MATEPT_ADD_PROPERTY mpt1 RINDEX 1.5
:MATEPT_ADD_PROPERTY mpt1 ABSCOEF 10.0*/cm
:MATEPT_ADD_PROPERTY mpt1 MIE_SCATCOEF 90.0*/cm
:MATEPT_ADD_PROPERTY mpt1 MIE_GVALUE 0.0
:MATEPT_ATTACH_TO_MATERIAL mpt1 G4_WATER

:MATE_PROPERTIES_TABLE mpt2
:MATEPT_ADD_WAVELENGTHS mpt2 600*wvnm
:MATEPT_ADD_PROPERTY mpt2 RINDEX 1.0
:MATEPT_ATTACH_TO_MATERIAL mpt2 G4_AIR

// BUILD GEOMETRY

:VOLU world BOX 50.*mm 50.*mm 50.*mm G4_AIR
:VIS world OFF
:VOLU medium BOX 50.*mm 50.*mm 10.0*mm G4_WATER
:VIS medium ON
:ROTM RM0 0. 0. 0.
:PLACE medium 1 world RM0 0. 0. 0.

:VOLU reflectance BOX 50.*mm 50.*mm 10.*mm G4_AIR
:VIS reflectance ON
:COLOUR reflectance 1. 0. 0.
:PLACE reflectance 1 world RM0 0.*mm 0.*mm (20.0000001)*mm

//----------------------------------------------------------------//