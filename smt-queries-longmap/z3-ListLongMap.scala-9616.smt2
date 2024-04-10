; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113770 () Bool)

(assert start!113770)

(declare-fun b!1350057 () Bool)

(declare-fun e!767998 () Bool)

(assert (=> b!1350057 (= e!767998 (not true))))

(assert (=> b!1350057 false))

(declare-datatypes ((V!55251 0))(
  ( (V!55252 (val!18880 Int)) )
))
(declare-fun value!554 () V!55251)

(declare-datatypes ((tuple2!24354 0))(
  ( (tuple2!24355 (_1!12188 (_ BitVec 64)) (_2!12188 V!55251)) )
))
(declare-datatypes ((List!31498 0))(
  ( (Nil!31495) (Cons!31494 (h!32703 tuple2!24354) (t!46156 List!31498)) )
))
(declare-datatypes ((ListLongMap!22011 0))(
  ( (ListLongMap!22012 (toList!11021 List!31498)) )
))
(declare-fun lm!1456 () ListLongMap!22011)

(declare-fun otherKey!123 () (_ BitVec 64))

(declare-fun k0!1141 () (_ BitVec 64))

(declare-datatypes ((Unit!44219 0))(
  ( (Unit!44220) )
))
(declare-fun lt!596887 () Unit!44219)

(declare-fun addStillNotContains!507 (ListLongMap!22011 (_ BitVec 64) V!55251 (_ BitVec 64)) Unit!44219)

(assert (=> b!1350057 (= lt!596887 (addStillNotContains!507 lm!1456 otherKey!123 value!554 k0!1141))))

(declare-fun res!895582 () Bool)

(assert (=> start!113770 (=> (not res!895582) (not e!767998))))

(declare-fun contains!9207 (ListLongMap!22011 (_ BitVec 64)) Bool)

(declare-fun +!4863 (ListLongMap!22011 tuple2!24354) ListLongMap!22011)

(assert (=> start!113770 (= res!895582 (contains!9207 (+!4863 lm!1456 (tuple2!24355 otherKey!123 value!554)) k0!1141))))

(assert (=> start!113770 e!767998))

(declare-fun e!767997 () Bool)

(declare-fun inv!48427 (ListLongMap!22011) Bool)

(assert (=> start!113770 (and (inv!48427 lm!1456) e!767997)))

(assert (=> start!113770 true))

(declare-fun tp_is_empty!37611 () Bool)

(assert (=> start!113770 tp_is_empty!37611))

(declare-fun b!1350058 () Bool)

(declare-fun tp!110632 () Bool)

(assert (=> b!1350058 (= e!767997 tp!110632)))

(declare-fun b!1350059 () Bool)

(declare-fun res!895584 () Bool)

(assert (=> b!1350059 (=> (not res!895584) (not e!767998))))

(assert (=> b!1350059 (= res!895584 (not (= k0!1141 otherKey!123)))))

(declare-fun b!1350060 () Bool)

(declare-fun res!895583 () Bool)

(assert (=> b!1350060 (=> (not res!895583) (not e!767998))))

(assert (=> b!1350060 (= res!895583 (not (contains!9207 lm!1456 k0!1141)))))

(declare-fun b!1350061 () Bool)

(declare-fun res!895585 () Bool)

(assert (=> b!1350061 (=> (not res!895585) (not e!767998))))

(assert (=> b!1350061 (= res!895585 (not (= otherKey!123 k0!1141)))))

(assert (= (and start!113770 res!895582) b!1350059))

(assert (= (and b!1350059 res!895584) b!1350060))

(assert (= (and b!1350060 res!895583) b!1350061))

(assert (= (and b!1350061 res!895585) b!1350057))

(assert (= start!113770 b!1350058))

(declare-fun m!1237355 () Bool)

(assert (=> b!1350057 m!1237355))

(declare-fun m!1237357 () Bool)

(assert (=> start!113770 m!1237357))

(assert (=> start!113770 m!1237357))

(declare-fun m!1237359 () Bool)

(assert (=> start!113770 m!1237359))

(declare-fun m!1237361 () Bool)

(assert (=> start!113770 m!1237361))

(declare-fun m!1237363 () Bool)

(assert (=> b!1350060 m!1237363))

(check-sat tp_is_empty!37611 (not b!1350060) (not start!113770) (not b!1350058) (not b!1350057))
(check-sat)
