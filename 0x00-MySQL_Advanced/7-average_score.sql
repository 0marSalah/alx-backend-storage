-- procedure ComputeAverageScoreForUser that computes and store the average score for a student.
DELIMITER $$
CREATE PROCEDURE ComputeAverageScoreForUser
(
    IN user_id INT
)
BEGIN
    -- Decalre variables
    DECLARE avg_score FLOAT;

    -- Get average
    SELECT AVG(score) INTO avg_score FROM corrections c WHERE c.user_id = user_id;

    -- Update user
    UPDATE users SET average_score = avg_score WHERE users.id = user_id;

END $$
DELIMITER ;