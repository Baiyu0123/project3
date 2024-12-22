\set scale 10
\set aid random(1, 100000 * :scale)
\set bid random(1, :scale)
\set tid0 random(1, 10 * :scale)
\set delta random(-5000,5000)

BEGIN;
UPDATE pgbench_accounts SET abalance = abalance + :delta WHERE aid = :aid;
SELECT abalance FROM pgbench_accounts WHERE aid = :aid;
UPDATE pgbench_tellers SET tbalance = tbalance + :delta WHERE tid0 = :tid0;
UPDATE pgbench_branches SET bbalance = bbalance + :delta WHERE bid = :bid;
INSERT INTO pgbench_history (tid0, bid, aid, delta, mtime) VALUES (:tid0, :bid, :aid, :delta, CURRENT_TIMESTAMP);
END;