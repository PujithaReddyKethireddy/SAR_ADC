# 🔥 10-bit SAR ADC Design (Top-Down Approach)

This project presents a **system-level design of a 10-bit SAR ADC** using a structured top-down methodology.

The design starts from specifications and progresses through:
- Error budgeting
- Monte Carlo analysis
- Iterative convergence
- Noise, timing, and power closure

---

# 📌 Specifications

| Parameter | Value |
|----------|------|
| Resolution | 10-bit |
| Sampling Rate | 1 MS/s |
| ENOB Target | ≥ 9.5 bits |
| Yield Target | ≥ 95% |
| Power Budget | ≤ 20 µW |

---

# 🧠 Design Methodology

The design follows a **top-down approach**:

1. **S0 — Specifications**
2. **S4 — Monte Carlo Yield Simulation**
3. **S5 — Iterative Design Optimization**
4. **S6 — Physical Parameter Extraction**
5. **SC0 — Noise Closure**
6. **SC1 — Timing Closure**
7. **SC2 — Power Closure**

All decisions are driven by **quantitative constraints**, not manual tuning.

---

# 📊 Key Results

| Metric | Value | Status |
|-------|------|--------|
| ENOB | 9.553 bits | ✅ |
| Yield | 97% | ✅ |
| Noise | 0.253 mV | ✅ |
| Power | 14.08 µW | ✅ |
| Timing | 645 ns | ✅ |
| 3σ ENOB | 9.472 bits | ⚠️ |

---

# ⚠️ Design Insight

Although the design meets yield and performance targets, **3σ robustness is slightly below specification**, indicating potential failures under worst-case mismatch conditions.

👉 This can be improved using:
- Digital calibration
- Better capacitor matching (layout)
- Slight increase in unit capacitance

---

# 📈 Analysis Included

- Monte Carlo ENOB distribution
- FFT analysis and evolution
- ENOB vs iteration
- Yield vs iteration
- Power vs capacitance
- DNL / INL computation

---

# ⚡ Key Trade-offs

| Improvement | Side Effect |
|------------|------------|
| Increase C_unit | ↑ Power, ↑ settling time |
| Reduce mismatch | ↑ layout complexity |
| Calibration | ↑ digital complexity |

---

# 🧠 Interview Takeaway

> Designed a 10-bit SAR ADC achieving 9.55 ENOB with 97% yield using a top-down methodology. Performed statistical validation and closed noise, timing, and power, while identifying mismatch as the dominant limitation affecting 3σ robustness.

---

# 🚀 Next Steps

- CDAC transistor-level design (LTspice)
- Comparator design (StrongARM)
- Layout-aware mismatch modeling
- Calibration implementation

---

# 📂 Folder Structure
