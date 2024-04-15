; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75072 () Bool)

(assert start!75072)

(declare-fun b!885039 () Bool)

(declare-fun res!601169 () Bool)

(declare-fun e!492547 () Bool)

(assert (=> b!885039 (=> (not res!601169) (not e!492547))))

(declare-datatypes ((B!1246 0))(
  ( (B!1247 (val!8929 Int)) )
))
(declare-datatypes ((tuple2!11872 0))(
  ( (tuple2!11873 (_1!5947 (_ BitVec 64)) (_2!5947 B!1246)) )
))
(declare-datatypes ((List!17653 0))(
  ( (Nil!17650) (Cons!17649 (h!18780 tuple2!11872) (t!24921 List!17653)) )
))
(declare-fun l!906 () List!17653)

(declare-fun isStrictlySorted!465 (List!17653) Bool)

(assert (=> b!885039 (= res!601169 (isStrictlySorted!465 (t!24921 l!906)))))

(declare-fun b!885038 () Bool)

(declare-fun res!601167 () Bool)

(assert (=> b!885038 (=> (not res!601167) (not e!492547))))

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!885038 (= res!601167 (and (is-Cons!17649 l!906) (bvslt (_1!5947 (h!18780 l!906)) key1!49)))))

(declare-fun b!885041 () Bool)

(declare-fun e!492548 () Bool)

(declare-fun tp_is_empty!17757 () Bool)

(declare-fun tp!54243 () Bool)

(assert (=> b!885041 (= e!492548 (and tp_is_empty!17757 tp!54243))))

(declare-fun res!601168 () Bool)

(assert (=> start!75072 (=> (not res!601168) (not e!492547))))

(assert (=> start!75072 (= res!601168 (isStrictlySorted!465 l!906))))

(assert (=> start!75072 e!492547))

(assert (=> start!75072 e!492548))

(assert (=> start!75072 true))

(assert (=> start!75072 tp_is_empty!17757))

(declare-fun b!885040 () Bool)

(assert (=> b!885040 (= e!492547 (not true))))

(declare-fun v2!16 () B!1246)

(declare-fun v1!38 () B!1246)

(declare-fun insertStrictlySorted!287 (List!17653 (_ BitVec 64) B!1246) List!17653)

(assert (=> b!885040 (= (insertStrictlySorted!287 (insertStrictlySorted!287 (t!24921 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!287 (t!24921 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30166 0))(
  ( (Unit!30167) )
))
(declare-fun lt!400751 () Unit!30166)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!5 (List!17653 (_ BitVec 64) B!1246 B!1246) Unit!30166)

(assert (=> b!885040 (= lt!400751 (lemmaInsertStrictlySortedErasesIfSameKey!5 (t!24921 l!906) key1!49 v1!38 v2!16))))

(assert (= (and start!75072 res!601168) b!885038))

(assert (= (and b!885038 res!601167) b!885039))

(assert (= (and b!885039 res!601169) b!885040))

(assert (= (and start!75072 (is-Cons!17649 l!906)) b!885041))

(declare-fun m!824777 () Bool)

(assert (=> b!885039 m!824777))

(declare-fun m!824779 () Bool)

(assert (=> start!75072 m!824779))

(declare-fun m!824781 () Bool)

(assert (=> b!885040 m!824781))

(assert (=> b!885040 m!824781))

(declare-fun m!824783 () Bool)

(assert (=> b!885040 m!824783))

(declare-fun m!824785 () Bool)

(assert (=> b!885040 m!824785))

(declare-fun m!824787 () Bool)

(assert (=> b!885040 m!824787))

(push 1)

(assert (not b!885040))

(assert tp_is_empty!17757)

(assert (not b!885039))

(assert (not start!75072))

(assert (not b!885041))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

