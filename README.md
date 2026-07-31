# Instrumentation Course - Spring 1405 (2026)

## Description
This repository contains course materials for the Instrumentation course from Spring 1405 (2026), including homework assignments, source code, simulations, and demonstration videos.

## Table of Contents
- [HW1: Sensor Calibration and Data Analysis](#hw1-sensor-calibration-and-data-analysis)
- [HW2: System Modeling and Simulink Simulation](#hw2-system-modeling-and-simulink-simulation)
- [HW3: Microcontroller Programming and LCD Interfacing](#hw3-microcontroller-programming-and-lcd-interfacing)
- [HW4: Temperature Sensors and Signal Conditioning](#hw4-temperature-sensors-and-signal-conditioning)
- [HW5: Ultrasonic and Infrared Distance Sensors](#hw5-ultrasonic-and-infrared-distance-sensors)
- [HW6: Environmental Sensors (Gas, Pressure, Humidity)](#hw6-environmental-sensors-gas-pressure-humidity)

---

## HW1: Sensor Calibration and Data Analysis
**Focus:** Sensor calibration, hysteresis analysis, and polynomial curve fitting using MATLAB

This assignment covers fundamental sensor characterization techniques:
- **Question 1-2:** Polynomial regression and least squares fitting (degrees 1, 3, and 9) using MATLAB to analyze sensor data and determine the best-fit model
- **Question 3:** Regularized least squares implementation for improved curve fitting
- **Question 4:** Hysteresis error analysis - calculating and visualizing the difference between increasing and decreasing input cycles, computing full-scale error percentage
- **Question 5:** Advanced curve fitting using MATLAB's Curve Fitting Toolbox (`sfit`)

**Files included:**
- `Codes/`: MATLAB scripts (`.m` files), datasets (`.csv`), and fitted models (`.sfit`)
- `Results/`: Generated plots and result tables

---

## HW2: System Modeling and Simulink Simulation
**Focus:** Dynamic system modeling, transfer functions, and Proteus circuit simulation

This assignment focuses on control systems and circuit simulation:
- **Question 1:** Simulink modeling of dynamic systems (`.slx` and `.mat` files for system simulation)
- **Questions 2-4:** Proteus circuit simulations for various instrumentation circuits including operational amplifiers, filters, and signal conditioning circuits

**Files included:**
- `Codes/`: Simulink models (`.slx`) and MATLAB data files (`.mat`)
- `Proteus/`: Circuit simulation projects (`.pdsprj`) for questions 2-4

---

## HW3: Microcontroller Programming and LCD Interfacing
**Focus:** STM32 microcontroller programming, GPIO control, and LCD display interfacing

This assignment introduces embedded systems programming:
- **Question 1:** Basic GPIO output - driving a 7-segment display with state machine logic
- **Question 2:** LED pattern control with timing sequences
- **Question 3:** Push-button input handling with debouncing
- **Question 4:** Combined input/output - interactive system with button control and display output

**Files included:**
- `Q1-Q4/`: STM32CubeIDE projects (`.ioc`), C source code (`main.c`), compiled HEX files, and Proteus simulations (`.pdsprj`)
- `LCD Files/`: LCD driver library (`lcd.c`, `lcd.h`)
- `Video/`: Demonstration videos (`.mp4`) for each question

---

## HW4: Temperature Sensors and Signal Conditioning
**Focus:** Implementation and calibration of different temperature sensor types (RTD, Thermistor, Thermocouple)

This assignment covers temperature measurement techniques:
- **Question 1:** Three-part implementation of temperature sensors:
  - **RTD (Resistance Temperature Detector):** Precision resistance measurement and temperature calculation
  - **Thermocouple:** Cold junction compensation and voltage-to-temperature conversion
  - **Thermistor:** Non-linear resistance-temperature characteristic using Steinhart-Hart equation
- **Question 2:** Digital temperature sensor interfacing with LCD display
- **Question 3:** Multi-sensor temperature monitoring system with data logging

**Files included:**
- `Q1/RTD, Thermistor, Thermocouple/`: STM32 projects with sensor-specific implementations
- `Q1/Fits.sfit, curveFit.m`: MATLAB curve fitting for sensor calibration
- `Datasets/`: Excel files with experimental data (`.xlsx`)
- `Videos/`: Demonstration videos for each question

---

## HW5: Ultrasonic and Infrared Distance Sensors
**Focus:** Proximity sensing using ultrasonic (HC-SR04) and infrared (TEP) sensors

This assignment explores distance measurement technologies:
- **Question 1:** Ultrasonic sensor interfacing - timer-based pulse width measurement for distance calculation
- **Question 2:** Advanced ultrasonic ranging with multiple measurement modes
- **Question 3:** Infrared proximity sensor implementation with analog signal processing
- **Question 4:** Comparative study and multi-sensor fusion combining ultrasonic and IR sensors

**Files included:**
- `Q1-Q4/`: STM32 projects with timer configurations, C source code, HEX files, and Proteus simulations
- `LCD Files/`: Shared LCD driver library
- Multiple demonstration videos showing real-time distance measurements

---

## HW6: Environmental Sensors (Gas, Pressure, Humidity)
**Focus:** Comprehensive environmental monitoring using multiple sensor types

This capstone assignment integrates various environmental sensors:
- **Question 1:** Gas sensor (MQ series) interfacing for air quality detection
- **Question 2:** Light-dependent resistor (LDR) for ambient light measurement
- **Question 3:** Flame sensor for fire detection applications
- **Question 4:** Water level detection system
- **Question 5:** Soil moisture sensor for agricultural applications
- **Question 6:** DHT11/DHT22 digital humidity and temperature sensor
- **Question 7:** BMP180 barometric pressure sensor with I2C communication - measures atmospheric pressure, temperature, and calculates altitude

**Files included:**
- `Q1-Q7/`: Complete STM32 projects with sensor drivers, C source code, HEX files, Proteus simulations, and demonstration videos
- `utils/`: Supporting libraries including:
  - `bmp180_for_stm32_hal.c/h`: BMP180 pressure sensor driver
  - `lcd.c/h`: LCD display driver
  - `mk_dht11.c/h`: DHT11 sensor driver
  - `Electronics Tree LDR Sensor Library/`: Proteus library for LDR simulation
  - `Gas Sensor Library for Proteus/`: Custom gas sensor models for simulation

---

## Repository Structure
Each homework directory typically contains:
- **PDF documents:** Assignment descriptions and reports (Persian and English)
- **Source code:** C files for STM32 microcontrollers (HAL library), MATLAB scripts
- **Project files:** STM32CubeIDE (`.ioc`), Proteus simulations (`.pdsprj`), Simulink models (`.slx`)
- **Compiled binaries:** HEX files for microcontroller programming
- **Datasets:** CSV and Excel files for data analysis
- **Videos:** MP4 demonstrations of working implementations
- **Libraries:** Reusable driver code for sensors and displays

## Tools and Technologies Used
- **MATLAB/Simulink:** Data analysis, curve fitting, system modeling
- **STM32CubeIDE:** Embedded C development for ARM Cortex-M microcontrollers
- **Proteus Design Suite:** Circuit simulation and microcontroller co-simulation
- **Sensors:** RTD, Thermocouple, Thermistor, Ultrasonic, IR, Gas, LDR, DHT11, BMP180
- **Communication Protocols:** GPIO, ADC, Timer, I2C, UART

## License
See the [LICENSE](./LICENSE) file for usage terms and conditions.
