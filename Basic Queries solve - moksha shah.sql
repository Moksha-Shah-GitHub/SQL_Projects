use soccer;

-- 1. From the following table, write a SQL query to count the number of venues for EURO cup
-- 2016. Return number of venues.
-- Sample table: soccer_venue
-- Sample Output:
--  count
-- -------
--  10
select count(*) as count from soccer_venue;

-- (1 row)
-- 2. From the following table, write a SQL query to count the number of countries that
-- participated in the 2016-EURO Cup.
-- Sample table: player_master
-- Sample Output:
--  count
-- -------
--  24

Select count(distinct team_id) as count from Player_master;

-- (1 row)
-- 3. From the following table, write a SQL query to find the number of goals scored within
-- normal play during the EURO cup 2016.
-- Sample table: goal_details
-- Sample Output:
--  count
-- -------
--  108
-- (1 row)

select * from goal_details;
select count(goal_type) from goal_details where goal_type = "N";
select count(goal_schedule) from goal_details where goal_schedule = "NT";

-- 4. From the following table, write a SQL query to find the number of matches that ended with
-- a result.
-- Sample table: match_master
-- Sample Output:
--  count
-- -------
--  40
-- (1 row)

select * from match_master;
select count(results) from match_master where results = "WIN";

-- 5. From the following table, write a SQL query to find the number of matches that ended in
-- draws.
-- Sample table: match_master
-- Sample Output:
--  count
-- -------
--  11
-- (1 row)

select results, count(results) from match_master
group by results having results = "draw";

-- 6. From the following table, write a SQL query to find out when the Football EURO cup 2016
-- will begin.
-- Sample table: match_master
-- Sample Output:
--  Beginning Date
-- ----------------
--  2016-06-11
-- (1 row)

select * from Match_master;
select Play_date from match_master order by play_date limit 1;

-- 7. From the following table, write a SQL query to find the number of self-goals scored during
-- the 2016 European Championship.
-- Sample table: goal_details
-- Sample Output:
--  count
-- -------
--  3
-- (1 row)

 select * from goal_details;
 select goal_type, count(goal_type) as count from goal_details where goal_type = "o";
 
 

-- 8. From the following table, write a SQL query to count the number of matches ended with a
-- results in-group stage.
-- Sample table: match_master
-- Sample Output:
--  count
-- -------
--  25
-- (1 row)

select count(results) from Match_master where results = "WIN" and Play_stage = "G";

-- 9. From the following table, write a SQL query to find the number of matches that resulted in
-- a penalty shootout.
-- Sample table: penalty_shootout
-- Sample Output:
--  count
-- -------
--  3
-- (1 row)

select * from Penalty_shootout;
select count(distinct match_no) from penalty_shootout;

#select * from Match_master;
#select count(decided_by) as count from match_master where decided_by = "P";

-- 10. From the following table, write a SQL query to find number of matches decided by
-- penalties in the Round 16.
-- Sample table: match_master
-- Sample Output:
--  count
-- -------
--  1
-- (1 row)

select * from Match_master;
select count(play_stage) as count from match_master where play_stage = "R" and decided_by = "P";

-- 11. From the following table, write a SQL query to find the number of goals scored in every
-- match within a normal play schedule. Sort the result-set on match number. Return match
-- number, number of goal scored.
-- Sample table: goal_details
-- Sample Output:
--  match_no | count
-- ----------+-------
--  1 | 3
--  2 | 1
--  3 | 3
--  4 | 2

select * from goal_details;
select match_no, count(*) as count from goal_details group by match_no;

-- 12. From the following table, write a SQL query to find the matches in which no stoppage
-- time was added during the first half of play. Return match no, date of play, and goal scored.
-- Sample table: match_master
-- Sample Output:
--  match_no | play_date | goal_score
-- ----------+------------+------------
--  4 | 2016-06-12 | 1-1
-- (1 row)

select * from match_master;
select match_no,play_date, goal_score from match_master where stop1_sec = 0;

-- 13. From the following table, write a SQL query to count the number of matches that ended in
-- a goalless draw at the group stage. Return number of matches.
-- Sample table: match_details
-- Sample Output:
--  count
-- -------
--  4
-- (1 row)

select * from Match_details;
select count(distinct match_no) from match_details where win_lose = "D" and goal_score = 0 and play_stage = "G";

-- 14. From the following table, write a SQL query to calculate the number of matches that
-- ended in a single goal win, excluding matches decided by penalty shootouts. Return number
-- of matches.
-- Sample table: match_details
-- Sample Output:
--  count
-- -------
--  13
-- (1 row)

select * from Match_details;
select count(match_no) from match_details where win_lose = "w" and goal_score = 1 and not( penalty_score) ;

-- 15. From the following table, write a SQL query to count the number of players replaced in
-- the tournament. Return number of players as "Player Replaced".
-- Sample table: player_in_out
-- Sample Output:
--  Player Replaced
-- -----------------
--  293
-- (1 row)

select * from players_in_out;
select count(player_id ) as Player_replaced from players_in_out where In_out = "I";

-- 16. From the following table, write a SQL query to count the total number of players replaced
-- during normal playtime. Return number of players as "Player Replaced".
-- Sample table: player_in_out
-- Sample Output:
--  Player Replaced
-- -----------------
--  275
-- (1 row)

select * from Players_In_out;
select count(match_no) as Player_Replaced from Players_in_out where play_schedule = "NT" and in_out = "I";

-- 17. From the following table, write a SQL query to count the number of players who were
-- replaced during the stoppage time. Return number of players as "Player Replaced".
-- Sample table: player_in_out
-- Sample Output:
--  Player Replaced
-- -----------------
--  9
-- (1 row)

select * from players_in_out;
select count(match_no) as Players_replaced from Players_IN_OUT where play_schedule = "ST" and in_out = "I";


-- 18. From the following table, write a SQL query to count the number of players who were
-- replaced during the first half. Return number of players as "Player Replaced".
-- Sample table: player_in_out
-- Sample Output:
--  Player Replaced
-- -----------------
--  3
-- (1 row)

select * from players_in_out;
select play_half, play_schedule, count(*)/2 as "player Replaced"
from players_in_out
group by play_half, play_schedule
having play_schedule = "NT" and play_half= 1;

#select count(player_id) as Player_replaced from players_in_out where play_half = 1 and in_out = "O";


-- 19. From the following table, write a SQL query to count the total number of goalless draws
-- played in the entire tournament. Return number of goalless draws.
-- Sample table: match_details
-- Sample Output:
--  count
-- -------
--  4
-- (1 row)

select * from match_details;

select match_no,goal_score, win_lose from match_details 
group by match_no,win_lose,goal_score having win_lose = "D" and goal_score = 0;

select count(distinct match_no) from match_details where win_lose = "D" and goal_score = 0;

-- 20. From the following table, write a SQL query to calculate the total number of players who
-- were replaced during the extra time.
-- Sample table: player_in_out
-- Sample Output:
--  count
-- -------
--  9
-- (1 row)

select * from players_in_out;
select count(match_no) from players_in_out where play_schedule = "ET" and in_out = "I";

-- 21. From the following table, write a SQL query to count the number of substitutes during
-- various stages of the tournament. Sort the result-set in ascending order by play-half,
-- play-schedule and number of substitute happened. Return play-half, play-schedule, number
-- of substitute happened.
-- Sample table: player_in_out

select * from Players_in_out;

select play_half, play_schedule,count(*) as "Number of substitute" from Players_in_out
group by play_half,play_schedule 
order by "Numberofsubstitute";

select play_half, play_schedule, count(match_no) as number_of_substitute_happened 
from players_in_out 
group by play_half,play_schedule
order by play_half, play_schedule,count(match_no);

-- 22. From the following table, write a SQL query to count the number of shots taken in penalty
-- shootouts matches. Number of shots as "Number of Penalty Kicks".
-- Sample table: penalty_shootout
-- Sample Output:
--  Number of Penalty Kicks
-- -------------------------
--  37
-- (1 row)

select * from penalty_shootout;
select count(*) as "Number of Penalty Kicks" from penalty_shootout;
select count(kick_no) as Number_of_Penalty_kicks from penalty_shootout;

-- 23. From the following table, write a SQL query to count the number of shots that were
-- scored in penalty shootouts matches. Return number of shots scored goal as "Goal Scored by
-- Penalty Kicks".
-- Sample table: penalty_shootout
-- Sample Output:
--  Goal Scored by Penalty Kicks
-- ------------------------------
--  28
-- (1 row)

select * from penalty_shootout;
select count(kick_no) as Goal_Scored_by_penalty_kicks from penalty_shootout where score_goal = "Y";

-- 24. From the following table, write a SQL query to count the number of shots missed or saved
-- in penalty shootout matches. Return number of shots missed as "Goal missed or saved by
-- Penalty Kicks".
-- Sample table: penalty_shootout
-- Sample Output:
--  Goal missed or saved by Penalty Kicks
-- ---------------------------------------
--  9
-- (1 row)

select * from penalty_shootout;
#select kick_no,score_goal, count(kick_no) as Goal_Missed_or_saved_by_penalty_kicks from penalty_shootout group by kick_no, score_goal having score_goal = "N";

select count(kick_no) as Goal_Missed_or_saved_by_penalty_kicks
from penalty_shootout where score_goal = "N";

-- 25. From the following table, write a SQL query to find the players with shot numbers they
-- took in penalty shootout matches. Return match_no, Team, player_name, jersey_no,
-- score_goal, kick_no.
-- Sample table: soccer_country
-- Sample table: penalty_shootout
-- Sample table: player_master
-- Sample Output:
--  match_no | Team | player_name | jersey_no | score_goal | kick_no
-- ----------+-------------+-------------------------+-----------+------------+
-- ---------
--  37 | Switzerland | Stephan Lichtsteiner | 2 | Y | 1
--  37 | Poland | Robert Lewandowski | 9 | Y | 2
--  37 | Switzerland | Granit Xhaka | 10 | N | 3
--  37 | Poland | Arkadiusz Milik | 7 | Y | 4

select * from soccer_country; # 3 country_name = Team
select * from penalty_shootout; # 1 match_no, 5 Score_goal, 6 Kick_no
select * from player_master; # 4 jersey_no, 2 Player_name

select match_no,Country_name AS "Team", Player_name,jersey_no,Score_goal, Kick_no, count(distinct match_no)
from soccer_country, penalty_shootout, player_master
group by match_no, team,Player_name,jersey_no, Score_goal, Kick_no
order by match_no, team,Player_name,jersey_no, Score_goal, Kick_no;


-- 26. From the following table, write a SQL query to count the number of penalty shots taken
-- by each team. Return country name, number of shots as "Number of Shots".
-- Sample table: soccer_country
-- Sample table: penalty_shootout
-- Sample Output:
--  country_name | Number of Shots
-- --------------+-----------------
--  Poland | 9
--  Italy | 9
--  Germany | 9
--  Portugal | 5
--  Switzerland | 5
-- (5 rows)
select * from soccer_country; #country_name
select * from penalty_shootout;

select country_name,count(distinct kick_no) as Number_Of_shots from soccer_country, penalty_shootout
group by country_name;


-- 27. From the following table, write a SQL query to count the number of bookings in each half
-- of play within the normal play schedule. Return play_half, play_schedule, number of booking
-- happened.
-- Sample table: player_booked
-- Sample Output:
--  play_half | play_schedule | count
-- -----------+---------------+-------
--  1 | NT | 61
--  2 | NT | 123
-- (2 rows)

select * from player_booked;
select play_half, play_schedule,count(play_half) as count from player_booked 
group by play_half, play_schedule having play_schedule = "NT";

-- 28. From the following table, write a SQL query to count the number of bookings during
-- stoppage time.
-- Sample table: player_booked
-- Sample Output:
--  count
-- -------
--  10
-- (1 row)

select * from player_booked;
select count( distinct match_no) as count from player_booked where play_schedule = "ST";

-- 29. From the following table, write a SQL query to count the number of bookings that
-- happened in extra time.
-- Sample table: player_booked
-- Sample Output:
--  count
-- -------
--  7
-- (1 row)

select * from player_booked;
select count(match_no) as count from player_booked where play_schedule = "ET";
