CREATE TABLE `civicq`.`players` (
  `user_id` BIGINT AUTO_INCREMENT,
  `name` VARCHAR(45),
  `reg_no` VARCHAR(45),
  `user_email` VARCHAR(45),
  `user_password` VARCHAR(200),
  `college` VARCHAR(20),
  -- `curr_round` BIGINT(20),
  `curr_ques_id` VARCHAR(20),
  `r1_res` VARCHAR(20),
  `r2_res` VARCHAR(20),
  `r3_res` VARCHAR(20),
  `r4_res` VARCHAR(20),
  `r5_res` VARCHAR(20),
  `r6_res` VARCHAR(20),
  `curr_trial` INT(5) -- tells which trial is he currently on. 0 for fresh
  PRIMARY KEY (`user_id`));

CREATE TABLE `civicq`.`score` (
  `user_id` BIGINT REFERENCES `players` (`user_id`),
  `points` BIGINT(20),
  `pres_ques_id` VARCHAR(20),
  );

CREATE TABLE `civicq`.`questions` (
  `ques_id` VARCHAR(20),
  `question` VARCHAR(400),
  `op1` VARCHAR(300),
  `op2` VARCHAR(300),
  `op3` VARCHAR(300),
  `op4` VARCHAR(300)
  
  PRIMARY KEY (`ques_id`));


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `createUser`(
    IN p_name VARCHAR(45),
    IN p_username VARCHAR(45),
    IN p_email VARCHAR(45),
    IN p_password VARCHAR(200)
)
BEGIN
    if ( select exists (select 1 from tbl_user where user_name = p_username) ) THEN
     
        select 'Username Exists !!';
     
    ELSE
     
        insert into tbl_user
        (
            name,
            user_name,
            user_email,
            user_password
        )
        values
        (
            p_name,
            p_username,
            p_email,
            p_password
        );
     
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `validateLogin`(
IN p_username VARCHAR(45)
)
BEGIN
    select * from tbl_user where user_name = p_username;
END$$
DELIMITER ;