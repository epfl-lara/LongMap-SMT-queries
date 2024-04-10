; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113772 () Bool)

(assert start!113772)

(declare-fun b!1350072 () Bool)

(declare-fun res!895594 () Bool)

(declare-fun e!768004 () Bool)

(assert (=> b!1350072 (=> (not res!895594) (not e!768004))))

(declare-fun k!1141 () (_ BitVec 64))

(declare-fun otherKey!123 () (_ BitVec 64))

(assert (=> b!1350072 (= res!895594 (not (= k!1141 otherKey!123)))))

(declare-fun b!1350073 () Bool)

(declare-fun res!895597 () Bool)

(assert (=> b!1350073 (=> (not res!895597) (not e!768004))))

(declare-datatypes ((V!55253 0))(
  ( (V!55254 (val!18881 Int)) )
))
(declare-datatypes ((tuple2!24356 0))(
  ( (tuple2!24357 (_1!12189 (_ BitVec 64)) (_2!12189 V!55253)) )
))
(declare-datatypes ((List!31499 0))(
  ( (Nil!31496) (Cons!31495 (h!32704 tuple2!24356) (t!46157 List!31499)) )
))
(declare-datatypes ((ListLongMap!22013 0))(
  ( (ListLongMap!22014 (toList!11022 List!31499)) )
))
(declare-fun lm!1456 () ListLongMap!22013)

(declare-fun contains!9208 (ListLongMap!22013 (_ BitVec 64)) Bool)

(assert (=> b!1350073 (= res!895597 (not (contains!9208 lm!1456 k!1141)))))

(declare-fun b!1350074 () Bool)

(declare-fun e!768003 () Bool)

(declare-fun tp!110635 () Bool)

(assert (=> b!1350074 (= e!768003 tp!110635)))

(declare-fun b!1350075 () Bool)

(declare-fun res!895596 () Bool)

(assert (=> b!1350075 (=> (not res!895596) (not e!768004))))

(assert (=> b!1350075 (= res!895596 (not (= otherKey!123 k!1141)))))

(declare-fun b!1350076 () Bool)

(assert (=> b!1350076 (= e!768004 (not true))))

(assert (=> b!1350076 false))

(declare-fun value!554 () V!55253)

(declare-datatypes ((Unit!44221 0))(
  ( (Unit!44222) )
))
(declare-fun lt!596890 () Unit!44221)

(declare-fun addStillNotContains!508 (ListLongMap!22013 (_ BitVec 64) V!55253 (_ BitVec 64)) Unit!44221)

(assert (=> b!1350076 (= lt!596890 (addStillNotContains!508 lm!1456 otherKey!123 value!554 k!1141))))

(declare-fun res!895595 () Bool)

(assert (=> start!113772 (=> (not res!895595) (not e!768004))))

(declare-fun +!4864 (ListLongMap!22013 tuple2!24356) ListLongMap!22013)

(assert (=> start!113772 (= res!895595 (contains!9208 (+!4864 lm!1456 (tuple2!24357 otherKey!123 value!554)) k!1141))))

(assert (=> start!113772 e!768004))

(declare-fun inv!48428 (ListLongMap!22013) Bool)

(assert (=> start!113772 (and (inv!48428 lm!1456) e!768003)))

(assert (=> start!113772 true))

(declare-fun tp_is_empty!37613 () Bool)

(assert (=> start!113772 tp_is_empty!37613))

(assert (= (and start!113772 res!895595) b!1350072))

(assert (= (and b!1350072 res!895594) b!1350073))

(assert (= (and b!1350073 res!895597) b!1350075))

(assert (= (and b!1350075 res!895596) b!1350076))

(assert (= start!113772 b!1350074))

(declare-fun m!1237365 () Bool)

(assert (=> b!1350073 m!1237365))

(declare-fun m!1237367 () Bool)

(assert (=> b!1350076 m!1237367))

(declare-fun m!1237369 () Bool)

(assert (=> start!113772 m!1237369))

(assert (=> start!113772 m!1237369))

(declare-fun m!1237371 () Bool)

(assert (=> start!113772 m!1237371))

(declare-fun m!1237373 () Bool)

(assert (=> start!113772 m!1237373))

(push 1)

(assert tp_is_empty!37613)

(assert (not b!1350073))

(assert (not b!1350076))

(assert (not start!113772))

(assert (not b!1350074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

