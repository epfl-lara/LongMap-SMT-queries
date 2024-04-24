; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75290 () Bool)

(assert start!75290)

(declare-fun b!886492 () Bool)

(declare-fun e!493448 () Bool)

(declare-fun tp_is_empty!17771 () Bool)

(declare-fun tp!54273 () Bool)

(assert (=> b!886492 (= e!493448 (and tp_is_empty!17771 tp!54273))))

(declare-fun b!886489 () Bool)

(declare-fun res!601752 () Bool)

(declare-fun e!493449 () Bool)

(assert (=> b!886489 (=> (not res!601752) (not e!493449))))

(declare-datatypes ((B!1260 0))(
  ( (B!1261 (val!8936 Int)) )
))
(declare-datatypes ((tuple2!11796 0))(
  ( (tuple2!11797 (_1!5909 (_ BitVec 64)) (_2!5909 B!1260)) )
))
(declare-datatypes ((List!17607 0))(
  ( (Nil!17604) (Cons!17603 (h!18740 tuple2!11796) (t!24876 List!17607)) )
))
(declare-fun l!906 () List!17607)

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!886489 (= res!601752 (and (is-Cons!17603 l!906) (bvslt (_1!5909 (h!18740 l!906)) key1!49)))))

(declare-fun res!601751 () Bool)

(assert (=> start!75290 (=> (not res!601751) (not e!493449))))

(declare-fun isStrictlySorted!464 (List!17607) Bool)

(assert (=> start!75290 (= res!601751 (isStrictlySorted!464 l!906))))

(assert (=> start!75290 e!493449))

(assert (=> start!75290 e!493448))

(assert (=> start!75290 true))

(assert (=> start!75290 tp_is_empty!17771))

(declare-fun b!886491 () Bool)

(assert (=> b!886491 (= e!493449 (not true))))

(declare-fun v2!16 () B!1260)

(declare-fun v1!38 () B!1260)

(declare-fun insertStrictlySorted!294 (List!17607 (_ BitVec 64) B!1260) List!17607)

(assert (=> b!886491 (= (insertStrictlySorted!294 (insertStrictlySorted!294 (t!24876 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!294 (t!24876 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30218 0))(
  ( (Unit!30219) )
))
(declare-fun lt!401396 () Unit!30218)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!12 (List!17607 (_ BitVec 64) B!1260 B!1260) Unit!30218)

(assert (=> b!886491 (= lt!401396 (lemmaInsertStrictlySortedErasesIfSameKey!12 (t!24876 l!906) key1!49 v1!38 v2!16))))

(declare-fun b!886490 () Bool)

(declare-fun res!601750 () Bool)

(assert (=> b!886490 (=> (not res!601750) (not e!493449))))

(assert (=> b!886490 (= res!601750 (isStrictlySorted!464 (t!24876 l!906)))))

(assert (= (and start!75290 res!601751) b!886489))

(assert (= (and b!886489 res!601752) b!886490))

(assert (= (and b!886490 res!601750) b!886491))

(assert (= (and start!75290 (is-Cons!17603 l!906)) b!886492))

(declare-fun m!827063 () Bool)

(assert (=> start!75290 m!827063))

(declare-fun m!827065 () Bool)

(assert (=> b!886491 m!827065))

(assert (=> b!886491 m!827065))

(declare-fun m!827067 () Bool)

(assert (=> b!886491 m!827067))

(declare-fun m!827069 () Bool)

(assert (=> b!886491 m!827069))

(declare-fun m!827071 () Bool)

(assert (=> b!886491 m!827071))

(declare-fun m!827073 () Bool)

(assert (=> b!886490 m!827073))

(push 1)

(assert (not start!75290))

(assert tp_is_empty!17771)

(assert (not b!886491))

(assert (not b!886492))

(assert (not b!886490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

