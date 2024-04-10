; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132996 () Bool)

(assert start!132996)

(declare-fun res!1065088 () Bool)

(declare-fun e!867343 () Bool)

(assert (=> start!132996 (=> (not res!1065088) (not e!867343))))

(declare-datatypes ((B!2364 0))(
  ( (B!2365 (val!19268 Int)) )
))
(declare-datatypes ((tuple2!24912 0))(
  ( (tuple2!24913 (_1!12467 (_ BitVec 64)) (_2!12467 B!2364)) )
))
(declare-datatypes ((List!36302 0))(
  ( (Nil!36299) (Cons!36298 (h!37744 tuple2!24912) (t!51029 List!36302)) )
))
(declare-datatypes ((ListLongMap!22413 0))(
  ( (ListLongMap!22414 (toList!11222 List!36302)) )
))
(declare-fun lm!250 () ListLongMap!22413)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun contains!10190 (ListLongMap!22413 (_ BitVec 64)) Bool)

(assert (=> start!132996 (= res!1065088 (contains!10190 lm!250 a0!50))))

(assert (=> start!132996 e!867343))

(declare-fun e!867344 () Bool)

(declare-fun inv!57451 (ListLongMap!22413) Bool)

(assert (=> start!132996 (and (inv!57451 lm!250) e!867344)))

(assert (=> start!132996 true))

(declare-fun b!1557109 () Bool)

(assert (=> b!1557109 (= e!867343 false)))

(declare-fun b!1557110 () Bool)

(declare-fun tp!112473 () Bool)

(assert (=> b!1557110 (= e!867344 tp!112473)))

(assert (= (and start!132996 res!1065088) b!1557109))

(assert (= start!132996 b!1557110))

(declare-fun m!1434359 () Bool)

(assert (=> start!132996 m!1434359))

(declare-fun m!1434361 () Bool)

(assert (=> start!132996 m!1434361))

(push 1)

(assert (not start!132996))

(assert (not b!1557110))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

