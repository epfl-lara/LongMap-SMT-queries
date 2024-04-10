; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113758 () Bool)

(assert start!113758)

(declare-fun res!895528 () Bool)

(declare-fun e!767961 () Bool)

(assert (=> start!113758 (=> (not res!895528) (not e!767961))))

(declare-datatypes ((V!55235 0))(
  ( (V!55236 (val!18874 Int)) )
))
(declare-fun value!554 () V!55235)

(declare-datatypes ((tuple2!24342 0))(
  ( (tuple2!24343 (_1!12182 (_ BitVec 64)) (_2!12182 V!55235)) )
))
(declare-datatypes ((List!31492 0))(
  ( (Nil!31489) (Cons!31488 (h!32697 tuple2!24342) (t!46150 List!31492)) )
))
(declare-datatypes ((ListLongMap!21999 0))(
  ( (ListLongMap!22000 (toList!11015 List!31492)) )
))
(declare-fun lm!1456 () ListLongMap!21999)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-fun k0!1141 () (_ BitVec 64))

(declare-fun contains!9201 (ListLongMap!21999 (_ BitVec 64)) Bool)

(declare-fun +!4857 (ListLongMap!21999 tuple2!24342) ListLongMap!21999)

(assert (=> start!113758 (= res!895528 (contains!9201 (+!4857 lm!1456 (tuple2!24343 otherKey!123 value!554)) k0!1141))))

(assert (=> start!113758 e!767961))

(declare-fun e!767962 () Bool)

(declare-fun inv!48411 (ListLongMap!21999) Bool)

(assert (=> start!113758 (and (inv!48411 lm!1456) e!767962)))

(assert (=> start!113758 true))

(declare-fun tp_is_empty!37599 () Bool)

(assert (=> start!113758 tp_is_empty!37599))

(declare-fun b!1349984 () Bool)

(declare-fun res!895527 () Bool)

(assert (=> b!1349984 (=> (not res!895527) (not e!767961))))

(assert (=> b!1349984 (= res!895527 (not (= k0!1141 otherKey!123)))))

(declare-fun b!1349985 () Bool)

(assert (=> b!1349985 (= e!767961 false)))

(declare-fun lt!596878 () Bool)

(assert (=> b!1349985 (= lt!596878 (contains!9201 lm!1456 k0!1141))))

(declare-fun b!1349986 () Bool)

(declare-fun tp!110614 () Bool)

(assert (=> b!1349986 (= e!767962 tp!110614)))

(assert (= (and start!113758 res!895528) b!1349984))

(assert (= (and b!1349984 res!895527) b!1349985))

(assert (= start!113758 b!1349986))

(declare-fun m!1237305 () Bool)

(assert (=> start!113758 m!1237305))

(assert (=> start!113758 m!1237305))

(declare-fun m!1237307 () Bool)

(assert (=> start!113758 m!1237307))

(declare-fun m!1237309 () Bool)

(assert (=> start!113758 m!1237309))

(declare-fun m!1237311 () Bool)

(assert (=> b!1349985 m!1237311))

(check-sat (not b!1349985) (not start!113758) (not b!1349986) tp_is_empty!37599)
(check-sat)
