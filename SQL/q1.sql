"table: user_status_table
user_id, user_status, cre_ts
1    ,        'suspended', '2018-01-01:02:03:60'
1    ,        'active',       '2018-02-01:02:03:60'
1    ,        'suspended', '2018-03-01:02:03:60'
2    ,        'active'        , '2017-01-01:02:03:60'
1    ,        'active'       , '2018-04-01:02:03:60'
3    ,        'restriction', '2018-03-01:02:03:60'
4    ,        'suspended', '2016-02-01:02:03:60'
Q1.1 Find all the distinct  user_id  who was/is suspended before or 
currently suspended, return user_id and the suspended date 
here in above table, you return 
1, '2018-03-01:02:03:60'
4, '2016-02-01:02:03:60'
Q2 among the suspended users, find the ones that become active again,
 your return the date difference between suspended and re-active   ?
 here the answer is 
user_id, day_diff
1, 30 
(if the a was suspended more than 1 time, you will user the last suspended status)
Q1answer:
select user_id,cre_ts
from user_status_table
where user_status = 'suspended'
qualify row_number() over(partition by user_id order by cre_ts desc) = 1
"
