SELECT 
				t.id as test_id,
				t.description as description_test,
                                e.id as estudiante_id,
				e.first_name as nombre_estudiante,
				e.last_name as apellido_estudiante,
                                e.email as correo_estudiante,
				c.`name` as nombre_curso,
				t.application_date as fecha_aplicacion,
				t.term_in_minutes as tiempo_minutos,
				p.first_name as nombre_profesor,
				p.last_name as apellido_profesor		
				
FROM test AS t 
inner JOIN `group` as g on g.id = t.group_id
INNER JOIN registration as r on r.group_id = g.id
inner join student as e	on e.id = r.student_id
inner join course as c on c.id = g.course_id
inner join professor as p on p.id = g.professor_id
where t.application_date < CURDATE()
and t.`status` = 1
and NOT EXISTS (SELECT * from notification_sent 
where student_id = e.id and test_id = p.id)