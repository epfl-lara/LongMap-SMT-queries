; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137314 () Bool)

(assert start!137314)

(declare-fun b!1581487 () Bool)

(declare-fun res!1079797 () Bool)

(declare-fun e!882335 () Bool)

(assert (=> b!1581487 (=> (not res!1079797) (not e!882335))))

(declare-fun a0!51 () (_ BitVec 64))

(declare-fun a!525 () (_ BitVec 64))

(assert (=> b!1581487 (= res!1079797 (not (= a0!51 a!525)))))

(declare-fun b!1581488 () Bool)

(declare-fun res!1079795 () Bool)

(assert (=> b!1581488 (=> (not res!1079795) (not e!882335))))

(declare-datatypes ((B!2572 0))(
  ( (B!2573 (val!19648 Int)) )
))
(declare-datatypes ((tuple2!25458 0))(
  ( (tuple2!25459 (_1!12740 (_ BitVec 64)) (_2!12740 B!2572)) )
))
(declare-datatypes ((List!36800 0))(
  ( (Nil!36797) (Cons!36796 (h!38357 tuple2!25458) (t!51706 List!36800)) )
))
(declare-datatypes ((ListLongMap!22805 0))(
  ( (ListLongMap!22806 (toList!11418 List!36800)) )
))
(declare-fun lm!251 () ListLongMap!22805)

(declare-fun isStrictlySorted!1017 (List!36800) Bool)

(assert (=> b!1581488 (= res!1079795 (isStrictlySorted!1017 (toList!11418 lm!251)))))

(declare-fun b!1581489 () Bool)

(declare-fun e!882334 () Bool)

(declare-fun tp!114282 () Bool)

(assert (=> b!1581489 (= e!882334 tp!114282)))

(declare-fun b!1581490 () Bool)

(declare-fun res!1079798 () Bool)

(assert (=> b!1581490 (=> (not res!1079798) (not e!882335))))

(assert (=> b!1581490 (= res!1079798 (not (= a!525 a0!51)))))

(declare-fun b!1581491 () Bool)

(declare-fun b!98 () B!2572)

(declare-fun contains!10485 (ListLongMap!22805 (_ BitVec 64)) Bool)

(declare-fun +!5128 (ListLongMap!22805 tuple2!25458) ListLongMap!22805)

(assert (=> b!1581491 (= e!882335 (not (not (contains!10485 (+!5128 lm!251 (tuple2!25459 a!525 b!98)) a0!51))))))

(declare-fun containsKey!879 (List!36800 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!604 (List!36800 (_ BitVec 64) B!2572) List!36800)

(assert (=> b!1581491 (not (containsKey!879 (insertStrictlySorted!604 (toList!11418 lm!251) a!525 b!98) a0!51))))

(declare-datatypes ((Unit!52118 0))(
  ( (Unit!52119) )
))
(declare-fun lt!677280 () Unit!52118)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!2 (List!36800 (_ BitVec 64) B!2572 (_ BitVec 64)) Unit!52118)

(assert (=> b!1581491 (= lt!677280 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!2 (toList!11418 lm!251) a!525 b!98 a0!51))))

(declare-fun res!1079794 () Bool)

(assert (=> start!137314 (=> (not res!1079794) (not e!882335))))

(assert (=> start!137314 (= res!1079794 (not (contains!10485 lm!251 a0!51)))))

(assert (=> start!137314 e!882335))

(declare-fun inv!58939 (ListLongMap!22805) Bool)

(assert (=> start!137314 (and (inv!58939 lm!251) e!882334)))

(assert (=> start!137314 true))

(declare-fun tp_is_empty!39117 () Bool)

(assert (=> start!137314 tp_is_empty!39117))

(declare-fun b!1581492 () Bool)

(declare-fun res!1079796 () Bool)

(assert (=> b!1581492 (=> (not res!1079796) (not e!882335))))

(assert (=> b!1581492 (= res!1079796 (not (containsKey!879 (toList!11418 lm!251) a0!51)))))

(assert (= (and start!137314 res!1079794) b!1581490))

(assert (= (and b!1581490 res!1079798) b!1581488))

(assert (= (and b!1581488 res!1079795) b!1581492))

(assert (= (and b!1581492 res!1079796) b!1581487))

(assert (= (and b!1581487 res!1079797) b!1581491))

(assert (= start!137314 b!1581489))

(declare-fun m!1453269 () Bool)

(assert (=> b!1581488 m!1453269))

(declare-fun m!1453271 () Bool)

(assert (=> b!1581491 m!1453271))

(declare-fun m!1453273 () Bool)

(assert (=> b!1581491 m!1453273))

(declare-fun m!1453275 () Bool)

(assert (=> b!1581491 m!1453275))

(assert (=> b!1581491 m!1453271))

(declare-fun m!1453277 () Bool)

(assert (=> b!1581491 m!1453277))

(declare-fun m!1453279 () Bool)

(assert (=> b!1581491 m!1453279))

(assert (=> b!1581491 m!1453273))

(declare-fun m!1453281 () Bool)

(assert (=> start!137314 m!1453281))

(declare-fun m!1453283 () Bool)

(assert (=> start!137314 m!1453283))

(declare-fun m!1453285 () Bool)

(assert (=> b!1581492 m!1453285))

(push 1)

(assert (not b!1581491))

(assert tp_is_empty!39117)

(assert (not b!1581489))

(assert (not b!1581492))

(assert (not b!1581488))

(assert (not start!137314))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166901 () Bool)

(declare-fun res!1079818 () Bool)

(declare-fun e!882346 () Bool)

(assert (=> d!166901 (=> res!1079818 e!882346)))

(assert (=> d!166901 (= res!1079818 (and (is-Cons!36796 (toList!11418 lm!251)) (= (_1!12740 (h!38357 (toList!11418 lm!251))) a0!51)))))

(assert (=> d!166901 (= (containsKey!879 (toList!11418 lm!251) a0!51) e!882346)))

(declare-fun b!1581515 () Bool)

(declare-fun e!882347 () Bool)

(assert (=> b!1581515 (= e!882346 e!882347)))

(declare-fun res!1079819 () Bool)

(assert (=> b!1581515 (=> (not res!1079819) (not e!882347))))

(assert (=> b!1581515 (= res!1079819 (and (or (not (is-Cons!36796 (toList!11418 lm!251))) (bvsle (_1!12740 (h!38357 (toList!11418 lm!251))) a0!51)) (is-Cons!36796 (toList!11418 lm!251)) (bvslt (_1!12740 (h!38357 (toList!11418 lm!251))) a0!51)))))

(declare-fun b!1581516 () Bool)

(assert (=> b!1581516 (= e!882347 (containsKey!879 (t!51706 (toList!11418 lm!251)) a0!51))))

(assert (= (and d!166901 (not res!1079818)) b!1581515))

(assert (= (and b!1581515 res!1079819) b!1581516))

(declare-fun m!1453305 () Bool)

(assert (=> b!1581516 m!1453305))

(assert (=> b!1581492 d!166901))

(declare-fun c!147139 () Bool)

(declare-fun c!147142 () Bool)

(declare-fun e!882376 () List!36800)

(declare-fun b!1581563 () Bool)

(assert (=> b!1581563 (= e!882376 (ite c!147142 (t!51706 (toList!11418 lm!251)) (ite c!147139 (Cons!36796 (h!38357 (toList!11418 lm!251)) (t!51706 (toList!11418 lm!251))) Nil!36797)))))

(declare-fun d!166907 () Bool)

(declare-fun e!882374 () Bool)

(assert (=> d!166907 e!882374))

(declare-fun res!1079834 () Bool)

(assert (=> d!166907 (=> (not res!1079834) (not e!882374))))

(declare-fun lt!677288 () List!36800)

(assert (=> d!166907 (= res!1079834 (isStrictlySorted!1017 lt!677288))))

(declare-fun e!882378 () List!36800)

(assert (=> d!166907 (= lt!677288 e!882378)))

(declare-fun c!147140 () Bool)

(assert (=> d!166907 (= c!147140 (and (is-Cons!36796 (toList!11418 lm!251)) (bvslt (_1!12740 (h!38357 (toList!11418 lm!251))) a!525)))))

(assert (=> d!166907 (isStrictlySorted!1017 (toList!11418 lm!251))))

(assert (=> d!166907 (= (insertStrictlySorted!604 (toList!11418 lm!251) a!525 b!98) lt!677288)))

(declare-fun b!1581564 () Bool)

(declare-fun e!882377 () List!36800)

(declare-fun call!72536 () List!36800)

(assert (=> b!1581564 (= e!882377 call!72536)))

(declare-fun b!1581565 () Bool)

(declare-fun e!882375 () List!36800)

(declare-fun call!72535 () List!36800)

(assert (=> b!1581565 (= e!882375 call!72535)))

(declare-fun b!1581566 () Bool)

(declare-fun contains!10487 (List!36800 tuple2!25458) Bool)

(assert (=> b!1581566 (= e!882374 (contains!10487 lt!677288 (tuple2!25459 a!525 b!98)))))

(declare-fun b!1581567 () Bool)

(assert (=> b!1581567 (= e!882375 call!72535)))

(declare-fun b!1581568 () Bool)

(declare-fun res!1079835 () Bool)

(assert (=> b!1581568 (=> (not res!1079835) (not e!882374))))

(assert (=> b!1581568 (= res!1079835 (containsKey!879 lt!677288 a!525))))

(declare-fun b!1581569 () Bool)

(declare-fun call!72534 () List!36800)

(assert (=> b!1581569 (= e!882378 call!72534)))

(declare-fun b!1581570 () Bool)

(assert (=> b!1581570 (= c!147139 (and (is-Cons!36796 (toList!11418 lm!251)) (bvsgt (_1!12740 (h!38357 (toList!11418 lm!251))) a!525)))))

(assert (=> b!1581570 (= e!882377 e!882375)))

(declare-fun bm!72531 () Bool)

(declare-fun $colon$colon!1003 (List!36800 tuple2!25458) List!36800)

(assert (=> bm!72531 (= call!72534 ($colon$colon!1003 e!882376 (ite c!147140 (h!38357 (toList!11418 lm!251)) (tuple2!25459 a!525 b!98))))))

(declare-fun c!147141 () Bool)

(assert (=> bm!72531 (= c!147141 c!147140)))

(declare-fun bm!72532 () Bool)

(assert (=> bm!72532 (= call!72536 call!72534)))

(declare-fun b!1581571 () Bool)

(assert (=> b!1581571 (= e!882378 e!882377)))

(assert (=> b!1581571 (= c!147142 (and (is-Cons!36796 (toList!11418 lm!251)) (= (_1!12740 (h!38357 (toList!11418 lm!251))) a!525)))))

(declare-fun bm!72533 () Bool)

(assert (=> bm!72533 (= call!72535 call!72536)))

(declare-fun b!1581572 () Bool)

(assert (=> b!1581572 (= e!882376 (insertStrictlySorted!604 (t!51706 (toList!11418 lm!251)) a!525 b!98))))

(assert (= (and d!166907 c!147140) b!1581569))

(assert (= (and d!166907 (not c!147140)) b!1581571))

(assert (= (and b!1581571 c!147142) b!1581564))

(assert (= (and b!1581571 (not c!147142)) b!1581570))

(assert (= (and b!1581570 c!147139) b!1581567))

(assert (= (and b!1581570 (not c!147139)) b!1581565))

(assert (= (or b!1581567 b!1581565) bm!72533))

(assert (= (or b!1581564 bm!72533) bm!72532))

(assert (= (or b!1581569 bm!72532) bm!72531))

(assert (= (and bm!72531 c!147141) b!1581572))

(assert (= (and bm!72531 (not c!147141)) b!1581563))

(assert (= (and d!166907 res!1079834) b!1581568))

(assert (= (and b!1581568 res!1079835) b!1581566))

(declare-fun m!1453309 () Bool)

(assert (=> b!1581568 m!1453309))

(declare-fun m!1453311 () Bool)

(assert (=> bm!72531 m!1453311))

(declare-fun m!1453313 () Bool)

(assert (=> b!1581566 m!1453313))

(declare-fun m!1453315 () Bool)

(assert (=> d!166907 m!1453315))

(assert (=> d!166907 m!1453269))

(declare-fun m!1453317 () Bool)

(assert (=> b!1581572 m!1453317))

(assert (=> b!1581491 d!166907))

(declare-fun d!166911 () Bool)

(declare-fun res!1079836 () Bool)

(declare-fun e!882379 () Bool)

(assert (=> d!166911 (=> res!1079836 e!882379)))

(assert (=> d!166911 (= res!1079836 (and (is-Cons!36796 (insertStrictlySorted!604 (toList!11418 lm!251) a!525 b!98)) (= (_1!12740 (h!38357 (insertStrictlySorted!604 (toList!11418 lm!251) a!525 b!98))) a0!51)))))

(assert (=> d!166911 (= (containsKey!879 (insertStrictlySorted!604 (toList!11418 lm!251) a!525 b!98) a0!51) e!882379)))

(declare-fun b!1581573 () Bool)

(declare-fun e!882380 () Bool)

(assert (=> b!1581573 (= e!882379 e!882380)))

(declare-fun res!1079837 () Bool)

(assert (=> b!1581573 (=> (not res!1079837) (not e!882380))))

(assert (=> b!1581573 (= res!1079837 (and (or (not (is-Cons!36796 (insertStrictlySorted!604 (toList!11418 lm!251) a!525 b!98))) (bvsle (_1!12740 (h!38357 (insertStrictlySorted!604 (toList!11418 lm!251) a!525 b!98))) a0!51)) (is-Cons!36796 (insertStrictlySorted!604 (toList!11418 lm!251) a!525 b!98)) (bvslt (_1!12740 (h!38357 (insertStrictlySorted!604 (toList!11418 lm!251) a!525 b!98))) a0!51)))))

(declare-fun b!1581574 () Bool)

(assert (=> b!1581574 (= e!882380 (containsKey!879 (t!51706 (insertStrictlySorted!604 (toList!11418 lm!251) a!525 b!98)) a0!51))))

(assert (= (and d!166911 (not res!1079836)) b!1581573))

(assert (= (and b!1581573 res!1079837) b!1581574))

(declare-fun m!1453319 () Bool)

(assert (=> b!1581574 m!1453319))

(assert (=> b!1581491 d!166911))

(declare-fun d!166913 () Bool)

(declare-fun e!882402 () Bool)

(assert (=> d!166913 e!882402))

(declare-fun res!1079852 () Bool)

(assert (=> d!166913 (=> (not res!1079852) (not e!882402))))

(declare-fun lt!677300 () ListLongMap!22805)

(assert (=> d!166913 (= res!1079852 (contains!10485 lt!677300 (_1!12740 (tuple2!25459 a!525 b!98))))))

(declare-fun lt!677302 () List!36800)

(assert (=> d!166913 (= lt!677300 (ListLongMap!22806 lt!677302))))

(declare-fun lt!677303 () Unit!52118)

(declare-fun lt!677301 () Unit!52118)

(assert (=> d!166913 (= lt!677303 lt!677301)))

(declare-datatypes ((Option!873 0))(
  ( (Some!872 (v!22358 B!2572)) (None!871) )
))
(declare-fun getValueByKey!798 (List!36800 (_ BitVec 64)) Option!873)

(assert (=> d!166913 (= (getValueByKey!798 lt!677302 (_1!12740 (tuple2!25459 a!525 b!98))) (Some!872 (_2!12740 (tuple2!25459 a!525 b!98))))))

(declare-fun lemmaContainsTupThenGetReturnValue!387 (List!36800 (_ BitVec 64) B!2572) Unit!52118)

(assert (=> d!166913 (= lt!677301 (lemmaContainsTupThenGetReturnValue!387 lt!677302 (_1!12740 (tuple2!25459 a!525 b!98)) (_2!12740 (tuple2!25459 a!525 b!98))))))

(assert (=> d!166913 (= lt!677302 (insertStrictlySorted!604 (toList!11418 lm!251) (_1!12740 (tuple2!25459 a!525 b!98)) (_2!12740 (tuple2!25459 a!525 b!98))))))

(assert (=> d!166913 (= (+!5128 lm!251 (tuple2!25459 a!525 b!98)) lt!677300)))

(declare-fun b!1581613 () Bool)

(declare-fun res!1079853 () Bool)

(assert (=> b!1581613 (=> (not res!1079853) (not e!882402))))

(assert (=> b!1581613 (= res!1079853 (= (getValueByKey!798 (toList!11418 lt!677300) (_1!12740 (tuple2!25459 a!525 b!98))) (Some!872 (_2!12740 (tuple2!25459 a!525 b!98)))))))

(declare-fun b!1581614 () Bool)

(assert (=> b!1581614 (= e!882402 (contains!10487 (toList!11418 lt!677300) (tuple2!25459 a!525 b!98)))))

(assert (= (and d!166913 res!1079852) b!1581613))

(assert (= (and b!1581613 res!1079853) b!1581614))

(declare-fun m!1453331 () Bool)

(assert (=> d!166913 m!1453331))

(declare-fun m!1453333 () Bool)

(assert (=> d!166913 m!1453333))

(declare-fun m!1453335 () Bool)

(assert (=> d!166913 m!1453335))

(declare-fun m!1453337 () Bool)

(assert (=> d!166913 m!1453337))

(declare-fun m!1453339 () Bool)

(assert (=> b!1581613 m!1453339))

(declare-fun m!1453341 () Bool)

(assert (=> b!1581614 m!1453341))

(assert (=> b!1581491 d!166913))

(declare-fun d!166917 () Bool)

(declare-fun e!882416 () Bool)

(assert (=> d!166917 e!882416))

(declare-fun res!1079862 () Bool)

(assert (=> d!166917 (=> res!1079862 e!882416)))

(declare-fun lt!677313 () Bool)

(assert (=> d!166917 (= res!1079862 (not lt!677313))))

(declare-fun lt!677315 () Bool)

(assert (=> d!166917 (= lt!677313 lt!677315)))

(declare-fun lt!677314 () Unit!52118)

(declare-fun e!882417 () Unit!52118)

(assert (=> d!166917 (= lt!677314 e!882417)))

(declare-fun c!147161 () Bool)

(assert (=> d!166917 (= c!147161 lt!677315)))

(assert (=> d!166917 (= lt!677315 (containsKey!879 (toList!11418 (+!5128 lm!251 (tuple2!25459 a!525 b!98))) a0!51))))

(assert (=> d!166917 (= (contains!10485 (+!5128 lm!251 (tuple2!25459 a!525 b!98)) a0!51) lt!677313)))

(declare-fun b!1581635 () Bool)

(declare-fun lt!677316 () Unit!52118)

(assert (=> b!1581635 (= e!882417 lt!677316)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!543 (List!36800 (_ BitVec 64)) Unit!52118)

(assert (=> b!1581635 (= lt!677316 (lemmaContainsKeyImpliesGetValueByKeyDefined!543 (toList!11418 (+!5128 lm!251 (tuple2!25459 a!525 b!98))) a0!51))))

(declare-fun isDefined!589 (Option!873) Bool)

(assert (=> b!1581635 (isDefined!589 (getValueByKey!798 (toList!11418 (+!5128 lm!251 (tuple2!25459 a!525 b!98))) a0!51))))

(declare-fun b!1581636 () Bool)

(declare-fun Unit!52122 () Unit!52118)

(assert (=> b!1581636 (= e!882417 Unit!52122)))

(declare-fun b!1581637 () Bool)

(assert (=> b!1581637 (= e!882416 (isDefined!589 (getValueByKey!798 (toList!11418 (+!5128 lm!251 (tuple2!25459 a!525 b!98))) a0!51)))))

(assert (= (and d!166917 c!147161) b!1581635))

(assert (= (and d!166917 (not c!147161)) b!1581636))

(assert (= (and d!166917 (not res!1079862)) b!1581637))

(declare-fun m!1453357 () Bool)

(assert (=> d!166917 m!1453357))

(declare-fun m!1453359 () Bool)

(assert (=> b!1581635 m!1453359))

(declare-fun m!1453361 () Bool)

(assert (=> b!1581635 m!1453361))

(assert (=> b!1581635 m!1453361))

(declare-fun m!1453363 () Bool)

(assert (=> b!1581635 m!1453363))

(assert (=> b!1581637 m!1453361))

(assert (=> b!1581637 m!1453361))

(assert (=> b!1581637 m!1453363))

(assert (=> b!1581491 d!166917))

(declare-fun d!166925 () Bool)

(assert (=> d!166925 (not (containsKey!879 (insertStrictlySorted!604 (toList!11418 lm!251) a!525 b!98) a0!51))))

(declare-fun lt!677319 () Unit!52118)

(declare-fun choose!2080 (List!36800 (_ BitVec 64) B!2572 (_ BitVec 64)) Unit!52118)

(assert (=> d!166925 (= lt!677319 (choose!2080 (toList!11418 lm!251) a!525 b!98 a0!51))))

(declare-fun e!882420 () Bool)

(assert (=> d!166925 e!882420))

(declare-fun res!1079867 () Bool)

(assert (=> d!166925 (=> (not res!1079867) (not e!882420))))

(assert (=> d!166925 (= res!1079867 (isStrictlySorted!1017 (toList!11418 lm!251)))))

(assert (=> d!166925 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!2 (toList!11418 lm!251) a!525 b!98 a0!51) lt!677319)))

(declare-fun b!1581642 () Bool)

(declare-fun res!1079868 () Bool)

(assert (=> b!1581642 (=> (not res!1079868) (not e!882420))))

(assert (=> b!1581642 (= res!1079868 (not (containsKey!879 (toList!11418 lm!251) a0!51)))))

(declare-fun b!1581643 () Bool)

(assert (=> b!1581643 (= e!882420 (not (= a0!51 a!525)))))

(assert (= (and d!166925 res!1079867) b!1581642))

(assert (= (and b!1581642 res!1079868) b!1581643))

(assert (=> d!166925 m!1453273))

(assert (=> d!166925 m!1453273))

(assert (=> d!166925 m!1453275))

(declare-fun m!1453365 () Bool)

(assert (=> d!166925 m!1453365))

(assert (=> d!166925 m!1453269))

(assert (=> b!1581642 m!1453285))

(assert (=> b!1581491 d!166925))

(declare-fun d!166927 () Bool)

(declare-fun res!1079877 () Bool)

(declare-fun e!882427 () Bool)

(assert (=> d!166927 (=> res!1079877 e!882427)))

(assert (=> d!166927 (= res!1079877 (or (is-Nil!36797 (toList!11418 lm!251)) (is-Nil!36797 (t!51706 (toList!11418 lm!251)))))))

(assert (=> d!166927 (= (isStrictlySorted!1017 (toList!11418 lm!251)) e!882427)))

(declare-fun b!1581652 () Bool)

(declare-fun e!882428 () Bool)

(assert (=> b!1581652 (= e!882427 e!882428)))

(declare-fun res!1079878 () Bool)

(assert (=> b!1581652 (=> (not res!1079878) (not e!882428))))

(assert (=> b!1581652 (= res!1079878 (bvslt (_1!12740 (h!38357 (toList!11418 lm!251))) (_1!12740 (h!38357 (t!51706 (toList!11418 lm!251))))))))

(declare-fun b!1581653 () Bool)

(assert (=> b!1581653 (= e!882428 (isStrictlySorted!1017 (t!51706 (toList!11418 lm!251))))))

(assert (= (and d!166927 (not res!1079877)) b!1581652))

(assert (= (and b!1581652 res!1079878) b!1581653))

(declare-fun m!1453367 () Bool)

(assert (=> b!1581653 m!1453367))

(assert (=> b!1581488 d!166927))

(declare-fun d!166929 () Bool)

(declare-fun e!882431 () Bool)

(assert (=> d!166929 e!882431))

(declare-fun res!1079883 () Bool)

(assert (=> d!166929 (=> res!1079883 e!882431)))

(declare-fun lt!677336 () Bool)

(assert (=> d!166929 (= res!1079883 (not lt!677336))))

(declare-fun lt!677338 () Bool)

(assert (=> d!166929 (= lt!677336 lt!677338)))

(declare-fun lt!677337 () Unit!52118)

(declare-fun e!882432 () Unit!52118)

(assert (=> d!166929 (= lt!677337 e!882432)))

(declare-fun c!147162 () Bool)

(assert (=> d!166929 (= c!147162 lt!677338)))

(assert (=> d!166929 (= lt!677338 (containsKey!879 (toList!11418 lm!251) a0!51))))

(assert (=> d!166929 (= (contains!10485 lm!251 a0!51) lt!677336)))

(declare-fun b!1581658 () Bool)

(declare-fun lt!677339 () Unit!52118)

(assert (=> b!1581658 (= e!882432 lt!677339)))

(assert (=> b!1581658 (= lt!677339 (lemmaContainsKeyImpliesGetValueByKeyDefined!543 (toList!11418 lm!251) a0!51))))

(assert (=> b!1581658 (isDefined!589 (getValueByKey!798 (toList!11418 lm!251) a0!51))))

(declare-fun b!1581659 () Bool)

(declare-fun Unit!52123 () Unit!52118)

(assert (=> b!1581659 (= e!882432 Unit!52123)))

(declare-fun b!1581660 () Bool)

(assert (=> b!1581660 (= e!882431 (isDefined!589 (getValueByKey!798 (toList!11418 lm!251) a0!51)))))

(assert (= (and d!166929 c!147162) b!1581658))

(assert (= (and d!166929 (not c!147162)) b!1581659))

(assert (= (and d!166929 (not res!1079883)) b!1581660))

(assert (=> d!166929 m!1453285))

(declare-fun m!1453369 () Bool)

(assert (=> b!1581658 m!1453369))

(declare-fun m!1453371 () Bool)

(assert (=> b!1581658 m!1453371))

(assert (=> b!1581658 m!1453371))

(declare-fun m!1453373 () Bool)

(assert (=> b!1581658 m!1453373))

(assert (=> b!1581660 m!1453371))

(assert (=> b!1581660 m!1453371))

(assert (=> b!1581660 m!1453373))

(assert (=> start!137314 d!166929))

(declare-fun d!166931 () Bool)

(assert (=> d!166931 (= (inv!58939 lm!251) (isStrictlySorted!1017 (toList!11418 lm!251)))))

(declare-fun bs!45750 () Bool)

(assert (= bs!45750 d!166931))

(assert (=> bs!45750 m!1453269))

(assert (=> start!137314 d!166931))

(declare-fun b!1581667 () Bool)

(declare-fun e!882436 () Bool)

(declare-fun tp!114288 () Bool)

(assert (=> b!1581667 (= e!882436 (and tp_is_empty!39117 tp!114288))))

(assert (=> b!1581489 (= tp!114282 e!882436)))

(assert (= (and b!1581489 (is-Cons!36796 (toList!11418 lm!251))) b!1581667))

(push 1)

(assert (not b!1581667))

(assert (not d!166907))

(assert tp_is_empty!39117)

(assert (not b!1581660))

(assert (not b!1581658))

(assert (not d!166913))

(assert (not b!1581566))

(assert (not b!1581642))

(assert (not b!1581614))

(assert (not d!166917))

(assert (not d!166931))

(assert (not b!1581516))

(assert (not b!1581653))

(assert (not d!166925))

(assert (not b!1581635))

(assert (not b!1581574))

(assert (not bm!72531))

(assert (not b!1581572))

(assert (not b!1581613))

(assert (not b!1581568))

(assert (not d!166929))

(assert (not b!1581637))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

