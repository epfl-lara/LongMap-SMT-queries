; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113760 () Bool)

(assert start!113760)

(declare-fun res!895533 () Bool)

(declare-fun e!767968 () Bool)

(assert (=> start!113760 (=> (not res!895533) (not e!767968))))

(declare-datatypes ((V!55237 0))(
  ( (V!55238 (val!18875 Int)) )
))
(declare-fun value!554 () V!55237)

(declare-datatypes ((tuple2!24344 0))(
  ( (tuple2!24345 (_1!12183 (_ BitVec 64)) (_2!12183 V!55237)) )
))
(declare-datatypes ((List!31493 0))(
  ( (Nil!31490) (Cons!31489 (h!32698 tuple2!24344) (t!46151 List!31493)) )
))
(declare-datatypes ((ListLongMap!22001 0))(
  ( (ListLongMap!22002 (toList!11016 List!31493)) )
))
(declare-fun lm!1456 () ListLongMap!22001)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-fun k!1141 () (_ BitVec 64))

(declare-fun contains!9202 (ListLongMap!22001 (_ BitVec 64)) Bool)

(declare-fun +!4858 (ListLongMap!22001 tuple2!24344) ListLongMap!22001)

(assert (=> start!113760 (= res!895533 (contains!9202 (+!4858 lm!1456 (tuple2!24345 otherKey!123 value!554)) k!1141))))

(assert (=> start!113760 e!767968))

(declare-fun e!767967 () Bool)

(declare-fun inv!48412 (ListLongMap!22001) Bool)

(assert (=> start!113760 (and (inv!48412 lm!1456) e!767967)))

(assert (=> start!113760 true))

(declare-fun tp_is_empty!37601 () Bool)

(assert (=> start!113760 tp_is_empty!37601))

(declare-fun b!1349993 () Bool)

(declare-fun res!895534 () Bool)

(assert (=> b!1349993 (=> (not res!895534) (not e!767968))))

(assert (=> b!1349993 (= res!895534 (not (= k!1141 otherKey!123)))))

(declare-fun b!1349994 () Bool)

(assert (=> b!1349994 (= e!767968 false)))

(declare-fun lt!596881 () Bool)

(assert (=> b!1349994 (= lt!596881 (contains!9202 lm!1456 k!1141))))

(declare-fun b!1349995 () Bool)

(declare-fun tp!110617 () Bool)

(assert (=> b!1349995 (= e!767967 tp!110617)))

(assert (= (and start!113760 res!895533) b!1349993))

(assert (= (and b!1349993 res!895534) b!1349994))

(assert (= start!113760 b!1349995))

(declare-fun m!1237313 () Bool)

(assert (=> start!113760 m!1237313))

(assert (=> start!113760 m!1237313))

(declare-fun m!1237315 () Bool)

(assert (=> start!113760 m!1237315))

(declare-fun m!1237317 () Bool)

(assert (=> start!113760 m!1237317))

(declare-fun m!1237319 () Bool)

(assert (=> b!1349994 m!1237319))

(push 1)

(assert (not start!113760))

(assert (not b!1349994))

(assert (not b!1349995))

(assert tp_is_empty!37601)

(check-sat)

(pop 1)

(push 1)

(check-sat)

