USE `UniversityDB`;

-- Step 1: Insert student records into the `Students` table
INSERT INTO `Students` (`FirstName`, `LastName`, `EnrollmentDate`, `Email`)  -- StudentID is auto-incremented
VALUES
('Alice', 'Smith', '2023-09-01', 'alice.smith@example.com'),
('Bob', 'Johnson', '2023-09-01', 'bob.johnson@example.com'),
('Charlie', 'Lee', '2023-09-01', 'charlie.lee@example.com');

-- Alternative (if StudentID is NOT auto-incremented and you manage the IDs yourself):
-- INSERT INTO `Students` (StudentID, `FirstName`, `LastName`, `EnrollmentDate`, `Email`)
-- VALUES
--     (1, 'Alice', 'Smith', '2023-09-01', 'alice.smith@example.com'),
--     (2, 'Bob', 'Johnson', '2023-09-01', 'bob.johnson@example.com'),
--     (3, 'Charlie', 'Lee', '2023-09-01', 'charlie.lee@example.com');
