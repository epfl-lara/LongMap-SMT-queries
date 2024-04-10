; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132436 () Bool)

(assert start!132436)

(declare-fun b!1553610 () Bool)

(declare-fun res!1063366 () Bool)

(declare-fun e!865008 () Bool)

(assert (=> b!1553610 (=> (not res!1063366) (not e!865008))))

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553610 (= res!1063366 (not (= a0!49 a!523)))))

(declare-fun b!1553611 () Bool)

(declare-fun res!1063364 () Bool)

(assert (=> b!1553611 (=> (not res!1063364) (not e!865008))))

(declare-datatypes ((B!2218 0))(
  ( (B!2219 (val!19195 Int)) )
))
(declare-datatypes ((tuple2!24766 0))(
  ( (tuple2!24767 (_1!12394 (_ BitVec 64)) (_2!12394 B!2218)) )
))
(declare-datatypes ((List!36229 0))(
  ( (Nil!36226) (Cons!36225 (h!37671 tuple2!24766) (t!50950 List!36229)) )
))
(declare-datatypes ((ListLongMap!22375 0))(
  ( (ListLongMap!22376 (toList!11203 List!36229)) )
))
(declare-fun lm!249 () ListLongMap!22375)

(declare-fun containsKey!762 (List!36229 (_ BitVec 64)) Bool)

(assert (=> b!1553611 (= res!1063364 (containsKey!762 (toList!11203 lm!249) a0!49))))

(declare-fun b!1553613 () Bool)

(declare-fun e!865010 () Bool)

(assert (=> b!1553613 (= e!865008 (not e!865010))))

(declare-fun res!1063365 () Bool)

(assert (=> b!1553613 (=> res!1063365 e!865010)))

(declare-fun isStrictlySorted!892 (List!36229) Bool)

(assert (=> b!1553613 (= res!1063365 (not (isStrictlySorted!892 (toList!11203 lm!249))))))

(declare-fun e!865007 () Bool)

(assert (=> b!1553613 e!865007))

(declare-fun res!1063363 () Bool)

(assert (=> b!1553613 (=> (not res!1063363) (not e!865007))))

(declare-fun lt!669730 () List!36229)

(assert (=> b!1553613 (= res!1063363 (containsKey!762 lt!669730 a0!49))))

(declare-fun b!96 () B!2218)

(declare-fun insertStrictlySorted!508 (List!36229 (_ BitVec 64) B!2218) List!36229)

(assert (=> b!1553613 (= lt!669730 (insertStrictlySorted!508 (toList!11203 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51751 0))(
  ( (Unit!51752) )
))
(declare-fun lt!669731 () Unit!51751)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!5 (List!36229 (_ BitVec 64) B!2218 (_ BitVec 64)) Unit!51751)

(assert (=> b!1553613 (= lt!669731 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!5 (toList!11203 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1553614 () Bool)

(declare-fun contains!10145 (ListLongMap!22375 (_ BitVec 64)) Bool)

(declare-fun +!5013 (ListLongMap!22375 tuple2!24766) ListLongMap!22375)

(assert (=> b!1553614 (= e!865010 (contains!10145 (+!5013 lm!249 (tuple2!24767 a!523 b!96)) a0!49))))

(declare-datatypes ((Option!816 0))(
  ( (Some!815 (v!22000 B!2218)) (None!814) )
))
(declare-fun isDefined!553 (Option!816) Bool)

(declare-fun getValueByKey!740 (List!36229 (_ BitVec 64)) Option!816)

(assert (=> b!1553614 (isDefined!553 (getValueByKey!740 (toList!11203 lm!249) a0!49))))

(declare-fun lt!669729 () Unit!51751)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!505 (List!36229 (_ BitVec 64)) Unit!51751)

(assert (=> b!1553614 (= lt!669729 (lemmaContainsKeyImpliesGetValueByKeyDefined!505 (toList!11203 lm!249) a0!49))))

(declare-fun b!1553615 () Bool)

(declare-fun e!865009 () Bool)

(declare-fun tp!112122 () Bool)

(assert (=> b!1553615 (= e!865009 tp!112122)))

(declare-fun res!1063362 () Bool)

(assert (=> start!132436 (=> (not res!1063362) (not e!865008))))

(assert (=> start!132436 (= res!1063362 (contains!10145 lm!249 a0!49))))

(assert (=> start!132436 e!865008))

(declare-fun inv!57312 (ListLongMap!22375) Bool)

(assert (=> start!132436 (and (inv!57312 lm!249) e!865009)))

(assert (=> start!132436 true))

(declare-fun tp_is_empty!38229 () Bool)

(assert (=> start!132436 tp_is_empty!38229))

(declare-fun b!1553612 () Bool)

(assert (=> b!1553612 (= e!865007 (= (getValueByKey!740 lt!669730 a0!49) (getValueByKey!740 (toList!11203 lm!249) a0!49)))))

(assert (= (and start!132436 res!1063362) b!1553610))

(assert (= (and b!1553610 res!1063366) b!1553611))

(assert (= (and b!1553611 res!1063364) b!1553613))

(assert (= (and b!1553613 res!1063363) b!1553612))

(assert (= (and b!1553613 (not res!1063365)) b!1553614))

(assert (= start!132436 b!1553615))

(declare-fun m!1432259 () Bool)

(assert (=> b!1553614 m!1432259))

(declare-fun m!1432261 () Bool)

(assert (=> b!1553614 m!1432261))

(assert (=> b!1553614 m!1432259))

(declare-fun m!1432263 () Bool)

(assert (=> b!1553614 m!1432263))

(assert (=> b!1553614 m!1432261))

(declare-fun m!1432265 () Bool)

(assert (=> b!1553614 m!1432265))

(declare-fun m!1432267 () Bool)

(assert (=> b!1553614 m!1432267))

(declare-fun m!1432269 () Bool)

(assert (=> start!132436 m!1432269))

(declare-fun m!1432271 () Bool)

(assert (=> start!132436 m!1432271))

(declare-fun m!1432273 () Bool)

(assert (=> b!1553611 m!1432273))

(declare-fun m!1432275 () Bool)

(assert (=> b!1553612 m!1432275))

(assert (=> b!1553612 m!1432259))

(declare-fun m!1432277 () Bool)

(assert (=> b!1553613 m!1432277))

(declare-fun m!1432279 () Bool)

(assert (=> b!1553613 m!1432279))

(declare-fun m!1432281 () Bool)

(assert (=> b!1553613 m!1432281))

(declare-fun m!1432283 () Bool)

(assert (=> b!1553613 m!1432283))

(check-sat (not b!1553615) (not b!1553611) (not b!1553613) (not start!132436) (not b!1553612) (not b!1553614) tp_is_empty!38229)
(check-sat)
(get-model)

(declare-fun d!161577 () Bool)

(declare-fun e!865052 () Bool)

(assert (=> d!161577 e!865052))

(declare-fun res!1063408 () Bool)

(assert (=> d!161577 (=> res!1063408 e!865052)))

(declare-fun lt!669749 () Bool)

(assert (=> d!161577 (= res!1063408 (not lt!669749))))

(declare-fun lt!669752 () Bool)

(assert (=> d!161577 (= lt!669749 lt!669752)))

(declare-fun lt!669750 () Unit!51751)

(declare-fun e!865051 () Unit!51751)

(assert (=> d!161577 (= lt!669750 e!865051)))

(declare-fun c!143264 () Bool)

(assert (=> d!161577 (= c!143264 lt!669752)))

(assert (=> d!161577 (= lt!669752 (containsKey!762 (toList!11203 lm!249) a0!49))))

(assert (=> d!161577 (= (contains!10145 lm!249 a0!49) lt!669749)))

(declare-fun b!1553664 () Bool)

(declare-fun lt!669751 () Unit!51751)

(assert (=> b!1553664 (= e!865051 lt!669751)))

(assert (=> b!1553664 (= lt!669751 (lemmaContainsKeyImpliesGetValueByKeyDefined!505 (toList!11203 lm!249) a0!49))))

(assert (=> b!1553664 (isDefined!553 (getValueByKey!740 (toList!11203 lm!249) a0!49))))

(declare-fun b!1553665 () Bool)

(declare-fun Unit!51756 () Unit!51751)

(assert (=> b!1553665 (= e!865051 Unit!51756)))

(declare-fun b!1553666 () Bool)

(assert (=> b!1553666 (= e!865052 (isDefined!553 (getValueByKey!740 (toList!11203 lm!249) a0!49)))))

(assert (= (and d!161577 c!143264) b!1553664))

(assert (= (and d!161577 (not c!143264)) b!1553665))

(assert (= (and d!161577 (not res!1063408)) b!1553666))

(assert (=> d!161577 m!1432273))

(assert (=> b!1553664 m!1432267))

(assert (=> b!1553664 m!1432259))

(assert (=> b!1553664 m!1432259))

(assert (=> b!1553664 m!1432263))

(assert (=> b!1553666 m!1432259))

(assert (=> b!1553666 m!1432259))

(assert (=> b!1553666 m!1432263))

(assert (=> start!132436 d!161577))

(declare-fun d!161587 () Bool)

(assert (=> d!161587 (= (inv!57312 lm!249) (isStrictlySorted!892 (toList!11203 lm!249)))))

(declare-fun bs!44657 () Bool)

(assert (= bs!44657 d!161587))

(assert (=> bs!44657 m!1432277))

(assert (=> start!132436 d!161587))

(declare-fun d!161589 () Bool)

(declare-fun res!1063417 () Bool)

(declare-fun e!865067 () Bool)

(assert (=> d!161589 (=> res!1063417 e!865067)))

(get-info :version)

(assert (=> d!161589 (= res!1063417 (and ((_ is Cons!36225) (toList!11203 lm!249)) (= (_1!12394 (h!37671 (toList!11203 lm!249))) a0!49)))))

(assert (=> d!161589 (= (containsKey!762 (toList!11203 lm!249) a0!49) e!865067)))

(declare-fun b!1553691 () Bool)

(declare-fun e!865068 () Bool)

(assert (=> b!1553691 (= e!865067 e!865068)))

(declare-fun res!1063418 () Bool)

(assert (=> b!1553691 (=> (not res!1063418) (not e!865068))))

(assert (=> b!1553691 (= res!1063418 (and (or (not ((_ is Cons!36225) (toList!11203 lm!249))) (bvsle (_1!12394 (h!37671 (toList!11203 lm!249))) a0!49)) ((_ is Cons!36225) (toList!11203 lm!249)) (bvslt (_1!12394 (h!37671 (toList!11203 lm!249))) a0!49)))))

(declare-fun b!1553692 () Bool)

(assert (=> b!1553692 (= e!865068 (containsKey!762 (t!50950 (toList!11203 lm!249)) a0!49))))

(assert (= (and d!161589 (not res!1063417)) b!1553691))

(assert (= (and b!1553691 res!1063418) b!1553692))

(declare-fun m!1432319 () Bool)

(assert (=> b!1553692 m!1432319))

(assert (=> b!1553611 d!161589))

(declare-fun b!1553724 () Bool)

(declare-fun e!865084 () Option!816)

(declare-fun e!865085 () Option!816)

(assert (=> b!1553724 (= e!865084 e!865085)))

(declare-fun c!143288 () Bool)

(assert (=> b!1553724 (= c!143288 (and ((_ is Cons!36225) lt!669730) (not (= (_1!12394 (h!37671 lt!669730)) a0!49))))))

(declare-fun b!1553725 () Bool)

(assert (=> b!1553725 (= e!865085 (getValueByKey!740 (t!50950 lt!669730) a0!49))))

(declare-fun d!161591 () Bool)

(declare-fun c!143287 () Bool)

(assert (=> d!161591 (= c!143287 (and ((_ is Cons!36225) lt!669730) (= (_1!12394 (h!37671 lt!669730)) a0!49)))))

(assert (=> d!161591 (= (getValueByKey!740 lt!669730 a0!49) e!865084)))

(declare-fun b!1553723 () Bool)

(assert (=> b!1553723 (= e!865084 (Some!815 (_2!12394 (h!37671 lt!669730))))))

(declare-fun b!1553726 () Bool)

(assert (=> b!1553726 (= e!865085 None!814)))

(assert (= (and d!161591 c!143287) b!1553723))

(assert (= (and d!161591 (not c!143287)) b!1553724))

(assert (= (and b!1553724 c!143288) b!1553725))

(assert (= (and b!1553724 (not c!143288)) b!1553726))

(declare-fun m!1432331 () Bool)

(assert (=> b!1553725 m!1432331))

(assert (=> b!1553612 d!161591))

(declare-fun b!1553728 () Bool)

(declare-fun e!865086 () Option!816)

(declare-fun e!865087 () Option!816)

(assert (=> b!1553728 (= e!865086 e!865087)))

(declare-fun c!143290 () Bool)

(assert (=> b!1553728 (= c!143290 (and ((_ is Cons!36225) (toList!11203 lm!249)) (not (= (_1!12394 (h!37671 (toList!11203 lm!249))) a0!49))))))

(declare-fun b!1553729 () Bool)

(assert (=> b!1553729 (= e!865087 (getValueByKey!740 (t!50950 (toList!11203 lm!249)) a0!49))))

(declare-fun d!161595 () Bool)

(declare-fun c!143289 () Bool)

(assert (=> d!161595 (= c!143289 (and ((_ is Cons!36225) (toList!11203 lm!249)) (= (_1!12394 (h!37671 (toList!11203 lm!249))) a0!49)))))

(assert (=> d!161595 (= (getValueByKey!740 (toList!11203 lm!249) a0!49) e!865086)))

(declare-fun b!1553727 () Bool)

(assert (=> b!1553727 (= e!865086 (Some!815 (_2!12394 (h!37671 (toList!11203 lm!249)))))))

(declare-fun b!1553730 () Bool)

(assert (=> b!1553730 (= e!865087 None!814)))

(assert (= (and d!161595 c!143289) b!1553727))

(assert (= (and d!161595 (not c!143289)) b!1553728))

(assert (= (and b!1553728 c!143290) b!1553729))

(assert (= (and b!1553728 (not c!143290)) b!1553730))

(declare-fun m!1432333 () Bool)

(assert (=> b!1553729 m!1432333))

(assert (=> b!1553612 d!161595))

(declare-fun d!161597 () Bool)

(declare-fun res!1063435 () Bool)

(declare-fun e!865102 () Bool)

(assert (=> d!161597 (=> res!1063435 e!865102)))

(assert (=> d!161597 (= res!1063435 (or ((_ is Nil!36226) (toList!11203 lm!249)) ((_ is Nil!36226) (t!50950 (toList!11203 lm!249)))))))

(assert (=> d!161597 (= (isStrictlySorted!892 (toList!11203 lm!249)) e!865102)))

(declare-fun b!1553749 () Bool)

(declare-fun e!865103 () Bool)

(assert (=> b!1553749 (= e!865102 e!865103)))

(declare-fun res!1063436 () Bool)

(assert (=> b!1553749 (=> (not res!1063436) (not e!865103))))

(assert (=> b!1553749 (= res!1063436 (bvslt (_1!12394 (h!37671 (toList!11203 lm!249))) (_1!12394 (h!37671 (t!50950 (toList!11203 lm!249))))))))

(declare-fun b!1553750 () Bool)

(assert (=> b!1553750 (= e!865103 (isStrictlySorted!892 (t!50950 (toList!11203 lm!249))))))

(assert (= (and d!161597 (not res!1063435)) b!1553749))

(assert (= (and b!1553749 res!1063436) b!1553750))

(declare-fun m!1432341 () Bool)

(assert (=> b!1553750 m!1432341))

(assert (=> b!1553613 d!161597))

(declare-fun d!161601 () Bool)

(declare-fun res!1063437 () Bool)

(declare-fun e!865104 () Bool)

(assert (=> d!161601 (=> res!1063437 e!865104)))

(assert (=> d!161601 (= res!1063437 (and ((_ is Cons!36225) lt!669730) (= (_1!12394 (h!37671 lt!669730)) a0!49)))))

(assert (=> d!161601 (= (containsKey!762 lt!669730 a0!49) e!865104)))

(declare-fun b!1553751 () Bool)

(declare-fun e!865105 () Bool)

(assert (=> b!1553751 (= e!865104 e!865105)))

(declare-fun res!1063438 () Bool)

(assert (=> b!1553751 (=> (not res!1063438) (not e!865105))))

(assert (=> b!1553751 (= res!1063438 (and (or (not ((_ is Cons!36225) lt!669730)) (bvsle (_1!12394 (h!37671 lt!669730)) a0!49)) ((_ is Cons!36225) lt!669730) (bvslt (_1!12394 (h!37671 lt!669730)) a0!49)))))

(declare-fun b!1553752 () Bool)

(assert (=> b!1553752 (= e!865105 (containsKey!762 (t!50950 lt!669730) a0!49))))

(assert (= (and d!161601 (not res!1063437)) b!1553751))

(assert (= (and b!1553751 res!1063438) b!1553752))

(declare-fun m!1432343 () Bool)

(assert (=> b!1553752 m!1432343))

(assert (=> b!1553613 d!161601))

(declare-fun b!1553844 () Bool)

(declare-fun res!1063466 () Bool)

(declare-fun e!865160 () Bool)

(assert (=> b!1553844 (=> (not res!1063466) (not e!865160))))

(declare-fun lt!669794 () List!36229)

(assert (=> b!1553844 (= res!1063466 (containsKey!762 lt!669794 a!523))))

(declare-fun b!1553845 () Bool)

(declare-fun c!143328 () Bool)

(assert (=> b!1553845 (= c!143328 (and ((_ is Cons!36225) (toList!11203 lm!249)) (bvsgt (_1!12394 (h!37671 (toList!11203 lm!249))) a!523)))))

(declare-fun e!865164 () List!36229)

(declare-fun e!865162 () List!36229)

(assert (=> b!1553845 (= e!865164 e!865162)))

(declare-fun b!1553846 () Bool)

(declare-fun c!143326 () Bool)

(declare-fun e!865161 () List!36229)

(assert (=> b!1553846 (= e!865161 (ite c!143326 (t!50950 (toList!11203 lm!249)) (ite c!143328 (Cons!36225 (h!37671 (toList!11203 lm!249)) (t!50950 (toList!11203 lm!249))) Nil!36226)))))

(declare-fun b!1553847 () Bool)

(declare-fun call!71398 () List!36229)

(assert (=> b!1553847 (= e!865164 call!71398)))

(declare-fun b!1553848 () Bool)

(declare-fun e!865163 () List!36229)

(assert (=> b!1553848 (= e!865163 e!865164)))

(assert (=> b!1553848 (= c!143326 (and ((_ is Cons!36225) (toList!11203 lm!249)) (= (_1!12394 (h!37671 (toList!11203 lm!249))) a!523)))))

(declare-fun d!161603 () Bool)

(assert (=> d!161603 e!865160))

(declare-fun res!1063467 () Bool)

(assert (=> d!161603 (=> (not res!1063467) (not e!865160))))

(assert (=> d!161603 (= res!1063467 (isStrictlySorted!892 lt!669794))))

(assert (=> d!161603 (= lt!669794 e!865163)))

(declare-fun c!143327 () Bool)

(assert (=> d!161603 (= c!143327 (and ((_ is Cons!36225) (toList!11203 lm!249)) (bvslt (_1!12394 (h!37671 (toList!11203 lm!249))) a!523)))))

(assert (=> d!161603 (isStrictlySorted!892 (toList!11203 lm!249))))

(assert (=> d!161603 (= (insertStrictlySorted!508 (toList!11203 lm!249) a!523 b!96) lt!669794)))

(declare-fun b!1553849 () Bool)

(declare-fun call!71400 () List!36229)

(assert (=> b!1553849 (= e!865162 call!71400)))

(declare-fun b!1553850 () Bool)

(declare-fun call!71399 () List!36229)

(assert (=> b!1553850 (= e!865163 call!71399)))

(declare-fun b!1553851 () Bool)

(assert (=> b!1553851 (= e!865161 (insertStrictlySorted!508 (t!50950 (toList!11203 lm!249)) a!523 b!96))))

(declare-fun bm!71395 () Bool)

(assert (=> bm!71395 (= call!71400 call!71398)))

(declare-fun bm!71396 () Bool)

(declare-fun $colon$colon!947 (List!36229 tuple2!24766) List!36229)

(assert (=> bm!71396 (= call!71399 ($colon$colon!947 e!865161 (ite c!143327 (h!37671 (toList!11203 lm!249)) (tuple2!24767 a!523 b!96))))))

(declare-fun c!143325 () Bool)

(assert (=> bm!71396 (= c!143325 c!143327)))

(declare-fun b!1553852 () Bool)

(assert (=> b!1553852 (= e!865162 call!71400)))

(declare-fun bm!71397 () Bool)

(assert (=> bm!71397 (= call!71398 call!71399)))

(declare-fun b!1553853 () Bool)

(declare-fun contains!10149 (List!36229 tuple2!24766) Bool)

(assert (=> b!1553853 (= e!865160 (contains!10149 lt!669794 (tuple2!24767 a!523 b!96)))))

(assert (= (and d!161603 c!143327) b!1553850))

(assert (= (and d!161603 (not c!143327)) b!1553848))

(assert (= (and b!1553848 c!143326) b!1553847))

(assert (= (and b!1553848 (not c!143326)) b!1553845))

(assert (= (and b!1553845 c!143328) b!1553849))

(assert (= (and b!1553845 (not c!143328)) b!1553852))

(assert (= (or b!1553849 b!1553852) bm!71395))

(assert (= (or b!1553847 bm!71395) bm!71397))

(assert (= (or b!1553850 bm!71397) bm!71396))

(assert (= (and bm!71396 c!143325) b!1553851))

(assert (= (and bm!71396 (not c!143325)) b!1553846))

(assert (= (and d!161603 res!1063467) b!1553844))

(assert (= (and b!1553844 res!1063466) b!1553853))

(declare-fun m!1432397 () Bool)

(assert (=> bm!71396 m!1432397))

(declare-fun m!1432399 () Bool)

(assert (=> b!1553853 m!1432399))

(declare-fun m!1432401 () Bool)

(assert (=> b!1553844 m!1432401))

(declare-fun m!1432403 () Bool)

(assert (=> b!1553851 m!1432403))

(declare-fun m!1432405 () Bool)

(assert (=> d!161603 m!1432405))

(assert (=> d!161603 m!1432277))

(assert (=> b!1553613 d!161603))

(declare-fun d!161631 () Bool)

(declare-fun e!865179 () Bool)

(assert (=> d!161631 e!865179))

(declare-fun res!1063478 () Bool)

(assert (=> d!161631 (=> (not res!1063478) (not e!865179))))

(assert (=> d!161631 (= res!1063478 (= (containsKey!762 (insertStrictlySorted!508 (toList!11203 lm!249) a!523 b!96) a0!49) (containsKey!762 (toList!11203 lm!249) a0!49)))))

(declare-fun lt!669813 () Unit!51751)

(declare-fun choose!2043 (List!36229 (_ BitVec 64) B!2218 (_ BitVec 64)) Unit!51751)

(assert (=> d!161631 (= lt!669813 (choose!2043 (toList!11203 lm!249) a!523 b!96 a0!49))))

(declare-fun e!865180 () Bool)

(assert (=> d!161631 e!865180))

(declare-fun res!1063477 () Bool)

(assert (=> d!161631 (=> (not res!1063477) (not e!865180))))

(assert (=> d!161631 (= res!1063477 (isStrictlySorted!892 (toList!11203 lm!249)))))

(assert (=> d!161631 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!5 (toList!11203 lm!249) a!523 b!96 a0!49) lt!669813)))

(declare-fun b!1553874 () Bool)

(assert (=> b!1553874 (= e!865180 (not (= a!523 a0!49)))))

(declare-fun b!1553875 () Bool)

(assert (=> b!1553875 (= e!865179 (= (getValueByKey!740 (insertStrictlySorted!508 (toList!11203 lm!249) a!523 b!96) a0!49) (getValueByKey!740 (toList!11203 lm!249) a0!49)))))

(assert (= (and d!161631 res!1063477) b!1553874))

(assert (= (and d!161631 res!1063478) b!1553875))

(assert (=> d!161631 m!1432273))

(assert (=> d!161631 m!1432277))

(assert (=> d!161631 m!1432281))

(declare-fun m!1432407 () Bool)

(assert (=> d!161631 m!1432407))

(declare-fun m!1432409 () Bool)

(assert (=> d!161631 m!1432409))

(assert (=> d!161631 m!1432281))

(assert (=> b!1553875 m!1432281))

(assert (=> b!1553875 m!1432281))

(declare-fun m!1432413 () Bool)

(assert (=> b!1553875 m!1432413))

(assert (=> b!1553875 m!1432259))

(assert (=> b!1553613 d!161631))

(assert (=> b!1553614 d!161595))

(declare-fun d!161639 () Bool)

(declare-fun isEmpty!1137 (Option!816) Bool)

(assert (=> d!161639 (= (isDefined!553 (getValueByKey!740 (toList!11203 lm!249) a0!49)) (not (isEmpty!1137 (getValueByKey!740 (toList!11203 lm!249) a0!49))))))

(declare-fun bs!44662 () Bool)

(assert (= bs!44662 d!161639))

(assert (=> bs!44662 m!1432259))

(declare-fun m!1432415 () Bool)

(assert (=> bs!44662 m!1432415))

(assert (=> b!1553614 d!161639))

(declare-fun d!161641 () Bool)

(assert (=> d!161641 (isDefined!553 (getValueByKey!740 (toList!11203 lm!249) a0!49))))

(declare-fun lt!669823 () Unit!51751)

(declare-fun choose!2045 (List!36229 (_ BitVec 64)) Unit!51751)

(assert (=> d!161641 (= lt!669823 (choose!2045 (toList!11203 lm!249) a0!49))))

(declare-fun e!865188 () Bool)

(assert (=> d!161641 e!865188))

(declare-fun res!1063485 () Bool)

(assert (=> d!161641 (=> (not res!1063485) (not e!865188))))

(assert (=> d!161641 (= res!1063485 (isStrictlySorted!892 (toList!11203 lm!249)))))

(assert (=> d!161641 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!505 (toList!11203 lm!249) a0!49) lt!669823)))

(declare-fun b!1553884 () Bool)

(assert (=> b!1553884 (= e!865188 (containsKey!762 (toList!11203 lm!249) a0!49))))

(assert (= (and d!161641 res!1063485) b!1553884))

(assert (=> d!161641 m!1432259))

(assert (=> d!161641 m!1432259))

(assert (=> d!161641 m!1432263))

(declare-fun m!1432425 () Bool)

(assert (=> d!161641 m!1432425))

(assert (=> d!161641 m!1432277))

(assert (=> b!1553884 m!1432273))

(assert (=> b!1553614 d!161641))

(declare-fun d!161645 () Bool)

(declare-fun e!865190 () Bool)

(assert (=> d!161645 e!865190))

(declare-fun res!1063486 () Bool)

(assert (=> d!161645 (=> res!1063486 e!865190)))

(declare-fun lt!669824 () Bool)

(assert (=> d!161645 (= res!1063486 (not lt!669824))))

(declare-fun lt!669827 () Bool)

(assert (=> d!161645 (= lt!669824 lt!669827)))

(declare-fun lt!669825 () Unit!51751)

(declare-fun e!865189 () Unit!51751)

(assert (=> d!161645 (= lt!669825 e!865189)))

(declare-fun c!143333 () Bool)

(assert (=> d!161645 (= c!143333 lt!669827)))

(assert (=> d!161645 (= lt!669827 (containsKey!762 (toList!11203 (+!5013 lm!249 (tuple2!24767 a!523 b!96))) a0!49))))

(assert (=> d!161645 (= (contains!10145 (+!5013 lm!249 (tuple2!24767 a!523 b!96)) a0!49) lt!669824)))

(declare-fun b!1553885 () Bool)

(declare-fun lt!669826 () Unit!51751)

(assert (=> b!1553885 (= e!865189 lt!669826)))

(assert (=> b!1553885 (= lt!669826 (lemmaContainsKeyImpliesGetValueByKeyDefined!505 (toList!11203 (+!5013 lm!249 (tuple2!24767 a!523 b!96))) a0!49))))

(assert (=> b!1553885 (isDefined!553 (getValueByKey!740 (toList!11203 (+!5013 lm!249 (tuple2!24767 a!523 b!96))) a0!49))))

(declare-fun b!1553886 () Bool)

(declare-fun Unit!51760 () Unit!51751)

(assert (=> b!1553886 (= e!865189 Unit!51760)))

(declare-fun b!1553887 () Bool)

(assert (=> b!1553887 (= e!865190 (isDefined!553 (getValueByKey!740 (toList!11203 (+!5013 lm!249 (tuple2!24767 a!523 b!96))) a0!49)))))

(assert (= (and d!161645 c!143333) b!1553885))

(assert (= (and d!161645 (not c!143333)) b!1553886))

(assert (= (and d!161645 (not res!1063486)) b!1553887))

(declare-fun m!1432429 () Bool)

(assert (=> d!161645 m!1432429))

(declare-fun m!1432431 () Bool)

(assert (=> b!1553885 m!1432431))

(declare-fun m!1432433 () Bool)

(assert (=> b!1553885 m!1432433))

(assert (=> b!1553885 m!1432433))

(declare-fun m!1432435 () Bool)

(assert (=> b!1553885 m!1432435))

(assert (=> b!1553887 m!1432433))

(assert (=> b!1553887 m!1432433))

(assert (=> b!1553887 m!1432435))

(assert (=> b!1553614 d!161645))

(declare-fun d!161649 () Bool)

(declare-fun e!865196 () Bool)

(assert (=> d!161649 e!865196))

(declare-fun res!1063497 () Bool)

(assert (=> d!161649 (=> (not res!1063497) (not e!865196))))

(declare-fun lt!669849 () ListLongMap!22375)

(assert (=> d!161649 (= res!1063497 (contains!10145 lt!669849 (_1!12394 (tuple2!24767 a!523 b!96))))))

(declare-fun lt!669850 () List!36229)

(assert (=> d!161649 (= lt!669849 (ListLongMap!22376 lt!669850))))

(declare-fun lt!669851 () Unit!51751)

(declare-fun lt!669848 () Unit!51751)

(assert (=> d!161649 (= lt!669851 lt!669848)))

(assert (=> d!161649 (= (getValueByKey!740 lt!669850 (_1!12394 (tuple2!24767 a!523 b!96))) (Some!815 (_2!12394 (tuple2!24767 a!523 b!96))))))

(declare-fun lemmaContainsTupThenGetReturnValue!377 (List!36229 (_ BitVec 64) B!2218) Unit!51751)

(assert (=> d!161649 (= lt!669848 (lemmaContainsTupThenGetReturnValue!377 lt!669850 (_1!12394 (tuple2!24767 a!523 b!96)) (_2!12394 (tuple2!24767 a!523 b!96))))))

(assert (=> d!161649 (= lt!669850 (insertStrictlySorted!508 (toList!11203 lm!249) (_1!12394 (tuple2!24767 a!523 b!96)) (_2!12394 (tuple2!24767 a!523 b!96))))))

(assert (=> d!161649 (= (+!5013 lm!249 (tuple2!24767 a!523 b!96)) lt!669849)))

(declare-fun b!1553898 () Bool)

(declare-fun res!1063498 () Bool)

(assert (=> b!1553898 (=> (not res!1063498) (not e!865196))))

(assert (=> b!1553898 (= res!1063498 (= (getValueByKey!740 (toList!11203 lt!669849) (_1!12394 (tuple2!24767 a!523 b!96))) (Some!815 (_2!12394 (tuple2!24767 a!523 b!96)))))))

(declare-fun b!1553899 () Bool)

(assert (=> b!1553899 (= e!865196 (contains!10149 (toList!11203 lt!669849) (tuple2!24767 a!523 b!96)))))

(assert (= (and d!161649 res!1063497) b!1553898))

(assert (= (and b!1553898 res!1063498) b!1553899))

(declare-fun m!1432449 () Bool)

(assert (=> d!161649 m!1432449))

(declare-fun m!1432451 () Bool)

(assert (=> d!161649 m!1432451))

(declare-fun m!1432453 () Bool)

(assert (=> d!161649 m!1432453))

(declare-fun m!1432455 () Bool)

(assert (=> d!161649 m!1432455))

(declare-fun m!1432457 () Bool)

(assert (=> b!1553898 m!1432457))

(declare-fun m!1432459 () Bool)

(assert (=> b!1553899 m!1432459))

(assert (=> b!1553614 d!161649))

(declare-fun b!1553909 () Bool)

(declare-fun e!865202 () Bool)

(declare-fun tp!112134 () Bool)

(assert (=> b!1553909 (= e!865202 (and tp_is_empty!38229 tp!112134))))

(assert (=> b!1553615 (= tp!112122 e!865202)))

(assert (= (and b!1553615 ((_ is Cons!36225) (toList!11203 lm!249))) b!1553909))

(check-sat (not b!1553885) (not b!1553725) (not b!1553752) (not bm!71396) (not b!1553899) (not b!1553666) (not b!1553884) (not b!1553664) (not d!161649) (not b!1553844) (not d!161639) (not b!1553750) (not d!161577) tp_is_empty!38229 (not b!1553692) (not b!1553853) (not b!1553909) (not b!1553851) (not b!1553729) (not d!161603) (not d!161631) (not b!1553887) (not d!161641) (not d!161587) (not b!1553875) (not b!1553898) (not d!161645))
(check-sat)
