; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113774 () Bool)

(assert start!113774)

(declare-fun res!895574 () Bool)

(declare-fun e!767976 () Bool)

(assert (=> start!113774 (=> (not res!895574) (not e!767976))))

(declare-datatypes ((V!55257 0))(
  ( (V!55258 (val!18882 Int)) )
))
(declare-fun value!554 () V!55257)

(declare-datatypes ((tuple2!24432 0))(
  ( (tuple2!24433 (_1!12227 (_ BitVec 64)) (_2!12227 V!55257)) )
))
(declare-datatypes ((List!31553 0))(
  ( (Nil!31550) (Cons!31549 (h!32758 tuple2!24432) (t!46203 List!31553)) )
))
(declare-datatypes ((ListLongMap!22089 0))(
  ( (ListLongMap!22090 (toList!11060 List!31553)) )
))
(declare-fun lm!1456 () ListLongMap!22089)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-fun k0!1141 () (_ BitVec 64))

(declare-fun contains!9173 (ListLongMap!22089 (_ BitVec 64)) Bool)

(declare-fun +!4898 (ListLongMap!22089 tuple2!24432) ListLongMap!22089)

(assert (=> start!113774 (= res!895574 (contains!9173 (+!4898 lm!1456 (tuple2!24433 otherKey!123 value!554)) k0!1141))))

(assert (=> start!113774 e!767976))

(declare-fun e!767977 () Bool)

(declare-fun inv!48434 (ListLongMap!22089) Bool)

(assert (=> start!113774 (and (inv!48434 lm!1456) e!767977)))

(assert (=> start!113774 true))

(declare-fun tp_is_empty!37615 () Bool)

(assert (=> start!113774 tp_is_empty!37615))

(declare-fun b!1350013 () Bool)

(declare-fun res!895573 () Bool)

(assert (=> b!1350013 (=> (not res!895573) (not e!767976))))

(assert (=> b!1350013 (= res!895573 (not (= k0!1141 otherKey!123)))))

(declare-fun b!1350014 () Bool)

(assert (=> b!1350014 (= e!767976 false)))

(declare-fun lt!596707 () Bool)

(assert (=> b!1350014 (= lt!596707 (contains!9173 lm!1456 k0!1141))))

(declare-fun b!1350015 () Bool)

(declare-fun tp!110639 () Bool)

(assert (=> b!1350015 (= e!767977 tp!110639)))

(assert (= (and start!113774 res!895574) b!1350013))

(assert (= (and b!1350013 res!895573) b!1350014))

(assert (= start!113774 b!1350015))

(declare-fun m!1236859 () Bool)

(assert (=> start!113774 m!1236859))

(assert (=> start!113774 m!1236859))

(declare-fun m!1236861 () Bool)

(assert (=> start!113774 m!1236861))

(declare-fun m!1236863 () Bool)

(assert (=> start!113774 m!1236863))

(declare-fun m!1236865 () Bool)

(assert (=> b!1350014 m!1236865))

(check-sat (not start!113774) (not b!1350014) (not b!1350015) tp_is_empty!37615)
(check-sat)
