; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75088 () Bool)

(assert start!75088)

(declare-fun b!885268 () Bool)

(declare-fun e!492690 () Bool)

(declare-fun tp_is_empty!17755 () Bool)

(declare-fun tp!54239 () Bool)

(assert (=> b!885268 (= e!492690 (and tp_is_empty!17755 tp!54239))))

(declare-fun res!601269 () Bool)

(declare-fun e!492689 () Bool)

(assert (=> start!75088 (=> (not res!601269) (not e!492689))))

(declare-datatypes ((B!1244 0))(
  ( (B!1245 (val!8928 Int)) )
))
(declare-datatypes ((tuple2!11850 0))(
  ( (tuple2!11851 (_1!5936 (_ BitVec 64)) (_2!5936 B!1244)) )
))
(declare-datatypes ((List!17644 0))(
  ( (Nil!17641) (Cons!17640 (h!18771 tuple2!11850) (t!24921 List!17644)) )
))
(declare-fun l!906 () List!17644)

(declare-fun isStrictlySorted!468 (List!17644) Bool)

(assert (=> start!75088 (= res!601269 (isStrictlySorted!468 l!906))))

(assert (=> start!75088 e!492689))

(assert (=> start!75088 e!492690))

(assert (=> start!75088 true))

(assert (=> start!75088 tp_is_empty!17755))

(declare-fun b!885267 () Bool)

(assert (=> b!885267 (= e!492689 (not true))))

(declare-fun v2!16 () B!1244)

(declare-fun key1!49 () (_ BitVec 64))

(declare-fun v1!38 () B!1244)

(declare-fun insertStrictlySorted!285 (List!17644 (_ BitVec 64) B!1244) List!17644)

(assert (=> b!885267 (= (insertStrictlySorted!285 (insertStrictlySorted!285 (t!24921 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!285 (t!24921 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30222 0))(
  ( (Unit!30223) )
))
(declare-fun lt!400984 () Unit!30222)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!4 (List!17644 (_ BitVec 64) B!1244 B!1244) Unit!30222)

(assert (=> b!885267 (= lt!400984 (lemmaInsertStrictlySortedErasesIfSameKey!4 (t!24921 l!906) key1!49 v1!38 v2!16))))

(declare-fun b!885265 () Bool)

(declare-fun res!601270 () Bool)

(assert (=> b!885265 (=> (not res!601270) (not e!492689))))

(assert (=> b!885265 (= res!601270 (and (is-Cons!17640 l!906) (bvslt (_1!5936 (h!18771 l!906)) key1!49)))))

(declare-fun b!885266 () Bool)

(declare-fun res!601268 () Bool)

(assert (=> b!885266 (=> (not res!601268) (not e!492689))))

(assert (=> b!885266 (= res!601268 (isStrictlySorted!468 (t!24921 l!906)))))

(assert (= (and start!75088 res!601269) b!885265))

(assert (= (and b!885265 res!601270) b!885266))

(assert (= (and b!885266 res!601268) b!885267))

(assert (= (and start!75088 (is-Cons!17640 l!906)) b!885268))

(declare-fun m!825523 () Bool)

(assert (=> start!75088 m!825523))

(declare-fun m!825525 () Bool)

(assert (=> b!885267 m!825525))

(assert (=> b!885267 m!825525))

(declare-fun m!825527 () Bool)

(assert (=> b!885267 m!825527))

(declare-fun m!825529 () Bool)

(assert (=> b!885267 m!825529))

(declare-fun m!825531 () Bool)

(assert (=> b!885267 m!825531))

(declare-fun m!825533 () Bool)

(assert (=> b!885266 m!825533))

(push 1)

(assert (not start!75088))

(assert (not b!885267))

(assert tp_is_empty!17755)

(assert (not b!885266))

(assert (not b!885268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

