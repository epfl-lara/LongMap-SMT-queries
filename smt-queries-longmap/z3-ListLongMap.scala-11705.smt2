; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136840 () Bool)

(assert start!136840)

(declare-fun b!1578666 () Bool)

(declare-fun res!1078740 () Bool)

(declare-fun e!880586 () Bool)

(assert (=> b!1578666 (=> (not res!1078740) (not e!880586))))

(declare-datatypes ((B!2570 0))(
  ( (B!2571 (val!19647 Int)) )
))
(declare-datatypes ((tuple2!25464 0))(
  ( (tuple2!25465 (_1!12743 (_ BitVec 64)) (_2!12743 B!2570)) )
))
(declare-datatypes ((List!36808 0))(
  ( (Nil!36805) (Cons!36804 (h!38348 tuple2!25464) (t!51714 List!36808)) )
))
(declare-datatypes ((ListLongMap!22803 0))(
  ( (ListLongMap!22804 (toList!11417 List!36808)) )
))
(declare-fun lm!251 () ListLongMap!22803)

(declare-fun a0!51 () (_ BitVec 64))

(declare-fun containsKey!875 (List!36808 (_ BitVec 64)) Bool)

(assert (=> b!1578666 (= res!1078740 (not (containsKey!875 (toList!11417 lm!251) a0!51)))))

(declare-fun b!1578667 () Bool)

(declare-fun res!1078737 () Bool)

(assert (=> b!1578667 (=> (not res!1078737) (not e!880586))))

(declare-fun a!525 () (_ BitVec 64))

(assert (=> b!1578667 (= res!1078737 (not (= a!525 a0!51)))))

(declare-fun res!1078736 () Bool)

(assert (=> start!136840 (=> (not res!1078736) (not e!880586))))

(declare-fun contains!10394 (ListLongMap!22803 (_ BitVec 64)) Bool)

(assert (=> start!136840 (= res!1078736 (not (contains!10394 lm!251 a0!51)))))

(assert (=> start!136840 e!880586))

(declare-fun e!880585 () Bool)

(declare-fun inv!58928 (ListLongMap!22803) Bool)

(assert (=> start!136840 (and (inv!58928 lm!251) e!880585)))

(assert (=> start!136840 true))

(declare-fun tp_is_empty!39115 () Bool)

(assert (=> start!136840 tp_is_empty!39115))

(declare-fun b!98 () B!2570)

(declare-fun b!1578668 () Bool)

(declare-fun +!5117 (ListLongMap!22803 tuple2!25464) ListLongMap!22803)

(assert (=> b!1578668 (= e!880586 (not (not (contains!10394 (+!5117 lm!251 (tuple2!25465 a!525 b!98)) a0!51))))))

(declare-fun insertStrictlySorted!603 (List!36808 (_ BitVec 64) B!2570) List!36808)

(assert (=> b!1578668 (not (containsKey!875 (insertStrictlySorted!603 (toList!11417 lm!251) a!525 b!98) a0!51))))

(declare-datatypes ((Unit!52016 0))(
  ( (Unit!52017) )
))
(declare-fun lt!676086 () Unit!52016)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!1 (List!36808 (_ BitVec 64) B!2570 (_ BitVec 64)) Unit!52016)

(assert (=> b!1578668 (= lt!676086 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!1 (toList!11417 lm!251) a!525 b!98 a0!51))))

(declare-fun b!1578669 () Bool)

(declare-fun tp!114280 () Bool)

(assert (=> b!1578669 (= e!880585 tp!114280)))

(declare-fun b!1578670 () Bool)

(declare-fun res!1078739 () Bool)

(assert (=> b!1578670 (=> (not res!1078739) (not e!880586))))

(assert (=> b!1578670 (= res!1078739 (not (= a0!51 a!525)))))

(declare-fun b!1578671 () Bool)

(declare-fun res!1078738 () Bool)

(assert (=> b!1578671 (=> (not res!1078738) (not e!880586))))

(declare-fun isStrictlySorted!1026 (List!36808) Bool)

(assert (=> b!1578671 (= res!1078738 (isStrictlySorted!1026 (toList!11417 lm!251)))))

(assert (= (and start!136840 res!1078736) b!1578667))

(assert (= (and b!1578667 res!1078737) b!1578671))

(assert (= (and b!1578671 res!1078738) b!1578666))

(assert (= (and b!1578666 res!1078740) b!1578670))

(assert (= (and b!1578670 res!1078739) b!1578668))

(assert (= start!136840 b!1578669))

(declare-fun m!1450059 () Bool)

(assert (=> b!1578666 m!1450059))

(declare-fun m!1450061 () Bool)

(assert (=> start!136840 m!1450061))

(declare-fun m!1450063 () Bool)

(assert (=> start!136840 m!1450063))

(declare-fun m!1450065 () Bool)

(assert (=> b!1578668 m!1450065))

(declare-fun m!1450067 () Bool)

(assert (=> b!1578668 m!1450067))

(declare-fun m!1450069 () Bool)

(assert (=> b!1578668 m!1450069))

(assert (=> b!1578668 m!1450065))

(declare-fun m!1450071 () Bool)

(assert (=> b!1578668 m!1450071))

(declare-fun m!1450073 () Bool)

(assert (=> b!1578668 m!1450073))

(assert (=> b!1578668 m!1450067))

(declare-fun m!1450075 () Bool)

(assert (=> b!1578671 m!1450075))

(check-sat tp_is_empty!39115 (not b!1578666) (not b!1578671) (not start!136840) (not b!1578668) (not b!1578669))
(check-sat)
(get-model)

(declare-fun b!1578776 () Bool)

(declare-fun e!880644 () List!36808)

(declare-fun call!72353 () List!36808)

(assert (=> b!1578776 (= e!880644 call!72353)))

(declare-fun c!146259 () Bool)

(declare-fun call!72354 () List!36808)

(declare-fun e!880642 () List!36808)

(declare-fun bm!72349 () Bool)

(declare-fun $colon$colon!1008 (List!36808 tuple2!25464) List!36808)

(assert (=> bm!72349 (= call!72354 ($colon$colon!1008 e!880642 (ite c!146259 (h!38348 (toList!11417 lm!251)) (tuple2!25465 a!525 b!98))))))

(declare-fun c!146257 () Bool)

(assert (=> bm!72349 (= c!146257 c!146259)))

(declare-fun b!1578777 () Bool)

(declare-fun res!1078796 () Bool)

(declare-fun e!880640 () Bool)

(assert (=> b!1578777 (=> (not res!1078796) (not e!880640))))

(declare-fun lt!676106 () List!36808)

(assert (=> b!1578777 (= res!1078796 (containsKey!875 lt!676106 a!525))))

(declare-fun bm!72350 () Bool)

(declare-fun call!72352 () List!36808)

(assert (=> bm!72350 (= call!72353 call!72352)))

(declare-fun b!1578778 () Bool)

(assert (=> b!1578778 (= e!880642 (insertStrictlySorted!603 (t!51714 (toList!11417 lm!251)) a!525 b!98))))

(declare-fun b!1578779 () Bool)

(declare-fun e!880641 () List!36808)

(assert (=> b!1578779 (= e!880641 call!72354)))

(declare-fun d!165945 () Bool)

(assert (=> d!165945 e!880640))

(declare-fun res!1078795 () Bool)

(assert (=> d!165945 (=> (not res!1078795) (not e!880640))))

(assert (=> d!165945 (= res!1078795 (isStrictlySorted!1026 lt!676106))))

(assert (=> d!165945 (= lt!676106 e!880641)))

(get-info :version)

(assert (=> d!165945 (= c!146259 (and ((_ is Cons!36804) (toList!11417 lm!251)) (bvslt (_1!12743 (h!38348 (toList!11417 lm!251))) a!525)))))

(assert (=> d!165945 (isStrictlySorted!1026 (toList!11417 lm!251))))

(assert (=> d!165945 (= (insertStrictlySorted!603 (toList!11417 lm!251) a!525 b!98) lt!676106)))

(declare-fun b!1578780 () Bool)

(assert (=> b!1578780 (= e!880644 call!72353)))

(declare-fun bm!72351 () Bool)

(assert (=> bm!72351 (= call!72352 call!72354)))

(declare-fun b!1578781 () Bool)

(declare-fun contains!10397 (List!36808 tuple2!25464) Bool)

(assert (=> b!1578781 (= e!880640 (contains!10397 lt!676106 (tuple2!25465 a!525 b!98)))))

(declare-fun b!1578782 () Bool)

(declare-fun e!880643 () List!36808)

(assert (=> b!1578782 (= e!880641 e!880643)))

(declare-fun c!146258 () Bool)

(assert (=> b!1578782 (= c!146258 (and ((_ is Cons!36804) (toList!11417 lm!251)) (= (_1!12743 (h!38348 (toList!11417 lm!251))) a!525)))))

(declare-fun b!1578783 () Bool)

(assert (=> b!1578783 (= e!880643 call!72352)))

(declare-fun c!146256 () Bool)

(declare-fun b!1578784 () Bool)

(assert (=> b!1578784 (= e!880642 (ite c!146258 (t!51714 (toList!11417 lm!251)) (ite c!146256 (Cons!36804 (h!38348 (toList!11417 lm!251)) (t!51714 (toList!11417 lm!251))) Nil!36805)))))

(declare-fun b!1578785 () Bool)

(assert (=> b!1578785 (= c!146256 (and ((_ is Cons!36804) (toList!11417 lm!251)) (bvsgt (_1!12743 (h!38348 (toList!11417 lm!251))) a!525)))))

(assert (=> b!1578785 (= e!880643 e!880644)))

(assert (= (and d!165945 c!146259) b!1578779))

(assert (= (and d!165945 (not c!146259)) b!1578782))

(assert (= (and b!1578782 c!146258) b!1578783))

(assert (= (and b!1578782 (not c!146258)) b!1578785))

(assert (= (and b!1578785 c!146256) b!1578780))

(assert (= (and b!1578785 (not c!146256)) b!1578776))

(assert (= (or b!1578780 b!1578776) bm!72350))

(assert (= (or b!1578783 bm!72350) bm!72351))

(assert (= (or b!1578779 bm!72351) bm!72349))

(assert (= (and bm!72349 c!146257) b!1578778))

(assert (= (and bm!72349 (not c!146257)) b!1578784))

(assert (= (and d!165945 res!1078795) b!1578777))

(assert (= (and b!1578777 res!1078796) b!1578781))

(declare-fun m!1450127 () Bool)

(assert (=> b!1578781 m!1450127))

(declare-fun m!1450129 () Bool)

(assert (=> bm!72349 m!1450129))

(declare-fun m!1450131 () Bool)

(assert (=> b!1578778 m!1450131))

(declare-fun m!1450133 () Bool)

(assert (=> d!165945 m!1450133))

(assert (=> d!165945 m!1450075))

(declare-fun m!1450137 () Bool)

(assert (=> b!1578777 m!1450137))

(assert (=> b!1578668 d!165945))

(declare-fun d!165955 () Bool)

(declare-fun res!1078808 () Bool)

(declare-fun e!880657 () Bool)

(assert (=> d!165955 (=> res!1078808 e!880657)))

(assert (=> d!165955 (= res!1078808 (and ((_ is Cons!36804) (insertStrictlySorted!603 (toList!11417 lm!251) a!525 b!98)) (= (_1!12743 (h!38348 (insertStrictlySorted!603 (toList!11417 lm!251) a!525 b!98))) a0!51)))))

(assert (=> d!165955 (= (containsKey!875 (insertStrictlySorted!603 (toList!11417 lm!251) a!525 b!98) a0!51) e!880657)))

(declare-fun b!1578799 () Bool)

(declare-fun e!880658 () Bool)

(assert (=> b!1578799 (= e!880657 e!880658)))

(declare-fun res!1078809 () Bool)

(assert (=> b!1578799 (=> (not res!1078809) (not e!880658))))

(assert (=> b!1578799 (= res!1078809 (and (or (not ((_ is Cons!36804) (insertStrictlySorted!603 (toList!11417 lm!251) a!525 b!98))) (bvsle (_1!12743 (h!38348 (insertStrictlySorted!603 (toList!11417 lm!251) a!525 b!98))) a0!51)) ((_ is Cons!36804) (insertStrictlySorted!603 (toList!11417 lm!251) a!525 b!98)) (bvslt (_1!12743 (h!38348 (insertStrictlySorted!603 (toList!11417 lm!251) a!525 b!98))) a0!51)))))

(declare-fun b!1578800 () Bool)

(assert (=> b!1578800 (= e!880658 (containsKey!875 (t!51714 (insertStrictlySorted!603 (toList!11417 lm!251) a!525 b!98)) a0!51))))

(assert (= (and d!165955 (not res!1078808)) b!1578799))

(assert (= (and b!1578799 res!1078809) b!1578800))

(declare-fun m!1450145 () Bool)

(assert (=> b!1578800 m!1450145))

(assert (=> b!1578668 d!165955))

(declare-fun d!165963 () Bool)

(declare-fun e!880674 () Bool)

(assert (=> d!165963 e!880674))

(declare-fun res!1078825 () Bool)

(assert (=> d!165963 (=> (not res!1078825) (not e!880674))))

(declare-fun lt!676134 () ListLongMap!22803)

(assert (=> d!165963 (= res!1078825 (contains!10394 lt!676134 (_1!12743 (tuple2!25465 a!525 b!98))))))

(declare-fun lt!676136 () List!36808)

(assert (=> d!165963 (= lt!676134 (ListLongMap!22804 lt!676136))))

(declare-fun lt!676133 () Unit!52016)

(declare-fun lt!676135 () Unit!52016)

(assert (=> d!165963 (= lt!676133 lt!676135)))

(declare-datatypes ((Option!881 0))(
  ( (Some!880 (v!22363 B!2570)) (None!879) )
))
(declare-fun getValueByKey!806 (List!36808 (_ BitVec 64)) Option!881)

(assert (=> d!165963 (= (getValueByKey!806 lt!676136 (_1!12743 (tuple2!25465 a!525 b!98))) (Some!880 (_2!12743 (tuple2!25465 a!525 b!98))))))

(declare-fun lemmaContainsTupThenGetReturnValue!389 (List!36808 (_ BitVec 64) B!2570) Unit!52016)

(assert (=> d!165963 (= lt!676135 (lemmaContainsTupThenGetReturnValue!389 lt!676136 (_1!12743 (tuple2!25465 a!525 b!98)) (_2!12743 (tuple2!25465 a!525 b!98))))))

(assert (=> d!165963 (= lt!676136 (insertStrictlySorted!603 (toList!11417 lm!251) (_1!12743 (tuple2!25465 a!525 b!98)) (_2!12743 (tuple2!25465 a!525 b!98))))))

(assert (=> d!165963 (= (+!5117 lm!251 (tuple2!25465 a!525 b!98)) lt!676134)))

(declare-fun b!1578831 () Bool)

(declare-fun res!1078824 () Bool)

(assert (=> b!1578831 (=> (not res!1078824) (not e!880674))))

(assert (=> b!1578831 (= res!1078824 (= (getValueByKey!806 (toList!11417 lt!676134) (_1!12743 (tuple2!25465 a!525 b!98))) (Some!880 (_2!12743 (tuple2!25465 a!525 b!98)))))))

(declare-fun b!1578832 () Bool)

(assert (=> b!1578832 (= e!880674 (contains!10397 (toList!11417 lt!676134) (tuple2!25465 a!525 b!98)))))

(assert (= (and d!165963 res!1078825) b!1578831))

(assert (= (and b!1578831 res!1078824) b!1578832))

(declare-fun m!1450159 () Bool)

(assert (=> d!165963 m!1450159))

(declare-fun m!1450161 () Bool)

(assert (=> d!165963 m!1450161))

(declare-fun m!1450163 () Bool)

(assert (=> d!165963 m!1450163))

(declare-fun m!1450165 () Bool)

(assert (=> d!165963 m!1450165))

(declare-fun m!1450167 () Bool)

(assert (=> b!1578831 m!1450167))

(declare-fun m!1450169 () Bool)

(assert (=> b!1578832 m!1450169))

(assert (=> b!1578668 d!165963))

(declare-fun d!165967 () Bool)

(declare-fun e!880692 () Bool)

(assert (=> d!165967 e!880692))

(declare-fun res!1078835 () Bool)

(assert (=> d!165967 (=> res!1078835 e!880692)))

(declare-fun lt!676159 () Bool)

(assert (=> d!165967 (= res!1078835 (not lt!676159))))

(declare-fun lt!676160 () Bool)

(assert (=> d!165967 (= lt!676159 lt!676160)))

(declare-fun lt!676161 () Unit!52016)

(declare-fun e!880693 () Unit!52016)

(assert (=> d!165967 (= lt!676161 e!880693)))

(declare-fun c!146278 () Bool)

(assert (=> d!165967 (= c!146278 lt!676160)))

(assert (=> d!165967 (= lt!676160 (containsKey!875 (toList!11417 (+!5117 lm!251 (tuple2!25465 a!525 b!98))) a0!51))))

(assert (=> d!165967 (= (contains!10394 (+!5117 lm!251 (tuple2!25465 a!525 b!98)) a0!51) lt!676159)))

(declare-fun b!1578860 () Bool)

(declare-fun lt!676158 () Unit!52016)

(assert (=> b!1578860 (= e!880693 lt!676158)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!542 (List!36808 (_ BitVec 64)) Unit!52016)

(assert (=> b!1578860 (= lt!676158 (lemmaContainsKeyImpliesGetValueByKeyDefined!542 (toList!11417 (+!5117 lm!251 (tuple2!25465 a!525 b!98))) a0!51))))

(declare-fun isDefined!594 (Option!881) Bool)

(assert (=> b!1578860 (isDefined!594 (getValueByKey!806 (toList!11417 (+!5117 lm!251 (tuple2!25465 a!525 b!98))) a0!51))))

(declare-fun b!1578861 () Bool)

(declare-fun Unit!52023 () Unit!52016)

(assert (=> b!1578861 (= e!880693 Unit!52023)))

(declare-fun b!1578862 () Bool)

(assert (=> b!1578862 (= e!880692 (isDefined!594 (getValueByKey!806 (toList!11417 (+!5117 lm!251 (tuple2!25465 a!525 b!98))) a0!51)))))

(assert (= (and d!165967 c!146278) b!1578860))

(assert (= (and d!165967 (not c!146278)) b!1578861))

(assert (= (and d!165967 (not res!1078835)) b!1578862))

(declare-fun m!1450191 () Bool)

(assert (=> d!165967 m!1450191))

(declare-fun m!1450193 () Bool)

(assert (=> b!1578860 m!1450193))

(declare-fun m!1450195 () Bool)

(assert (=> b!1578860 m!1450195))

(assert (=> b!1578860 m!1450195))

(declare-fun m!1450197 () Bool)

(assert (=> b!1578860 m!1450197))

(assert (=> b!1578862 m!1450195))

(assert (=> b!1578862 m!1450195))

(assert (=> b!1578862 m!1450197))

(assert (=> b!1578668 d!165967))

(declare-fun d!165975 () Bool)

(assert (=> d!165975 (not (containsKey!875 (insertStrictlySorted!603 (toList!11417 lm!251) a!525 b!98) a0!51))))

(declare-fun lt!676179 () Unit!52016)

(declare-fun choose!2096 (List!36808 (_ BitVec 64) B!2570 (_ BitVec 64)) Unit!52016)

(assert (=> d!165975 (= lt!676179 (choose!2096 (toList!11417 lm!251) a!525 b!98 a0!51))))

(declare-fun e!880702 () Bool)

(assert (=> d!165975 e!880702))

(declare-fun res!1078852 () Bool)

(assert (=> d!165975 (=> (not res!1078852) (not e!880702))))

(assert (=> d!165975 (= res!1078852 (isStrictlySorted!1026 (toList!11417 lm!251)))))

(assert (=> d!165975 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!1 (toList!11417 lm!251) a!525 b!98 a0!51) lt!676179)))

(declare-fun b!1578879 () Bool)

(declare-fun res!1078853 () Bool)

(assert (=> b!1578879 (=> (not res!1078853) (not e!880702))))

(assert (=> b!1578879 (= res!1078853 (not (containsKey!875 (toList!11417 lm!251) a0!51)))))

(declare-fun b!1578880 () Bool)

(assert (=> b!1578880 (= e!880702 (not (= a0!51 a!525)))))

(assert (= (and d!165975 res!1078852) b!1578879))

(assert (= (and b!1578879 res!1078853) b!1578880))

(assert (=> d!165975 m!1450067))

(assert (=> d!165975 m!1450067))

(assert (=> d!165975 m!1450069))

(declare-fun m!1450209 () Bool)

(assert (=> d!165975 m!1450209))

(assert (=> d!165975 m!1450075))

(assert (=> b!1578879 m!1450059))

(assert (=> b!1578668 d!165975))

(declare-fun d!165979 () Bool)

(declare-fun res!1078865 () Bool)

(declare-fun e!880715 () Bool)

(assert (=> d!165979 (=> res!1078865 e!880715)))

(assert (=> d!165979 (= res!1078865 (or ((_ is Nil!36805) (toList!11417 lm!251)) ((_ is Nil!36805) (t!51714 (toList!11417 lm!251)))))))

(assert (=> d!165979 (= (isStrictlySorted!1026 (toList!11417 lm!251)) e!880715)))

(declare-fun b!1578894 () Bool)

(declare-fun e!880716 () Bool)

(assert (=> b!1578894 (= e!880715 e!880716)))

(declare-fun res!1078866 () Bool)

(assert (=> b!1578894 (=> (not res!1078866) (not e!880716))))

(assert (=> b!1578894 (= res!1078866 (bvslt (_1!12743 (h!38348 (toList!11417 lm!251))) (_1!12743 (h!38348 (t!51714 (toList!11417 lm!251))))))))

(declare-fun b!1578895 () Bool)

(assert (=> b!1578895 (= e!880716 (isStrictlySorted!1026 (t!51714 (toList!11417 lm!251))))))

(assert (= (and d!165979 (not res!1078865)) b!1578894))

(assert (= (and b!1578894 res!1078866) b!1578895))

(declare-fun m!1450225 () Bool)

(assert (=> b!1578895 m!1450225))

(assert (=> b!1578671 d!165979))

(declare-fun d!165987 () Bool)

(declare-fun res!1078869 () Bool)

(declare-fun e!880719 () Bool)

(assert (=> d!165987 (=> res!1078869 e!880719)))

(assert (=> d!165987 (= res!1078869 (and ((_ is Cons!36804) (toList!11417 lm!251)) (= (_1!12743 (h!38348 (toList!11417 lm!251))) a0!51)))))

(assert (=> d!165987 (= (containsKey!875 (toList!11417 lm!251) a0!51) e!880719)))

(declare-fun b!1578898 () Bool)

(declare-fun e!880720 () Bool)

(assert (=> b!1578898 (= e!880719 e!880720)))

(declare-fun res!1078870 () Bool)

(assert (=> b!1578898 (=> (not res!1078870) (not e!880720))))

(assert (=> b!1578898 (= res!1078870 (and (or (not ((_ is Cons!36804) (toList!11417 lm!251))) (bvsle (_1!12743 (h!38348 (toList!11417 lm!251))) a0!51)) ((_ is Cons!36804) (toList!11417 lm!251)) (bvslt (_1!12743 (h!38348 (toList!11417 lm!251))) a0!51)))))

(declare-fun b!1578899 () Bool)

(assert (=> b!1578899 (= e!880720 (containsKey!875 (t!51714 (toList!11417 lm!251)) a0!51))))

(assert (= (and d!165987 (not res!1078869)) b!1578898))

(assert (= (and b!1578898 res!1078870) b!1578899))

(declare-fun m!1450229 () Bool)

(assert (=> b!1578899 m!1450229))

(assert (=> b!1578666 d!165987))

(declare-fun d!165991 () Bool)

(declare-fun e!880723 () Bool)

(assert (=> d!165991 e!880723))

(declare-fun res!1078872 () Bool)

(assert (=> d!165991 (=> res!1078872 e!880723)))

(declare-fun lt!676189 () Bool)

(assert (=> d!165991 (= res!1078872 (not lt!676189))))

(declare-fun lt!676190 () Bool)

(assert (=> d!165991 (= lt!676189 lt!676190)))

(declare-fun lt!676191 () Unit!52016)

(declare-fun e!880724 () Unit!52016)

(assert (=> d!165991 (= lt!676191 e!880724)))

(declare-fun c!146281 () Bool)

(assert (=> d!165991 (= c!146281 lt!676190)))

(assert (=> d!165991 (= lt!676190 (containsKey!875 (toList!11417 lm!251) a0!51))))

(assert (=> d!165991 (= (contains!10394 lm!251 a0!51) lt!676189)))

(declare-fun b!1578903 () Bool)

(declare-fun lt!676188 () Unit!52016)

(assert (=> b!1578903 (= e!880724 lt!676188)))

(assert (=> b!1578903 (= lt!676188 (lemmaContainsKeyImpliesGetValueByKeyDefined!542 (toList!11417 lm!251) a0!51))))

(assert (=> b!1578903 (isDefined!594 (getValueByKey!806 (toList!11417 lm!251) a0!51))))

(declare-fun b!1578904 () Bool)

(declare-fun Unit!52025 () Unit!52016)

(assert (=> b!1578904 (= e!880724 Unit!52025)))

(declare-fun b!1578905 () Bool)

(assert (=> b!1578905 (= e!880723 (isDefined!594 (getValueByKey!806 (toList!11417 lm!251) a0!51)))))

(assert (= (and d!165991 c!146281) b!1578903))

(assert (= (and d!165991 (not c!146281)) b!1578904))

(assert (= (and d!165991 (not res!1078872)) b!1578905))

(assert (=> d!165991 m!1450059))

(declare-fun m!1450237 () Bool)

(assert (=> b!1578903 m!1450237))

(declare-fun m!1450239 () Bool)

(assert (=> b!1578903 m!1450239))

(assert (=> b!1578903 m!1450239))

(declare-fun m!1450241 () Bool)

(assert (=> b!1578903 m!1450241))

(assert (=> b!1578905 m!1450239))

(assert (=> b!1578905 m!1450239))

(assert (=> b!1578905 m!1450241))

(assert (=> start!136840 d!165991))

(declare-fun d!165995 () Bool)

(assert (=> d!165995 (= (inv!58928 lm!251) (isStrictlySorted!1026 (toList!11417 lm!251)))))

(declare-fun bs!45683 () Bool)

(assert (= bs!45683 d!165995))

(assert (=> bs!45683 m!1450075))

(assert (=> start!136840 d!165995))

(declare-fun b!1578919 () Bool)

(declare-fun e!880732 () Bool)

(declare-fun tp!114292 () Bool)

(assert (=> b!1578919 (= e!880732 (and tp_is_empty!39115 tp!114292))))

(assert (=> b!1578669 (= tp!114280 e!880732)))

(assert (= (and b!1578669 ((_ is Cons!36804) (toList!11417 lm!251))) b!1578919))

(check-sat (not b!1578832) (not bm!72349) (not b!1578778) (not b!1578905) (not b!1578800) (not b!1578895) (not b!1578899) (not b!1578831) (not d!165975) (not b!1578862) (not d!165991) (not d!165995) (not d!165963) tp_is_empty!39115 (not d!165967) (not d!165945) (not b!1578781) (not b!1578777) (not b!1578879) (not b!1578860) (not b!1578919) (not b!1578903))
(check-sat)
