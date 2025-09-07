# Synchronous-Asynchronous-FIFO

# Design and Verification of Synchronous and Asynchronous FIFO using Verilog

## 📌 Overview

This project implements **FIFO (First-In-First-Out) memories** in Verilog.
Both **Synchronous FIFO** (single clock domain) and **Asynchronous FIFO** (dual clock domain) are designed and verified using self-checking testbenches.

The aim of this project is to understand:

* How FIFO buffers are designed.
* Handling read/write pointers and status flags.
* Synchronization issues in asynchronous FIFOs.
* Functional verification using Verilog/SystemVerilog testbenches.

## 🛠 Features

* **Synchronous FIFO**

  * Single clock domain.
  * Configurable data width and depth.
  * Status flags: empty, full, overflow, underflow.

* **Asynchronous FIFO**

  * Separate read and write clocks.
  * Pointer synchronization using Gray codes.
  * Status flags: empty, full.

* **Verification**

  * Self-checking testbenches for both FIFOs.
  * Randomized stimulus (read/write sequences).
  * Corner cases tested: reset, overflow, underflow.
  * 
## 📂 Project Structure


├── sfifo.v          # Synchronous FIFO RTL
├── sfifo_tb.v       # Testbench for synchronous FIFO
├── afifo.v          # Asynchronous FIFO RTL
├── afifo_tb.v       # Testbench for asynchronous FIFO
├── README.md        # Project documentation


## ✅ Verification Plan

* **Reset test**: Ensure FIFO pointers reset properly.
* **Write-only test**: Fill FIFO until "full".
* **Read-only test**: Empty FIFO until "empty".
* **Simultaneous read/write test**.
* **Overflow/Underflow test**.
* **Randomized stress test** for robustness.


## 👤 Author

**Manish Bhatta**
*(Feel free to add contributors, guides, or your GitHub profile link)*

