-- a stored procedure ComputeAverageWeightedScoreForUser that computes
-- and store the average weighted score for a student.
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser
(
    IN user_id INT
)
BEGIN
    -- Decalre variables
    DECLARE avg_score FLOAT;

    -- Get average
    SELECT AVG(score * projects.weight) INTO avg_score
    FROM corrections
    INNER JOIN projects ON corrections.project_id = projects.id
    WHERE corrections.user_id = user_id;

    -- Update user
    UPDATE users SET average_score = avg_score WHERE users.id = user_id;

END $$
DELIMITER ;