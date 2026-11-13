# Lab 4 Notes: Referential Integrity (Week 6)

**What error did I get?** When I tried to delete the department "Library and Information Science" while a student (`Transfer Student`, matric 20239999) was still in it, MySQL returned **Error 1451: Cannot delete or update a parent row: a foreign key constraint fails**.

**Why does MySQL refuse?** `Student.dept_id` is a foreign key that references `Department.dept_id`. Deleting the department would leave that student pointing at a department that no longer exists, which breaks referential integrity. MySQL blocks the delete to keep the data consistent.

**How did I fix it?** I first ran an `UPDATE` to move the dependent student to another department (Software Engineering), so that nothing referenced the Library and Information Science department any more. After that the `DELETE` succeeded, the student was kept rather than lost, and the Department table was back to 5 rows.

**What other fix could I have used?** I could have deleted the dependent student row first, and then the department. Or I could have changed the foreign key to use a referential action such as `ON DELETE SET NULL` (the student's `dept_id` becomes empty) or `ON DELETE CASCADE` (the student is deleted automatically with the department). `CASCADE` is riskier because it silently removes the student's records.
