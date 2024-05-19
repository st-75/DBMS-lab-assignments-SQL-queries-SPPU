-- Write a PL/SQL code block to calculate the area of a circle for a value of radius varying from 5 to
-- 9. Store the radius and the corresponding values of calculated area in an empty table named areas,
-- consisting of two columns, radius and area



-- Create the table to store the results if it doesn't already exist
CREATE TABLE areas (radius NUMBER,area NUMBER);

-- PL/SQL block to calculate and store the area of circles
DECLARE
    r NUMBER;
    a NUMBER;
BEGIN
    FOR r IN 5..9 LOOP
        a := 3.14159 * r * r; -- Area formula: pi * r^2
        INSERT INTO areas (radius, area) VALUES (r, a);
        COMMIT; -- Commit after each insertion to save the result
    END LOOP;
END;
/
