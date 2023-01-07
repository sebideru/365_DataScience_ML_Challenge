use 365_database;
-- Extract student engagement before first purchase date 
SELECT 
    se.student_id,
    SUM(se.engagement_quizzes),
    SUM(se.engagement_exams),
    SUM(se.engagement_lessons),
    COUNT(se.date_engaged),
    MIN(sp.date_purchased) AS minpdate,
    se.date_engaged
FROM
    365_student_engagement se
        JOIN
    365_student_purchases sp ON se.student_id = sp.student_id
GROUP BY se.student_id 
HAVING se.date_engaged < minpdate
ORDER BY se.student_id;

--  Extract mintues and days watched of student before course purchase
SELECT 
    sl.student_id,
    SUM(sl.minutes_watched),
    COUNT(sl.date_watched),
    MIN(sp.date_purchased) AS minpdate,
    sl.date_watched
FROM
    365_student_learning sl
        JOIN
    365_student_purchases sp ON sl.student_id = sp.student_id
GROUP BY sl.student_id
HAVING sl.date_watched < minpdate
ORDER BY sl.student_id;

-- Extract Course Student's first Purchase and last purchase

SELECT 
    student_id, MIN(date_purchased), MAX(date_purchased)
FROM
    365_student_purchases
GROUP BY student_id;

-- Extract courses free students taken before first purchase
SELECT 
    sl.student_id,
    COUNT(DISTINCT (sl.course_id)) as Distinct_Courses_Taken,
    MIN(sp.date_purchased) AS minpdate,
    sl.date_watched
FROM
    365_student_learning sl
        JOIN
    365_student_purchases sp ON sl.student_id = sp.student_id
GROUP BY sl.student_id
HAVING sl.date_watched < minpdate
ORDER BY sl.student_id;

-- Extract exam information before first course purchase
SELECT 
	sx.student_id,
    COUNT(sx.exam_attempt_id) as Number_of_Exams_Attempted,
    COUNT(DISTINCT (sx.exam_id)) as Distinct_Exams_Taken,
    AVG(sx.exam_result) as Average_Exam_Result,
    AVG(sx.exam_completion_time) as Average_Exam_Completion_Time,
    sx.date_exam_completed,
    MIN(sp.date_purchased) AS minpdate
FROM
    365_student_exams AS sx
        JOIN
    365_student_purchases sp ON sx.student_id = sp.student_id
GROUP BY sx.student_id
HAVING sx.date_exam_completed < minpdate
ORDER BY sx.student_id;
