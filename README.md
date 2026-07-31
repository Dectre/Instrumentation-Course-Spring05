# Instrumentation Course - Spring 2026 (1405) 🎓

## 📚 About This Repository
This repository contains homework assignments and projects for the **Instrumentation Engineering** course, completed in Spring 1405 (2026). The projects cover sensor data analysis, dynamic system simulation, and embedded programming using STM32 microcontrollers.

---

## 📋 Homework Overview

### 🔹 HW1: Sensor Data Analysis & Curve Fitting (MATLAB)
**Topic:** Statistical analysis of sensor data, calibration, and error modeling.

- **Q1:** Preliminary statistical analysis of raw sensor data.
- **Q2:** Implementation of **Least Squares (LS)** and **Recursive Least Squares (RLS)** algorithms for polynomial fitting (degrees 1, 3, and 9).
- **Q3:** Performance comparison between LS and RLS convergence rates.
- **Q4:** Hysteresis analysis in sensors and calculating full-scale hysteresis error.
- **Q5:** Time-domain analysis and plotting of sensor outputs.

---

### 🔹 HW2: Dynamic System Simulation (Simulink + Proteus)
**Topic:** Modeling measurement systems and signal conditioning circuits.

- **Q1:** Modeling 1st and 2nd order systems in **Simulink**; step response analysis.
- **Q2-Q4:** Signal conditioning circuit simulation in **Proteus**:
  - Operational Amplifier (Op-Amp) configurations
  - Active filters (Low-pass/High-pass)
  - Voltage-to-Frequency converters

---

### 🔹 HW3: Timers & LCD Interfacing (STM32 + HAL)
**Topic:** Embedded C programming with STM32CubeMX and HAL Library.

- **Q1:** Timer configuration for precise delays and LED blinking.
- **Q2:** Multi-digit **7-Segment display** scanning.
- **Q3:** Digital **stopwatch** implementation with millisecond precision.
- **Q4:** Integrating timers with **LCD** to display events and time.

---

### 🔹 HW4: Temperature Sensors, Load Cell & I2C Protocol (STM32)
**Topic:** Interfacing analog/digital temperature sensors, load cell weight measurement, and calibration.

- **Q1:** Implementation of three temperature sensor types:
  - **RTD (PT100):** Wheatstone bridge circuit interface for precise temperature measurement.
  - **Thermocouple (Type K):** Signal amplification and cold junction compensation simulation.
  - **Thermistor (NTC):** Voltage divider circuit with linearization techniques.
  
- **Q2:** **I2C Communication** with LM75 digital temperature sensor and LCD integration.

- **Q3:** **Load Cell & Digital Scale** implementation:
  - ADC-based weight measurement using strain gauge load cell
  - Voltage-to-mass conversion with calibration factor
  - Tare function via EXTI button interrupt (PA1 pin)
  - Real-time Net and Gross mass display (Kg) on LCD
  - Zero-offset calibration for accurate readings

---

### 🔹 HW5: Distance Sensors & PWM (STM32)
**Topic:** Distance measurement using Ultrasonic and IR sensors.

- **Q1:** **PWM generation** for Servo motor angle control.
- **Q2:** **IR Sharp sensor** interfacing and non-linear calibration.
- **Q3:** **HC-SR04 Ultrasonic Sensor**:
  - Trigger pulse generation
  - Echo pulse measurement via Input Capture
  - Distance calculation based on Time-of-Flight (ToF)
- **Q4:** Sensor fusion and distance display (cm) on LCD.

---

### 🔹 HW6: Advanced Environmental Sensors (STM32 + IoT)
**Topic:** Multi-sensor data acquisition and PC communication.

- **Q1:** Gas leak detection using **MQ-2** sensor with alarm activation.
- **Q2:** Weather station with **DHT11**:
  - Temperature and humidity measurement
  - Threshold adjustment via push buttons
  - Status display on LCD
- **Q3:** Light intensity measurement using **LDR** and ADC.
- **Q4:** Real-Time Clock (RTC) implementation with 32kHz crystal.
- **Q5:** Data logging to internal EEPROM.
- **Q6:** **UART communication** with PC for real-time data transmission.
- **Q7:** **BMP180 Pressure & Altitude sensor**:
  - Advanced I2C protocol implementation
  - Altitude calculation from barometric pressure
  - High-temperature warning system

---

## 🛠️ Tools & Technologies

| Category | Tools |
|----------|-------|
| **Microcontroller** | STM32F103C8T6 (Blue Pill) |
| **IDE** | STM32CubeIDE, Keil uVision |
| **Simulation** | Proteus 8 Professional |
| **Data Processing** | MATLAB R2026a, Simulink |
| **Library** | STM32 HAL Library |
| **Sensors** | DHT11, BMP180, HC-SR04, MQ-2, LM75, PT100, Thermocouple, Thermistor, LDR, Load Cell |

---

## 📂 Repository Structure

```text
Instrumentation-Course-Spring05/
├── HW1/          # Sensor Data Analysis & Curve Fitting (MATLAB)
├── HW2/          # Simulink & Proteus Simulation
├── HW3/          # Timers & LCD Interfacing (STM32)
├── HW4/          # Temperature Sensors, Load Cell & I2C
├── HW5/          # Distance Sensors & PWM
├── HW6/          # Advanced Environmental Sensors
├── LICENSE       # MIT License
└── README.md     # This file
```

---

## 🚀 How to Run

### For MATLAB Assignments:
```matlab
cd HW1/Codes
run q2.m  % Or any other script
```

### For STM32 Assignments:
1. Open the project in **STM32CubeIDE**.
2. Load the corresponding `.ioc` configuration file.
3. Build the project and flash it to your board.

### For Proteus Simulation:
1. Open the `.pdsprj` file in **Proteus**.
2. Assign the compiled `.hex` file to the microcontroller component.
3. Start the simulation.

---

## 📊 Reports & Results

Each homework includes a detailed PDF report:
- `Inst-HW*-810102443.pdf` – Detailed lab reports for each assignment

---

## 👨‍💻 Author
**Amirali Dehghani**  
Electrical Engineering Student (Control & Instrumentation)  
Student ID: **810102443**  
Term: **Spring 2026 (1405)**

---

## 📝 License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

<div align="center">

**⭐ If you found this repository helpful, please give it a star!**

</div>
