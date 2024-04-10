; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132898 () Bool)

(assert start!132898)

(declare-fun res!1064724 () Bool)

(declare-fun e!866777 () Bool)

(assert (=> start!132898 (=> (not res!1064724) (not e!866777))))

(declare-datatypes ((B!2350 0))(
  ( (B!2351 (val!19261 Int)) )
))
(declare-datatypes ((tuple2!24898 0))(
  ( (tuple2!24899 (_1!12460 (_ BitVec 64)) (_2!12460 B!2350)) )
))
(declare-datatypes ((List!36295 0))(
  ( (Nil!36292) (Cons!36291 (h!37737 tuple2!24898) (t!51016 List!36295)) )
))
(declare-fun l!1177 () List!36295)

(declare-fun isStrictlySorted!948 (List!36295) Bool)

(assert (=> start!132898 (= res!1064724 (isStrictlySorted!948 l!1177))))

(assert (=> start!132898 e!866777))

(declare-fun e!866774 () Bool)

(assert (=> start!132898 e!866774))

(assert (=> start!132898 true))

(declare-fun tp_is_empty!38361 () Bool)

(assert (=> start!132898 tp_is_empty!38361))

(declare-fun b!1556280 () Bool)

(declare-fun res!1064726 () Bool)

(assert (=> b!1556280 (=> (not res!1064726) (not e!866777))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1556280 (= res!1064726 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36291) l!1177) (not (= (_1!12460 (h!37737 l!1177)) otherKey!50))))))

(declare-fun b!1556281 () Bool)

(declare-fun tp!112428 () Bool)

(assert (=> b!1556281 (= e!866774 (and tp_is_empty!38361 tp!112428))))

(declare-fun b!1556282 () Bool)

(declare-fun e!866776 () Bool)

(declare-fun lt!670407 () List!36295)

(declare-datatypes ((Option!852 0))(
  ( (Some!851 (v!22036 B!2350)) (None!850) )
))
(declare-fun getValueByKey!776 (List!36295 (_ BitVec 64)) Option!852)

(assert (=> b!1556282 (= e!866776 (= (getValueByKey!776 lt!670407 otherKey!50) (getValueByKey!776 l!1177 otherKey!50)))))

(declare-fun b!1556283 () Bool)

(declare-fun res!1064728 () Bool)

(assert (=> b!1556283 (=> (not res!1064728) (not e!866777))))

(assert (=> b!1556283 (= res!1064728 (isStrictlySorted!948 (t!51016 l!1177)))))

(declare-fun b!1556284 () Bool)

(assert (=> b!1556284 (= e!866777 (not e!866776))))

(declare-fun res!1064725 () Bool)

(assert (=> b!1556284 (=> (not res!1064725) (not e!866776))))

(declare-fun containsKey!810 (List!36295 (_ BitVec 64)) Bool)

(assert (=> b!1556284 (= res!1064725 (= (containsKey!810 lt!670407 otherKey!50) (containsKey!810 l!1177 otherKey!50)))))

(declare-fun newValue!105 () B!2350)

(declare-fun insertStrictlySorted!550 (List!36295 (_ BitVec 64) B!2350) List!36295)

(assert (=> b!1556284 (= lt!670407 (insertStrictlySorted!550 l!1177 newKey!105 newValue!105))))

(declare-fun e!866775 () Bool)

(assert (=> b!1556284 e!866775))

(declare-fun res!1064727 () Bool)

(assert (=> b!1556284 (=> (not res!1064727) (not e!866775))))

(declare-fun lt!670409 () List!36295)

(assert (=> b!1556284 (= res!1064727 (= (containsKey!810 lt!670409 otherKey!50) (containsKey!810 (t!51016 l!1177) otherKey!50)))))

(assert (=> b!1556284 (= lt!670409 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51840 0))(
  ( (Unit!51841) )
))
(declare-fun lt!670408 () Unit!51840)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!35 (List!36295 (_ BitVec 64) B!2350 (_ BitVec 64)) Unit!51840)

(assert (=> b!1556284 (= lt!670408 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!35 (t!51016 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1556285 () Bool)

(assert (=> b!1556285 (= e!866775 (= (getValueByKey!776 lt!670409 otherKey!50) (getValueByKey!776 (t!51016 l!1177) otherKey!50)))))

(assert (= (and start!132898 res!1064724) b!1556280))

(assert (= (and b!1556280 res!1064726) b!1556283))

(assert (= (and b!1556283 res!1064728) b!1556284))

(assert (= (and b!1556284 res!1064727) b!1556285))

(assert (= (and b!1556284 res!1064725) b!1556282))

(assert (= (and start!132898 ((_ is Cons!36291) l!1177)) b!1556281))

(declare-fun m!1433855 () Bool)

(assert (=> b!1556285 m!1433855))

(declare-fun m!1433857 () Bool)

(assert (=> b!1556285 m!1433857))

(declare-fun m!1433859 () Bool)

(assert (=> start!132898 m!1433859))

(declare-fun m!1433861 () Bool)

(assert (=> b!1556282 m!1433861))

(declare-fun m!1433863 () Bool)

(assert (=> b!1556282 m!1433863))

(declare-fun m!1433865 () Bool)

(assert (=> b!1556283 m!1433865))

(declare-fun m!1433867 () Bool)

(assert (=> b!1556284 m!1433867))

(declare-fun m!1433869 () Bool)

(assert (=> b!1556284 m!1433869))

(declare-fun m!1433871 () Bool)

(assert (=> b!1556284 m!1433871))

(declare-fun m!1433873 () Bool)

(assert (=> b!1556284 m!1433873))

(declare-fun m!1433875 () Bool)

(assert (=> b!1556284 m!1433875))

(declare-fun m!1433877 () Bool)

(assert (=> b!1556284 m!1433877))

(declare-fun m!1433879 () Bool)

(assert (=> b!1556284 m!1433879))

(check-sat (not start!132898) (not b!1556281) (not b!1556283) (not b!1556282) tp_is_empty!38361 (not b!1556284) (not b!1556285))
(check-sat)
(get-model)

(declare-fun b!1556313 () Bool)

(declare-fun e!866794 () Option!852)

(declare-fun e!866795 () Option!852)

(assert (=> b!1556313 (= e!866794 e!866795)))

(declare-fun c!143732 () Bool)

(assert (=> b!1556313 (= c!143732 (and ((_ is Cons!36291) lt!670409) (not (= (_1!12460 (h!37737 lt!670409)) otherKey!50))))))

(declare-fun b!1556315 () Bool)

(assert (=> b!1556315 (= e!866795 None!850)))

(declare-fun b!1556312 () Bool)

(assert (=> b!1556312 (= e!866794 (Some!851 (_2!12460 (h!37737 lt!670409))))))

(declare-fun d!162103 () Bool)

(declare-fun c!143731 () Bool)

(assert (=> d!162103 (= c!143731 (and ((_ is Cons!36291) lt!670409) (= (_1!12460 (h!37737 lt!670409)) otherKey!50)))))

(assert (=> d!162103 (= (getValueByKey!776 lt!670409 otherKey!50) e!866794)))

(declare-fun b!1556314 () Bool)

(assert (=> b!1556314 (= e!866795 (getValueByKey!776 (t!51016 lt!670409) otherKey!50))))

(assert (= (and d!162103 c!143731) b!1556312))

(assert (= (and d!162103 (not c!143731)) b!1556313))

(assert (= (and b!1556313 c!143732) b!1556314))

(assert (= (and b!1556313 (not c!143732)) b!1556315))

(declare-fun m!1433907 () Bool)

(assert (=> b!1556314 m!1433907))

(assert (=> b!1556285 d!162103))

(declare-fun b!1556317 () Bool)

(declare-fun e!866796 () Option!852)

(declare-fun e!866797 () Option!852)

(assert (=> b!1556317 (= e!866796 e!866797)))

(declare-fun c!143734 () Bool)

(assert (=> b!1556317 (= c!143734 (and ((_ is Cons!36291) (t!51016 l!1177)) (not (= (_1!12460 (h!37737 (t!51016 l!1177))) otherKey!50))))))

(declare-fun b!1556319 () Bool)

(assert (=> b!1556319 (= e!866797 None!850)))

(declare-fun b!1556316 () Bool)

(assert (=> b!1556316 (= e!866796 (Some!851 (_2!12460 (h!37737 (t!51016 l!1177)))))))

(declare-fun d!162107 () Bool)

(declare-fun c!143733 () Bool)

(assert (=> d!162107 (= c!143733 (and ((_ is Cons!36291) (t!51016 l!1177)) (= (_1!12460 (h!37737 (t!51016 l!1177))) otherKey!50)))))

(assert (=> d!162107 (= (getValueByKey!776 (t!51016 l!1177) otherKey!50) e!866796)))

(declare-fun b!1556318 () Bool)

(assert (=> b!1556318 (= e!866797 (getValueByKey!776 (t!51016 (t!51016 l!1177)) otherKey!50))))

(assert (= (and d!162107 c!143733) b!1556316))

(assert (= (and d!162107 (not c!143733)) b!1556317))

(assert (= (and b!1556317 c!143734) b!1556318))

(assert (= (and b!1556317 (not c!143734)) b!1556319))

(declare-fun m!1433909 () Bool)

(assert (=> b!1556318 m!1433909))

(assert (=> b!1556285 d!162107))

(declare-fun b!1556325 () Bool)

(declare-fun e!866802 () Option!852)

(declare-fun e!866803 () Option!852)

(assert (=> b!1556325 (= e!866802 e!866803)))

(declare-fun c!143736 () Bool)

(assert (=> b!1556325 (= c!143736 (and ((_ is Cons!36291) lt!670407) (not (= (_1!12460 (h!37737 lt!670407)) otherKey!50))))))

(declare-fun b!1556327 () Bool)

(assert (=> b!1556327 (= e!866803 None!850)))

(declare-fun b!1556324 () Bool)

(assert (=> b!1556324 (= e!866802 (Some!851 (_2!12460 (h!37737 lt!670407))))))

(declare-fun d!162109 () Bool)

(declare-fun c!143735 () Bool)

(assert (=> d!162109 (= c!143735 (and ((_ is Cons!36291) lt!670407) (= (_1!12460 (h!37737 lt!670407)) otherKey!50)))))

(assert (=> d!162109 (= (getValueByKey!776 lt!670407 otherKey!50) e!866802)))

(declare-fun b!1556326 () Bool)

(assert (=> b!1556326 (= e!866803 (getValueByKey!776 (t!51016 lt!670407) otherKey!50))))

(assert (= (and d!162109 c!143735) b!1556324))

(assert (= (and d!162109 (not c!143735)) b!1556325))

(assert (= (and b!1556325 c!143736) b!1556326))

(assert (= (and b!1556325 (not c!143736)) b!1556327))

(declare-fun m!1433911 () Bool)

(assert (=> b!1556326 m!1433911))

(assert (=> b!1556282 d!162109))

(declare-fun b!1556329 () Bool)

(declare-fun e!866804 () Option!852)

(declare-fun e!866805 () Option!852)

(assert (=> b!1556329 (= e!866804 e!866805)))

(declare-fun c!143738 () Bool)

(assert (=> b!1556329 (= c!143738 (and ((_ is Cons!36291) l!1177) (not (= (_1!12460 (h!37737 l!1177)) otherKey!50))))))

(declare-fun b!1556331 () Bool)

(assert (=> b!1556331 (= e!866805 None!850)))

(declare-fun b!1556328 () Bool)

(assert (=> b!1556328 (= e!866804 (Some!851 (_2!12460 (h!37737 l!1177))))))

(declare-fun d!162111 () Bool)

(declare-fun c!143737 () Bool)

(assert (=> d!162111 (= c!143737 (and ((_ is Cons!36291) l!1177) (= (_1!12460 (h!37737 l!1177)) otherKey!50)))))

(assert (=> d!162111 (= (getValueByKey!776 l!1177 otherKey!50) e!866804)))

(declare-fun b!1556330 () Bool)

(assert (=> b!1556330 (= e!866805 (getValueByKey!776 (t!51016 l!1177) otherKey!50))))

(assert (= (and d!162111 c!143737) b!1556328))

(assert (= (and d!162111 (not c!143737)) b!1556329))

(assert (= (and b!1556329 c!143738) b!1556330))

(assert (= (and b!1556329 (not c!143738)) b!1556331))

(assert (=> b!1556330 m!1433857))

(assert (=> b!1556282 d!162111))

(declare-fun d!162113 () Bool)

(declare-fun res!1064754 () Bool)

(declare-fun e!866812 () Bool)

(assert (=> d!162113 (=> res!1064754 e!866812)))

(assert (=> d!162113 (= res!1064754 (or ((_ is Nil!36292) (t!51016 l!1177)) ((_ is Nil!36292) (t!51016 (t!51016 l!1177)))))))

(assert (=> d!162113 (= (isStrictlySorted!948 (t!51016 l!1177)) e!866812)))

(declare-fun b!1556338 () Bool)

(declare-fun e!866813 () Bool)

(assert (=> b!1556338 (= e!866812 e!866813)))

(declare-fun res!1064755 () Bool)

(assert (=> b!1556338 (=> (not res!1064755) (not e!866813))))

(assert (=> b!1556338 (= res!1064755 (bvslt (_1!12460 (h!37737 (t!51016 l!1177))) (_1!12460 (h!37737 (t!51016 (t!51016 l!1177))))))))

(declare-fun b!1556339 () Bool)

(assert (=> b!1556339 (= e!866813 (isStrictlySorted!948 (t!51016 (t!51016 l!1177))))))

(assert (= (and d!162113 (not res!1064754)) b!1556338))

(assert (= (and b!1556338 res!1064755) b!1556339))

(declare-fun m!1433915 () Bool)

(assert (=> b!1556339 m!1433915))

(assert (=> b!1556283 d!162113))

(declare-fun d!162119 () Bool)

(declare-fun res!1064756 () Bool)

(declare-fun e!866814 () Bool)

(assert (=> d!162119 (=> res!1064756 e!866814)))

(assert (=> d!162119 (= res!1064756 (or ((_ is Nil!36292) l!1177) ((_ is Nil!36292) (t!51016 l!1177))))))

(assert (=> d!162119 (= (isStrictlySorted!948 l!1177) e!866814)))

(declare-fun b!1556340 () Bool)

(declare-fun e!866815 () Bool)

(assert (=> b!1556340 (= e!866814 e!866815)))

(declare-fun res!1064757 () Bool)

(assert (=> b!1556340 (=> (not res!1064757) (not e!866815))))

(assert (=> b!1556340 (= res!1064757 (bvslt (_1!12460 (h!37737 l!1177)) (_1!12460 (h!37737 (t!51016 l!1177)))))))

(declare-fun b!1556341 () Bool)

(assert (=> b!1556341 (= e!866815 (isStrictlySorted!948 (t!51016 l!1177)))))

(assert (= (and d!162119 (not res!1064756)) b!1556340))

(assert (= (and b!1556340 res!1064757) b!1556341))

(assert (=> b!1556341 m!1433865))

(assert (=> start!132898 d!162119))

(declare-fun c!143773 () Bool)

(declare-fun c!143772 () Bool)

(declare-fun e!866856 () List!36295)

(declare-fun b!1556422 () Bool)

(assert (=> b!1556422 (= e!866856 (ite c!143772 (t!51016 l!1177) (ite c!143773 (Cons!36291 (h!37737 l!1177) (t!51016 l!1177)) Nil!36292)))))

(declare-fun b!1556423 () Bool)

(assert (=> b!1556423 (= e!866856 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105))))

(declare-fun b!1556424 () Bool)

(declare-fun e!866857 () List!36295)

(declare-fun call!71605 () List!36295)

(assert (=> b!1556424 (= e!866857 call!71605)))

(declare-fun b!1556425 () Bool)

(assert (=> b!1556425 (= c!143773 (and ((_ is Cons!36291) l!1177) (bvsgt (_1!12460 (h!37737 l!1177)) newKey!105)))))

(declare-fun e!866858 () List!36295)

(declare-fun e!866859 () List!36295)

(assert (=> b!1556425 (= e!866858 e!866859)))

(declare-fun b!1556426 () Bool)

(declare-fun res!1064775 () Bool)

(declare-fun e!866860 () Bool)

(assert (=> b!1556426 (=> (not res!1064775) (not e!866860))))

(declare-fun lt!670427 () List!36295)

(assert (=> b!1556426 (= res!1064775 (containsKey!810 lt!670427 newKey!105))))

(declare-fun b!1556427 () Bool)

(declare-fun contains!10184 (List!36295 tuple2!24898) Bool)

(assert (=> b!1556427 (= e!866860 (contains!10184 lt!670427 (tuple2!24899 newKey!105 newValue!105)))))

(declare-fun bm!71602 () Bool)

(declare-fun call!71606 () List!36295)

(assert (=> bm!71602 (= call!71606 call!71605)))

(declare-fun b!1556428 () Bool)

(declare-fun call!71607 () List!36295)

(assert (=> b!1556428 (= e!866859 call!71607)))

(declare-fun bm!71603 () Bool)

(assert (=> bm!71603 (= call!71607 call!71606)))

(declare-fun c!143771 () Bool)

(declare-fun bm!71604 () Bool)

(declare-fun $colon$colon!968 (List!36295 tuple2!24898) List!36295)

(assert (=> bm!71604 (= call!71605 ($colon$colon!968 e!866856 (ite c!143771 (h!37737 l!1177) (tuple2!24899 newKey!105 newValue!105))))))

(declare-fun c!143774 () Bool)

(assert (=> bm!71604 (= c!143774 c!143771)))

(declare-fun b!1556429 () Bool)

(assert (=> b!1556429 (= e!866859 call!71607)))

(declare-fun d!162121 () Bool)

(assert (=> d!162121 e!866860))

(declare-fun res!1064774 () Bool)

(assert (=> d!162121 (=> (not res!1064774) (not e!866860))))

(assert (=> d!162121 (= res!1064774 (isStrictlySorted!948 lt!670427))))

(assert (=> d!162121 (= lt!670427 e!866857)))

(assert (=> d!162121 (= c!143771 (and ((_ is Cons!36291) l!1177) (bvslt (_1!12460 (h!37737 l!1177)) newKey!105)))))

(assert (=> d!162121 (isStrictlySorted!948 l!1177)))

(assert (=> d!162121 (= (insertStrictlySorted!550 l!1177 newKey!105 newValue!105) lt!670427)))

(declare-fun b!1556430 () Bool)

(assert (=> b!1556430 (= e!866858 call!71606)))

(declare-fun b!1556431 () Bool)

(assert (=> b!1556431 (= e!866857 e!866858)))

(assert (=> b!1556431 (= c!143772 (and ((_ is Cons!36291) l!1177) (= (_1!12460 (h!37737 l!1177)) newKey!105)))))

(assert (= (and d!162121 c!143771) b!1556424))

(assert (= (and d!162121 (not c!143771)) b!1556431))

(assert (= (and b!1556431 c!143772) b!1556430))

(assert (= (and b!1556431 (not c!143772)) b!1556425))

(assert (= (and b!1556425 c!143773) b!1556428))

(assert (= (and b!1556425 (not c!143773)) b!1556429))

(assert (= (or b!1556428 b!1556429) bm!71603))

(assert (= (or b!1556430 bm!71603) bm!71602))

(assert (= (or b!1556424 bm!71602) bm!71604))

(assert (= (and bm!71604 c!143774) b!1556423))

(assert (= (and bm!71604 (not c!143774)) b!1556422))

(assert (= (and d!162121 res!1064774) b!1556426))

(assert (= (and b!1556426 res!1064775) b!1556427))

(declare-fun m!1433933 () Bool)

(assert (=> b!1556426 m!1433933))

(declare-fun m!1433935 () Bool)

(assert (=> b!1556427 m!1433935))

(assert (=> b!1556423 m!1433873))

(declare-fun m!1433937 () Bool)

(assert (=> d!162121 m!1433937))

(assert (=> d!162121 m!1433859))

(declare-fun m!1433939 () Bool)

(assert (=> bm!71604 m!1433939))

(assert (=> b!1556284 d!162121))

(declare-fun d!162127 () Bool)

(declare-fun e!866883 () Bool)

(assert (=> d!162127 e!866883))

(declare-fun res!1064798 () Bool)

(assert (=> d!162127 (=> (not res!1064798) (not e!866883))))

(assert (=> d!162127 (= res!1064798 (= (containsKey!810 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!810 (t!51016 l!1177) otherKey!50)))))

(declare-fun lt!670435 () Unit!51840)

(declare-fun choose!2063 (List!36295 (_ BitVec 64) B!2350 (_ BitVec 64)) Unit!51840)

(assert (=> d!162127 (= lt!670435 (choose!2063 (t!51016 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!866884 () Bool)

(assert (=> d!162127 e!866884))

(declare-fun res!1064799 () Bool)

(assert (=> d!162127 (=> (not res!1064799) (not e!866884))))

(assert (=> d!162127 (= res!1064799 (isStrictlySorted!948 (t!51016 l!1177)))))

(assert (=> d!162127 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!35 (t!51016 l!1177) newKey!105 newValue!105 otherKey!50) lt!670435)))

(declare-fun b!1556454 () Bool)

(assert (=> b!1556454 (= e!866884 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1556455 () Bool)

(assert (=> b!1556455 (= e!866883 (= (getValueByKey!776 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!776 (t!51016 l!1177) otherKey!50)))))

(assert (= (and d!162127 res!1064799) b!1556454))

(assert (= (and d!162127 res!1064798) b!1556455))

(assert (=> d!162127 m!1433873))

(assert (=> d!162127 m!1433875))

(assert (=> d!162127 m!1433873))

(declare-fun m!1433949 () Bool)

(assert (=> d!162127 m!1433949))

(declare-fun m!1433951 () Bool)

(assert (=> d!162127 m!1433951))

(assert (=> d!162127 m!1433865))

(assert (=> b!1556455 m!1433873))

(assert (=> b!1556455 m!1433873))

(declare-fun m!1433953 () Bool)

(assert (=> b!1556455 m!1433953))

(assert (=> b!1556455 m!1433857))

(assert (=> b!1556284 d!162127))

(declare-fun d!162133 () Bool)

(declare-fun res!1064826 () Bool)

(declare-fun e!866917 () Bool)

(assert (=> d!162133 (=> res!1064826 e!866917)))

(assert (=> d!162133 (= res!1064826 (and ((_ is Cons!36291) lt!670409) (= (_1!12460 (h!37737 lt!670409)) otherKey!50)))))

(assert (=> d!162133 (= (containsKey!810 lt!670409 otherKey!50) e!866917)))

(declare-fun b!1556498 () Bool)

(declare-fun e!866918 () Bool)

(assert (=> b!1556498 (= e!866917 e!866918)))

(declare-fun res!1064827 () Bool)

(assert (=> b!1556498 (=> (not res!1064827) (not e!866918))))

(assert (=> b!1556498 (= res!1064827 (and (or (not ((_ is Cons!36291) lt!670409)) (bvsle (_1!12460 (h!37737 lt!670409)) otherKey!50)) ((_ is Cons!36291) lt!670409) (bvslt (_1!12460 (h!37737 lt!670409)) otherKey!50)))))

(declare-fun b!1556499 () Bool)

(assert (=> b!1556499 (= e!866918 (containsKey!810 (t!51016 lt!670409) otherKey!50))))

(assert (= (and d!162133 (not res!1064826)) b!1556498))

(assert (= (and b!1556498 res!1064827) b!1556499))

(declare-fun m!1433991 () Bool)

(assert (=> b!1556499 m!1433991))

(assert (=> b!1556284 d!162133))

(declare-fun d!162155 () Bool)

(declare-fun res!1064828 () Bool)

(declare-fun e!866919 () Bool)

(assert (=> d!162155 (=> res!1064828 e!866919)))

(assert (=> d!162155 (= res!1064828 (and ((_ is Cons!36291) l!1177) (= (_1!12460 (h!37737 l!1177)) otherKey!50)))))

(assert (=> d!162155 (= (containsKey!810 l!1177 otherKey!50) e!866919)))

(declare-fun b!1556500 () Bool)

(declare-fun e!866920 () Bool)

(assert (=> b!1556500 (= e!866919 e!866920)))

(declare-fun res!1064829 () Bool)

(assert (=> b!1556500 (=> (not res!1064829) (not e!866920))))

(assert (=> b!1556500 (= res!1064829 (and (or (not ((_ is Cons!36291) l!1177)) (bvsle (_1!12460 (h!37737 l!1177)) otherKey!50)) ((_ is Cons!36291) l!1177) (bvslt (_1!12460 (h!37737 l!1177)) otherKey!50)))))

(declare-fun b!1556501 () Bool)

(assert (=> b!1556501 (= e!866920 (containsKey!810 (t!51016 l!1177) otherKey!50))))

(assert (= (and d!162155 (not res!1064828)) b!1556500))

(assert (= (and b!1556500 res!1064829) b!1556501))

(assert (=> b!1556501 m!1433875))

(assert (=> b!1556284 d!162155))

(declare-fun e!866921 () List!36295)

(declare-fun b!1556502 () Bool)

(declare-fun c!143785 () Bool)

(declare-fun c!143784 () Bool)

(assert (=> b!1556502 (= e!866921 (ite c!143784 (t!51016 (t!51016 l!1177)) (ite c!143785 (Cons!36291 (h!37737 (t!51016 l!1177)) (t!51016 (t!51016 l!1177))) Nil!36292)))))

(declare-fun b!1556503 () Bool)

(assert (=> b!1556503 (= e!866921 (insertStrictlySorted!550 (t!51016 (t!51016 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1556504 () Bool)

(declare-fun e!866922 () List!36295)

(declare-fun call!71614 () List!36295)

(assert (=> b!1556504 (= e!866922 call!71614)))

(declare-fun b!1556505 () Bool)

(assert (=> b!1556505 (= c!143785 (and ((_ is Cons!36291) (t!51016 l!1177)) (bvsgt (_1!12460 (h!37737 (t!51016 l!1177))) newKey!105)))))

(declare-fun e!866923 () List!36295)

(declare-fun e!866924 () List!36295)

(assert (=> b!1556505 (= e!866923 e!866924)))

(declare-fun b!1556506 () Bool)

(declare-fun res!1064831 () Bool)

(declare-fun e!866925 () Bool)

(assert (=> b!1556506 (=> (not res!1064831) (not e!866925))))

(declare-fun lt!670439 () List!36295)

(assert (=> b!1556506 (= res!1064831 (containsKey!810 lt!670439 newKey!105))))

(declare-fun b!1556507 () Bool)

(assert (=> b!1556507 (= e!866925 (contains!10184 lt!670439 (tuple2!24899 newKey!105 newValue!105)))))

(declare-fun bm!71611 () Bool)

(declare-fun call!71615 () List!36295)

(assert (=> bm!71611 (= call!71615 call!71614)))

(declare-fun b!1556508 () Bool)

(declare-fun call!71616 () List!36295)

(assert (=> b!1556508 (= e!866924 call!71616)))

(declare-fun bm!71612 () Bool)

(assert (=> bm!71612 (= call!71616 call!71615)))

(declare-fun bm!71613 () Bool)

(declare-fun c!143783 () Bool)

(assert (=> bm!71613 (= call!71614 ($colon$colon!968 e!866921 (ite c!143783 (h!37737 (t!51016 l!1177)) (tuple2!24899 newKey!105 newValue!105))))))

(declare-fun c!143786 () Bool)

(assert (=> bm!71613 (= c!143786 c!143783)))

(declare-fun b!1556509 () Bool)

(assert (=> b!1556509 (= e!866924 call!71616)))

(declare-fun d!162157 () Bool)

(assert (=> d!162157 e!866925))

(declare-fun res!1064830 () Bool)

(assert (=> d!162157 (=> (not res!1064830) (not e!866925))))

(assert (=> d!162157 (= res!1064830 (isStrictlySorted!948 lt!670439))))

(assert (=> d!162157 (= lt!670439 e!866922)))

(assert (=> d!162157 (= c!143783 (and ((_ is Cons!36291) (t!51016 l!1177)) (bvslt (_1!12460 (h!37737 (t!51016 l!1177))) newKey!105)))))

(assert (=> d!162157 (isStrictlySorted!948 (t!51016 l!1177))))

(assert (=> d!162157 (= (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105) lt!670439)))

(declare-fun b!1556510 () Bool)

(assert (=> b!1556510 (= e!866923 call!71615)))

(declare-fun b!1556511 () Bool)

(assert (=> b!1556511 (= e!866922 e!866923)))

(assert (=> b!1556511 (= c!143784 (and ((_ is Cons!36291) (t!51016 l!1177)) (= (_1!12460 (h!37737 (t!51016 l!1177))) newKey!105)))))

(assert (= (and d!162157 c!143783) b!1556504))

(assert (= (and d!162157 (not c!143783)) b!1556511))

(assert (= (and b!1556511 c!143784) b!1556510))

(assert (= (and b!1556511 (not c!143784)) b!1556505))

(assert (= (and b!1556505 c!143785) b!1556508))

(assert (= (and b!1556505 (not c!143785)) b!1556509))

(assert (= (or b!1556508 b!1556509) bm!71612))

(assert (= (or b!1556510 bm!71612) bm!71611))

(assert (= (or b!1556504 bm!71611) bm!71613))

(assert (= (and bm!71613 c!143786) b!1556503))

(assert (= (and bm!71613 (not c!143786)) b!1556502))

(assert (= (and d!162157 res!1064830) b!1556506))

(assert (= (and b!1556506 res!1064831) b!1556507))

(declare-fun m!1433993 () Bool)

(assert (=> b!1556506 m!1433993))

(declare-fun m!1433995 () Bool)

(assert (=> b!1556507 m!1433995))

(declare-fun m!1433997 () Bool)

(assert (=> b!1556503 m!1433997))

(declare-fun m!1433999 () Bool)

(assert (=> d!162157 m!1433999))

(assert (=> d!162157 m!1433865))

(declare-fun m!1434001 () Bool)

(assert (=> bm!71613 m!1434001))

(assert (=> b!1556284 d!162157))

(declare-fun d!162159 () Bool)

(declare-fun res!1064832 () Bool)

(declare-fun e!866931 () Bool)

(assert (=> d!162159 (=> res!1064832 e!866931)))

(assert (=> d!162159 (= res!1064832 (and ((_ is Cons!36291) (t!51016 l!1177)) (= (_1!12460 (h!37737 (t!51016 l!1177))) otherKey!50)))))

(assert (=> d!162159 (= (containsKey!810 (t!51016 l!1177) otherKey!50) e!866931)))

(declare-fun b!1556527 () Bool)

(declare-fun e!866933 () Bool)

(assert (=> b!1556527 (= e!866931 e!866933)))

(declare-fun res!1064833 () Bool)

(assert (=> b!1556527 (=> (not res!1064833) (not e!866933))))

(assert (=> b!1556527 (= res!1064833 (and (or (not ((_ is Cons!36291) (t!51016 l!1177))) (bvsle (_1!12460 (h!37737 (t!51016 l!1177))) otherKey!50)) ((_ is Cons!36291) (t!51016 l!1177)) (bvslt (_1!12460 (h!37737 (t!51016 l!1177))) otherKey!50)))))

(declare-fun b!1556528 () Bool)

(assert (=> b!1556528 (= e!866933 (containsKey!810 (t!51016 (t!51016 l!1177)) otherKey!50))))

(assert (= (and d!162159 (not res!1064832)) b!1556527))

(assert (= (and b!1556527 res!1064833) b!1556528))

(declare-fun m!1434003 () Bool)

(assert (=> b!1556528 m!1434003))

(assert (=> b!1556284 d!162159))

(declare-fun d!162161 () Bool)

(declare-fun res!1064834 () Bool)

(declare-fun e!866936 () Bool)

(assert (=> d!162161 (=> res!1064834 e!866936)))

(assert (=> d!162161 (= res!1064834 (and ((_ is Cons!36291) lt!670407) (= (_1!12460 (h!37737 lt!670407)) otherKey!50)))))

(assert (=> d!162161 (= (containsKey!810 lt!670407 otherKey!50) e!866936)))

(declare-fun b!1556530 () Bool)

(declare-fun e!866937 () Bool)

(assert (=> b!1556530 (= e!866936 e!866937)))

(declare-fun res!1064835 () Bool)

(assert (=> b!1556530 (=> (not res!1064835) (not e!866937))))

(assert (=> b!1556530 (= res!1064835 (and (or (not ((_ is Cons!36291) lt!670407)) (bvsle (_1!12460 (h!37737 lt!670407)) otherKey!50)) ((_ is Cons!36291) lt!670407) (bvslt (_1!12460 (h!37737 lt!670407)) otherKey!50)))))

(declare-fun b!1556531 () Bool)

(assert (=> b!1556531 (= e!866937 (containsKey!810 (t!51016 lt!670407) otherKey!50))))

(assert (= (and d!162161 (not res!1064834)) b!1556530))

(assert (= (and b!1556530 res!1064835) b!1556531))

(declare-fun m!1434005 () Bool)

(assert (=> b!1556531 m!1434005))

(assert (=> b!1556284 d!162161))

(declare-fun b!1556536 () Bool)

(declare-fun e!866940 () Bool)

(declare-fun tp!112434 () Bool)

(assert (=> b!1556536 (= e!866940 (and tp_is_empty!38361 tp!112434))))

(assert (=> b!1556281 (= tp!112428 e!866940)))

(assert (= (and b!1556281 ((_ is Cons!36291) (t!51016 l!1177))) b!1556536))

(check-sat (not d!162121) (not b!1556314) (not b!1556341) tp_is_empty!38361 (not b!1556531) (not b!1556536) (not b!1556507) (not b!1556503) (not b!1556506) (not b!1556318) (not bm!71613) (not d!162157) (not bm!71604) (not b!1556326) (not b!1556339) (not b!1556528) (not d!162127) (not b!1556426) (not b!1556499) (not b!1556455) (not b!1556330) (not b!1556423) (not b!1556501) (not b!1556427))
(check-sat)
(get-model)

(declare-fun d!162181 () Bool)

(declare-fun res!1064846 () Bool)

(declare-fun e!866973 () Bool)

(assert (=> d!162181 (=> res!1064846 e!866973)))

(assert (=> d!162181 (= res!1064846 (or ((_ is Nil!36292) lt!670427) ((_ is Nil!36292) (t!51016 lt!670427))))))

(assert (=> d!162181 (= (isStrictlySorted!948 lt!670427) e!866973)))

(declare-fun b!1556589 () Bool)

(declare-fun e!866974 () Bool)

(assert (=> b!1556589 (= e!866973 e!866974)))

(declare-fun res!1064847 () Bool)

(assert (=> b!1556589 (=> (not res!1064847) (not e!866974))))

(assert (=> b!1556589 (= res!1064847 (bvslt (_1!12460 (h!37737 lt!670427)) (_1!12460 (h!37737 (t!51016 lt!670427)))))))

(declare-fun b!1556590 () Bool)

(assert (=> b!1556590 (= e!866974 (isStrictlySorted!948 (t!51016 lt!670427)))))

(assert (= (and d!162181 (not res!1064846)) b!1556589))

(assert (= (and b!1556589 res!1064847) b!1556590))

(declare-fun m!1434021 () Bool)

(assert (=> b!1556590 m!1434021))

(assert (=> d!162121 d!162181))

(assert (=> d!162121 d!162119))

(declare-fun b!1556592 () Bool)

(declare-fun e!866975 () Option!852)

(declare-fun e!866976 () Option!852)

(assert (=> b!1556592 (= e!866975 e!866976)))

(declare-fun c!143812 () Bool)

(assert (=> b!1556592 (= c!143812 (and ((_ is Cons!36291) (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105)) (not (= (_1!12460 (h!37737 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105))) otherKey!50))))))

(declare-fun b!1556594 () Bool)

(assert (=> b!1556594 (= e!866976 None!850)))

(declare-fun b!1556591 () Bool)

(assert (=> b!1556591 (= e!866975 (Some!851 (_2!12460 (h!37737 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105)))))))

(declare-fun c!143811 () Bool)

(declare-fun d!162183 () Bool)

(assert (=> d!162183 (= c!143811 (and ((_ is Cons!36291) (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105)) (= (_1!12460 (h!37737 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(assert (=> d!162183 (= (getValueByKey!776 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105) otherKey!50) e!866975)))

(declare-fun b!1556593 () Bool)

(assert (=> b!1556593 (= e!866976 (getValueByKey!776 (t!51016 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105)) otherKey!50))))

(assert (= (and d!162183 c!143811) b!1556591))

(assert (= (and d!162183 (not c!143811)) b!1556592))

(assert (= (and b!1556592 c!143812) b!1556593))

(assert (= (and b!1556592 (not c!143812)) b!1556594))

(declare-fun m!1434023 () Bool)

(assert (=> b!1556593 m!1434023))

(assert (=> b!1556455 d!162183))

(assert (=> b!1556455 d!162157))

(assert (=> b!1556455 d!162107))

(declare-fun b!1556596 () Bool)

(declare-fun e!866977 () Option!852)

(declare-fun e!866978 () Option!852)

(assert (=> b!1556596 (= e!866977 e!866978)))

(declare-fun c!143814 () Bool)

(assert (=> b!1556596 (= c!143814 (and ((_ is Cons!36291) (t!51016 (t!51016 l!1177))) (not (= (_1!12460 (h!37737 (t!51016 (t!51016 l!1177)))) otherKey!50))))))

(declare-fun b!1556598 () Bool)

(assert (=> b!1556598 (= e!866978 None!850)))

(declare-fun b!1556595 () Bool)

(assert (=> b!1556595 (= e!866977 (Some!851 (_2!12460 (h!37737 (t!51016 (t!51016 l!1177))))))))

(declare-fun d!162185 () Bool)

(declare-fun c!143813 () Bool)

(assert (=> d!162185 (= c!143813 (and ((_ is Cons!36291) (t!51016 (t!51016 l!1177))) (= (_1!12460 (h!37737 (t!51016 (t!51016 l!1177)))) otherKey!50)))))

(assert (=> d!162185 (= (getValueByKey!776 (t!51016 (t!51016 l!1177)) otherKey!50) e!866977)))

(declare-fun b!1556597 () Bool)

(assert (=> b!1556597 (= e!866978 (getValueByKey!776 (t!51016 (t!51016 (t!51016 l!1177))) otherKey!50))))

(assert (= (and d!162185 c!143813) b!1556595))

(assert (= (and d!162185 (not c!143813)) b!1556596))

(assert (= (and b!1556596 c!143814) b!1556597))

(assert (= (and b!1556596 (not c!143814)) b!1556598))

(declare-fun m!1434025 () Bool)

(assert (=> b!1556597 m!1434025))

(assert (=> b!1556318 d!162185))

(declare-fun b!1556599 () Bool)

(declare-fun c!143817 () Bool)

(declare-fun e!866979 () List!36295)

(declare-fun c!143816 () Bool)

(assert (=> b!1556599 (= e!866979 (ite c!143816 (t!51016 (t!51016 (t!51016 l!1177))) (ite c!143817 (Cons!36291 (h!37737 (t!51016 (t!51016 l!1177))) (t!51016 (t!51016 (t!51016 l!1177)))) Nil!36292)))))

(declare-fun b!1556600 () Bool)

(assert (=> b!1556600 (= e!866979 (insertStrictlySorted!550 (t!51016 (t!51016 (t!51016 l!1177))) newKey!105 newValue!105))))

(declare-fun b!1556601 () Bool)

(declare-fun e!866980 () List!36295)

(declare-fun call!71617 () List!36295)

(assert (=> b!1556601 (= e!866980 call!71617)))

(declare-fun b!1556602 () Bool)

(assert (=> b!1556602 (= c!143817 (and ((_ is Cons!36291) (t!51016 (t!51016 l!1177))) (bvsgt (_1!12460 (h!37737 (t!51016 (t!51016 l!1177)))) newKey!105)))))

(declare-fun e!866981 () List!36295)

(declare-fun e!866982 () List!36295)

(assert (=> b!1556602 (= e!866981 e!866982)))

(declare-fun b!1556603 () Bool)

(declare-fun res!1064849 () Bool)

(declare-fun e!866983 () Bool)

(assert (=> b!1556603 (=> (not res!1064849) (not e!866983))))

(declare-fun lt!670440 () List!36295)

(assert (=> b!1556603 (= res!1064849 (containsKey!810 lt!670440 newKey!105))))

(declare-fun b!1556604 () Bool)

(assert (=> b!1556604 (= e!866983 (contains!10184 lt!670440 (tuple2!24899 newKey!105 newValue!105)))))

(declare-fun bm!71614 () Bool)

(declare-fun call!71618 () List!36295)

(assert (=> bm!71614 (= call!71618 call!71617)))

(declare-fun b!1556605 () Bool)

(declare-fun call!71619 () List!36295)

(assert (=> b!1556605 (= e!866982 call!71619)))

(declare-fun bm!71615 () Bool)

(assert (=> bm!71615 (= call!71619 call!71618)))

(declare-fun bm!71616 () Bool)

(declare-fun c!143815 () Bool)

(assert (=> bm!71616 (= call!71617 ($colon$colon!968 e!866979 (ite c!143815 (h!37737 (t!51016 (t!51016 l!1177))) (tuple2!24899 newKey!105 newValue!105))))))

(declare-fun c!143818 () Bool)

(assert (=> bm!71616 (= c!143818 c!143815)))

(declare-fun b!1556606 () Bool)

(assert (=> b!1556606 (= e!866982 call!71619)))

(declare-fun d!162187 () Bool)

(assert (=> d!162187 e!866983))

(declare-fun res!1064848 () Bool)

(assert (=> d!162187 (=> (not res!1064848) (not e!866983))))

(assert (=> d!162187 (= res!1064848 (isStrictlySorted!948 lt!670440))))

(assert (=> d!162187 (= lt!670440 e!866980)))

(assert (=> d!162187 (= c!143815 (and ((_ is Cons!36291) (t!51016 (t!51016 l!1177))) (bvslt (_1!12460 (h!37737 (t!51016 (t!51016 l!1177)))) newKey!105)))))

(assert (=> d!162187 (isStrictlySorted!948 (t!51016 (t!51016 l!1177)))))

(assert (=> d!162187 (= (insertStrictlySorted!550 (t!51016 (t!51016 l!1177)) newKey!105 newValue!105) lt!670440)))

(declare-fun b!1556607 () Bool)

(assert (=> b!1556607 (= e!866981 call!71618)))

(declare-fun b!1556608 () Bool)

(assert (=> b!1556608 (= e!866980 e!866981)))

(assert (=> b!1556608 (= c!143816 (and ((_ is Cons!36291) (t!51016 (t!51016 l!1177))) (= (_1!12460 (h!37737 (t!51016 (t!51016 l!1177)))) newKey!105)))))

(assert (= (and d!162187 c!143815) b!1556601))

(assert (= (and d!162187 (not c!143815)) b!1556608))

(assert (= (and b!1556608 c!143816) b!1556607))

(assert (= (and b!1556608 (not c!143816)) b!1556602))

(assert (= (and b!1556602 c!143817) b!1556605))

(assert (= (and b!1556602 (not c!143817)) b!1556606))

(assert (= (or b!1556605 b!1556606) bm!71615))

(assert (= (or b!1556607 bm!71615) bm!71614))

(assert (= (or b!1556601 bm!71614) bm!71616))

(assert (= (and bm!71616 c!143818) b!1556600))

(assert (= (and bm!71616 (not c!143818)) b!1556599))

(assert (= (and d!162187 res!1064848) b!1556603))

(assert (= (and b!1556603 res!1064849) b!1556604))

(declare-fun m!1434027 () Bool)

(assert (=> b!1556603 m!1434027))

(declare-fun m!1434029 () Bool)

(assert (=> b!1556604 m!1434029))

(declare-fun m!1434031 () Bool)

(assert (=> b!1556600 m!1434031))

(declare-fun m!1434033 () Bool)

(assert (=> d!162187 m!1434033))

(assert (=> d!162187 m!1433915))

(declare-fun m!1434035 () Bool)

(assert (=> bm!71616 m!1434035))

(assert (=> b!1556503 d!162187))

(declare-fun d!162189 () Bool)

(declare-fun res!1064850 () Bool)

(declare-fun e!866984 () Bool)

(assert (=> d!162189 (=> res!1064850 e!866984)))

(assert (=> d!162189 (= res!1064850 (and ((_ is Cons!36291) (t!51016 (t!51016 l!1177))) (= (_1!12460 (h!37737 (t!51016 (t!51016 l!1177)))) otherKey!50)))))

(assert (=> d!162189 (= (containsKey!810 (t!51016 (t!51016 l!1177)) otherKey!50) e!866984)))

(declare-fun b!1556609 () Bool)

(declare-fun e!866985 () Bool)

(assert (=> b!1556609 (= e!866984 e!866985)))

(declare-fun res!1064851 () Bool)

(assert (=> b!1556609 (=> (not res!1064851) (not e!866985))))

(assert (=> b!1556609 (= res!1064851 (and (or (not ((_ is Cons!36291) (t!51016 (t!51016 l!1177)))) (bvsle (_1!12460 (h!37737 (t!51016 (t!51016 l!1177)))) otherKey!50)) ((_ is Cons!36291) (t!51016 (t!51016 l!1177))) (bvslt (_1!12460 (h!37737 (t!51016 (t!51016 l!1177)))) otherKey!50)))))

(declare-fun b!1556610 () Bool)

(assert (=> b!1556610 (= e!866985 (containsKey!810 (t!51016 (t!51016 (t!51016 l!1177))) otherKey!50))))

(assert (= (and d!162189 (not res!1064850)) b!1556609))

(assert (= (and b!1556609 res!1064851) b!1556610))

(declare-fun m!1434037 () Bool)

(assert (=> b!1556610 m!1434037))

(assert (=> b!1556528 d!162189))

(declare-fun d!162191 () Bool)

(declare-fun res!1064852 () Bool)

(declare-fun e!866986 () Bool)

(assert (=> d!162191 (=> res!1064852 e!866986)))

(assert (=> d!162191 (= res!1064852 (and ((_ is Cons!36291) lt!670427) (= (_1!12460 (h!37737 lt!670427)) newKey!105)))))

(assert (=> d!162191 (= (containsKey!810 lt!670427 newKey!105) e!866986)))

(declare-fun b!1556611 () Bool)

(declare-fun e!866987 () Bool)

(assert (=> b!1556611 (= e!866986 e!866987)))

(declare-fun res!1064853 () Bool)

(assert (=> b!1556611 (=> (not res!1064853) (not e!866987))))

(assert (=> b!1556611 (= res!1064853 (and (or (not ((_ is Cons!36291) lt!670427)) (bvsle (_1!12460 (h!37737 lt!670427)) newKey!105)) ((_ is Cons!36291) lt!670427) (bvslt (_1!12460 (h!37737 lt!670427)) newKey!105)))))

(declare-fun b!1556612 () Bool)

(assert (=> b!1556612 (= e!866987 (containsKey!810 (t!51016 lt!670427) newKey!105))))

(assert (= (and d!162191 (not res!1064852)) b!1556611))

(assert (= (and b!1556611 res!1064853) b!1556612))

(declare-fun m!1434039 () Bool)

(assert (=> b!1556612 m!1434039))

(assert (=> b!1556426 d!162191))

(declare-fun lt!670443 () Bool)

(declare-fun d!162193 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!796 (List!36295) (InoxSet tuple2!24898))

(assert (=> d!162193 (= lt!670443 (select (content!796 lt!670427) (tuple2!24899 newKey!105 newValue!105)))))

(declare-fun e!866993 () Bool)

(assert (=> d!162193 (= lt!670443 e!866993)))

(declare-fun res!1064858 () Bool)

(assert (=> d!162193 (=> (not res!1064858) (not e!866993))))

(assert (=> d!162193 (= res!1064858 ((_ is Cons!36291) lt!670427))))

(assert (=> d!162193 (= (contains!10184 lt!670427 (tuple2!24899 newKey!105 newValue!105)) lt!670443)))

(declare-fun b!1556617 () Bool)

(declare-fun e!866992 () Bool)

(assert (=> b!1556617 (= e!866993 e!866992)))

(declare-fun res!1064859 () Bool)

(assert (=> b!1556617 (=> res!1064859 e!866992)))

(assert (=> b!1556617 (= res!1064859 (= (h!37737 lt!670427) (tuple2!24899 newKey!105 newValue!105)))))

(declare-fun b!1556618 () Bool)

(assert (=> b!1556618 (= e!866992 (contains!10184 (t!51016 lt!670427) (tuple2!24899 newKey!105 newValue!105)))))

(assert (= (and d!162193 res!1064858) b!1556617))

(assert (= (and b!1556617 (not res!1064859)) b!1556618))

(declare-fun m!1434041 () Bool)

(assert (=> d!162193 m!1434041))

(declare-fun m!1434043 () Bool)

(assert (=> d!162193 m!1434043))

(declare-fun m!1434045 () Bool)

(assert (=> b!1556618 m!1434045))

(assert (=> b!1556427 d!162193))

(assert (=> b!1556501 d!162159))

(declare-fun b!1556620 () Bool)

(declare-fun e!866994 () Option!852)

(declare-fun e!866995 () Option!852)

(assert (=> b!1556620 (= e!866994 e!866995)))

(declare-fun c!143820 () Bool)

(assert (=> b!1556620 (= c!143820 (and ((_ is Cons!36291) (t!51016 lt!670407)) (not (= (_1!12460 (h!37737 (t!51016 lt!670407))) otherKey!50))))))

(declare-fun b!1556622 () Bool)

(assert (=> b!1556622 (= e!866995 None!850)))

(declare-fun b!1556619 () Bool)

(assert (=> b!1556619 (= e!866994 (Some!851 (_2!12460 (h!37737 (t!51016 lt!670407)))))))

(declare-fun d!162195 () Bool)

(declare-fun c!143819 () Bool)

(assert (=> d!162195 (= c!143819 (and ((_ is Cons!36291) (t!51016 lt!670407)) (= (_1!12460 (h!37737 (t!51016 lt!670407))) otherKey!50)))))

(assert (=> d!162195 (= (getValueByKey!776 (t!51016 lt!670407) otherKey!50) e!866994)))

(declare-fun b!1556621 () Bool)

(assert (=> b!1556621 (= e!866995 (getValueByKey!776 (t!51016 (t!51016 lt!670407)) otherKey!50))))

(assert (= (and d!162195 c!143819) b!1556619))

(assert (= (and d!162195 (not c!143819)) b!1556620))

(assert (= (and b!1556620 c!143820) b!1556621))

(assert (= (and b!1556620 (not c!143820)) b!1556622))

(declare-fun m!1434047 () Bool)

(assert (=> b!1556621 m!1434047))

(assert (=> b!1556326 d!162195))

(declare-fun d!162197 () Bool)

(declare-fun res!1064860 () Bool)

(declare-fun e!866996 () Bool)

(assert (=> d!162197 (=> res!1064860 e!866996)))

(assert (=> d!162197 (= res!1064860 (and ((_ is Cons!36291) lt!670439) (= (_1!12460 (h!37737 lt!670439)) newKey!105)))))

(assert (=> d!162197 (= (containsKey!810 lt!670439 newKey!105) e!866996)))

(declare-fun b!1556623 () Bool)

(declare-fun e!866997 () Bool)

(assert (=> b!1556623 (= e!866996 e!866997)))

(declare-fun res!1064861 () Bool)

(assert (=> b!1556623 (=> (not res!1064861) (not e!866997))))

(assert (=> b!1556623 (= res!1064861 (and (or (not ((_ is Cons!36291) lt!670439)) (bvsle (_1!12460 (h!37737 lt!670439)) newKey!105)) ((_ is Cons!36291) lt!670439) (bvslt (_1!12460 (h!37737 lt!670439)) newKey!105)))))

(declare-fun b!1556624 () Bool)

(assert (=> b!1556624 (= e!866997 (containsKey!810 (t!51016 lt!670439) newKey!105))))

(assert (= (and d!162197 (not res!1064860)) b!1556623))

(assert (= (and b!1556623 res!1064861) b!1556624))

(declare-fun m!1434049 () Bool)

(assert (=> b!1556624 m!1434049))

(assert (=> b!1556506 d!162197))

(assert (=> d!162127 d!162113))

(assert (=> d!162127 d!162157))

(assert (=> d!162127 d!162159))

(declare-fun d!162199 () Bool)

(declare-fun res!1064862 () Bool)

(declare-fun e!866998 () Bool)

(assert (=> d!162199 (=> res!1064862 e!866998)))

(assert (=> d!162199 (= res!1064862 (and ((_ is Cons!36291) (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105)) (= (_1!12460 (h!37737 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(assert (=> d!162199 (= (containsKey!810 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105) otherKey!50) e!866998)))

(declare-fun b!1556625 () Bool)

(declare-fun e!866999 () Bool)

(assert (=> b!1556625 (= e!866998 e!866999)))

(declare-fun res!1064863 () Bool)

(assert (=> b!1556625 (=> (not res!1064863) (not e!866999))))

(assert (=> b!1556625 (= res!1064863 (and (or (not ((_ is Cons!36291) (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105))) (bvsle (_1!12460 (h!37737 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105))) otherKey!50)) ((_ is Cons!36291) (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105)) (bvslt (_1!12460 (h!37737 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105))) otherKey!50)))))

(declare-fun b!1556626 () Bool)

(assert (=> b!1556626 (= e!866999 (containsKey!810 (t!51016 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105)) otherKey!50))))

(assert (= (and d!162199 (not res!1064862)) b!1556625))

(assert (= (and b!1556625 res!1064863) b!1556626))

(declare-fun m!1434051 () Bool)

(assert (=> b!1556626 m!1434051))

(assert (=> d!162127 d!162199))

(declare-fun d!162201 () Bool)

(declare-fun e!867002 () Bool)

(assert (=> d!162201 e!867002))

(declare-fun res!1064866 () Bool)

(assert (=> d!162201 (=> (not res!1064866) (not e!867002))))

(assert (=> d!162201 (= res!1064866 (= (containsKey!810 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!810 (t!51016 l!1177) otherKey!50)))))

(assert (=> d!162201 true))

(declare-fun _$16!190 () Unit!51840)

(assert (=> d!162201 (= (choose!2063 (t!51016 l!1177) newKey!105 newValue!105 otherKey!50) _$16!190)))

(declare-fun b!1556629 () Bool)

(assert (=> b!1556629 (= e!867002 (= (getValueByKey!776 (insertStrictlySorted!550 (t!51016 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!776 (t!51016 l!1177) otherKey!50)))))

(assert (= (and d!162201 res!1064866) b!1556629))

(assert (=> d!162201 m!1433873))

(assert (=> d!162201 m!1433873))

(assert (=> d!162201 m!1433949))

(assert (=> d!162201 m!1433875))

(assert (=> b!1556629 m!1433873))

(assert (=> b!1556629 m!1433873))

(assert (=> b!1556629 m!1433953))

(assert (=> b!1556629 m!1433857))

(assert (=> d!162127 d!162201))

(assert (=> b!1556330 d!162107))

(declare-fun d!162203 () Bool)

(declare-fun res!1064867 () Bool)

(declare-fun e!867003 () Bool)

(assert (=> d!162203 (=> res!1064867 e!867003)))

(assert (=> d!162203 (= res!1064867 (or ((_ is Nil!36292) lt!670439) ((_ is Nil!36292) (t!51016 lt!670439))))))

(assert (=> d!162203 (= (isStrictlySorted!948 lt!670439) e!867003)))

(declare-fun b!1556630 () Bool)

(declare-fun e!867004 () Bool)

(assert (=> b!1556630 (= e!867003 e!867004)))

(declare-fun res!1064868 () Bool)

(assert (=> b!1556630 (=> (not res!1064868) (not e!867004))))

(assert (=> b!1556630 (= res!1064868 (bvslt (_1!12460 (h!37737 lt!670439)) (_1!12460 (h!37737 (t!51016 lt!670439)))))))

(declare-fun b!1556631 () Bool)

(assert (=> b!1556631 (= e!867004 (isStrictlySorted!948 (t!51016 lt!670439)))))

(assert (= (and d!162203 (not res!1064867)) b!1556630))

(assert (= (and b!1556630 res!1064868) b!1556631))

(declare-fun m!1434053 () Bool)

(assert (=> b!1556631 m!1434053))

(assert (=> d!162157 d!162203))

(assert (=> d!162157 d!162113))

(declare-fun d!162205 () Bool)

(declare-fun res!1064869 () Bool)

(declare-fun e!867005 () Bool)

(assert (=> d!162205 (=> res!1064869 e!867005)))

(assert (=> d!162205 (= res!1064869 (and ((_ is Cons!36291) (t!51016 lt!670407)) (= (_1!12460 (h!37737 (t!51016 lt!670407))) otherKey!50)))))

(assert (=> d!162205 (= (containsKey!810 (t!51016 lt!670407) otherKey!50) e!867005)))

(declare-fun b!1556632 () Bool)

(declare-fun e!867006 () Bool)

(assert (=> b!1556632 (= e!867005 e!867006)))

(declare-fun res!1064870 () Bool)

(assert (=> b!1556632 (=> (not res!1064870) (not e!867006))))

(assert (=> b!1556632 (= res!1064870 (and (or (not ((_ is Cons!36291) (t!51016 lt!670407))) (bvsle (_1!12460 (h!37737 (t!51016 lt!670407))) otherKey!50)) ((_ is Cons!36291) (t!51016 lt!670407)) (bvslt (_1!12460 (h!37737 (t!51016 lt!670407))) otherKey!50)))))

(declare-fun b!1556633 () Bool)

(assert (=> b!1556633 (= e!867006 (containsKey!810 (t!51016 (t!51016 lt!670407)) otherKey!50))))

(assert (= (and d!162205 (not res!1064869)) b!1556632))

(assert (= (and b!1556632 res!1064870) b!1556633))

(declare-fun m!1434055 () Bool)

(assert (=> b!1556633 m!1434055))

(assert (=> b!1556531 d!162205))

(declare-fun lt!670444 () Bool)

(declare-fun d!162207 () Bool)

(assert (=> d!162207 (= lt!670444 (select (content!796 lt!670439) (tuple2!24899 newKey!105 newValue!105)))))

(declare-fun e!867008 () Bool)

(assert (=> d!162207 (= lt!670444 e!867008)))

(declare-fun res!1064871 () Bool)

(assert (=> d!162207 (=> (not res!1064871) (not e!867008))))

(assert (=> d!162207 (= res!1064871 ((_ is Cons!36291) lt!670439))))

(assert (=> d!162207 (= (contains!10184 lt!670439 (tuple2!24899 newKey!105 newValue!105)) lt!670444)))

(declare-fun b!1556634 () Bool)

(declare-fun e!867007 () Bool)

(assert (=> b!1556634 (= e!867008 e!867007)))

(declare-fun res!1064872 () Bool)

(assert (=> b!1556634 (=> res!1064872 e!867007)))

(assert (=> b!1556634 (= res!1064872 (= (h!37737 lt!670439) (tuple2!24899 newKey!105 newValue!105)))))

(declare-fun b!1556635 () Bool)

(assert (=> b!1556635 (= e!867007 (contains!10184 (t!51016 lt!670439) (tuple2!24899 newKey!105 newValue!105)))))

(assert (= (and d!162207 res!1064871) b!1556634))

(assert (= (and b!1556634 (not res!1064872)) b!1556635))

(declare-fun m!1434057 () Bool)

(assert (=> d!162207 m!1434057))

(declare-fun m!1434059 () Bool)

(assert (=> d!162207 m!1434059))

(declare-fun m!1434061 () Bool)

(assert (=> b!1556635 m!1434061))

(assert (=> b!1556507 d!162207))

(declare-fun d!162209 () Bool)

(assert (=> d!162209 (= ($colon$colon!968 e!866856 (ite c!143771 (h!37737 l!1177) (tuple2!24899 newKey!105 newValue!105))) (Cons!36291 (ite c!143771 (h!37737 l!1177) (tuple2!24899 newKey!105 newValue!105)) e!866856))))

(assert (=> bm!71604 d!162209))

(declare-fun d!162211 () Bool)

(declare-fun res!1064873 () Bool)

(declare-fun e!867009 () Bool)

(assert (=> d!162211 (=> res!1064873 e!867009)))

(assert (=> d!162211 (= res!1064873 (and ((_ is Cons!36291) (t!51016 lt!670409)) (= (_1!12460 (h!37737 (t!51016 lt!670409))) otherKey!50)))))

(assert (=> d!162211 (= (containsKey!810 (t!51016 lt!670409) otherKey!50) e!867009)))

(declare-fun b!1556636 () Bool)

(declare-fun e!867010 () Bool)

(assert (=> b!1556636 (= e!867009 e!867010)))

(declare-fun res!1064874 () Bool)

(assert (=> b!1556636 (=> (not res!1064874) (not e!867010))))

(assert (=> b!1556636 (= res!1064874 (and (or (not ((_ is Cons!36291) (t!51016 lt!670409))) (bvsle (_1!12460 (h!37737 (t!51016 lt!670409))) otherKey!50)) ((_ is Cons!36291) (t!51016 lt!670409)) (bvslt (_1!12460 (h!37737 (t!51016 lt!670409))) otherKey!50)))))

(declare-fun b!1556637 () Bool)

(assert (=> b!1556637 (= e!867010 (containsKey!810 (t!51016 (t!51016 lt!670409)) otherKey!50))))

(assert (= (and d!162211 (not res!1064873)) b!1556636))

(assert (= (and b!1556636 res!1064874) b!1556637))

(declare-fun m!1434063 () Bool)

(assert (=> b!1556637 m!1434063))

(assert (=> b!1556499 d!162211))

(declare-fun b!1556639 () Bool)

(declare-fun e!867011 () Option!852)

(declare-fun e!867012 () Option!852)

(assert (=> b!1556639 (= e!867011 e!867012)))

(declare-fun c!143822 () Bool)

(assert (=> b!1556639 (= c!143822 (and ((_ is Cons!36291) (t!51016 lt!670409)) (not (= (_1!12460 (h!37737 (t!51016 lt!670409))) otherKey!50))))))

(declare-fun b!1556641 () Bool)

(assert (=> b!1556641 (= e!867012 None!850)))

(declare-fun b!1556638 () Bool)

(assert (=> b!1556638 (= e!867011 (Some!851 (_2!12460 (h!37737 (t!51016 lt!670409)))))))

(declare-fun d!162213 () Bool)

(declare-fun c!143821 () Bool)

(assert (=> d!162213 (= c!143821 (and ((_ is Cons!36291) (t!51016 lt!670409)) (= (_1!12460 (h!37737 (t!51016 lt!670409))) otherKey!50)))))

(assert (=> d!162213 (= (getValueByKey!776 (t!51016 lt!670409) otherKey!50) e!867011)))

(declare-fun b!1556640 () Bool)

(assert (=> b!1556640 (= e!867012 (getValueByKey!776 (t!51016 (t!51016 lt!670409)) otherKey!50))))

(assert (= (and d!162213 c!143821) b!1556638))

(assert (= (and d!162213 (not c!143821)) b!1556639))

(assert (= (and b!1556639 c!143822) b!1556640))

(assert (= (and b!1556639 (not c!143822)) b!1556641))

(declare-fun m!1434065 () Bool)

(assert (=> b!1556640 m!1434065))

(assert (=> b!1556314 d!162213))

(declare-fun d!162215 () Bool)

(declare-fun res!1064875 () Bool)

(declare-fun e!867013 () Bool)

(assert (=> d!162215 (=> res!1064875 e!867013)))

(assert (=> d!162215 (= res!1064875 (or ((_ is Nil!36292) (t!51016 (t!51016 l!1177))) ((_ is Nil!36292) (t!51016 (t!51016 (t!51016 l!1177))))))))

(assert (=> d!162215 (= (isStrictlySorted!948 (t!51016 (t!51016 l!1177))) e!867013)))

(declare-fun b!1556642 () Bool)

(declare-fun e!867014 () Bool)

(assert (=> b!1556642 (= e!867013 e!867014)))

(declare-fun res!1064876 () Bool)

(assert (=> b!1556642 (=> (not res!1064876) (not e!867014))))

(assert (=> b!1556642 (= res!1064876 (bvslt (_1!12460 (h!37737 (t!51016 (t!51016 l!1177)))) (_1!12460 (h!37737 (t!51016 (t!51016 (t!51016 l!1177)))))))))

(declare-fun b!1556643 () Bool)

(assert (=> b!1556643 (= e!867014 (isStrictlySorted!948 (t!51016 (t!51016 (t!51016 l!1177)))))))

(assert (= (and d!162215 (not res!1064875)) b!1556642))

(assert (= (and b!1556642 res!1064876) b!1556643))

(declare-fun m!1434067 () Bool)

(assert (=> b!1556643 m!1434067))

(assert (=> b!1556339 d!162215))

(assert (=> b!1556423 d!162157))

(assert (=> b!1556341 d!162113))

(declare-fun d!162217 () Bool)

(assert (=> d!162217 (= ($colon$colon!968 e!866921 (ite c!143783 (h!37737 (t!51016 l!1177)) (tuple2!24899 newKey!105 newValue!105))) (Cons!36291 (ite c!143783 (h!37737 (t!51016 l!1177)) (tuple2!24899 newKey!105 newValue!105)) e!866921))))

(assert (=> bm!71613 d!162217))

(declare-fun b!1556644 () Bool)

(declare-fun e!867015 () Bool)

(declare-fun tp!112441 () Bool)

(assert (=> b!1556644 (= e!867015 (and tp_is_empty!38361 tp!112441))))

(assert (=> b!1556536 (= tp!112434 e!867015)))

(assert (= (and b!1556536 ((_ is Cons!36291) (t!51016 (t!51016 l!1177)))) b!1556644))

(check-sat (not d!162193) (not b!1556643) (not b!1556626) (not b!1556618) tp_is_empty!38361 (not b!1556604) (not b!1556644) (not d!162207) (not b!1556621) (not b!1556600) (not b!1556629) (not b!1556597) (not b!1556624) (not b!1556640) (not b!1556593) (not b!1556637) (not b!1556612) (not d!162201) (not bm!71616) (not b!1556633) (not d!162187) (not b!1556635) (not b!1556631) (not b!1556603) (not b!1556590) (not b!1556610))
(check-sat)
