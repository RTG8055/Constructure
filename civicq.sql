drop table players;

CREATE TABLE players (
  `id` BIGINT AUTO_INCREMENT,
  `name` VARCHAR(45),
  `reg_no` VARCHAR(45),
  `email` VARCHAR(45),
  `password` VARCHAR(200),
  `college` VARCHAR(20),
  -- `curr_round` playersBIGINT(20),
  `curr_ques_id` VARCHAR(20), -- xx_yy format xx corresponds to the round number and yy corresponds to the ques no.
  `r1_res` VARCHAR(20),
  `r2_res` VARCHAR(20),
  `r3_res` VARCHAR(20),
  `r4_res` VARCHAR(20),
  `r5_res` VARCHAR(20),
  `r6_res` VARCHAR(20),
  `curr_trial` INT(5), -- tells which trial is he currently on. 0 for fresh
  PRIMARY KEY (`id`));

CREATE TABLE `civicq`.`score` (
  `user_id` BIGINT REFERENCES `players` (`user_id`),
  `points` BIGINT(20),
  `pres_ques_id` VARCHAR(20)
  );

CREATE TABLE `civicq`.`questions` (
  `ques_id` VARCHAR(20),
  `question` VARCHAR(400),
  `op1` VARCHAR(300),
  `op2` VARCHAR(300),
  `op3` VARCHAR(300),
  `op4` VARCHAR(300),
  
  PRIMARY KEY (`ques_id`));


DELIMITER $$
CREATE PROCEDURE `insert_player`(IN p_name VARCHAR(45), IN p_regno VARCHAR(45), IN p_email VARCHAR(45), IN p_password VARCHAR(200), IN p_college varchar(20))
BEGIN
	INSERT INTO players(name, reg_no, email, password, college, curr_ques_id, r1_res, r2_res, r3_res, r4_res, r5_res, r6_res, curr_trial)
		values (p_name, p_regno, p_email, p_password, p_college, '01_01', 0, 0, 0, 0, 0, 0, 0);
END$$
DELIMITER;

call insert_player('rahul','150911112','abc@gmail.com','rahul123','MIT');

select * from players;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateLogin`(
IN p_username VARCHAR(45)
)
BEGIN
    SELECT * FROM tbl_user WHERE user_name = p_username;
END$$
DELIMITER ;