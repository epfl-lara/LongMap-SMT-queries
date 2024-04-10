; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75120 () Bool)

(assert start!75120)

(declare-fun b!885574 () Bool)

(declare-fun res!601398 () Bool)

(declare-fun e!492860 () Bool)

(assert (=> b!885574 (=> (not res!601398) (not e!492860))))

(declare-datatypes ((B!1258 0))(
  ( (B!1259 (val!8935 Int)) )
))
(declare-datatypes ((tuple2!11864 0))(
  ( (tuple2!11865 (_1!5943 (_ BitVec 64)) (_2!5943 B!1258)) )
))
(declare-datatypes ((List!17651 0))(
  ( (Nil!17648) (Cons!17647 (h!18778 tuple2!11864) (t!24928 List!17651)) )
))
(declare-fun l!906 () List!17651)

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!885574 (= res!601398 (and ((_ is Cons!17647) l!906) (bvslt (_1!5943 (h!18778 l!906)) key1!49)))))

(declare-fun b!885577 () Bool)

(declare-fun e!492861 () Bool)

(declare-fun tp_is_empty!17769 () Bool)

(declare-fun tp!54269 () Bool)

(assert (=> b!885577 (= e!492861 (and tp_is_empty!17769 tp!54269))))

(declare-fun b!885576 () Bool)

(assert (=> b!885576 (= e!492860 (not true))))

(declare-fun v2!16 () B!1258)

(declare-fun v1!38 () B!1258)

(declare-fun insertStrictlySorted!292 (List!17651 (_ BitVec 64) B!1258) List!17651)

(assert (=> b!885576 (= (insertStrictlySorted!292 (insertStrictlySorted!292 (t!24928 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!292 (t!24928 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30236 0))(
  ( (Unit!30237) )
))
(declare-fun lt!401032 () Unit!30236)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!11 (List!17651 (_ BitVec 64) B!1258 B!1258) Unit!30236)

(assert (=> b!885576 (= lt!401032 (lemmaInsertStrictlySortedErasesIfSameKey!11 (t!24928 l!906) key1!49 v1!38 v2!16))))

(declare-fun b!885575 () Bool)

(declare-fun res!601397 () Bool)

(assert (=> b!885575 (=> (not res!601397) (not e!492860))))

(declare-fun isStrictlySorted!475 (List!17651) Bool)

(assert (=> b!885575 (= res!601397 (isStrictlySorted!475 (t!24928 l!906)))))

(declare-fun res!601399 () Bool)

(assert (=> start!75120 (=> (not res!601399) (not e!492860))))

(assert (=> start!75120 (= res!601399 (isStrictlySorted!475 l!906))))

(assert (=> start!75120 e!492860))

(assert (=> start!75120 e!492861))

(assert (=> start!75120 true))

(assert (=> start!75120 tp_is_empty!17769))

(assert (= (and start!75120 res!601399) b!885574))

(assert (= (and b!885574 res!601398) b!885575))

(assert (= (and b!885575 res!601397) b!885576))

(assert (= (and start!75120 ((_ is Cons!17647) l!906)) b!885577))

(declare-fun m!825757 () Bool)

(assert (=> b!885576 m!825757))

(assert (=> b!885576 m!825757))

(declare-fun m!825759 () Bool)

(assert (=> b!885576 m!825759))

(declare-fun m!825761 () Bool)

(assert (=> b!885576 m!825761))

(declare-fun m!825763 () Bool)

(assert (=> b!885576 m!825763))

(declare-fun m!825765 () Bool)

(assert (=> b!885575 m!825765))

(declare-fun m!825767 () Bool)

(assert (=> start!75120 m!825767))

(check-sat (not b!885576) (not b!885575) (not start!75120) (not b!885577) tp_is_empty!17769)
(check-sat)
