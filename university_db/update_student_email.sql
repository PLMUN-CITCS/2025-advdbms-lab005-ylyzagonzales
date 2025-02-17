USE `UniversityDB`;

-- Step 2: Update the Email for Bob Johnson
UPDATE `Students`
SET `Email` = 'bob.j@example.com'
WHERE `FirstName` = 'Bob' AND `LastName` = 'Johnson';  -- More robust WHERE clause

-- Alternative using StudentID (preferred if you know the ID):
-- UPDATE `Students`
-- SET `Email` = 'bob.j@example.com'
-- WHERE `StudentID` = 2;  -- Replace 2 with Bob's actual StudentID

