# 🔥 10-bit SAR ADC Design (Top-Down System Design)

This project implements a **complete system-level design of a 10-bit SAR ADC** using a structured top-down methodology.

The flow spans from **specification → modeling → statistical validation → physical closure**.

---

# 📌 Specifications (S0)

| Parameter | Value |
|----------|------|
| Resolution | 10-bit |
| Sampling Rate | 1 MS/s |
| ENOB Target | ≥ 9.5 bits |
| Yield Target | ≥ 95% |
| Power Budget | ≤ 20 µW |

---

# 🧠 Design Flow Overview

The design is divided into structured stages:

---

## 🔹 S0 — System Specifications
- Defined resolution, sampling rate, ENOB, yield, and power targets
- Derived LSB and allowable noise limits

---

## 🔹 S1 — Ideal ADC Modeling
- Implemented ideal SAR ADC behavior
- Verified ENOB ≈ 10 bits using FFT

---

## 🔹 S2 — Non-Idealities Introduction
- Added:
  - Thermal noise (kT/C)
  - Comparator noise
  - Offset
- Observed ENOB degradation

---

## 🔹 S3 — Error Breakdown
- Quantified impact of:
  - Noise
  - Mismatch
  - Offset
- Identified dominant contributors

---

## 🔹 S4 — Monte Carlo Simulation
- Performed statistical simulation (300+ runs)
- Generated:
  - ENOB histogram
  - CDF (yield estimation)
- Extracted:
  - Mean ENOB
  - Standard deviation
  - Yield %

---

## 🔹 S5 — Iterative Design Optimization
- Designed an automated loop to:
  - Adjust C_unit (noise control)
  - Adjust mismatch (yield control)
- Achieved convergence:
  - ENOB ≥ target
  - Yield ≥ 95%

---

## 🔹 S6 — Physical Parameter Derivation
- Derived:
  - Unit capacitance from kT/C
  - Total CDAC capacitance
  - Switch resistance constraints
- Linked system specs to circuit parameters

---

# 🔒 Closure Stages

---

## 🔹 SC0 — Noise Closure
- Total noise verified:
  - **0.253 mV < 0.5 LSB (0.488 mV)** ✅

---

## 🔹 SC1 — Timing Closure
- Derived using:
  - RC settling
  - Comparator regeneration
  - SAR bit cycling

\[
T_{total} = N × (T_{settle} + T_{comp} + T_{logic})
\]

- Result:
  - **645 ns < 1 µs** ✅

---

## 🔹 SC2 — Power Closure
- Power estimated from:
  - CDAC switching
  - Comparator
  - Logic
  - Reference

- Result:
  - **14.08 µW < 20 µW** ✅

---

# 📊 Final Results

| Metric | Value | Status |
|-------|------|--------|
| ENOB | 9.553 bits | ✅ |
| Yield | 97% | ✅ |
| Noise | 0.253 mV | ✅ |
| Timing | 645 ns | ✅ |
| Power | 14.08 µW | ✅ |
| 3σ ENOB | 9.472 bits | ⚠️ |

---

# ⚠️ Design Limitation

The design meets all primary constraints but:

- **3σ ENOB < 9.5 bits**
- Indicates potential failures under worst-case mismatch

---

## 🔧 Improvement Options

- Digital calibration (preferred)
- Improved capacitor matching (layout)
- Slight increase in unit capacitance

---

# 📈 Analysis Included

- Monte Carlo ENOB distribution
- FFT and spectral analysis
- FFT evolution across iterations
- ENOB vs iteration
- Yield vs iteration
- Power vs capacitance
- DNL / INL analysis

---

# ⚡ Key Trade-offs

| Parameter Change | Impact |
|----------------|--------|
| ↑ C_unit | ↓ Noise, ↑ Power, ↑ Settling time |
| ↓ Mismatch | ↑ Yield |
| Calibration | Improves 3σ without power penalty |

---

> Designed a 10-bit SAR ADC using a top-down methodology, achieving 9.55 ENOB with 97% yield while meeting power and timing constraints. Identified mismatch as the dominant limitation affecting 3σ robustness.

---

# 🚀 Next Steps

- CDAC transistor-level design (LTspice)
- Comparator design (StrongARM)
- Layout-aware mismatch modeling
- Calibration implementation

---
