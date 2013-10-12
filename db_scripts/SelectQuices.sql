
SELECT 
				t.id as test_id,
				t.description as description_test,
				e.first_name,
				e.last_name,
				c.`name`,
				t.application_date,
				t.term_in_minutes,
				p.first_name,
				p.last_name		
				
FROM test AS t 
inner JOIN `group` as g on g.id = t.group_id
INNER JOIN registration as r on r.group_id = g.id
inner join student as e	on e.id = r.student_id
inner join course as c on c.id = g.course_id
inner join professor as p on p.id = g.professor_id
where t.application_date <= CURDATE()
and t.`status` = 1
and NOT EXISTS (SELECT * from notification_sent 
where student_id = e.id and test_id = p.id)