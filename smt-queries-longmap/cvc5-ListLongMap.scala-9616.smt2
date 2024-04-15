; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113772 () Bool)

(assert start!113772)

(declare-fun b!1350002 () Bool)

(declare-fun res!895567 () Bool)

(declare-fun e!767970 () Bool)

(assert (=> b!1350002 (=> (not res!895567) (not e!767970))))

(declare-fun k!1141 () (_ BitVec 64))

(declare-fun otherKey!123 () (_ BitVec 64))

(assert (=> b!1350002 (= res!895567 (not (= k!1141 otherKey!123)))))

(declare-fun b!1350003 () Bool)

(assert (=> b!1350003 (= e!767970 (not true))))

(assert (=> b!1350003 false))

(declare-datatypes ((V!55253 0))(
  ( (V!55254 (val!18881 Int)) )
))
(declare-fun value!554 () V!55253)

(declare-datatypes ((tuple2!24430 0))(
  ( (tuple2!24431 (_1!12226 (_ BitVec 64)) (_2!12226 V!55253)) )
))
(declare-datatypes ((List!31552 0))(
  ( (Nil!31549) (Cons!31548 (h!32757 tuple2!24430) (t!46202 List!31552)) )
))
(declare-datatypes ((ListLongMap!22087 0))(
  ( (ListLongMap!22088 (toList!11059 List!31552)) )
))
(declare-fun lm!1456 () ListLongMap!22087)

(declare-datatypes ((Unit!44062 0))(
  ( (Unit!44063) )
))
(declare-fun lt!596704 () Unit!44062)

(declare-fun addStillNotContains!496 (ListLongMap!22087 (_ BitVec 64) V!55253 (_ BitVec 64)) Unit!44062)

(assert (=> b!1350003 (= lt!596704 (addStillNotContains!496 lm!1456 otherKey!123 value!554 k!1141))))

(declare-fun b!1350004 () Bool)

(declare-fun res!895568 () Bool)

(assert (=> b!1350004 (=> (not res!895568) (not e!767970))))

(declare-fun contains!9172 (ListLongMap!22087 (_ BitVec 64)) Bool)

(assert (=> b!1350004 (= res!895568 (not (contains!9172 lm!1456 k!1141)))))

(declare-fun b!1350005 () Bool)

(declare-fun e!767971 () Bool)

(declare-fun tp!110636 () Bool)

(assert (=> b!1350005 (= e!767971 tp!110636)))

(declare-fun b!1350006 () Bool)

(declare-fun res!895565 () Bool)

(assert (=> b!1350006 (=> (not res!895565) (not e!767970))))

(assert (=> b!1350006 (= res!895565 (not (= otherKey!123 k!1141)))))

(declare-fun res!895566 () Bool)

(assert (=> start!113772 (=> (not res!895566) (not e!767970))))

(declare-fun +!4897 (ListLongMap!22087 tuple2!24430) ListLongMap!22087)

(assert (=> start!113772 (= res!895566 (contains!9172 (+!4897 lm!1456 (tuple2!24431 otherKey!123 value!554)) k!1141))))

(assert (=> start!113772 e!767970))

(declare-fun inv!48428 (ListLongMap!22087) Bool)

(assert (=> start!113772 (and (inv!48428 lm!1456) e!767971)))

(assert (=> start!113772 true))

(declare-fun tp_is_empty!37613 () Bool)

(assert (=> start!113772 tp_is_empty!37613))

(assert (= (and start!113772 res!895566) b!1350002))

(assert (= (and b!1350002 res!895567) b!1350004))

(assert (= (and b!1350004 res!895568) b!1350006))

(assert (= (and b!1350006 res!895565) b!1350003))

(assert (= start!113772 b!1350005))

(declare-fun m!1236849 () Bool)

(assert (=> b!1350003 m!1236849))

(declare-fun m!1236851 () Bool)

(assert (=> b!1350004 m!1236851))

(declare-fun m!1236853 () Bool)

(assert (=> start!113772 m!1236853))

(assert (=> start!113772 m!1236853))

(declare-fun m!1236855 () Bool)

(assert (=> start!113772 m!1236855))

(declare-fun m!1236857 () Bool)

(assert (=> start!113772 m!1236857))

(push 1)

(assert (not b!1350005))

(assert (not b!1350004))

(assert (not b!1350003))

(assert (not start!113772))

(assert tp_is_empty!37613)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

