# VHDL Projects – FPGA Design Portfolio

This repository showcases a collection of digital hardware designs implemented in **VHDL** and tested on FPGA development boards. Each project demonstrates practical applications of signal processing, waveform generation, or hardware interfacing using synthesizable VHDL code.

---

## Projects Overview

### FIR Filter

**Description:**  
A digital **Finite Impulse Response (FIR) filter** implemented in VHDL, designed for real-time signal processing on FPGA. Supports configurable coefficients and sampling frequencies. Suitable for applications such as audio filtering or embedded DSP pipelines.

**Features:**
- Parameterized filter length
- Fixed-point arithmetic
- Synthesizable and testbench included

---

### VCO (Voltage-Controlled Oscillator)

#### VCO using CORDIC Algorithm

**Description:**  
Implements a **digital VCO** using the **CORDIC (COordinate Rotation DIgital Computer)** algorithm to generate sine and cosine waveforms. Frequency control is achieved by dynamically adjusting the phase increment.

**Highlights:**
- Purely algorithmic waveform generation (no LUTs)
- Adjustable frequency input
- Ideal for applications like digital modulators or DDS

#### VCO using Look-Up Table (LUT)

**Description:**  
An alternative implementation of the VCO using **precomputed sine/cosine values stored in a LUT**. Offers low-latency waveform generation with high precision.

**Highlights:**
- Fast sine/cosine output using ROM-based lookup
- Tradeoff between memory usage and resolution
- Easier to synthesize on FPGAs with block RAM

---

### VGA Controller

**Description:**  
A VGA signal generator written in VHDL, capable of driving a monitor **directly from an FPGA** via VGA cable. Generates synchronization signals (HSYNC and VSYNC) and renders patterns or images in the visible area.

**Features:**
- VGA 640x480 @ 60Hz timing
- Pixel and line counters
- Modular video memory or pattern generator
- Tested on physical VGA display


