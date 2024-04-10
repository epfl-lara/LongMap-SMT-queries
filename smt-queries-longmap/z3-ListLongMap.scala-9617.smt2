; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113776 () Bool)

(assert start!113776)

(declare-fun res!895608 () Bool)

(declare-fun e!768015 () Bool)

(assert (=> start!113776 (=> (not res!895608) (not e!768015))))

(declare-datatypes ((V!55259 0))(
  ( (V!55260 (val!18883 Int)) )
))
(declare-fun value!554 () V!55259)

(declare-datatypes ((tuple2!24360 0))(
  ( (tuple2!24361 (_1!12191 (_ BitVec 64)) (_2!12191 V!55259)) )
))
(declare-datatypes ((List!31501 0))(
  ( (Nil!31498) (Cons!31497 (h!32706 tuple2!24360) (t!46159 List!31501)) )
))
(declare-datatypes ((ListLongMap!22017 0))(
  ( (ListLongMap!22018 (toList!11024 List!31501)) )
))
(declare-fun lm!1456 () ListLongMap!22017)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-fun k0!1141 () (_ BitVec 64))

(declare-fun contains!9210 (ListLongMap!22017 (_ BitVec 64)) Bool)

(declare-fun +!4866 (ListLongMap!22017 tuple2!24360) ListLongMap!22017)

(assert (=> start!113776 (= res!895608 (contains!9210 (+!4866 lm!1456 (tuple2!24361 otherKey!123 value!554)) k0!1141))))

(assert (=> start!113776 e!768015))

(declare-fun e!768016 () Bool)

(declare-fun inv!48435 (ListLongMap!22017) Bool)

(assert (=> start!113776 (and (inv!48435 lm!1456) e!768016)))

(assert (=> start!113776 true))

(declare-fun tp_is_empty!37617 () Bool)

(assert (=> start!113776 tp_is_empty!37617))

(declare-fun b!1350092 () Bool)

(declare-fun res!895609 () Bool)

(assert (=> b!1350092 (=> (not res!895609) (not e!768015))))

(assert (=> b!1350092 (= res!895609 (not (= k0!1141 otherKey!123)))))

(declare-fun b!1350093 () Bool)

(assert (=> b!1350093 (= e!768015 false)))

(declare-fun lt!596896 () Bool)

(assert (=> b!1350093 (= lt!596896 (contains!9210 lm!1456 k0!1141))))

(declare-fun b!1350094 () Bool)

(declare-fun tp!110641 () Bool)

(assert (=> b!1350094 (= e!768016 tp!110641)))

(assert (= (and start!113776 res!895608) b!1350092))

(assert (= (and b!1350092 res!895609) b!1350093))

(assert (= start!113776 b!1350094))

(declare-fun m!1237383 () Bool)

(assert (=> start!113776 m!1237383))

(assert (=> start!113776 m!1237383))

(declare-fun m!1237385 () Bool)

(assert (=> start!113776 m!1237385))

(declare-fun m!1237387 () Bool)

(assert (=> start!113776 m!1237387))

(declare-fun m!1237389 () Bool)

(assert (=> b!1350093 m!1237389))

(check-sat (not start!113776) (not b!1350093) (not b!1350094) tp_is_empty!37617)
(check-sat)
