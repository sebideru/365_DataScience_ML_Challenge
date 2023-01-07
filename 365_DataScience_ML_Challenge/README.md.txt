# 365_Data Science Challenge
# ML Considerations. 

  1. Free Students -who used platform for more than 30 days used.
  2. First purchase date using to compare all aggregated  engagements students made before the first purchase.
  3. Only taken record values of an attribute that fall 90% of the Free students who haven’t made any switch.
  4. Picked 198 data points randomly from the free students who didn’t switch to purchase  INDEX(SORTBY(Sheet1!A$2A$25946,RANDARRAY(ROWS(Sheet1!A$2A$25946))),SEQUENCE(120))  
  5. Over all DS 370.
  6. Free students who registered and made purchase on the first day with no data record are excluded except US & GB students .
  7. 11 Independent variable Selected  (Student_country ,Number of Courses Taken,Number of engagement_quizzes,Number of engagement_exams,Number of engagement_lessons,Total  minutes_watched,Total Number of date_watched,Number_of_Exams_Attempted,Number of Exams_Taken,Average_Exam_Result,Average_Exam_Completion_Time.)     
  8. Switch as dependant variable.
  9. Excel Pivot used after the SQL query to aggrgate the attribute values.
 
# Limitation

 It is hard to track the quizzes before purchase of courses,Therefore couldn’t consider quizzes taken. 