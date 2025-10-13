# CNC Table Rotation Macros
_Recompute your work offset after rotating a CNC table — safely, repeatably, and across controllers._

**Why?** After a table rotation (A/B/C), the previously set work offset (e.g. G54) no longer aligns with your part’s feature. These macros read the current datum, rotate the vector about the table’s physical rotation center, and write a new datum (e.g. G59) you can activate immediately.

---

## Supported controllers

- **FANUC**: single-axis (A or B) and dual-axis (A-C, B-C) macros using system variables `#52xx` and `#532x`.  
  Files: `Fanuc/ROTATION_A.NC`, `ROTATION_B.NC`, `ROTATION_A-C.NC`, `ROTATION_B-C.NC`
- **HEIDENHAIN** (TNC): header macro `ROT_MACRO.H` using `SYSREAD/SYSWRITE` and `CYCL DEF 247`
- **MillPlus**: `ROT_MACRO.NC` using `G149/G150` for datum I/O

> **Note:** SELCA planned — folder present, macro to follow.

---

## How it works (math, briefly)

For each active work offset (X, Y, Z) and rotation axis center **R** (controller-specific), we:
1. Compute the vector from **R** to the current work origin.
2. Apply the rotation(s) using standard 2D rotations:
   - Rotate about C (Z) by angle **C**:  
     `x' =  x·cosC − y·sinC`  
     `y' =  y·cosC + x·sinC`
   - Rotate about A (X) by angle **A**:  
     `y'' = y'·cosA − z·sinA`  
     `z'' = z·cosA + y'·sinA`
   - Rotate about B (Y) by angle **B** similarly.
3. Shift back by **R**, then write the result to the target datum (G59 or controller equivalent).

---

## FANUC usage

**Files**
- `Fanuc/ROTATION_A.NC` — rotate around A (X-axis)
- `Fanuc/ROTATION_B.NC` — rotate around B (Y-axis)
- `Fanuc/ROTATION_A-C.NC` — rotate around C then A
- `Fanuc/ROTATION_B-C.NC` — rotate around C then B

**Call style (G65)**
- Letter → Variable mapping (relevant subset):  
  `A→#1`, `B→#2`, `C→#3`, `H→#11` (origin number 54–58), `X→#24`, `Y→#25`, `Z→#26` (post-corrections)
- **Rotation centers** use general variables (set before call):  
  - C-axis center: `#31 (X)`, `#32 (Y)`, `#33 (Z)`  
  - A-axis center: `#35 (Y)`, `#36 (Z)`  
  - B-axis center: `#31 (X)`, `#33 (Z)` (see file comments)

**Example: C then A (A-C)**
```gcode
(Define rotation centers)
#31=0   (C center X)
#32=0   (C center Y)
#33=0   (C center Z)
#35=0   (A center Y)
#36=0   (A center Z)

(Active origin is G54; we want to write a corrected G59)
G65 P5555  A90.  C30.  H54  X0.  Y0.  Z0.

(After call, G59 is written and activated by the macro)
