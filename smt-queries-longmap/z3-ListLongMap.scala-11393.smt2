; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132942 () Bool)

(assert start!132942)

(declare-fun b!1556497 () Bool)

(declare-fun e!866819 () Bool)

(declare-fun tp!112164 () Bool)

(assert (=> b!1556497 (= e!866819 tp!112164)))

(declare-fun b!1556498 () Bool)

(declare-fun res!1064457 () Bool)

(declare-fun e!866818 () Bool)

(assert (=> b!1556498 (=> (not res!1064457) (not e!866818))))

(declare-datatypes ((B!2234 0))(
  ( (B!2235 (val!19203 Int)) )
))
(declare-datatypes ((tuple2!24836 0))(
  ( (tuple2!24837 (_1!12429 (_ BitVec 64)) (_2!12429 B!2234)) )
))
(declare-datatypes ((List!36266 0))(
  ( (Nil!36263) (Cons!36262 (h!37726 tuple2!24836) (t!50979 List!36266)) )
))
(declare-datatypes ((ListLongMap!22453 0))(
  ( (ListLongMap!22454 (toList!11242 List!36266)) )
))
(declare-fun lm!249 () ListLongMap!22453)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun containsKey!770 (List!36266 (_ BitVec 64)) Bool)

(assert (=> b!1556498 (= res!1064457 (containsKey!770 (toList!11242 lm!249) a0!49))))

(declare-fun b!1556499 () Bool)

(declare-fun e!866817 () Bool)

(assert (=> b!1556499 (= e!866818 e!866817)))

(declare-fun res!1064458 () Bool)

(assert (=> b!1556499 (=> res!1064458 e!866817)))

(declare-fun isStrictlySorted!886 (List!36266) Bool)

(assert (=> b!1556499 (= res!1064458 (not (isStrictlySorted!886 (toList!11242 lm!249))))))

(declare-fun b!1556500 () Bool)

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1556500 (= e!866817 (= a!523 a0!49))))

(declare-fun res!1064459 () Bool)

(assert (=> start!132942 (=> (not res!1064459) (not e!866818))))

(declare-fun contains!10199 (ListLongMap!22453 (_ BitVec 64)) Bool)

(assert (=> start!132942 (= res!1064459 (contains!10199 lm!249 a0!49))))

(assert (=> start!132942 e!866818))

(declare-fun inv!57335 (ListLongMap!22453) Bool)

(assert (=> start!132942 (and (inv!57335 lm!249) e!866819)))

(assert (=> start!132942 true))

(declare-fun b!1556501 () Bool)

(declare-fun res!1064460 () Bool)

(assert (=> b!1556501 (=> (not res!1064460) (not e!866818))))

(assert (=> b!1556501 (= res!1064460 (not (= a0!49 a!523)))))

(assert (= (and start!132942 res!1064459) b!1556501))

(assert (= (and b!1556501 res!1064460) b!1556498))

(assert (= (and b!1556498 res!1064457) b!1556499))

(assert (= (and b!1556499 (not res!1064458)) b!1556500))

(assert (= start!132942 b!1556497))

(declare-fun m!1434833 () Bool)

(assert (=> b!1556498 m!1434833))

(declare-fun m!1434835 () Bool)

(assert (=> b!1556499 m!1434835))

(declare-fun m!1434837 () Bool)

(assert (=> start!132942 m!1434837))

(declare-fun m!1434839 () Bool)

(assert (=> start!132942 m!1434839))

(check-sat (not start!132942) (not b!1556499) (not b!1556498) (not b!1556497))
(check-sat)
(get-model)

(declare-fun d!162376 () Bool)

(declare-fun e!866855 () Bool)

(assert (=> d!162376 e!866855))

(declare-fun res!1064499 () Bool)

(assert (=> d!162376 (=> res!1064499 e!866855)))

(declare-fun lt!670831 () Bool)

(assert (=> d!162376 (= res!1064499 (not lt!670831))))

(declare-fun lt!670833 () Bool)

(assert (=> d!162376 (= lt!670831 lt!670833)))

(declare-datatypes ((Unit!51687 0))(
  ( (Unit!51688) )
))
(declare-fun lt!670832 () Unit!51687)

(declare-fun e!866854 () Unit!51687)

(assert (=> d!162376 (= lt!670832 e!866854)))

(declare-fun c!144145 () Bool)

(assert (=> d!162376 (= c!144145 lt!670833)))

(assert (=> d!162376 (= lt!670833 (containsKey!770 (toList!11242 lm!249) a0!49))))

(assert (=> d!162376 (= (contains!10199 lm!249 a0!49) lt!670831)))

(declare-fun b!1556550 () Bool)

(declare-fun lt!670834 () Unit!51687)

(assert (=> b!1556550 (= e!866854 lt!670834)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!513 (List!36266 (_ BitVec 64)) Unit!51687)

(assert (=> b!1556550 (= lt!670834 (lemmaContainsKeyImpliesGetValueByKeyDefined!513 (toList!11242 lm!249) a0!49))))

(declare-datatypes ((Option!819 0))(
  ( (Some!818 (v!22000 B!2234)) (None!817) )
))
(declare-fun isDefined!559 (Option!819) Bool)

(declare-fun getValueByKey!744 (List!36266 (_ BitVec 64)) Option!819)

(assert (=> b!1556550 (isDefined!559 (getValueByKey!744 (toList!11242 lm!249) a0!49))))

(declare-fun b!1556551 () Bool)

(declare-fun Unit!51689 () Unit!51687)

(assert (=> b!1556551 (= e!866854 Unit!51689)))

(declare-fun b!1556552 () Bool)

(assert (=> b!1556552 (= e!866855 (isDefined!559 (getValueByKey!744 (toList!11242 lm!249) a0!49)))))

(assert (= (and d!162376 c!144145) b!1556550))

(assert (= (and d!162376 (not c!144145)) b!1556551))

(assert (= (and d!162376 (not res!1064499)) b!1556552))

(assert (=> d!162376 m!1434833))

(declare-fun m!1434861 () Bool)

(assert (=> b!1556550 m!1434861))

(declare-fun m!1434863 () Bool)

(assert (=> b!1556550 m!1434863))

(assert (=> b!1556550 m!1434863))

(declare-fun m!1434865 () Bool)

(assert (=> b!1556550 m!1434865))

(assert (=> b!1556552 m!1434863))

(assert (=> b!1556552 m!1434863))

(assert (=> b!1556552 m!1434865))

(assert (=> start!132942 d!162376))

(declare-fun d!162385 () Bool)

(assert (=> d!162385 (= (inv!57335 lm!249) (isStrictlySorted!886 (toList!11242 lm!249)))))

(declare-fun bs!44693 () Bool)

(assert (= bs!44693 d!162385))

(assert (=> bs!44693 m!1434835))

(assert (=> start!132942 d!162385))

(declare-fun d!162387 () Bool)

(declare-fun res!1064509 () Bool)

(declare-fun e!866870 () Bool)

(assert (=> d!162387 (=> res!1064509 e!866870)))

(get-info :version)

(assert (=> d!162387 (= res!1064509 (or ((_ is Nil!36263) (toList!11242 lm!249)) ((_ is Nil!36263) (t!50979 (toList!11242 lm!249)))))))

(assert (=> d!162387 (= (isStrictlySorted!886 (toList!11242 lm!249)) e!866870)))

(declare-fun b!1556572 () Bool)

(declare-fun e!866871 () Bool)

(assert (=> b!1556572 (= e!866870 e!866871)))

(declare-fun res!1064510 () Bool)

(assert (=> b!1556572 (=> (not res!1064510) (not e!866871))))

(assert (=> b!1556572 (= res!1064510 (bvslt (_1!12429 (h!37726 (toList!11242 lm!249))) (_1!12429 (h!37726 (t!50979 (toList!11242 lm!249))))))))

(declare-fun b!1556573 () Bool)

(assert (=> b!1556573 (= e!866871 (isStrictlySorted!886 (t!50979 (toList!11242 lm!249))))))

(assert (= (and d!162387 (not res!1064509)) b!1556572))

(assert (= (and b!1556572 res!1064510) b!1556573))

(declare-fun m!1434873 () Bool)

(assert (=> b!1556573 m!1434873))

(assert (=> b!1556499 d!162387))

(declare-fun d!162391 () Bool)

(declare-fun res!1064520 () Bool)

(declare-fun e!866882 () Bool)

(assert (=> d!162391 (=> res!1064520 e!866882)))

(assert (=> d!162391 (= res!1064520 (and ((_ is Cons!36262) (toList!11242 lm!249)) (= (_1!12429 (h!37726 (toList!11242 lm!249))) a0!49)))))

(assert (=> d!162391 (= (containsKey!770 (toList!11242 lm!249) a0!49) e!866882)))

(declare-fun b!1556585 () Bool)

(declare-fun e!866883 () Bool)

(assert (=> b!1556585 (= e!866882 e!866883)))

(declare-fun res!1064521 () Bool)

(assert (=> b!1556585 (=> (not res!1064521) (not e!866883))))

(assert (=> b!1556585 (= res!1064521 (and (or (not ((_ is Cons!36262) (toList!11242 lm!249))) (bvsle (_1!12429 (h!37726 (toList!11242 lm!249))) a0!49)) ((_ is Cons!36262) (toList!11242 lm!249)) (bvslt (_1!12429 (h!37726 (toList!11242 lm!249))) a0!49)))))

(declare-fun b!1556586 () Bool)

(assert (=> b!1556586 (= e!866883 (containsKey!770 (t!50979 (toList!11242 lm!249)) a0!49))))

(assert (= (and d!162391 (not res!1064520)) b!1556585))

(assert (= (and b!1556585 res!1064521) b!1556586))

(declare-fun m!1434881 () Bool)

(assert (=> b!1556586 m!1434881))

(assert (=> b!1556498 d!162391))

(declare-fun b!1556597 () Bool)

(declare-fun e!866892 () Bool)

(declare-fun tp_is_empty!38245 () Bool)

(declare-fun tp!112173 () Bool)

(assert (=> b!1556597 (= e!866892 (and tp_is_empty!38245 tp!112173))))

(assert (=> b!1556497 (= tp!112164 e!866892)))

(assert (= (and b!1556497 ((_ is Cons!36262) (toList!11242 lm!249))) b!1556597))

(check-sat (not b!1556597) tp_is_empty!38245 (not d!162376) (not d!162385) (not b!1556586) (not b!1556550) (not b!1556552) (not b!1556573))
(check-sat)
