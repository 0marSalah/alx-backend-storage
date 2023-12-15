-- stored procedure AddBonus that adds a new correction for a student.
DELIMITER $$
CREATE PROCEDURE AddBonus
(
    IN user_id INT,
    IN project_name VARCHAR(255),
    IN score INT
)
BEGIN
    -- Decalre variables
    DECLARE project_id INT;

    -- Get project_id
    SELECT id INTO project_id FROM projects WHERE name = project_name;

    -- if project exist grap it's id
    -- else create it and grap it's id
    IF project_id IS NULL THEN
        INSERT INTO projects (name) VALUES (project_name);
        SELECT id INTO project_id FROM projects WHERE name = project_name;
    END IF;

    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, project_id, score);
END $$
DELIMITER ;
