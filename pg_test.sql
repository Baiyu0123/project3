DROP TABLE IF EXISTS pgbench_branches;
CREATE TABLE pgbench_branches (
    bid integer NOT NULL,
    bbalance bigint,
    filler character(88)
);
/*
bid：支行的唯一标识符（主键）。
bbalance：支行的余额。
filler：用于填充数据，以便在测试中模拟更多的磁盘I/O操作。
*/
DROP TABLE IF EXISTS pgbench_tellers;
CREATE TABLE pgbench_tellers (
    tid0 integer NOT NULL,
        --出纳员的唯一标识符（主键）。
    bid integer,
        --出纳员所属的支行标识符。
    tbalance bigint,
        --出纳员的余额。
    filler character(84)
        --用于填充数据，以便在测试中模拟更多的磁盘I/O操作。
);
DROP TABLE IF EXISTS pgbench_accounts;
CREATE TABLE pgbench_accounts (
    aid integer NOT NULL,
        --账户的唯一标识符（主键）。
    bid integer,
        --账户所属的支行标识符。
    abalance bigint,
        --账户的余额。
    filler character(84)
        --用于填充数据，以便在测试中模拟更多的磁盘I/O操作。
);
DROP TABLE IF EXISTS pgbench_history;
CREATE TABLE pgbench_history (
    tid0 integer,--出纳员的唯一标识符。
    bid integer,--支行的唯一标识符。
    aid integer,--账户的唯一标识符。
    delta integer,--交易金额的变化。
    mtime timestamp without time zone default CURRENT_TIMESTAMP--交易的时间戳。
);


aid：
delta：
mtime：
filler：用于填充数据，模拟更多的磁盘I/O操作。
\set scale 10
\set aid random(1, 100000 * :scale)
\set bid random(1, :scale)
\set tid0 random(1, 10 * :scale)

INSERT INTO pgbench_branches (bid, bbalance, filler)
SELECT s.i, s.i * 1000, '                '
FROM generate_series(1, :bid) AS s(i);

INSERT INTO pgbench_tellers (tid0, bid, tbalance, filler)
SELECT s.i, s.i % :bid, 10000, '                '
FROM generate_series(1, :tid0) AS s(i);

INSERT INTO pgbench_accounts (aid, bid, abalance, filler)
SELECT s.i, s.i % :bid, 50000, '                '
FROM generate_series(1, :aid) AS s(i);
