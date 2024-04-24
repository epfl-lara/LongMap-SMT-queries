; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138394 () Bool)

(assert start!138394)

(declare-fun b!1586215 () Bool)

(declare-fun res!1082739 () Bool)

(declare-fun e!885570 () Bool)

(assert (=> b!1586215 (=> (not res!1082739) (not e!885570))))

(declare-datatypes ((B!2892 0))(
  ( (B!2893 (val!19808 Int)) )
))
(declare-datatypes ((tuple2!25844 0))(
  ( (tuple2!25845 (_1!12933 (_ BitVec 64)) (_2!12933 B!2892)) )
))
(declare-datatypes ((List!36960 0))(
  ( (Nil!36957) (Cons!36956 (h!38517 tuple2!25844) (t!51866 List!36960)) )
))
(declare-fun l!1251 () List!36960)

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!991 (List!36960 (_ BitVec 64)) Bool)

(assert (=> b!1586215 (= res!1082739 (not (containsKey!991 (t!51866 l!1251) otherKey!56)))))

(declare-fun res!1082737 () Bool)

(assert (=> start!138394 (=> (not res!1082737) (not e!885570))))

(declare-fun isStrictlySorted!1144 (List!36960) Bool)

(assert (=> start!138394 (= res!1082737 (isStrictlySorted!1144 l!1251))))

(assert (=> start!138394 e!885570))

(declare-fun e!885571 () Bool)

(assert (=> start!138394 e!885571))

(assert (=> start!138394 true))

(declare-fun tp_is_empty!39425 () Bool)

(assert (=> start!138394 tp_is_empty!39425))

(declare-fun b!1586216 () Bool)

(declare-fun res!1082740 () Bool)

(assert (=> b!1586216 (=> (not res!1082740) (not e!885570))))

(assert (=> b!1586216 (= res!1082740 (isStrictlySorted!1144 (t!51866 l!1251)))))

(declare-fun b!1586217 () Bool)

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun newValue!123 () B!2892)

(declare-fun insertStrictlySorted!623 (List!36960 (_ BitVec 64) B!2892) List!36960)

(assert (=> b!1586217 (= e!885570 (not (isStrictlySorted!1144 (insertStrictlySorted!623 l!1251 newKey!123 newValue!123))))))

(assert (=> b!1586217 (not (containsKey!991 (insertStrictlySorted!623 (t!51866 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52202 0))(
  ( (Unit!52203) )
))
(declare-fun lt!678114 () Unit!52202)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!9 (List!36960 (_ BitVec 64) B!2892 (_ BitVec 64)) Unit!52202)

(assert (=> b!1586217 (= lt!678114 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!9 (t!51866 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun b!1586218 () Bool)

(declare-fun res!1082736 () Bool)

(assert (=> b!1586218 (=> (not res!1082736) (not e!885570))))

(assert (=> b!1586218 (= res!1082736 (and (not (= otherKey!56 newKey!123)) (is-Cons!36956 l!1251)))))

(declare-fun b!1586219 () Bool)

(declare-fun tp!115028 () Bool)

(assert (=> b!1586219 (= e!885571 (and tp_is_empty!39425 tp!115028))))

(declare-fun b!1586220 () Bool)

(declare-fun res!1082738 () Bool)

(assert (=> b!1586220 (=> (not res!1082738) (not e!885570))))

(assert (=> b!1586220 (= res!1082738 (not (containsKey!991 l!1251 otherKey!56)))))

(assert (= (and start!138394 res!1082737) b!1586220))

(assert (= (and b!1586220 res!1082738) b!1586218))

(assert (= (and b!1586218 res!1082736) b!1586216))

(assert (= (and b!1586216 res!1082740) b!1586215))

(assert (= (and b!1586215 res!1082739) b!1586217))

(assert (= (and start!138394 (is-Cons!36956 l!1251)) b!1586219))

(declare-fun m!1455765 () Bool)

(assert (=> b!1586220 m!1455765))

(declare-fun m!1455767 () Bool)

(assert (=> b!1586217 m!1455767))

(declare-fun m!1455769 () Bool)

(assert (=> b!1586217 m!1455769))

(declare-fun m!1455771 () Bool)

(assert (=> b!1586217 m!1455771))

(declare-fun m!1455773 () Bool)

(assert (=> b!1586217 m!1455773))

(assert (=> b!1586217 m!1455773))

(declare-fun m!1455775 () Bool)

(assert (=> b!1586217 m!1455775))

(assert (=> b!1586217 m!1455769))

(declare-fun m!1455777 () Bool)

(assert (=> b!1586216 m!1455777))

(declare-fun m!1455779 () Bool)

(assert (=> start!138394 m!1455779))

(declare-fun m!1455781 () Bool)

(assert (=> b!1586215 m!1455781))

(push 1)

(assert (not b!1586215))

(assert (not b!1586217))

(assert (not b!1586219))

(assert (not start!138394))

(assert (not b!1586220))

(assert (not b!1586216))

(assert tp_is_empty!39425)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!168001 () Bool)

(declare-fun res!1082745 () Bool)

(declare-fun e!885576 () Bool)

(assert (=> d!168001 (=> res!1082745 e!885576)))

(assert (=> d!168001 (= res!1082745 (and (is-Cons!36956 (t!51866 l!1251)) (= (_1!12933 (h!38517 (t!51866 l!1251))) otherKey!56)))))

(assert (=> d!168001 (= (containsKey!991 (t!51866 l!1251) otherKey!56) e!885576)))

(declare-fun b!1586225 () Bool)

(declare-fun e!885577 () Bool)

(assert (=> b!1586225 (= e!885576 e!885577)))

(declare-fun res!1082746 () Bool)

(assert (=> b!1586225 (=> (not res!1082746) (not e!885577))))

(assert (=> b!1586225 (= res!1082746 (and (or (not (is-Cons!36956 (t!51866 l!1251))) (bvsle (_1!12933 (h!38517 (t!51866 l!1251))) otherKey!56)) (is-Cons!36956 (t!51866 l!1251)) (bvslt (_1!12933 (h!38517 (t!51866 l!1251))) otherKey!56)))))

(declare-fun b!1586226 () Bool)

(assert (=> b!1586226 (= e!885577 (containsKey!991 (t!51866 (t!51866 l!1251)) otherKey!56))))

(assert (= (and d!168001 (not res!1082745)) b!1586225))

(assert (= (and b!1586225 res!1082746) b!1586226))

(declare-fun m!1455783 () Bool)

(assert (=> b!1586226 m!1455783))

(assert (=> b!1586215 d!168001))

(declare-fun d!168007 () Bool)

(declare-fun res!1082747 () Bool)

(declare-fun e!885578 () Bool)

(assert (=> d!168007 (=> res!1082747 e!885578)))

(assert (=> d!168007 (= res!1082747 (and (is-Cons!36956 l!1251) (= (_1!12933 (h!38517 l!1251)) otherKey!56)))))

(assert (=> d!168007 (= (containsKey!991 l!1251 otherKey!56) e!885578)))

(declare-fun b!1586227 () Bool)

(declare-fun e!885579 () Bool)

(assert (=> b!1586227 (= e!885578 e!885579)))

(declare-fun res!1082748 () Bool)

(assert (=> b!1586227 (=> (not res!1082748) (not e!885579))))

(assert (=> b!1586227 (= res!1082748 (and (or (not (is-Cons!36956 l!1251)) (bvsle (_1!12933 (h!38517 l!1251)) otherKey!56)) (is-Cons!36956 l!1251) (bvslt (_1!12933 (h!38517 l!1251)) otherKey!56)))))

(declare-fun b!1586228 () Bool)

(assert (=> b!1586228 (= e!885579 (containsKey!991 (t!51866 l!1251) otherKey!56))))

(assert (= (and d!168007 (not res!1082747)) b!1586227))

(assert (= (and b!1586227 res!1082748) b!1586228))

(assert (=> b!1586228 m!1455781))

(assert (=> b!1586220 d!168007))

(declare-fun d!168009 () Bool)

(declare-fun res!1082759 () Bool)

(declare-fun e!885590 () Bool)

(assert (=> d!168009 (=> res!1082759 e!885590)))

(assert (=> d!168009 (= res!1082759 (or (is-Nil!36957 l!1251) (is-Nil!36957 (t!51866 l!1251))))))

(assert (=> d!168009 (= (isStrictlySorted!1144 l!1251) e!885590)))

(declare-fun b!1586239 () Bool)

(declare-fun e!885591 () Bool)

(assert (=> b!1586239 (= e!885590 e!885591)))

(declare-fun res!1082760 () Bool)

(assert (=> b!1586239 (=> (not res!1082760) (not e!885591))))

(assert (=> b!1586239 (= res!1082760 (bvslt (_1!12933 (h!38517 l!1251)) (_1!12933 (h!38517 (t!51866 l!1251)))))))

(declare-fun b!1586240 () Bool)

(assert (=> b!1586240 (= e!885591 (isStrictlySorted!1144 (t!51866 l!1251)))))

(assert (= (and d!168009 (not res!1082759)) b!1586239))

(assert (= (and b!1586239 res!1082760) b!1586240))

(assert (=> b!1586240 m!1455777))

(assert (=> start!138394 d!168009))

(declare-fun d!168013 () Bool)

(declare-fun res!1082761 () Bool)

(declare-fun e!885592 () Bool)

(assert (=> d!168013 (=> res!1082761 e!885592)))

(assert (=> d!168013 (= res!1082761 (or (is-Nil!36957 (t!51866 l!1251)) (is-Nil!36957 (t!51866 (t!51866 l!1251)))))))

(assert (=> d!168013 (= (isStrictlySorted!1144 (t!51866 l!1251)) e!885592)))

(declare-fun b!1586241 () Bool)

(declare-fun e!885593 () Bool)

(assert (=> b!1586241 (= e!885592 e!885593)))

(declare-fun res!1082762 () Bool)

(assert (=> b!1586241 (=> (not res!1082762) (not e!885593))))

(assert (=> b!1586241 (= res!1082762 (bvslt (_1!12933 (h!38517 (t!51866 l!1251))) (_1!12933 (h!38517 (t!51866 (t!51866 l!1251))))))))

(declare-fun b!1586242 () Bool)

(assert (=> b!1586242 (= e!885593 (isStrictlySorted!1144 (t!51866 (t!51866 l!1251))))))

(assert (= (and d!168013 (not res!1082761)) b!1586241))

(assert (= (and b!1586241 res!1082762) b!1586242))

(declare-fun m!1455787 () Bool)

(assert (=> b!1586242 m!1455787))

(assert (=> b!1586216 d!168013))

(declare-fun c!147588 () Bool)

(declare-fun b!1586339 () Bool)

(declare-fun c!147590 () Bool)

(declare-fun e!885653 () List!36960)

(assert (=> b!1586339 (= e!885653 (ite c!147590 (t!51866 l!1251) (ite c!147588 (Cons!36956 (h!38517 l!1251) (t!51866 l!1251)) Nil!36957)))))

(declare-fun b!1586341 () Bool)

(assert (=> b!1586341 (= e!885653 (insertStrictlySorted!623 (t!51866 l!1251) newKey!123 newValue!123))))

(declare-fun b!1586342 () Bool)

(declare-fun e!885652 () List!36960)

(declare-fun call!72655 () List!36960)

(assert (=> b!1586342 (= e!885652 call!72655)))

(declare-fun b!1586343 () Bool)

(declare-fun res!1082796 () Bool)

(declare-fun e!885650 () Bool)

(assert (=> b!1586343 (=> (not res!1082796) (not e!885650))))

(declare-fun lt!678123 () List!36960)

(assert (=> b!1586343 (= res!1082796 (containsKey!991 lt!678123 newKey!123))))

(declare-fun b!1586344 () Bool)

(declare-fun e!885651 () List!36960)

(declare-fun e!885654 () List!36960)

(assert (=> b!1586344 (= e!885651 e!885654)))

(assert (=> b!1586344 (= c!147590 (and (is-Cons!36956 l!1251) (= (_1!12933 (h!38517 l!1251)) newKey!123)))))

(declare-fun b!1586345 () Bool)

(declare-fun call!72654 () List!36960)

(assert (=> b!1586345 (= e!885651 call!72654)))

(declare-fun b!1586346 () Bool)

(declare-fun contains!10566 (List!36960 tuple2!25844) Bool)

(assert (=> b!1586346 (= e!885650 (contains!10566 lt!678123 (tuple2!25845 newKey!123 newValue!123)))))

(declare-fun b!1586347 () Bool)

(declare-fun call!72656 () List!36960)

(assert (=> b!1586347 (= e!885654 call!72656)))

(declare-fun bm!72651 () Bool)

(assert (=> bm!72651 (= call!72656 call!72654)))

(declare-fun b!1586348 () Bool)

(assert (=> b!1586348 (= c!147588 (and (is-Cons!36956 l!1251) (bvsgt (_1!12933 (h!38517 l!1251)) newKey!123)))))

(assert (=> b!1586348 (= e!885654 e!885652)))

(declare-fun bm!72652 () Bool)

(assert (=> bm!72652 (= call!72655 call!72656)))

(declare-fun bm!72653 () Bool)

(declare-fun c!147589 () Bool)

(declare-fun $colon$colon!1011 (List!36960 tuple2!25844) List!36960)

(assert (=> bm!72653 (= call!72654 ($colon$colon!1011 e!885653 (ite c!147589 (h!38517 l!1251) (tuple2!25845 newKey!123 newValue!123))))))

(declare-fun c!147591 () Bool)

(assert (=> bm!72653 (= c!147591 c!147589)))

(declare-fun b!1586340 () Bool)

(assert (=> b!1586340 (= e!885652 call!72655)))

(declare-fun d!168015 () Bool)

(assert (=> d!168015 e!885650))

(declare-fun res!1082795 () Bool)

(assert (=> d!168015 (=> (not res!1082795) (not e!885650))))

(assert (=> d!168015 (= res!1082795 (isStrictlySorted!1144 lt!678123))))

(assert (=> d!168015 (= lt!678123 e!885651)))

(assert (=> d!168015 (= c!147589 (and (is-Cons!36956 l!1251) (bvslt (_1!12933 (h!38517 l!1251)) newKey!123)))))

(assert (=> d!168015 (isStrictlySorted!1144 l!1251)))

(assert (=> d!168015 (= (insertStrictlySorted!623 l!1251 newKey!123 newValue!123) lt!678123)))

(assert (= (and d!168015 c!147589) b!1586345))

(assert (= (and d!168015 (not c!147589)) b!1586344))

(assert (= (and b!1586344 c!147590) b!1586347))

(assert (= (and b!1586344 (not c!147590)) b!1586348))

(assert (= (and b!1586348 c!147588) b!1586340))

(assert (= (and b!1586348 (not c!147588)) b!1586342))

(assert (= (or b!1586340 b!1586342) bm!72652))

(assert (= (or b!1586347 bm!72652) bm!72651))

(assert (= (or b!1586345 bm!72651) bm!72653))

(assert (= (and bm!72653 c!147591) b!1586341))

(assert (= (and bm!72653 (not c!147591)) b!1586339))

(assert (= (and d!168015 res!1082795) b!1586343))

(assert (= (and b!1586343 res!1082796) b!1586346))

(declare-fun m!1455811 () Bool)

(assert (=> d!168015 m!1455811))

(assert (=> d!168015 m!1455779))

(declare-fun m!1455813 () Bool)

(assert (=> b!1586343 m!1455813))

(assert (=> b!1586341 m!1455773))

(declare-fun m!1455815 () Bool)

(assert (=> b!1586346 m!1455815))

(declare-fun m!1455817 () Bool)

(assert (=> bm!72653 m!1455817))

(assert (=> b!1586217 d!168015))

(declare-fun d!168029 () Bool)

(declare-fun res!1082797 () Bool)

(declare-fun e!885655 () Bool)

(assert (=> d!168029 (=> res!1082797 e!885655)))

(assert (=> d!168029 (= res!1082797 (or (is-Nil!36957 (insertStrictlySorted!623 l!1251 newKey!123 newValue!123)) (is-Nil!36957 (t!51866 (insertStrictlySorted!623 l!1251 newKey!123 newValue!123)))))))

(assert (=> d!168029 (= (isStrictlySorted!1144 (insertStrictlySorted!623 l!1251 newKey!123 newValue!123)) e!885655)))

(declare-fun b!1586349 () Bool)

(declare-fun e!885656 () Bool)

(assert (=> b!1586349 (= e!885655 e!885656)))

(declare-fun res!1082798 () Bool)

(assert (=> b!1586349 (=> (not res!1082798) (not e!885656))))

(assert (=> b!1586349 (= res!1082798 (bvslt (_1!12933 (h!38517 (insertStrictlySorted!623 l!1251 newKey!123 newValue!123))) (_1!12933 (h!38517 (t!51866 (insertStrictlySorted!623 l!1251 newKey!123 newValue!123))))))))

(declare-fun b!1586350 () Bool)

(assert (=> b!1586350 (= e!885656 (isStrictlySorted!1144 (t!51866 (insertStrictlySorted!623 l!1251 newKey!123 newValue!123))))))

(assert (= (and d!168029 (not res!1082797)) b!1586349))

(assert (= (and b!1586349 res!1082798) b!1586350))

(declare-fun m!1455819 () Bool)

(assert (=> b!1586350 m!1455819))

(assert (=> b!1586217 d!168029))

(declare-fun c!147592 () Bool)

(declare-fun c!147594 () Bool)

(declare-fun b!1586351 () Bool)

(declare-fun e!885660 () List!36960)

(assert (=> b!1586351 (= e!885660 (ite c!147594 (t!51866 (t!51866 l!1251)) (ite c!147592 (Cons!36956 (h!38517 (t!51866 l!1251)) (t!51866 (t!51866 l!1251))) Nil!36957)))))

(declare-fun b!1586353 () Bool)

(assert (=> b!1586353 (= e!885660 (insertStrictlySorted!623 (t!51866 (t!51866 l!1251)) newKey!123 newValue!123))))

(declare-fun b!1586354 () Bool)

(declare-fun e!885659 () List!36960)

(declare-fun call!72658 () List!36960)

(assert (=> b!1586354 (= e!885659 call!72658)))

(declare-fun b!1586355 () Bool)

(declare-fun res!1082800 () Bool)

(declare-fun e!885657 () Bool)

(assert (=> b!1586355 (=> (not res!1082800) (not e!885657))))

(declare-fun lt!678124 () List!36960)

(assert (=> b!1586355 (= res!1082800 (containsKey!991 lt!678124 newKey!123))))

(declare-fun b!1586356 () Bool)

(declare-fun e!885658 () List!36960)

(declare-fun e!885661 () List!36960)

(assert (=> b!1586356 (= e!885658 e!885661)))

(assert (=> b!1586356 (= c!147594 (and (is-Cons!36956 (t!51866 l!1251)) (= (_1!12933 (h!38517 (t!51866 l!1251))) newKey!123)))))

(declare-fun b!1586357 () Bool)

(declare-fun call!72657 () List!36960)

(assert (=> b!1586357 (= e!885658 call!72657)))

(declare-fun b!1586358 () Bool)

(assert (=> b!1586358 (= e!885657 (contains!10566 lt!678124 (tuple2!25845 newKey!123 newValue!123)))))

(declare-fun b!1586359 () Bool)

(declare-fun call!72659 () List!36960)

(assert (=> b!1586359 (= e!885661 call!72659)))

(declare-fun bm!72654 () Bool)

(assert (=> bm!72654 (= call!72659 call!72657)))

(declare-fun b!1586360 () Bool)

(assert (=> b!1586360 (= c!147592 (and (is-Cons!36956 (t!51866 l!1251)) (bvsgt (_1!12933 (h!38517 (t!51866 l!1251))) newKey!123)))))

(assert (=> b!1586360 (= e!885661 e!885659)))

(declare-fun bm!72655 () Bool)

(assert (=> bm!72655 (= call!72658 call!72659)))

(declare-fun c!147593 () Bool)

(declare-fun bm!72656 () Bool)

(assert (=> bm!72656 (= call!72657 ($colon$colon!1011 e!885660 (ite c!147593 (h!38517 (t!51866 l!1251)) (tuple2!25845 newKey!123 newValue!123))))))

(declare-fun c!147595 () Bool)

(assert (=> bm!72656 (= c!147595 c!147593)))

(declare-fun b!1586352 () Bool)

(assert (=> b!1586352 (= e!885659 call!72658)))

(declare-fun d!168031 () Bool)

(assert (=> d!168031 e!885657))

(declare-fun res!1082799 () Bool)

(assert (=> d!168031 (=> (not res!1082799) (not e!885657))))

(assert (=> d!168031 (= res!1082799 (isStrictlySorted!1144 lt!678124))))

(assert (=> d!168031 (= lt!678124 e!885658)))

(assert (=> d!168031 (= c!147593 (and (is-Cons!36956 (t!51866 l!1251)) (bvslt (_1!12933 (h!38517 (t!51866 l!1251))) newKey!123)))))

(assert (=> d!168031 (isStrictlySorted!1144 (t!51866 l!1251))))

(assert (=> d!168031 (= (insertStrictlySorted!623 (t!51866 l!1251) newKey!123 newValue!123) lt!678124)))

(assert (= (and d!168031 c!147593) b!1586357))

(assert (= (and d!168031 (not c!147593)) b!1586356))

(assert (= (and b!1586356 c!147594) b!1586359))

(assert (= (and b!1586356 (not c!147594)) b!1586360))

(assert (= (and b!1586360 c!147592) b!1586352))

(assert (= (and b!1586360 (not c!147592)) b!1586354))

(assert (= (or b!1586352 b!1586354) bm!72655))

(assert (= (or b!1586359 bm!72655) bm!72654))

(assert (= (or b!1586357 bm!72654) bm!72656))

(assert (= (and bm!72656 c!147595) b!1586353))

(assert (= (and bm!72656 (not c!147595)) b!1586351))

(assert (= (and d!168031 res!1082799) b!1586355))

(assert (= (and b!1586355 res!1082800) b!1586358))

(declare-fun m!1455821 () Bool)

(assert (=> d!168031 m!1455821))

(assert (=> d!168031 m!1455777))

(declare-fun m!1455823 () Bool)

(assert (=> b!1586355 m!1455823))

(declare-fun m!1455825 () Bool)

(assert (=> b!1586353 m!1455825))

(declare-fun m!1455827 () Bool)

(assert (=> b!1586358 m!1455827))

(declare-fun m!1455829 () Bool)

(assert (=> bm!72656 m!1455829))

(assert (=> b!1586217 d!168031))

(declare-fun d!168033 () Bool)

(assert (=> d!168033 (not (containsKey!991 (insertStrictlySorted!623 (t!51866 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-fun lt!678132 () Unit!52202)

(declare-fun choose!2101 (List!36960 (_ BitVec 64) B!2892 (_ BitVec 64)) Unit!52202)

(assert (=> d!168033 (= lt!678132 (choose!2101 (t!51866 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun e!885683 () Bool)

(assert (=> d!168033 e!885683))

(declare-fun res!1082821 () Bool)

(assert (=> d!168033 (=> (not res!1082821) (not e!885683))))

(assert (=> d!168033 (= res!1082821 (isStrictlySorted!1144 (t!51866 l!1251)))))

(assert (=> d!168033 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!9 (t!51866 l!1251) newKey!123 newValue!123 otherKey!56) lt!678132)))

(declare-fun b!1586395 () Bool)

(declare-fun res!1082822 () Bool)

(assert (=> b!1586395 (=> (not res!1082822) (not e!885683))))

(assert (=> b!1586395 (= res!1082822 (not (containsKey!991 (t!51866 l!1251) otherKey!56)))))

(declare-fun b!1586396 () Bool)

(assert (=> b!1586396 (= e!885683 (not (= otherKey!56 newKey!123)))))

(assert (= (and d!168033 res!1082821) b!1586395))

(assert (= (and b!1586395 res!1082822) b!1586396))

(assert (=> d!168033 m!1455773))

(assert (=> d!168033 m!1455773))

(assert (=> d!168033 m!1455775))

(declare-fun m!1455853 () Bool)

(assert (=> d!168033 m!1455853))

(assert (=> d!168033 m!1455777))

(assert (=> b!1586395 m!1455781))

(assert (=> b!1586217 d!168033))

(declare-fun d!168043 () Bool)

(declare-fun res!1082827 () Bool)

(declare-fun e!885686 () Bool)

(assert (=> d!168043 (=> res!1082827 e!885686)))

(assert (=> d!168043 (= res!1082827 (and (is-Cons!36956 (insertStrictlySorted!623 (t!51866 l!1251) newKey!123 newValue!123)) (= (_1!12933 (h!38517 (insertStrictlySorted!623 (t!51866 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!168043 (= (containsKey!991 (insertStrictlySorted!623 (t!51866 l!1251) newKey!123 newValue!123) otherKey!56) e!885686)))

(declare-fun b!1586403 () Bool)

(declare-fun e!885687 () Bool)

(assert (=> b!1586403 (= e!885686 e!885687)))

(declare-fun res!1082828 () Bool)

(assert (=> b!1586403 (=> (not res!1082828) (not e!885687))))

(assert (=> b!1586403 (= res!1082828 (and (or (not (is-Cons!36956 (insertStrictlySorted!623 (t!51866 l!1251) newKey!123 newValue!123))) (bvsle (_1!12933 (h!38517 (insertStrictlySorted!623 (t!51866 l!1251) newKey!123 newValue!123))) otherKey!56)) (is-Cons!36956 (insertStrictlySorted!623 (t!51866 l!1251) newKey!123 newValue!123)) (bvslt (_1!12933 (h!38517 (insertStrictlySorted!623 (t!51866 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1586404 () Bool)

(assert (=> b!1586404 (= e!885687 (containsKey!991 (t!51866 (insertStrictlySorted!623 (t!51866 l!1251) newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!168043 (not res!1082827)) b!1586403))

(assert (= (and b!1586403 res!1082828) b!1586404))

(declare-fun m!1455855 () Bool)

(assert (=> b!1586404 m!1455855))

(assert (=> b!1586217 d!168043))

(declare-fun b!1586413 () Bool)

(declare-fun e!885694 () Bool)

(declare-fun tp!115031 () Bool)

(assert (=> b!1586413 (= e!885694 (and tp_is_empty!39425 tp!115031))))

(assert (=> b!1586219 (= tp!115028 e!885694)))

(assert (= (and b!1586219 (is-Cons!36956 (t!51866 l!1251))) b!1586413))

(push 1)

(assert (not bm!72653))

(assert (not b!1586404))

(assert (not bm!72656))

(assert (not b!1586346))

(assert (not d!168033))

(assert (not b!1586395))

(assert tp_is_empty!39425)

(assert (not d!168015))

(assert (not b!1586358))

(assert (not b!1586353))

(assert (not b!1586240))

(assert (not b!1586343))

(assert (not b!1586226))

(assert (not b!1586242))

(assert (not b!1586341))

(assert (not d!168031))

(assert (not b!1586355))

(assert (not b!1586350))

(assert (not b!1586413))

(assert (not b!1586228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

