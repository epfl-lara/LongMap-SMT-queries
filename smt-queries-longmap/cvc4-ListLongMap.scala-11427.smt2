; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133248 () Bool)

(assert start!133248)

(declare-fun b!1558536 () Bool)

(declare-fun res!1065934 () Bool)

(declare-fun e!868226 () Bool)

(assert (=> b!1558536 (=> (not res!1065934) (not e!868226))))

(declare-datatypes ((B!2442 0))(
  ( (B!2443 (val!19307 Int)) )
))
(declare-datatypes ((tuple2!24990 0))(
  ( (tuple2!24991 (_1!12506 (_ BitVec 64)) (_2!12506 B!2442)) )
))
(declare-datatypes ((List!36341 0))(
  ( (Nil!36338) (Cons!36337 (h!37783 tuple2!24990) (t!51068 List!36341)) )
))
(declare-fun l!1292 () List!36341)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!844 (List!36341 (_ BitVec 64)) Bool)

(assert (=> b!1558536 (= res!1065934 (containsKey!844 (t!51068 l!1292) otherKey!62))))

(declare-fun b!1558537 () Bool)

(declare-fun e!868225 () Bool)

(declare-fun tp_is_empty!38447 () Bool)

(declare-fun tp!112662 () Bool)

(assert (=> b!1558537 (= e!868225 (and tp_is_empty!38447 tp!112662))))

(declare-fun res!1065932 () Bool)

(assert (=> start!133248 (=> (not res!1065932) (not e!868226))))

(declare-fun isStrictlySorted!981 (List!36341) Bool)

(assert (=> start!133248 (= res!1065932 (isStrictlySorted!981 l!1292))))

(assert (=> start!133248 e!868226))

(assert (=> start!133248 e!868225))

(assert (=> start!133248 true))

(assert (=> start!133248 tp_is_empty!38447))

(declare-fun b!1558538 () Bool)

(declare-fun res!1065933 () Bool)

(assert (=> b!1558538 (=> (not res!1065933) (not e!868226))))

(assert (=> b!1558538 (= res!1065933 (containsKey!844 l!1292 otherKey!62))))

(declare-fun b!1558539 () Bool)

(declare-fun res!1065930 () Bool)

(assert (=> b!1558539 (=> (not res!1065930) (not e!868226))))

(declare-fun newKey!135 () (_ BitVec 64))

(assert (=> b!1558539 (= res!1065930 (and (not (= otherKey!62 newKey!135)) (is-Cons!36337 l!1292) (not (= (_1!12506 (h!37783 l!1292)) otherKey!62))))))

(declare-fun b!1558540 () Bool)

(declare-fun res!1065931 () Bool)

(assert (=> b!1558540 (=> (not res!1065931) (not e!868226))))

(assert (=> b!1558540 (= res!1065931 (isStrictlySorted!981 (t!51068 l!1292)))))

(declare-fun b!1558541 () Bool)

(declare-fun newValue!135 () B!2442)

(declare-fun insertStrictlySorted!572 (List!36341 (_ BitVec 64) B!2442) List!36341)

(assert (=> b!1558541 (= e!868226 (not (containsKey!844 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135) otherKey!62)))))

(assert (=> b!1558541 (containsKey!844 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51892 0))(
  ( (Unit!51893) )
))
(declare-fun lt!670793 () Unit!51892)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!12 (List!36341 (_ BitVec 64) B!2442 (_ BitVec 64)) Unit!51892)

(assert (=> b!1558541 (= lt!670793 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!12 (t!51068 l!1292) newKey!135 newValue!135 otherKey!62))))

(assert (= (and start!133248 res!1065932) b!1558538))

(assert (= (and b!1558538 res!1065933) b!1558539))

(assert (= (and b!1558539 res!1065930) b!1558540))

(assert (= (and b!1558540 res!1065931) b!1558536))

(assert (= (and b!1558536 res!1065934) b!1558541))

(assert (= (and start!133248 (is-Cons!36337 l!1292)) b!1558537))

(declare-fun m!1435131 () Bool)

(assert (=> b!1558541 m!1435131))

(declare-fun m!1435133 () Bool)

(assert (=> b!1558541 m!1435133))

(assert (=> b!1558541 m!1435131))

(declare-fun m!1435135 () Bool)

(assert (=> b!1558541 m!1435135))

(declare-fun m!1435137 () Bool)

(assert (=> b!1558541 m!1435137))

(assert (=> b!1558541 m!1435135))

(declare-fun m!1435139 () Bool)

(assert (=> b!1558541 m!1435139))

(declare-fun m!1435141 () Bool)

(assert (=> start!133248 m!1435141))

(declare-fun m!1435143 () Bool)

(assert (=> b!1558540 m!1435143))

(declare-fun m!1435145 () Bool)

(assert (=> b!1558536 m!1435145))

(declare-fun m!1435147 () Bool)

(assert (=> b!1558538 m!1435147))

(push 1)

(assert (not start!133248))

(assert tp_is_empty!38447)

(assert (not b!1558541))

(assert (not b!1558538))

(assert (not b!1558540))

(assert (not b!1558536))

(assert (not b!1558537))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162681 () Bool)

(declare-fun res!1065945 () Bool)

(declare-fun e!868237 () Bool)

(assert (=> d!162681 (=> res!1065945 e!868237)))

(assert (=> d!162681 (= res!1065945 (and (is-Cons!36337 l!1292) (= (_1!12506 (h!37783 l!1292)) otherKey!62)))))

(assert (=> d!162681 (= (containsKey!844 l!1292 otherKey!62) e!868237)))

(declare-fun b!1558552 () Bool)

(declare-fun e!868238 () Bool)

(assert (=> b!1558552 (= e!868237 e!868238)))

(declare-fun res!1065946 () Bool)

(assert (=> b!1558552 (=> (not res!1065946) (not e!868238))))

(assert (=> b!1558552 (= res!1065946 (and (or (not (is-Cons!36337 l!1292)) (bvsle (_1!12506 (h!37783 l!1292)) otherKey!62)) (is-Cons!36337 l!1292) (bvslt (_1!12506 (h!37783 l!1292)) otherKey!62)))))

(declare-fun b!1558553 () Bool)

(assert (=> b!1558553 (= e!868238 (containsKey!844 (t!51068 l!1292) otherKey!62))))

(assert (= (and d!162681 (not res!1065945)) b!1558552))

(assert (= (and b!1558552 res!1065946) b!1558553))

(assert (=> b!1558553 m!1435145))

(assert (=> b!1558538 d!162681))

(declare-fun d!162687 () Bool)

(declare-fun res!1065965 () Bool)

(declare-fun e!868257 () Bool)

(assert (=> d!162687 (=> res!1065965 e!868257)))

(assert (=> d!162687 (= res!1065965 (or (is-Nil!36338 l!1292) (is-Nil!36338 (t!51068 l!1292))))))

(assert (=> d!162687 (= (isStrictlySorted!981 l!1292) e!868257)))

(declare-fun b!1558572 () Bool)

(declare-fun e!868258 () Bool)

(assert (=> b!1558572 (= e!868257 e!868258)))

(declare-fun res!1065966 () Bool)

(assert (=> b!1558572 (=> (not res!1065966) (not e!868258))))

(assert (=> b!1558572 (= res!1065966 (bvslt (_1!12506 (h!37783 l!1292)) (_1!12506 (h!37783 (t!51068 l!1292)))))))

(declare-fun b!1558573 () Bool)

(assert (=> b!1558573 (= e!868258 (isStrictlySorted!981 (t!51068 l!1292)))))

(assert (= (and d!162687 (not res!1065965)) b!1558572))

(assert (= (and b!1558572 res!1065966) b!1558573))

(assert (=> b!1558573 m!1435143))

(assert (=> start!133248 d!162687))

(declare-fun d!162695 () Bool)

(declare-fun res!1065969 () Bool)

(declare-fun e!868261 () Bool)

(assert (=> d!162695 (=> res!1065969 e!868261)))

(assert (=> d!162695 (= res!1065969 (and (is-Cons!36337 (t!51068 l!1292)) (= (_1!12506 (h!37783 (t!51068 l!1292))) otherKey!62)))))

(assert (=> d!162695 (= (containsKey!844 (t!51068 l!1292) otherKey!62) e!868261)))

(declare-fun b!1558576 () Bool)

(declare-fun e!868262 () Bool)

(assert (=> b!1558576 (= e!868261 e!868262)))

(declare-fun res!1065970 () Bool)

(assert (=> b!1558576 (=> (not res!1065970) (not e!868262))))

(assert (=> b!1558576 (= res!1065970 (and (or (not (is-Cons!36337 (t!51068 l!1292))) (bvsle (_1!12506 (h!37783 (t!51068 l!1292))) otherKey!62)) (is-Cons!36337 (t!51068 l!1292)) (bvslt (_1!12506 (h!37783 (t!51068 l!1292))) otherKey!62)))))

(declare-fun b!1558577 () Bool)

(assert (=> b!1558577 (= e!868262 (containsKey!844 (t!51068 (t!51068 l!1292)) otherKey!62))))

(assert (= (and d!162695 (not res!1065969)) b!1558576))

(assert (= (and b!1558576 res!1065970) b!1558577))

(declare-fun m!1435157 () Bool)

(assert (=> b!1558577 m!1435157))

(assert (=> b!1558536 d!162695))

(declare-fun d!162699 () Bool)

(declare-fun res!1065971 () Bool)

(declare-fun e!868263 () Bool)

(assert (=> d!162699 (=> res!1065971 e!868263)))

(assert (=> d!162699 (= res!1065971 (and (is-Cons!36337 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135)) (= (_1!12506 (h!37783 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162699 (= (containsKey!844 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135) otherKey!62) e!868263)))

(declare-fun b!1558578 () Bool)

(declare-fun e!868264 () Bool)

(assert (=> b!1558578 (= e!868263 e!868264)))

(declare-fun res!1065972 () Bool)

(assert (=> b!1558578 (=> (not res!1065972) (not e!868264))))

(assert (=> b!1558578 (= res!1065972 (and (or (not (is-Cons!36337 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135))) (bvsle (_1!12506 (h!37783 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135))) otherKey!62)) (is-Cons!36337 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135)) (bvslt (_1!12506 (h!37783 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1558579 () Bool)

(assert (=> b!1558579 (= e!868264 (containsKey!844 (t!51068 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162699 (not res!1065971)) b!1558578))

(assert (= (and b!1558578 res!1065972) b!1558579))

(declare-fun m!1435159 () Bool)

(assert (=> b!1558579 m!1435159))

(assert (=> b!1558541 d!162699))

(declare-fun d!162701 () Bool)

(declare-fun res!1065973 () Bool)

(declare-fun e!868265 () Bool)

(assert (=> d!162701 (=> res!1065973 e!868265)))

(assert (=> d!162701 (= res!1065973 (and (is-Cons!36337 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)) (= (_1!12506 (h!37783 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162701 (= (containsKey!844 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135) otherKey!62) e!868265)))

(declare-fun b!1558580 () Bool)

(declare-fun e!868266 () Bool)

(assert (=> b!1558580 (= e!868265 e!868266)))

(declare-fun res!1065974 () Bool)

(assert (=> b!1558580 (=> (not res!1065974) (not e!868266))))

(assert (=> b!1558580 (= res!1065974 (and (or (not (is-Cons!36337 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135))) (bvsle (_1!12506 (h!37783 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135))) otherKey!62)) (is-Cons!36337 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)) (bvslt (_1!12506 (h!37783 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1558581 () Bool)

(assert (=> b!1558581 (= e!868266 (containsKey!844 (t!51068 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162701 (not res!1065973)) b!1558580))

(assert (= (and b!1558580 res!1065974) b!1558581))

(declare-fun m!1435161 () Bool)

(assert (=> b!1558581 m!1435161))

(assert (=> b!1558541 d!162701))

(declare-fun bm!71770 () Bool)

(declare-fun call!71775 () List!36341)

(declare-fun call!71774 () List!36341)

(assert (=> bm!71770 (= call!71775 call!71774)))

(declare-fun lt!670801 () List!36341)

(declare-fun b!1558664 () Bool)

(declare-fun e!868318 () Bool)

(declare-fun contains!10213 (List!36341 tuple2!24990) Bool)

(assert (=> b!1558664 (= e!868318 (contains!10213 lt!670801 (tuple2!24991 newKey!135 newValue!135)))))

(declare-fun b!1558665 () Bool)

(declare-fun e!868315 () List!36341)

(declare-fun call!71773 () List!36341)

(assert (=> b!1558665 (= e!868315 call!71773)))

(declare-fun b!1558666 () Bool)

(declare-fun e!868314 () List!36341)

(declare-fun e!868316 () List!36341)

(assert (=> b!1558666 (= e!868314 e!868316)))

(declare-fun c!144136 () Bool)

(assert (=> b!1558666 (= c!144136 (and (is-Cons!36337 l!1292) (= (_1!12506 (h!37783 l!1292)) newKey!135)))))

(declare-fun b!1558668 () Bool)

(assert (=> b!1558668 (= e!868316 call!71775)))

(declare-fun b!1558669 () Bool)

(assert (=> b!1558669 (= e!868314 call!71774)))

(declare-fun b!1558670 () Bool)

(declare-fun c!144135 () Bool)

(assert (=> b!1558670 (= c!144135 (and (is-Cons!36337 l!1292) (bvsgt (_1!12506 (h!37783 l!1292)) newKey!135)))))

(assert (=> b!1558670 (= e!868316 e!868315)))

(declare-fun e!868317 () List!36341)

(declare-fun b!1558671 () Bool)

(assert (=> b!1558671 (= e!868317 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135))))

(declare-fun b!1558672 () Bool)

(declare-fun res!1066002 () Bool)

(assert (=> b!1558672 (=> (not res!1066002) (not e!868318))))

(assert (=> b!1558672 (= res!1066002 (containsKey!844 lt!670801 newKey!135))))

(declare-fun bm!71771 () Bool)

(assert (=> bm!71771 (= call!71773 call!71775)))

(declare-fun c!144133 () Bool)

(declare-fun bm!71772 () Bool)

(declare-fun $colon$colon!983 (List!36341 tuple2!24990) List!36341)

(assert (=> bm!71772 (= call!71774 ($colon$colon!983 e!868317 (ite c!144133 (h!37783 l!1292) (tuple2!24991 newKey!135 newValue!135))))))

(declare-fun c!144134 () Bool)

(assert (=> bm!71772 (= c!144134 c!144133)))

(declare-fun b!1558673 () Bool)

(assert (=> b!1558673 (= e!868315 call!71773)))

(declare-fun b!1558667 () Bool)

(assert (=> b!1558667 (= e!868317 (ite c!144136 (t!51068 l!1292) (ite c!144135 (Cons!36337 (h!37783 l!1292) (t!51068 l!1292)) Nil!36338)))))

(declare-fun d!162703 () Bool)

(assert (=> d!162703 e!868318))

(declare-fun res!1066001 () Bool)

(assert (=> d!162703 (=> (not res!1066001) (not e!868318))))

(assert (=> d!162703 (= res!1066001 (isStrictlySorted!981 lt!670801))))

(assert (=> d!162703 (= lt!670801 e!868314)))

(assert (=> d!162703 (= c!144133 (and (is-Cons!36337 l!1292) (bvslt (_1!12506 (h!37783 l!1292)) newKey!135)))))

(assert (=> d!162703 (isStrictlySorted!981 l!1292)))

(assert (=> d!162703 (= (insertStrictlySorted!572 l!1292 newKey!135 newValue!135) lt!670801)))

(assert (= (and d!162703 c!144133) b!1558669))

(assert (= (and d!162703 (not c!144133)) b!1558666))

(assert (= (and b!1558666 c!144136) b!1558668))

(assert (= (and b!1558666 (not c!144136)) b!1558670))

(assert (= (and b!1558670 c!144135) b!1558673))

(assert (= (and b!1558670 (not c!144135)) b!1558665))

(assert (= (or b!1558673 b!1558665) bm!71771))

(assert (= (or b!1558668 bm!71771) bm!71770))

(assert (= (or b!1558669 bm!71770) bm!71772))

(assert (= (and bm!71772 c!144134) b!1558671))

(assert (= (and bm!71772 (not c!144134)) b!1558667))

(assert (= (and d!162703 res!1066001) b!1558672))

(assert (= (and b!1558672 res!1066002) b!1558664))

(assert (=> b!1558671 m!1435131))

(declare-fun m!1435177 () Bool)

(assert (=> b!1558664 m!1435177))

(declare-fun m!1435179 () Bool)

(assert (=> d!162703 m!1435179))

(assert (=> d!162703 m!1435141))

(declare-fun m!1435181 () Bool)

(assert (=> b!1558672 m!1435181))

(declare-fun m!1435183 () Bool)

(assert (=> bm!71772 m!1435183))

(assert (=> b!1558541 d!162703))

(declare-fun d!162715 () Bool)

(assert (=> d!162715 (containsKey!844 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-fun lt!670809 () Unit!51892)

(declare-fun choose!2071 (List!36341 (_ BitVec 64) B!2442 (_ BitVec 64)) Unit!51892)

(assert (=> d!162715 (= lt!670809 (choose!2071 (t!51068 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun e!868334 () Bool)

(assert (=> d!162715 e!868334))

(declare-fun res!1066017 () Bool)

(assert (=> d!162715 (=> (not res!1066017) (not e!868334))))

(assert (=> d!162715 (= res!1066017 (isStrictlySorted!981 (t!51068 l!1292)))))

(assert (=> d!162715 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!12 (t!51068 l!1292) newKey!135 newValue!135 otherKey!62) lt!670809)))

(declare-fun b!1558704 () Bool)

(declare-fun res!1066018 () Bool)

(assert (=> b!1558704 (=> (not res!1066018) (not e!868334))))

(assert (=> b!1558704 (= res!1066018 (containsKey!844 (t!51068 l!1292) otherKey!62))))

(declare-fun b!1558705 () Bool)

(assert (=> b!1558705 (= e!868334 (not (= otherKey!62 newKey!135)))))

(assert (= (and d!162715 res!1066017) b!1558704))

(assert (= (and b!1558704 res!1066018) b!1558705))

(assert (=> d!162715 m!1435131))

(assert (=> d!162715 m!1435131))

(assert (=> d!162715 m!1435133))

(declare-fun m!1435205 () Bool)

(assert (=> d!162715 m!1435205))

(assert (=> d!162715 m!1435143))

(assert (=> b!1558704 m!1435145))

(assert (=> b!1558541 d!162715))

(declare-fun bm!71779 () Bool)

(declare-fun call!71784 () List!36341)

(declare-fun call!71783 () List!36341)

(assert (=> bm!71779 (= call!71784 call!71783)))

(declare-fun e!868341 () Bool)

(declare-fun lt!670810 () List!36341)

(declare-fun b!1558708 () Bool)

(assert (=> b!1558708 (= e!868341 (contains!10213 lt!670810 (tuple2!24991 newKey!135 newValue!135)))))

(declare-fun b!1558709 () Bool)

(declare-fun e!868338 () List!36341)

(declare-fun call!71782 () List!36341)

(assert (=> b!1558709 (= e!868338 call!71782)))

(declare-fun b!1558710 () Bool)

(declare-fun e!868337 () List!36341)

(declare-fun e!868339 () List!36341)

(assert (=> b!1558710 (= e!868337 e!868339)))

(declare-fun c!144148 () Bool)

(assert (=> b!1558710 (= c!144148 (and (is-Cons!36337 (t!51068 l!1292)) (= (_1!12506 (h!37783 (t!51068 l!1292))) newKey!135)))))

(declare-fun b!1558712 () Bool)

(assert (=> b!1558712 (= e!868339 call!71784)))

(declare-fun b!1558713 () Bool)

(assert (=> b!1558713 (= e!868337 call!71783)))

(declare-fun b!1558714 () Bool)

(declare-fun c!144147 () Bool)

(assert (=> b!1558714 (= c!144147 (and (is-Cons!36337 (t!51068 l!1292)) (bvsgt (_1!12506 (h!37783 (t!51068 l!1292))) newKey!135)))))

(assert (=> b!1558714 (= e!868339 e!868338)))

(declare-fun e!868340 () List!36341)

(declare-fun b!1558715 () Bool)

(assert (=> b!1558715 (= e!868340 (insertStrictlySorted!572 (t!51068 (t!51068 l!1292)) newKey!135 newValue!135))))

(declare-fun b!1558716 () Bool)

(declare-fun res!1066022 () Bool)

(assert (=> b!1558716 (=> (not res!1066022) (not e!868341))))

(assert (=> b!1558716 (= res!1066022 (containsKey!844 lt!670810 newKey!135))))

(declare-fun bm!71780 () Bool)

(assert (=> bm!71780 (= call!71782 call!71784)))

(declare-fun bm!71781 () Bool)

(declare-fun c!144145 () Bool)

(assert (=> bm!71781 (= call!71783 ($colon$colon!983 e!868340 (ite c!144145 (h!37783 (t!51068 l!1292)) (tuple2!24991 newKey!135 newValue!135))))))

(declare-fun c!144146 () Bool)

(assert (=> bm!71781 (= c!144146 c!144145)))

(declare-fun b!1558717 () Bool)

(assert (=> b!1558717 (= e!868338 call!71782)))

(declare-fun b!1558711 () Bool)

(assert (=> b!1558711 (= e!868340 (ite c!144148 (t!51068 (t!51068 l!1292)) (ite c!144147 (Cons!36337 (h!37783 (t!51068 l!1292)) (t!51068 (t!51068 l!1292))) Nil!36338)))))

(declare-fun d!162723 () Bool)

(assert (=> d!162723 e!868341))

(declare-fun res!1066021 () Bool)

(assert (=> d!162723 (=> (not res!1066021) (not e!868341))))

(assert (=> d!162723 (= res!1066021 (isStrictlySorted!981 lt!670810))))

(assert (=> d!162723 (= lt!670810 e!868337)))

(assert (=> d!162723 (= c!144145 (and (is-Cons!36337 (t!51068 l!1292)) (bvslt (_1!12506 (h!37783 (t!51068 l!1292))) newKey!135)))))

(assert (=> d!162723 (isStrictlySorted!981 (t!51068 l!1292))))

(assert (=> d!162723 (= (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135) lt!670810)))

(assert (= (and d!162723 c!144145) b!1558713))

(assert (= (and d!162723 (not c!144145)) b!1558710))

(assert (= (and b!1558710 c!144148) b!1558712))

(assert (= (and b!1558710 (not c!144148)) b!1558714))

(assert (= (and b!1558714 c!144147) b!1558717))

(assert (= (and b!1558714 (not c!144147)) b!1558709))

(assert (= (or b!1558717 b!1558709) bm!71780))

(assert (= (or b!1558712 bm!71780) bm!71779))

(assert (= (or b!1558713 bm!71779) bm!71781))

(assert (= (and bm!71781 c!144146) b!1558715))

(assert (= (and bm!71781 (not c!144146)) b!1558711))

(assert (= (and d!162723 res!1066021) b!1558716))

(assert (= (and b!1558716 res!1066022) b!1558708))

(declare-fun m!1435209 () Bool)

(assert (=> b!1558715 m!1435209))

(declare-fun m!1435211 () Bool)

(assert (=> b!1558708 m!1435211))

(declare-fun m!1435213 () Bool)

(assert (=> d!162723 m!1435213))

(assert (=> d!162723 m!1435143))

(declare-fun m!1435215 () Bool)

(assert (=> b!1558716 m!1435215))

(declare-fun m!1435217 () Bool)

(assert (=> bm!71781 m!1435217))

(assert (=> b!1558541 d!162723))

(declare-fun d!162729 () Bool)

(declare-fun res!1066029 () Bool)

(declare-fun e!868350 () Bool)

(assert (=> d!162729 (=> res!1066029 e!868350)))

(assert (=> d!162729 (= res!1066029 (or (is-Nil!36338 (t!51068 l!1292)) (is-Nil!36338 (t!51068 (t!51068 l!1292)))))))

(assert (=> d!162729 (= (isStrictlySorted!981 (t!51068 l!1292)) e!868350)))

(declare-fun b!1558728 () Bool)

(declare-fun e!868351 () Bool)

(assert (=> b!1558728 (= e!868350 e!868351)))

(declare-fun res!1066031 () Bool)

(assert (=> b!1558728 (=> (not res!1066031) (not e!868351))))

(assert (=> b!1558728 (= res!1066031 (bvslt (_1!12506 (h!37783 (t!51068 l!1292))) (_1!12506 (h!37783 (t!51068 (t!51068 l!1292))))))))

(declare-fun b!1558729 () Bool)

(assert (=> b!1558729 (= e!868351 (isStrictlySorted!981 (t!51068 (t!51068 l!1292))))))

(assert (= (and d!162729 (not res!1066029)) b!1558728))

(assert (= (and b!1558728 res!1066031) b!1558729))

(declare-fun m!1435219 () Bool)

(assert (=> b!1558729 m!1435219))

(assert (=> b!1558540 d!162729))

(declare-fun b!1558737 () Bool)

(declare-fun e!868355 () Bool)

(declare-fun tp!112668 () Bool)

(assert (=> b!1558737 (= e!868355 (and tp_is_empty!38447 tp!112668))))

(assert (=> b!1558537 (= tp!112662 e!868355)))

(assert (= (and b!1558537 (is-Cons!36337 (t!51068 l!1292))) b!1558737))

(push 1)

(assert (not b!1558671))

(assert (not b!1558708))

(assert (not b!1558737))

(assert (not bm!71781))

(assert tp_is_empty!38447)

(assert (not b!1558716))

(assert (not b!1558573))

(assert (not b!1558577))

(assert (not d!162715))

(assert (not b!1558715))

(assert (not b!1558664))

(assert (not b!1558581))

(assert (not b!1558579))

(assert (not b!1558704))

(assert (not b!1558729))

(assert (not b!1558553))

(assert (not b!1558672))

(assert (not d!162723))

(assert (not bm!71772))

(assert (not d!162703))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162789 () Bool)

(assert (=> d!162789 (= ($colon$colon!983 e!868317 (ite c!144133 (h!37783 l!1292) (tuple2!24991 newKey!135 newValue!135))) (Cons!36337 (ite c!144133 (h!37783 l!1292) (tuple2!24991 newKey!135 newValue!135)) e!868317))))

(assert (=> bm!71772 d!162789))

(assert (=> b!1558704 d!162695))

(assert (=> b!1558573 d!162729))

(declare-fun d!162791 () Bool)

(declare-fun res!1066089 () Bool)

(declare-fun e!868425 () Bool)

(assert (=> d!162791 (=> res!1066089 e!868425)))

(assert (=> d!162791 (= res!1066089 (or (is-Nil!36338 lt!670801) (is-Nil!36338 (t!51068 lt!670801))))))

(assert (=> d!162791 (= (isStrictlySorted!981 lt!670801) e!868425)))

(declare-fun b!1558825 () Bool)

(declare-fun e!868426 () Bool)

(assert (=> b!1558825 (= e!868425 e!868426)))

(declare-fun res!1066090 () Bool)

(assert (=> b!1558825 (=> (not res!1066090) (not e!868426))))

(assert (=> b!1558825 (= res!1066090 (bvslt (_1!12506 (h!37783 lt!670801)) (_1!12506 (h!37783 (t!51068 lt!670801)))))))

(declare-fun b!1558826 () Bool)

(assert (=> b!1558826 (= e!868426 (isStrictlySorted!981 (t!51068 lt!670801)))))

(assert (= (and d!162791 (not res!1066089)) b!1558825))

(assert (= (and b!1558825 res!1066090) b!1558826))

(declare-fun m!1435309 () Bool)

(assert (=> b!1558826 m!1435309))

(assert (=> d!162703 d!162791))

(assert (=> d!162703 d!162687))

(declare-fun d!162793 () Bool)

(declare-fun res!1066091 () Bool)

(declare-fun e!868427 () Bool)

(assert (=> d!162793 (=> res!1066091 e!868427)))

(assert (=> d!162793 (= res!1066091 (and (is-Cons!36337 lt!670801) (= (_1!12506 (h!37783 lt!670801)) newKey!135)))))

(assert (=> d!162793 (= (containsKey!844 lt!670801 newKey!135) e!868427)))

(declare-fun b!1558827 () Bool)

(declare-fun e!868428 () Bool)

(assert (=> b!1558827 (= e!868427 e!868428)))

(declare-fun res!1066092 () Bool)

(assert (=> b!1558827 (=> (not res!1066092) (not e!868428))))

(assert (=> b!1558827 (= res!1066092 (and (or (not (is-Cons!36337 lt!670801)) (bvsle (_1!12506 (h!37783 lt!670801)) newKey!135)) (is-Cons!36337 lt!670801) (bvslt (_1!12506 (h!37783 lt!670801)) newKey!135)))))

(declare-fun b!1558828 () Bool)

(assert (=> b!1558828 (= e!868428 (containsKey!844 (t!51068 lt!670801) newKey!135))))

(assert (= (and d!162793 (not res!1066091)) b!1558827))

(assert (= (and b!1558827 res!1066092) b!1558828))

(declare-fun m!1435311 () Bool)

(assert (=> b!1558828 m!1435311))

(assert (=> b!1558672 d!162793))

(declare-fun d!162795 () Bool)

(declare-fun res!1066093 () Bool)

(declare-fun e!868429 () Bool)

(assert (=> d!162795 (=> res!1066093 e!868429)))

(assert (=> d!162795 (= res!1066093 (or (is-Nil!36338 lt!670810) (is-Nil!36338 (t!51068 lt!670810))))))

(assert (=> d!162795 (= (isStrictlySorted!981 lt!670810) e!868429)))

(declare-fun b!1558829 () Bool)

(declare-fun e!868430 () Bool)

(assert (=> b!1558829 (= e!868429 e!868430)))

(declare-fun res!1066094 () Bool)

(assert (=> b!1558829 (=> (not res!1066094) (not e!868430))))

(assert (=> b!1558829 (= res!1066094 (bvslt (_1!12506 (h!37783 lt!670810)) (_1!12506 (h!37783 (t!51068 lt!670810)))))))

(declare-fun b!1558830 () Bool)

(assert (=> b!1558830 (= e!868430 (isStrictlySorted!981 (t!51068 lt!670810)))))

(assert (= (and d!162795 (not res!1066093)) b!1558829))

(assert (= (and b!1558829 res!1066094) b!1558830))

(declare-fun m!1435313 () Bool)

(assert (=> b!1558830 m!1435313))

(assert (=> d!162723 d!162795))

(assert (=> d!162723 d!162729))

(assert (=> b!1558553 d!162695))

(assert (=> d!162715 d!162699))

(assert (=> d!162715 d!162723))

(declare-fun d!162797 () Bool)

(assert (=> d!162797 (containsKey!844 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135) otherKey!62)))

(assert (=> d!162797 true))

(declare-fun _$18!47 () Unit!51892)

(assert (=> d!162797 (= (choose!2071 (t!51068 l!1292) newKey!135 newValue!135 otherKey!62) _$18!47)))

(declare-fun bs!44806 () Bool)

(assert (= bs!44806 d!162797))

(assert (=> bs!44806 m!1435131))

(assert (=> bs!44806 m!1435131))

(assert (=> bs!44806 m!1435133))

(assert (=> d!162715 d!162797))

(assert (=> d!162715 d!162729))

(declare-fun lt!670827 () Bool)

(declare-fun d!162799 () Bool)

(declare-fun content!804 (List!36341) (Set tuple2!24990))

(assert (=> d!162799 (= lt!670827 (member (tuple2!24991 newKey!135 newValue!135) (content!804 lt!670801)))))

(declare-fun e!868436 () Bool)

(assert (=> d!162799 (= lt!670827 e!868436)))

(declare-fun res!1066100 () Bool)

(assert (=> d!162799 (=> (not res!1066100) (not e!868436))))

(assert (=> d!162799 (= res!1066100 (is-Cons!36337 lt!670801))))

(assert (=> d!162799 (= (contains!10213 lt!670801 (tuple2!24991 newKey!135 newValue!135)) lt!670827)))

(declare-fun b!1558835 () Bool)

(declare-fun e!868435 () Bool)

(assert (=> b!1558835 (= e!868436 e!868435)))

(declare-fun res!1066099 () Bool)

(assert (=> b!1558835 (=> res!1066099 e!868435)))

(assert (=> b!1558835 (= res!1066099 (= (h!37783 lt!670801) (tuple2!24991 newKey!135 newValue!135)))))

(declare-fun b!1558836 () Bool)

(assert (=> b!1558836 (= e!868435 (contains!10213 (t!51068 lt!670801) (tuple2!24991 newKey!135 newValue!135)))))

(assert (= (and d!162799 res!1066100) b!1558835))

(assert (= (and b!1558835 (not res!1066099)) b!1558836))

(declare-fun m!1435315 () Bool)

(assert (=> d!162799 m!1435315))

(declare-fun m!1435317 () Bool)

(assert (=> d!162799 m!1435317))

(declare-fun m!1435319 () Bool)

(assert (=> b!1558836 m!1435319))

(assert (=> b!1558664 d!162799))

(declare-fun d!162801 () Bool)

(declare-fun res!1066101 () Bool)

(declare-fun e!868437 () Bool)

(assert (=> d!162801 (=> res!1066101 e!868437)))

(assert (=> d!162801 (= res!1066101 (and (is-Cons!36337 (t!51068 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135))) (= (_1!12506 (h!37783 (t!51068 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!162801 (= (containsKey!844 (t!51068 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135)) otherKey!62) e!868437)))

(declare-fun b!1558837 () Bool)

(declare-fun e!868438 () Bool)

(assert (=> b!1558837 (= e!868437 e!868438)))

(declare-fun res!1066102 () Bool)

(assert (=> b!1558837 (=> (not res!1066102) (not e!868438))))

(assert (=> b!1558837 (= res!1066102 (and (or (not (is-Cons!36337 (t!51068 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135)))) (bvsle (_1!12506 (h!37783 (t!51068 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135)))) otherKey!62)) (is-Cons!36337 (t!51068 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135))) (bvslt (_1!12506 (h!37783 (t!51068 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1558838 () Bool)

(assert (=> b!1558838 (= e!868438 (containsKey!844 (t!51068 (t!51068 (insertStrictlySorted!572 (t!51068 l!1292) newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!162801 (not res!1066101)) b!1558837))

(assert (= (and b!1558837 res!1066102) b!1558838))

(declare-fun m!1435321 () Bool)

(assert (=> b!1558838 m!1435321))

(assert (=> b!1558579 d!162801))

(declare-fun d!162803 () Bool)

(declare-fun res!1066103 () Bool)

(declare-fun e!868439 () Bool)

(assert (=> d!162803 (=> res!1066103 e!868439)))

(assert (=> d!162803 (= res!1066103 (and (is-Cons!36337 lt!670810) (= (_1!12506 (h!37783 lt!670810)) newKey!135)))))

(assert (=> d!162803 (= (containsKey!844 lt!670810 newKey!135) e!868439)))

(declare-fun b!1558839 () Bool)

(declare-fun e!868440 () Bool)

(assert (=> b!1558839 (= e!868439 e!868440)))

(declare-fun res!1066104 () Bool)

(assert (=> b!1558839 (=> (not res!1066104) (not e!868440))))

(assert (=> b!1558839 (= res!1066104 (and (or (not (is-Cons!36337 lt!670810)) (bvsle (_1!12506 (h!37783 lt!670810)) newKey!135)) (is-Cons!36337 lt!670810) (bvslt (_1!12506 (h!37783 lt!670810)) newKey!135)))))

(declare-fun b!1558840 () Bool)

(assert (=> b!1558840 (= e!868440 (containsKey!844 (t!51068 lt!670810) newKey!135))))

(assert (= (and d!162803 (not res!1066103)) b!1558839))

(assert (= (and b!1558839 res!1066104) b!1558840))

(declare-fun m!1435323 () Bool)

(assert (=> b!1558840 m!1435323))

(assert (=> b!1558716 d!162803))

(declare-fun bm!71791 () Bool)

(declare-fun call!71796 () List!36341)

(declare-fun call!71795 () List!36341)

(assert (=> bm!71791 (= call!71796 call!71795)))

(declare-fun b!1558841 () Bool)

(declare-fun e!868445 () Bool)

(declare-fun lt!670828 () List!36341)

(assert (=> b!1558841 (= e!868445 (contains!10213 lt!670828 (tuple2!24991 newKey!135 newValue!135)))))

(declare-fun b!1558842 () Bool)

(declare-fun e!868442 () List!36341)

(declare-fun call!71794 () List!36341)

(assert (=> b!1558842 (= e!868442 call!71794)))

(declare-fun b!1558843 () Bool)

(declare-fun e!868441 () List!36341)

(declare-fun e!868443 () List!36341)

(assert (=> b!1558843 (= e!868441 e!868443)))

(declare-fun c!144164 () Bool)

(assert (=> b!1558843 (= c!144164 (and (is-Cons!36337 (t!51068 (t!51068 l!1292))) (= (_1!12506 (h!37783 (t!51068 (t!51068 l!1292)))) newKey!135)))))

(declare-fun b!1558845 () Bool)

(assert (=> b!1558845 (= e!868443 call!71796)))

(declare-fun b!1558846 () Bool)

(assert (=> b!1558846 (= e!868441 call!71795)))

(declare-fun b!1558847 () Bool)

(declare-fun c!144163 () Bool)

(assert (=> b!1558847 (= c!144163 (and (is-Cons!36337 (t!51068 (t!51068 l!1292))) (bvsgt (_1!12506 (h!37783 (t!51068 (t!51068 l!1292)))) newKey!135)))))

(assert (=> b!1558847 (= e!868443 e!868442)))

(declare-fun b!1558848 () Bool)

(declare-fun e!868444 () List!36341)

(assert (=> b!1558848 (= e!868444 (insertStrictlySorted!572 (t!51068 (t!51068 (t!51068 l!1292))) newKey!135 newValue!135))))

(declare-fun b!1558849 () Bool)

(declare-fun res!1066106 () Bool)

(assert (=> b!1558849 (=> (not res!1066106) (not e!868445))))

(assert (=> b!1558849 (= res!1066106 (containsKey!844 lt!670828 newKey!135))))

(declare-fun bm!71792 () Bool)

(assert (=> bm!71792 (= call!71794 call!71796)))

(declare-fun c!144161 () Bool)

(declare-fun bm!71793 () Bool)

(assert (=> bm!71793 (= call!71795 ($colon$colon!983 e!868444 (ite c!144161 (h!37783 (t!51068 (t!51068 l!1292))) (tuple2!24991 newKey!135 newValue!135))))))

(declare-fun c!144162 () Bool)

(assert (=> bm!71793 (= c!144162 c!144161)))

(declare-fun b!1558850 () Bool)

(assert (=> b!1558850 (= e!868442 call!71794)))

(declare-fun b!1558844 () Bool)

(assert (=> b!1558844 (= e!868444 (ite c!144164 (t!51068 (t!51068 (t!51068 l!1292))) (ite c!144163 (Cons!36337 (h!37783 (t!51068 (t!51068 l!1292))) (t!51068 (t!51068 (t!51068 l!1292)))) Nil!36338)))))

(declare-fun d!162805 () Bool)

(assert (=> d!162805 e!868445))

(declare-fun res!1066105 () Bool)

(assert (=> d!162805 (=> (not res!1066105) (not e!868445))))

(assert (=> d!162805 (= res!1066105 (isStrictlySorted!981 lt!670828))))

(assert (=> d!162805 (= lt!670828 e!868441)))

(assert (=> d!162805 (= c!144161 (and (is-Cons!36337 (t!51068 (t!51068 l!1292))) (bvslt (_1!12506 (h!37783 (t!51068 (t!51068 l!1292)))) newKey!135)))))

(assert (=> d!162805 (isStrictlySorted!981 (t!51068 (t!51068 l!1292)))))

(assert (=> d!162805 (= (insertStrictlySorted!572 (t!51068 (t!51068 l!1292)) newKey!135 newValue!135) lt!670828)))

(assert (= (and d!162805 c!144161) b!1558846))

(assert (= (and d!162805 (not c!144161)) b!1558843))

(assert (= (and b!1558843 c!144164) b!1558845))

(assert (= (and b!1558843 (not c!144164)) b!1558847))

(assert (= (and b!1558847 c!144163) b!1558850))

(assert (= (and b!1558847 (not c!144163)) b!1558842))

(assert (= (or b!1558850 b!1558842) bm!71792))

(assert (= (or b!1558845 bm!71792) bm!71791))

(assert (= (or b!1558846 bm!71791) bm!71793))

(assert (= (and bm!71793 c!144162) b!1558848))

(assert (= (and bm!71793 (not c!144162)) b!1558844))

(assert (= (and d!162805 res!1066105) b!1558849))

(assert (= (and b!1558849 res!1066106) b!1558841))

(declare-fun m!1435325 () Bool)

(assert (=> b!1558848 m!1435325))

(declare-fun m!1435327 () Bool)

(assert (=> b!1558841 m!1435327))

(declare-fun m!1435329 () Bool)

(assert (=> d!162805 m!1435329))

(assert (=> d!162805 m!1435219))

(declare-fun m!1435331 () Bool)

(assert (=> b!1558849 m!1435331))

(declare-fun m!1435333 () Bool)

(assert (=> bm!71793 m!1435333))

(assert (=> b!1558715 d!162805))

(declare-fun d!162807 () Bool)

(declare-fun res!1066107 () Bool)

(declare-fun e!868446 () Bool)

(assert (=> d!162807 (=> res!1066107 e!868446)))

(assert (=> d!162807 (= res!1066107 (or (is-Nil!36338 (t!51068 (t!51068 l!1292))) (is-Nil!36338 (t!51068 (t!51068 (t!51068 l!1292))))))))

(assert (=> d!162807 (= (isStrictlySorted!981 (t!51068 (t!51068 l!1292))) e!868446)))

(declare-fun b!1558851 () Bool)

(declare-fun e!868447 () Bool)

(assert (=> b!1558851 (= e!868446 e!868447)))

(declare-fun res!1066108 () Bool)

(assert (=> b!1558851 (=> (not res!1066108) (not e!868447))))

(assert (=> b!1558851 (= res!1066108 (bvslt (_1!12506 (h!37783 (t!51068 (t!51068 l!1292)))) (_1!12506 (h!37783 (t!51068 (t!51068 (t!51068 l!1292)))))))))

(declare-fun b!1558852 () Bool)

(assert (=> b!1558852 (= e!868447 (isStrictlySorted!981 (t!51068 (t!51068 (t!51068 l!1292)))))))

(assert (= (and d!162807 (not res!1066107)) b!1558851))

(assert (= (and b!1558851 res!1066108) b!1558852))

(declare-fun m!1435335 () Bool)

(assert (=> b!1558852 m!1435335))

(assert (=> b!1558729 d!162807))

(declare-fun d!162809 () Bool)

(declare-fun res!1066109 () Bool)

(declare-fun e!868448 () Bool)

(assert (=> d!162809 (=> res!1066109 e!868448)))

(assert (=> d!162809 (= res!1066109 (and (is-Cons!36337 (t!51068 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135))) (= (_1!12506 (h!37783 (t!51068 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!162809 (= (containsKey!844 (t!51068 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)) otherKey!62) e!868448)))

(declare-fun b!1558853 () Bool)

(declare-fun e!868449 () Bool)

(assert (=> b!1558853 (= e!868448 e!868449)))

(declare-fun res!1066110 () Bool)

(assert (=> b!1558853 (=> (not res!1066110) (not e!868449))))

(assert (=> b!1558853 (= res!1066110 (and (or (not (is-Cons!36337 (t!51068 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)))) (bvsle (_1!12506 (h!37783 (t!51068 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)))) otherKey!62)) (is-Cons!36337 (t!51068 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135))) (bvslt (_1!12506 (h!37783 (t!51068 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1558854 () Bool)

(assert (=> b!1558854 (= e!868449 (containsKey!844 (t!51068 (t!51068 (insertStrictlySorted!572 l!1292 newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!162809 (not res!1066109)) b!1558853))

(assert (= (and b!1558853 res!1066110) b!1558854))

(declare-fun m!1435337 () Bool)

(assert (=> b!1558854 m!1435337))

(assert (=> b!1558581 d!162809))

(declare-fun d!162811 () Bool)

(declare-fun res!1066111 () Bool)

(declare-fun e!868450 () Bool)

(assert (=> d!162811 (=> res!1066111 e!868450)))

(assert (=> d!162811 (= res!1066111 (and (is-Cons!36337 (t!51068 (t!51068 l!1292))) (= (_1!12506 (h!37783 (t!51068 (t!51068 l!1292)))) otherKey!62)))))

(assert (=> d!162811 (= (containsKey!844 (t!51068 (t!51068 l!1292)) otherKey!62) e!868450)))

(declare-fun b!1558855 () Bool)

(declare-fun e!868451 () Bool)

(assert (=> b!1558855 (= e!868450 e!868451)))

(declare-fun res!1066112 () Bool)

(assert (=> b!1558855 (=> (not res!1066112) (not e!868451))))

(assert (=> b!1558855 (= res!1066112 (and (or (not (is-Cons!36337 (t!51068 (t!51068 l!1292)))) (bvsle (_1!12506 (h!37783 (t!51068 (t!51068 l!1292)))) otherKey!62)) (is-Cons!36337 (t!51068 (t!51068 l!1292))) (bvslt (_1!12506 (h!37783 (t!51068 (t!51068 l!1292)))) otherKey!62)))))

(declare-fun b!1558856 () Bool)

(assert (=> b!1558856 (= e!868451 (containsKey!844 (t!51068 (t!51068 (t!51068 l!1292))) otherKey!62))))

(assert (= (and d!162811 (not res!1066111)) b!1558855))

(assert (= (and b!1558855 res!1066112) b!1558856))

(declare-fun m!1435339 () Bool)

(assert (=> b!1558856 m!1435339))

(assert (=> b!1558577 d!162811))

(assert (=> b!1558671 d!162723))

(declare-fun d!162813 () Bool)

(declare-fun lt!670829 () Bool)

(assert (=> d!162813 (= lt!670829 (member (tuple2!24991 newKey!135 newValue!135) (content!804 lt!670810)))))

(declare-fun e!868453 () Bool)

(assert (=> d!162813 (= lt!670829 e!868453)))

(declare-fun res!1066114 () Bool)

(assert (=> d!162813 (=> (not res!1066114) (not e!868453))))

(assert (=> d!162813 (= res!1066114 (is-Cons!36337 lt!670810))))

(assert (=> d!162813 (= (contains!10213 lt!670810 (tuple2!24991 newKey!135 newValue!135)) lt!670829)))

(declare-fun b!1558857 () Bool)

(declare-fun e!868452 () Bool)

(assert (=> b!1558857 (= e!868453 e!868452)))

(declare-fun res!1066113 () Bool)

(assert (=> b!1558857 (=> res!1066113 e!868452)))

(assert (=> b!1558857 (= res!1066113 (= (h!37783 lt!670810) (tuple2!24991 newKey!135 newValue!135)))))

(declare-fun b!1558858 () Bool)

(assert (=> b!1558858 (= e!868452 (contains!10213 (t!51068 lt!670810) (tuple2!24991 newKey!135 newValue!135)))))

(assert (= (and d!162813 res!1066114) b!1558857))

(assert (= (and b!1558857 (not res!1066113)) b!1558858))

(declare-fun m!1435341 () Bool)

(assert (=> d!162813 m!1435341))

(declare-fun m!1435343 () Bool)

(assert (=> d!162813 m!1435343))

(declare-fun m!1435345 () Bool)

(assert (=> b!1558858 m!1435345))

(assert (=> b!1558708 d!162813))

(declare-fun d!162815 () Bool)

(assert (=> d!162815 (= ($colon$colon!983 e!868340 (ite c!144145 (h!37783 (t!51068 l!1292)) (tuple2!24991 newKey!135 newValue!135))) (Cons!36337 (ite c!144145 (h!37783 (t!51068 l!1292)) (tuple2!24991 newKey!135 newValue!135)) e!868340))))

(assert (=> bm!71781 d!162815))

(declare-fun b!1558859 () Bool)

(declare-fun e!868454 () Bool)

(declare-fun tp!112674 () Bool)

(assert (=> b!1558859 (= e!868454 (and tp_is_empty!38447 tp!112674))))

(assert (=> b!1558737 (= tp!112668 e!868454)))

(assert (= (and b!1558737 (is-Cons!36337 (t!51068 (t!51068 l!1292)))) b!1558859))

(push 1)

(assert (not b!1558854))

(assert (not b!1558849))

(assert (not b!1558836))

(assert (not b!1558830))

(assert tp_is_empty!38447)

(assert (not d!162813))

(assert (not b!1558848))

(assert (not b!1558838))

(assert (not b!1558858))

(assert (not d!162797))

(assert (not b!1558826))

(assert (not b!1558841))

(assert (not b!1558828))

(assert (not b!1558856))

(assert (not b!1558852))

(assert (not bm!71793))

(assert (not d!162799))

(assert (not b!1558859))

(assert (not b!1558840))

(assert (not d!162805))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

