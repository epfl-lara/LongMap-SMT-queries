; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132972 () Bool)

(assert start!132972)

(declare-fun b!1556620 () Bool)

(declare-fun res!1064541 () Bool)

(declare-fun e!866908 () Bool)

(assert (=> b!1556620 (=> (not res!1064541) (not e!866908))))

(declare-datatypes ((B!2240 0))(
  ( (B!2241 (val!19206 Int)) )
))
(declare-datatypes ((tuple2!24842 0))(
  ( (tuple2!24843 (_1!12432 (_ BitVec 64)) (_2!12432 B!2240)) )
))
(declare-datatypes ((List!36269 0))(
  ( (Nil!36266) (Cons!36265 (h!37729 tuple2!24842) (t!50982 List!36269)) )
))
(declare-datatypes ((ListLongMap!22459 0))(
  ( (ListLongMap!22460 (toList!11245 List!36269)) )
))
(declare-fun lm!249 () ListLongMap!22459)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun containsKey!773 (List!36269 (_ BitVec 64)) Bool)

(assert (=> b!1556620 (= res!1064541 (containsKey!773 (toList!11245 lm!249) a0!49))))

(declare-fun res!1064540 () Bool)

(assert (=> start!132972 (=> (not res!1064540) (not e!866908))))

(declare-fun contains!10202 (ListLongMap!22459 (_ BitVec 64)) Bool)

(assert (=> start!132972 (= res!1064540 (contains!10202 lm!249 a0!49))))

(assert (=> start!132972 e!866908))

(declare-fun e!866909 () Bool)

(declare-fun inv!57343 (ListLongMap!22459) Bool)

(assert (=> start!132972 (and (inv!57343 lm!249) e!866909)))

(assert (=> start!132972 true))

(declare-fun tp_is_empty!38251 () Bool)

(assert (=> start!132972 tp_is_empty!38251))

(declare-fun b!1556621 () Bool)

(declare-fun isStrictlySorted!889 (List!36269) Bool)

(assert (=> b!1556621 (= e!866908 (not (isStrictlySorted!889 (toList!11245 lm!249))))))

(declare-fun e!866907 () Bool)

(assert (=> b!1556621 e!866907))

(declare-fun res!1064538 () Bool)

(assert (=> b!1556621 (=> (not res!1064538) (not e!866907))))

(declare-fun lt!670863 () List!36269)

(assert (=> b!1556621 (= res!1064538 (containsKey!773 lt!670863 a0!49))))

(declare-fun a!523 () (_ BitVec 64))

(declare-fun b!96 () B!2240)

(declare-fun insertStrictlySorted!514 (List!36269 (_ BitVec 64) B!2240) List!36269)

(assert (=> b!1556621 (= lt!670863 (insertStrictlySorted!514 (toList!11245 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51696 0))(
  ( (Unit!51697) )
))
(declare-fun lt!670864 () Unit!51696)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!10 (List!36269 (_ BitVec 64) B!2240 (_ BitVec 64)) Unit!51696)

(assert (=> b!1556621 (= lt!670864 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!10 (toList!11245 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1556622 () Bool)

(declare-fun res!1064539 () Bool)

(assert (=> b!1556622 (=> (not res!1064539) (not e!866908))))

(assert (=> b!1556622 (= res!1064539 (not (= a0!49 a!523)))))

(declare-fun b!1556623 () Bool)

(declare-datatypes ((Option!822 0))(
  ( (Some!821 (v!22003 B!2240)) (None!820) )
))
(declare-fun getValueByKey!747 (List!36269 (_ BitVec 64)) Option!822)

(assert (=> b!1556623 (= e!866907 (= (getValueByKey!747 lt!670863 a0!49) (getValueByKey!747 (toList!11245 lm!249) a0!49)))))

(declare-fun b!1556624 () Bool)

(declare-fun tp!112182 () Bool)

(assert (=> b!1556624 (= e!866909 tp!112182)))

(assert (= (and start!132972 res!1064540) b!1556622))

(assert (= (and b!1556622 res!1064539) b!1556620))

(assert (= (and b!1556620 res!1064541) b!1556621))

(assert (= (and b!1556621 res!1064538) b!1556623))

(assert (= start!132972 b!1556624))

(declare-fun m!1434887 () Bool)

(assert (=> b!1556620 m!1434887))

(declare-fun m!1434889 () Bool)

(assert (=> start!132972 m!1434889))

(declare-fun m!1434891 () Bool)

(assert (=> start!132972 m!1434891))

(declare-fun m!1434893 () Bool)

(assert (=> b!1556621 m!1434893))

(declare-fun m!1434895 () Bool)

(assert (=> b!1556621 m!1434895))

(declare-fun m!1434897 () Bool)

(assert (=> b!1556621 m!1434897))

(declare-fun m!1434899 () Bool)

(assert (=> b!1556621 m!1434899))

(declare-fun m!1434901 () Bool)

(assert (=> b!1556623 m!1434901))

(declare-fun m!1434903 () Bool)

(assert (=> b!1556623 m!1434903))

(check-sat (not start!132972) (not b!1556623) (not b!1556621) (not b!1556620) (not b!1556624) tp_is_empty!38251)
(check-sat)
(get-model)

(declare-fun d!162403 () Bool)

(declare-fun e!866946 () Bool)

(assert (=> d!162403 e!866946))

(declare-fun res!1064579 () Bool)

(assert (=> d!162403 (=> res!1064579 e!866946)))

(declare-fun lt!670900 () Bool)

(assert (=> d!162403 (= res!1064579 (not lt!670900))))

(declare-fun lt!670898 () Bool)

(assert (=> d!162403 (= lt!670900 lt!670898)))

(declare-fun lt!670897 () Unit!51696)

(declare-fun e!866947 () Unit!51696)

(assert (=> d!162403 (= lt!670897 e!866947)))

(declare-fun c!144157 () Bool)

(assert (=> d!162403 (= c!144157 lt!670898)))

(assert (=> d!162403 (= lt!670898 (containsKey!773 (toList!11245 lm!249) a0!49))))

(assert (=> d!162403 (= (contains!10202 lm!249 a0!49) lt!670900)))

(declare-fun b!1556678 () Bool)

(declare-fun lt!670899 () Unit!51696)

(assert (=> b!1556678 (= e!866947 lt!670899)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!516 (List!36269 (_ BitVec 64)) Unit!51696)

(assert (=> b!1556678 (= lt!670899 (lemmaContainsKeyImpliesGetValueByKeyDefined!516 (toList!11245 lm!249) a0!49))))

(declare-fun isDefined!562 (Option!822) Bool)

(assert (=> b!1556678 (isDefined!562 (getValueByKey!747 (toList!11245 lm!249) a0!49))))

(declare-fun b!1556679 () Bool)

(declare-fun Unit!51702 () Unit!51696)

(assert (=> b!1556679 (= e!866947 Unit!51702)))

(declare-fun b!1556680 () Bool)

(assert (=> b!1556680 (= e!866946 (isDefined!562 (getValueByKey!747 (toList!11245 lm!249) a0!49)))))

(assert (= (and d!162403 c!144157) b!1556678))

(assert (= (and d!162403 (not c!144157)) b!1556679))

(assert (= (and d!162403 (not res!1064579)) b!1556680))

(assert (=> d!162403 m!1434887))

(declare-fun m!1434947 () Bool)

(assert (=> b!1556678 m!1434947))

(assert (=> b!1556678 m!1434903))

(assert (=> b!1556678 m!1434903))

(declare-fun m!1434949 () Bool)

(assert (=> b!1556678 m!1434949))

(assert (=> b!1556680 m!1434903))

(assert (=> b!1556680 m!1434903))

(assert (=> b!1556680 m!1434949))

(assert (=> start!132972 d!162403))

(declare-fun d!162413 () Bool)

(assert (=> d!162413 (= (inv!57343 lm!249) (isStrictlySorted!889 (toList!11245 lm!249)))))

(declare-fun bs!44700 () Bool)

(assert (= bs!44700 d!162413))

(assert (=> bs!44700 m!1434893))

(assert (=> start!132972 d!162413))

(declare-fun d!162415 () Bool)

(declare-fun res!1064594 () Bool)

(declare-fun e!866962 () Bool)

(assert (=> d!162415 (=> res!1064594 e!866962)))

(get-info :version)

(assert (=> d!162415 (= res!1064594 (or ((_ is Nil!36266) (toList!11245 lm!249)) ((_ is Nil!36266) (t!50982 (toList!11245 lm!249)))))))

(assert (=> d!162415 (= (isStrictlySorted!889 (toList!11245 lm!249)) e!866962)))

(declare-fun b!1556695 () Bool)

(declare-fun e!866963 () Bool)

(assert (=> b!1556695 (= e!866962 e!866963)))

(declare-fun res!1064595 () Bool)

(assert (=> b!1556695 (=> (not res!1064595) (not e!866963))))

(assert (=> b!1556695 (= res!1064595 (bvslt (_1!12432 (h!37729 (toList!11245 lm!249))) (_1!12432 (h!37729 (t!50982 (toList!11245 lm!249))))))))

(declare-fun b!1556696 () Bool)

(assert (=> b!1556696 (= e!866963 (isStrictlySorted!889 (t!50982 (toList!11245 lm!249))))))

(assert (= (and d!162415 (not res!1064594)) b!1556695))

(assert (= (and b!1556695 res!1064595) b!1556696))

(declare-fun m!1434955 () Bool)

(assert (=> b!1556696 m!1434955))

(assert (=> b!1556621 d!162415))

(declare-fun d!162421 () Bool)

(declare-fun res!1064600 () Bool)

(declare-fun e!866972 () Bool)

(assert (=> d!162421 (=> res!1064600 e!866972)))

(assert (=> d!162421 (= res!1064600 (and ((_ is Cons!36265) lt!670863) (= (_1!12432 (h!37729 lt!670863)) a0!49)))))

(assert (=> d!162421 (= (containsKey!773 lt!670863 a0!49) e!866972)))

(declare-fun b!1556709 () Bool)

(declare-fun e!866973 () Bool)

(assert (=> b!1556709 (= e!866972 e!866973)))

(declare-fun res!1064601 () Bool)

(assert (=> b!1556709 (=> (not res!1064601) (not e!866973))))

(assert (=> b!1556709 (= res!1064601 (and (or (not ((_ is Cons!36265) lt!670863)) (bvsle (_1!12432 (h!37729 lt!670863)) a0!49)) ((_ is Cons!36265) lt!670863) (bvslt (_1!12432 (h!37729 lt!670863)) a0!49)))))

(declare-fun b!1556710 () Bool)

(assert (=> b!1556710 (= e!866973 (containsKey!773 (t!50982 lt!670863) a0!49))))

(assert (= (and d!162421 (not res!1064600)) b!1556709))

(assert (= (and b!1556709 res!1064601) b!1556710))

(declare-fun m!1434957 () Bool)

(assert (=> b!1556710 m!1434957))

(assert (=> b!1556621 d!162421))

(declare-fun b!1556797 () Bool)

(declare-fun e!867026 () List!36269)

(declare-fun call!71572 () List!36269)

(assert (=> b!1556797 (= e!867026 call!71572)))

(declare-fun bm!71569 () Bool)

(declare-fun call!71573 () List!36269)

(declare-fun call!71574 () List!36269)

(assert (=> bm!71569 (= call!71573 call!71574)))

(declare-fun b!1556799 () Bool)

(declare-fun e!867023 () List!36269)

(declare-fun e!867024 () List!36269)

(assert (=> b!1556799 (= e!867023 e!867024)))

(declare-fun c!144195 () Bool)

(assert (=> b!1556799 (= c!144195 (and ((_ is Cons!36265) (toList!11245 lm!249)) (= (_1!12432 (h!37729 (toList!11245 lm!249))) a!523)))))

(declare-fun e!867027 () List!36269)

(declare-fun b!1556800 () Bool)

(assert (=> b!1556800 (= e!867027 (insertStrictlySorted!514 (t!50982 (toList!11245 lm!249)) a!523 b!96))))

(declare-fun b!1556801 () Bool)

(assert (=> b!1556801 (= e!867026 call!71572)))

(declare-fun b!1556802 () Bool)

(assert (=> b!1556802 (= e!867023 call!71574)))

(declare-fun bm!71570 () Bool)

(assert (=> bm!71570 (= call!71572 call!71573)))

(declare-fun b!1556798 () Bool)

(declare-fun e!867025 () Bool)

(declare-fun lt!670910 () List!36269)

(declare-fun contains!10205 (List!36269 tuple2!24842) Bool)

(assert (=> b!1556798 (= e!867025 (contains!10205 lt!670910 (tuple2!24843 a!523 b!96)))))

(declare-fun d!162423 () Bool)

(assert (=> d!162423 e!867025))

(declare-fun res!1064625 () Bool)

(assert (=> d!162423 (=> (not res!1064625) (not e!867025))))

(assert (=> d!162423 (= res!1064625 (isStrictlySorted!889 lt!670910))))

(assert (=> d!162423 (= lt!670910 e!867023)))

(declare-fun c!144197 () Bool)

(assert (=> d!162423 (= c!144197 (and ((_ is Cons!36265) (toList!11245 lm!249)) (bvslt (_1!12432 (h!37729 (toList!11245 lm!249))) a!523)))))

(assert (=> d!162423 (isStrictlySorted!889 (toList!11245 lm!249))))

(assert (=> d!162423 (= (insertStrictlySorted!514 (toList!11245 lm!249) a!523 b!96) lt!670910)))

(declare-fun b!1556803 () Bool)

(assert (=> b!1556803 (= e!867024 call!71573)))

(declare-fun b!1556804 () Bool)

(declare-fun c!144194 () Bool)

(assert (=> b!1556804 (= e!867027 (ite c!144195 (t!50982 (toList!11245 lm!249)) (ite c!144194 (Cons!36265 (h!37729 (toList!11245 lm!249)) (t!50982 (toList!11245 lm!249))) Nil!36266)))))

(declare-fun bm!71571 () Bool)

(declare-fun $colon$colon!948 (List!36269 tuple2!24842) List!36269)

(assert (=> bm!71571 (= call!71574 ($colon$colon!948 e!867027 (ite c!144197 (h!37729 (toList!11245 lm!249)) (tuple2!24843 a!523 b!96))))))

(declare-fun c!144196 () Bool)

(assert (=> bm!71571 (= c!144196 c!144197)))

(declare-fun b!1556805 () Bool)

(assert (=> b!1556805 (= c!144194 (and ((_ is Cons!36265) (toList!11245 lm!249)) (bvsgt (_1!12432 (h!37729 (toList!11245 lm!249))) a!523)))))

(assert (=> b!1556805 (= e!867024 e!867026)))

(declare-fun b!1556806 () Bool)

(declare-fun res!1064624 () Bool)

(assert (=> b!1556806 (=> (not res!1064624) (not e!867025))))

(assert (=> b!1556806 (= res!1064624 (containsKey!773 lt!670910 a!523))))

(assert (= (and d!162423 c!144197) b!1556802))

(assert (= (and d!162423 (not c!144197)) b!1556799))

(assert (= (and b!1556799 c!144195) b!1556803))

(assert (= (and b!1556799 (not c!144195)) b!1556805))

(assert (= (and b!1556805 c!144194) b!1556801))

(assert (= (and b!1556805 (not c!144194)) b!1556797))

(assert (= (or b!1556801 b!1556797) bm!71570))

(assert (= (or b!1556803 bm!71570) bm!71569))

(assert (= (or b!1556802 bm!71569) bm!71571))

(assert (= (and bm!71571 c!144196) b!1556800))

(assert (= (and bm!71571 (not c!144196)) b!1556804))

(assert (= (and d!162423 res!1064625) b!1556806))

(assert (= (and b!1556806 res!1064624) b!1556798))

(declare-fun m!1434977 () Bool)

(assert (=> b!1556800 m!1434977))

(declare-fun m!1434979 () Bool)

(assert (=> b!1556806 m!1434979))

(declare-fun m!1434981 () Bool)

(assert (=> bm!71571 m!1434981))

(declare-fun m!1434983 () Bool)

(assert (=> d!162423 m!1434983))

(assert (=> d!162423 m!1434893))

(declare-fun m!1434985 () Bool)

(assert (=> b!1556798 m!1434985))

(assert (=> b!1556621 d!162423))

(declare-fun d!162435 () Bool)

(declare-fun e!867052 () Bool)

(assert (=> d!162435 e!867052))

(declare-fun res!1064641 () Bool)

(assert (=> d!162435 (=> (not res!1064641) (not e!867052))))

(assert (=> d!162435 (= res!1064641 (= (containsKey!773 (insertStrictlySorted!514 (toList!11245 lm!249) a!523 b!96) a0!49) (containsKey!773 (toList!11245 lm!249) a0!49)))))

(declare-fun lt!670915 () Unit!51696)

(declare-fun choose!2042 (List!36269 (_ BitVec 64) B!2240 (_ BitVec 64)) Unit!51696)

(assert (=> d!162435 (= lt!670915 (choose!2042 (toList!11245 lm!249) a!523 b!96 a0!49))))

(declare-fun e!867051 () Bool)

(assert (=> d!162435 e!867051))

(declare-fun res!1064640 () Bool)

(assert (=> d!162435 (=> (not res!1064640) (not e!867051))))

(assert (=> d!162435 (= res!1064640 (isStrictlySorted!889 (toList!11245 lm!249)))))

(assert (=> d!162435 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!10 (toList!11245 lm!249) a!523 b!96 a0!49) lt!670915)))

(declare-fun b!1556845 () Bool)

(assert (=> b!1556845 (= e!867051 (not (= a!523 a0!49)))))

(declare-fun b!1556846 () Bool)

(assert (=> b!1556846 (= e!867052 (= (getValueByKey!747 (insertStrictlySorted!514 (toList!11245 lm!249) a!523 b!96) a0!49) (getValueByKey!747 (toList!11245 lm!249) a0!49)))))

(assert (= (and d!162435 res!1064640) b!1556845))

(assert (= (and d!162435 res!1064641) b!1556846))

(declare-fun m!1435009 () Bool)

(assert (=> d!162435 m!1435009))

(assert (=> d!162435 m!1434893))

(assert (=> d!162435 m!1434887))

(assert (=> d!162435 m!1434897))

(assert (=> d!162435 m!1434897))

(declare-fun m!1435011 () Bool)

(assert (=> d!162435 m!1435011))

(assert (=> b!1556846 m!1434897))

(assert (=> b!1556846 m!1434897))

(declare-fun m!1435013 () Bool)

(assert (=> b!1556846 m!1435013))

(assert (=> b!1556846 m!1434903))

(assert (=> b!1556621 d!162435))

(declare-fun d!162447 () Bool)

(declare-fun res!1064642 () Bool)

(declare-fun e!867053 () Bool)

(assert (=> d!162447 (=> res!1064642 e!867053)))

(assert (=> d!162447 (= res!1064642 (and ((_ is Cons!36265) (toList!11245 lm!249)) (= (_1!12432 (h!37729 (toList!11245 lm!249))) a0!49)))))

(assert (=> d!162447 (= (containsKey!773 (toList!11245 lm!249) a0!49) e!867053)))

(declare-fun b!1556847 () Bool)

(declare-fun e!867054 () Bool)

(assert (=> b!1556847 (= e!867053 e!867054)))

(declare-fun res!1064643 () Bool)

(assert (=> b!1556847 (=> (not res!1064643) (not e!867054))))

(assert (=> b!1556847 (= res!1064643 (and (or (not ((_ is Cons!36265) (toList!11245 lm!249))) (bvsle (_1!12432 (h!37729 (toList!11245 lm!249))) a0!49)) ((_ is Cons!36265) (toList!11245 lm!249)) (bvslt (_1!12432 (h!37729 (toList!11245 lm!249))) a0!49)))))

(declare-fun b!1556848 () Bool)

(assert (=> b!1556848 (= e!867054 (containsKey!773 (t!50982 (toList!11245 lm!249)) a0!49))))

(assert (= (and d!162447 (not res!1064642)) b!1556847))

(assert (= (and b!1556847 res!1064643) b!1556848))

(declare-fun m!1435015 () Bool)

(assert (=> b!1556848 m!1435015))

(assert (=> b!1556620 d!162447))

(declare-fun b!1556871 () Bool)

(declare-fun e!867070 () Option!822)

(assert (=> b!1556871 (= e!867070 (getValueByKey!747 (t!50982 lt!670863) a0!49))))

(declare-fun b!1556870 () Bool)

(declare-fun e!867069 () Option!822)

(assert (=> b!1556870 (= e!867069 e!867070)))

(declare-fun c!144217 () Bool)

(assert (=> b!1556870 (= c!144217 (and ((_ is Cons!36265) lt!670863) (not (= (_1!12432 (h!37729 lt!670863)) a0!49))))))

(declare-fun d!162449 () Bool)

(declare-fun c!144216 () Bool)

(assert (=> d!162449 (= c!144216 (and ((_ is Cons!36265) lt!670863) (= (_1!12432 (h!37729 lt!670863)) a0!49)))))

(assert (=> d!162449 (= (getValueByKey!747 lt!670863 a0!49) e!867069)))

(declare-fun b!1556869 () Bool)

(assert (=> b!1556869 (= e!867069 (Some!821 (_2!12432 (h!37729 lt!670863))))))

(declare-fun b!1556872 () Bool)

(assert (=> b!1556872 (= e!867070 None!820)))

(assert (= (and d!162449 c!144216) b!1556869))

(assert (= (and d!162449 (not c!144216)) b!1556870))

(assert (= (and b!1556870 c!144217) b!1556871))

(assert (= (and b!1556870 (not c!144217)) b!1556872))

(declare-fun m!1435023 () Bool)

(assert (=> b!1556871 m!1435023))

(assert (=> b!1556623 d!162449))

(declare-fun b!1556879 () Bool)

(declare-fun e!867074 () Option!822)

(assert (=> b!1556879 (= e!867074 (getValueByKey!747 (t!50982 (toList!11245 lm!249)) a0!49))))

(declare-fun b!1556878 () Bool)

(declare-fun e!867073 () Option!822)

(assert (=> b!1556878 (= e!867073 e!867074)))

(declare-fun c!144219 () Bool)

(assert (=> b!1556878 (= c!144219 (and ((_ is Cons!36265) (toList!11245 lm!249)) (not (= (_1!12432 (h!37729 (toList!11245 lm!249))) a0!49))))))

(declare-fun d!162451 () Bool)

(declare-fun c!144218 () Bool)

(assert (=> d!162451 (= c!144218 (and ((_ is Cons!36265) (toList!11245 lm!249)) (= (_1!12432 (h!37729 (toList!11245 lm!249))) a0!49)))))

(assert (=> d!162451 (= (getValueByKey!747 (toList!11245 lm!249) a0!49) e!867073)))

(declare-fun b!1556877 () Bool)

(assert (=> b!1556877 (= e!867073 (Some!821 (_2!12432 (h!37729 (toList!11245 lm!249)))))))

(declare-fun b!1556880 () Bool)

(assert (=> b!1556880 (= e!867074 None!820)))

(assert (= (and d!162451 c!144218) b!1556877))

(assert (= (and d!162451 (not c!144218)) b!1556878))

(assert (= (and b!1556878 c!144219) b!1556879))

(assert (= (and b!1556878 (not c!144219)) b!1556880))

(declare-fun m!1435025 () Bool)

(assert (=> b!1556879 m!1435025))

(assert (=> b!1556623 d!162451))

(declare-fun b!1556889 () Bool)

(declare-fun e!867080 () Bool)

(declare-fun tp!112194 () Bool)

(assert (=> b!1556889 (= e!867080 (and tp_is_empty!38251 tp!112194))))

(assert (=> b!1556624 (= tp!112182 e!867080)))

(assert (= (and b!1556624 ((_ is Cons!36265) (toList!11245 lm!249))) b!1556889))

(check-sat (not d!162403) (not b!1556848) (not bm!71571) (not d!162423) (not b!1556806) (not b!1556680) (not b!1556710) (not d!162435) (not d!162413) (not b!1556871) (not b!1556889) (not b!1556800) (not b!1556798) (not b!1556846) (not b!1556678) (not b!1556879) tp_is_empty!38251 (not b!1556696))
(check-sat)
