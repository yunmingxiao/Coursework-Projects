LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY fenpin IS
	PORT(CP,CP_MUSIC:IN STD_LOGIC;
		 CPOUT,MUSICOUT:OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE FEN OF fenpin IS	
	SIGNAL Z: INTEGER RANGE 0 TO 999;
	SIGNAL Y: INTEGER RANGE 0 TO 9;
	SIGNAL M: STD_LOGIC;
	BEGIN
		PROCESS(CP_MUSIC)
		BEGIN
			IF RISING_EDGE(CP_MUSIC) THEN
				IF (Y = 9) THEN 
					Y <= 0;
					M <= NOT M;
				ELSE
					Y <= Y+1;
				END IF;
			END IF;
		END PROCESS;
		
		MUSICOUT <= M;
		PROCESS(CP)
		
		BEGIN
			IF (RISING_EDGE(CP)) THEN
				IF (Z = 999) THEN 
					Z <= 0;
					CPOUT<= '1';
				ELSE
					Z <= Z+1;
					CPOUT<= '0';
				END IF;
			END IF;
		END PROCESS;
END ARCHITECTURE;