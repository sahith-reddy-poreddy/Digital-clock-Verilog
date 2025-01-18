# Digital Clock System - Verilog HDL

This repository contains the Verilog HDL implementation of a digital clock system. The project demonstrates the design, simulation, and functionality of a digital clock using modular Verilog code and a testbench.

## Table of Contents

- [Overview](#overview)
- [Files](#files)
- [Modules Description](#modules-description)
- [Getting Started](#getting-started)
- [Simulation](#simulation)
- [Acknowledgments](#acknowledgments)

## Overview

The digital clock system is implemented using Verilog HDL, featuring:
- **Clock division**: Derives a 1Hz clock signal from a higher frequency.
- **Binary-Coded Decimal (BCD) counters**: Counts seconds, minutes, and hours.
- **Testbench**: Validates the functionality of the digital clock.

This project is modular, making it easy to understand and extend.

## Files

| File Name          | Description                                   |
|--------------------|-----------------------------------------------|
| `digital_clock.v`  | Top-level module integrating all components. |
| `clockdivider.v`   | Clock divider to generate a 1Hz signal.      |
| `bcd_counter.v`    | BCD counter for seconds and minutes.         |
| `hours_counter.v`  | Hour counter for 24-hour format.             |
| `tb_clock.v`       | Testbench for simulating the digital clock.  |

## Modules Description

### 1. `digital_clock.v`
- **Purpose**: Top-level module integrating all the counters and the clock divider.
- **Inputs**: `clk`, `reset`
- **Outputs**:
  - `sec_tens`, `sec_units`: Seconds (tens and units)
  - `min_tens`, `min_units`: Minutes (tens and units)
  - `hr_tens`, `hr_units`: Hours (tens and units)

### 2. `clockdivider.v`
- **Purpose**: Converts a 50MHz clock signal into a 1Hz clock signal.
- **Inputs**: `clk`, `reset`
- **Outputs**: `clk_1hz`

### 3. `bcd_counter.v`
- **Purpose**: BCD counter for seconds and minutes (0-59).
- **Inputs**: `clk`, `reset`, `enable`
- **Outputs**: `tens`, `units`

### 4. `hours_counter.v`
- **Purpose**: Counts hours in a 24-hour format (0-23).
- **Inputs**: `clk`, `reset`, `enable`
- **Outputs**: `tens`, `units`

### 5. `tb_clock.v`
- **Purpose**: Testbench to simulate the digital clock.
- **Simulates**:
  - Clock and reset signals.
  - Verification of seconds, minutes, and hours increment.

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/sahith-reddy-poreddy/Digital-clock-Verilog.git
   cd Digital-clock-Verilog
   ```

2. Open the project in your preferred Verilog IDE or simulator (e.g., ModelSim, Vivado).

3. Compile and simulate the design.

## Simulation

1. Load the testbench `tb_clock.v` in your Verilog simulator.
2. Observe the waveforms or printed outputs to verify the functionality.
3. Ensure that:
   - Seconds reset after 59.
   - Minutes reset after 59.
   - Hours reset after 23.

## Acknowledgments

- Verilog HDL documentation and resources.
- Logisim for circuit visualization and validation.

