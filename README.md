# ML-SLNS
Extended PMSM model and additional files for my EDPE 2023 article.

The important files in the repository are the following.

## Simulink project file 
```
├── SLNS.prj
```
Open the project to ensure that all the files are on the MATLAB path.

## Sample measurement data
```
├── MeasurementData.mat
```
It containts three data structs: `NM` (north pole) and `SM` (south pole) for the 
sinusoidal data and `PM` for the square-wave data.

## Model library
```
├── SLNS.slx
```
The model library contains the developed nonlinear PMSM model and its accessories.

## Injection simulations
```
├── PMSM_Sinusoidal.slx
├── PMSM_Sinusoidal.slx
```
The project includes these example simulations for the simulation of sinusoidal 
voltage injection and square-wave voltage injection. These models require the 
loading of `SM` and `PM` from `MeasurementData.mat`.

## Simulink helper functions
```
├── SL.m
```
Some helper functions to change the inport/outport layout of the masked accessory 
models in SLNS.slx. 
