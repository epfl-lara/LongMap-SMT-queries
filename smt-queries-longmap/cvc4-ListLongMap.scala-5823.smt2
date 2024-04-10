; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75122 () Bool)

(assert start!75122)

(declare-fun res!601406 () Bool)

(declare-fun e!492867 () Bool)

(assert (=> start!75122 (=> (not res!601406) (not e!492867))))

(declare-datatypes ((B!1260 0))(
  ( (B!1261 (val!8936 Int)) )
))
(declare-datatypes ((tuple2!11866 0))(
  ( (tuple2!11867 (_1!5944 (_ BitVec 64)) (_2!5944 B!1260)) )
))
(declare-datatypes ((List!17652 0))(
  ( (Nil!17649) (Cons!17648 (h!18779 tuple2!11866) (t!24929 List!17652)) )
))
(declare-fun l!906 () List!17652)

(declare-fun isStrictlySorted!476 (List!17652) Bool)

(assert (=> start!75122 (= res!601406 (isStrictlySorted!476 l!906))))

(assert (=> start!75122 e!492867))

(declare-fun e!492866 () Bool)

(assert (=> start!75122 e!492866))

(assert (=> start!75122 true))

(declare-fun tp_is_empty!17771 () Bool)

(assert (=> start!75122 tp_is_empty!17771))

(declare-fun b!885586 () Bool)

(declare-fun res!601408 () Bool)

(assert (=> b!885586 (=> (not res!601408) (not e!492867))))

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!885586 (= res!601408 (and (is-Cons!17648 l!906) (bvslt (_1!5944 (h!18779 l!906)) key1!49)))))

(declare-fun b!885588 () Bool)

(assert (=> b!885588 (= e!492867 (not true))))

(declare-fun v2!16 () B!1260)

(declare-fun v1!38 () B!1260)

(declare-fun insertStrictlySorted!293 (List!17652 (_ BitVec 64) B!1260) List!17652)

(assert (=> b!885588 (= (insertStrictlySorted!293 (insertStrictlySorted!293 (t!24929 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!293 (t!24929 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30238 0))(
  ( (Unit!30239) )
))
(declare-fun lt!401035 () Unit!30238)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!12 (List!17652 (_ BitVec 64) B!1260 B!1260) Unit!30238)

(assert (=> b!885588 (= lt!401035 (lemmaInsertStrictlySortedErasesIfSameKey!12 (t!24929 l!906) key1!49 v1!38 v2!16))))

(declare-fun b!885589 () Bool)

(declare-fun tp!54272 () Bool)

(assert (=> b!885589 (= e!492866 (and tp_is_empty!17771 tp!54272))))

(declare-fun b!885587 () Bool)

(declare-fun res!601407 () Bool)

(assert (=> b!885587 (=> (not res!601407) (not e!492867))))

(assert (=> b!885587 (= res!601407 (isStrictlySorted!476 (t!24929 l!906)))))

(assert (= (and start!75122 res!601406) b!885586))

(assert (= (and b!885586 res!601408) b!885587))

(assert (= (and b!885587 res!601407) b!885588))

(assert (= (and start!75122 (is-Cons!17648 l!906)) b!885589))

(declare-fun m!825769 () Bool)

(assert (=> start!75122 m!825769))

(declare-fun m!825771 () Bool)

(assert (=> b!885588 m!825771))

(assert (=> b!885588 m!825771))

(declare-fun m!825773 () Bool)

(assert (=> b!885588 m!825773))

(declare-fun m!825775 () Bool)

(assert (=> b!885588 m!825775))

(declare-fun m!825777 () Bool)

(assert (=> b!885588 m!825777))

(declare-fun m!825779 () Bool)

(assert (=> b!885587 m!825779))

(push 1)

(assert (not b!885589))

(assert (not b!885587))

(assert tp_is_empty!17771)

(assert (not start!75122))

(assert (not b!885588))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

