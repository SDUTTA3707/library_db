--sql project libaray management system

select * from Books;
select * from branch;
select * from employees;
select * from issued_status;
select * from members;
select * from return_status;


/*
task 13:Task 13: Identify Members with Overdue Books
Write a query to identify members who have overdue books (assume a 30-day return period). Display the member's_id, member's name, book title, issue date, and days overdue.
*/

-- issued status  == member == book table == returnstatus
-- filter books which is return 
--overdue >30 days

select 
	ist.issued_member_id,
	m.member_name,
	bk.book_title,
	ist.issued_date,
	rs.return_date,
	CURRENT_DATE - ist.issued_date as over_dues_days
from issued_status as IST
join members as m
On m.member_id= IST.issued_member_id
join
books as bk
on bk.isbn = ist.issued_book_isbn
left join 
return_status as rs
ON rs.issued_id=ist.issued_id
where rs.return_date IS NULL
	And 
		(CURRENT_DATE - ist.issued_date)>30
		order by 1




