; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113768 () Bool)

(assert start!113768)

(declare-fun b!1350042 () Bool)

(declare-fun res!895570 () Bool)

(declare-fun e!767992 () Bool)

(assert (=> b!1350042 (=> (not res!895570) (not e!767992))))

(declare-datatypes ((V!55249 0))(
  ( (V!55250 (val!18879 Int)) )
))
(declare-datatypes ((tuple2!24352 0))(
  ( (tuple2!24353 (_1!12187 (_ BitVec 64)) (_2!12187 V!55249)) )
))
(declare-datatypes ((List!31497 0))(
  ( (Nil!31494) (Cons!31493 (h!32702 tuple2!24352) (t!46155 List!31497)) )
))
(declare-datatypes ((ListLongMap!22009 0))(
  ( (ListLongMap!22010 (toList!11020 List!31497)) )
))
(declare-fun lm!1456 () ListLongMap!22009)

(declare-fun k!1141 () (_ BitVec 64))

(declare-fun contains!9206 (ListLongMap!22009 (_ BitVec 64)) Bool)

(assert (=> b!1350042 (= res!895570 (not (contains!9206 lm!1456 k!1141)))))

(declare-fun b!1350043 () Bool)

(declare-fun res!895572 () Bool)

(assert (=> b!1350043 (=> (not res!895572) (not e!767992))))

(declare-fun otherKey!123 () (_ BitVec 64))

(assert (=> b!1350043 (= res!895572 (not (= k!1141 otherKey!123)))))

(declare-fun b!1350044 () Bool)

(assert (=> b!1350044 (= e!767992 (not true))))

(assert (=> b!1350044 false))

(declare-fun value!554 () V!55249)

(declare-datatypes ((Unit!44217 0))(
  ( (Unit!44218) )
))
(declare-fun lt!596884 () Unit!44217)

(declare-fun addStillNotContains!506 (ListLongMap!22009 (_ BitVec 64) V!55249 (_ BitVec 64)) Unit!44217)

(assert (=> b!1350044 (= lt!596884 (addStillNotContains!506 lm!1456 otherKey!123 value!554 k!1141))))

(declare-fun res!895573 () Bool)

(assert (=> start!113768 (=> (not res!895573) (not e!767992))))

(declare-fun +!4862 (ListLongMap!22009 tuple2!24352) ListLongMap!22009)

(assert (=> start!113768 (= res!895573 (contains!9206 (+!4862 lm!1456 (tuple2!24353 otherKey!123 value!554)) k!1141))))

(assert (=> start!113768 e!767992))

(declare-fun e!767991 () Bool)

(declare-fun inv!48426 (ListLongMap!22009) Bool)

(assert (=> start!113768 (and (inv!48426 lm!1456) e!767991)))

(assert (=> start!113768 true))

(declare-fun tp_is_empty!37609 () Bool)

(assert (=> start!113768 tp_is_empty!37609))

(declare-fun b!1350045 () Bool)

(declare-fun tp!110629 () Bool)

(assert (=> b!1350045 (= e!767991 tp!110629)))

(declare-fun b!1350046 () Bool)

(declare-fun res!895571 () Bool)

(assert (=> b!1350046 (=> (not res!895571) (not e!767992))))

(assert (=> b!1350046 (= res!895571 (not (= otherKey!123 k!1141)))))

(assert (= (and start!113768 res!895573) b!1350043))

(assert (= (and b!1350043 res!895572) b!1350042))

(assert (= (and b!1350042 res!895570) b!1350046))

(assert (= (and b!1350046 res!895571) b!1350044))

(assert (= start!113768 b!1350045))

(declare-fun m!1237345 () Bool)

(assert (=> b!1350042 m!1237345))

(declare-fun m!1237347 () Bool)

(assert (=> b!1350044 m!1237347))

(declare-fun m!1237349 () Bool)

(assert (=> start!113768 m!1237349))

(assert (=> start!113768 m!1237349))

(declare-fun m!1237351 () Bool)

(assert (=> start!113768 m!1237351))

(declare-fun m!1237353 () Bool)

(assert (=> start!113768 m!1237353))

(push 1)

(assert tp_is_empty!37609)

(assert (not b!1350044))

(assert (not b!1350045))

(assert (not b!1350042))

(assert (not start!113768))

(check-sat)

