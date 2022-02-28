use quanlysinhvien;
select *, max(Credit) from `subject`;

select sub.SubID ,sub.SubName, max(m.mark) from `subject` as sub join mark as m on sub.subID=m.SubID;

select *, avg(m.Mark) as DTB from student as s, mark as m where s.StudentID = m.StudentID
group by s.StudentID order by DTB desc;