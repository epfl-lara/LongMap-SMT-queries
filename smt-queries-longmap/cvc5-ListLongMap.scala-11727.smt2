; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137466 () Bool)

(assert start!137466)

(declare-fun b!1581685 () Bool)

(declare-fun res!1080592 () Bool)

(declare-fun e!882581 () Bool)

(assert (=> b!1581685 (=> (not res!1080592) (not e!882581))))

(declare-datatypes ((B!2702 0))(
  ( (B!2703 (val!19713 Int)) )
))
(declare-datatypes ((tuple2!25588 0))(
  ( (tuple2!25589 (_1!12805 (_ BitVec 64)) (_2!12805 B!2702)) )
))
(declare-datatypes ((List!36833 0))(
  ( (Nil!36830) (Cons!36829 (h!38372 tuple2!25588) (t!51747 List!36833)) )
))
(declare-fun l!1390 () List!36833)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!937 (List!36833 (_ BitVec 64)) Bool)

(assert (=> b!1581685 (= res!1080592 (containsKey!937 l!1390 key!405))))

(declare-fun b!1581686 () Bool)

(declare-fun e!882583 () Bool)

(assert (=> b!1581686 (= e!882581 e!882583)))

(declare-fun res!1080596 () Bool)

(assert (=> b!1581686 (=> (not res!1080596) (not e!882583))))

(declare-fun e!882582 () Bool)

(assert (=> b!1581686 (= res!1080596 e!882582)))

(declare-fun res!1080595 () Bool)

(assert (=> b!1581686 (=> res!1080595 e!882582)))

(declare-datatypes ((tuple2!25590 0))(
  ( (tuple2!25591 (_1!12806 tuple2!25588) (_2!12806 List!36833)) )
))
(declare-datatypes ((Option!929 0))(
  ( (Some!928 (v!22447 tuple2!25590)) (None!927) )
))
(declare-fun lt!677001 () Option!929)

(declare-fun isEmpty!1184 (Option!929) Bool)

(assert (=> b!1581686 (= res!1080595 (isEmpty!1184 lt!677001))))

(declare-fun unapply!100 (List!36833) Option!929)

(assert (=> b!1581686 (= lt!677001 (unapply!100 l!1390))))

(declare-fun b!1581687 () Bool)

(declare-fun e!882584 () Bool)

(declare-fun tp_is_empty!39247 () Bool)

(declare-fun tp!114596 () Bool)

(assert (=> b!1581687 (= e!882584 (and tp_is_empty!39247 tp!114596))))

(declare-fun res!1080594 () Bool)

(assert (=> start!137466 (=> (not res!1080594) (not e!882581))))

(declare-fun isStrictlySorted!1091 (List!36833) Bool)

(assert (=> start!137466 (= res!1080594 (isStrictlySorted!1091 l!1390))))

(assert (=> start!137466 e!882581))

(assert (=> start!137466 e!882584))

(assert (=> start!137466 true))

(assert (=> start!137466 tp_is_empty!39247))

(declare-fun b!1581688 () Bool)

(declare-fun res!1080597 () Bool)

(assert (=> b!1581688 (=> (not res!1080597) (not e!882581))))

(declare-fun value!194 () B!2702)

(declare-fun contains!10505 (List!36833 tuple2!25588) Bool)

(assert (=> b!1581688 (= res!1080597 (contains!10505 l!1390 (tuple2!25589 key!405 value!194)))))

(declare-fun b!1581689 () Bool)

(declare-fun res!1080593 () Bool)

(assert (=> b!1581689 (=> (not res!1080593) (not e!882583))))

(assert (=> b!1581689 (= res!1080593 (not (is-Cons!36829 l!1390)))))

(declare-fun b!1581690 () Bool)

(declare-datatypes ((Option!930 0))(
  ( (Some!929 (v!22448 B!2702)) (None!928) )
))
(declare-fun getValueByKey!823 (List!36833 (_ BitVec 64)) Option!930)

(assert (=> b!1581690 (= e!882583 (not (= (getValueByKey!823 l!1390 key!405) (Some!929 value!194))))))

(declare-fun b!1581691 () Bool)

(declare-fun get!26823 (Option!929) tuple2!25590)

(assert (=> b!1581691 (= e!882582 (not (is-Nil!36830 (_2!12806 (get!26823 lt!677001)))))))

(assert (= (and start!137466 res!1080594) b!1581685))

(assert (= (and b!1581685 res!1080592) b!1581688))

(assert (= (and b!1581688 res!1080597) b!1581686))

(assert (= (and b!1581686 (not res!1080595)) b!1581691))

(assert (= (and b!1581686 res!1080596) b!1581689))

(assert (= (and b!1581689 res!1080593) b!1581690))

(assert (= (and start!137466 (is-Cons!36829 l!1390)) b!1581687))

(declare-fun m!1452545 () Bool)

(assert (=> b!1581690 m!1452545))

(declare-fun m!1452547 () Bool)

(assert (=> b!1581691 m!1452547))

(declare-fun m!1452549 () Bool)

(assert (=> b!1581686 m!1452549))

(declare-fun m!1452551 () Bool)

(assert (=> b!1581686 m!1452551))

(declare-fun m!1452553 () Bool)

(assert (=> start!137466 m!1452553))

(declare-fun m!1452555 () Bool)

(assert (=> b!1581685 m!1452555))

(declare-fun m!1452557 () Bool)

(assert (=> b!1581688 m!1452557))

(push 1)

(assert tp_is_empty!39247)

(assert (not b!1581691))

(assert (not b!1581690))

(assert (not b!1581687))

(assert (not start!137466))

(assert (not b!1581688))

(assert (not b!1581686))

(assert (not b!1581685))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166819 () Bool)

(declare-fun lt!677012 () Bool)

(declare-fun content!853 (List!36833) (Set tuple2!25588))

(assert (=> d!166819 (= lt!677012 (set.member (tuple2!25589 key!405 value!194) (content!853 l!1390)))))

(declare-fun e!882630 () Bool)

(assert (=> d!166819 (= lt!677012 e!882630)))

(declare-fun res!1080648 () Bool)

(assert (=> d!166819 (=> (not res!1080648) (not e!882630))))

(assert (=> d!166819 (= res!1080648 (is-Cons!36829 l!1390))))

(assert (=> d!166819 (= (contains!10505 l!1390 (tuple2!25589 key!405 value!194)) lt!677012)))

(declare-fun b!1581760 () Bool)

(declare-fun e!882629 () Bool)

(assert (=> b!1581760 (= e!882630 e!882629)))

(declare-fun res!1080649 () Bool)

(assert (=> b!1581760 (=> res!1080649 e!882629)))

(assert (=> b!1581760 (= res!1080649 (= (h!38372 l!1390) (tuple2!25589 key!405 value!194)))))

(declare-fun b!1581761 () Bool)

(assert (=> b!1581761 (= e!882629 (contains!10505 (t!51747 l!1390) (tuple2!25589 key!405 value!194)))))

(assert (= (and d!166819 res!1080648) b!1581760))

(assert (= (and b!1581760 (not res!1080649)) b!1581761))

(declare-fun m!1452591 () Bool)

(assert (=> d!166819 m!1452591))

(declare-fun m!1452593 () Bool)

(assert (=> d!166819 m!1452593))

(declare-fun m!1452595 () Bool)

(assert (=> b!1581761 m!1452595))

(assert (=> b!1581688 d!166819))

(declare-fun b!1581799 () Bool)

(declare-fun e!882658 () Option!930)

(assert (=> b!1581799 (= e!882658 None!928)))

(declare-fun b!1581798 () Bool)

(assert (=> b!1581798 (= e!882658 (getValueByKey!823 (t!51747 l!1390) key!405))))

(declare-fun b!1581797 () Bool)

(declare-fun e!882657 () Option!930)

(assert (=> b!1581797 (= e!882657 e!882658)))

(declare-fun c!146630 () Bool)

(assert (=> b!1581797 (= c!146630 (and (is-Cons!36829 l!1390) (not (= (_1!12805 (h!38372 l!1390)) key!405))))))

(declare-fun b!1581796 () Bool)

(assert (=> b!1581796 (= e!882657 (Some!929 (_2!12805 (h!38372 l!1390))))))

(declare-fun d!166829 () Bool)

(declare-fun c!146629 () Bool)

(assert (=> d!166829 (= c!146629 (and (is-Cons!36829 l!1390) (= (_1!12805 (h!38372 l!1390)) key!405)))))

(assert (=> d!166829 (= (getValueByKey!823 l!1390 key!405) e!882657)))

(assert (= (and d!166829 c!146629) b!1581796))

(assert (= (and d!166829 (not c!146629)) b!1581797))

(assert (= (and b!1581797 c!146630) b!1581798))

(assert (= (and b!1581797 (not c!146630)) b!1581799))

(declare-fun m!1452607 () Bool)

(assert (=> b!1581798 m!1452607))

(assert (=> b!1581690 d!166829))

(declare-fun d!166837 () Bool)

(declare-fun res!1080678 () Bool)

(declare-fun e!882673 () Bool)

(assert (=> d!166837 (=> res!1080678 e!882673)))

(assert (=> d!166837 (= res!1080678 (or (is-Nil!36830 l!1390) (is-Nil!36830 (t!51747 l!1390))))))

(assert (=> d!166837 (= (isStrictlySorted!1091 l!1390) e!882673)))

(declare-fun b!1581818 () Bool)

(declare-fun e!882674 () Bool)

(assert (=> b!1581818 (= e!882673 e!882674)))

(declare-fun res!1080679 () Bool)

(assert (=> b!1581818 (=> (not res!1080679) (not e!882674))))

(assert (=> b!1581818 (= res!1080679 (bvslt (_1!12805 (h!38372 l!1390)) (_1!12805 (h!38372 (t!51747 l!1390)))))))

(declare-fun b!1581819 () Bool)

(assert (=> b!1581819 (= e!882674 (isStrictlySorted!1091 (t!51747 l!1390)))))

(assert (= (and d!166837 (not res!1080678)) b!1581818))

(assert (= (and b!1581818 res!1080679) b!1581819))

(declare-fun m!1452613 () Bool)

(assert (=> b!1581819 m!1452613))

(assert (=> start!137466 d!166837))

(declare-fun d!166847 () Bool)

(declare-fun res!1080686 () Bool)

(declare-fun e!882685 () Bool)

(assert (=> d!166847 (=> res!1080686 e!882685)))

(assert (=> d!166847 (= res!1080686 (and (is-Cons!36829 l!1390) (= (_1!12805 (h!38372 l!1390)) key!405)))))

(assert (=> d!166847 (= (containsKey!937 l!1390 key!405) e!882685)))

(declare-fun b!1581832 () Bool)

(declare-fun e!882686 () Bool)

(assert (=> b!1581832 (= e!882685 e!882686)))

(declare-fun res!1080687 () Bool)

(assert (=> b!1581832 (=> (not res!1080687) (not e!882686))))

(assert (=> b!1581832 (= res!1080687 (and (or (not (is-Cons!36829 l!1390)) (bvsle (_1!12805 (h!38372 l!1390)) key!405)) (is-Cons!36829 l!1390) (bvslt (_1!12805 (h!38372 l!1390)) key!405)))))

