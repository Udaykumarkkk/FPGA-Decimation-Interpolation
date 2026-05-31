FPGA CHALLENGE ROUND-1 SUBMISSION
================================

Project Title:
FIR-Based Decimation by 3 and Interpolation by 12 Using Xilinx FIR Compiler IP

Submitted By:
Name: [Your Name]
Email: [Your Email]
Phone: [Your Phone Number]

Project Summary:
This project implements a multirate DSP system that performs
decimation by 3 followed by interpolation by 12 on a 16-bit
Q1.15 fixed-point signal. Xilinx FIR Compiler IP cores are used
to implement both the decimator and interpolator using 51-tap
low-pass FIR filters.

Input Specifications:
- Signal Type : Sine Wave
- Frequency   : 1 MHz
- Amplitude   : 0.999
- Sampling Rate : 120 MHz
- Format      : Q1.15 (16-bit Signed Fixed Point)

Tools Used:
- Xilinx Vivado
- Verilog HDL
- Python 3.x
- NumPy
- Matplotlib
- Xilinx FIR Compiler IP

Files Included:
1. Vivado project files
2. Verilog source files
3. Testbench files
4. Python scripts
5. Input signal file
6. Decimator output file
7. Interpolator output file
8. FFT plots
9. Project report

Sampling Rates:
- Input Signal             : 120 MHz
- After Decimation by 3    : 40 MHz
- After Interpolation by 12: 480 MHz

Remarks:
The design was verified using Vivado simulation and FFT analysis.
Simulation waveforms and FFT plots are included in the report.

End of File