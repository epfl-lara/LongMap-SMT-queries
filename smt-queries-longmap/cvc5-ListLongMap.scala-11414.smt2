; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132992 () Bool)

(assert start!132992)

(declare-fun res!1065082 () Bool)

(declare-fun e!867331 () Bool)

(assert (=> start!132992 (=> (not res!1065082) (not e!867331))))

(declare-datatypes ((B!2360 0))(
  ( (B!2361 (val!19266 Int)) )
))
(declare-datatypes ((tuple2!24908 0))(
  ( (tuple2!24909 (_1!12465 (_ BitVec 64)) (_2!12465 B!2360)) )
))
(declare-datatypes ((List!36300 0))(
  ( (Nil!36297) (Cons!36296 (h!37742 tuple2!24908) (t!51027 List!36300)) )
))
(declare-datatypes ((ListLongMap!22409 0))(
  ( (ListLongMap!22410 (toList!11220 List!36300)) )
))
(declare-fun lm!250 () ListLongMap!22409)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun contains!10188 (ListLongMap!22409 (_ BitVec 64)) Bool)

(assert (=> start!132992 (= res!1065082 (contains!10188 lm!250 a0!50))))

(assert (=> start!132992 e!867331))

(declare-fun e!867332 () Bool)

(declare-fun inv!57449 (ListLongMap!22409) Bool)

(assert (=> start!132992 (and (inv!57449 lm!250) e!867332)))

(assert (=> start!132992 true))

(declare-fun b!1557097 () Bool)

(assert (=> b!1557097 (= e!867331 false)))

(declare-fun b!1557098 () Bool)

(declare-fun tp!112467 () Bool)

(assert (=> b!1557098 (= e!867332 tp!112467)))

(assert (= (and start!132992 res!1065082) b!1557097))

(assert (= start!132992 b!1557098))

(declare-fun m!1434351 () Bool)

(assert (=> start!132992 m!1434351))

(declare-fun m!1434353 () Bool)

(assert (=> start!132992 m!1434353))

(push 1)

(assert (not start!132992))

(assert (not b!1557098))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

