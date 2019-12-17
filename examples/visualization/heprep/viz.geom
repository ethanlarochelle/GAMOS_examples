:MATE_PROPERTIES_TABLE mpt
:MATEPT_ADD_ENERGIES mpt 1.6*eV 2.7*eV
:MATEPT_ADD_PROPERTY mpt RINDEX 1.33 1.33
:MATEPT_ADD_PROPERTY mpt RAYLEIGH_SCATCOEF 1.0*/mm 1.0*/mm
:MATEPT_ADD_PROPERTY mpt ABSCOEF 0.1*/mm 0.1*/mm
:MATEPT_ATTACH_TO_MATERIAL mpt G4_WATER
:MATE_PROPERTIES_TABLE mpt2
:MATEPT_ADD_ENERGIES mpt2 1.6*eV 2.7*eV
:MATEPT_ADD_PROPERTY mpt2 RINDEX 1.0 1.0
:MATEPT_ATTACH_TO_MATERIAL mpt2 G4_AIR

:VOLU world BOX 8*mm 8*mm 8*mm G4_AIR
:VIS world OFF
:VOLU sphere BOX 5*mm 5*mm 5*mm G4_WATER
:VIS sphere ON
:COLOUR sphere 1. 1. 1.
:ROTM RM0 0. 0. 0. 
:PLACE sphere 1 world RM0 0. 0. 0. 

