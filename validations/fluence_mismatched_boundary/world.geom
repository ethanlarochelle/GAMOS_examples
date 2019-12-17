//----------------------------------------------------------------//

// BUILD MEDIUM PROPERTIES

:MATE_PROPERTIES_TABLE mpt1
:MATEPT_ADD_WAVELENGTHS mpt1 600*wvnm
:MATEPT_ADD_PROPERTY mpt1 RINDEX 1.37
:MATEPT_ADD_PROPERTY mpt1 ABSCOEF 0.1*/cm
:MATEPT_ADD_PROPERTY mpt1 MIE_SCATCOEF 100.0*/cm
:MATEPT_ADD_PROPERTY mpt1 MIE_GVALUE 0.9
:MATEPT_ATTACH_TO_MATERIAL mpt1 G4_WATER

:MATE_PROPERTIES_TABLE mpt2
:MATEPT_ADD_WAVELENGTHS mpt2 600*wvnm
:MATEPT_ADD_PROPERTY mpt2 RINDEX 1.0
:MATEPT_ATTACH_TO_MATERIAL mpt2 G4_AIR

// BUILD GEOMETRY

:VOLU world BOX 100.*mm 100.*mm 100.*mm G4_AIR
:VIS world OFF
:VOLU medium BOX 100.*mm 100.*mm 50.*mm G4_WATER
:VIS medium ON
:VOLU container BOX 100.*mm 100.*mm 0.5*cm G4_WATER
:VIS container ON
:COLOUR container 1. 0. 0.
:VOLU voxel BOX 100.*mm 100.*mm 0.0025*cm G4_WATER
:VIS voxel OFF
:ROTM RM0 0. 0. 0.
:PLACE medium 1 world RM0 0.*mm 0.*mm 0.*mm
:PLACE container 1 medium RM0 0.*mm 0.*mm 45.0*mm
:PLACE_PARAM voxel 1 container PHANTOM 1. 1. 200. 200.*mm 200.*mm 0.005*cm

//----------------------------------------------------------------//