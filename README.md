<h1 align="center" style="font-size:100px" >
  Digital Electronics Engineering
</h1>

  An digital electronic locking system that is using the Digilent Nexys4 Atrix-7 FPGA trainer board to design, implement and deploy working software in VHDL.

  The digital locking system is a state-based design with a 4-input combination that the user will select and assign with the bottom 16 switches. The switches are grouped in 4-bit patterns with following code sequence:

<p align="center">
  <img width="460" height="300" src="384Images/boardDiagram.png">
</p>

  The switches are then decoded using a decoder block that will compare the switch input to the button input. The bottom input is run through a button decoder that will convert 1 active high input to a 4-bit value that is used in the compression in the state logic. State diagram below.

<p align="center">
  <img width="460" height="300" src="384Images/stateDiagram.png">
</p>


## Project Code
> [Project Code](DesignProject.vhd): Find my code here

## System Requirements
- **Software**: Vivado 2019.2
- **Language**: VHDL

## Credits
#### Speacial Thanks:
- Dr. Lei Zhang
  - Digital Electronics Professor
- Dave Duguid
  - Digital ElectronicsLab Professor
