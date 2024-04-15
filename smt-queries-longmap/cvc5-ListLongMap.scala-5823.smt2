; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75104 () Bool)

(assert start!75104)

(declare-fun b!885348 () Bool)

(declare-fun res!601297 () Bool)

(declare-fun e!492718 () Bool)

(assert (=> b!885348 (=> (not res!601297) (not e!492718))))

(declare-datatypes ((B!1260 0))(
  ( (B!1261 (val!8936 Int)) )
))
(declare-datatypes ((tuple2!11886 0))(
  ( (tuple2!11887 (_1!5954 (_ BitVec 64)) (_2!5954 B!1260)) )
))
(declare-datatypes ((List!17660 0))(
  ( (Nil!17657) (Cons!17656 (h!18787 tuple2!11886) (t!24928 List!17660)) )
))
(declare-fun l!906 () List!17660)

(declare-fun isStrictlySorted!472 (List!17660) Bool)

(assert (=> b!885348 (= res!601297 (isStrictlySorted!472 (t!24928 l!906)))))

(declare-fun res!601296 () Bool)

(assert (=> start!75104 (=> (not res!601296) (not e!492718))))

(assert (=> start!75104 (= res!601296 (isStrictlySorted!472 l!906))))

(assert (=> start!75104 e!492718))

(declare-fun e!492719 () Bool)

(assert (=> start!75104 e!492719))

(assert (=> start!75104 true))

(declare-fun tp_is_empty!17771 () Bool)

(assert (=> start!75104 tp_is_empty!17771))

(declare-fun b!885349 () Bool)

(assert (=> b!885349 (= e!492718 (not true))))

(declare-fun v2!16 () B!1260)

(declare-fun key1!49 () (_ BitVec 64))

(declare-fun v1!38 () B!1260)

(declare-fun insertStrictlySorted!294 (List!17660 (_ BitVec 64) B!1260) List!17660)

(assert (=> b!885349 (= (insertStrictlySorted!294 (insertStrictlySorted!294 (t!24928 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!294 (t!24928 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30180 0))(
  ( (Unit!30181) )
))
(declare-fun lt!400799 () Unit!30180)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!12 (List!17660 (_ BitVec 64) B!1260 B!1260) Unit!30180)

(assert (=> b!885349 (= lt!400799 (lemmaInsertStrictlySortedErasesIfSameKey!12 (t!24928 l!906) key1!49 v1!38 v2!16))))

(declare-fun b!885350 () Bool)

(declare-fun tp!54273 () Bool)

(assert (=> b!885350 (= e!492719 (and tp_is_empty!17771 tp!54273))))

(declare-fun b!885347 () Bool)

(declare-fun res!601298 () Bool)

(assert (=> b!885347 (=> (not res!601298) (not e!492718))))

(assert (=> b!885347 (= res!601298 (and (is-Cons!17656 l!906) (bvslt (_1!5954 (h!18787 l!906)) key1!49)))))

(assert (= (and start!75104 res!601296) b!885347))

(assert (= (and b!885347 res!601298) b!885348))

(assert (= (and b!885348 res!601297) b!885349))

(assert (= (and start!75104 (is-Cons!17656 l!906)) b!885350))

(declare-fun m!825011 () Bool)

(assert (=> b!885348 m!825011))

(declare-fun m!825013 () Bool)

(assert (=> start!75104 m!825013))

(declare-fun m!825015 () Bool)

(assert (=> b!885349 m!825015))

(assert (=> b!885349 m!825015))

(declare-fun m!825017 () Bool)

(assert (=> b!885349 m!825017))

(declare-fun m!825019 () Bool)

(assert (=> b!885349 m!825019))

(declare-fun m!825021 () Bool)

(assert (=> b!885349 m!825021))

(push 1)

(assert tp_is_empty!17771)

(assert (not b!885348))

(assert (not b!885349))

(assert (not b!885350))

(assert (not start!75104))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

