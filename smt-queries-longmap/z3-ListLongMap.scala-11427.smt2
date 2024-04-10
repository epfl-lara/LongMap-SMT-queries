; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133246 () Bool)

(assert start!133246)

(declare-fun b!1558518 () Bool)

(declare-fun res!1065915 () Bool)

(declare-fun e!868220 () Bool)

(assert (=> b!1558518 (=> (not res!1065915) (not e!868220))))

(declare-datatypes ((B!2440 0))(
  ( (B!2441 (val!19306 Int)) )
))
(declare-datatypes ((tuple2!24988 0))(
  ( (tuple2!24989 (_1!12505 (_ BitVec 64)) (_2!12505 B!2440)) )
))
(declare-datatypes ((List!36340 0))(
  ( (Nil!36337) (Cons!36336 (h!37782 tuple2!24988) (t!51067 List!36340)) )
))
(declare-fun l!1292 () List!36340)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!843 (List!36340 (_ BitVec 64)) Bool)

(assert (=> b!1558518 (= res!1065915 (containsKey!843 (t!51067 l!1292) otherKey!62))))

(declare-fun newKey!135 () (_ BitVec 64))

(declare-fun b!1558519 () Bool)

(declare-fun newValue!135 () B!2440)

(declare-fun insertStrictlySorted!571 (List!36340 (_ BitVec 64) B!2440) List!36340)

(assert (=> b!1558519 (= e!868220 (not (containsKey!843 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135) otherKey!62)))))

(assert (=> b!1558519 (containsKey!843 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51890 0))(
  ( (Unit!51891) )
))
(declare-fun lt!670790 () Unit!51890)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!11 (List!36340 (_ BitVec 64) B!2440 (_ BitVec 64)) Unit!51890)

(assert (=> b!1558519 (= lt!670790 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!11 (t!51067 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun b!1558520 () Bool)

(declare-fun res!1065918 () Bool)

(assert (=> b!1558520 (=> (not res!1065918) (not e!868220))))

(declare-fun isStrictlySorted!980 (List!36340) Bool)

(assert (=> b!1558520 (= res!1065918 (isStrictlySorted!980 (t!51067 l!1292)))))

(declare-fun b!1558521 () Bool)

(declare-fun res!1065919 () Bool)

(assert (=> b!1558521 (=> (not res!1065919) (not e!868220))))

(get-info :version)

(assert (=> b!1558521 (= res!1065919 (and (not (= otherKey!62 newKey!135)) ((_ is Cons!36336) l!1292) (not (= (_1!12505 (h!37782 l!1292)) otherKey!62))))))

(declare-fun b!1558522 () Bool)

(declare-fun e!868219 () Bool)

(declare-fun tp_is_empty!38445 () Bool)

(declare-fun tp!112659 () Bool)

(assert (=> b!1558522 (= e!868219 (and tp_is_empty!38445 tp!112659))))

(declare-fun b!1558523 () Bool)

(declare-fun res!1065916 () Bool)

(assert (=> b!1558523 (=> (not res!1065916) (not e!868220))))

(assert (=> b!1558523 (= res!1065916 (containsKey!843 l!1292 otherKey!62))))

(declare-fun res!1065917 () Bool)

(assert (=> start!133246 (=> (not res!1065917) (not e!868220))))

(assert (=> start!133246 (= res!1065917 (isStrictlySorted!980 l!1292))))

(assert (=> start!133246 e!868220))

(assert (=> start!133246 e!868219))

(assert (=> start!133246 true))

(assert (=> start!133246 tp_is_empty!38445))

(assert (= (and start!133246 res!1065917) b!1558523))

(assert (= (and b!1558523 res!1065916) b!1558521))

(assert (= (and b!1558521 res!1065919) b!1558520))

(assert (= (and b!1558520 res!1065918) b!1558518))

(assert (= (and b!1558518 res!1065915) b!1558519))

(assert (= (and start!133246 ((_ is Cons!36336) l!1292)) b!1558522))

(declare-fun m!1435113 () Bool)

(assert (=> b!1558523 m!1435113))

(declare-fun m!1435115 () Bool)

(assert (=> start!133246 m!1435115))

(declare-fun m!1435117 () Bool)

(assert (=> b!1558518 m!1435117))

(declare-fun m!1435119 () Bool)

(assert (=> b!1558520 m!1435119))

(declare-fun m!1435121 () Bool)

(assert (=> b!1558519 m!1435121))

(declare-fun m!1435123 () Bool)

(assert (=> b!1558519 m!1435123))

(assert (=> b!1558519 m!1435121))

(declare-fun m!1435125 () Bool)

(assert (=> b!1558519 m!1435125))

(declare-fun m!1435127 () Bool)

(assert (=> b!1558519 m!1435127))

(assert (=> b!1558519 m!1435125))

(declare-fun m!1435129 () Bool)

(assert (=> b!1558519 m!1435129))

(check-sat tp_is_empty!38445 (not b!1558520) (not b!1558523) (not start!133246) (not b!1558522) (not b!1558519) (not b!1558518))
(check-sat)
(get-model)

(declare-fun d!162679 () Bool)

(declare-fun res!1065939 () Bool)

(declare-fun e!868231 () Bool)

(assert (=> d!162679 (=> res!1065939 e!868231)))

(assert (=> d!162679 (= res!1065939 (or ((_ is Nil!36337) (t!51067 l!1292)) ((_ is Nil!36337) (t!51067 (t!51067 l!1292)))))))

(assert (=> d!162679 (= (isStrictlySorted!980 (t!51067 l!1292)) e!868231)))

(declare-fun b!1558546 () Bool)

(declare-fun e!868232 () Bool)

(assert (=> b!1558546 (= e!868231 e!868232)))

(declare-fun res!1065940 () Bool)

(assert (=> b!1558546 (=> (not res!1065940) (not e!868232))))

(assert (=> b!1558546 (= res!1065940 (bvslt (_1!12505 (h!37782 (t!51067 l!1292))) (_1!12505 (h!37782 (t!51067 (t!51067 l!1292))))))))

(declare-fun b!1558547 () Bool)

(assert (=> b!1558547 (= e!868232 (isStrictlySorted!980 (t!51067 (t!51067 l!1292))))))

(assert (= (and d!162679 (not res!1065939)) b!1558546))

(assert (= (and b!1558546 res!1065940) b!1558547))

(declare-fun m!1435149 () Bool)

(assert (=> b!1558547 m!1435149))

(assert (=> b!1558520 d!162679))

(declare-fun d!162683 () Bool)

(declare-fun res!1065959 () Bool)

(declare-fun e!868251 () Bool)

(assert (=> d!162683 (=> res!1065959 e!868251)))

(assert (=> d!162683 (= res!1065959 (and ((_ is Cons!36336) (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135)) (= (_1!12505 (h!37782 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162683 (= (containsKey!843 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135) otherKey!62) e!868251)))

(declare-fun b!1558566 () Bool)

(declare-fun e!868252 () Bool)

(assert (=> b!1558566 (= e!868251 e!868252)))

(declare-fun res!1065960 () Bool)

(assert (=> b!1558566 (=> (not res!1065960) (not e!868252))))

(assert (=> b!1558566 (= res!1065960 (and (or (not ((_ is Cons!36336) (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135))) (bvsle (_1!12505 (h!37782 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135))) otherKey!62)) ((_ is Cons!36336) (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135)) (bvslt (_1!12505 (h!37782 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1558567 () Bool)

(assert (=> b!1558567 (= e!868252 (containsKey!843 (t!51067 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162683 (not res!1065959)) b!1558566))

(assert (= (and b!1558566 res!1065960) b!1558567))

(declare-fun m!1435151 () Bool)

(assert (=> b!1558567 m!1435151))

(assert (=> b!1558519 d!162683))

(declare-fun d!162689 () Bool)

(declare-fun res!1065961 () Bool)

(declare-fun e!868253 () Bool)

(assert (=> d!162689 (=> res!1065961 e!868253)))

(assert (=> d!162689 (= res!1065961 (and ((_ is Cons!36336) (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)) (= (_1!12505 (h!37782 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162689 (= (containsKey!843 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135) otherKey!62) e!868253)))

(declare-fun b!1558568 () Bool)

(declare-fun e!868254 () Bool)

(assert (=> b!1558568 (= e!868253 e!868254)))

(declare-fun res!1065962 () Bool)

(assert (=> b!1558568 (=> (not res!1065962) (not e!868254))))

(assert (=> b!1558568 (= res!1065962 (and (or (not ((_ is Cons!36336) (insertStrictlySorted!571 l!1292 newKey!135 newValue!135))) (bvsle (_1!12505 (h!37782 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135))) otherKey!62)) ((_ is Cons!36336) (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)) (bvslt (_1!12505 (h!37782 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1558569 () Bool)

(assert (=> b!1558569 (= e!868254 (containsKey!843 (t!51067 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162689 (not res!1065961)) b!1558568))

(assert (= (and b!1558568 res!1065962) b!1558569))

(declare-fun m!1435153 () Bool)

(assert (=> b!1558569 m!1435153))

(assert (=> b!1558519 d!162689))

(declare-fun bm!71765 () Bool)

(declare-fun call!71772 () List!36340)

(declare-fun c!144127 () Bool)

(declare-fun e!868308 () List!36340)

(declare-fun $colon$colon!981 (List!36340 tuple2!24988) List!36340)

(assert (=> bm!71765 (= call!71772 ($colon$colon!981 e!868308 (ite c!144127 (h!37782 l!1292) (tuple2!24989 newKey!135 newValue!135))))))

(declare-fun c!144129 () Bool)

(assert (=> bm!71765 (= c!144129 c!144127)))

(declare-fun b!1558646 () Bool)

(declare-fun e!868306 () List!36340)

(declare-fun e!868307 () List!36340)

(assert (=> b!1558646 (= e!868306 e!868307)))

(declare-fun c!144130 () Bool)

(assert (=> b!1558646 (= c!144130 (and ((_ is Cons!36336) l!1292) (= (_1!12505 (h!37782 l!1292)) newKey!135)))))

(declare-fun d!162693 () Bool)

(declare-fun e!868309 () Bool)

(assert (=> d!162693 e!868309))

(declare-fun res!1065996 () Bool)

(assert (=> d!162693 (=> (not res!1065996) (not e!868309))))

(declare-fun lt!670800 () List!36340)

(assert (=> d!162693 (= res!1065996 (isStrictlySorted!980 lt!670800))))

(assert (=> d!162693 (= lt!670800 e!868306)))

(assert (=> d!162693 (= c!144127 (and ((_ is Cons!36336) l!1292) (bvslt (_1!12505 (h!37782 l!1292)) newKey!135)))))

(assert (=> d!162693 (isStrictlySorted!980 l!1292)))

(assert (=> d!162693 (= (insertStrictlySorted!571 l!1292 newKey!135 newValue!135) lt!670800)))

(declare-fun b!1558647 () Bool)

(declare-fun c!144128 () Bool)

(assert (=> b!1558647 (= e!868308 (ite c!144130 (t!51067 l!1292) (ite c!144128 (Cons!36336 (h!37782 l!1292) (t!51067 l!1292)) Nil!36337)))))

(declare-fun b!1558648 () Bool)

(declare-fun e!868305 () List!36340)

(declare-fun call!71771 () List!36340)

(assert (=> b!1558648 (= e!868305 call!71771)))

(declare-fun bm!71766 () Bool)

(declare-fun call!71770 () List!36340)

(assert (=> bm!71766 (= call!71770 call!71772)))

(declare-fun b!1558649 () Bool)

(assert (=> b!1558649 (= e!868305 call!71771)))

(declare-fun b!1558650 () Bool)

(assert (=> b!1558650 (= e!868307 call!71770)))

(declare-fun b!1558651 () Bool)

(assert (=> b!1558651 (= e!868306 call!71772)))

(declare-fun bm!71767 () Bool)

(assert (=> bm!71767 (= call!71771 call!71770)))

(declare-fun b!1558652 () Bool)

(declare-fun contains!10212 (List!36340 tuple2!24988) Bool)

(assert (=> b!1558652 (= e!868309 (contains!10212 lt!670800 (tuple2!24989 newKey!135 newValue!135)))))

(declare-fun b!1558653 () Bool)

(assert (=> b!1558653 (= c!144128 (and ((_ is Cons!36336) l!1292) (bvsgt (_1!12505 (h!37782 l!1292)) newKey!135)))))

(assert (=> b!1558653 (= e!868307 e!868305)))

(declare-fun b!1558654 () Bool)

(declare-fun res!1065995 () Bool)

(assert (=> b!1558654 (=> (not res!1065995) (not e!868309))))

(assert (=> b!1558654 (= res!1065995 (containsKey!843 lt!670800 newKey!135))))

(declare-fun b!1558655 () Bool)

(assert (=> b!1558655 (= e!868308 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135))))

(assert (= (and d!162693 c!144127) b!1558651))

(assert (= (and d!162693 (not c!144127)) b!1558646))

(assert (= (and b!1558646 c!144130) b!1558650))

(assert (= (and b!1558646 (not c!144130)) b!1558653))

(assert (= (and b!1558653 c!144128) b!1558649))

(assert (= (and b!1558653 (not c!144128)) b!1558648))

(assert (= (or b!1558649 b!1558648) bm!71767))

(assert (= (or b!1558650 bm!71767) bm!71766))

(assert (= (or b!1558651 bm!71766) bm!71765))

(assert (= (and bm!71765 c!144129) b!1558655))

(assert (= (and bm!71765 (not c!144129)) b!1558647))

(assert (= (and d!162693 res!1065996) b!1558654))

(assert (= (and b!1558654 res!1065995) b!1558652))

(declare-fun m!1435169 () Bool)

(assert (=> d!162693 m!1435169))

(assert (=> d!162693 m!1435115))

(assert (=> b!1558655 m!1435121))

(declare-fun m!1435171 () Bool)

(assert (=> b!1558652 m!1435171))

(declare-fun m!1435173 () Bool)

(assert (=> b!1558654 m!1435173))

(declare-fun m!1435175 () Bool)

(assert (=> bm!71765 m!1435175))

(assert (=> b!1558519 d!162693))

(declare-fun d!162713 () Bool)

(assert (=> d!162713 (containsKey!843 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-fun lt!670805 () Unit!51890)

(declare-fun choose!2070 (List!36340 (_ BitVec 64) B!2440 (_ BitVec 64)) Unit!51890)

(assert (=> d!162713 (= lt!670805 (choose!2070 (t!51067 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun e!868328 () Bool)

(assert (=> d!162713 e!868328))

(declare-fun res!1066013 () Bool)

(assert (=> d!162713 (=> (not res!1066013) (not e!868328))))

(assert (=> d!162713 (= res!1066013 (isStrictlySorted!980 (t!51067 l!1292)))))

(assert (=> d!162713 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!11 (t!51067 l!1292) newKey!135 newValue!135 otherKey!62) lt!670805)))

(declare-fun b!1558692 () Bool)

(declare-fun res!1066014 () Bool)

(assert (=> b!1558692 (=> (not res!1066014) (not e!868328))))

(assert (=> b!1558692 (= res!1066014 (containsKey!843 (t!51067 l!1292) otherKey!62))))

(declare-fun b!1558693 () Bool)

(assert (=> b!1558693 (= e!868328 (not (= otherKey!62 newKey!135)))))

(assert (= (and d!162713 res!1066013) b!1558692))

(assert (= (and b!1558692 res!1066014) b!1558693))

(assert (=> d!162713 m!1435121))

(assert (=> d!162713 m!1435121))

(assert (=> d!162713 m!1435123))

(declare-fun m!1435193 () Bool)

(assert (=> d!162713 m!1435193))

(assert (=> d!162713 m!1435119))

(assert (=> b!1558692 m!1435117))

(assert (=> b!1558519 d!162713))

(declare-fun e!868332 () List!36340)

(declare-fun c!144141 () Bool)

(declare-fun call!71781 () List!36340)

(declare-fun bm!71776 () Bool)

(assert (=> bm!71776 (= call!71781 ($colon$colon!981 e!868332 (ite c!144141 (h!37782 (t!51067 l!1292)) (tuple2!24989 newKey!135 newValue!135))))))

(declare-fun c!144143 () Bool)

(assert (=> bm!71776 (= c!144143 c!144141)))

(declare-fun b!1558694 () Bool)

(declare-fun e!868330 () List!36340)

(declare-fun e!868331 () List!36340)

(assert (=> b!1558694 (= e!868330 e!868331)))

(declare-fun c!144144 () Bool)

(assert (=> b!1558694 (= c!144144 (and ((_ is Cons!36336) (t!51067 l!1292)) (= (_1!12505 (h!37782 (t!51067 l!1292))) newKey!135)))))

(declare-fun d!162719 () Bool)

(declare-fun e!868333 () Bool)

(assert (=> d!162719 e!868333))

(declare-fun res!1066016 () Bool)

(assert (=> d!162719 (=> (not res!1066016) (not e!868333))))

(declare-fun lt!670808 () List!36340)

(assert (=> d!162719 (= res!1066016 (isStrictlySorted!980 lt!670808))))

(assert (=> d!162719 (= lt!670808 e!868330)))

(assert (=> d!162719 (= c!144141 (and ((_ is Cons!36336) (t!51067 l!1292)) (bvslt (_1!12505 (h!37782 (t!51067 l!1292))) newKey!135)))))

(assert (=> d!162719 (isStrictlySorted!980 (t!51067 l!1292))))

(assert (=> d!162719 (= (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135) lt!670808)))

(declare-fun b!1558695 () Bool)

(declare-fun c!144142 () Bool)

(assert (=> b!1558695 (= e!868332 (ite c!144144 (t!51067 (t!51067 l!1292)) (ite c!144142 (Cons!36336 (h!37782 (t!51067 l!1292)) (t!51067 (t!51067 l!1292))) Nil!36337)))))

(declare-fun b!1558696 () Bool)

(declare-fun e!868329 () List!36340)

(declare-fun call!71780 () List!36340)

(assert (=> b!1558696 (= e!868329 call!71780)))

(declare-fun bm!71777 () Bool)

(declare-fun call!71779 () List!36340)

(assert (=> bm!71777 (= call!71779 call!71781)))

(declare-fun b!1558697 () Bool)

(assert (=> b!1558697 (= e!868329 call!71780)))

(declare-fun b!1558698 () Bool)

(assert (=> b!1558698 (= e!868331 call!71779)))

(declare-fun b!1558699 () Bool)

(assert (=> b!1558699 (= e!868330 call!71781)))

(declare-fun bm!71778 () Bool)

(assert (=> bm!71778 (= call!71780 call!71779)))

(declare-fun b!1558700 () Bool)

(assert (=> b!1558700 (= e!868333 (contains!10212 lt!670808 (tuple2!24989 newKey!135 newValue!135)))))

(declare-fun b!1558701 () Bool)

(assert (=> b!1558701 (= c!144142 (and ((_ is Cons!36336) (t!51067 l!1292)) (bvsgt (_1!12505 (h!37782 (t!51067 l!1292))) newKey!135)))))

(assert (=> b!1558701 (= e!868331 e!868329)))

(declare-fun b!1558702 () Bool)

(declare-fun res!1066015 () Bool)

(assert (=> b!1558702 (=> (not res!1066015) (not e!868333))))

(assert (=> b!1558702 (= res!1066015 (containsKey!843 lt!670808 newKey!135))))

(declare-fun b!1558703 () Bool)

(assert (=> b!1558703 (= e!868332 (insertStrictlySorted!571 (t!51067 (t!51067 l!1292)) newKey!135 newValue!135))))

(assert (= (and d!162719 c!144141) b!1558699))

(assert (= (and d!162719 (not c!144141)) b!1558694))

(assert (= (and b!1558694 c!144144) b!1558698))

(assert (= (and b!1558694 (not c!144144)) b!1558701))

(assert (= (and b!1558701 c!144142) b!1558697))

(assert (= (and b!1558701 (not c!144142)) b!1558696))

(assert (= (or b!1558697 b!1558696) bm!71778))

(assert (= (or b!1558698 bm!71778) bm!71777))

(assert (= (or b!1558699 bm!71777) bm!71776))

(assert (= (and bm!71776 c!144143) b!1558703))

(assert (= (and bm!71776 (not c!144143)) b!1558695))

(assert (= (and d!162719 res!1066016) b!1558702))

(assert (= (and b!1558702 res!1066015) b!1558700))

(declare-fun m!1435195 () Bool)

(assert (=> d!162719 m!1435195))

(assert (=> d!162719 m!1435119))

(declare-fun m!1435197 () Bool)

(assert (=> b!1558703 m!1435197))

(declare-fun m!1435199 () Bool)

(assert (=> b!1558700 m!1435199))

(declare-fun m!1435201 () Bool)

(assert (=> b!1558702 m!1435201))

(declare-fun m!1435203 () Bool)

(assert (=> bm!71776 m!1435203))

(assert (=> b!1558519 d!162719))

(declare-fun d!162721 () Bool)

(declare-fun res!1066019 () Bool)

(declare-fun e!868335 () Bool)

(assert (=> d!162721 (=> res!1066019 e!868335)))

(assert (=> d!162721 (= res!1066019 (or ((_ is Nil!36337) l!1292) ((_ is Nil!36337) (t!51067 l!1292))))))

(assert (=> d!162721 (= (isStrictlySorted!980 l!1292) e!868335)))

(declare-fun b!1558706 () Bool)

(declare-fun e!868336 () Bool)

(assert (=> b!1558706 (= e!868335 e!868336)))

(declare-fun res!1066020 () Bool)

(assert (=> b!1558706 (=> (not res!1066020) (not e!868336))))

(assert (=> b!1558706 (= res!1066020 (bvslt (_1!12505 (h!37782 l!1292)) (_1!12505 (h!37782 (t!51067 l!1292)))))))

(declare-fun b!1558707 () Bool)

(assert (=> b!1558707 (= e!868336 (isStrictlySorted!980 (t!51067 l!1292)))))

(assert (= (and d!162721 (not res!1066019)) b!1558706))

(assert (= (and b!1558706 res!1066020) b!1558707))

(assert (=> b!1558707 m!1435119))

(assert (=> start!133246 d!162721))

(declare-fun d!162725 () Bool)

(declare-fun res!1066023 () Bool)

(declare-fun e!868342 () Bool)

(assert (=> d!162725 (=> res!1066023 e!868342)))

(assert (=> d!162725 (= res!1066023 (and ((_ is Cons!36336) (t!51067 l!1292)) (= (_1!12505 (h!37782 (t!51067 l!1292))) otherKey!62)))))

(assert (=> d!162725 (= (containsKey!843 (t!51067 l!1292) otherKey!62) e!868342)))

(declare-fun b!1558718 () Bool)

(declare-fun e!868343 () Bool)

(assert (=> b!1558718 (= e!868342 e!868343)))

(declare-fun res!1066024 () Bool)

(assert (=> b!1558718 (=> (not res!1066024) (not e!868343))))

(assert (=> b!1558718 (= res!1066024 (and (or (not ((_ is Cons!36336) (t!51067 l!1292))) (bvsle (_1!12505 (h!37782 (t!51067 l!1292))) otherKey!62)) ((_ is Cons!36336) (t!51067 l!1292)) (bvslt (_1!12505 (h!37782 (t!51067 l!1292))) otherKey!62)))))

(declare-fun b!1558719 () Bool)

(assert (=> b!1558719 (= e!868343 (containsKey!843 (t!51067 (t!51067 l!1292)) otherKey!62))))

(assert (= (and d!162725 (not res!1066023)) b!1558718))

(assert (= (and b!1558718 res!1066024) b!1558719))

(declare-fun m!1435207 () Bool)

(assert (=> b!1558719 m!1435207))

(assert (=> b!1558518 d!162725))

(declare-fun d!162727 () Bool)

(declare-fun res!1066025 () Bool)

(declare-fun e!868344 () Bool)

(assert (=> d!162727 (=> res!1066025 e!868344)))

(assert (=> d!162727 (= res!1066025 (and ((_ is Cons!36336) l!1292) (= (_1!12505 (h!37782 l!1292)) otherKey!62)))))

(assert (=> d!162727 (= (containsKey!843 l!1292 otherKey!62) e!868344)))

(declare-fun b!1558720 () Bool)

(declare-fun e!868345 () Bool)

(assert (=> b!1558720 (= e!868344 e!868345)))

(declare-fun res!1066026 () Bool)

(assert (=> b!1558720 (=> (not res!1066026) (not e!868345))))

(assert (=> b!1558720 (= res!1066026 (and (or (not ((_ is Cons!36336) l!1292)) (bvsle (_1!12505 (h!37782 l!1292)) otherKey!62)) ((_ is Cons!36336) l!1292) (bvslt (_1!12505 (h!37782 l!1292)) otherKey!62)))))

(declare-fun b!1558721 () Bool)

(assert (=> b!1558721 (= e!868345 (containsKey!843 (t!51067 l!1292) otherKey!62))))

(assert (= (and d!162727 (not res!1066025)) b!1558720))

(assert (= (and b!1558720 res!1066026) b!1558721))

(assert (=> b!1558721 m!1435117))

(assert (=> b!1558523 d!162727))

(declare-fun b!1558736 () Bool)

(declare-fun e!868354 () Bool)

(declare-fun tp!112666 () Bool)

(assert (=> b!1558736 (= e!868354 (and tp_is_empty!38445 tp!112666))))

(assert (=> b!1558522 (= tp!112659 e!868354)))

(assert (= (and b!1558522 ((_ is Cons!36336) (t!51067 l!1292))) b!1558736))

(check-sat (not d!162713) tp_is_empty!38445 (not b!1558702) (not b!1558569) (not b!1558547) (not bm!71765) (not bm!71776) (not b!1558567) (not d!162693) (not b!1558721) (not b!1558652) (not b!1558655) (not b!1558700) (not d!162719) (not b!1558707) (not b!1558719) (not b!1558654) (not b!1558692) (not b!1558703) (not b!1558736))
(check-sat)
(get-model)

(assert (=> b!1558707 d!162679))

(declare-fun d!162733 () Bool)

(declare-fun res!1066037 () Bool)

(declare-fun e!868365 () Bool)

(assert (=> d!162733 (=> res!1066037 e!868365)))

(assert (=> d!162733 (= res!1066037 (or ((_ is Nil!36337) lt!670808) ((_ is Nil!36337) (t!51067 lt!670808))))))

(assert (=> d!162733 (= (isStrictlySorted!980 lt!670808) e!868365)))

(declare-fun b!1558755 () Bool)

(declare-fun e!868366 () Bool)

(assert (=> b!1558755 (= e!868365 e!868366)))

(declare-fun res!1066038 () Bool)

(assert (=> b!1558755 (=> (not res!1066038) (not e!868366))))

(assert (=> b!1558755 (= res!1066038 (bvslt (_1!12505 (h!37782 lt!670808)) (_1!12505 (h!37782 (t!51067 lt!670808)))))))

(declare-fun b!1558756 () Bool)

(assert (=> b!1558756 (= e!868366 (isStrictlySorted!980 (t!51067 lt!670808)))))

(assert (= (and d!162733 (not res!1066037)) b!1558755))

(assert (= (and b!1558755 res!1066038) b!1558756))

(declare-fun m!1435233 () Bool)

(assert (=> b!1558756 m!1435233))

(assert (=> d!162719 d!162733))

(assert (=> d!162719 d!162679))

(declare-fun d!162735 () Bool)

(declare-fun res!1066039 () Bool)

(declare-fun e!868367 () Bool)

(assert (=> d!162735 (=> res!1066039 e!868367)))

(assert (=> d!162735 (= res!1066039 (or ((_ is Nil!36337) (t!51067 (t!51067 l!1292))) ((_ is Nil!36337) (t!51067 (t!51067 (t!51067 l!1292))))))))

(assert (=> d!162735 (= (isStrictlySorted!980 (t!51067 (t!51067 l!1292))) e!868367)))

(declare-fun b!1558757 () Bool)

(declare-fun e!868368 () Bool)

(assert (=> b!1558757 (= e!868367 e!868368)))

(declare-fun res!1066040 () Bool)

(assert (=> b!1558757 (=> (not res!1066040) (not e!868368))))

(assert (=> b!1558757 (= res!1066040 (bvslt (_1!12505 (h!37782 (t!51067 (t!51067 l!1292)))) (_1!12505 (h!37782 (t!51067 (t!51067 (t!51067 l!1292)))))))))

(declare-fun b!1558758 () Bool)

(assert (=> b!1558758 (= e!868368 (isStrictlySorted!980 (t!51067 (t!51067 (t!51067 l!1292)))))))

(assert (= (and d!162735 (not res!1066039)) b!1558757))

(assert (= (and b!1558757 res!1066040) b!1558758))

(declare-fun m!1435235 () Bool)

(assert (=> b!1558758 m!1435235))

(assert (=> b!1558547 d!162735))

(declare-fun d!162737 () Bool)

(declare-fun res!1066041 () Bool)

(declare-fun e!868369 () Bool)

(assert (=> d!162737 (=> res!1066041 e!868369)))

(assert (=> d!162737 (= res!1066041 (and ((_ is Cons!36336) (t!51067 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135))) (= (_1!12505 (h!37782 (t!51067 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!162737 (= (containsKey!843 (t!51067 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135)) otherKey!62) e!868369)))

(declare-fun b!1558759 () Bool)

(declare-fun e!868370 () Bool)

(assert (=> b!1558759 (= e!868369 e!868370)))

(declare-fun res!1066042 () Bool)

(assert (=> b!1558759 (=> (not res!1066042) (not e!868370))))

(assert (=> b!1558759 (= res!1066042 (and (or (not ((_ is Cons!36336) (t!51067 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135)))) (bvsle (_1!12505 (h!37782 (t!51067 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135)))) otherKey!62)) ((_ is Cons!36336) (t!51067 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135))) (bvslt (_1!12505 (h!37782 (t!51067 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1558760 () Bool)

(assert (=> b!1558760 (= e!868370 (containsKey!843 (t!51067 (t!51067 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!162737 (not res!1066041)) b!1558759))

(assert (= (and b!1558759 res!1066042) b!1558760))

(declare-fun m!1435237 () Bool)

(assert (=> b!1558760 m!1435237))

(assert (=> b!1558567 d!162737))

(declare-fun d!162739 () Bool)

(declare-fun lt!670817 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!802 (List!36340) (InoxSet tuple2!24988))

(assert (=> d!162739 (= lt!670817 (select (content!802 lt!670808) (tuple2!24989 newKey!135 newValue!135)))))

(declare-fun e!868376 () Bool)

(assert (=> d!162739 (= lt!670817 e!868376)))

(declare-fun res!1066047 () Bool)

(assert (=> d!162739 (=> (not res!1066047) (not e!868376))))

(assert (=> d!162739 (= res!1066047 ((_ is Cons!36336) lt!670808))))

(assert (=> d!162739 (= (contains!10212 lt!670808 (tuple2!24989 newKey!135 newValue!135)) lt!670817)))

(declare-fun b!1558765 () Bool)

(declare-fun e!868375 () Bool)

(assert (=> b!1558765 (= e!868376 e!868375)))

(declare-fun res!1066048 () Bool)

(assert (=> b!1558765 (=> res!1066048 e!868375)))

(assert (=> b!1558765 (= res!1066048 (= (h!37782 lt!670808) (tuple2!24989 newKey!135 newValue!135)))))

(declare-fun b!1558766 () Bool)

(assert (=> b!1558766 (= e!868375 (contains!10212 (t!51067 lt!670808) (tuple2!24989 newKey!135 newValue!135)))))

(assert (= (and d!162739 res!1066047) b!1558765))

(assert (= (and b!1558765 (not res!1066048)) b!1558766))

(declare-fun m!1435239 () Bool)

(assert (=> d!162739 m!1435239))

(declare-fun m!1435241 () Bool)

(assert (=> d!162739 m!1435241))

(declare-fun m!1435243 () Bool)

(assert (=> b!1558766 m!1435243))

(assert (=> b!1558700 d!162739))

(assert (=> b!1558692 d!162725))

(declare-fun d!162741 () Bool)

(declare-fun res!1066049 () Bool)

(declare-fun e!868377 () Bool)

(assert (=> d!162741 (=> res!1066049 e!868377)))

(assert (=> d!162741 (= res!1066049 (and ((_ is Cons!36336) (t!51067 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135))) (= (_1!12505 (h!37782 (t!51067 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!162741 (= (containsKey!843 (t!51067 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)) otherKey!62) e!868377)))

(declare-fun b!1558767 () Bool)

(declare-fun e!868378 () Bool)

(assert (=> b!1558767 (= e!868377 e!868378)))

(declare-fun res!1066050 () Bool)

(assert (=> b!1558767 (=> (not res!1066050) (not e!868378))))

(assert (=> b!1558767 (= res!1066050 (and (or (not ((_ is Cons!36336) (t!51067 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)))) (bvsle (_1!12505 (h!37782 (t!51067 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)))) otherKey!62)) ((_ is Cons!36336) (t!51067 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135))) (bvslt (_1!12505 (h!37782 (t!51067 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1558768 () Bool)

(assert (=> b!1558768 (= e!868378 (containsKey!843 (t!51067 (t!51067 (insertStrictlySorted!571 l!1292 newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!162741 (not res!1066049)) b!1558767))

(assert (= (and b!1558767 res!1066050) b!1558768))

(declare-fun m!1435245 () Bool)

(assert (=> b!1558768 m!1435245))

(assert (=> b!1558569 d!162741))

(assert (=> d!162713 d!162683))

(assert (=> d!162713 d!162719))

(declare-fun d!162743 () Bool)

(assert (=> d!162743 (containsKey!843 (insertStrictlySorted!571 (t!51067 l!1292) newKey!135 newValue!135) otherKey!62)))

(assert (=> d!162743 true))

(declare-fun _$18!41 () Unit!51890)

(assert (=> d!162743 (= (choose!2070 (t!51067 l!1292) newKey!135 newValue!135 otherKey!62) _$18!41)))

(declare-fun bs!44804 () Bool)

(assert (= bs!44804 d!162743))

(assert (=> bs!44804 m!1435121))

(assert (=> bs!44804 m!1435121))

(assert (=> bs!44804 m!1435123))

(assert (=> d!162713 d!162743))

(assert (=> d!162713 d!162679))

(assert (=> b!1558721 d!162725))

(declare-fun d!162745 () Bool)

(assert (=> d!162745 (= ($colon$colon!981 e!868332 (ite c!144141 (h!37782 (t!51067 l!1292)) (tuple2!24989 newKey!135 newValue!135))) (Cons!36336 (ite c!144141 (h!37782 (t!51067 l!1292)) (tuple2!24989 newKey!135 newValue!135)) e!868332))))

(assert (=> bm!71776 d!162745))

(declare-fun d!162747 () Bool)

(declare-fun res!1066051 () Bool)

(declare-fun e!868379 () Bool)

(assert (=> d!162747 (=> res!1066051 e!868379)))

(assert (=> d!162747 (= res!1066051 (and ((_ is Cons!36336) lt!670808) (= (_1!12505 (h!37782 lt!670808)) newKey!135)))))

(assert (=> d!162747 (= (containsKey!843 lt!670808 newKey!135) e!868379)))

(declare-fun b!1558769 () Bool)

(declare-fun e!868380 () Bool)

(assert (=> b!1558769 (= e!868379 e!868380)))

(declare-fun res!1066052 () Bool)

(assert (=> b!1558769 (=> (not res!1066052) (not e!868380))))

(assert (=> b!1558769 (= res!1066052 (and (or (not ((_ is Cons!36336) lt!670808)) (bvsle (_1!12505 (h!37782 lt!670808)) newKey!135)) ((_ is Cons!36336) lt!670808) (bvslt (_1!12505 (h!37782 lt!670808)) newKey!135)))))

(declare-fun b!1558770 () Bool)

(assert (=> b!1558770 (= e!868380 (containsKey!843 (t!51067 lt!670808) newKey!135))))

(assert (= (and d!162747 (not res!1066051)) b!1558769))

(assert (= (and b!1558769 res!1066052) b!1558770))

(declare-fun m!1435247 () Bool)

(assert (=> b!1558770 m!1435247))

(assert (=> b!1558702 d!162747))

(declare-fun d!162749 () Bool)

(declare-fun lt!670818 () Bool)

(assert (=> d!162749 (= lt!670818 (select (content!802 lt!670800) (tuple2!24989 newKey!135 newValue!135)))))

(declare-fun e!868382 () Bool)

(assert (=> d!162749 (= lt!670818 e!868382)))

(declare-fun res!1066053 () Bool)

(assert (=> d!162749 (=> (not res!1066053) (not e!868382))))

(assert (=> d!162749 (= res!1066053 ((_ is Cons!36336) lt!670800))))

(assert (=> d!162749 (= (contains!10212 lt!670800 (tuple2!24989 newKey!135 newValue!135)) lt!670818)))

(declare-fun b!1558771 () Bool)

(declare-fun e!868381 () Bool)

(assert (=> b!1558771 (= e!868382 e!868381)))

(declare-fun res!1066054 () Bool)

(assert (=> b!1558771 (=> res!1066054 e!868381)))

(assert (=> b!1558771 (= res!1066054 (= (h!37782 lt!670800) (tuple2!24989 newKey!135 newValue!135)))))

(declare-fun b!1558772 () Bool)

(assert (=> b!1558772 (= e!868381 (contains!10212 (t!51067 lt!670800) (tuple2!24989 newKey!135 newValue!135)))))

(assert (= (and d!162749 res!1066053) b!1558771))

(assert (= (and b!1558771 (not res!1066054)) b!1558772))

(declare-fun m!1435249 () Bool)

(assert (=> d!162749 m!1435249))

(declare-fun m!1435251 () Bool)

(assert (=> d!162749 m!1435251))

(declare-fun m!1435253 () Bool)

(assert (=> b!1558772 m!1435253))

(assert (=> b!1558652 d!162749))

(assert (=> b!1558655 d!162719))

(declare-fun d!162751 () Bool)

(declare-fun res!1066055 () Bool)

(declare-fun e!868383 () Bool)

(assert (=> d!162751 (=> res!1066055 e!868383)))

(assert (=> d!162751 (= res!1066055 (or ((_ is Nil!36337) lt!670800) ((_ is Nil!36337) (t!51067 lt!670800))))))

(assert (=> d!162751 (= (isStrictlySorted!980 lt!670800) e!868383)))

(declare-fun b!1558773 () Bool)

(declare-fun e!868384 () Bool)

(assert (=> b!1558773 (= e!868383 e!868384)))

(declare-fun res!1066056 () Bool)

(assert (=> b!1558773 (=> (not res!1066056) (not e!868384))))

(assert (=> b!1558773 (= res!1066056 (bvslt (_1!12505 (h!37782 lt!670800)) (_1!12505 (h!37782 (t!51067 lt!670800)))))))

(declare-fun b!1558774 () Bool)

(assert (=> b!1558774 (= e!868384 (isStrictlySorted!980 (t!51067 lt!670800)))))

(assert (= (and d!162751 (not res!1066055)) b!1558773))

(assert (= (and b!1558773 res!1066056) b!1558774))

(declare-fun m!1435255 () Bool)

(assert (=> b!1558774 m!1435255))

(assert (=> d!162693 d!162751))

(assert (=> d!162693 d!162721))

(declare-fun d!162753 () Bool)

(assert (=> d!162753 (= ($colon$colon!981 e!868308 (ite c!144127 (h!37782 l!1292) (tuple2!24989 newKey!135 newValue!135))) (Cons!36336 (ite c!144127 (h!37782 l!1292) (tuple2!24989 newKey!135 newValue!135)) e!868308))))

(assert (=> bm!71765 d!162753))

(declare-fun d!162755 () Bool)

(declare-fun res!1066057 () Bool)

(declare-fun e!868385 () Bool)

(assert (=> d!162755 (=> res!1066057 e!868385)))

(assert (=> d!162755 (= res!1066057 (and ((_ is Cons!36336) (t!51067 (t!51067 l!1292))) (= (_1!12505 (h!37782 (t!51067 (t!51067 l!1292)))) otherKey!62)))))

(assert (=> d!162755 (= (containsKey!843 (t!51067 (t!51067 l!1292)) otherKey!62) e!868385)))

(declare-fun b!1558775 () Bool)

(declare-fun e!868386 () Bool)

(assert (=> b!1558775 (= e!868385 e!868386)))

(declare-fun res!1066058 () Bool)

(assert (=> b!1558775 (=> (not res!1066058) (not e!868386))))

(assert (=> b!1558775 (= res!1066058 (and (or (not ((_ is Cons!36336) (t!51067 (t!51067 l!1292)))) (bvsle (_1!12505 (h!37782 (t!51067 (t!51067 l!1292)))) otherKey!62)) ((_ is Cons!36336) (t!51067 (t!51067 l!1292))) (bvslt (_1!12505 (h!37782 (t!51067 (t!51067 l!1292)))) otherKey!62)))))

(declare-fun b!1558776 () Bool)

(assert (=> b!1558776 (= e!868386 (containsKey!843 (t!51067 (t!51067 (t!51067 l!1292))) otherKey!62))))

(assert (= (and d!162755 (not res!1066057)) b!1558775))

(assert (= (and b!1558775 res!1066058) b!1558776))

(declare-fun m!1435257 () Bool)

(assert (=> b!1558776 m!1435257))

(assert (=> b!1558719 d!162755))

(declare-fun call!71790 () List!36340)

(declare-fun bm!71785 () Bool)

(declare-fun c!144153 () Bool)

(declare-fun e!868390 () List!36340)

(assert (=> bm!71785 (= call!71790 ($colon$colon!981 e!868390 (ite c!144153 (h!37782 (t!51067 (t!51067 l!1292))) (tuple2!24989 newKey!135 newValue!135))))))

(declare-fun c!144155 () Bool)

(assert (=> bm!71785 (= c!144155 c!144153)))

(declare-fun b!1558777 () Bool)

(declare-fun e!868388 () List!36340)

(declare-fun e!868389 () List!36340)

(assert (=> b!1558777 (= e!868388 e!868389)))

(declare-fun c!144156 () Bool)

(assert (=> b!1558777 (= c!144156 (and ((_ is Cons!36336) (t!51067 (t!51067 l!1292))) (= (_1!12505 (h!37782 (t!51067 (t!51067 l!1292)))) newKey!135)))))

(declare-fun d!162757 () Bool)

(declare-fun e!868391 () Bool)

(assert (=> d!162757 e!868391))

(declare-fun res!1066060 () Bool)

(assert (=> d!162757 (=> (not res!1066060) (not e!868391))))

(declare-fun lt!670819 () List!36340)

(assert (=> d!162757 (= res!1066060 (isStrictlySorted!980 lt!670819))))

(assert (=> d!162757 (= lt!670819 e!868388)))

(assert (=> d!162757 (= c!144153 (and ((_ is Cons!36336) (t!51067 (t!51067 l!1292))) (bvslt (_1!12505 (h!37782 (t!51067 (t!51067 l!1292)))) newKey!135)))))

(assert (=> d!162757 (isStrictlySorted!980 (t!51067 (t!51067 l!1292)))))

(assert (=> d!162757 (= (insertStrictlySorted!571 (t!51067 (t!51067 l!1292)) newKey!135 newValue!135) lt!670819)))

(declare-fun b!1558778 () Bool)

(declare-fun c!144154 () Bool)

(assert (=> b!1558778 (= e!868390 (ite c!144156 (t!51067 (t!51067 (t!51067 l!1292))) (ite c!144154 (Cons!36336 (h!37782 (t!51067 (t!51067 l!1292))) (t!51067 (t!51067 (t!51067 l!1292)))) Nil!36337)))))

(declare-fun b!1558779 () Bool)

(declare-fun e!868387 () List!36340)

(declare-fun call!71789 () List!36340)

(assert (=> b!1558779 (= e!868387 call!71789)))

(declare-fun bm!71786 () Bool)

(declare-fun call!71788 () List!36340)

(assert (=> bm!71786 (= call!71788 call!71790)))

(declare-fun b!1558780 () Bool)

(assert (=> b!1558780 (= e!868387 call!71789)))

(declare-fun b!1558781 () Bool)

(assert (=> b!1558781 (= e!868389 call!71788)))

(declare-fun b!1558782 () Bool)

(assert (=> b!1558782 (= e!868388 call!71790)))

(declare-fun bm!71787 () Bool)

(assert (=> bm!71787 (= call!71789 call!71788)))

(declare-fun b!1558783 () Bool)

(assert (=> b!1558783 (= e!868391 (contains!10212 lt!670819 (tuple2!24989 newKey!135 newValue!135)))))

(declare-fun b!1558784 () Bool)

(assert (=> b!1558784 (= c!144154 (and ((_ is Cons!36336) (t!51067 (t!51067 l!1292))) (bvsgt (_1!12505 (h!37782 (t!51067 (t!51067 l!1292)))) newKey!135)))))

(assert (=> b!1558784 (= e!868389 e!868387)))

(declare-fun b!1558785 () Bool)

(declare-fun res!1066059 () Bool)

(assert (=> b!1558785 (=> (not res!1066059) (not e!868391))))

(assert (=> b!1558785 (= res!1066059 (containsKey!843 lt!670819 newKey!135))))

(declare-fun b!1558786 () Bool)

(assert (=> b!1558786 (= e!868390 (insertStrictlySorted!571 (t!51067 (t!51067 (t!51067 l!1292))) newKey!135 newValue!135))))

(assert (= (and d!162757 c!144153) b!1558782))

(assert (= (and d!162757 (not c!144153)) b!1558777))

(assert (= (and b!1558777 c!144156) b!1558781))

(assert (= (and b!1558777 (not c!144156)) b!1558784))

(assert (= (and b!1558784 c!144154) b!1558780))

(assert (= (and b!1558784 (not c!144154)) b!1558779))

(assert (= (or b!1558780 b!1558779) bm!71787))

(assert (= (or b!1558781 bm!71787) bm!71786))

(assert (= (or b!1558782 bm!71786) bm!71785))

(assert (= (and bm!71785 c!144155) b!1558786))

(assert (= (and bm!71785 (not c!144155)) b!1558778))

(assert (= (and d!162757 res!1066060) b!1558785))

(assert (= (and b!1558785 res!1066059) b!1558783))

(declare-fun m!1435259 () Bool)

(assert (=> d!162757 m!1435259))

(assert (=> d!162757 m!1435149))

(declare-fun m!1435261 () Bool)

(assert (=> b!1558786 m!1435261))

(declare-fun m!1435263 () Bool)

(assert (=> b!1558783 m!1435263))

(declare-fun m!1435265 () Bool)

(assert (=> b!1558785 m!1435265))

(declare-fun m!1435267 () Bool)

(assert (=> bm!71785 m!1435267))

(assert (=> b!1558703 d!162757))

(declare-fun d!162759 () Bool)

(declare-fun res!1066061 () Bool)

(declare-fun e!868392 () Bool)

(assert (=> d!162759 (=> res!1066061 e!868392)))

(assert (=> d!162759 (= res!1066061 (and ((_ is Cons!36336) lt!670800) (= (_1!12505 (h!37782 lt!670800)) newKey!135)))))

(assert (=> d!162759 (= (containsKey!843 lt!670800 newKey!135) e!868392)))

(declare-fun b!1558787 () Bool)

(declare-fun e!868393 () Bool)

(assert (=> b!1558787 (= e!868392 e!868393)))

(declare-fun res!1066062 () Bool)

(assert (=> b!1558787 (=> (not res!1066062) (not e!868393))))

(assert (=> b!1558787 (= res!1066062 (and (or (not ((_ is Cons!36336) lt!670800)) (bvsle (_1!12505 (h!37782 lt!670800)) newKey!135)) ((_ is Cons!36336) lt!670800) (bvslt (_1!12505 (h!37782 lt!670800)) newKey!135)))))

(declare-fun b!1558788 () Bool)

(assert (=> b!1558788 (= e!868393 (containsKey!843 (t!51067 lt!670800) newKey!135))))

(assert (= (and d!162759 (not res!1066061)) b!1558787))

(assert (= (and b!1558787 res!1066062) b!1558788))

(declare-fun m!1435269 () Bool)

(assert (=> b!1558788 m!1435269))

(assert (=> b!1558654 d!162759))

(declare-fun b!1558789 () Bool)

(declare-fun e!868394 () Bool)

(declare-fun tp!112672 () Bool)

(assert (=> b!1558789 (= e!868394 (and tp_is_empty!38445 tp!112672))))

(assert (=> b!1558736 (= tp!112666 e!868394)))

(assert (= (and b!1558736 ((_ is Cons!36336) (t!51067 (t!51067 l!1292)))) b!1558789))

(check-sat (not b!1558785) (not b!1558768) (not b!1558786) (not b!1558789) tp_is_empty!38445 (not b!1558772) (not b!1558770) (not d!162739) (not b!1558758) (not bm!71785) (not b!1558783) (not b!1558776) (not b!1558766) (not d!162757) (not d!162749) (not b!1558760) (not b!1558788) (not b!1558756) (not d!162743) (not b!1558774))
(check-sat)
