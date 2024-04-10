; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75118 () Bool)

(assert start!75118)

(declare-fun b!885562 () Bool)

(declare-fun res!601390 () Bool)

(declare-fun e!492855 () Bool)

(assert (=> b!885562 (=> (not res!601390) (not e!492855))))

(declare-datatypes ((B!1256 0))(
  ( (B!1257 (val!8934 Int)) )
))
(declare-datatypes ((tuple2!11862 0))(
  ( (tuple2!11863 (_1!5942 (_ BitVec 64)) (_2!5942 B!1256)) )
))
(declare-datatypes ((List!17650 0))(
  ( (Nil!17647) (Cons!17646 (h!18777 tuple2!11862) (t!24927 List!17650)) )
))
(declare-fun l!906 () List!17650)

(declare-fun key1!49 () (_ BitVec 64))

(assert (=> b!885562 (= res!601390 (and (is-Cons!17646 l!906) (bvslt (_1!5942 (h!18777 l!906)) key1!49)))))

(declare-fun b!885563 () Bool)

(declare-fun res!601389 () Bool)

(assert (=> b!885563 (=> (not res!601389) (not e!492855))))

(declare-fun isStrictlySorted!474 (List!17650) Bool)

(assert (=> b!885563 (= res!601389 (isStrictlySorted!474 (t!24927 l!906)))))

(declare-fun res!601388 () Bool)

(assert (=> start!75118 (=> (not res!601388) (not e!492855))))

(assert (=> start!75118 (= res!601388 (isStrictlySorted!474 l!906))))

(assert (=> start!75118 e!492855))

(declare-fun e!492854 () Bool)

(assert (=> start!75118 e!492854))

(assert (=> start!75118 true))

(declare-fun tp_is_empty!17767 () Bool)

(assert (=> start!75118 tp_is_empty!17767))

(declare-fun b!885564 () Bool)

(assert (=> b!885564 (= e!492855 (not true))))

(declare-fun v2!16 () B!1256)

(declare-fun v1!38 () B!1256)

(declare-fun insertStrictlySorted!291 (List!17650 (_ BitVec 64) B!1256) List!17650)

(assert (=> b!885564 (= (insertStrictlySorted!291 (insertStrictlySorted!291 (t!24927 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!291 (t!24927 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30234 0))(
  ( (Unit!30235) )
))
(declare-fun lt!401029 () Unit!30234)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!10 (List!17650 (_ BitVec 64) B!1256 B!1256) Unit!30234)

(assert (=> b!885564 (= lt!401029 (lemmaInsertStrictlySortedErasesIfSameKey!10 (t!24927 l!906) key1!49 v1!38 v2!16))))

(declare-fun b!885565 () Bool)

(declare-fun tp!54266 () Bool)

(assert (=> b!885565 (= e!492854 (and tp_is_empty!17767 tp!54266))))

(assert (= (and start!75118 res!601388) b!885562))

(assert (= (and b!885562 res!601390) b!885563))

(assert (= (and b!885563 res!601389) b!885564))

(assert (= (and start!75118 (is-Cons!17646 l!906)) b!885565))

(declare-fun m!825745 () Bool)

(assert (=> b!885563 m!825745))

(declare-fun m!825747 () Bool)

(assert (=> start!75118 m!825747))

(declare-fun m!825749 () Bool)

(assert (=> b!885564 m!825749))

(assert (=> b!885564 m!825749))

(declare-fun m!825751 () Bool)

(assert (=> b!885564 m!825751))

(declare-fun m!825753 () Bool)

(assert (=> b!885564 m!825753))

(declare-fun m!825755 () Bool)

(assert (=> b!885564 m!825755))

(push 1)

(assert tp_is_empty!17767)

(assert (not b!885565))

(assert (not start!75118))

(assert (not b!885564))

(assert (not b!885563))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

