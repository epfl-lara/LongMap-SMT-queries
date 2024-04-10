; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75092 () Bool)

(assert start!75092)

(declare-fun res!601288 () Bool)

(declare-fun e!492701 () Bool)

(assert (=> start!75092 (=> (not res!601288) (not e!492701))))

(declare-datatypes ((B!1248 0))(
  ( (B!1249 (val!8930 Int)) )
))
(declare-datatypes ((tuple2!11854 0))(
  ( (tuple2!11855 (_1!5938 (_ BitVec 64)) (_2!5938 B!1248)) )
))
(declare-datatypes ((List!17646 0))(
  ( (Nil!17643) (Cons!17642 (h!18773 tuple2!11854) (t!24923 List!17646)) )
))
(declare-fun l!906 () List!17646)

(declare-fun isStrictlySorted!470 (List!17646) Bool)

(assert (=> start!75092 (= res!601288 (isStrictlySorted!470 l!906))))

(assert (=> start!75092 e!492701))

(declare-fun e!492702 () Bool)

(assert (=> start!75092 e!492702))

(assert (=> start!75092 true))

(declare-fun tp_is_empty!17759 () Bool)

(assert (=> start!75092 tp_is_empty!17759))

(declare-fun b!885292 () Bool)

(declare-fun tp!54245 () Bool)

(assert (=> b!885292 (= e!492702 (and tp_is_empty!17759 tp!54245))))

(declare-fun b!885291 () Bool)

(assert (=> b!885291 (= e!492701 (not true))))

(declare-fun v2!16 () B!1248)

(declare-fun key1!49 () (_ BitVec 64))

(declare-fun v1!38 () B!1248)

(declare-fun insertStrictlySorted!287 (List!17646 (_ BitVec 64) B!1248) List!17646)

(assert (=> b!885291 (= (insertStrictlySorted!287 (insertStrictlySorted!287 (t!24923 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!287 (t!24923 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30226 0))(
  ( (Unit!30227) )
))
(declare-fun lt!400990 () Unit!30226)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!6 (List!17646 (_ BitVec 64) B!1248 B!1248) Unit!30226)

(assert (=> b!885291 (= lt!400990 (lemmaInsertStrictlySortedErasesIfSameKey!6 (t!24923 l!906) key1!49 v1!38 v2!16))))

(declare-fun b!885289 () Bool)

(declare-fun res!601286 () Bool)

(assert (=> b!885289 (=> (not res!601286) (not e!492701))))

(assert (=> b!885289 (= res!601286 (and (is-Cons!17642 l!906) (bvslt (_1!5938 (h!18773 l!906)) key1!49)))))

(declare-fun b!885290 () Bool)

(declare-fun res!601287 () Bool)

(assert (=> b!885290 (=> (not res!601287) (not e!492701))))

(assert (=> b!885290 (= res!601287 (isStrictlySorted!470 (t!24923 l!906)))))

(assert (= (and start!75092 res!601288) b!885289))

(assert (= (and b!885289 res!601286) b!885290))

(assert (= (and b!885290 res!601287) b!885291))

(assert (= (and start!75092 (is-Cons!17642 l!906)) b!885292))

(declare-fun m!825547 () Bool)

(assert (=> start!75092 m!825547))

(declare-fun m!825549 () Bool)

(assert (=> b!885291 m!825549))

(assert (=> b!885291 m!825549))

(declare-fun m!825551 () Bool)

(assert (=> b!885291 m!825551))

(declare-fun m!825553 () Bool)

(assert (=> b!885291 m!825553))

(declare-fun m!825555 () Bool)

(assert (=> b!885291 m!825555))

(declare-fun m!825557 () Bool)

(assert (=> b!885290 m!825557))

(push 1)

(assert (not b!885290))

(assert tp_is_empty!17759)

(assert (not b!885291))

(assert (not start!75092))

(assert (not b!885292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

