; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113766 () Bool)

(assert start!113766)

(declare-fun b!1349961 () Bool)

(declare-fun e!767952 () Bool)

(declare-fun tp!110627 () Bool)

(assert (=> b!1349961 (= e!767952 tp!110627)))

(declare-fun b!1349960 () Bool)

(declare-fun e!767953 () Bool)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-fun k!1141 () (_ BitVec 64))

(assert (=> b!1349960 (= e!767953 (= otherKey!123 k!1141))))

(declare-fun res!895530 () Bool)

(assert (=> start!113766 (=> (not res!895530) (not e!767953))))

(declare-datatypes ((V!55245 0))(
  ( (V!55246 (val!18878 Int)) )
))
(declare-fun value!554 () V!55245)

(declare-datatypes ((tuple2!24424 0))(
  ( (tuple2!24425 (_1!12223 (_ BitVec 64)) (_2!12223 V!55245)) )
))
(declare-datatypes ((List!31549 0))(
  ( (Nil!31546) (Cons!31545 (h!32754 tuple2!24424) (t!46199 List!31549)) )
))
(declare-datatypes ((ListLongMap!22081 0))(
  ( (ListLongMap!22082 (toList!11056 List!31549)) )
))
(declare-fun lm!1456 () ListLongMap!22081)

(declare-fun contains!9169 (ListLongMap!22081 (_ BitVec 64)) Bool)

(declare-fun +!4894 (ListLongMap!22081 tuple2!24424) ListLongMap!22081)

(assert (=> start!113766 (= res!895530 (contains!9169 (+!4894 lm!1456 (tuple2!24425 otherKey!123 value!554)) k!1141))))

(assert (=> start!113766 e!767953))

(declare-fun inv!48420 (ListLongMap!22081) Bool)

(assert (=> start!113766 (and (inv!48420 lm!1456) e!767952)))

(assert (=> start!113766 true))

(declare-fun tp_is_empty!37607 () Bool)

(assert (=> start!113766 tp_is_empty!37607))

(declare-fun b!1349958 () Bool)

(declare-fun res!895531 () Bool)

(assert (=> b!1349958 (=> (not res!895531) (not e!767953))))

(assert (=> b!1349958 (= res!895531 (not (= k!1141 otherKey!123)))))

(declare-fun b!1349959 () Bool)

(declare-fun res!895532 () Bool)

(assert (=> b!1349959 (=> (not res!895532) (not e!767953))))

(assert (=> b!1349959 (= res!895532 (not (contains!9169 lm!1456 k!1141)))))

(assert (= (and start!113766 res!895530) b!1349958))

(assert (= (and b!1349958 res!895531) b!1349959))

(assert (= (and b!1349959 res!895532) b!1349960))

(assert (= start!113766 b!1349961))

(declare-fun m!1236821 () Bool)

(assert (=> start!113766 m!1236821))

(assert (=> start!113766 m!1236821))

(declare-fun m!1236823 () Bool)

(assert (=> start!113766 m!1236823))

(declare-fun m!1236825 () Bool)

(assert (=> start!113766 m!1236825))

(declare-fun m!1236827 () Bool)

(assert (=> b!1349959 m!1236827))

(push 1)

(assert (not b!1349959))

(assert (not start!113766))

(assert (not b!1349961))

(assert tp_is_empty!37607)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

