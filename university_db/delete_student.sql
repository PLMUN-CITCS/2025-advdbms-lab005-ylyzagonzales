USE `UniversityDB`;

-- Step 3: Delete the record for Charlie Lee
DELETE FROM `Students`
WHERE `FirstName` = 'Charlie' AND `LastName` = 'Lee'; -- More robust WHERE clause

-- Alternative using StudentID (preferred if you know the ID):
-- DELETE FROM `Students`
-- WHERE `StudentID` = 3;  -- Replace 3 with Charlie's actual StudentID
