%
:5555(ROTATION_B-C)
(C-AXIS CENTER)
#31 = 0 (X)
#32 = 0 (Y)
(B-AXIS CENTER)
#35 = 0 (X)
#36 = 0 (Z)

(CHECK VALIDITY)
IF[#11 LT 54] GOTO 100
IF[#11 GE 59] GOTO 100

(READ ORIGIN VALUES G54 - G58)
#11 = [#11 - 54] * 20
#21 = #[5221 + #11] (X)
#22 = #[5222 + #11] (Y)
#23 = #[5223 + #11] (Z)
#7  = #[5224 + #11] (B)
#8  = #[5225 + #11] (C)

(CALCULATE DIFFERENCE ROTATION AXIS TO POINT)
#4 = #21 - #31 + #4 (X)
#5 = #22 - #32 + #5 (Y)
#6 = #23 - #36 + #6 (Z)

(ROT AXIS OFFSET)
#9 = #31 - #35

(CALCULATE SHIFT WITH ANGLE C)
#14 = [#4 * COS[#3]] - [#5 * SIN[#3]] + #9 (X)
#15 = [#5 * COS[#3]] + [#4 * SIN[#3]] (Y)
#16 = #6                              (Z)

(CALCULATE SHIFT WITH ANGLE B)
#4 = [#14 * COS[#2]] - [#16 * SIN[#2]] (X)
#5 = #15                               (Y)
#6 = [#16 * COS[#2]] + [#14 * SIN[#2]] (Z)

(WRITE G59)
#5321 = #35 + #4 + #24 (X)
#5322 = #32 + #5 + #25 (Y)
#5323 = #36 + #6 + #26 (Z)
#5324 = #7
#5325 = #8

G59 (ACTIVATE ORIGIN)
GOTO 200
N100 (ERROR)
#3000=1(WRONG ORIGIN NUMBER)
N200
M99
%
