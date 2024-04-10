; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113778 () Bool)

(assert start!113778)

(declare-fun res!895615 () Bool)

(declare-fun e!768022 () Bool)

(assert (=> start!113778 (=> (not res!895615) (not e!768022))))

(declare-datatypes ((V!55261 0))(
  ( (V!55262 (val!18884 Int)) )
))
(declare-fun value!554 () V!55261)

(declare-datatypes ((tuple2!24362 0))(
  ( (tuple2!24363 (_1!12192 (_ BitVec 64)) (_2!12192 V!55261)) )
))
(declare-datatypes ((List!31502 0))(
  ( (Nil!31499) (Cons!31498 (h!32707 tuple2!24362) (t!46160 List!31502)) )
))
(declare-datatypes ((ListLongMap!22019 0))(
  ( (ListLongMap!22020 (toList!11025 List!31502)) )
))
(declare-fun lm!1456 () ListLongMap!22019)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-fun k!1141 () (_ BitVec 64))

(declare-fun contains!9211 (ListLongMap!22019 (_ BitVec 64)) Bool)

(declare-fun +!4867 (ListLongMap!22019 tuple2!24362) ListLongMap!22019)

(assert (=> start!113778 (= res!895615 (contains!9211 (+!4867 lm!1456 (tuple2!24363 otherKey!123 value!554)) k!1141))))

(assert (=> start!113778 e!768022))

(declare-fun e!768021 () Bool)

(declare-fun inv!48436 (ListLongMap!22019) Bool)

(assert (=> start!113778 (and (inv!48436 lm!1456) e!768021)))

(assert (=> start!113778 true))

(declare-fun tp_is_empty!37619 () Bool)

(assert (=> start!113778 tp_is_empty!37619))

(declare-fun b!1350101 () Bool)

(declare-fun res!895614 () Bool)

(assert (=> b!1350101 (=> (not res!895614) (not e!768022))))

(assert (=> b!1350101 (= res!895614 (not (= k!1141 otherKey!123)))))

(declare-fun b!1350102 () Bool)

(assert (=> b!1350102 (= e!768022 false)))

(declare-fun lt!596899 () Bool)

(assert (=> b!1350102 (= lt!596899 (contains!9211 lm!1456 k!1141))))

(declare-fun b!1350103 () Bool)

(declare-fun tp!110644 () Bool)

(assert (=> b!1350103 (= e!768021 tp!110644)))

(assert (= (and start!113778 res!895615) b!1350101))

(assert (= (and b!1350101 res!895614) b!1350102))

(assert (= start!113778 b!1350103))

(declare-fun m!1237391 () Bool)

(assert (=> start!113778 m!1237391))

(assert (=> start!113778 m!1237391))

(declare-fun m!1237393 () Bool)

(assert (=> start!113778 m!1237393))

(declare-fun m!1237395 () Bool)

(assert (=> start!113778 m!1237395))

(declare-fun m!1237397 () Bool)

(assert (=> b!1350102 m!1237397))

(push 1)

(assert (not start!113778))

(assert (not b!1350102))

(assert (not b!1350103))

(assert tp_is_empty!37619)

(check-sat)

