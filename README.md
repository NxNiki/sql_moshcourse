# sql_moshcourse

These is the notes for the mashcourse for SQL:
https://codewithmosh.com/courses

## notes of leetcode questions:

LC 1484:
string_agg() 
string_agg() within group (order by ..)

LC 176:
ifnull(expression, alt-value)

LC 511:
dense_rank()

LC 626:
mod(id, 2) != 0
row_number() over(order by id2) as id
coalesce(s1.student, s2.student, ...) # return the first non-null value.

LC 180:
lead(scaler-expression, [offset], [default])
lag()

sum(la diff) over (order by id)
accumulate the sum of value with a given order.

LC 1321:
cast() over ()
convert value to specified datatype

datediff()

LC 1867:
max() over()

window function: 
row_number()
rank()
dense_rank()
ntile()

aggregate function:
count()

LC 615:
date-format(date, '%Y-%m')
DATE("2017-06-15 09:34:21")

LC 1709:
date_diff()
lead()/lag()
coalesce()

LC 1951:
rank() over(order by count(*) desc)

LC 1384:
convert(c.report_year, char)
datediff()
concat_ws('-', year, '01-01') # Add strings together. Use '.' to separate the concatenated string values




