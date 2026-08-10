# ⚙️ HW3: Embedded Systems, Timers, EXTI Interrupts & Sensor LCD Interfacing

> **Course:** Instrumentation Engineering (Spring 2026 / 1405)  
> **Instructor:** Dr. Nayeri  
> **Student:** Amirali Dehghani (ID: 810102443)  
> **Microcontroller:** STM32F103 Series (ARM Cortex-M3)  
> **Tools:** STM32CubeIDE, STM32 HAL Library, Proteus 8 Professional, LaTeX  
> **Files Included:** C Source Code (`main.c`), STM32 Config (`.ioc`), Executables (`.hex`), Proteus Files (`.pdsprj`), Demonstration Videos (`.mp4`), Images (`img/`), and Solved Lab Report (`.pdf`).

---

## 📖 Overview

Homework 3 applies ARM Cortex-M3 (STM32F103) microcontrollers to industrial instrumentation, data acquisition, timing control, actuator driving, and visual display interfacing:
1. **Elevator Floor Indicator (7-Segment & EXTI Interrupts):** GPIO bitmasking for Common Cathode 7-Segment multiplexing, sequential 0–9 floor cycling, and zero-latency **External Interrupts (EXTI)** for emergency floor holds (`Floor 1` and `Floor 9`).
2. **DC Motor Speed & Direction Control (PWM TIM2 + L298 Driver + ADC):** Timer Prescaler & Auto-Reload mathematical tuning for $1\text{ kHz}$ PWM generation, 12-bit ADC potentiometer speed scaling, L298 H-Bridge driver interfacing, and EXTI direction toggling.
3. **15-Second Precision Countdown System (TIM3 Interrupts + 16x2 LCD + Alarm):** Hardware timer interrupt callback ($500\text{ ms}$ tick), synchronous $1\text{ Hz}$ LED blinking & Buzzer beeping, continuous alarm hold on expiration ($0\text{ s}$), real-time HD44780 LCD display, and instant `LogicState` reset.
4. **Automatic Industrial Sensor Identification System (12-Bit ADC + Alphanumeric LCD):** Multi-sensor simulation via potentiometer sampling with a 12-bit ADC ($0.8\text{ mV}$ resolution over $3.3\text{ V}$ range), automatic identification of **LM35 Temperature**, **HIH-4000 Humidity**, **MPX4115 Pressure**, and **MQ-135 Gas** sensors, and formatted LCD readout.

---

## 📂 Directory Structure

```text
HW3/
├── Q1/
│   ├── main.c                           # Source code for 7-Segment Elevator & EXTI emergency hold
│   ├── Q1.pdsprj                        # Proteus schematic (STM32 + 7-Segment + Buttons)
│   ├── HW3-1.hex                        # Compiled binary firmware
│   └── HW3-1.ioc                        # STM32CubeMX pinout & clock configuration
├── Q2/
│   ├── main.c                           # Source code for PWM DC motor speed & direction control
│   ├── Q2.pdsprj                        # Proteus schematic (STM32 + L298 Driver + DC Motor + Pot)
│   ├── Q2.hex                           # Compiled binary firmware
│   └── Q2.ioc                           # STM32CubeMX configuration (TIM2 PWM + ADC1 + EXTI)
├── Q3/
│   ├── main.c                           # Source code for 15s Timer Interrupt countdown system
│   ├── Q3.pdsprj                        # Proteus schematic (STM32 + 16x2 LCD + Buzzer + LED)
│   ├── Q3.hex                           # Compiled binary firmware
│   └── Q3.ioc                           # STM32CubeMX configuration (TIM3 Interrupt + GPIO)
├── Q4/
│   ├── main.c                           # Source code for Auto Sensor Classifier & Physical Unit LCD
│   ├── q4.pdsprj                        # Proteus schematic (STM32 + Active Pot + 16x2 LCD)
│   ├── Q4.hex                           # Compiled binary firmware
│   └── Q4.ioc                           # STM32CubeMX configuration (ADC1 12-Bit + GPIO LCD)
├── LCD Files/
│   ├── lcd.c                            # HD44780 LCD HAL driver implementation
│   └── lcd.h                            # HD44780 LCD library header
├── Video/
│   ├── Q1.mp4                           # Video demonstration for Question 1
│   ├── Q2.mp4                           # Video demonstration for Question 2
│   ├── Q3.mp4                           # Video demonstration for Question 3
│   └── Q4.mp4                           # Video demonstration for Question 4
├── img/
│   ├── q1-1.png - q1-5-9.png            # Pinouts, schematics & 7-Segment floor counting frames (0-9)
│   ├── q2-1.png - q2-4-2.png            # TIM2 PWM pinouts, L298 connections & motor rotation plots
│   ├── q3-1.png - q3-3.png              # Countdown LCD schematic, active state & zero-alarm hold
│   └── q4-1.png - q4-6.png              # ADC pinout & LCD readings for LM35, HIH4000, MPX4115, MQ135
├── Inst_HW3.pdf                         # Original Assignment Question Paper
└── Inst-HW3-810102443.pdf               # Complete Solved Lab Report (PDF)
```

---

## ✍️ Detailed Solutions & Hardware Implementations

---

### 🔹 Question 1: Elevator Floor Indicator (7-Segment & EXTI Interrupts)

#### **Hardware Setup & Pin Configuration:**
- **Display:** Common Cathode 7-Segment (`7SEG-COM-CATHODE`) connected to GPIOA pins `PA0` to `PA6` (Segments `A` through `G`).
- **Control Buttons:**
  - `PB0` (GPIO Input): Main start button (initiates continuous 0 to 9 floor cycling).
  - `PB1` (`EXTI1` Interrupt): Emergency Floor 1 Hold button.
  - `PB2` (`EXTI2` Interrupt): Emergency Floor 9 Hold button.

| Figure 1.1: STM32CubeIDE Pinout Configuration | Figure 1.2: Proteus Circuit Schematic |
| :---: | :---: |
| ![Q1 Pinout](img/q1-2.png) | ![Q1 Schematic](img/q1-1.png) |

#### **Embedded Software Logic & Atomic Register Updates:**
- **Pre-computed Hex Segment Table:**
  Digits `0` through `9` are mapped to Common Cathode hex codes:
  `segCode[10] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F}`.
- **Atomic Bitmasking (ODR Register):**
  To update segment outputs without altering upper GPIOA pins, direct atomic bitmasking is performed:
  `GPIOA->ODR = (GPIOA->ODR & 0xFF80) | segCode[currentNumber]`.
- **Zero-Latency Emergency Hold (EXTI Callbacks):**
  When an emergency button is pressed, the hardware interrupt handler `HAL_GPIO_EXTI_Callback` immediately alters `systemState` (`1` for Floor 1, `2` for Floor 9), breaking out of the $1000\text{ ms}$ floor delay loop with zero latency.

| Figure 1.3: Floor 0 (Initial) | Figure 1.4: Floor 5 (Cycling) | Figure 1.5: Emergency Hold Floor 1 (`EXTI1`) | Figure 1.6: Emergency Hold Floor 9 (`EXTI2`) |
| :---: | :---: | :---: | :---: |
| ![Floor 0](img/q1-3.png) | ![Floor 5](img/q1-4-5.png) | ![Emergency 1](img/q1-5-1.png) | ![Emergency 9](img/q1-5-9.png) |

---

### 🔹 Question 2: DC Motor Speed & Direction Control (PWM TIM2 + L298 Driver)

#### **Theoretical PWM Calculations ($1\text{ kHz}$ Frequency):**
Target PWM frequency $f_{\text{PWM}} = 1\text{ kHz}$ on a $f_{\text{TIM}} = 36\text{ MHz}$ internal clock:
$$f_{\text{PWM}} = \frac{f_{\text{TIM}}}{(\text{PSC} + 1) \times (\text{ARR} + 1)}$$
$$1000 = \frac{36 \times 10^6}{(\text{PSC} + 1) \times (\text{ARR} + 1)} \implies (\text{PSC} + 1) \times (\text{ARR} + 1) = 36000$$

Selected Timer Configuration:
- **Prescaler ($\text{PSC}$):** $35 \implies (\text{PSC} + 1) = 36$
- **Auto-Reload Register ($\text{ARR}$):** $999 \implies (\text{ARR} + 1) = 1000$

#### **Driver Interfacing & Control Logic:**
- **L298 H-Bridge Driver Setup:**
  - `ENA` (Enable A): Driven by TIM2 Channel 1 PWM signal (`PA0`) to control motor speed.
  - `IN1` (`PA2`) & `IN2` (`PA3`): Direction control pins (`1,0` = Clockwise; `0,1` = Counter-Clockwise).
  - `SEN_A` (Current Sense): Grounded (`GND`) to enable driver operation in Proteus.
- **Dynamic Speed Scaling:** 12-bit ADC potentiometer reading ($0 - 4095$ on `PA1`) is scaled linearly to the Timer Compare Register (`__HAL_TIM_SET_COMPARE`) range $0 - 1000$ ($\text{Duty} = \frac{\text{ADC}}{4095} \times 1000$).
- **EXTI Direction Inversion:** Push button on `PB0` triggers EXTI interrupt callback to invert `motorDirection`, instantly switching H-Bridge polarities.

| Figure 2.1: TIM2 PWM & ADC Pinout Config | Figure 2.2: L298 Motor Driver Proteus Schematic |
| :---: | :---: |
| ![Q2 Pinout](img/q2-1.png) | ![Q2 Schematic](img/q2-2.png) |

| Figure 2.3: Clockwise Rotation & Speed Adjustment | Figure 2.4: Counter-Clockwise Inversion (`EXTI`) |
| :---: | :---: |
| ![CW Rotation](img/q2-3-1.png) | ![CCW Rotation](img/q2-4-2.png) |

---

### 🔹 Question 3: 15-Second Precision Countdown System (TIM3 Interrupts + 16x2 LCD)

#### **Timer Interrupt Callbacks & Synchronous Alarm:**
- **Timer Configuration:** TIM3 configured with $\text{PSC} = 35999$ and $\text{ARR} = 499$, generating a precise hardware interrupt every **$500\text{ ms}$** ($2\text{ Hz}$ tick).
- **Sub-Second Tick Logic (`HAL_TIM_PeriodElapsedCallback`):**
  - Every $500\text{ ms}$ tick, an internal counter `timerTick` increments.
  - Modulo arithmetic (`timerTick % 2`) toggles the LED (`PA1`) and Buzzer (`PA2`) output pins, producing a synchronized **$1\text{ Hz}$ blinking LED and $1\text{ s}$ interval beeping alarm**.
  - Every two $500\text{ ms}$ ticks ($1\text{ s}$ full), `countdown` decreases by 1 second.
- **Expiration Hold ($0\text{ s}$):** Countdown halts and latches LED and Buzzer into a **continuous ON alarm state** until `PA0` reset switch is set to `0`.

| Figure 3.1: Countdown System Proteus Schematic |
| :---: |
| ![Q3 Schematic](img/q3-1.png) |

| Figure 3.2: Countdown Active (T-minus 8s, Blinking/Beeping) | Figure 3.3: Expiration Alarm Hold (0s, Continuous Alarm) |
| :---: | :---: |
| ![Countdown Active](img/q3-2.png) | ![Expiration Alarm](img/q3-3.png) |

---

### 🔹 Question 4: Automatic Industrial Multi-Sensor Identification System

#### **ADC Quantization & Sensor Classifier Decision Tree:**
- **ADC Unit:** 12-Bit resolution ADC1 Channel 1 (`PA1`), Reference Voltage $V_{\text{ref}} = 3.3\text{ V}$.
- **Resolution:** $2^{12} = 4096$ quantization levels $\implies \Delta V = \frac{3.3\text{ V}}{4095} \approx \mathbf{0.805\text{ mV}}$.

The system continuously samples input voltage and automatically classifies sensor types and physical quantities according to the voltage window:

| Voltage Range ($V$) | Classified Sensor | Physical Calculation Formula | Physical Range | LCD Output Line 1 / Line 2 |
| :---: | :---: | :---: | :---: | :---: |
| **$0.00 - 0.99\text{ V}$** | **LM35 Temperature** | $\text{Temp} = V \times 100$ | $0.0 - 99.0^\circ\text{C}$ | `Temp: LM35` / `Val: 50.00 C` |
| **$1.00 - 1.99\text{ V}$** | **HIH-4000 Humidity** | $\text{Humidity} = V \times 33.3$ | $33.3 - 66.3\%$ | `Hum: HIH-4000` / `Val: 49.95 %` |
| **$2.00 - 2.99\text{ V}$** | **MPX4115 Pressure** | $\text{Pressure} = V \times 100$ | $200.0 - 299.0\text{ hPa}$ | `Pres: MPX4115` / `Val: 250.00 hPa` |
| **$3.00 - 3.30\text{ V}$** | **MQ-135 Air Quality** | $\text{Air Quality} = \left(\frac{V}{3.3}\right) \times 100$ | $90.9 - 100.0\%$ | `Air: MQ-135` / `Val: 100.00 %` |

| Figure 4.1: STM32 ADC & LCD Pinout Config | Figure 4.2: Proteus Circuit Diagram |
| :---: | :---: |
| ![Q4 Pinout](img/q4-1.png) | ![Q4 Schematic](img/q4-2.png) |

#### **Proteus Simulation Readouts Across Sensor Windows:**

| Figure 4.3: LM35 Temp ($0.50\text{ V} \to 50.00^\circ\text{C}$) | Figure 4.4: HIH4000 Humidity ($1.50\text{ V} \to 49.95\%$) |
| :---: | :---: |
| ![LM35 LCD](img/q4-3.png) | ![HIH4000 LCD](img/q4-4.png) |

| Figure 4.5: MPX4115 Pressure ($2.50\text{ V} \to 250.00\text{ hPa}$) | Figure 4.6: MQ-135 Air Quality ($3.30\text{ V} \to 100.00\%$) |
| :---: | :---: |
| ![MPX4115 LCD](img/q4-5.png) | ![MQ135 LCD](img/q4-6.png) |

---

## 💻 How to Build & Simulate

### 1. Building Firmware in STM32CubeIDE
1. Open **STM32CubeIDE**.
2. File $\to$ Open Projects from File System $\to$ Select target folder (`HW3/Q1`, `HW3/Q2`, `HW3/Q3`, or `HW3/Q4`).
3. Build Project (`Ctrl + B`). The output `.hex` binary will generate automatically in `Debug/`.

### 2. Running Proteus Simulation
1. Launch **Proteus 8 Professional**.
2. Open target `.pdsprj` file from `HW3/Q1/`, `HW3/Q2/`, `HW3/Q3/`, or `HW3/Q4/`.
3. Double-click the STM32 microcontroller component and ensure **Program File** points to the corresponding `.hex` file.
4. Press **Play** to start real-time simulation. Demonstration MP4 videos are also available in `HW3/Video/`.

---

<div align="center">

**[Go back to Main Repository README](../README.md)**

</div>
