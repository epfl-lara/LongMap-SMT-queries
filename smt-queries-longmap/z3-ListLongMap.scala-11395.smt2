; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133020 () Bool)

(assert start!133020)

(declare-fun b!1556907 () Bool)

(declare-fun e!867094 () Bool)

(declare-fun tp!112200 () Bool)

(assert (=> b!1556907 (= e!867094 tp!112200)))

(declare-fun b!1556908 () Bool)

(declare-fun res!1064666 () Bool)

(declare-fun e!867093 () Bool)

(assert (=> b!1556908 (=> (not res!1064666) (not e!867093))))

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1556908 (= res!1064666 (not (= a0!49 a!523)))))

(declare-fun b!1556909 () Bool)

(declare-fun e!867092 () Bool)

(assert (=> b!1556909 (= e!867093 (not e!867092))))

(declare-fun res!1064667 () Bool)

(assert (=> b!1556909 (=> res!1064667 e!867092)))

(declare-datatypes ((B!2246 0))(
  ( (B!2247 (val!19209 Int)) )
))
(declare-datatypes ((tuple2!24848 0))(
  ( (tuple2!24849 (_1!12435 (_ BitVec 64)) (_2!12435 B!2246)) )
))
(declare-datatypes ((List!36272 0))(
  ( (Nil!36269) (Cons!36268 (h!37732 tuple2!24848) (t!50985 List!36272)) )
))
(declare-datatypes ((ListLongMap!22465 0))(
  ( (ListLongMap!22466 (toList!11248 List!36272)) )
))
(declare-fun lm!249 () ListLongMap!22465)

(declare-fun isStrictlySorted!892 (List!36272) Bool)

(assert (=> b!1556909 (= res!1064667 (not (isStrictlySorted!892 (toList!11248 lm!249))))))

(declare-fun e!867095 () Bool)

(assert (=> b!1556909 e!867095))

(declare-fun res!1064663 () Bool)

(assert (=> b!1556909 (=> (not res!1064663) (not e!867095))))

(declare-fun lt!670937 () List!36272)

(declare-fun containsKey!776 (List!36272 (_ BitVec 64)) Bool)

(assert (=> b!1556909 (= res!1064663 (containsKey!776 lt!670937 a0!49))))

(declare-fun b!96 () B!2246)

(declare-fun insertStrictlySorted!517 (List!36272 (_ BitVec 64) B!2246) List!36272)

(assert (=> b!1556909 (= lt!670937 (insertStrictlySorted!517 (toList!11248 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51705 0))(
  ( (Unit!51706) )
))
(declare-fun lt!670939 () Unit!51705)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!13 (List!36272 (_ BitVec 64) B!2246 (_ BitVec 64)) Unit!51705)

(assert (=> b!1556909 (= lt!670939 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!13 (toList!11248 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1556910 () Bool)

(declare-fun apply!1115 (ListLongMap!22465 (_ BitVec 64)) B!2246)

(declare-fun +!5055 (ListLongMap!22465 tuple2!24848) ListLongMap!22465)

(assert (=> b!1556910 (= e!867092 (= (apply!1115 (+!5055 lm!249 (tuple2!24849 a!523 b!96)) a0!49) (apply!1115 lm!249 a0!49)))))

(declare-datatypes ((Option!825 0))(
  ( (Some!824 (v!22006 B!2246)) (None!823) )
))
(declare-fun isDefined!565 (Option!825) Bool)

(declare-fun getValueByKey!750 (List!36272 (_ BitVec 64)) Option!825)

(assert (=> b!1556910 (isDefined!565 (getValueByKey!750 (toList!11248 lm!249) a0!49))))

(declare-fun lt!670938 () Unit!51705)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!519 (List!36272 (_ BitVec 64)) Unit!51705)

(assert (=> b!1556910 (= lt!670938 (lemmaContainsKeyImpliesGetValueByKeyDefined!519 (toList!11248 lm!249) a0!49))))

(declare-fun b!1556911 () Bool)

(declare-fun res!1064664 () Bool)

(assert (=> b!1556911 (=> (not res!1064664) (not e!867093))))

(assert (=> b!1556911 (= res!1064664 (containsKey!776 (toList!11248 lm!249) a0!49))))

(declare-fun res!1064665 () Bool)

(assert (=> start!133020 (=> (not res!1064665) (not e!867093))))

(declare-fun contains!10208 (ListLongMap!22465 (_ BitVec 64)) Bool)

(assert (=> start!133020 (= res!1064665 (contains!10208 lm!249 a0!49))))

(assert (=> start!133020 e!867093))

(declare-fun inv!57351 (ListLongMap!22465) Bool)

(assert (=> start!133020 (and (inv!57351 lm!249) e!867094)))

(assert (=> start!133020 true))

(declare-fun tp_is_empty!38257 () Bool)

(assert (=> start!133020 tp_is_empty!38257))

(declare-fun b!1556912 () Bool)

(assert (=> b!1556912 (= e!867095 (= (getValueByKey!750 lt!670937 a0!49) (getValueByKey!750 (toList!11248 lm!249) a0!49)))))

(assert (= (and start!133020 res!1064665) b!1556908))

(assert (= (and b!1556908 res!1064666) b!1556911))

(assert (= (and b!1556911 res!1064664) b!1556909))

(assert (= (and b!1556909 res!1064663) b!1556912))

(assert (= (and b!1556909 (not res!1064667)) b!1556910))

(assert (= start!133020 b!1556907))

(declare-fun m!1435031 () Bool)

(assert (=> b!1556911 m!1435031))

(declare-fun m!1435033 () Bool)

(assert (=> b!1556912 m!1435033))

(declare-fun m!1435035 () Bool)

(assert (=> b!1556912 m!1435035))

(declare-fun m!1435037 () Bool)

(assert (=> b!1556910 m!1435037))

(assert (=> b!1556910 m!1435035))

(declare-fun m!1435039 () Bool)

(assert (=> b!1556910 m!1435039))

(assert (=> b!1556910 m!1435035))

(declare-fun m!1435041 () Bool)

(assert (=> b!1556910 m!1435041))

(declare-fun m!1435043 () Bool)

(assert (=> b!1556910 m!1435043))

(assert (=> b!1556910 m!1435039))

(declare-fun m!1435045 () Bool)

(assert (=> b!1556910 m!1435045))

(declare-fun m!1435047 () Bool)

(assert (=> start!133020 m!1435047))

(declare-fun m!1435049 () Bool)

(assert (=> start!133020 m!1435049))

(declare-fun m!1435051 () Bool)

(assert (=> b!1556909 m!1435051))

(declare-fun m!1435053 () Bool)

(assert (=> b!1556909 m!1435053))

(declare-fun m!1435055 () Bool)

(assert (=> b!1556909 m!1435055))

(declare-fun m!1435057 () Bool)

(assert (=> b!1556909 m!1435057))

(check-sat tp_is_empty!38257 (not start!133020) (not b!1556912) (not b!1556911) (not b!1556910) (not b!1556907) (not b!1556909))
(check-sat)
(get-model)

(declare-fun d!162457 () Bool)

(declare-fun c!144232 () Bool)

(get-info :version)

(assert (=> d!162457 (= c!144232 (and ((_ is Cons!36268) lt!670937) (= (_1!12435 (h!37732 lt!670937)) a0!49)))))

(declare-fun e!867131 () Option!825)

(assert (=> d!162457 (= (getValueByKey!750 lt!670937 a0!49) e!867131)))

(declare-fun b!1556973 () Bool)

(assert (=> b!1556973 (= e!867131 (Some!824 (_2!12435 (h!37732 lt!670937))))))

(declare-fun b!1556976 () Bool)

(declare-fun e!867133 () Option!825)

(assert (=> b!1556976 (= e!867133 None!823)))

(declare-fun b!1556974 () Bool)

(assert (=> b!1556974 (= e!867131 e!867133)))

(declare-fun c!144234 () Bool)

(assert (=> b!1556974 (= c!144234 (and ((_ is Cons!36268) lt!670937) (not (= (_1!12435 (h!37732 lt!670937)) a0!49))))))

(declare-fun b!1556975 () Bool)

(assert (=> b!1556975 (= e!867133 (getValueByKey!750 (t!50985 lt!670937) a0!49))))

(assert (= (and d!162457 c!144232) b!1556973))

(assert (= (and d!162457 (not c!144232)) b!1556974))

(assert (= (and b!1556974 c!144234) b!1556975))

(assert (= (and b!1556974 (not c!144234)) b!1556976))

(declare-fun m!1435115 () Bool)

(assert (=> b!1556975 m!1435115))

(assert (=> b!1556912 d!162457))

(declare-fun d!162463 () Bool)

(declare-fun c!144235 () Bool)

(assert (=> d!162463 (= c!144235 (and ((_ is Cons!36268) (toList!11248 lm!249)) (= (_1!12435 (h!37732 (toList!11248 lm!249))) a0!49)))))

(declare-fun e!867134 () Option!825)

(assert (=> d!162463 (= (getValueByKey!750 (toList!11248 lm!249) a0!49) e!867134)))

(declare-fun b!1556977 () Bool)

(assert (=> b!1556977 (= e!867134 (Some!824 (_2!12435 (h!37732 (toList!11248 lm!249)))))))

(declare-fun b!1556980 () Bool)

(declare-fun e!867135 () Option!825)

(assert (=> b!1556980 (= e!867135 None!823)))

(declare-fun b!1556978 () Bool)

(assert (=> b!1556978 (= e!867134 e!867135)))

(declare-fun c!144236 () Bool)

(assert (=> b!1556978 (= c!144236 (and ((_ is Cons!36268) (toList!11248 lm!249)) (not (= (_1!12435 (h!37732 (toList!11248 lm!249))) a0!49))))))

(declare-fun b!1556979 () Bool)

(assert (=> b!1556979 (= e!867135 (getValueByKey!750 (t!50985 (toList!11248 lm!249)) a0!49))))

(assert (= (and d!162463 c!144235) b!1556977))

(assert (= (and d!162463 (not c!144235)) b!1556978))

(assert (= (and b!1556978 c!144236) b!1556979))

(assert (= (and b!1556978 (not c!144236)) b!1556980))

(declare-fun m!1435117 () Bool)

(assert (=> b!1556979 m!1435117))

(assert (=> b!1556912 d!162463))

(declare-fun d!162465 () Bool)

(declare-fun e!867156 () Bool)

(assert (=> d!162465 e!867156))

(declare-fun res!1064709 () Bool)

(assert (=> d!162465 (=> res!1064709 e!867156)))

(declare-fun lt!670971 () Bool)

(assert (=> d!162465 (= res!1064709 (not lt!670971))))

(declare-fun lt!670970 () Bool)

(assert (=> d!162465 (= lt!670971 lt!670970)))

(declare-fun lt!670969 () Unit!51705)

(declare-fun e!867155 () Unit!51705)

(assert (=> d!162465 (= lt!670969 e!867155)))

(declare-fun c!144245 () Bool)

(assert (=> d!162465 (= c!144245 lt!670970)))

(assert (=> d!162465 (= lt!670970 (containsKey!776 (toList!11248 lm!249) a0!49))))

(assert (=> d!162465 (= (contains!10208 lm!249 a0!49) lt!670971)))

(declare-fun b!1557008 () Bool)

(declare-fun lt!670972 () Unit!51705)

(assert (=> b!1557008 (= e!867155 lt!670972)))

(assert (=> b!1557008 (= lt!670972 (lemmaContainsKeyImpliesGetValueByKeyDefined!519 (toList!11248 lm!249) a0!49))))

(assert (=> b!1557008 (isDefined!565 (getValueByKey!750 (toList!11248 lm!249) a0!49))))

(declare-fun b!1557009 () Bool)

(declare-fun Unit!51711 () Unit!51705)

(assert (=> b!1557009 (= e!867155 Unit!51711)))

(declare-fun b!1557010 () Bool)

(assert (=> b!1557010 (= e!867156 (isDefined!565 (getValueByKey!750 (toList!11248 lm!249) a0!49)))))

(assert (= (and d!162465 c!144245) b!1557008))

(assert (= (and d!162465 (not c!144245)) b!1557009))

(assert (= (and d!162465 (not res!1064709)) b!1557010))

(assert (=> d!162465 m!1435031))

(assert (=> b!1557008 m!1435043))

(assert (=> b!1557008 m!1435035))

(assert (=> b!1557008 m!1435035))

(assert (=> b!1557008 m!1435041))

(assert (=> b!1557010 m!1435035))

(assert (=> b!1557010 m!1435035))

(assert (=> b!1557010 m!1435041))

(assert (=> start!133020 d!162465))

(declare-fun d!162479 () Bool)

(assert (=> d!162479 (= (inv!57351 lm!249) (isStrictlySorted!892 (toList!11248 lm!249)))))

(declare-fun bs!44707 () Bool)

(assert (= bs!44707 d!162479))

(assert (=> bs!44707 m!1435051))

(assert (=> start!133020 d!162479))

(declare-fun d!162483 () Bool)

(declare-fun res!1064720 () Bool)

(declare-fun e!867167 () Bool)

(assert (=> d!162483 (=> res!1064720 e!867167)))

(assert (=> d!162483 (= res!1064720 (or ((_ is Nil!36269) (toList!11248 lm!249)) ((_ is Nil!36269) (t!50985 (toList!11248 lm!249)))))))

(assert (=> d!162483 (= (isStrictlySorted!892 (toList!11248 lm!249)) e!867167)))

(declare-fun b!1557021 () Bool)

(declare-fun e!867168 () Bool)

(assert (=> b!1557021 (= e!867167 e!867168)))

(declare-fun res!1064721 () Bool)

(assert (=> b!1557021 (=> (not res!1064721) (not e!867168))))

(assert (=> b!1557021 (= res!1064721 (bvslt (_1!12435 (h!37732 (toList!11248 lm!249))) (_1!12435 (h!37732 (t!50985 (toList!11248 lm!249))))))))

(declare-fun b!1557022 () Bool)

(assert (=> b!1557022 (= e!867168 (isStrictlySorted!892 (t!50985 (toList!11248 lm!249))))))

(assert (= (and d!162483 (not res!1064720)) b!1557021))

(assert (= (and b!1557021 res!1064721) b!1557022))

(declare-fun m!1435139 () Bool)

(assert (=> b!1557022 m!1435139))

(assert (=> b!1556909 d!162483))

(declare-fun d!162489 () Bool)

(declare-fun res!1064726 () Bool)

(declare-fun e!867173 () Bool)

(assert (=> d!162489 (=> res!1064726 e!867173)))

(assert (=> d!162489 (= res!1064726 (and ((_ is Cons!36268) lt!670937) (= (_1!12435 (h!37732 lt!670937)) a0!49)))))

(assert (=> d!162489 (= (containsKey!776 lt!670937 a0!49) e!867173)))

(declare-fun b!1557027 () Bool)

(declare-fun e!867174 () Bool)

(assert (=> b!1557027 (= e!867173 e!867174)))

(declare-fun res!1064727 () Bool)

(assert (=> b!1557027 (=> (not res!1064727) (not e!867174))))

(assert (=> b!1557027 (= res!1064727 (and (or (not ((_ is Cons!36268) lt!670937)) (bvsle (_1!12435 (h!37732 lt!670937)) a0!49)) ((_ is Cons!36268) lt!670937) (bvslt (_1!12435 (h!37732 lt!670937)) a0!49)))))

(declare-fun b!1557028 () Bool)

(assert (=> b!1557028 (= e!867174 (containsKey!776 (t!50985 lt!670937) a0!49))))

(assert (= (and d!162489 (not res!1064726)) b!1557027))

(assert (= (and b!1557027 res!1064727) b!1557028))

(declare-fun m!1435141 () Bool)

(assert (=> b!1557028 m!1435141))

(assert (=> b!1556909 d!162489))

(declare-fun b!1557104 () Bool)

(declare-fun e!867220 () List!36272)

(declare-fun call!71595 () List!36272)

(assert (=> b!1557104 (= e!867220 call!71595)))

(declare-fun b!1557105 () Bool)

(declare-fun res!1064753 () Bool)

(declare-fun e!867218 () Bool)

(assert (=> b!1557105 (=> (not res!1064753) (not e!867218))))

(declare-fun lt!671002 () List!36272)

(assert (=> b!1557105 (= res!1064753 (containsKey!776 lt!671002 a!523))))

(declare-fun b!1557106 () Bool)

(declare-fun e!867221 () List!36272)

(declare-fun call!71594 () List!36272)

(assert (=> b!1557106 (= e!867221 call!71594)))

(declare-fun b!1557107 () Bool)

(declare-fun e!867217 () List!36272)

(declare-fun c!144273 () Bool)

(declare-fun c!144271 () Bool)

(assert (=> b!1557107 (= e!867217 (ite c!144273 (t!50985 (toList!11248 lm!249)) (ite c!144271 (Cons!36268 (h!37732 (toList!11248 lm!249)) (t!50985 (toList!11248 lm!249))) Nil!36269)))))

(declare-fun b!1557108 () Bool)

(assert (=> b!1557108 (= c!144271 (and ((_ is Cons!36268) (toList!11248 lm!249)) (bvsgt (_1!12435 (h!37732 (toList!11248 lm!249))) a!523)))))

(assert (=> b!1557108 (= e!867221 e!867220)))

(declare-fun d!162491 () Bool)

(assert (=> d!162491 e!867218))

(declare-fun res!1064754 () Bool)

(assert (=> d!162491 (=> (not res!1064754) (not e!867218))))

(assert (=> d!162491 (= res!1064754 (isStrictlySorted!892 lt!671002))))

(declare-fun e!867219 () List!36272)

(assert (=> d!162491 (= lt!671002 e!867219)))

(declare-fun c!144272 () Bool)

(assert (=> d!162491 (= c!144272 (and ((_ is Cons!36268) (toList!11248 lm!249)) (bvslt (_1!12435 (h!37732 (toList!11248 lm!249))) a!523)))))

(assert (=> d!162491 (isStrictlySorted!892 (toList!11248 lm!249))))

(assert (=> d!162491 (= (insertStrictlySorted!517 (toList!11248 lm!249) a!523 b!96) lt!671002)))

(declare-fun b!1557109 () Bool)

(assert (=> b!1557109 (= e!867217 (insertStrictlySorted!517 (t!50985 (toList!11248 lm!249)) a!523 b!96))))

(declare-fun b!1557110 () Bool)

(assert (=> b!1557110 (= e!867219 e!867221)))

(assert (=> b!1557110 (= c!144273 (and ((_ is Cons!36268) (toList!11248 lm!249)) (= (_1!12435 (h!37732 (toList!11248 lm!249))) a!523)))))

(declare-fun bm!71590 () Bool)

(assert (=> bm!71590 (= call!71595 call!71594)))

(declare-fun b!1557111 () Bool)

(assert (=> b!1557111 (= e!867220 call!71595)))

(declare-fun b!1557112 () Bool)

(declare-fun contains!10212 (List!36272 tuple2!24848) Bool)

(assert (=> b!1557112 (= e!867218 (contains!10212 lt!671002 (tuple2!24849 a!523 b!96)))))

(declare-fun bm!71591 () Bool)

(declare-fun call!71593 () List!36272)

(assert (=> bm!71591 (= call!71594 call!71593)))

(declare-fun bm!71592 () Bool)

(declare-fun $colon$colon!950 (List!36272 tuple2!24848) List!36272)

(assert (=> bm!71592 (= call!71593 ($colon$colon!950 e!867217 (ite c!144272 (h!37732 (toList!11248 lm!249)) (tuple2!24849 a!523 b!96))))))

(declare-fun c!144274 () Bool)

(assert (=> bm!71592 (= c!144274 c!144272)))

(declare-fun b!1557113 () Bool)

(assert (=> b!1557113 (= e!867219 call!71593)))

(assert (= (and d!162491 c!144272) b!1557113))

(assert (= (and d!162491 (not c!144272)) b!1557110))

(assert (= (and b!1557110 c!144273) b!1557106))

(assert (= (and b!1557110 (not c!144273)) b!1557108))

(assert (= (and b!1557108 c!144271) b!1557104))

(assert (= (and b!1557108 (not c!144271)) b!1557111))

(assert (= (or b!1557104 b!1557111) bm!71590))

(assert (= (or b!1557106 bm!71590) bm!71591))

(assert (= (or b!1557113 bm!71591) bm!71592))

(assert (= (and bm!71592 c!144274) b!1557109))

(assert (= (and bm!71592 (not c!144274)) b!1557107))

(assert (= (and d!162491 res!1064754) b!1557105))

(assert (= (and b!1557105 res!1064753) b!1557112))

(declare-fun m!1435169 () Bool)

(assert (=> bm!71592 m!1435169))

(declare-fun m!1435171 () Bool)

(assert (=> b!1557109 m!1435171))

(declare-fun m!1435173 () Bool)

(assert (=> b!1557105 m!1435173))

(declare-fun m!1435175 () Bool)

(assert (=> b!1557112 m!1435175))

(declare-fun m!1435177 () Bool)

(assert (=> d!162491 m!1435177))

(assert (=> d!162491 m!1435051))

(assert (=> b!1556909 d!162491))

(declare-fun d!162505 () Bool)

(declare-fun e!867245 () Bool)

(assert (=> d!162505 e!867245))

(declare-fun res!1064775 () Bool)

(assert (=> d!162505 (=> (not res!1064775) (not e!867245))))

(assert (=> d!162505 (= res!1064775 (= (containsKey!776 (insertStrictlySorted!517 (toList!11248 lm!249) a!523 b!96) a0!49) (containsKey!776 (toList!11248 lm!249) a0!49)))))

(declare-fun lt!671016 () Unit!51705)

(declare-fun choose!2045 (List!36272 (_ BitVec 64) B!2246 (_ BitVec 64)) Unit!51705)

(assert (=> d!162505 (= lt!671016 (choose!2045 (toList!11248 lm!249) a!523 b!96 a0!49))))

(declare-fun e!867244 () Bool)

(assert (=> d!162505 e!867244))

(declare-fun res!1064776 () Bool)

(assert (=> d!162505 (=> (not res!1064776) (not e!867244))))

(assert (=> d!162505 (= res!1064776 (isStrictlySorted!892 (toList!11248 lm!249)))))

(assert (=> d!162505 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!13 (toList!11248 lm!249) a!523 b!96 a0!49) lt!671016)))

(declare-fun b!1557138 () Bool)

(assert (=> b!1557138 (= e!867244 (not (= a!523 a0!49)))))

(declare-fun b!1557139 () Bool)

(assert (=> b!1557139 (= e!867245 (= (getValueByKey!750 (insertStrictlySorted!517 (toList!11248 lm!249) a!523 b!96) a0!49) (getValueByKey!750 (toList!11248 lm!249) a0!49)))))

(assert (= (and d!162505 res!1064776) b!1557138))

(assert (= (and d!162505 res!1064775) b!1557139))

(declare-fun m!1435189 () Bool)

(assert (=> d!162505 m!1435189))

(assert (=> d!162505 m!1435055))

(declare-fun m!1435191 () Bool)

(assert (=> d!162505 m!1435191))

(assert (=> d!162505 m!1435051))

(assert (=> d!162505 m!1435055))

(assert (=> d!162505 m!1435031))

(assert (=> b!1557139 m!1435055))

(assert (=> b!1557139 m!1435055))

(declare-fun m!1435193 () Bool)

(assert (=> b!1557139 m!1435193))

(assert (=> b!1557139 m!1435035))

(assert (=> b!1556909 d!162505))

(assert (=> b!1556910 d!162463))

(declare-fun d!162513 () Bool)

(declare-fun isEmpty!1142 (Option!825) Bool)

(assert (=> d!162513 (= (isDefined!565 (getValueByKey!750 (toList!11248 lm!249) a0!49)) (not (isEmpty!1142 (getValueByKey!750 (toList!11248 lm!249) a0!49))))))

(declare-fun bs!44710 () Bool)

(assert (= bs!44710 d!162513))

(assert (=> bs!44710 m!1435035))

(declare-fun m!1435195 () Bool)

(assert (=> bs!44710 m!1435195))

(assert (=> b!1556910 d!162513))

(declare-fun d!162515 () Bool)

(assert (=> d!162515 (isDefined!565 (getValueByKey!750 (toList!11248 lm!249) a0!49))))

(declare-fun lt!671025 () Unit!51705)

(declare-fun choose!2046 (List!36272 (_ BitVec 64)) Unit!51705)

(assert (=> d!162515 (= lt!671025 (choose!2046 (toList!11248 lm!249) a0!49))))

(declare-fun e!867258 () Bool)

(assert (=> d!162515 e!867258))

(declare-fun res!1064782 () Bool)

(assert (=> d!162515 (=> (not res!1064782) (not e!867258))))

(assert (=> d!162515 (= res!1064782 (isStrictlySorted!892 (toList!11248 lm!249)))))

(assert (=> d!162515 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!519 (toList!11248 lm!249) a0!49) lt!671025)))

(declare-fun b!1557159 () Bool)

(assert (=> b!1557159 (= e!867258 (containsKey!776 (toList!11248 lm!249) a0!49))))

(assert (= (and d!162515 res!1064782) b!1557159))

(assert (=> d!162515 m!1435035))

(assert (=> d!162515 m!1435035))

(assert (=> d!162515 m!1435041))

(declare-fun m!1435201 () Bool)

(assert (=> d!162515 m!1435201))

(assert (=> d!162515 m!1435051))

(assert (=> b!1557159 m!1435031))

(assert (=> b!1556910 d!162515))

(declare-fun d!162525 () Bool)

(declare-fun get!26103 (Option!825) B!2246)

(assert (=> d!162525 (= (apply!1115 lm!249 a0!49) (get!26103 (getValueByKey!750 (toList!11248 lm!249) a0!49)))))

(declare-fun bs!44713 () Bool)

(assert (= bs!44713 d!162525))

(assert (=> bs!44713 m!1435035))

(assert (=> bs!44713 m!1435035))

(declare-fun m!1435203 () Bool)

(assert (=> bs!44713 m!1435203))

(assert (=> b!1556910 d!162525))

(declare-fun d!162527 () Bool)

(assert (=> d!162527 (= (apply!1115 (+!5055 lm!249 (tuple2!24849 a!523 b!96)) a0!49) (get!26103 (getValueByKey!750 (toList!11248 (+!5055 lm!249 (tuple2!24849 a!523 b!96))) a0!49)))))

(declare-fun bs!44714 () Bool)

(assert (= bs!44714 d!162527))

(declare-fun m!1435205 () Bool)

(assert (=> bs!44714 m!1435205))

(assert (=> bs!44714 m!1435205))

(declare-fun m!1435207 () Bool)

(assert (=> bs!44714 m!1435207))

(assert (=> b!1556910 d!162527))

(declare-fun d!162529 () Bool)

(declare-fun e!867273 () Bool)

(assert (=> d!162529 e!867273))

(declare-fun res!1064796 () Bool)

(assert (=> d!162529 (=> (not res!1064796) (not e!867273))))

(declare-fun lt!671041 () ListLongMap!22465)

(assert (=> d!162529 (= res!1064796 (contains!10208 lt!671041 (_1!12435 (tuple2!24849 a!523 b!96))))))

(declare-fun lt!671039 () List!36272)

(assert (=> d!162529 (= lt!671041 (ListLongMap!22466 lt!671039))))

(declare-fun lt!671040 () Unit!51705)

(declare-fun lt!671038 () Unit!51705)

(assert (=> d!162529 (= lt!671040 lt!671038)))

(assert (=> d!162529 (= (getValueByKey!750 lt!671039 (_1!12435 (tuple2!24849 a!523 b!96))) (Some!824 (_2!12435 (tuple2!24849 a!523 b!96))))))

(declare-fun lemmaContainsTupThenGetReturnValue!379 (List!36272 (_ BitVec 64) B!2246) Unit!51705)

(assert (=> d!162529 (= lt!671038 (lemmaContainsTupThenGetReturnValue!379 lt!671039 (_1!12435 (tuple2!24849 a!523 b!96)) (_2!12435 (tuple2!24849 a!523 b!96))))))

(assert (=> d!162529 (= lt!671039 (insertStrictlySorted!517 (toList!11248 lm!249) (_1!12435 (tuple2!24849 a!523 b!96)) (_2!12435 (tuple2!24849 a!523 b!96))))))

(assert (=> d!162529 (= (+!5055 lm!249 (tuple2!24849 a!523 b!96)) lt!671041)))

(declare-fun b!1557185 () Bool)

(declare-fun res!1064797 () Bool)

(assert (=> b!1557185 (=> (not res!1064797) (not e!867273))))

(assert (=> b!1557185 (= res!1064797 (= (getValueByKey!750 (toList!11248 lt!671041) (_1!12435 (tuple2!24849 a!523 b!96))) (Some!824 (_2!12435 (tuple2!24849 a!523 b!96)))))))

(declare-fun b!1557186 () Bool)

(assert (=> b!1557186 (= e!867273 (contains!10212 (toList!11248 lt!671041) (tuple2!24849 a!523 b!96)))))

(assert (= (and d!162529 res!1064796) b!1557185))

(assert (= (and b!1557185 res!1064797) b!1557186))

(declare-fun m!1435227 () Bool)

(assert (=> d!162529 m!1435227))

(declare-fun m!1435229 () Bool)

(assert (=> d!162529 m!1435229))

(declare-fun m!1435231 () Bool)

(assert (=> d!162529 m!1435231))

(declare-fun m!1435233 () Bool)

(assert (=> d!162529 m!1435233))

(declare-fun m!1435235 () Bool)

(assert (=> b!1557185 m!1435235))

(declare-fun m!1435237 () Bool)

(assert (=> b!1557186 m!1435237))

(assert (=> b!1556910 d!162529))

(declare-fun d!162539 () Bool)

(declare-fun res!1064804 () Bool)

(declare-fun e!867278 () Bool)

(assert (=> d!162539 (=> res!1064804 e!867278)))

(assert (=> d!162539 (= res!1064804 (and ((_ is Cons!36268) (toList!11248 lm!249)) (= (_1!12435 (h!37732 (toList!11248 lm!249))) a0!49)))))

(assert (=> d!162539 (= (containsKey!776 (toList!11248 lm!249) a0!49) e!867278)))

(declare-fun b!1557193 () Bool)

(declare-fun e!867279 () Bool)

(assert (=> b!1557193 (= e!867278 e!867279)))

(declare-fun res!1064805 () Bool)

(assert (=> b!1557193 (=> (not res!1064805) (not e!867279))))

(assert (=> b!1557193 (= res!1064805 (and (or (not ((_ is Cons!36268) (toList!11248 lm!249))) (bvsle (_1!12435 (h!37732 (toList!11248 lm!249))) a0!49)) ((_ is Cons!36268) (toList!11248 lm!249)) (bvslt (_1!12435 (h!37732 (toList!11248 lm!249))) a0!49)))))

(declare-fun b!1557194 () Bool)

(assert (=> b!1557194 (= e!867279 (containsKey!776 (t!50985 (toList!11248 lm!249)) a0!49))))

(assert (= (and d!162539 (not res!1064804)) b!1557193))

(assert (= (and b!1557193 res!1064805) b!1557194))

(declare-fun m!1435239 () Bool)

(assert (=> b!1557194 m!1435239))

(assert (=> b!1556911 d!162539))

(declare-fun b!1557201 () Bool)

(declare-fun e!867284 () Bool)

(declare-fun tp!112209 () Bool)

(assert (=> b!1557201 (= e!867284 (and tp_is_empty!38257 tp!112209))))

(assert (=> b!1556907 (= tp!112200 e!867284)))

(assert (= (and b!1556907 ((_ is Cons!36268) (toList!11248 lm!249))) b!1557201))

(check-sat (not b!1557159) (not b!1557201) (not b!1557139) (not b!1557022) (not d!162505) (not d!162515) (not b!1557186) (not d!162529) (not d!162525) (not d!162491) (not b!1556979) (not b!1557112) (not d!162465) tp_is_empty!38257 (not b!1557194) (not d!162479) (not b!1557105) (not b!1557010) (not b!1557185) (not b!1557109) (not d!162527) (not d!162513) (not b!1557028) (not b!1556975) (not bm!71592) (not b!1557008))
(check-sat)
