# ⏱️ Integer Clock Divider

An **Integer Clock Divider** is a digital circuit used to divide the frequency of a clock signal by an integer value. This repo demonstrates both **asynchronous** and **synchronous** implementations using different techniques.

## 🚀 Motivation

Clock dividers are vital for:
- Matching frequency between modules (e.g., CPU vs. UART).
- Reducing power consumption by lowering the clock frequency for low-performance blocks.

> Dynamic power ∝ frequency → Lowering clock frequency helps conserve power.

---

## 📊 Comparison: Synchronous vs Asynchronous

| Feature                         | Asynchronous                     | Synchronous                     |
|-------------------------------|----------------------------------|---------------------------------|
| Power Consumption              | Lower                            | Higher                          |
| Clock Jitter                   | Accumulates                      | Reduced                         |
| High-Frequency Clock Loading   | Reduced                          | Large                           |

---

## 📂 Repo Structure

```plaintext
📁 Integer-Clock-Divider/
├── .gitattributes
├── LICENSE
├── README.md
│
├── 📁 Asynchronous Clock Divider/
│   ├── 📁 rtl/
│   │   ├── clk_div.v
│   │   └── dff.v
│   └── 📁 tb/
│       ├── clk_div_tb.v
│       └── run.do
│
├── 📁 Synchronous Clock Divider/
│   ├── 📁 Even Clock Divider/
│   │   ├── 📁 rtl/
│   │   │   └── clk_div.v
│   │   └── 📁 tb/
│   │       ├── clk_div_tb.v
│   │       └── run.do
│   │
│   ├── 📁 General Clock Divider/
│   │   ├── 📁 Behavioral/
│   │   │   ├── 📁 rtl/
│   │   │   │   └── clk_div.v
│   │   │   └── 📁 tb/
│   │   │       ├── clk_div_tb.v
│   │   │       └── run.do
│   │   └── 📁 Ring Counter/
│   │       ├── 📁 rtl/
│   │       │   └── clk_div.v
│   │       └── 📁 tb/
│   │           ├── clk_div_tb.v
│   │           └── run.do
│   │
│   └── 📁 Odd Clock Divider/
│       ├── 📁 Mod-N Counter/
│       │   ├── 📁 rtl/
│       │   │   ├── clk_div.v
│       │   │   ├── dff_neg.v
│       │   │   └── dff_pos.v
│       │   └── 📁 tb/
│       │       ├── clk_div_tb.v
│       │       └── run.do
│       │
│       ├── 📁 Ring Counter/
│       │   ├── 📁 rtl/
│       │   │   └── clk_div.v
│       │   └── 📁 tb/
│       │       ├── clk_div_tb.v
│       │       └── run.do
│       │
│       └── 📁 T-FF/
│           ├── 📁 rtl/
│           │   └── clk_div.v
│           └── 📁 tb/
│               ├── clk_div_tb.v
│               └── run.do
│
└── 📁 doc/
    └── Integer Clock Divider.pdf

```
### 🔁 Asynchronous Clock Divider
- **Divider by 8**
- Block Diagram
![asynch_block_diagram](/doc/asynch_block_diagram.png)
- Waveform
![asynch_waveform](/doc/asynch_waveform.png)
- [RTL Code](https://github.com/Hythem-shaban/100-Days-of-RTL/tree/master/Day%20001%20-%20Integer%20Clock%20Divider/Asynchronous%20Clock%20Divider/rtl)
- [Testbench](https://github.com/Hythem-shaban/100-Days-of-RTL/tree/master/Day%20001%20-%20Integer%20Clock%20Divider/Asynchronous%20Clock%20Divider/tb)
- Simulation
![asynch_simulation](/doc/asynch_simulation.png)

---

### ⌚ Synchronous Clock Divider

#### ➕ Mod-N Counter (e.g., ÷3)
- State Diagram
![synch_odd_statediagram](/doc/synch_odd_statediagram.png)
- State Table
![synch_odd_statetable](/doc/synch_odd_statetable.png)
- Block Diagram
![synch_odd_block_diagram](/doc/synch_odd_block_diagram.png)
- Waveform
![synch_odd_waveform](/doc/synch_odd_waveform.png)
- [RTL Code](https://github.com/Hythem-shaban/100-Days-of-RTL/tree/master/Day%20001%20-%20Integer%20Clock%20Divider/Synchronous%20Clock%20Divider/Odd%20Clock%20Divider/Mod-N%20Counter/rtl)
- [Testbench](https://github.com/Hythem-shaban/100-Days-of-RTL/tree/master/Day%20001%20-%20Integer%20Clock%20Divider/Synchronous%20Clock%20Divider/Odd%20Clock%20Divider/Mod-N%20Counter/tb)
- Simulation
![synch_odd_simulation](/doc/synch_odd_simulation.png)


#### 🔄 T-Flip Flop Based Divider
- Block Diagram
![synch_odd_tff_block_diagram](/doc/synch_odd_tff_block_diagram.png)
- Waveform
![synch_odd_tff_waveform](/doc/synch_odd_tff_waveform.png)
- [RTL Code](https://github.com/Hythem-shaban/100-Days-of-RTL/tree/master/Day%20001%20-%20Integer%20Clock%20Divider/Synchronous%20Clock%20Divider/Odd%20Clock%20Divider/T-FF/rtl)
- [Testbench](https://github.com/Hythem-shaban/100-Days-of-RTL/tree/master/Day%20001%20-%20Integer%20Clock%20Divider/Synchronous%20Clock%20Divider/Odd%20Clock%20Divider/T-FF/tb)
- Simulation
![synch_odd_tff_simulation](/doc/synch_odd_tff_simulation.png)

#### 🔁 Ring Counter Divider
- Block Diagram
![synch_odd_ring_block_diagram](/doc/synch_odd_ring_block_diagram1.png)
![synch_odd_ring_block_diagram](/doc/synch_odd_ring_block_diagram2.png)
- Waveform
![synch_odd_ring_waveform](/doc/synch_odd_ring_waveform.png)
- [RTL Code](https://github.com/Hythem-shaban/100-Days-of-RTL/tree/master/Day%20001%20-%20Integer%20Clock%20Divider/Synchronous%20Clock%20Divider/Odd%20Clock%20Divider/Ring%20Counter/rtl)
- [Testbench](https://github.com/Hythem-shaban/100-Days-of-RTL/tree/master/Day%20001%20-%20Integer%20Clock%20Divider/Synchronous%20Clock%20Divider/Odd%20Clock%20Divider/Ring%20Counter/tb)
- Simulation
![synch_odd_ring_simulation](/doc/synch_odd_ring_simulation.png)

#### ➗ Behavioral Even Divider
- Uses a counter to count up to half the divide ratio.
- [RTL Code](https://github.com/Hythem-shaban/100-Days-of-RTL/tree/master/Day%20001%20-%20Integer%20Clock%20Divider/Synchronous%20Clock%20Divider/Even%20Clock%20Divider/rtl)
- [Testbench](https://github.com/Hythem-shaban/100-Days-of-RTL/tree/master/Day%20001%20-%20Integer%20Clock%20Divider/Synchronous%20Clock%20Divider/Even%20Clock%20Divider/tb)
- Simulation
![sync_even_simulation](/doc/sync_even_simulation.png)

#### 🔁 General Clock Divider (Even/Odd)
We use two counters; one counts with positive edge of the clock and the other counts with negative edge of the clock and each one counts to the division ration – 1.
If the value of the counter is greater than division ratio divided by two, a pulse is generated.
Then to generate the divided clock, we OR the pulse signals generated from the two counters if the division ratio is odd number and if it is an even number, then the divided clock is the same as the pulse generated from the positive edge counter.

- [RTL Code](https://github.com/Hythem-shaban/100-Days-of-RTL/tree/master/Day%20001%20-%20Integer%20Clock%20Divider/Synchronous%20Clock%20Divider/General%20Clock%20Divider/Behavioral/rtl)
- [Testbench](https://github.com/Hythem-shaban/100-Days-of-RTL/tree/master/Day%20001%20-%20Integer%20Clock%20Divider/Synchronous%20Clock%20Divider/General%20Clock%20Divider/Behavioral/tb)

- Simulation
even/4
![general1](/doc/general1.png)
odd/7
![general2](/doc/general2.png)


---

## 📜 License

This project is open source and available under the [MIT License](LICENSE).
