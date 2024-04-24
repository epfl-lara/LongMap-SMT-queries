; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114004 () Bool)

(assert start!114004)

(declare-fun k0!387 () (_ BitVec 64))

(declare-datatypes ((B!2192 0))(
  ( (B!2193 (val!18885 Int)) )
))
(declare-datatypes ((tuple2!24420 0))(
  ( (tuple2!24421 (_1!12221 (_ BitVec 64)) (_2!12221 B!2192)) )
))
(declare-datatypes ((List!31543 0))(
  ( (Nil!31540) (Cons!31539 (h!32757 tuple2!24420) (t!46193 List!31543)) )
))
(declare-datatypes ((ListLongMap!22085 0))(
  ( (ListLongMap!22086 (toList!11058 List!31543)) )
))
(declare-fun contains!9255 (ListLongMap!22085 (_ BitVec 64)) Bool)

(assert (=> start!114004 (contains!9255 (ListLongMap!22086 Nil!31540) k0!387)))

(assert (=> start!114004 true))

(declare-fun bs!38740 () Bool)

(assert (= bs!38740 start!114004))

(declare-fun m!1238997 () Bool)

(assert (=> bs!38740 m!1238997))

(check-sat (not start!114004))
(check-sat)
(get-model)

(declare-fun d!145299 () Bool)

(declare-fun e!768880 () Bool)

(assert (=> d!145299 e!768880))

(declare-fun res!896141 () Bool)

(assert (=> d!145299 (=> res!896141 e!768880)))

(declare-fun lt!597406 () Bool)

(assert (=> d!145299 (= res!896141 (not lt!597406))))

(declare-fun lt!597405 () Bool)

(assert (=> d!145299 (= lt!597406 lt!597405)))

(declare-datatypes ((Unit!44162 0))(
  ( (Unit!44163) )
))
(declare-fun lt!597404 () Unit!44162)

(declare-fun e!768881 () Unit!44162)

(assert (=> d!145299 (= lt!597404 e!768881)))

(declare-fun c!127089 () Bool)

(assert (=> d!145299 (= c!127089 lt!597405)))

(declare-fun containsKey!747 (List!31543 (_ BitVec 64)) Bool)

(assert (=> d!145299 (= lt!597405 (containsKey!747 (toList!11058 (ListLongMap!22086 Nil!31540)) k0!387))))

(assert (=> d!145299 (= (contains!9255 (ListLongMap!22086 Nil!31540) k0!387) lt!597406)))

(declare-fun b!1351424 () Bool)

(declare-fun lt!597407 () Unit!44162)

(assert (=> b!1351424 (= e!768881 lt!597407)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!493 (List!31543 (_ BitVec 64)) Unit!44162)

(assert (=> b!1351424 (= lt!597407 (lemmaContainsKeyImpliesGetValueByKeyDefined!493 (toList!11058 (ListLongMap!22086 Nil!31540)) k0!387))))

(declare-datatypes ((Option!772 0))(
  ( (Some!771 (v!21526 B!2192)) (None!770) )
))
(declare-fun isDefined!530 (Option!772) Bool)

(declare-fun getValueByKey!721 (List!31543 (_ BitVec 64)) Option!772)

(assert (=> b!1351424 (isDefined!530 (getValueByKey!721 (toList!11058 (ListLongMap!22086 Nil!31540)) k0!387))))

(declare-fun b!1351425 () Bool)

(declare-fun Unit!44168 () Unit!44162)

(assert (=> b!1351425 (= e!768881 Unit!44168)))

(declare-fun b!1351426 () Bool)

(assert (=> b!1351426 (= e!768880 (isDefined!530 (getValueByKey!721 (toList!11058 (ListLongMap!22086 Nil!31540)) k0!387)))))

(assert (= (and d!145299 c!127089) b!1351424))

(assert (= (and d!145299 (not c!127089)) b!1351425))

(assert (= (and d!145299 (not res!896141)) b!1351426))

(declare-fun m!1239005 () Bool)

(assert (=> d!145299 m!1239005))

(declare-fun m!1239008 () Bool)

(assert (=> b!1351424 m!1239008))

(declare-fun m!1239011 () Bool)

(assert (=> b!1351424 m!1239011))

(assert (=> b!1351424 m!1239011))

(declare-fun m!1239015 () Bool)

(assert (=> b!1351424 m!1239015))

(assert (=> b!1351426 m!1239011))

(assert (=> b!1351426 m!1239011))

(assert (=> b!1351426 m!1239015))

(assert (=> start!114004 d!145299))

(check-sat (not b!1351424) (not b!1351426) (not d!145299))
(check-sat)
(get-model)

(declare-fun d!145303 () Bool)

(assert (=> d!145303 (isDefined!530 (getValueByKey!721 (toList!11058 (ListLongMap!22086 Nil!31540)) k0!387))))

(declare-fun lt!597414 () Unit!44162)

(declare-fun choose!1990 (List!31543 (_ BitVec 64)) Unit!44162)

(assert (=> d!145303 (= lt!597414 (choose!1990 (toList!11058 (ListLongMap!22086 Nil!31540)) k0!387))))

(declare-fun e!768886 () Bool)

(assert (=> d!145303 e!768886))

(declare-fun res!896145 () Bool)

(assert (=> d!145303 (=> (not res!896145) (not e!768886))))

(declare-fun isStrictlySorted!873 (List!31543) Bool)

(assert (=> d!145303 (= res!896145 (isStrictlySorted!873 (toList!11058 (ListLongMap!22086 Nil!31540))))))

(assert (=> d!145303 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!493 (toList!11058 (ListLongMap!22086 Nil!31540)) k0!387) lt!597414)))

(declare-fun b!1351432 () Bool)

(assert (=> b!1351432 (= e!768886 (containsKey!747 (toList!11058 (ListLongMap!22086 Nil!31540)) k0!387))))

(assert (= (and d!145303 res!896145) b!1351432))

(assert (=> d!145303 m!1239011))

(assert (=> d!145303 m!1239011))

(assert (=> d!145303 m!1239015))

(declare-fun m!1239027 () Bool)

(assert (=> d!145303 m!1239027))

(declare-fun m!1239029 () Bool)

(assert (=> d!145303 m!1239029))

(assert (=> b!1351432 m!1239005))

(assert (=> b!1351424 d!145303))

(declare-fun d!145307 () Bool)

(declare-fun isEmpty!1105 (Option!772) Bool)

(assert (=> d!145307 (= (isDefined!530 (getValueByKey!721 (toList!11058 (ListLongMap!22086 Nil!31540)) k0!387)) (not (isEmpty!1105 (getValueByKey!721 (toList!11058 (ListLongMap!22086 Nil!31540)) k0!387))))))

(declare-fun bs!38743 () Bool)

(assert (= bs!38743 d!145307))

(assert (=> bs!38743 m!1239011))

(declare-fun m!1239031 () Bool)

(assert (=> bs!38743 m!1239031))

(assert (=> b!1351424 d!145307))

(declare-fun b!1351446 () Bool)

(declare-fun e!768895 () Option!772)

(assert (=> b!1351446 (= e!768895 (getValueByKey!721 (t!46193 (toList!11058 (ListLongMap!22086 Nil!31540))) k0!387))))

(declare-fun b!1351447 () Bool)

(assert (=> b!1351447 (= e!768895 None!770)))

(declare-fun b!1351445 () Bool)

(declare-fun e!768894 () Option!772)

(assert (=> b!1351445 (= e!768894 e!768895)))

(declare-fun c!127096 () Bool)

(get-info :version)

(assert (=> b!1351445 (= c!127096 (and ((_ is Cons!31539) (toList!11058 (ListLongMap!22086 Nil!31540))) (not (= (_1!12221 (h!32757 (toList!11058 (ListLongMap!22086 Nil!31540)))) k0!387))))))

(declare-fun d!145309 () Bool)

(declare-fun c!127095 () Bool)

(assert (=> d!145309 (= c!127095 (and ((_ is Cons!31539) (toList!11058 (ListLongMap!22086 Nil!31540))) (= (_1!12221 (h!32757 (toList!11058 (ListLongMap!22086 Nil!31540)))) k0!387)))))

(assert (=> d!145309 (= (getValueByKey!721 (toList!11058 (ListLongMap!22086 Nil!31540)) k0!387) e!768894)))

(declare-fun b!1351444 () Bool)

(assert (=> b!1351444 (= e!768894 (Some!771 (_2!12221 (h!32757 (toList!11058 (ListLongMap!22086 Nil!31540))))))))

(assert (= (and d!145309 c!127095) b!1351444))

(assert (= (and d!145309 (not c!127095)) b!1351445))

(assert (= (and b!1351445 c!127096) b!1351446))

(assert (= (and b!1351445 (not c!127096)) b!1351447))

(declare-fun m!1239039 () Bool)

(assert (=> b!1351446 m!1239039))

(assert (=> b!1351424 d!145309))

(assert (=> b!1351426 d!145307))

(assert (=> b!1351426 d!145309))

(declare-fun d!145317 () Bool)

(declare-fun res!896155 () Bool)

(declare-fun e!768908 () Bool)

(assert (=> d!145317 (=> res!896155 e!768908)))

(assert (=> d!145317 (= res!896155 (and ((_ is Cons!31539) (toList!11058 (ListLongMap!22086 Nil!31540))) (= (_1!12221 (h!32757 (toList!11058 (ListLongMap!22086 Nil!31540)))) k0!387)))))

(assert (=> d!145317 (= (containsKey!747 (toList!11058 (ListLongMap!22086 Nil!31540)) k0!387) e!768908)))

(declare-fun b!1351466 () Bool)

(declare-fun e!768909 () Bool)

(assert (=> b!1351466 (= e!768908 e!768909)))

(declare-fun res!896156 () Bool)

(assert (=> b!1351466 (=> (not res!896156) (not e!768909))))

(assert (=> b!1351466 (= res!896156 (and (or (not ((_ is Cons!31539) (toList!11058 (ListLongMap!22086 Nil!31540)))) (bvsle (_1!12221 (h!32757 (toList!11058 (ListLongMap!22086 Nil!31540)))) k0!387)) ((_ is Cons!31539) (toList!11058 (ListLongMap!22086 Nil!31540))) (bvslt (_1!12221 (h!32757 (toList!11058 (ListLongMap!22086 Nil!31540)))) k0!387)))))

(declare-fun b!1351467 () Bool)

(assert (=> b!1351467 (= e!768909 (containsKey!747 (t!46193 (toList!11058 (ListLongMap!22086 Nil!31540))) k0!387))))

(assert (= (and d!145317 (not res!896155)) b!1351466))

(assert (= (and b!1351466 res!896156) b!1351467))

(declare-fun m!1239043 () Bool)

(assert (=> b!1351467 m!1239043))

(assert (=> d!145299 d!145317))

(check-sat (not d!145303) (not b!1351432) (not b!1351446) (not d!145307) (not b!1351467))
(check-sat)
