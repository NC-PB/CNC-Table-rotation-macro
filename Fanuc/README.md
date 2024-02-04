## Files
The file name corresponds to the respective kinematics.
- A-Axis rotates around the X-Axis
- B-Axis rotates around the Y-Axis
- C-Axis rotates around the Z-Axis

| Axis   | File |
|--------|------|
| XYZ+A  |      |
| XYZ+B  |      |
| XYZ+AC |      |
| XYZ+BC |      |

A-Axis rotates around the X-Axis
B-Axis rotates around the Y-Axis
C-Axis rotates around the Z-Axis

## Usage
The Macros can be used as follow:
```
G65 P5555 A45. B-45. C90. H56 I0 J0 K0 X0 Y0 Z0
```

| Parameter | Explanation                       |
|-----------|-----------------------------------|
| P         | Program number                    |
| A         | Rotation angle around A           |
| B         | Rotation angle around B           |
| C         | Rotation angle around C           |
| H         | Origin number                     |
| I         | X Datum shift before the rotation |
| J         | Y Datum shift before the rotation |
| K         | Z Datum shift before the rotation |
| X         | X Datum shift after the rotation  |
| Y         | Y Datum shift after the rotation  |
| Z         | Z Datum shift after the rotation  |

The Macro will write the coordinates of the new position after the rotation in G59 and actvate it!
The datum shift after the rotation is only ment for fine adjustment during production done on the machine.

## Parameter assignment
The parameter assignment within the macro is as follows:

| Parameter number | Usage                             |
|------------------|-----------------------------------|
| #1               | Rotation angle around A           |
| #2               | Rotation angle around B           |
| #3               | Rotation angle around C           |
| #4               | X Datum shift before the rotation |
| #5               | Y Datum shift before the rotation |
| #6               | Z Datum shift before the rotation |
| #11              |                                   |
| #24              | X Datum shift after the rotation  |
|  #25             | Y Datum shift after the rotation  |
| #26              | Z Datum shift after the rotation  |

Depending on the rotation axes used, not all parameters are used.
