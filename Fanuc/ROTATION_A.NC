%
:5555(ROTATION_A)
(A-AXIS CENTER)
#35 = 0 (Y)
#36 = 0 (Z)

(CHECK VALIDITY)
IF[#11 LT 54] GOTO 100
IF[#11 GE 59] GOTO 100

(READ ORIGIN VALUES G54 - G58)
#11 = [#11 - 54] * 20
#21 = #[5221 + #11] (X)
#22 = #[5222 + #11] (Y)
#23 = #[5223 + #11] (Z)
#7  = #[5224 + #11] (A)

(CALCULATE DIFFERENCE ROTATION AXIS TO POINT)
#5 = #22 - #32 + #5 (Y)
#6 = #23 - #36 + #6 (Z)

(CALCULATE SHIFT WITH ANGLE A)
#15 = [#5 * COS[#1]] - [#6 * SIN[#1]] (Y)
#16 = [#6 * COS[#1]] + [#5 * SIN[#1]] (Z)

(WRITE G59)
#5321 = #11 + #24       (X)
#5322 = #32 + #15 + #25 (Y)
#5323 = #33 + #16 + #26 (Z)
#5324 = #7 (A)

G59 (ACTIVATE ORIGIN)
GOTO 200
N100 (ERROR)
#3000=1(WRONG ORIGIN NUMBER)
N200
M99
%
