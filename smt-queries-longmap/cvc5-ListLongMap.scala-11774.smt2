; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138198 () Bool)

(assert start!138198)

(declare-fun e!884963 () Bool)

(declare-fun newKey!21 () (_ BitVec 64))

(declare-datatypes ((B!2988 0))(
  ( (B!2989 (val!19856 Int)) )
))
(declare-datatypes ((tuple2!25948 0))(
  ( (tuple2!25949 (_1!12985 (_ BitVec 64)) (_2!12985 B!2988)) )
))
(declare-datatypes ((List!37017 0))(
  ( (Nil!37014) (Cons!37013 (h!38557 tuple2!25948) (t!51927 List!37017)) )
))
(declare-fun lt!677096 () List!37017)

(declare-fun b!1585110 () Bool)

(declare-fun newValue!21 () B!2988)

(declare-fun contains!10488 (List!37017 tuple2!25948) Bool)

(assert (=> b!1585110 (= e!884963 (not (contains!10488 lt!677096 (tuple2!25949 newKey!21 newValue!21))))))

(declare-fun b!1585111 () Bool)

(declare-fun res!1082653 () Bool)

(assert (=> b!1585111 (=> res!1082653 e!884963)))

(declare-fun containsKey!1009 (List!37017 (_ BitVec 64)) Bool)

(assert (=> b!1585111 (= res!1082653 (not (containsKey!1009 lt!677096 newKey!21)))))

(declare-fun b!1585112 () Bool)

(declare-fun e!884964 () Bool)

(assert (=> b!1585112 (= e!884964 e!884963)))

(declare-fun res!1082654 () Bool)

(assert (=> b!1585112 (=> res!1082654 e!884963)))

(declare-fun isStrictlySorted!1196 (List!37017) Bool)

(assert (=> b!1585112 (= res!1082654 (not (isStrictlySorted!1196 lt!677096)))))

(declare-fun l!556 () List!37017)

(declare-fun $colon$colon!1046 (List!37017 tuple2!25948) List!37017)

(declare-fun insertStrictlySorted!638 (List!37017 (_ BitVec 64) B!2988) List!37017)

(assert (=> b!1585112 (= lt!677096 ($colon$colon!1046 (insertStrictlySorted!638 (t!51927 l!556) newKey!21 newValue!21) (h!38557 l!556)))))

(declare-fun b!1585113 () Bool)

(declare-fun e!884962 () Bool)

(declare-fun tp_is_empty!39521 () Bool)

(declare-fun tp!115266 () Bool)

(assert (=> b!1585113 (= e!884962 (and tp_is_empty!39521 tp!115266))))

(declare-fun b!1585114 () Bool)

(declare-fun res!1082655 () Bool)

(assert (=> b!1585114 (=> (not res!1082655) (not e!884964))))

(assert (=> b!1585114 (= res!1082655 (and (is-Cons!37013 l!556) (bvslt (_1!12985 (h!38557 l!556)) newKey!21)))))

(declare-fun res!1082652 () Bool)

(assert (=> start!138198 (=> (not res!1082652) (not e!884964))))

(assert (=> start!138198 (= res!1082652 (isStrictlySorted!1196 l!556))))

(assert (=> start!138198 e!884964))

(assert (=> start!138198 e!884962))

(assert (=> start!138198 true))

(assert (=> start!138198 tp_is_empty!39521))

(assert (= (and start!138198 res!1082652) b!1585114))

(assert (= (and b!1585114 res!1082655) b!1585112))

(assert (= (and b!1585112 (not res!1082654)) b!1585111))

(assert (= (and b!1585111 (not res!1082653)) b!1585110))

(assert (= (and start!138198 (is-Cons!37013 l!556)) b!1585113))

(declare-fun m!1453371 () Bool)

(assert (=> b!1585110 m!1453371))

(declare-fun m!1453373 () Bool)

(assert (=> b!1585111 m!1453373))

(declare-fun m!1453375 () Bool)

(assert (=> b!1585112 m!1453375))

(declare-fun m!1453377 () Bool)

(assert (=> b!1585112 m!1453377))

(assert (=> b!1585112 m!1453377))

(declare-fun m!1453379 () Bool)

(assert (=> b!1585112 m!1453379))

(declare-fun m!1453381 () Bool)

(assert (=> start!138198 m!1453381))

(push 1)

(assert (not start!138198))

(assert (not b!1585112))

(assert (not b!1585110))

(assert (not b!1585111))

(assert (not b!1585113))

(assert tp_is_empty!39521)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167431 () Bool)

(declare-fun res!1082672 () Bool)

(declare-fun e!884981 () Bool)

(assert (=> d!167431 (=> res!1082672 e!884981)))

(assert (=> d!167431 (= res!1082672 (and (is-Cons!37013 lt!677096) (= (_1!12985 (h!38557 lt!677096)) newKey!21)))))

(assert (=> d!167431 (= (containsKey!1009 lt!677096 newKey!21) e!884981)))

(declare-fun b!1585131 () Bool)

(declare-fun e!884982 () Bool)

(assert (=> b!1585131 (= e!884981 e!884982)))

(declare-fun res!1082673 () Bool)

(assert (=> b!1585131 (=> (not res!1082673) (not e!884982))))

(assert (=> b!1585131 (= res!1082673 (and (or (not (is-Cons!37013 lt!677096)) (bvsle (_1!12985 (h!38557 lt!677096)) newKey!21)) (is-Cons!37013 lt!677096) (bvslt (_1!12985 (h!38557 lt!677096)) newKey!21)))))

(declare-fun b!1585132 () Bool)

(assert (=> b!1585132 (= e!884982 (containsKey!1009 (t!51927 lt!677096) newKey!21))))

(assert (= (and d!167431 (not res!1082672)) b!1585131))

(assert (= (and b!1585131 res!1082673) b!1585132))

(declare-fun m!1453391 () Bool)

(assert (=> b!1585132 m!1453391))

(assert (=> b!1585111 d!167431))

(declare-fun lt!677102 () Bool)

(declare-fun d!167437 () Bool)

(declare-fun content!856 (List!37017) (Set tuple2!25948))

(assert (=> d!167437 (= lt!677102 (set.member (tuple2!25949 newKey!21 newValue!21) (content!856 lt!677096)))))

(declare-fun e!884991 () Bool)

(assert (=> d!167437 (= lt!677102 e!884991)))

(declare-fun res!1082682 () Bool)

(assert (=> d!167437 (=> (not res!1082682) (not e!884991))))

(assert (=> d!167437 (= res!1082682 (is-Cons!37013 lt!677096))))

(assert (=> d!167437 (= (contains!10488 lt!677096 (tuple2!25949 newKey!21 newValue!21)) lt!677102)))

(declare-fun b!1585141 () Bool)

(declare-fun e!884992 () Bool)

(assert (=> b!1585141 (= e!884991 e!884992)))

(declare-fun res!1082683 () Bool)

(assert (=> b!1585141 (=> res!1082683 e!884992)))

(assert (=> b!1585141 (= res!1082683 (= (h!38557 lt!677096) (tuple2!25949 newKey!21 newValue!21)))))

(declare-fun b!1585142 () Bool)

(assert (=> b!1585142 (= e!884992 (contains!10488 (t!51927 lt!677096) (tuple2!25949 newKey!21 newValue!21)))))

(assert (= (and d!167437 res!1082682) b!1585141))

(assert (= (and b!1585141 (not res!1082683)) b!1585142))

(declare-fun m!1453393 () Bool)

(assert (=> d!167437 m!1453393))

(declare-fun m!1453395 () Bool)

(assert (=> d!167437 m!1453395))

(declare-fun m!1453397 () Bool)

(assert (=> b!1585142 m!1453397))

(assert (=> b!1585110 d!167437))

(declare-fun d!167443 () Bool)

(declare-fun res!1082694 () Bool)

(declare-fun e!885003 () Bool)

(assert (=> d!167443 (=> res!1082694 e!885003)))

(assert (=> d!167443 (= res!1082694 (or (is-Nil!37014 lt!677096) (is-Nil!37014 (t!51927 lt!677096))))))

(assert (=> d!167443 (= (isStrictlySorted!1196 lt!677096) e!885003)))

(declare-fun b!1585153 () Bool)

(declare-fun e!885004 () Bool)

(assert (=> b!1585153 (= e!885003 e!885004)))

(declare-fun res!1082695 () Bool)

(assert (=> b!1585153 (=> (not res!1082695) (not e!885004))))

(assert (=> b!1585153 (= res!1082695 (bvslt (_1!12985 (h!38557 lt!677096)) (_1!12985 (h!38557 (t!51927 lt!677096)))))))

(declare-fun b!1585154 () Bool)

(assert (=> b!1585154 (= e!885004 (isStrictlySorted!1196 (t!51927 lt!677096)))))

(assert (= (and d!167443 (not res!1082694)) b!1585153))

(assert (= (and b!1585153 res!1082695) b!1585154))

(declare-fun m!1453401 () Bool)

(assert (=> b!1585154 m!1453401))

(assert (=> b!1585112 d!167443))

(declare-fun d!167447 () Bool)

(assert (=> d!167447 (= ($colon$colon!1046 (insertStrictlySorted!638 (t!51927 l!556) newKey!21 newValue!21) (h!38557 l!556)) (Cons!37013 (h!38557 l!556) (insertStrictlySorted!638 (t!51927 l!556) newKey!21 newValue!21)))))

(assert (=> b!1585112 d!167447))

(declare-fun b!1585240 () Bool)

(declare-fun e!885061 () List!37017)

(declare-fun call!72602 () List!37017)

(assert (=> b!1585240 (= e!885061 call!72602)))

(declare-fun c!146914 () Bool)

(declare-fun call!72603 () List!37017)

(declare-fun bm!72599 () Bool)

(declare-fun e!885058 () List!37017)

(assert (=> bm!72599 (= call!72603 ($colon$colon!1046 e!885058 (ite c!146914 (h!38557 (t!51927 l!556)) (tuple2!25949 newKey!21 newValue!21))))))

(declare-fun c!146916 () Bool)

(assert (=> bm!72599 (= c!146916 c!146914)))

(declare-fun bm!72600 () Bool)

(declare-fun call!72604 () List!37017)

(assert (=> bm!72600 (= call!72604 call!72602)))

(declare-fun b!1585241 () Bool)

(declare-fun e!885057 () List!37017)

(assert (=> b!1585241 (= e!885057 e!885061)))

(declare-fun c!146917 () Bool)

(assert (=> b!1585241 (= c!146917 (and (is-Cons!37013 (t!51927 l!556)) (= (_1!12985 (h!38557 (t!51927 l!556))) newKey!21)))))

(declare-fun d!167449 () Bool)

(declare-fun e!885059 () Bool)

(assert (=> d!167449 e!885059))

(declare-fun res!1082725 () Bool)

(assert (=> d!167449 (=> (not res!1082725) (not e!885059))))

(declare-fun lt!677113 () List!37017)

(assert (=> d!167449 (= res!1082725 (isStrictlySorted!1196 lt!677113))))

(assert (=> d!167449 (= lt!677113 e!885057)))

(assert (=> d!167449 (= c!146914 (and (is-Cons!37013 (t!51927 l!556)) (bvslt (_1!12985 (h!38557 (t!51927 l!556))) newKey!21)))))

(assert (=> d!167449 (isStrictlySorted!1196 (t!51927 l!556))))

(assert (=> d!167449 (= (insertStrictlySorted!638 (t!51927 l!556) newKey!21 newValue!21) lt!677113)))

(declare-fun b!1585242 () Bool)

(assert (=> b!1585242 (= e!885059 (contains!10488 lt!677113 (tuple2!25949 newKey!21 newValue!21)))))

(declare-fun bm!72601 () Bool)

(assert (=> bm!72601 (= call!72602 call!72603)))

(declare-fun b!1585243 () Bool)

(declare-fun res!1082724 () Bool)

(assert (=> b!1585243 (=> (not res!1082724) (not e!885059))))

(assert (=> b!1585243 (= res!1082724 (containsKey!1009 lt!677113 newKey!21))))

(declare-fun b!1585244 () Bool)

(assert (=> b!1585244 (= e!885057 call!72603)))

(declare-fun b!1585245 () Bool)

(declare-fun c!146915 () Bool)

(assert (=> b!1585245 (= c!146915 (and (is-Cons!37013 (t!51927 l!556)) (bvsgt (_1!12985 (h!38557 (t!51927 l!556))) newKey!21)))))

(declare-fun e!885060 () List!37017)

(assert (=> b!1585245 (= e!885061 e!885060)))

(declare-fun b!1585246 () Bool)

(assert (=> b!1585246 (= e!885058 (insertStrictlySorted!638 (t!51927 (t!51927 l!556)) newKey!21 newValue!21))))

(declare-fun b!1585247 () Bool)

(assert (=> b!1585247 (= e!885060 call!72604)))

(declare-fun b!1585248 () Bool)

(assert (=> b!1585248 (= e!885058 (ite c!146917 (t!51927 (t!51927 l!556)) (ite c!146915 (Cons!37013 (h!38557 (t!51927 l!556)) (t!51927 (t!51927 l!556))) Nil!37014)))))

(declare-fun b!1585249 () Bool)

(assert (=> b!1585249 (= e!885060 call!72604)))

(assert (= (and d!167449 c!146914) b!1585244))

(assert (= (and d!167449 (not c!146914)) b!1585241))

(assert (= (and b!1585241 c!146917) b!1585240))

(assert (= (and b!1585241 (not c!146917)) b!1585245))

(assert (= (and b!1585245 c!146915) b!1585249))

(assert (= (and b!1585245 (not c!146915)) b!1585247))

(assert (= (or b!1585249 b!1585247) bm!72600))

(assert (= (or b!1585240 bm!72600) bm!72601))

(assert (= (or b!1585244 bm!72601) bm!72599))

(assert (= (and bm!72599 c!146916) b!1585246))

(assert (= (and bm!72599 (not c!146916)) b!1585248))

(assert (= (and d!167449 res!1082725) b!1585243))

(assert (= (and b!1585243 res!1082724) b!1585242))

(declare-fun m!1453427 () Bool)

(assert (=> b!1585243 m!1453427))

(declare-fun m!1453429 () Bool)

(assert (=> b!1585246 m!1453429))

(declare-fun m!1453431 () Bool)

(assert (=> b!1585242 m!1453431))

(declare-fun m!1453433 () Bool)

(assert (=> d!167449 m!1453433))

(declare-fun m!1453435 () Bool)

(assert (=> d!167449 m!1453435))

(declare-fun m!1453437 () Bool)

(assert (=> bm!72599 m!1453437))

(assert (=> b!1585112 d!167449))

(declare-fun d!167463 () Bool)

(declare-fun res!1082726 () Bool)

(declare-fun e!885064 () Bool)

(assert (=> d!167463 (=> res!1082726 e!885064)))

(assert (=> d!167463 (= res!1082726 (or (is-Nil!37014 l!556) (is-Nil!37014 (t!51927 l!556))))))

(assert (=> d!167463 (= (isStrictlySorted!1196 l!556) e!885064)))

(declare-fun b!1585254 () Bool)

(declare-fun e!885065 () Bool)

(assert (=> b!1585254 (= e!885064 e!885065)))

(declare-fun res!1082727 () Bool)

(assert (=> b!1585254 (=> (not res!1082727) (not e!885065))))

(assert (=> b!1585254 (= res!1082727 (bvslt (_1!12985 (h!38557 l!556)) (_1!12985 (h!38557 (t!51927 l!556)))))))

(declare-fun b!1585255 () Bool)

(assert (=> b!1585255 (= e!885065 (isStrictlySorted!1196 (t!51927 l!556)))))

(assert (= (and d!167463 (not res!1082726)) b!1585254))

(assert (= (and b!1585254 res!1082727) b!1585255))

(assert (=> b!1585255 m!1453435))

(assert (=> start!138198 d!167463))

(declare-fun b!1585264 () Bool)

(declare-fun e!885070 () Bool)

(declare-fun tp!115272 () Bool)

(assert (=> b!1585264 (= e!885070 (and tp_is_empty!39521 tp!115272))))

(assert (=> b!1585113 (= tp!115266 e!885070)))

(assert (= (and b!1585113 (is-Cons!37013 (t!51927 l!556))) b!1585264))

(push 1)

(assert (not b!1585243))

(assert (not b!1585242))

(assert (not b!1585132))

(assert (not bm!72599))

(assert (not d!167449))

(assert (not b!1585255))

(assert (not b!1585246))

(assert (not b!1585142))

(assert (not b!1585264))

(assert tp_is_empty!39521)

(assert (not d!167437))

(assert (not b!1585154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167465 () Bool)

(declare-fun res!1082734 () Bool)

(declare-fun e!885079 () Bool)

(assert (=> d!167465 (=> res!1082734 e!885079)))

(assert (=> d!167465 (= res!1082734 (and (is-Cons!37013 lt!677113) (= (_1!12985 (h!38557 lt!677113)) newKey!21)))))

(assert (=> d!167465 (= (containsKey!1009 lt!677113 newKey!21) e!885079)))

(declare-fun b!1585280 () Bool)

(declare-fun e!885080 () Bool)

(assert (=> b!1585280 (= e!885079 e!885080)))

(declare-fun res!1082735 () Bool)

(assert (=> b!1585280 (=> (not res!1082735) (not e!885080))))

(assert (=> b!1585280 (= res!1082735 (and (or (not (is-Cons!37013 lt!677113)) (bvsle (_1!12985 (h!38557 lt!677113)) newKey!21)) (is-Cons!37013 lt!677113) (bvslt (_1!12985 (h!38557 lt!677113)) newKey!21)))))

(declare-fun b!1585281 () Bool)

(assert (=> b!1585281 (= e!885080 (containsKey!1009 (t!51927 lt!677113) newKey!21))))

(assert (= (and d!167465 (not res!1082734)) b!1585280))

(assert (= (and b!1585280 res!1082735) b!1585281))

(declare-fun m!1453449 () Bool)

(assert (=> b!1585281 m!1453449))

(assert (=> b!1585243 d!167465))

(declare-fun d!167467 () Bool)

(declare-fun res!1082736 () Bool)

(declare-fun e!885081 () Bool)

(assert (=> d!167467 (=> res!1082736 e!885081)))

(assert (=> d!167467 (= res!1082736 (or (is-Nil!37014 (t!51927 l!556)) (is-Nil!37014 (t!51927 (t!51927 l!556)))))))

(assert (=> d!167467 (= (isStrictlySorted!1196 (t!51927 l!556)) e!885081)))

(declare-fun b!1585282 () Bool)

(declare-fun e!885082 () Bool)

(assert (=> b!1585282 (= e!885081 e!885082)))

(declare-fun res!1082737 () Bool)

(assert (=> b!1585282 (=> (not res!1082737) (not e!885082))))

(assert (=> b!1585282 (= res!1082737 (bvslt (_1!12985 (h!38557 (t!51927 l!556))) (_1!12985 (h!38557 (t!51927 (t!51927 l!556))))))))

(declare-fun b!1585283 () Bool)

(assert (=> b!1585283 (= e!885082 (isStrictlySorted!1196 (t!51927 (t!51927 l!556))))))

(assert (= (and d!167467 (not res!1082736)) b!1585282))

(assert (= (and b!1585282 res!1082737) b!1585283))

(declare-fun m!1453451 () Bool)

(assert (=> b!1585283 m!1453451))

(assert (=> b!1585255 d!167467))

(declare-fun d!167469 () Bool)

(assert (=> d!167469 (= ($colon$colon!1046 e!885058 (ite c!146914 (h!38557 (t!51927 l!556)) (tuple2!25949 newKey!21 newValue!21))) (Cons!37013 (ite c!146914 (h!38557 (t!51927 l!556)) (tuple2!25949 newKey!21 newValue!21)) e!885058))))

(assert (=> bm!72599 d!167469))

(declare-fun lt!677115 () Bool)

(declare-fun d!167471 () Bool)

(assert (=> d!167471 (= lt!677115 (set.member (tuple2!25949 newKey!21 newValue!21) (content!856 (t!51927 lt!677096))))))

(declare-fun e!885083 () Bool)

(assert (=> d!167471 (= lt!677115 e!885083)))

(declare-fun res!1082738 () Bool)

(assert (=> d!167471 (=> (not res!1082738) (not e!885083))))

(assert (=> d!167471 (= res!1082738 (is-Cons!37013 (t!51927 lt!677096)))))

(assert (=> d!167471 (= (contains!10488 (t!51927 lt!677096) (tuple2!25949 newKey!21 newValue!21)) lt!677115)))

(declare-fun b!1585284 () Bool)

(declare-fun e!885084 () Bool)

(assert (=> b!1585284 (= e!885083 e!885084)))

(declare-fun res!1082739 () Bool)

(assert (=> b!1585284 (=> res!1082739 e!885084)))

(assert (=> b!1585284 (= res!1082739 (= (h!38557 (t!51927 lt!677096)) (tuple2!25949 newKey!21 newValue!21)))))

(declare-fun b!1585285 () Bool)

(assert (=> b!1585285 (= e!885084 (contains!10488 (t!51927 (t!51927 lt!677096)) (tuple2!25949 newKey!21 newValue!21)))))

(assert (= (and d!167471 res!1082738) b!1585284))

(assert (= (and b!1585284 (not res!1082739)) b!1585285))

(declare-fun m!1453453 () Bool)

(assert (=> d!167471 m!1453453))

(declare-fun m!1453455 () Bool)

(assert (=> d!167471 m!1453455))

(declare-fun m!1453457 () Bool)

(assert (=> b!1585285 m!1453457))

(assert (=> b!1585142 d!167471))

(declare-fun d!167473 () Bool)

(declare-fun res!1082740 () Bool)

(declare-fun e!885085 () Bool)

(assert (=> d!167473 (=> res!1082740 e!885085)))

(assert (=> d!167473 (= res!1082740 (or (is-Nil!37014 (t!51927 lt!677096)) (is-Nil!37014 (t!51927 (t!51927 lt!677096)))))))

(assert (=> d!167473 (= (isStrictlySorted!1196 (t!51927 lt!677096)) e!885085)))

(declare-fun b!1585286 () Bool)

(declare-fun e!885086 () Bool)

(assert (=> b!1585286 (= e!885085 e!885086)))

(declare-fun res!1082741 () Bool)

(assert (=> b!1585286 (=> (not res!1082741) (not e!885086))))

(assert (=> b!1585286 (= res!1082741 (bvslt (_1!12985 (h!38557 (t!51927 lt!677096))) (_1!12985 (h!38557 (t!51927 (t!51927 lt!677096))))))))

(declare-fun b!1585287 () Bool)

(assert (=> b!1585287 (= e!885086 (isStrictlySorted!1196 (t!51927 (t!51927 lt!677096))))))

(assert (= (and d!167473 (not res!1082740)) b!1585286))

(assert (= (and b!1585286 res!1082741) b!1585287))

(declare-fun m!1453459 () Bool)

(assert (=> b!1585287 m!1453459))

(assert (=> b!1585154 d!167473))

(declare-fun d!167475 () Bool)

(declare-fun res!1082742 () Bool)

(declare-fun e!885087 () Bool)

(assert (=> d!167475 (=> res!1082742 e!885087)))

(assert (=> d!167475 (= res!1082742 (or (is-Nil!37014 lt!677113) (is-Nil!37014 (t!51927 lt!677113))))))

(assert (=> d!167475 (= (isStrictlySorted!1196 lt!677113) e!885087)))

(declare-fun b!1585288 () Bool)

(declare-fun e!885088 () Bool)

(assert (=> b!1585288 (= e!885087 e!885088)))

(declare-fun res!1082743 () Bool)

(assert (=> b!1585288 (=> (not res!1082743) (not e!885088))))

(assert (=> b!1585288 (= res!1082743 (bvslt (_1!12985 (h!38557 lt!677113)) (_1!12985 (h!38557 (t!51927 lt!677113)))))))

(declare-fun b!1585289 () Bool)

(assert (=> b!1585289 (= e!885088 (isStrictlySorted!1196 (t!51927 lt!677113)))))

(assert (= (and d!167475 (not res!1082742)) b!1585288))

(assert (= (and b!1585288 res!1082743) b!1585289))

(declare-fun m!1453461 () Bool)

(assert (=> b!1585289 m!1453461))

(assert (=> d!167449 d!167475))

(assert (=> d!167449 d!167467))

(declare-fun d!167477 () Bool)

(declare-fun res!1082744 () Bool)

(declare-fun e!885089 () Bool)

(assert (=> d!167477 (=> res!1082744 e!885089)))

(assert (=> d!167477 (= res!1082744 (and (is-Cons!37013 (t!51927 lt!677096)) (= (_1!12985 (h!38557 (t!51927 lt!677096))) newKey!21)))))

(assert (=> d!167477 (= (containsKey!1009 (t!51927 lt!677096) newKey!21) e!885089)))

(declare-fun b!1585290 () Bool)

(declare-fun e!885090 () Bool)

(assert (=> b!1585290 (= e!885089 e!885090)))

(declare-fun res!1082745 () Bool)

(assert (=> b!1585290 (=> (not res!1082745) (not e!885090))))

(assert (=> b!1585290 (= res!1082745 (and (or (not (is-Cons!37013 (t!51927 lt!677096))) (bvsle (_1!12985 (h!38557 (t!51927 lt!677096))) newKey!21)) (is-Cons!37013 (t!51927 lt!677096)) (bvslt (_1!12985 (h!38557 (t!51927 lt!677096))) newKey!21)))))

(declare-fun b!1585291 () Bool)

(assert (=> b!1585291 (= e!885090 (containsKey!1009 (t!51927 (t!51927 lt!677096)) newKey!21))))

(assert (= (and d!167477 (not res!1082744)) b!1585290))

(assert (= (and b!1585290 res!1082745) b!1585291))

(declare-fun m!1453463 () Bool)

(assert (=> b!1585291 m!1453463))

(assert (=> b!1585132 d!167477))

(declare-fun lt!677116 () Bool)

(declare-fun d!167479 () Bool)

(assert (=> d!167479 (= lt!677116 (set.member (tuple2!25949 newKey!21 newValue!21) (content!856 lt!677113)))))

(declare-fun e!885091 () Bool)

(assert (=> d!167479 (= lt!677116 e!885091)))

(declare-fun res!1082746 () Bool)

(assert (=> d!167479 (=> (not res!1082746) (not e!885091))))

(assert (=> d!167479 (= res!1082746 (is-Cons!37013 lt!677113))))

(assert (=> d!167479 (= (contains!10488 lt!677113 (tuple2!25949 newKey!21 newValue!21)) lt!677116)))

(declare-fun b!1585292 () Bool)

(declare-fun e!885092 () Bool)

(assert (=> b!1585292 (= e!885091 e!885092)))

(declare-fun res!1082747 () Bool)

(assert (=> b!1585292 (=> res!1082747 e!885092)))

(assert (=> b!1585292 (= res!1082747 (= (h!38557 lt!677113) (tuple2!25949 newKey!21 newValue!21)))))

(declare-fun b!1585293 () Bool)

(assert (=> b!1585293 (= e!885092 (contains!10488 (t!51927 lt!677113) (tuple2!25949 newKey!21 newValue!21)))))

(assert (= (and d!167479 res!1082746) b!1585292))

(assert (= (and b!1585292 (not res!1082747)) b!1585293))

(declare-fun m!1453465 () Bool)

(assert (=> d!167479 m!1453465))

(declare-fun m!1453467 () Bool)

(assert (=> d!167479 m!1453467))

(declare-fun m!1453469 () Bool)

(assert (=> b!1585293 m!1453469))

(assert (=> b!1585242 d!167479))

(declare-fun b!1585294 () Bool)

(declare-fun e!885097 () List!37017)

(declare-fun call!72610 () List!37017)

(assert (=> b!1585294 (= e!885097 call!72610)))

(declare-fun c!146924 () Bool)

(declare-fun call!72611 () List!37017)

(declare-fun e!885094 () List!37017)

(declare-fun bm!72607 () Bool)

(assert (=> bm!72607 (= call!72611 ($colon$colon!1046 e!885094 (ite c!146924 (h!38557 (t!51927 (t!51927 l!556))) (tuple2!25949 newKey!21 newValue!21))))))

(declare-fun c!146926 () Bool)

(assert (=> bm!72607 (= c!146926 c!146924)))

(declare-fun bm!72608 () Bool)

(declare-fun call!72612 () List!37017)

(assert (=> bm!72608 (= call!72612 call!72610)))

(declare-fun b!1585295 () Bool)

(declare-fun e!885093 () List!37017)

(assert (=> b!1585295 (= e!885093 e!885097)))

(declare-fun c!146927 () Bool)

(assert (=> b!1585295 (= c!146927 (and (is-Cons!37013 (t!51927 (t!51927 l!556))) (= (_1!12985 (h!38557 (t!51927 (t!51927 l!556)))) newKey!21)))))

(declare-fun d!167481 () Bool)

(declare-fun e!885095 () Bool)

(assert (=> d!167481 e!885095))

(declare-fun res!1082749 () Bool)

(assert (=> d!167481 (=> (not res!1082749) (not e!885095))))

(declare-fun lt!677117 () List!37017)

(assert (=> d!167481 (= res!1082749 (isStrictlySorted!1196 lt!677117))))

(assert (=> d!167481 (= lt!677117 e!885093)))

(assert (=> d!167481 (= c!146924 (and (is-Cons!37013 (t!51927 (t!51927 l!556))) (bvslt (_1!12985 (h!38557 (t!51927 (t!51927 l!556)))) newKey!21)))))

(assert (=> d!167481 (isStrictlySorted!1196 (t!51927 (t!51927 l!556)))))

(assert (=> d!167481 (= (insertStrictlySorted!638 (t!51927 (t!51927 l!556)) newKey!21 newValue!21) lt!677117)))

(declare-fun b!1585296 () Bool)

(assert (=> b!1585296 (= e!885095 (contains!10488 lt!677117 (tuple2!25949 newKey!21 newValue!21)))))

(declare-fun bm!72609 () Bool)

(assert (=> bm!72609 (= call!72610 call!72611)))

(declare-fun b!1585297 () Bool)

(declare-fun res!1082748 () Bool)

(assert (=> b!1585297 (=> (not res!1082748) (not e!885095))))

(assert (=> b!1585297 (= res!1082748 (containsKey!1009 lt!677117 newKey!21))))

(declare-fun b!1585298 () Bool)

(assert (=> b!1585298 (= e!885093 call!72611)))

(declare-fun b!1585299 () Bool)

(declare-fun c!146925 () Bool)

(assert (=> b!1585299 (= c!146925 (and (is-Cons!37013 (t!51927 (t!51927 l!556))) (bvsgt (_1!12985 (h!38557 (t!51927 (t!51927 l!556)))) newKey!21)))))

(declare-fun e!885096 () List!37017)

(assert (=> b!1585299 (= e!885097 e!885096)))

(declare-fun b!1585300 () Bool)

(assert (=> b!1585300 (= e!885094 (insertStrictlySorted!638 (t!51927 (t!51927 (t!51927 l!556))) newKey!21 newValue!21))))

(declare-fun b!1585301 () Bool)

(assert (=> b!1585301 (= e!885096 call!72612)))

(declare-fun b!1585302 () Bool)

(assert (=> b!1585302 (= e!885094 (ite c!146927 (t!51927 (t!51927 (t!51927 l!556))) (ite c!146925 (Cons!37013 (h!38557 (t!51927 (t!51927 l!556))) (t!51927 (t!51927 (t!51927 l!556)))) Nil!37014)))))

(declare-fun b!1585303 () Bool)

(assert (=> b!1585303 (= e!885096 call!72612)))

(assert (= (and d!167481 c!146924) b!1585298))

(assert (= (and d!167481 (not c!146924)) b!1585295))

(assert (= (and b!1585295 c!146927) b!1585294))

(assert (= (and b!1585295 (not c!146927)) b!1585299))

(assert (= (and b!1585299 c!146925) b!1585303))

(assert (= (and b!1585299 (not c!146925)) b!1585301))

(assert (= (or b!1585303 b!1585301) bm!72608))

(assert (= (or b!1585294 bm!72608) bm!72609))

(assert (= (or b!1585298 bm!72609) bm!72607))

(assert (= (and bm!72607 c!146926) b!1585300))

(assert (= (and bm!72607 (not c!146926)) b!1585302))

(assert (= (and d!167481 res!1082749) b!1585297))

(assert (= (and b!1585297 res!1082748) b!1585296))

(declare-fun m!1453471 () Bool)

(assert (=> b!1585297 m!1453471))

(declare-fun m!1453473 () Bool)

(assert (=> b!1585300 m!1453473))

(declare-fun m!1453475 () Bool)

(assert (=> b!1585296 m!1453475))

(declare-fun m!1453477 () Bool)

(assert (=> d!167481 m!1453477))

(assert (=> d!167481 m!1453451))

(declare-fun m!1453479 () Bool)

(assert (=> bm!72607 m!1453479))

(assert (=> b!1585246 d!167481))

(declare-fun d!167483 () Bool)

(declare-fun c!146930 () Bool)

(assert (=> d!167483 (= c!146930 (is-Nil!37014 lt!677096))))

(declare-fun e!885102 () (Set tuple2!25948))

(assert (=> d!167483 (= (content!856 lt!677096) e!885102)))

(declare-fun b!1585310 () Bool)

(assert (=> b!1585310 (= e!885102 (as set.empty (Set tuple2!25948)))))

(declare-fun b!1585311 () Bool)

(assert (=> b!1585311 (= e!885102 (set.union (set.insert (h!38557 lt!677096) (as set.empty (Set tuple2!25948))) (content!856 (t!51927 lt!677096))))))

(assert (= (and d!167483 c!146930) b!1585310))

(assert (= (and d!167483 (not c!146930)) b!1585311))

(declare-fun m!1453483 () Bool)

(assert (=> b!1585311 m!1453483))

(assert (=> b!1585311 m!1453453))

(assert (=> d!167437 d!167483))

(declare-fun b!1585314 () Bool)

(declare-fun e!885105 () Bool)

(declare-fun tp!115276 () Bool)

(assert (=> b!1585314 (= e!885105 (and tp_is_empty!39521 tp!115276))))

(assert (=> b!1585264 (= tp!115272 e!885105)))

(assert (= (and b!1585264 (is-Cons!37013 (t!51927 (t!51927 l!556)))) b!1585314))

(push 1)

(assert (not b!1585300))

(assert tp_is_empty!39521)

(assert (not d!167471))

(assert (not b!1585289))

(assert (not d!167479))

(assert (not b!1585296))

(assert (not d!167481))

(assert (not b!1585283))

(assert (not b!1585293))

(assert (not b!1585291))

(assert (not b!1585311))

(assert (not bm!72607))

(assert (not b!1585314))

(assert (not b!1585285))

(assert (not b!1585281))

(assert (not b!1585287))

(assert (not b!1585297))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

