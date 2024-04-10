; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113756 () Bool)

(assert start!113756)

(declare-fun res!895521 () Bool)

(declare-fun e!767956 () Bool)

(assert (=> start!113756 (=> (not res!895521) (not e!767956))))

(declare-datatypes ((V!55233 0))(
  ( (V!55234 (val!18873 Int)) )
))
(declare-fun value!554 () V!55233)

(declare-datatypes ((tuple2!24340 0))(
  ( (tuple2!24341 (_1!12181 (_ BitVec 64)) (_2!12181 V!55233)) )
))
(declare-datatypes ((List!31491 0))(
  ( (Nil!31488) (Cons!31487 (h!32696 tuple2!24340) (t!46149 List!31491)) )
))
(declare-datatypes ((ListLongMap!21997 0))(
  ( (ListLongMap!21998 (toList!11014 List!31491)) )
))
(declare-fun lm!1456 () ListLongMap!21997)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-fun k!1141 () (_ BitVec 64))

(declare-fun contains!9200 (ListLongMap!21997 (_ BitVec 64)) Bool)

(declare-fun +!4856 (ListLongMap!21997 tuple2!24340) ListLongMap!21997)

(assert (=> start!113756 (= res!895521 (contains!9200 (+!4856 lm!1456 (tuple2!24341 otherKey!123 value!554)) k!1141))))

(assert (=> start!113756 e!767956))

(declare-fun e!767955 () Bool)

(declare-fun inv!48410 (ListLongMap!21997) Bool)

(assert (=> start!113756 (and (inv!48410 lm!1456) e!767955)))

(assert (=> start!113756 true))

(declare-fun tp_is_empty!37597 () Bool)

(assert (=> start!113756 tp_is_empty!37597))

(declare-fun b!1349975 () Bool)

(declare-fun res!895522 () Bool)

(assert (=> b!1349975 (=> (not res!895522) (not e!767956))))

(assert (=> b!1349975 (= res!895522 (not (= k!1141 otherKey!123)))))

(declare-fun b!1349976 () Bool)

(assert (=> b!1349976 (= e!767956 false)))

(declare-fun lt!596875 () Bool)

(assert (=> b!1349976 (= lt!596875 (contains!9200 lm!1456 k!1141))))

(declare-fun b!1349977 () Bool)

(declare-fun tp!110611 () Bool)

(assert (=> b!1349977 (= e!767955 tp!110611)))

(assert (= (and start!113756 res!895521) b!1349975))

(assert (= (and b!1349975 res!895522) b!1349976))

(assert (= start!113756 b!1349977))

(declare-fun m!1237297 () Bool)

(assert (=> start!113756 m!1237297))

(assert (=> start!113756 m!1237297))

(declare-fun m!1237299 () Bool)

(assert (=> start!113756 m!1237299))

(declare-fun m!1237301 () Bool)

(assert (=> start!113756 m!1237301))

(declare-fun m!1237303 () Bool)

(assert (=> b!1349976 m!1237303))

(push 1)

(assert (not start!113756))

(assert (not b!1349976))

(assert (not b!1349977))

(assert tp_is_empty!37597)

(check-sat)

(pop 1)

