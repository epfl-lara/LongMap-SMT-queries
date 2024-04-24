; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113980 () Bool)

(assert start!113980)

(declare-fun res!896040 () Bool)

(declare-fun e!768799 () Bool)

(assert (=> start!113980 (=> (not res!896040) (not e!768799))))

(declare-datatypes ((V!55233 0))(
  ( (V!55234 (val!18873 Int)) )
))
(declare-fun value!554 () V!55233)

(declare-datatypes ((tuple2!24396 0))(
  ( (tuple2!24397 (_1!12209 (_ BitVec 64)) (_2!12209 V!55233)) )
))
(declare-datatypes ((List!31531 0))(
  ( (Nil!31528) (Cons!31527 (h!32745 tuple2!24396) (t!46181 List!31531)) )
))
(declare-datatypes ((ListLongMap!22061 0))(
  ( (ListLongMap!22062 (toList!11046 List!31531)) )
))
(declare-fun lm!1456 () ListLongMap!22061)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-fun k0!1141 () (_ BitVec 64))

(declare-fun contains!9243 (ListLongMap!22061 (_ BitVec 64)) Bool)

(declare-fun +!4897 (ListLongMap!22061 tuple2!24396) ListLongMap!22061)

(assert (=> start!113980 (= res!896040 (contains!9243 (+!4897 lm!1456 (tuple2!24397 otherKey!123 value!554)) k0!1141))))

(assert (=> start!113980 e!768799))

(declare-fun e!768798 () Bool)

(declare-fun inv!48410 (ListLongMap!22061) Bool)

(assert (=> start!113980 (and (inv!48410 lm!1456) e!768798)))

(assert (=> start!113980 true))

(declare-fun tp_is_empty!37597 () Bool)

(assert (=> start!113980 tp_is_empty!37597))

(declare-fun b!1351274 () Bool)

(declare-fun res!896039 () Bool)

(assert (=> b!1351274 (=> (not res!896039) (not e!768799))))

(assert (=> b!1351274 (= res!896039 (not (= k0!1141 otherKey!123)))))

(declare-fun b!1351275 () Bool)

(assert (=> b!1351275 (= e!768799 false)))

(declare-fun lt!597351 () Bool)

(assert (=> b!1351275 (= lt!597351 (contains!9243 lm!1456 k0!1141))))

(declare-fun b!1351276 () Bool)

(declare-fun tp!110611 () Bool)

(assert (=> b!1351276 (= e!768798 tp!110611)))

(assert (= (and start!113980 res!896040) b!1351274))

(assert (= (and b!1351274 res!896039) b!1351275))

(assert (= start!113980 b!1351276))

(declare-fun m!1238895 () Bool)

(assert (=> start!113980 m!1238895))

(assert (=> start!113980 m!1238895))

(declare-fun m!1238897 () Bool)

(assert (=> start!113980 m!1238897))

(declare-fun m!1238899 () Bool)

(assert (=> start!113980 m!1238899))

(declare-fun m!1238901 () Bool)

(assert (=> b!1351275 m!1238901))

(check-sat (not b!1351275) (not start!113980) (not b!1351276) tp_is_empty!37597)
(check-sat)
