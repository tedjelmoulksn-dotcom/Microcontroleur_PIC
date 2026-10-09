# PIC16F877A — Bare-Metal C and Assembly Laboratories

Register-level exercises on the Microchip PICDEM 2 Plus board: GPIO sequencing, software timing, push-button input and external-interrupt handling. The repository also preserves assembly exercises illustrating control flow and seven-segment output.

## Hardware and toolchain

| Component | Context |
|---|---|
| MCU | PIC16F877A, 8-bit PIC architecture |
| Board | PICDEM 2 Plus |
| Clock | 4 MHz in the documented exercises |
| C toolchain | Legacy HI-TECH PICC under MPLAB |
| Debugging | MPLAB simulator and ICD 3 |
| Configuration | `__CONFIG(HS & WDTDIS & BOREN & LVPDIS)` |

These sources use legacy compiler headers and configuration syntax. An XC8 migration requires checking device headers, configuration pragmas and interrupt declarations.

## C exercises

| Source | Behaviour | Low-level concepts |
|---|---|---|
| [LED sequencer](src/chenillard.c) | Four LEDs advanced with approximately 187 ms dwell | TRIS direction registers, PORT writes and symbolic bit selection |
| [Push-button timer](src/minuterie.c) | Active-low RA4 input controls an RB0 LED with a nominal five-second timeout | Polling, port configuration and calibrated busy waits |
| [Interrupt-triggered buzzer](src/buzzer_interruption.c) | Counts RB0 falling edges; activates RC2 for counts five through seven and resets at eight | `INTEDG`, `INTE`, `GIE`, `INTF` and shared state |
| [Intermediate exercises](src/etapes_c/) | LED and delay experiments | Incremental bring-up and timing calibration |

The buzzer routine generates about 200 periods of 2 ms, corresponding to a nominal 500 Hz square wave. Delays are software loops, not hardware-timer services.

## Assembly exercises

[`src/asm/`](src/asm/) and [`src/asm_2023/`](src/asm_2023/) contain button polling, counters, timing routines and display lookup tables. They expose instruction-level operations such as bit tests, branches, status-flag checks and computed jumps through `PCL`.

See the [assembly module README](src/asm_2023/README.md) for source roles and integration requirements.

## Building and inspecting

```bash
git clone https://github.com/tedjelmoulksn-dotcom/Microcontroleur_PIC.git
cd Microcontroleur_PIC
```

Create a device-specific project in a compatible Microchip environment, add one exercise at a time and supply its compiler headers and startup configuration. Use the simulator to inspect TRIS/PORT registers, interrupt flags and cycle timing before testing the board.

Supporting reports are in [`docs/`](docs/). The related [GPS receiver project](https://github.com/tedjelmoulksn-dotcom/GPS_Microcontroller) extends this platform with serial communication.

## Implementation review

The essential debugging path follows configuration, register state and observable output in that order. Verify TRIS/PORT direction first, then the external-interrupt flag and vector, and finally the generated delay cycles. This links each firmware decision to a concrete board behaviour.

The source review highlights the following implementation details:

- The LED sequencer configures RB2–RB5 while its LED selection uses RB0–RB3; its final condition uses assignment instead of comparison.
- The buzzer handler name `interrupt_traitement_it` does not itself declare an interrupt routine in HI-TECH PICC. Check the compiler's actual ISR syntax and vector handling.
- ISR-shared state requires appropriate `volatile` declarations and an atomicity review.
- Busy waits depend on oscillator frequency, compiler optimisation and generated instructions. Button bounce can produce additional interrupt events.

Use device-specific compiler diagnostics and simulator traces to confirm the register/interrupt setup before board execution.

## Licence

No project-wide licence has been defined.
