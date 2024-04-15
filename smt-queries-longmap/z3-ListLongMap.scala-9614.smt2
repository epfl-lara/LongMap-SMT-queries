; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113756 () Bool)

(assert start!113756)

(declare-fun res!895493 () Bool)

(declare-fun e!767923 () Bool)

(assert (=> start!113756 (=> (not res!895493) (not e!767923))))

(declare-datatypes ((V!55233 0))(
  ( (V!55234 (val!18873 Int)) )
))
(declare-fun value!554 () V!55233)

(declare-datatypes ((tuple2!24414 0))(
  ( (tuple2!24415 (_1!12218 (_ BitVec 64)) (_2!12218 V!55233)) )
))
(declare-datatypes ((List!31544 0))(
  ( (Nil!31541) (Cons!31540 (h!32749 tuple2!24414) (t!46194 List!31544)) )
))
(declare-datatypes ((ListLongMap!22071 0))(
  ( (ListLongMap!22072 (toList!11051 List!31544)) )
))
(declare-fun lm!1456 () ListLongMap!22071)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-fun k0!1141 () (_ BitVec 64))

(declare-fun contains!9164 (ListLongMap!22071 (_ BitVec 64)) Bool)

(declare-fun +!4889 (ListLongMap!22071 tuple2!24414) ListLongMap!22071)

(assert (=> start!113756 (= res!895493 (contains!9164 (+!4889 lm!1456 (tuple2!24415 otherKey!123 value!554)) k0!1141))))

(assert (=> start!113756 e!767923))

(declare-fun e!767922 () Bool)

(declare-fun inv!48410 (ListLongMap!22071) Bool)

(assert (=> start!113756 (and (inv!48410 lm!1456) e!767922)))

(assert (=> start!113756 true))

(declare-fun tp_is_empty!37597 () Bool)

(assert (=> start!113756 tp_is_empty!37597))

(declare-fun b!1349905 () Bool)

(declare-fun res!895492 () Bool)

(assert (=> b!1349905 (=> (not res!895492) (not e!767923))))

(assert (=> b!1349905 (= res!895492 (not (= k0!1141 otherKey!123)))))

(declare-fun b!1349906 () Bool)

(assert (=> b!1349906 (= e!767923 false)))

(declare-fun lt!596689 () Bool)

(assert (=> b!1349906 (= lt!596689 (contains!9164 lm!1456 k0!1141))))

(declare-fun b!1349907 () Bool)

(declare-fun tp!110612 () Bool)

(assert (=> b!1349907 (= e!767922 tp!110612)))

(assert (= (and start!113756 res!895493) b!1349905))

(assert (= (and b!1349905 res!895492) b!1349906))

(assert (= start!113756 b!1349907))

(declare-fun m!1236781 () Bool)

(assert (=> start!113756 m!1236781))

(assert (=> start!113756 m!1236781))

(declare-fun m!1236783 () Bool)

(assert (=> start!113756 m!1236783))

(declare-fun m!1236785 () Bool)

(assert (=> start!113756 m!1236785))

(declare-fun m!1236787 () Bool)

(assert (=> b!1349906 m!1236787))

(check-sat (not start!113756) (not b!1349906) (not b!1349907) tp_is_empty!37597)
(check-sat)
