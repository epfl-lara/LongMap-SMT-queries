; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132510 () Bool)

(assert start!132510)

(declare-fun b!1553871 () Bool)

(declare-fun res!1063550 () Bool)

(declare-fun e!865200 () Bool)

(assert (=> b!1553871 (=> (not res!1063550) (not e!865200))))

(declare-datatypes ((B!2240 0))(
  ( (B!2241 (val!19206 Int)) )
))
(declare-datatypes ((tuple2!24860 0))(
  ( (tuple2!24861 (_1!12441 (_ BitVec 64)) (_2!12441 B!2240)) )
))
(declare-datatypes ((List!36285 0))(
  ( (Nil!36282) (Cons!36281 (h!37728 tuple2!24860) (t!50998 List!36285)) )
))
(declare-datatypes ((ListLongMap!22469 0))(
  ( (ListLongMap!22470 (toList!11250 List!36285)) )
))
(declare-fun lm!249 () ListLongMap!22469)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun containsKey!771 (List!36285 (_ BitVec 64)) Bool)

(assert (=> b!1553871 (= res!1063550 (containsKey!771 (toList!11250 lm!249) a0!49))))

(declare-fun b!1553872 () Bool)

(declare-fun res!1063549 () Bool)

(assert (=> b!1553872 (=> (not res!1063549) (not e!865200))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553872 (= res!1063549 (not (= a0!49 a!523)))))

(declare-fun res!1063552 () Bool)

(assert (=> start!132510 (=> (not res!1063552) (not e!865200))))

(declare-fun contains!10116 (ListLongMap!22469 (_ BitVec 64)) Bool)

(assert (=> start!132510 (= res!1063552 (contains!10116 lm!249 a0!49))))

(assert (=> start!132510 e!865200))

(declare-fun e!865201 () Bool)

(declare-fun inv!57343 (ListLongMap!22469) Bool)

(assert (=> start!132510 (and (inv!57343 lm!249) e!865201)))

(assert (=> start!132510 true))

(declare-fun tp_is_empty!38251 () Bool)

(assert (=> start!132510 tp_is_empty!38251))

(declare-fun b!1553873 () Bool)

(declare-fun isStrictlySorted!900 (List!36285) Bool)

(assert (=> b!1553873 (= e!865200 (not (isStrictlySorted!900 (toList!11250 lm!249))))))

(declare-fun e!865202 () Bool)

(assert (=> b!1553873 e!865202))

(declare-fun res!1063551 () Bool)

(assert (=> b!1553873 (=> (not res!1063551) (not e!865202))))

(declare-fun lt!669670 () List!36285)

(assert (=> b!1553873 (= res!1063551 (containsKey!771 lt!669670 a0!49))))

(declare-fun b!96 () B!2240)

(declare-fun insertStrictlySorted!514 (List!36285 (_ BitVec 64) B!2240) List!36285)

(assert (=> b!1553873 (= lt!669670 (insertStrictlySorted!514 (toList!11250 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51602 0))(
  ( (Unit!51603) )
))
(declare-fun lt!669669 () Unit!51602)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!10 (List!36285 (_ BitVec 64) B!2240 (_ BitVec 64)) Unit!51602)

(assert (=> b!1553873 (= lt!669669 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!10 (toList!11250 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1553874 () Bool)

(declare-fun tp!112183 () Bool)

(assert (=> b!1553874 (= e!865201 tp!112183)))

(declare-fun b!1553875 () Bool)

(declare-datatypes ((Option!829 0))(
  ( (Some!828 (v!22007 B!2240)) (None!827) )
))
(declare-fun getValueByKey!754 (List!36285 (_ BitVec 64)) Option!829)

(assert (=> b!1553875 (= e!865202 (= (getValueByKey!754 lt!669670 a0!49) (getValueByKey!754 (toList!11250 lm!249) a0!49)))))

(assert (= (and start!132510 res!1063552) b!1553872))

(assert (= (and b!1553872 res!1063549) b!1553871))

(assert (= (and b!1553871 res!1063550) b!1553873))

(assert (= (and b!1553873 res!1063551) b!1553875))

(assert (= start!132510 b!1553874))

(declare-fun m!1431737 () Bool)

(assert (=> b!1553871 m!1431737))

(declare-fun m!1431739 () Bool)

(assert (=> start!132510 m!1431739))

(declare-fun m!1431741 () Bool)

(assert (=> start!132510 m!1431741))

(declare-fun m!1431743 () Bool)

(assert (=> b!1553873 m!1431743))

(declare-fun m!1431745 () Bool)

(assert (=> b!1553873 m!1431745))

(declare-fun m!1431747 () Bool)

(assert (=> b!1553873 m!1431747))

(declare-fun m!1431749 () Bool)

(assert (=> b!1553873 m!1431749))

(declare-fun m!1431751 () Bool)

(assert (=> b!1553875 m!1431751))

(declare-fun m!1431753 () Bool)

(assert (=> b!1553875 m!1431753))

(check-sat (not b!1553875) (not b!1553871) tp_is_empty!38251 (not b!1553874) (not start!132510) (not b!1553873))
(check-sat)
(get-model)

(declare-fun d!161447 () Bool)

(declare-fun res!1063581 () Bool)

(declare-fun e!865225 () Bool)

(assert (=> d!161447 (=> res!1063581 e!865225)))

(get-info :version)

(assert (=> d!161447 (= res!1063581 (or ((_ is Nil!36282) (toList!11250 lm!249)) ((_ is Nil!36282) (t!50998 (toList!11250 lm!249)))))))

(assert (=> d!161447 (= (isStrictlySorted!900 (toList!11250 lm!249)) e!865225)))

(declare-fun b!1553910 () Bool)

(declare-fun e!865226 () Bool)

(assert (=> b!1553910 (= e!865225 e!865226)))

(declare-fun res!1063582 () Bool)

(assert (=> b!1553910 (=> (not res!1063582) (not e!865226))))

(assert (=> b!1553910 (= res!1063582 (bvslt (_1!12441 (h!37728 (toList!11250 lm!249))) (_1!12441 (h!37728 (t!50998 (toList!11250 lm!249))))))))

(declare-fun b!1553911 () Bool)

(assert (=> b!1553911 (= e!865226 (isStrictlySorted!900 (t!50998 (toList!11250 lm!249))))))

(assert (= (and d!161447 (not res!1063581)) b!1553910))

(assert (= (and b!1553910 res!1063582) b!1553911))

(declare-fun m!1431791 () Bool)

(assert (=> b!1553911 m!1431791))

(assert (=> b!1553873 d!161447))

(declare-fun d!161451 () Bool)

(declare-fun res!1063587 () Bool)

(declare-fun e!865239 () Bool)

(assert (=> d!161451 (=> res!1063587 e!865239)))

(assert (=> d!161451 (= res!1063587 (and ((_ is Cons!36281) lt!669670) (= (_1!12441 (h!37728 lt!669670)) a0!49)))))

(assert (=> d!161451 (= (containsKey!771 lt!669670 a0!49) e!865239)))

(declare-fun b!1553932 () Bool)

(declare-fun e!865240 () Bool)

(assert (=> b!1553932 (= e!865239 e!865240)))

(declare-fun res!1063588 () Bool)

(assert (=> b!1553932 (=> (not res!1063588) (not e!865240))))

(assert (=> b!1553932 (= res!1063588 (and (or (not ((_ is Cons!36281) lt!669670)) (bvsle (_1!12441 (h!37728 lt!669670)) a0!49)) ((_ is Cons!36281) lt!669670) (bvslt (_1!12441 (h!37728 lt!669670)) a0!49)))))

(declare-fun b!1553933 () Bool)

(assert (=> b!1553933 (= e!865240 (containsKey!771 (t!50998 lt!669670) a0!49))))

(assert (= (and d!161451 (not res!1063587)) b!1553932))

(assert (= (and b!1553932 res!1063588) b!1553933))

(declare-fun m!1431797 () Bool)

(assert (=> b!1553933 m!1431797))

(assert (=> b!1553873 d!161451))

(declare-fun call!71373 () List!36285)

(declare-fun c!143292 () Bool)

(declare-fun bm!71369 () Bool)

(declare-fun e!865289 () List!36285)

(declare-fun $colon$colon!950 (List!36285 tuple2!24860) List!36285)

(assert (=> bm!71369 (= call!71373 ($colon$colon!950 e!865289 (ite c!143292 (h!37728 (toList!11250 lm!249)) (tuple2!24861 a!523 b!96))))))

(declare-fun c!143290 () Bool)

(assert (=> bm!71369 (= c!143290 c!143292)))

(declare-fun b!1554005 () Bool)

(declare-fun c!143293 () Bool)

(assert (=> b!1554005 (= c!143293 (and ((_ is Cons!36281) (toList!11250 lm!249)) (bvsgt (_1!12441 (h!37728 (toList!11250 lm!249))) a!523)))))

(declare-fun e!865290 () List!36285)

(declare-fun e!865291 () List!36285)

(assert (=> b!1554005 (= e!865290 e!865291)))

(declare-fun b!1554006 () Bool)

(declare-fun call!71374 () List!36285)

(assert (=> b!1554006 (= e!865290 call!71374)))

(declare-fun b!1554007 () Bool)

(declare-fun call!71372 () List!36285)

(assert (=> b!1554007 (= e!865291 call!71372)))

(declare-fun d!161459 () Bool)

(declare-fun e!865292 () Bool)

(assert (=> d!161459 e!865292))

(declare-fun res!1063621 () Bool)

(assert (=> d!161459 (=> (not res!1063621) (not e!865292))))

(declare-fun lt!669699 () List!36285)

(assert (=> d!161459 (= res!1063621 (isStrictlySorted!900 lt!669699))))

(declare-fun e!865293 () List!36285)

(assert (=> d!161459 (= lt!669699 e!865293)))

(assert (=> d!161459 (= c!143292 (and ((_ is Cons!36281) (toList!11250 lm!249)) (bvslt (_1!12441 (h!37728 (toList!11250 lm!249))) a!523)))))

(assert (=> d!161459 (isStrictlySorted!900 (toList!11250 lm!249))))

(assert (=> d!161459 (= (insertStrictlySorted!514 (toList!11250 lm!249) a!523 b!96) lt!669699)))

(declare-fun bm!71370 () Bool)

(assert (=> bm!71370 (= call!71374 call!71373)))

(declare-fun b!1554008 () Bool)

(assert (=> b!1554008 (= e!865291 call!71372)))

(declare-fun b!1554009 () Bool)

(assert (=> b!1554009 (= e!865289 (insertStrictlySorted!514 (t!50998 (toList!11250 lm!249)) a!523 b!96))))

(declare-fun b!1554010 () Bool)

(declare-fun c!143291 () Bool)

(assert (=> b!1554010 (= e!865289 (ite c!143291 (t!50998 (toList!11250 lm!249)) (ite c!143293 (Cons!36281 (h!37728 (toList!11250 lm!249)) (t!50998 (toList!11250 lm!249))) Nil!36282)))))

(declare-fun bm!71371 () Bool)

(assert (=> bm!71371 (= call!71372 call!71374)))

(declare-fun b!1554011 () Bool)

(declare-fun contains!10119 (List!36285 tuple2!24860) Bool)

(assert (=> b!1554011 (= e!865292 (contains!10119 lt!669699 (tuple2!24861 a!523 b!96)))))

(declare-fun b!1554012 () Bool)

(assert (=> b!1554012 (= e!865293 call!71373)))

(declare-fun b!1554013 () Bool)

(assert (=> b!1554013 (= e!865293 e!865290)))

(assert (=> b!1554013 (= c!143291 (and ((_ is Cons!36281) (toList!11250 lm!249)) (= (_1!12441 (h!37728 (toList!11250 lm!249))) a!523)))))

(declare-fun b!1554014 () Bool)

(declare-fun res!1063620 () Bool)

(assert (=> b!1554014 (=> (not res!1063620) (not e!865292))))

(assert (=> b!1554014 (= res!1063620 (containsKey!771 lt!669699 a!523))))

(assert (= (and d!161459 c!143292) b!1554012))

(assert (= (and d!161459 (not c!143292)) b!1554013))

(assert (= (and b!1554013 c!143291) b!1554006))

(assert (= (and b!1554013 (not c!143291)) b!1554005))

(assert (= (and b!1554005 c!143293) b!1554008))

(assert (= (and b!1554005 (not c!143293)) b!1554007))

(assert (= (or b!1554008 b!1554007) bm!71371))

(assert (= (or b!1554006 bm!71371) bm!71370))

(assert (= (or b!1554012 bm!71370) bm!71369))

(assert (= (and bm!71369 c!143290) b!1554009))

(assert (= (and bm!71369 (not c!143290)) b!1554010))

(assert (= (and d!161459 res!1063621) b!1554014))

(assert (= (and b!1554014 res!1063620) b!1554011))

(declare-fun m!1431815 () Bool)

(assert (=> bm!71369 m!1431815))

(declare-fun m!1431817 () Bool)

(assert (=> b!1554011 m!1431817))

(declare-fun m!1431819 () Bool)

(assert (=> b!1554009 m!1431819))

(declare-fun m!1431821 () Bool)

(assert (=> b!1554014 m!1431821))

(declare-fun m!1431823 () Bool)

(assert (=> d!161459 m!1431823))

(assert (=> d!161459 m!1431743))

(assert (=> b!1553873 d!161459))

(declare-fun d!161477 () Bool)

(declare-fun e!865317 () Bool)

(assert (=> d!161477 e!865317))

(declare-fun res!1063636 () Bool)

(assert (=> d!161477 (=> (not res!1063636) (not e!865317))))

(assert (=> d!161477 (= res!1063636 (= (containsKey!771 (insertStrictlySorted!514 (toList!11250 lm!249) a!523 b!96) a0!49) (containsKey!771 (toList!11250 lm!249) a0!49)))))

(declare-fun lt!669703 () Unit!51602)

(declare-fun choose!2055 (List!36285 (_ BitVec 64) B!2240 (_ BitVec 64)) Unit!51602)

(assert (=> d!161477 (= lt!669703 (choose!2055 (toList!11250 lm!249) a!523 b!96 a0!49))))

(declare-fun e!865318 () Bool)

(assert (=> d!161477 e!865318))

(declare-fun res!1063637 () Bool)

(assert (=> d!161477 (=> (not res!1063637) (not e!865318))))

(assert (=> d!161477 (= res!1063637 (isStrictlySorted!900 (toList!11250 lm!249)))))

(assert (=> d!161477 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!10 (toList!11250 lm!249) a!523 b!96 a0!49) lt!669703)))

(declare-fun b!1554051 () Bool)

(assert (=> b!1554051 (= e!865318 (not (= a!523 a0!49)))))

(declare-fun b!1554052 () Bool)

(assert (=> b!1554052 (= e!865317 (= (getValueByKey!754 (insertStrictlySorted!514 (toList!11250 lm!249) a!523 b!96) a0!49) (getValueByKey!754 (toList!11250 lm!249) a0!49)))))

(assert (= (and d!161477 res!1063637) b!1554051))

(assert (= (and d!161477 res!1063636) b!1554052))

(assert (=> d!161477 m!1431747))

(declare-fun m!1431831 () Bool)

(assert (=> d!161477 m!1431831))

(assert (=> d!161477 m!1431737))

(assert (=> d!161477 m!1431747))

(assert (=> d!161477 m!1431743))

(declare-fun m!1431837 () Bool)

(assert (=> d!161477 m!1431837))

(assert (=> b!1554052 m!1431747))

(assert (=> b!1554052 m!1431747))

(declare-fun m!1431843 () Bool)

(assert (=> b!1554052 m!1431843))

(assert (=> b!1554052 m!1431753))

(assert (=> b!1553873 d!161477))

(declare-fun d!161485 () Bool)

(declare-fun res!1063638 () Bool)

(declare-fun e!865319 () Bool)

(assert (=> d!161485 (=> res!1063638 e!865319)))

(assert (=> d!161485 (= res!1063638 (and ((_ is Cons!36281) (toList!11250 lm!249)) (= (_1!12441 (h!37728 (toList!11250 lm!249))) a0!49)))))

(assert (=> d!161485 (= (containsKey!771 (toList!11250 lm!249) a0!49) e!865319)))

(declare-fun b!1554053 () Bool)

(declare-fun e!865320 () Bool)

(assert (=> b!1554053 (= e!865319 e!865320)))

(declare-fun res!1063639 () Bool)

(assert (=> b!1554053 (=> (not res!1063639) (not e!865320))))

(assert (=> b!1554053 (= res!1063639 (and (or (not ((_ is Cons!36281) (toList!11250 lm!249))) (bvsle (_1!12441 (h!37728 (toList!11250 lm!249))) a0!49)) ((_ is Cons!36281) (toList!11250 lm!249)) (bvslt (_1!12441 (h!37728 (toList!11250 lm!249))) a0!49)))))

(declare-fun b!1554054 () Bool)

(assert (=> b!1554054 (= e!865320 (containsKey!771 (t!50998 (toList!11250 lm!249)) a0!49))))

(assert (= (and d!161485 (not res!1063638)) b!1554053))

(assert (= (and b!1554053 res!1063639) b!1554054))

(declare-fun m!1431845 () Bool)

(assert (=> b!1554054 m!1431845))

(assert (=> b!1553871 d!161485))

(declare-fun d!161487 () Bool)

(declare-fun e!865341 () Bool)

(assert (=> d!161487 e!865341))

(declare-fun res!1063652 () Bool)

(assert (=> d!161487 (=> res!1063652 e!865341)))

(declare-fun lt!669719 () Bool)

(assert (=> d!161487 (= res!1063652 (not lt!669719))))

(declare-fun lt!669717 () Bool)

(assert (=> d!161487 (= lt!669719 lt!669717)))

(declare-fun lt!669720 () Unit!51602)

(declare-fun e!865342 () Unit!51602)

(assert (=> d!161487 (= lt!669720 e!865342)))

(declare-fun c!143316 () Bool)

(assert (=> d!161487 (= c!143316 lt!669717)))

(assert (=> d!161487 (= lt!669717 (containsKey!771 (toList!11250 lm!249) a0!49))))

(assert (=> d!161487 (= (contains!10116 lm!249 a0!49) lt!669719)))

(declare-fun b!1554087 () Bool)

(declare-fun lt!669718 () Unit!51602)

(assert (=> b!1554087 (= e!865342 lt!669718)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!516 (List!36285 (_ BitVec 64)) Unit!51602)

(assert (=> b!1554087 (= lt!669718 (lemmaContainsKeyImpliesGetValueByKeyDefined!516 (toList!11250 lm!249) a0!49))))

(declare-fun isDefined!568 (Option!829) Bool)

(assert (=> b!1554087 (isDefined!568 (getValueByKey!754 (toList!11250 lm!249) a0!49))))

(declare-fun b!1554088 () Bool)

(declare-fun Unit!51609 () Unit!51602)

(assert (=> b!1554088 (= e!865342 Unit!51609)))

(declare-fun b!1554089 () Bool)

(assert (=> b!1554089 (= e!865341 (isDefined!568 (getValueByKey!754 (toList!11250 lm!249) a0!49)))))

(assert (= (and d!161487 c!143316) b!1554087))

(assert (= (and d!161487 (not c!143316)) b!1554088))

(assert (= (and d!161487 (not res!1063652)) b!1554089))

(assert (=> d!161487 m!1431737))

(declare-fun m!1431853 () Bool)

(assert (=> b!1554087 m!1431853))

(assert (=> b!1554087 m!1431753))

(assert (=> b!1554087 m!1431753))

(declare-fun m!1431855 () Bool)

(assert (=> b!1554087 m!1431855))

(assert (=> b!1554089 m!1431753))

(assert (=> b!1554089 m!1431753))

(assert (=> b!1554089 m!1431855))

(assert (=> start!132510 d!161487))

(declare-fun d!161491 () Bool)

(assert (=> d!161491 (= (inv!57343 lm!249) (isStrictlySorted!900 (toList!11250 lm!249)))))

(declare-fun bs!44636 () Bool)

(assert (= bs!44636 d!161491))

(assert (=> bs!44636 m!1431743))

(assert (=> start!132510 d!161491))

(declare-fun d!161493 () Bool)

(declare-fun c!143327 () Bool)

(assert (=> d!161493 (= c!143327 (and ((_ is Cons!36281) lt!669670) (= (_1!12441 (h!37728 lt!669670)) a0!49)))))

(declare-fun e!865356 () Option!829)

(assert (=> d!161493 (= (getValueByKey!754 lt!669670 a0!49) e!865356)))

(declare-fun b!1554116 () Bool)

(declare-fun e!865357 () Option!829)

(assert (=> b!1554116 (= e!865357 (getValueByKey!754 (t!50998 lt!669670) a0!49))))

(declare-fun b!1554115 () Bool)

(assert (=> b!1554115 (= e!865356 e!865357)))

(declare-fun c!143328 () Bool)

(assert (=> b!1554115 (= c!143328 (and ((_ is Cons!36281) lt!669670) (not (= (_1!12441 (h!37728 lt!669670)) a0!49))))))

(declare-fun b!1554117 () Bool)

(assert (=> b!1554117 (= e!865357 None!827)))

(declare-fun b!1554114 () Bool)

(assert (=> b!1554114 (= e!865356 (Some!828 (_2!12441 (h!37728 lt!669670))))))

(assert (= (and d!161493 c!143327) b!1554114))

(assert (= (and d!161493 (not c!143327)) b!1554115))

(assert (= (and b!1554115 c!143328) b!1554116))

(assert (= (and b!1554115 (not c!143328)) b!1554117))

(declare-fun m!1431867 () Bool)

(assert (=> b!1554116 m!1431867))

(assert (=> b!1553875 d!161493))

(declare-fun d!161497 () Bool)

(declare-fun c!143329 () Bool)

(assert (=> d!161497 (= c!143329 (and ((_ is Cons!36281) (toList!11250 lm!249)) (= (_1!12441 (h!37728 (toList!11250 lm!249))) a0!49)))))

(declare-fun e!865358 () Option!829)

(assert (=> d!161497 (= (getValueByKey!754 (toList!11250 lm!249) a0!49) e!865358)))

(declare-fun b!1554120 () Bool)

(declare-fun e!865359 () Option!829)

(assert (=> b!1554120 (= e!865359 (getValueByKey!754 (t!50998 (toList!11250 lm!249)) a0!49))))

(declare-fun b!1554119 () Bool)

(assert (=> b!1554119 (= e!865358 e!865359)))

(declare-fun c!143330 () Bool)

(assert (=> b!1554119 (= c!143330 (and ((_ is Cons!36281) (toList!11250 lm!249)) (not (= (_1!12441 (h!37728 (toList!11250 lm!249))) a0!49))))))

(declare-fun b!1554121 () Bool)

(assert (=> b!1554121 (= e!865359 None!827)))

(declare-fun b!1554118 () Bool)

(assert (=> b!1554118 (= e!865358 (Some!828 (_2!12441 (h!37728 (toList!11250 lm!249)))))))

(assert (= (and d!161497 c!143329) b!1554118))

(assert (= (and d!161497 (not c!143329)) b!1554119))

(assert (= (and b!1554119 c!143330) b!1554120))

(assert (= (and b!1554119 (not c!143330)) b!1554121))

(declare-fun m!1431869 () Bool)

(assert (=> b!1554120 m!1431869))

(assert (=> b!1553875 d!161497))

(declare-fun b!1554129 () Bool)

(declare-fun e!865364 () Bool)

(declare-fun tp!112192 () Bool)

(assert (=> b!1554129 (= e!865364 (and tp_is_empty!38251 tp!112192))))

(assert (=> b!1553874 (= tp!112183 e!865364)))

(assert (= (and b!1553874 ((_ is Cons!36281) (toList!11250 lm!249))) b!1554129))

(check-sat (not b!1554052) (not b!1554009) (not d!161477) (not b!1553933) (not b!1554116) (not b!1554054) (not bm!71369) (not d!161459) (not b!1554129) (not b!1554087) (not b!1554014) (not b!1554120) (not b!1554011) (not b!1553911) (not b!1554089) tp_is_empty!38251 (not d!161491) (not d!161487))
(check-sat)
