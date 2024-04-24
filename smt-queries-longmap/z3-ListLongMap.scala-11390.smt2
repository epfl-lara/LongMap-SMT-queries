; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132846 () Bool)

(assert start!132846)

(declare-fun b!1556028 () Bool)

(declare-fun e!866504 () Bool)

(declare-fun e!866507 () Bool)

(assert (=> b!1556028 (= e!866504 (not e!866507))))

(declare-fun res!1064209 () Bool)

(assert (=> b!1556028 (=> res!1064209 e!866507)))

(declare-datatypes ((B!2216 0))(
  ( (B!2217 (val!19194 Int)) )
))
(declare-datatypes ((tuple2!24818 0))(
  ( (tuple2!24819 (_1!12420 (_ BitVec 64)) (_2!12420 B!2216)) )
))
(declare-datatypes ((List!36257 0))(
  ( (Nil!36254) (Cons!36253 (h!37717 tuple2!24818) (t!50970 List!36257)) )
))
(declare-datatypes ((ListLongMap!22435 0))(
  ( (ListLongMap!22436 (toList!11233 List!36257)) )
))
(declare-fun lm!249 () ListLongMap!22435)

(declare-fun isStrictlySorted!879 (List!36257) Bool)

(assert (=> b!1556028 (= res!1064209 (not (isStrictlySorted!879 (toList!11233 lm!249))))))

(declare-fun e!866505 () Bool)

(assert (=> b!1556028 e!866505))

(declare-fun res!1064211 () Bool)

(assert (=> b!1556028 (=> (not res!1064211) (not e!866505))))

(declare-fun lt!670628 () List!36257)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun containsKey!761 (List!36257 (_ BitVec 64)) Bool)

(assert (=> b!1556028 (= res!1064211 (containsKey!761 lt!670628 a0!49))))

(declare-fun a!523 () (_ BitVec 64))

(declare-fun b!96 () B!2216)

(declare-fun insertStrictlySorted!508 (List!36257 (_ BitVec 64) B!2216) List!36257)

(assert (=> b!1556028 (= lt!670628 (insertStrictlySorted!508 (toList!11233 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51661 0))(
  ( (Unit!51662) )
))
(declare-fun lt!670629 () Unit!51661)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!4 (List!36257 (_ BitVec 64) B!2216 (_ BitVec 64)) Unit!51661)

(assert (=> b!1556028 (= lt!670629 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!4 (toList!11233 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1556029 () Bool)

(declare-fun contains!10187 (ListLongMap!22435 (_ BitVec 64)) Bool)

(declare-fun +!5052 (ListLongMap!22435 tuple2!24818) ListLongMap!22435)

(assert (=> b!1556029 (= e!866507 (contains!10187 (+!5052 lm!249 (tuple2!24819 a!523 b!96)) a0!49))))

(declare-datatypes ((Option!810 0))(
  ( (Some!809 (v!21991 B!2216)) (None!808) )
))
(declare-fun isDefined!550 (Option!810) Bool)

(declare-fun getValueByKey!735 (List!36257 (_ BitVec 64)) Option!810)

(assert (=> b!1556029 (isDefined!550 (getValueByKey!735 (toList!11233 lm!249) a0!49))))

(declare-fun lt!670630 () Unit!51661)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!504 (List!36257 (_ BitVec 64)) Unit!51661)

(assert (=> b!1556029 (= lt!670630 (lemmaContainsKeyImpliesGetValueByKeyDefined!504 (toList!11233 lm!249) a0!49))))

(declare-fun res!1064210 () Bool)

(assert (=> start!132846 (=> (not res!1064210) (not e!866504))))

(assert (=> start!132846 (= res!1064210 (contains!10187 lm!249 a0!49))))

(assert (=> start!132846 e!866504))

(declare-fun e!866506 () Bool)

(declare-fun inv!57311 (ListLongMap!22435) Bool)

(assert (=> start!132846 (and (inv!57311 lm!249) e!866506)))

(assert (=> start!132846 true))

(declare-fun tp_is_empty!38227 () Bool)

(assert (=> start!132846 tp_is_empty!38227))

(declare-fun b!1556030 () Bool)

(declare-fun res!1064208 () Bool)

(assert (=> b!1556030 (=> (not res!1064208) (not e!866504))))

(assert (=> b!1556030 (= res!1064208 (not (= a0!49 a!523)))))

(declare-fun b!1556031 () Bool)

(declare-fun tp!112119 () Bool)

(assert (=> b!1556031 (= e!866506 tp!112119)))

(declare-fun b!1556032 () Bool)

(assert (=> b!1556032 (= e!866505 (= (getValueByKey!735 lt!670628 a0!49) (getValueByKey!735 (toList!11233 lm!249) a0!49)))))

(declare-fun b!1556033 () Bool)

(declare-fun res!1064207 () Bool)

(assert (=> b!1556033 (=> (not res!1064207) (not e!866504))))

(assert (=> b!1556033 (= res!1064207 (containsKey!761 (toList!11233 lm!249) a0!49))))

(assert (= (and start!132846 res!1064210) b!1556030))

(assert (= (and b!1556030 res!1064208) b!1556033))

(assert (= (and b!1556033 res!1064207) b!1556028))

(assert (= (and b!1556028 res!1064211) b!1556032))

(assert (= (and b!1556028 (not res!1064209)) b!1556029))

(assert (= start!132846 b!1556031))

(declare-fun m!1434491 () Bool)

(assert (=> b!1556032 m!1434491))

(declare-fun m!1434493 () Bool)

(assert (=> b!1556032 m!1434493))

(declare-fun m!1434495 () Bool)

(assert (=> b!1556028 m!1434495))

(declare-fun m!1434497 () Bool)

(assert (=> b!1556028 m!1434497))

(declare-fun m!1434499 () Bool)

(assert (=> b!1556028 m!1434499))

(declare-fun m!1434501 () Bool)

(assert (=> b!1556028 m!1434501))

(declare-fun m!1434503 () Bool)

(assert (=> start!132846 m!1434503))

(declare-fun m!1434505 () Bool)

(assert (=> start!132846 m!1434505))

(declare-fun m!1434507 () Bool)

(assert (=> b!1556033 m!1434507))

(assert (=> b!1556029 m!1434493))

(declare-fun m!1434509 () Bool)

(assert (=> b!1556029 m!1434509))

(assert (=> b!1556029 m!1434493))

(declare-fun m!1434511 () Bool)

(assert (=> b!1556029 m!1434511))

(assert (=> b!1556029 m!1434509))

(declare-fun m!1434513 () Bool)

(assert (=> b!1556029 m!1434513))

(declare-fun m!1434515 () Bool)

(assert (=> b!1556029 m!1434515))

(check-sat (not b!1556033) (not start!132846) tp_is_empty!38227 (not b!1556031) (not b!1556028) (not b!1556029) (not b!1556032))
(check-sat)
(get-model)

(declare-fun b!1556095 () Bool)

(declare-fun e!866547 () Option!810)

(assert (=> b!1556095 (= e!866547 None!808)))

(declare-fun b!1556092 () Bool)

(declare-fun e!866546 () Option!810)

(assert (=> b!1556092 (= e!866546 (Some!809 (_2!12420 (h!37717 (toList!11233 lm!249)))))))

(declare-fun d!162273 () Bool)

(declare-fun c!144070 () Bool)

(get-info :version)

(assert (=> d!162273 (= c!144070 (and ((_ is Cons!36253) (toList!11233 lm!249)) (= (_1!12420 (h!37717 (toList!11233 lm!249))) a0!49)))))

(assert (=> d!162273 (= (getValueByKey!735 (toList!11233 lm!249) a0!49) e!866546)))

(declare-fun b!1556093 () Bool)

(assert (=> b!1556093 (= e!866546 e!866547)))

(declare-fun c!144071 () Bool)

(assert (=> b!1556093 (= c!144071 (and ((_ is Cons!36253) (toList!11233 lm!249)) (not (= (_1!12420 (h!37717 (toList!11233 lm!249))) a0!49))))))

(declare-fun b!1556094 () Bool)

(assert (=> b!1556094 (= e!866547 (getValueByKey!735 (t!50970 (toList!11233 lm!249)) a0!49))))

(assert (= (and d!162273 c!144070) b!1556092))

(assert (= (and d!162273 (not c!144070)) b!1556093))

(assert (= (and b!1556093 c!144071) b!1556094))

(assert (= (and b!1556093 (not c!144071)) b!1556095))

(declare-fun m!1434571 () Bool)

(assert (=> b!1556094 m!1434571))

(assert (=> b!1556029 d!162273))

(declare-fun d!162281 () Bool)

(declare-fun isEmpty!1138 (Option!810) Bool)

(assert (=> d!162281 (= (isDefined!550 (getValueByKey!735 (toList!11233 lm!249) a0!49)) (not (isEmpty!1138 (getValueByKey!735 (toList!11233 lm!249) a0!49))))))

(declare-fun bs!44675 () Bool)

(assert (= bs!44675 d!162281))

(assert (=> bs!44675 m!1434493))

(declare-fun m!1434573 () Bool)

(assert (=> bs!44675 m!1434573))

(assert (=> b!1556029 d!162281))

(declare-fun d!162283 () Bool)

(assert (=> d!162283 (isDefined!550 (getValueByKey!735 (toList!11233 lm!249) a0!49))))

(declare-fun lt!670651 () Unit!51661)

(declare-fun choose!2035 (List!36257 (_ BitVec 64)) Unit!51661)

(assert (=> d!162283 (= lt!670651 (choose!2035 (toList!11233 lm!249) a0!49))))

(declare-fun e!866560 () Bool)

(assert (=> d!162283 e!866560))

(declare-fun res!1064256 () Bool)

(assert (=> d!162283 (=> (not res!1064256) (not e!866560))))

(assert (=> d!162283 (= res!1064256 (isStrictlySorted!879 (toList!11233 lm!249)))))

(assert (=> d!162283 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!504 (toList!11233 lm!249) a0!49) lt!670651)))

(declare-fun b!1556112 () Bool)

(assert (=> b!1556112 (= e!866560 (containsKey!761 (toList!11233 lm!249) a0!49))))

(assert (= (and d!162283 res!1064256) b!1556112))

(assert (=> d!162283 m!1434493))

(assert (=> d!162283 m!1434493))

(assert (=> d!162283 m!1434511))

(declare-fun m!1434583 () Bool)

(assert (=> d!162283 m!1434583))

(assert (=> d!162283 m!1434495))

(assert (=> b!1556112 m!1434507))

(assert (=> b!1556029 d!162283))

(declare-fun d!162293 () Bool)

(declare-fun e!866572 () Bool)

(assert (=> d!162293 e!866572))

(declare-fun res!1064264 () Bool)

(assert (=> d!162293 (=> res!1064264 e!866572)))

(declare-fun lt!670673 () Bool)

(assert (=> d!162293 (= res!1064264 (not lt!670673))))

(declare-fun lt!670672 () Bool)

(assert (=> d!162293 (= lt!670673 lt!670672)))

(declare-fun lt!670674 () Unit!51661)

(declare-fun e!866573 () Unit!51661)

(assert (=> d!162293 (= lt!670674 e!866573)))

(declare-fun c!144080 () Bool)

(assert (=> d!162293 (= c!144080 lt!670672)))

(assert (=> d!162293 (= lt!670672 (containsKey!761 (toList!11233 (+!5052 lm!249 (tuple2!24819 a!523 b!96))) a0!49))))

(assert (=> d!162293 (= (contains!10187 (+!5052 lm!249 (tuple2!24819 a!523 b!96)) a0!49) lt!670673)))

(declare-fun b!1556128 () Bool)

(declare-fun lt!670671 () Unit!51661)

(assert (=> b!1556128 (= e!866573 lt!670671)))

(assert (=> b!1556128 (= lt!670671 (lemmaContainsKeyImpliesGetValueByKeyDefined!504 (toList!11233 (+!5052 lm!249 (tuple2!24819 a!523 b!96))) a0!49))))

(assert (=> b!1556128 (isDefined!550 (getValueByKey!735 (toList!11233 (+!5052 lm!249 (tuple2!24819 a!523 b!96))) a0!49))))

(declare-fun b!1556129 () Bool)

(declare-fun Unit!51667 () Unit!51661)

(assert (=> b!1556129 (= e!866573 Unit!51667)))

(declare-fun b!1556130 () Bool)

(assert (=> b!1556130 (= e!866572 (isDefined!550 (getValueByKey!735 (toList!11233 (+!5052 lm!249 (tuple2!24819 a!523 b!96))) a0!49)))))

(assert (= (and d!162293 c!144080) b!1556128))

(assert (= (and d!162293 (not c!144080)) b!1556129))

(assert (= (and d!162293 (not res!1064264)) b!1556130))

(declare-fun m!1434587 () Bool)

(assert (=> d!162293 m!1434587))

(declare-fun m!1434589 () Bool)

(assert (=> b!1556128 m!1434589))

(declare-fun m!1434591 () Bool)

(assert (=> b!1556128 m!1434591))

(assert (=> b!1556128 m!1434591))

(declare-fun m!1434593 () Bool)

(assert (=> b!1556128 m!1434593))

(assert (=> b!1556130 m!1434591))

(assert (=> b!1556130 m!1434591))

(assert (=> b!1556130 m!1434593))

(assert (=> b!1556029 d!162293))

(declare-fun d!162297 () Bool)

(declare-fun e!866595 () Bool)

(assert (=> d!162297 e!866595))

(declare-fun res!1064281 () Bool)

(assert (=> d!162297 (=> (not res!1064281) (not e!866595))))

(declare-fun lt!670700 () ListLongMap!22435)

(assert (=> d!162297 (= res!1064281 (contains!10187 lt!670700 (_1!12420 (tuple2!24819 a!523 b!96))))))

(declare-fun lt!670699 () List!36257)

(assert (=> d!162297 (= lt!670700 (ListLongMap!22436 lt!670699))))

(declare-fun lt!670701 () Unit!51661)

(declare-fun lt!670698 () Unit!51661)

(assert (=> d!162297 (= lt!670701 lt!670698)))

(assert (=> d!162297 (= (getValueByKey!735 lt!670699 (_1!12420 (tuple2!24819 a!523 b!96))) (Some!809 (_2!12420 (tuple2!24819 a!523 b!96))))))

(declare-fun lemmaContainsTupThenGetReturnValue!376 (List!36257 (_ BitVec 64) B!2216) Unit!51661)

(assert (=> d!162297 (= lt!670698 (lemmaContainsTupThenGetReturnValue!376 lt!670699 (_1!12420 (tuple2!24819 a!523 b!96)) (_2!12420 (tuple2!24819 a!523 b!96))))))

(assert (=> d!162297 (= lt!670699 (insertStrictlySorted!508 (toList!11233 lm!249) (_1!12420 (tuple2!24819 a!523 b!96)) (_2!12420 (tuple2!24819 a!523 b!96))))))

(assert (=> d!162297 (= (+!5052 lm!249 (tuple2!24819 a!523 b!96)) lt!670700)))

(declare-fun b!1556172 () Bool)

(declare-fun res!1064280 () Bool)

(assert (=> b!1556172 (=> (not res!1064280) (not e!866595))))

(assert (=> b!1556172 (= res!1064280 (= (getValueByKey!735 (toList!11233 lt!670700) (_1!12420 (tuple2!24819 a!523 b!96))) (Some!809 (_2!12420 (tuple2!24819 a!523 b!96)))))))

(declare-fun b!1556173 () Bool)

(declare-fun contains!10190 (List!36257 tuple2!24818) Bool)

(assert (=> b!1556173 (= e!866595 (contains!10190 (toList!11233 lt!670700) (tuple2!24819 a!523 b!96)))))

(assert (= (and d!162297 res!1064281) b!1556172))

(assert (= (and b!1556172 res!1064280) b!1556173))

(declare-fun m!1434613 () Bool)

(assert (=> d!162297 m!1434613))

(declare-fun m!1434615 () Bool)

(assert (=> d!162297 m!1434615))

(declare-fun m!1434617 () Bool)

(assert (=> d!162297 m!1434617))

(declare-fun m!1434619 () Bool)

(assert (=> d!162297 m!1434619))

(declare-fun m!1434621 () Bool)

(assert (=> b!1556172 m!1434621))

(declare-fun m!1434623 () Bool)

(assert (=> b!1556173 m!1434623))

(assert (=> b!1556029 d!162297))

(declare-fun d!162303 () Bool)

(declare-fun res!1064291 () Bool)

(declare-fun e!866605 () Bool)

(assert (=> d!162303 (=> res!1064291 e!866605)))

(assert (=> d!162303 (= res!1064291 (or ((_ is Nil!36254) (toList!11233 lm!249)) ((_ is Nil!36254) (t!50970 (toList!11233 lm!249)))))))

(assert (=> d!162303 (= (isStrictlySorted!879 (toList!11233 lm!249)) e!866605)))

(declare-fun b!1556185 () Bool)

(declare-fun e!866606 () Bool)

(assert (=> b!1556185 (= e!866605 e!866606)))

(declare-fun res!1064292 () Bool)

(assert (=> b!1556185 (=> (not res!1064292) (not e!866606))))

(assert (=> b!1556185 (= res!1064292 (bvslt (_1!12420 (h!37717 (toList!11233 lm!249))) (_1!12420 (h!37717 (t!50970 (toList!11233 lm!249))))))))

(declare-fun b!1556186 () Bool)

(assert (=> b!1556186 (= e!866606 (isStrictlySorted!879 (t!50970 (toList!11233 lm!249))))))

(assert (= (and d!162303 (not res!1064291)) b!1556185))

(assert (= (and b!1556185 res!1064292) b!1556186))

(declare-fun m!1434637 () Bool)

(assert (=> b!1556186 m!1434637))

(assert (=> b!1556028 d!162303))

(declare-fun d!162309 () Bool)

(declare-fun res!1064305 () Bool)

(declare-fun e!866619 () Bool)

(assert (=> d!162309 (=> res!1064305 e!866619)))

(assert (=> d!162309 (= res!1064305 (and ((_ is Cons!36253) lt!670628) (= (_1!12420 (h!37717 lt!670628)) a0!49)))))

(assert (=> d!162309 (= (containsKey!761 lt!670628 a0!49) e!866619)))

(declare-fun b!1556199 () Bool)

(declare-fun e!866620 () Bool)

(assert (=> b!1556199 (= e!866619 e!866620)))

(declare-fun res!1064306 () Bool)

(assert (=> b!1556199 (=> (not res!1064306) (not e!866620))))

(assert (=> b!1556199 (= res!1064306 (and (or (not ((_ is Cons!36253) lt!670628)) (bvsle (_1!12420 (h!37717 lt!670628)) a0!49)) ((_ is Cons!36253) lt!670628) (bvslt (_1!12420 (h!37717 lt!670628)) a0!49)))))

(declare-fun b!1556200 () Bool)

(assert (=> b!1556200 (= e!866620 (containsKey!761 (t!50970 lt!670628) a0!49))))

(assert (= (and d!162309 (not res!1064305)) b!1556199))

(assert (= (and b!1556199 res!1064306) b!1556200))

(declare-fun m!1434645 () Bool)

(assert (=> b!1556200 m!1434645))

(assert (=> b!1556028 d!162309))

(declare-fun b!1556277 () Bool)

(declare-fun c!144125 () Bool)

(assert (=> b!1556277 (= c!144125 (and ((_ is Cons!36253) (toList!11233 lm!249)) (bvsgt (_1!12420 (h!37717 (toList!11233 lm!249))) a!523)))))

(declare-fun e!866672 () List!36257)

(declare-fun e!866671 () List!36257)

(assert (=> b!1556277 (= e!866672 e!866671)))

(declare-fun d!162315 () Bool)

(declare-fun e!866669 () Bool)

(assert (=> d!162315 e!866669))

(declare-fun res!1064329 () Bool)

(assert (=> d!162315 (=> (not res!1064329) (not e!866669))))

(declare-fun lt!670732 () List!36257)

(assert (=> d!162315 (= res!1064329 (isStrictlySorted!879 lt!670732))))

(declare-fun e!866670 () List!36257)

(assert (=> d!162315 (= lt!670732 e!866670)))

(declare-fun c!144122 () Bool)

(assert (=> d!162315 (= c!144122 (and ((_ is Cons!36253) (toList!11233 lm!249)) (bvslt (_1!12420 (h!37717 (toList!11233 lm!249))) a!523)))))

(assert (=> d!162315 (isStrictlySorted!879 (toList!11233 lm!249))))

(assert (=> d!162315 (= (insertStrictlySorted!508 (toList!11233 lm!249) a!523 b!96) lt!670732)))

(declare-fun b!1556278 () Bool)

(assert (=> b!1556278 (= e!866670 e!866672)))

(declare-fun c!144123 () Bool)

(assert (=> b!1556278 (= c!144123 (and ((_ is Cons!36253) (toList!11233 lm!249)) (= (_1!12420 (h!37717 (toList!11233 lm!249))) a!523)))))

(declare-fun b!1556279 () Bool)

(declare-fun call!71546 () List!36257)

(assert (=> b!1556279 (= e!866672 call!71546)))

(declare-fun e!866668 () List!36257)

(declare-fun b!1556280 () Bool)

(assert (=> b!1556280 (= e!866668 (insertStrictlySorted!508 (t!50970 (toList!11233 lm!249)) a!523 b!96))))

(declare-fun b!1556281 () Bool)

(assert (=> b!1556281 (= e!866668 (ite c!144123 (t!50970 (toList!11233 lm!249)) (ite c!144125 (Cons!36253 (h!37717 (toList!11233 lm!249)) (t!50970 (toList!11233 lm!249))) Nil!36254)))))

(declare-fun b!1556282 () Bool)

(assert (=> b!1556282 (= e!866669 (contains!10190 lt!670732 (tuple2!24819 a!523 b!96)))))

(declare-fun b!1556283 () Bool)

(declare-fun call!71545 () List!36257)

(assert (=> b!1556283 (= e!866671 call!71545)))

(declare-fun bm!71542 () Bool)

(declare-fun call!71547 () List!36257)

(declare-fun $colon$colon!945 (List!36257 tuple2!24818) List!36257)

(assert (=> bm!71542 (= call!71547 ($colon$colon!945 e!866668 (ite c!144122 (h!37717 (toList!11233 lm!249)) (tuple2!24819 a!523 b!96))))))

(declare-fun c!144124 () Bool)

(assert (=> bm!71542 (= c!144124 c!144122)))

(declare-fun b!1556284 () Bool)

(declare-fun res!1064330 () Bool)

(assert (=> b!1556284 (=> (not res!1064330) (not e!866669))))

(assert (=> b!1556284 (= res!1064330 (containsKey!761 lt!670732 a!523))))

(declare-fun b!1556285 () Bool)

(assert (=> b!1556285 (= e!866671 call!71545)))

(declare-fun b!1556286 () Bool)

(assert (=> b!1556286 (= e!866670 call!71547)))

(declare-fun bm!71543 () Bool)

(assert (=> bm!71543 (= call!71546 call!71547)))

(declare-fun bm!71544 () Bool)

(assert (=> bm!71544 (= call!71545 call!71546)))

(assert (= (and d!162315 c!144122) b!1556286))

(assert (= (and d!162315 (not c!144122)) b!1556278))

(assert (= (and b!1556278 c!144123) b!1556279))

(assert (= (and b!1556278 (not c!144123)) b!1556277))

(assert (= (and b!1556277 c!144125) b!1556283))

(assert (= (and b!1556277 (not c!144125)) b!1556285))

(assert (= (or b!1556283 b!1556285) bm!71544))

(assert (= (or b!1556279 bm!71544) bm!71543))

(assert (= (or b!1556286 bm!71543) bm!71542))

(assert (= (and bm!71542 c!144124) b!1556280))

(assert (= (and bm!71542 (not c!144124)) b!1556281))

(assert (= (and d!162315 res!1064329) b!1556284))

(assert (= (and b!1556284 res!1064330) b!1556282))

(declare-fun m!1434667 () Bool)

(assert (=> b!1556284 m!1434667))

(declare-fun m!1434671 () Bool)

(assert (=> d!162315 m!1434671))

(assert (=> d!162315 m!1434495))

(declare-fun m!1434675 () Bool)

(assert (=> bm!71542 m!1434675))

(declare-fun m!1434677 () Bool)

(assert (=> b!1556280 m!1434677))

(declare-fun m!1434679 () Bool)

(assert (=> b!1556282 m!1434679))

(assert (=> b!1556028 d!162315))

(declare-fun d!162339 () Bool)

(declare-fun e!866686 () Bool)

(assert (=> d!162339 e!866686))

(declare-fun res!1064342 () Bool)

(assert (=> d!162339 (=> (not res!1064342) (not e!866686))))

(assert (=> d!162339 (= res!1064342 (= (containsKey!761 (insertStrictlySorted!508 (toList!11233 lm!249) a!523 b!96) a0!49) (containsKey!761 (toList!11233 lm!249) a0!49)))))

(declare-fun lt!670748 () Unit!51661)

(declare-fun choose!2038 (List!36257 (_ BitVec 64) B!2216 (_ BitVec 64)) Unit!51661)

(assert (=> d!162339 (= lt!670748 (choose!2038 (toList!11233 lm!249) a!523 b!96 a0!49))))

(declare-fun e!866687 () Bool)

(assert (=> d!162339 e!866687))

(declare-fun res!1064343 () Bool)

(assert (=> d!162339 (=> (not res!1064343) (not e!866687))))

(assert (=> d!162339 (= res!1064343 (isStrictlySorted!879 (toList!11233 lm!249)))))

(assert (=> d!162339 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!4 (toList!11233 lm!249) a!523 b!96 a0!49) lt!670748)))

(declare-fun b!1556308 () Bool)

(assert (=> b!1556308 (= e!866687 (not (= a!523 a0!49)))))

(declare-fun b!1556309 () Bool)

(assert (=> b!1556309 (= e!866686 (= (getValueByKey!735 (insertStrictlySorted!508 (toList!11233 lm!249) a!523 b!96) a0!49) (getValueByKey!735 (toList!11233 lm!249) a0!49)))))

(assert (= (and d!162339 res!1064343) b!1556308))

(assert (= (and d!162339 res!1064342) b!1556309))

(assert (=> d!162339 m!1434499))

(assert (=> d!162339 m!1434507))

(declare-fun m!1434691 () Bool)

(assert (=> d!162339 m!1434691))

(assert (=> d!162339 m!1434499))

(declare-fun m!1434693 () Bool)

(assert (=> d!162339 m!1434693))

(assert (=> d!162339 m!1434495))

(assert (=> b!1556309 m!1434499))

(assert (=> b!1556309 m!1434499))

(declare-fun m!1434695 () Bool)

(assert (=> b!1556309 m!1434695))

(assert (=> b!1556309 m!1434493))

(assert (=> b!1556028 d!162339))

(declare-fun d!162343 () Bool)

(declare-fun e!866690 () Bool)

(assert (=> d!162343 e!866690))

(declare-fun res!1064348 () Bool)

(assert (=> d!162343 (=> res!1064348 e!866690)))

(declare-fun lt!670751 () Bool)

(assert (=> d!162343 (= res!1064348 (not lt!670751))))

(declare-fun lt!670750 () Bool)

(assert (=> d!162343 (= lt!670751 lt!670750)))

(declare-fun lt!670752 () Unit!51661)

(declare-fun e!866691 () Unit!51661)

(assert (=> d!162343 (= lt!670752 e!866691)))

(declare-fun c!144131 () Bool)

(assert (=> d!162343 (= c!144131 lt!670750)))

(assert (=> d!162343 (= lt!670750 (containsKey!761 (toList!11233 lm!249) a0!49))))

(assert (=> d!162343 (= (contains!10187 lm!249 a0!49) lt!670751)))

(declare-fun b!1556314 () Bool)

(declare-fun lt!670749 () Unit!51661)

(assert (=> b!1556314 (= e!866691 lt!670749)))

(assert (=> b!1556314 (= lt!670749 (lemmaContainsKeyImpliesGetValueByKeyDefined!504 (toList!11233 lm!249) a0!49))))

(assert (=> b!1556314 (isDefined!550 (getValueByKey!735 (toList!11233 lm!249) a0!49))))

(declare-fun b!1556315 () Bool)

(declare-fun Unit!51670 () Unit!51661)

(assert (=> b!1556315 (= e!866691 Unit!51670)))

(declare-fun b!1556316 () Bool)

(assert (=> b!1556316 (= e!866690 (isDefined!550 (getValueByKey!735 (toList!11233 lm!249) a0!49)))))

(assert (= (and d!162343 c!144131) b!1556314))

(assert (= (and d!162343 (not c!144131)) b!1556315))

(assert (= (and d!162343 (not res!1064348)) b!1556316))

(assert (=> d!162343 m!1434507))

(assert (=> b!1556314 m!1434515))

(assert (=> b!1556314 m!1434493))

(assert (=> b!1556314 m!1434493))

(assert (=> b!1556314 m!1434511))

(assert (=> b!1556316 m!1434493))

(assert (=> b!1556316 m!1434493))

(assert (=> b!1556316 m!1434511))

(assert (=> start!132846 d!162343))

(declare-fun d!162345 () Bool)

(assert (=> d!162345 (= (inv!57311 lm!249) (isStrictlySorted!879 (toList!11233 lm!249)))))

(declare-fun bs!44680 () Bool)

(assert (= bs!44680 d!162345))

(assert (=> bs!44680 m!1434495))

(assert (=> start!132846 d!162345))

(declare-fun d!162347 () Bool)

(declare-fun res!1064353 () Bool)

(declare-fun e!866696 () Bool)

(assert (=> d!162347 (=> res!1064353 e!866696)))

(assert (=> d!162347 (= res!1064353 (and ((_ is Cons!36253) (toList!11233 lm!249)) (= (_1!12420 (h!37717 (toList!11233 lm!249))) a0!49)))))

(assert (=> d!162347 (= (containsKey!761 (toList!11233 lm!249) a0!49) e!866696)))

(declare-fun b!1556321 () Bool)

(declare-fun e!866697 () Bool)

(assert (=> b!1556321 (= e!866696 e!866697)))

(declare-fun res!1064354 () Bool)

(assert (=> b!1556321 (=> (not res!1064354) (not e!866697))))

(assert (=> b!1556321 (= res!1064354 (and (or (not ((_ is Cons!36253) (toList!11233 lm!249))) (bvsle (_1!12420 (h!37717 (toList!11233 lm!249))) a0!49)) ((_ is Cons!36253) (toList!11233 lm!249)) (bvslt (_1!12420 (h!37717 (toList!11233 lm!249))) a0!49)))))

(declare-fun b!1556322 () Bool)

(assert (=> b!1556322 (= e!866697 (containsKey!761 (t!50970 (toList!11233 lm!249)) a0!49))))

(assert (= (and d!162347 (not res!1064353)) b!1556321))

(assert (= (and b!1556321 res!1064354) b!1556322))

(declare-fun m!1434697 () Bool)

(assert (=> b!1556322 m!1434697))

(assert (=> b!1556033 d!162347))

(declare-fun b!1556328 () Bool)

(declare-fun e!866700 () Option!810)

(assert (=> b!1556328 (= e!866700 None!808)))

(declare-fun b!1556325 () Bool)

(declare-fun e!866699 () Option!810)

(assert (=> b!1556325 (= e!866699 (Some!809 (_2!12420 (h!37717 lt!670628))))))

(declare-fun d!162349 () Bool)

(declare-fun c!144132 () Bool)

(assert (=> d!162349 (= c!144132 (and ((_ is Cons!36253) lt!670628) (= (_1!12420 (h!37717 lt!670628)) a0!49)))))

(assert (=> d!162349 (= (getValueByKey!735 lt!670628 a0!49) e!866699)))

(declare-fun b!1556326 () Bool)

(assert (=> b!1556326 (= e!866699 e!866700)))

(declare-fun c!144133 () Bool)

(assert (=> b!1556326 (= c!144133 (and ((_ is Cons!36253) lt!670628) (not (= (_1!12420 (h!37717 lt!670628)) a0!49))))))

(declare-fun b!1556327 () Bool)

(assert (=> b!1556327 (= e!866700 (getValueByKey!735 (t!50970 lt!670628) a0!49))))

(assert (= (and d!162349 c!144132) b!1556325))

(assert (= (and d!162349 (not c!144132)) b!1556326))

(assert (= (and b!1556326 c!144133) b!1556327))

(assert (= (and b!1556326 (not c!144133)) b!1556328))

(declare-fun m!1434707 () Bool)

(assert (=> b!1556327 m!1434707))

(assert (=> b!1556032 d!162349))

(assert (=> b!1556032 d!162273))

(declare-fun b!1556340 () Bool)

(declare-fun e!866708 () Bool)

(declare-fun tp!112131 () Bool)

(assert (=> b!1556340 (= e!866708 (and tp_is_empty!38227 tp!112131))))

(assert (=> b!1556031 (= tp!112119 e!866708)))

(assert (= (and b!1556031 ((_ is Cons!36253) (toList!11233 lm!249))) b!1556340))

(check-sat (not d!162343) (not b!1556322) (not b!1556314) (not b!1556280) (not d!162339) (not b!1556186) tp_is_empty!38227 (not d!162281) (not b!1556309) (not b!1556340) (not b!1556282) (not b!1556173) (not b!1556316) (not bm!71542) (not b!1556130) (not d!162283) (not d!162297) (not b!1556112) (not b!1556200) (not b!1556284) (not d!162293) (not b!1556327) (not b!1556172) (not b!1556128) (not b!1556094) (not d!162345) (not d!162315))
(check-sat)
