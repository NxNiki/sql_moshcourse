# notes of leetcode questions:

#### LC 1484:

MySQL:

```MySQL
GROUP_CONCAT(<col> ORDER BY <col> ASC SEPARATOR ',')
```

MS SQL server:

```MySQL
string_agg() 
string_agg() within group (order by ..)
```

#### LC 176:

```MySQL
ifnull(expression, alt-value)
```


### window function: 

```SQL
count(*) over (partition by <col>)

row_number()

rank()

dense_rank()

ntile()
```

#### LC 585:

> `group by` will only return one row for each group. If there are multiple rows, the first will be selected.


#### LC 511:

```MySQL
dense_rank()
```

#### LC 1907:

`union all`, `coalesce`, `left join`.

#### LC 626:

```MySQL
mod(id, 2) != 0
row_number() over(order by id2) as id
coalesce(s1.student, s2.student, ...) # return the first non-null value.
```

#### LC 180:

```MySQL
lead(scaler-expression, [offset], [default])
lag()

-- accumulate the sum of value with a given order.
sum(la diff) over (order by id)
```

#### LC 1951:

use self join and window function:

```MySQL
rank() over(order by count(*) desc)
```

#### LC 1204:

- use window function `sum() over()` to calculate the accumulative sum of weights
- use order by and limit to get the row with max weights

```MySQL
sum() over(order by weight)
```

LC 1321:
cast() over ()
convert value to specified datatype

datediff()

LC 1867:
max() over()

aggregate function:
count()

LC 615:
date-format(date, '%Y-%m')
DATE("2017-06-15 09:34:21")

LC 1709:
date_diff()
lead()/lag()
coalesce()

LC 1384:
convert(c.report_year, char)
datediff()
concat_ws('-', year, '01-01')  # Add strings together. Use '.' to separate the concatenated string values

LC 1174:
rank() over(partition by customer_id order by order_date) 
