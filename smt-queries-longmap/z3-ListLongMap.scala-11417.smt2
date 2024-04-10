; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133078 () Bool)

(assert start!133078)

(declare-fun res!1065334 () Bool)

(declare-fun e!867601 () Bool)

(assert (=> start!133078 (=> (not res!1065334) (not e!867601))))

(declare-datatypes ((B!2380 0))(
  ( (B!2381 (val!19276 Int)) )
))
(declare-datatypes ((tuple2!24928 0))(
  ( (tuple2!24929 (_1!12475 (_ BitVec 64)) (_2!12475 B!2380)) )
))
(declare-datatypes ((List!36310 0))(
  ( (Nil!36307) (Cons!36306 (h!37752 tuple2!24928) (t!51037 List!36310)) )
))
(declare-datatypes ((ListLongMap!22429 0))(
  ( (ListLongMap!22430 (toList!11230 List!36310)) )
))
(declare-fun lm!250 () ListLongMap!22429)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun contains!10201 (ListLongMap!22429 (_ BitVec 64)) Bool)

(assert (=> start!133078 (= res!1065334 (contains!10201 lm!250 a0!50))))

(assert (=> start!133078 e!867601))

(declare-fun e!867602 () Bool)

(declare-fun inv!57474 (ListLongMap!22429) Bool)

(assert (=> start!133078 (and (inv!57474 lm!250) e!867602)))

(assert (=> start!133078 true))

(declare-fun tp_is_empty!38385 () Bool)

(assert (=> start!133078 tp_is_empty!38385))

(declare-fun b!1557522 () Bool)

(declare-fun res!1065333 () Bool)

(assert (=> b!1557522 (=> (not res!1065333) (not e!867601))))

(declare-fun a!524 () (_ BitVec 64))

(assert (=> b!1557522 (= res!1065333 (= a!524 a0!50))))

(declare-fun b!97 () B!2380)

(declare-fun b!1557523 () Bool)

(declare-fun +!5022 (ListLongMap!22429 tuple2!24928) ListLongMap!22429)

(assert (=> b!1557523 (= e!867601 (not (contains!10201 (+!5022 lm!250 (tuple2!24929 a!524 b!97)) a0!50)))))

(declare-fun b!1557524 () Bool)

(declare-fun tp!112515 () Bool)

(assert (=> b!1557524 (= e!867602 tp!112515)))

(assert (= (and start!133078 res!1065334) b!1557522))

(assert (= (and b!1557522 res!1065333) b!1557523))

(assert (= start!133078 b!1557524))

(declare-fun m!1434611 () Bool)

(assert (=> start!133078 m!1434611))

(declare-fun m!1434613 () Bool)

(assert (=> start!133078 m!1434613))

(declare-fun m!1434615 () Bool)

(assert (=> b!1557523 m!1434615))

(assert (=> b!1557523 m!1434615))

(declare-fun m!1434617 () Bool)

(assert (=> b!1557523 m!1434617))

(check-sat (not b!1557523) (not start!133078) (not b!1557524) tp_is_empty!38385)
(check-sat)
(get-model)

(declare-fun d!162483 () Bool)

(declare-fun e!867625 () Bool)

(assert (=> d!162483 e!867625))

(declare-fun res!1065349 () Bool)

(assert (=> d!162483 (=> res!1065349 e!867625)))

(declare-fun lt!670666 () Bool)

(assert (=> d!162483 (= res!1065349 (not lt!670666))))

(declare-fun lt!670667 () Bool)

(assert (=> d!162483 (= lt!670666 lt!670667)))

(declare-datatypes ((Unit!51867 0))(
  ( (Unit!51868) )
))
(declare-fun lt!670665 () Unit!51867)

(declare-fun e!867626 () Unit!51867)

(assert (=> d!162483 (= lt!670665 e!867626)))

(declare-fun c!143996 () Bool)

(assert (=> d!162483 (= c!143996 lt!670667)))

(declare-fun containsKey!821 (List!36310 (_ BitVec 64)) Bool)

(assert (=> d!162483 (= lt!670667 (containsKey!821 (toList!11230 (+!5022 lm!250 (tuple2!24929 a!524 b!97))) a0!50))))

(assert (=> d!162483 (= (contains!10201 (+!5022 lm!250 (tuple2!24929 a!524 b!97)) a0!50) lt!670666)))

(declare-fun b!1557558 () Bool)

(declare-fun lt!670664 () Unit!51867)

(assert (=> b!1557558 (= e!867626 lt!670664)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!528 (List!36310 (_ BitVec 64)) Unit!51867)

(assert (=> b!1557558 (= lt!670664 (lemmaContainsKeyImpliesGetValueByKeyDefined!528 (toList!11230 (+!5022 lm!250 (tuple2!24929 a!524 b!97))) a0!50))))

(declare-datatypes ((Option!863 0))(
  ( (Some!862 (v!22053 B!2380)) (None!861) )
))
(declare-fun isDefined!576 (Option!863) Bool)

(declare-fun getValueByKey!787 (List!36310 (_ BitVec 64)) Option!863)

(assert (=> b!1557558 (isDefined!576 (getValueByKey!787 (toList!11230 (+!5022 lm!250 (tuple2!24929 a!524 b!97))) a0!50))))

(declare-fun b!1557559 () Bool)

(declare-fun Unit!51871 () Unit!51867)

(assert (=> b!1557559 (= e!867626 Unit!51871)))

(declare-fun b!1557560 () Bool)

(assert (=> b!1557560 (= e!867625 (isDefined!576 (getValueByKey!787 (toList!11230 (+!5022 lm!250 (tuple2!24929 a!524 b!97))) a0!50)))))

(assert (= (and d!162483 c!143996) b!1557558))

(assert (= (and d!162483 (not c!143996)) b!1557559))

(assert (= (and d!162483 (not res!1065349)) b!1557560))

(declare-fun m!1434639 () Bool)

(assert (=> d!162483 m!1434639))

(declare-fun m!1434643 () Bool)

(assert (=> b!1557558 m!1434643))

(declare-fun m!1434647 () Bool)

(assert (=> b!1557558 m!1434647))

(assert (=> b!1557558 m!1434647))

(declare-fun m!1434649 () Bool)

(assert (=> b!1557558 m!1434649))

(assert (=> b!1557560 m!1434647))

(assert (=> b!1557560 m!1434647))

(assert (=> b!1557560 m!1434649))

(assert (=> b!1557523 d!162483))

(declare-fun d!162489 () Bool)

(declare-fun e!867636 () Bool)

(assert (=> d!162489 e!867636))

(declare-fun res!1065366 () Bool)

(assert (=> d!162489 (=> (not res!1065366) (not e!867636))))

(declare-fun lt!670703 () ListLongMap!22429)

(assert (=> d!162489 (= res!1065366 (contains!10201 lt!670703 (_1!12475 (tuple2!24929 a!524 b!97))))))

(declare-fun lt!670702 () List!36310)

(assert (=> d!162489 (= lt!670703 (ListLongMap!22430 lt!670702))))

(declare-fun lt!670700 () Unit!51867)

(declare-fun lt!670701 () Unit!51867)

(assert (=> d!162489 (= lt!670700 lt!670701)))

(assert (=> d!162489 (= (getValueByKey!787 lt!670702 (_1!12475 (tuple2!24929 a!524 b!97))) (Some!862 (_2!12475 (tuple2!24929 a!524 b!97))))))

(declare-fun lemmaContainsTupThenGetReturnValue!383 (List!36310 (_ BitVec 64) B!2380) Unit!51867)

(assert (=> d!162489 (= lt!670701 (lemmaContainsTupThenGetReturnValue!383 lt!670702 (_1!12475 (tuple2!24929 a!524 b!97)) (_2!12475 (tuple2!24929 a!524 b!97))))))

(declare-fun insertStrictlySorted!558 (List!36310 (_ BitVec 64) B!2380) List!36310)

(assert (=> d!162489 (= lt!670702 (insertStrictlySorted!558 (toList!11230 lm!250) (_1!12475 (tuple2!24929 a!524 b!97)) (_2!12475 (tuple2!24929 a!524 b!97))))))

(assert (=> d!162489 (= (+!5022 lm!250 (tuple2!24929 a!524 b!97)) lt!670703)))

(declare-fun b!1557578 () Bool)

(declare-fun res!1065365 () Bool)

(assert (=> b!1557578 (=> (not res!1065365) (not e!867636))))

(assert (=> b!1557578 (= res!1065365 (= (getValueByKey!787 (toList!11230 lt!670703) (_1!12475 (tuple2!24929 a!524 b!97))) (Some!862 (_2!12475 (tuple2!24929 a!524 b!97)))))))

(declare-fun b!1557579 () Bool)

(declare-fun contains!10203 (List!36310 tuple2!24928) Bool)

(assert (=> b!1557579 (= e!867636 (contains!10203 (toList!11230 lt!670703) (tuple2!24929 a!524 b!97)))))

(assert (= (and d!162489 res!1065366) b!1557578))

(assert (= (and b!1557578 res!1065365) b!1557579))

(declare-fun m!1434665 () Bool)

(assert (=> d!162489 m!1434665))

(declare-fun m!1434669 () Bool)

(assert (=> d!162489 m!1434669))

(declare-fun m!1434673 () Bool)

(assert (=> d!162489 m!1434673))

(declare-fun m!1434677 () Bool)

(assert (=> d!162489 m!1434677))

(declare-fun m!1434681 () Bool)

(assert (=> b!1557578 m!1434681))

(declare-fun m!1434683 () Bool)

(assert (=> b!1557579 m!1434683))

(assert (=> b!1557523 d!162489))

(declare-fun d!162497 () Bool)

(declare-fun e!867639 () Bool)

(assert (=> d!162497 e!867639))

(declare-fun res!1065368 () Bool)

(assert (=> d!162497 (=> res!1065368 e!867639)))

(declare-fun lt!670710 () Bool)

(assert (=> d!162497 (= res!1065368 (not lt!670710))))

(declare-fun lt!670711 () Bool)

(assert (=> d!162497 (= lt!670710 lt!670711)))

(declare-fun lt!670709 () Unit!51867)

(declare-fun e!867640 () Unit!51867)

(assert (=> d!162497 (= lt!670709 e!867640)))

(declare-fun c!143999 () Bool)

(assert (=> d!162497 (= c!143999 lt!670711)))

(assert (=> d!162497 (= lt!670711 (containsKey!821 (toList!11230 lm!250) a0!50))))

(assert (=> d!162497 (= (contains!10201 lm!250 a0!50) lt!670710)))

(declare-fun b!1557583 () Bool)

(declare-fun lt!670708 () Unit!51867)

(assert (=> b!1557583 (= e!867640 lt!670708)))

(assert (=> b!1557583 (= lt!670708 (lemmaContainsKeyImpliesGetValueByKeyDefined!528 (toList!11230 lm!250) a0!50))))

(assert (=> b!1557583 (isDefined!576 (getValueByKey!787 (toList!11230 lm!250) a0!50))))

(declare-fun b!1557584 () Bool)

(declare-fun Unit!51875 () Unit!51867)

(assert (=> b!1557584 (= e!867640 Unit!51875)))

(declare-fun b!1557585 () Bool)

(assert (=> b!1557585 (= e!867639 (isDefined!576 (getValueByKey!787 (toList!11230 lm!250) a0!50)))))

(assert (= (and d!162497 c!143999) b!1557583))

(assert (= (and d!162497 (not c!143999)) b!1557584))

(assert (= (and d!162497 (not res!1065368)) b!1557585))

(declare-fun m!1434691 () Bool)

(assert (=> d!162497 m!1434691))

(declare-fun m!1434693 () Bool)

(assert (=> b!1557583 m!1434693))

(declare-fun m!1434697 () Bool)

(assert (=> b!1557583 m!1434697))

(assert (=> b!1557583 m!1434697))

(declare-fun m!1434699 () Bool)

(assert (=> b!1557583 m!1434699))

(assert (=> b!1557585 m!1434697))

(assert (=> b!1557585 m!1434697))

(assert (=> b!1557585 m!1434699))

(assert (=> start!133078 d!162497))

(declare-fun d!162501 () Bool)

(declare-fun isStrictlySorted!960 (List!36310) Bool)

(assert (=> d!162501 (= (inv!57474 lm!250) (isStrictlySorted!960 (toList!11230 lm!250)))))

(declare-fun bs!44773 () Bool)

(assert (= bs!44773 d!162501))

(declare-fun m!1434715 () Bool)

(assert (=> bs!44773 m!1434715))

(assert (=> start!133078 d!162501))

(declare-fun b!1557602 () Bool)

(declare-fun e!867650 () Bool)

(declare-fun tp!112527 () Bool)

(assert (=> b!1557602 (= e!867650 (and tp_is_empty!38385 tp!112527))))

(assert (=> b!1557524 (= tp!112515 e!867650)))

(get-info :version)

(assert (= (and b!1557524 ((_ is Cons!36306) (toList!11230 lm!250))) b!1557602))

(check-sat (not b!1557578) (not d!162489) (not b!1557560) (not b!1557579) (not d!162497) (not b!1557602) (not b!1557583) (not b!1557558) (not d!162501) tp_is_empty!38385 (not b!1557585) (not d!162483))
(check-sat)
