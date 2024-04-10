; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113766 () Bool)

(assert start!113766)

(declare-fun b!1350031 () Bool)

(declare-fun e!767985 () Bool)

(declare-fun tp!110626 () Bool)

(assert (=> b!1350031 (= e!767985 tp!110626)))

(declare-fun res!895559 () Bool)

(declare-fun e!767986 () Bool)

(assert (=> start!113766 (=> (not res!895559) (not e!767986))))

(declare-datatypes ((V!55245 0))(
  ( (V!55246 (val!18878 Int)) )
))
(declare-fun value!554 () V!55245)

(declare-datatypes ((tuple2!24350 0))(
  ( (tuple2!24351 (_1!12186 (_ BitVec 64)) (_2!12186 V!55245)) )
))
(declare-datatypes ((List!31496 0))(
  ( (Nil!31493) (Cons!31492 (h!32701 tuple2!24350) (t!46154 List!31496)) )
))
(declare-datatypes ((ListLongMap!22007 0))(
  ( (ListLongMap!22008 (toList!11019 List!31496)) )
))
(declare-fun lm!1456 () ListLongMap!22007)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-fun k!1141 () (_ BitVec 64))

(declare-fun contains!9205 (ListLongMap!22007 (_ BitVec 64)) Bool)

(declare-fun +!4861 (ListLongMap!22007 tuple2!24350) ListLongMap!22007)

(assert (=> start!113766 (= res!895559 (contains!9205 (+!4861 lm!1456 (tuple2!24351 otherKey!123 value!554)) k!1141))))

(assert (=> start!113766 e!767986))

(declare-fun inv!48420 (ListLongMap!22007) Bool)

(assert (=> start!113766 (and (inv!48420 lm!1456) e!767985)))

(assert (=> start!113766 true))

(declare-fun tp_is_empty!37607 () Bool)

(assert (=> start!113766 tp_is_empty!37607))

(declare-fun b!1350030 () Bool)

(assert (=> b!1350030 (= e!767986 (= otherKey!123 k!1141))))

(declare-fun b!1350028 () Bool)

(declare-fun res!895561 () Bool)

(assert (=> b!1350028 (=> (not res!895561) (not e!767986))))

(assert (=> b!1350028 (= res!895561 (not (= k!1141 otherKey!123)))))

(declare-fun b!1350029 () Bool)

(declare-fun res!895560 () Bool)

(assert (=> b!1350029 (=> (not res!895560) (not e!767986))))

(assert (=> b!1350029 (= res!895560 (not (contains!9205 lm!1456 k!1141)))))

(assert (= (and start!113766 res!895559) b!1350028))

(assert (= (and b!1350028 res!895561) b!1350029))

(assert (= (and b!1350029 res!895560) b!1350030))

(assert (= start!113766 b!1350031))

(declare-fun m!1237337 () Bool)

(assert (=> start!113766 m!1237337))

(assert (=> start!113766 m!1237337))

(declare-fun m!1237339 () Bool)

(assert (=> start!113766 m!1237339))

(declare-fun m!1237341 () Bool)

(assert (=> start!113766 m!1237341))

(declare-fun m!1237343 () Bool)

(assert (=> b!1350029 m!1237343))

(push 1)

(assert (not b!1350029))

(assert (not start!113766))

(assert (not b!1350031))

(assert tp_is_empty!37607)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

