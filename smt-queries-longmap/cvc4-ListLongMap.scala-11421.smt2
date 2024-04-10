; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133122 () Bool)

(assert start!133122)

(declare-fun b!1557723 () Bool)

(declare-fun res!1065459 () Bool)

(declare-fun e!867704 () Bool)

(assert (=> b!1557723 (=> (not res!1065459) (not e!867704))))

(declare-datatypes ((B!2406 0))(
  ( (B!2407 (val!19289 Int)) )
))
(declare-datatypes ((tuple2!24954 0))(
  ( (tuple2!24955 (_1!12488 (_ BitVec 64)) (_2!12488 B!2406)) )
))
(declare-datatypes ((List!36323 0))(
  ( (Nil!36320) (Cons!36319 (h!37765 tuple2!24954) (t!51050 List!36323)) )
))
(declare-fun l!1292 () List!36323)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!829 (List!36323 (_ BitVec 64)) Bool)

(assert (=> b!1557723 (= res!1065459 (containsKey!829 l!1292 otherKey!62))))

(declare-fun b!1557724 () Bool)

(declare-fun newValue!135 () B!2406)

(declare-fun newKey!135 () (_ BitVec 64))

(declare-fun isStrictlySorted!966 (List!36323) Bool)

(declare-fun insertStrictlySorted!566 (List!36323 (_ BitVec 64) B!2406) List!36323)

(assert (=> b!1557724 (= e!867704 (not (isStrictlySorted!966 (insertStrictlySorted!566 l!1292 newKey!135 newValue!135))))))

(assert (=> b!1557724 (containsKey!829 (insertStrictlySorted!566 (t!51050 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51886 0))(
  ( (Unit!51887) )
))
(declare-fun lt!670733 () Unit!51886)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!9 (List!36323 (_ BitVec 64) B!2406 (_ BitVec 64)) Unit!51886)

(assert (=> b!1557724 (= lt!670733 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!9 (t!51050 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun b!1557725 () Bool)

(declare-fun res!1065456 () Bool)

(assert (=> b!1557725 (=> (not res!1065456) (not e!867704))))

(assert (=> b!1557725 (= res!1065456 (and (not (= otherKey!62 newKey!135)) (is-Cons!36319 l!1292) (not (= (_1!12488 (h!37765 l!1292)) otherKey!62))))))

(declare-fun b!1557726 () Bool)

(declare-fun e!867703 () Bool)

(declare-fun tp_is_empty!38411 () Bool)

(declare-fun tp!112563 () Bool)

(assert (=> b!1557726 (= e!867703 (and tp_is_empty!38411 tp!112563))))

(declare-fun b!1557727 () Bool)

(declare-fun res!1065460 () Bool)

(assert (=> b!1557727 (=> (not res!1065460) (not e!867704))))

(assert (=> b!1557727 (= res!1065460 (isStrictlySorted!966 (t!51050 l!1292)))))

(declare-fun b!1557728 () Bool)

(declare-fun res!1065458 () Bool)

(assert (=> b!1557728 (=> (not res!1065458) (not e!867704))))

(assert (=> b!1557728 (= res!1065458 (containsKey!829 (t!51050 l!1292) otherKey!62))))

(declare-fun res!1065457 () Bool)

(assert (=> start!133122 (=> (not res!1065457) (not e!867704))))

(assert (=> start!133122 (= res!1065457 (isStrictlySorted!966 l!1292))))

(assert (=> start!133122 e!867704))

(assert (=> start!133122 e!867703))

(assert (=> start!133122 true))

(assert (=> start!133122 tp_is_empty!38411))

(assert (= (and start!133122 res!1065457) b!1557723))

(assert (= (and b!1557723 res!1065459) b!1557725))

(assert (= (and b!1557725 res!1065456) b!1557727))

(assert (= (and b!1557727 res!1065460) b!1557728))

(assert (= (and b!1557728 res!1065458) b!1557724))

(assert (= (and start!133122 (is-Cons!36319 l!1292)) b!1557726))

(declare-fun m!1434795 () Bool)

(assert (=> b!1557728 m!1434795))

(declare-fun m!1434797 () Bool)

(assert (=> start!133122 m!1434797))

(declare-fun m!1434799 () Bool)

(assert (=> b!1557724 m!1434799))

(declare-fun m!1434801 () Bool)

(assert (=> b!1557724 m!1434801))

(assert (=> b!1557724 m!1434799))

(declare-fun m!1434803 () Bool)

(assert (=> b!1557724 m!1434803))

(declare-fun m!1434805 () Bool)

(assert (=> b!1557724 m!1434805))

(assert (=> b!1557724 m!1434803))

(declare-fun m!1434807 () Bool)

(assert (=> b!1557724 m!1434807))

(declare-fun m!1434809 () Bool)

(assert (=> b!1557727 m!1434809))

(declare-fun m!1434811 () Bool)

(assert (=> b!1557723 m!1434811))

(push 1)

(assert (not b!1557724))

(assert (not start!133122))

(assert (not b!1557728))

(assert tp_is_empty!38411)

(assert (not b!1557726))

(assert (not b!1557723))

(assert (not b!1557727))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162513 () Bool)

(declare-fun res!1065471 () Bool)

(declare-fun e!867715 () Bool)

(assert (=> d!162513 (=> res!1065471 e!867715)))

(assert (=> d!162513 (= res!1065471 (or (is-Nil!36320 (t!51050 l!1292)) (is-Nil!36320 (t!51050 (t!51050 l!1292)))))))

(assert (=> d!162513 (= (isStrictlySorted!966 (t!51050 l!1292)) e!867715)))

(declare-fun b!1557739 () Bool)

(declare-fun e!867716 () Bool)

(assert (=> b!1557739 (= e!867715 e!867716)))

(declare-fun res!1065472 () Bool)

(assert (=> b!1557739 (=> (not res!1065472) (not e!867716))))

(assert (=> b!1557739 (= res!1065472 (bvslt (_1!12488 (h!37765 (t!51050 l!1292))) (_1!12488 (h!37765 (t!51050 (t!51050 l!1292))))))))

(declare-fun b!1557740 () Bool)

(assert (=> b!1557740 (= e!867716 (isStrictlySorted!966 (t!51050 (t!51050 l!1292))))))

(assert (= (and d!162513 (not res!1065471)) b!1557739))

(assert (= (and b!1557739 res!1065472) b!1557740))

(declare-fun m!1434815 () Bool)

(assert (=> b!1557740 m!1434815))

(assert (=> b!1557727 d!162513))

(declare-fun d!162519 () Bool)

(declare-fun res!1065475 () Bool)

(declare-fun e!867719 () Bool)

(assert (=> d!162519 (=> res!1065475 e!867719)))

(assert (=> d!162519 (= res!1065475 (or (is-Nil!36320 l!1292) (is-Nil!36320 (t!51050 l!1292))))))

(assert (=> d!162519 (= (isStrictlySorted!966 l!1292) e!867719)))

(declare-fun b!1557743 () Bool)

(declare-fun e!867720 () Bool)

(assert (=> b!1557743 (= e!867719 e!867720)))

(declare-fun res!1065476 () Bool)

(assert (=> b!1557743 (=> (not res!1065476) (not e!867720))))

(assert (=> b!1557743 (= res!1065476 (bvslt (_1!12488 (h!37765 l!1292)) (_1!12488 (h!37765 (t!51050 l!1292)))))))

(declare-fun b!1557744 () Bool)

(assert (=> b!1557744 (= e!867720 (isStrictlySorted!966 (t!51050 l!1292)))))

(assert (= (and d!162519 (not res!1065475)) b!1557743))

(assert (= (and b!1557743 res!1065476) b!1557744))

(assert (=> b!1557744 m!1434809))

(assert (=> start!133122 d!162519))

(declare-fun d!162521 () Bool)

(declare-fun res!1065489 () Bool)

(declare-fun e!867733 () Bool)

(assert (=> d!162521 (=> res!1065489 e!867733)))

(assert (=> d!162521 (= res!1065489 (and (is-Cons!36319 l!1292) (= (_1!12488 (h!37765 l!1292)) otherKey!62)))))

(assert (=> d!162521 (= (containsKey!829 l!1292 otherKey!62) e!867733)))

(declare-fun b!1557757 () Bool)

(declare-fun e!867734 () Bool)

(assert (=> b!1557757 (= e!867733 e!867734)))

(declare-fun res!1065490 () Bool)

(assert (=> b!1557757 (=> (not res!1065490) (not e!867734))))

(assert (=> b!1557757 (= res!1065490 (and (or (not (is-Cons!36319 l!1292)) (bvsle (_1!12488 (h!37765 l!1292)) otherKey!62)) (is-Cons!36319 l!1292) (bvslt (_1!12488 (h!37765 l!1292)) otherKey!62)))))

(declare-fun b!1557758 () Bool)

(assert (=> b!1557758 (= e!867734 (containsKey!829 (t!51050 l!1292) otherKey!62))))

(assert (= (and d!162521 (not res!1065489)) b!1557757))

(assert (= (and b!1557757 res!1065490) b!1557758))

(assert (=> b!1557758 m!1434795))

(assert (=> b!1557723 d!162521))

(declare-fun d!162529 () Bool)

(declare-fun res!1065491 () Bool)

(declare-fun e!867735 () Bool)

(assert (=> d!162529 (=> res!1065491 e!867735)))

(assert (=> d!162529 (= res!1065491 (and (is-Cons!36319 (t!51050 l!1292)) (= (_1!12488 (h!37765 (t!51050 l!1292))) otherKey!62)))))

(assert (=> d!162529 (= (containsKey!829 (t!51050 l!1292) otherKey!62) e!867735)))

(declare-fun b!1557759 () Bool)

(declare-fun e!867736 () Bool)

(assert (=> b!1557759 (= e!867735 e!867736)))

(declare-fun res!1065492 () Bool)

(assert (=> b!1557759 (=> (not res!1065492) (not e!867736))))

(assert (=> b!1557759 (= res!1065492 (and (or (not (is-Cons!36319 (t!51050 l!1292))) (bvsle (_1!12488 (h!37765 (t!51050 l!1292))) otherKey!62)) (is-Cons!36319 (t!51050 l!1292)) (bvslt (_1!12488 (h!37765 (t!51050 l!1292))) otherKey!62)))))

(declare-fun b!1557760 () Bool)

(assert (=> b!1557760 (= e!867736 (containsKey!829 (t!51050 (t!51050 l!1292)) otherKey!62))))

(assert (= (and d!162529 (not res!1065491)) b!1557759))

(assert (= (and b!1557759 res!1065492) b!1557760))

(declare-fun m!1434821 () Bool)

(assert (=> b!1557760 m!1434821))

(assert (=> b!1557728 d!162529))

(declare-fun d!162531 () Bool)

(declare-fun res!1065493 () Bool)

(declare-fun e!867737 () Bool)

(assert (=> d!162531 (=> res!1065493 e!867737)))

(assert (=> d!162531 (= res!1065493 (and (is-Cons!36319 (insertStrictlySorted!566 (t!51050 l!1292) newKey!135 newValue!135)) (= (_1!12488 (h!37765 (insertStrictlySorted!566 (t!51050 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162531 (= (containsKey!829 (insertStrictlySorted!566 (t!51050 l!1292) newKey!135 newValue!135) otherKey!62) e!867737)))

(declare-fun b!1557761 () Bool)

(declare-fun e!867738 () Bool)

(assert (=> b!1557761 (= e!867737 e!867738)))

(declare-fun res!1065494 () Bool)

(assert (=> b!1557761 (=> (not res!1065494) (not e!867738))))

(assert (=> b!1557761 (= res!1065494 (and (or (not (is-Cons!36319 (insertStrictlySorted!566 (t!51050 l!1292) newKey!135 newValue!135))) (bvsle (_1!12488 (h!37765 (insertStrictlySorted!566 (t!51050 l!1292) newKey!135 newValue!135))) otherKey!62)) (is-Cons!36319 (insertStrictlySorted!566 (t!51050 l!1292) newKey!135 newValue!135)) (bvslt (_1!12488 (h!37765 (insertStrictlySorted!566 (t!51050 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1557762 () Bool)

(assert (=> b!1557762 (= e!867738 (containsKey!829 (t!51050 (insertStrictlySorted!566 (t!51050 l!1292) newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162531 (not res!1065493)) b!1557761))

(assert (= (and b!1557761 res!1065494) b!1557762))

(declare-fun m!1434823 () Bool)

(assert (=> b!1557762 m!1434823))

(assert (=> b!1557724 d!162531))

(declare-fun b!1557849 () Bool)

(declare-fun e!867784 () List!36323)

(declare-fun call!71713 () List!36323)

(assert (=> b!1557849 (= e!867784 call!71713)))

(declare-fun e!867786 () List!36323)

(declare-fun b!1557850 () Bool)

(assert (=> b!1557850 (= e!867786 (insertStrictlySorted!566 (t!51050 l!1292) newKey!135 newValue!135))))

(declare-fun bm!71710 () Bool)

(declare-fun call!71715 () List!36323)

(declare-fun call!71714 () List!36323)

(assert (=> bm!71710 (= call!71715 call!71714)))

(declare-fun b!1557852 () Bool)

(declare-fun e!867782 () List!36323)

(assert (=> b!1557852 (= e!867782 call!71715)))

(declare-fun b!1557853 () Bool)

(declare-fun e!867783 () List!36323)

(assert (=> b!1557853 (= e!867783 e!867782)))

(declare-fun c!144035 () Bool)

(assert (=> b!1557853 (= c!144035 (and (is-Cons!36319 l!1292) (= (_1!12488 (h!37765 l!1292)) newKey!135)))))

(declare-fun b!1557854 () Bool)

(declare-fun c!144032 () Bool)

(assert (=> b!1557854 (= c!144032 (and (is-Cons!36319 l!1292) (bvsgt (_1!12488 (h!37765 l!1292)) newKey!135)))))

(assert (=> b!1557854 (= e!867782 e!867784)))

(declare-fun b!1557855 () Bool)

(declare-fun lt!670745 () List!36323)

(declare-fun e!867785 () Bool)

(declare-fun contains!10208 (List!36323 tuple2!24954) Bool)

(assert (=> b!1557855 (= e!867785 (contains!10208 lt!670745 (tuple2!24955 newKey!135 newValue!135)))))

(declare-fun c!144034 () Bool)

(declare-fun bm!71711 () Bool)

(declare-fun $colon$colon!977 (List!36323 tuple2!24954) List!36323)

(assert (=> bm!71711 (= call!71714 ($colon$colon!977 e!867786 (ite c!144034 (h!37765 l!1292) (tuple2!24955 newKey!135 newValue!135))))))

(declare-fun c!144033 () Bool)

(assert (=> bm!71711 (= c!144033 c!144034)))

(declare-fun d!162533 () Bool)

(assert (=> d!162533 e!867785))

(declare-fun res!1065517 () Bool)

(assert (=> d!162533 (=> (not res!1065517) (not e!867785))))

(assert (=> d!162533 (= res!1065517 (isStrictlySorted!966 lt!670745))))

(assert (=> d!162533 (= lt!670745 e!867783)))

(assert (=> d!162533 (= c!144034 (and (is-Cons!36319 l!1292) (bvslt (_1!12488 (h!37765 l!1292)) newKey!135)))))

(assert (=> d!162533 (isStrictlySorted!966 l!1292)))

(assert (=> d!162533 (= (insertStrictlySorted!566 l!1292 newKey!135 newValue!135) lt!670745)))

(declare-fun b!1557851 () Bool)

(declare-fun res!1065518 () Bool)

(assert (=> b!1557851 (=> (not res!1065518) (not e!867785))))

(assert (=> b!1557851 (= res!1065518 (containsKey!829 lt!670745 newKey!135))))

(declare-fun b!1557856 () Bool)

(assert (=> b!1557856 (= e!867783 call!71714)))

(declare-fun b!1557857 () Bool)

(assert (=> b!1557857 (= e!867784 call!71713)))

(declare-fun b!1557858 () Bool)

(assert (=> b!1557858 (= e!867786 (ite c!144035 (t!51050 l!1292) (ite c!144032 (Cons!36319 (h!37765 l!1292) (t!51050 l!1292)) Nil!36320)))))

(declare-fun bm!71712 () Bool)

(assert (=> bm!71712 (= call!71713 call!71715)))

(assert (= (and d!162533 c!144034) b!1557856))

(assert (= (and d!162533 (not c!144034)) b!1557853))

(assert (= (and b!1557853 c!144035) b!1557852))

(assert (= (and b!1557853 (not c!144035)) b!1557854))

(assert (= (and b!1557854 c!144032) b!1557849))

(assert (= (and b!1557854 (not c!144032)) b!1557857))

(assert (= (or b!1557849 b!1557857) bm!71712))

(assert (= (or b!1557852 bm!71712) bm!71710))

(assert (= (or b!1557856 bm!71710) bm!71711))

(assert (= (and bm!71711 c!144033) b!1557850))

(assert (= (and bm!71711 (not c!144033)) b!1557858))

(assert (= (and d!162533 res!1065517) b!1557851))

(assert (= (and b!1557851 res!1065518) b!1557855))

(declare-fun m!1434843 () Bool)

(assert (=> b!1557851 m!1434843))

(declare-fun m!1434845 () Bool)

(assert (=> b!1557855 m!1434845))

(declare-fun m!1434847 () Bool)

(assert (=> d!162533 m!1434847))

(assert (=> d!162533 m!1434797))

(assert (=> b!1557850 m!1434799))

(declare-fun m!1434849 () Bool)

(assert (=> bm!71711 m!1434849))

(assert (=> b!1557724 d!162533))

(declare-fun d!162541 () Bool)

(assert (=> d!162541 (containsKey!829 (insertStrictlySorted!566 (t!51050 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-fun lt!670752 () Unit!51886)

(declare-fun choose!2069 (List!36323 (_ BitVec 64) B!2406 (_ BitVec 64)) Unit!51886)

(assert (=> d!162541 (= lt!670752 (choose!2069 (t!51050 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun e!867812 () Bool)

(assert (=> d!162541 e!867812))

(declare-fun res!1065545 () Bool)

(assert (=> d!162541 (=> (not res!1065545) (not e!867812))))

(assert (=> d!162541 (= res!1065545 (isStrictlySorted!966 (t!51050 l!1292)))))

(assert (=> d!162541 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!9 (t!51050 l!1292) newKey!135 newValue!135 otherKey!62) lt!670752)))

(declare-fun b!1557893 () Bool)

(declare-fun res!1065547 () Bool)

(assert (=> b!1557893 (=> (not res!1065547) (not e!867812))))

(assert (=> b!1557893 (= res!1065547 (containsKey!829 (t!51050 l!1292) otherKey!62))))

(declare-fun b!1557894 () Bool)

(assert (=> b!1557894 (= e!867812 (not (= otherKey!62 newKey!135)))))

(assert (= (and d!162541 res!1065545) b!1557893))

(assert (= (and b!1557893 res!1065547) b!1557894))

(assert (=> d!162541 m!1434799))

(assert (=> d!162541 m!1434799))

(assert (=> d!162541 m!1434801))

(declare-fun m!1434869 () Bool)

(assert (=> d!162541 m!1434869))

(assert (=> d!162541 m!1434809))

(assert (=> b!1557893 m!1434795))

(assert (=> b!1557724 d!162541))

(declare-fun d!162555 () Bool)

(declare-fun res!1065551 () Bool)

(declare-fun e!867816 () Bool)

(assert (=> d!162555 (=> res!1065551 e!867816)))

(assert (=> d!162555 (= res!1065551 (or (is-Nil!36320 (insertStrictlySorted!566 l!1292 newKey!135 newValue!135)) (is-Nil!36320 (t!51050 (insertStrictlySorted!566 l!1292 newKey!135 newValue!135)))))))

(assert (=> d!162555 (= (isStrictlySorted!966 (insertStrictlySorted!566 l!1292 newKey!135 newValue!135)) e!867816)))

(declare-fun b!1557899 () Bool)

(declare-fun e!867817 () Bool)

(assert (=> b!1557899 (= e!867816 e!867817)))

(declare-fun res!1065552 () Bool)

(assert (=> b!1557899 (=> (not res!1065552) (not e!867817))))

(assert (=> b!1557899 (= res!1065552 (bvslt (_1!12488 (h!37765 (insertStrictlySorted!566 l!1292 newKey!135 newValue!135))) (_1!12488 (h!37765 (t!51050 (insertStrictlySorted!566 l!1292 newKey!135 newValue!135))))))))

