select count(*) from test_table where x <=30;

select count(*) from test_table where s like '%ab%';

select avg(y/id) from test_table where x <=40 and y%10!=id%10 and s not like 'abc';

select tmp_table.mx
from (select max(test_table.y) mx
      from test_table
      group by x) tmp_table;

select count(*)
from (select max(test_table.y) mx
      from test_table
      group by x) tmp_table,test_table where tmp_table.mx%100>test_table.x;
