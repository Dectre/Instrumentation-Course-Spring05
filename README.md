<div align="center">

# 🎓 Instrumentation Course - Spring 2026 (1405)

[![Course](https://img.shields.io/badge/Course-Instrumentation-00758F?style=for-the-badge&logo=academic-pages)](https://ut.ac.ir)
[![University](https://img.shields.io/badge/University-University%20of%20Tehran-E31B23?style=for-the-badge&logo=education)](https://ut.ac.ir)
[![MCU](https://img.shields.io/badge/MCU-STM32F103%20(ARM%20Cortex--M3)-03234C?style=for-the-badge&logo=stmicroelectronics)](https://www.st.com)
[![Language](https://img.shields.io/badge/Language-C%20%2F%20MATLAB-00599C?style=for-the-badge&logo=c)](https://www.st.com)
[![Simulation](https://img.shields.io/badge/Simulation-Proteus%208%20%2F%20Simulink-0076D8?style=for-the-badge)](https://www.labcenter.com)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

**Comprehensive Assignments, Mathematical Modeling, Circuit Simulations & STM32 Firmware**

---

</div>

## 📚 About This Repository
This repository contains homework assignments, mathematical modeling, circuit schematics, Proteus simulations, and STM32 C firmware for the **Instrumentation** course taught by **Dr. Mohammadreza Nayeri** at the **University of Tehran** (Spring 1405 / 2026). The projects cover sensor calibration, signal conditioning, active filtering, data acquisition, and embedded microcontroller control.

---

## 📋 Homework Overview

### 🔹 [HW1: Sensor Data Analysis & Curve Fitting (MATLAB)](HW1/README.md)
**Topic:** Statistical analysis of sensor data, calibration, and error modeling.
- **Q1:** Statistical analysis of raw sensor data (Mean, Variance, Standard Error).
- **Q2 & Q3:** **Least Squares (LS)** and **Recursive Least Squares (RLS)** fitting (degrees 1, 3, 9) and convergence rate comparison.
- **Q4:** Hysteresis analysis and calculation of %FS hysteresis error.
- **Q5:** Thermal drift rate quantification (Zero Drift $8\text{ mV/}^\circ\text{C}$, Sensitivity Drift $-2\text{ mV/(mm}\cdot^\circ\text{C})$) and 2nd-order dynamic system identification.
👉 **[Read HW1 Full README](HW1/README.md)**

---

### 🔹 [HW2: Dynamic System Simulation & Signal Conditioning (Simulink + Proteus)](HW2/README.md)
**Topic:** Modeling measurement systems, Op-Amps, active filters, and bio-potential amplifiers.
- **Q1:** 1st and 2nd order system modeling in **Simulink** and $50\text{ Hz}$ LC Notch filter noise suppression.
- **Q2:** Multi-stage LM324 Op-Amp comparator circuit for NTC thermistor temperature thresholding.
- **Q3:** 4-Bit R-2R DAC, 74HC161 staircase generator, RC low-pass filter, and 74HC191 Up/Down counter triangular wave generator.
- **Q4:** 4-Stage ECG Bio-Potential Instrumentation Amplifier ($5000\times$ Gain, $10-100\text{ Hz}$ BPF, CMRR $50\text{ Hz}$ noise rejection, AD620 Wheatstone bridge).
👉 **[Read HW2 Full README](HW2/README.md)**

---

### 🔹 [HW3: Timers, EXTI Interrupts & Sensor Interfacing (STM32 + HAL)](HW3/README.md)
**Topic:** Embedded C programming with STM32CubeMX, Timers, EXTI interrupts, and ADC classifiers.
- **Q1:** Common Cathode 7-Segment Elevator floor display with zero-latency EXTI emergency holds (`PB1` / `PB2`).
- **Q2:** $1\text{ kHz}$ TIM2 PWM DC Motor speed scaling via 12-bit ADC and L298 driver direction toggling.
- **Q3:** Precision $500\text{ ms}$ TIM3 Timer Interrupt countdown system with 16x2 LCD display, $1\text{ Hz}$ alarm, and reset switch.
- **Q4:** Automatic Industrial Sensor Classifier (LM35 Temp, HIH-4000 Humidity, MPX4115 Pressure, MQ-135 Gas) via 12-bit ADC.
👉 **[Read HW3 Full README](HW3/README.md)**

---

### 🔹 [HW4: Temperature Sensors, Load Cell & I2C Protocol (STM32)](HW4/README.md)
**Topic:** Transducer physics (RTD, Thermocouple, Thermistor), I2C digital sensors, and loadcell digital scale.
- **Q1:** Multi-sensor temperature characterization (PT100 4-wire RTD $1\text{ mA}$ current loop, Type K Seebeck amplifier $A_v=100$, NTC Thermistor $\beta=4804\text{ K}$).
- **Q2:** **I2C Communication** with LM75 digital temperature sensor (`0.5^\circ\text{C}$ resolution) and LCD integration.
- **Q3:** **Load Cell & Digital Scale** implementation ($0-2\text{ kg}$ Loadcell, 3-Op-Amp Inst Amp $A_v=500$, 2nd-order damped vibration simulation, active LPF $f_c=0.5\text{ Hz}$, EXTI zero-offset Tare calibration).
👉 **[Read HW4 Full README](HW4/README.md)**

---

### 🔹 [HW5: Motor Drivers, Distance Sensors & Encoder Decoding (STM32)](HW5/README.md)
**Topic:** Electromechanical actuation, Time-of-Flight rangefinding, Optocounters, and Quadrature Encoder decoding.
- **Q1:** DC Motor speed and direction control using L293D H-Bridge driver and PWM duty cycle modulation.
- **Q2:** Solar Tracker Panel angle control using $1.8^\circ$ Stepper Motor and ULN2003A driver (Manual mode, Auto tracking $1.8^\circ / 2\text{ s}$, high-speed $10\text{ ms}$ Reset rewind, Full-Step vs Half-Step analysis).
- **Q3:** ToF Ultrasonic Distance Meter ($d = \frac{t \cdot 0.034}{2}\text{ cm}$) and active reflection IR proximity obstacle sensor.
- **Q4:** Potentiometer angle sensing ($0.0659^\circ$ resolution), Optocounter speed sensing ($N = 23$ slots), and Incremental Rotary Encoder Quadrature Decoding (**1x**, **2x**, and **4x** modes down to $0.342^\circ$ resolution).
👉 **[Read HW5 Full README](HW5/README.md)**

---

### 🔹 [HW6: Advanced Environmental Sensors & Telemetry (STM32 + IoT)](HW6/README.md)
**Topic:** Gas chemiresistors, single-wire climate sensors, turbine flow meters, and USART serial telemetry.
- **Q1:** MQ-4 Methane/Natural Gas Sensor ($\text{SnO}_2$ heated semiconductor physics) with $D_0$ digital leak alarm.
- **Q2:** DHT11 Climate Controller with non-blocking multi-menu LCD interface, proportional PWM fan speed control ($\Delta T$), and independent heater/humidifier feedback.
- **Q3:** LDR Light Module sensitivity thresholding ($SRV = 10\text{ k}\Omega$, Threshold = 1, 3, 5).
- **Q4:** Turbine/Hall-Effect Pulse Flow Rate Meter ($f = 7.5 Q \implies Q = \frac{f}{7.5}\text{ L/min}$).
- **Q5:** MPX4115 Absolute Pressure Sensor ($V_{\text{out}} = V_s(0.009P - 0.095)$) with 12-bit ADC quantization.
- **Q6:** Industrial Water Tank Liquid Level Control ($< 25\%$ critical threshold, L293D DC motor pump, dual status LEDs).
- **Q7:** BMP180 Barometric Pressure & Altitude Sensor ($h = 44330 \left(1 - (P/P_0)^{0.1903}\right)$) with USART1 Virtual Terminal stream and $>40^\circ\text{C}$ over-temperature warnings.
👉 **[Read HW6 Full README](HW6/README.md)**

---

## 🛠️ Tools & Technologies

| Category | Tools & Hardware |
|---|---|
| **Microcontrollers** | STM32F103C8T6 (Blue Pill), STM32F103R6 (ARM Cortex-M3) |
| **IDE & Toolchain** | STM32CubeIDE, Keil uVision, STM32CubeMX |
| **Simulation** | Proteus 9 Professional, MATLAB R2025b, Simulink |
| **Libraries** | STM32 HAL Library, CMSIS |
| **Sensors** | DHT11, BMP180, HC-SR04, Sharp IR, MQ-4, MQ-135, LM75, PT100 RTD, Type K Thermocouple, NTC Thermistor, LDR, Load Cell, Hall Flow Turbine |
| **Actuators & Drivers** | DC Motors, Servo Motors, 1.8° Stepper Motors, L298 H-Bridge, L293D H-Bridge, ULN2003A Darlington Array |

---

## 📂 Repository Structure

```text
Instrumentation-Course-Spring05/
├── HW1/          # Sensor Data Analysis & Curve Fitting (MATLAB)
├── HW2/          # Simulink & Proteus Active Filters, Op-Amps & ECG Amplifier
├── HW3/          # Timers, EXTI Interrupts, PWM Motor & ADC Sensor Classifier
├── HW4/          # Temperature Sensors, LM75 I2C & Digital Scale
├── HW5/          # DC/Stepper Motors, Ultrasonic/IR & 4x Encoder Decoding
├── HW6/          # Advanced Environmental Sensors, DHT11 & BMP180 Altitude
├── LICENSE       # MIT License
└── README.md     # Main Repository README
```

---

## 🚀 How to Run

### For MATLAB Assignments:
```matlab
cd HW1/
run curveFit.m  % Or any other script
```

### For STM32 Assignments:
1. Open target project in **STM32CubeIDE**.
2. Load the corresponding `.ioc` configuration file.
3. Build project (`Ctrl + B`) to generate output `.hex` binary.

### For Proteus Simulation:
1. Open the `.pdsprj` file in **Proteus 9 Professional**.
2. Assign the compiled `.hex` file to the microcontroller component.
3. Click **Play** to start the simulation.

---

## 📊 Reports & Results

Each homework directory includes complete, professionally written LaTeX PDF reports:
- `HW1/Inst-HW1-810102443.pdf`
- `HW2/Instr-HW2-810102443.pdf`
- `HW3/Inst-HW3-810102443.pdf`
- `HW4/Instr-HW4-810102443.pdf`
- `HW5/Report.pdf`
- `HW6/Report.pdf`

---

## 👨‍💻 Author
**Amirali Dehghani** | Electrical Engineering Student (Control)  
University of Tehran, School of Electrical & Computer Engineering

---

## 📝 License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

<div align="center">

**⭐ If you found this repository helpful, please give it a star!**

</div>
