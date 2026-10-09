# PIC Assembly — Control Flow, Timing and Display Exercises

Instruction-level exercises preserved alongside the PIC16F877A C laboratories.

## Files

| Source | Focus |
|---|---|
| [`appuie_bouton.asm`](appuie_bouton.asm) | Button polling and conditional branching |
| [`COUNT_200ms.asm`](COUNT_200ms.asm) | Counter progression with software timing |
| [`Disp_7segment.asm`](Disp_7segment.asm) | Seven-segment output |
| [`Disp_7seg_PB.asm`](Disp_7seg_PB.asm) | Display/button interaction |
| [`tempo.asm`](tempo.asm) | Delay routines |
| [`corrige_loop.asm`](corrige_loop.asm) | Loop exercise |
| [`corrige_operation.asm`](corrige_operation.asm) | Register-operation exercise |

## Low-level mechanisms

The programs use register transfers, bit tests such as `btfss`, conditional `goto` sequences and status flags. Display tables illustrate computed branching with `addwf PCL` and literal returns through `retlw`.

Software delays should be interpreted in instruction cycles using the actual oscillator frequency. Page boundaries and program-counter behaviour matter when extending lookup tables.

## Building

Use a compatible Microchip assembler with the correct device include, configuration and linker settings. Some exercises reference helper modules outside this directory; inspect [`../asm/`](../asm/) and resolve the required include paths.

Treat individual files as exercises, not a single linked firmware application. Instructions placed after a `retlw` are unreachable through that return path and require review.

## Validation

No assembly, simulator run or board test was performed for this documentation update. Original comments and coursework attribution remain unchanged.

## Licence

No project-wide licence has been defined.
