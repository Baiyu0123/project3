UPDATE test_table SET y=y+1 WHERE x<=40;

UPDATE test_table SET y=y-1 WHERE x<=40;

UPDATE test_table SET id=id+1 WHERE x<=40;

UPDATE test_table SET id=id-1 WHERE x<=40;

UPDATE test_table SET s = REPLACE(s, 'a', '1') WHERE s LIKE '%a%';

UPDATE test_table SET s = REPLACE(s, '1', 'a') WHERE s LIKE '%1%';

UPDATE test_table SET s=upper(s) WHERE x<=48;

UPDATE test_table SET s=lower(s) WHERE x<=48;

