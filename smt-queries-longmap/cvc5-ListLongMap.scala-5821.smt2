; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75260 () Bool)

(assert start!75260)

(declare-fun b!886195 () Bool)

(declare-fun e!493284 () Bool)

(declare-fun tp_is_empty!17759 () Bool)

(declare-fun tp!54246 () Bool)

(assert (=> b!886195 (= e!493284 (and tp_is_empty!17759 tp!54246))))

(declare-fun res!601632 () Bool)

(declare-fun e!493283 () Bool)

(assert (=> start!75260 (=> (not res!601632) (not e!493283))))

(declare-datatypes ((B!1248 0))(
  ( (B!1249 (val!8930 Int)) )
))
(declare-datatypes ((tuple2!11784 0))(
  ( (tuple2!11785 (_1!5903 (_ BitVec 64)) (_2!5903 B!1248)) )
))
(declare-datatypes ((List!17601 0))(
  ( (Nil!17598) (Cons!17597 (h!18734 tuple2!11784) (t!24870 List!17601)) )
))
(declare-fun l!906 () List!17601)

(declare-fun isStrictlySorted!458 (List!17601) Bool)

(assert (=> start!75260 (= res!601632 (isStrictlySorted!458 l!906))))

(assert (=> start!75260 e!493283))

(assert (=> start!75260 e!493284))

(assert (=> start!75260 true))

(assert (=> start!75260 tp_is_empty!17759))

(declare-fun b!886192 () Bool)

(declare-fun res!601630 () Bool)

(assert (=> b!886192 (=> (not res!601630) (not e!493283))))

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!886192 (= res!601630 (and (is-Cons!17597 l!906) (bvslt (_1!5903 (h!18734 l!906)) key1!49)))))

(declare-fun b!886194 () Bool)

(assert (=> b!886194 (= e!493283 (not true))))

(declare-fun v2!16 () B!1248)

(declare-fun v1!38 () B!1248)

(declare-fun insertStrictlySorted!288 (List!17601 (_ BitVec 64) B!1248) List!17601)

(assert (=> b!886194 (= (insertStrictlySorted!288 (insertStrictlySorted!288 (t!24870 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!288 (t!24870 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30206 0))(
  ( (Unit!30207) )
))
(declare-fun lt!401351 () Unit!30206)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!6 (List!17601 (_ BitVec 64) B!1248 B!1248) Unit!30206)

(assert (=> b!886194 (= lt!401351 (lemmaInsertStrictlySortedErasesIfSameKey!6 (t!24870 l!906) key1!49 v1!38 v2!16))))

(declare-fun b!886193 () Bool)

(declare-fun res!601631 () Bool)

(assert (=> b!886193 (=> (not res!601631) (not e!493283))))

(assert (=> b!886193 (= res!601631 (isStrictlySorted!458 (t!24870 l!906)))))

(assert (= (and start!75260 res!601632) b!886192))

(assert (= (and b!886192 res!601630) b!886193))

(assert (= (and b!886193 res!601631) b!886194))

(assert (= (and start!75260 (is-Cons!17597 l!906)) b!886195))

(declare-fun m!826841 () Bool)

(assert (=> start!75260 m!826841))

(declare-fun m!826843 () Bool)

(assert (=> b!886194 m!826843))

(assert (=> b!886194 m!826843))

(declare-fun m!826845 () Bool)

(assert (=> b!886194 m!826845))

(declare-fun m!826847 () Bool)

(assert (=> b!886194 m!826847))

(declare-fun m!826849 () Bool)

(assert (=> b!886194 m!826849))

(declare-fun m!826851 () Bool)

(assert (=> b!886193 m!826851))

(push 1)

(assert (not start!75260))

(assert (not b!886195))

(assert (not b!886194))

(assert (not b!886193))

(assert tp_is_empty!17759)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

