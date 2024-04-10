; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132434 () Bool)

(assert start!132434)

(declare-fun b!1553592 () Bool)

(declare-fun res!1063349 () Bool)

(declare-fun e!864996 () Bool)

(assert (=> b!1553592 (=> (not res!1063349) (not e!864996))))

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553592 (= res!1063349 (not (= a0!49 a!523)))))

(declare-fun b!1553593 () Bool)

(declare-fun e!864995 () Bool)

(assert (=> b!1553593 (= e!864996 (not e!864995))))

(declare-fun res!1063351 () Bool)

(assert (=> b!1553593 (=> res!1063351 e!864995)))

(declare-datatypes ((B!2216 0))(
  ( (B!2217 (val!19194 Int)) )
))
(declare-datatypes ((tuple2!24764 0))(
  ( (tuple2!24765 (_1!12393 (_ BitVec 64)) (_2!12393 B!2216)) )
))
(declare-datatypes ((List!36228 0))(
  ( (Nil!36225) (Cons!36224 (h!37670 tuple2!24764) (t!50949 List!36228)) )
))
(declare-datatypes ((ListLongMap!22373 0))(
  ( (ListLongMap!22374 (toList!11202 List!36228)) )
))
(declare-fun lm!249 () ListLongMap!22373)

(declare-fun isStrictlySorted!891 (List!36228) Bool)

(assert (=> b!1553593 (= res!1063351 (not (isStrictlySorted!891 (toList!11202 lm!249))))))

(declare-fun e!864997 () Bool)

(assert (=> b!1553593 e!864997))

(declare-fun res!1063348 () Bool)

(assert (=> b!1553593 (=> (not res!1063348) (not e!864997))))

(declare-fun lt!669722 () List!36228)

(declare-fun containsKey!761 (List!36228 (_ BitVec 64)) Bool)

(assert (=> b!1553593 (= res!1063348 (containsKey!761 lt!669722 a0!49))))

(declare-fun b!96 () B!2216)

(declare-fun insertStrictlySorted!507 (List!36228 (_ BitVec 64) B!2216) List!36228)

(assert (=> b!1553593 (= lt!669722 (insertStrictlySorted!507 (toList!11202 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51749 0))(
  ( (Unit!51750) )
))
(declare-fun lt!669720 () Unit!51749)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!4 (List!36228 (_ BitVec 64) B!2216 (_ BitVec 64)) Unit!51749)

(assert (=> b!1553593 (= lt!669720 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!4 (toList!11202 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1553594 () Bool)

(declare-datatypes ((Option!815 0))(
  ( (Some!814 (v!21999 B!2216)) (None!813) )
))
(declare-fun getValueByKey!739 (List!36228 (_ BitVec 64)) Option!815)

(assert (=> b!1553594 (= e!864997 (= (getValueByKey!739 lt!669722 a0!49) (getValueByKey!739 (toList!11202 lm!249) a0!49)))))

(declare-fun res!1063347 () Bool)

(assert (=> start!132434 (=> (not res!1063347) (not e!864996))))

(declare-fun contains!10144 (ListLongMap!22373 (_ BitVec 64)) Bool)

(assert (=> start!132434 (= res!1063347 (contains!10144 lm!249 a0!49))))

(assert (=> start!132434 e!864996))

(declare-fun e!864998 () Bool)

(declare-fun inv!57311 (ListLongMap!22373) Bool)

(assert (=> start!132434 (and (inv!57311 lm!249) e!864998)))

(assert (=> start!132434 true))

(declare-fun tp_is_empty!38227 () Bool)

(assert (=> start!132434 tp_is_empty!38227))

(declare-fun b!1553595 () Bool)

(declare-fun tp!112119 () Bool)

(assert (=> b!1553595 (= e!864998 tp!112119)))

(declare-fun b!1553596 () Bool)

(declare-fun res!1063350 () Bool)

(assert (=> b!1553596 (=> (not res!1063350) (not e!864996))))

(assert (=> b!1553596 (= res!1063350 (containsKey!761 (toList!11202 lm!249) a0!49))))

(declare-fun b!1553597 () Bool)

(declare-fun +!5012 (ListLongMap!22373 tuple2!24764) ListLongMap!22373)

(assert (=> b!1553597 (= e!864995 (contains!10144 (+!5012 lm!249 (tuple2!24765 a!523 b!96)) a0!49))))

(declare-fun isDefined!552 (Option!815) Bool)

(assert (=> b!1553597 (isDefined!552 (getValueByKey!739 (toList!11202 lm!249) a0!49))))

(declare-fun lt!669721 () Unit!51749)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!504 (List!36228 (_ BitVec 64)) Unit!51749)

(assert (=> b!1553597 (= lt!669721 (lemmaContainsKeyImpliesGetValueByKeyDefined!504 (toList!11202 lm!249) a0!49))))

(assert (= (and start!132434 res!1063347) b!1553592))

(assert (= (and b!1553592 res!1063349) b!1553596))

(assert (= (and b!1553596 res!1063350) b!1553593))

(assert (= (and b!1553593 res!1063348) b!1553594))

(assert (= (and b!1553593 (not res!1063351)) b!1553597))

(assert (= start!132434 b!1553595))

(declare-fun m!1432233 () Bool)

(assert (=> start!132434 m!1432233))

(declare-fun m!1432235 () Bool)

(assert (=> start!132434 m!1432235))

(declare-fun m!1432237 () Bool)

(assert (=> b!1553593 m!1432237))

(declare-fun m!1432239 () Bool)

(assert (=> b!1553593 m!1432239))

(declare-fun m!1432241 () Bool)

(assert (=> b!1553593 m!1432241))

(declare-fun m!1432243 () Bool)

(assert (=> b!1553593 m!1432243))

(declare-fun m!1432245 () Bool)

(assert (=> b!1553596 m!1432245))

(declare-fun m!1432247 () Bool)

(assert (=> b!1553594 m!1432247))

(declare-fun m!1432249 () Bool)

(assert (=> b!1553594 m!1432249))

(assert (=> b!1553597 m!1432249))

(declare-fun m!1432251 () Bool)

(assert (=> b!1553597 m!1432251))

(assert (=> b!1553597 m!1432249))

(declare-fun m!1432253 () Bool)

(assert (=> b!1553597 m!1432253))

(assert (=> b!1553597 m!1432251))

(declare-fun m!1432255 () Bool)

(assert (=> b!1553597 m!1432255))

(declare-fun m!1432257 () Bool)

(assert (=> b!1553597 m!1432257))

(push 1)

(assert tp_is_empty!38227)

(assert (not b!1553595))

(assert (not b!1553597))

(assert (not b!1553594))

(assert (not start!132434))

(assert (not b!1553596))

(assert (not b!1553593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!161575 () Bool)

(declare-fun res!1063392 () Bool)

(declare-fun e!865033 () Bool)

(assert (=> d!161575 (=> res!1063392 e!865033)))

(assert (=> d!161575 (= res!1063392 (or (is-Nil!36225 (toList!11202 lm!249)) (is-Nil!36225 (t!50949 (toList!11202 lm!249)))))))

(assert (=> d!161575 (= (isStrictlySorted!891 (toList!11202 lm!249)) e!865033)))

(declare-fun b!1553644 () Bool)

(declare-fun e!865034 () Bool)

(assert (=> b!1553644 (= e!865033 e!865034)))

(declare-fun res!1063393 () Bool)

(assert (=> b!1553644 (=> (not res!1063393) (not e!865034))))

(assert (=> b!1553644 (= res!1063393 (bvslt (_1!12393 (h!37670 (toList!11202 lm!249))) (_1!12393 (h!37670 (t!50949 (toList!11202 lm!249))))))))

(declare-fun b!1553645 () Bool)

(assert (=> b!1553645 (= e!865034 (isStrictlySorted!891 (t!50949 (toList!11202 lm!249))))))

(assert (= (and d!161575 (not res!1063392)) b!1553644))

(assert (= (and b!1553644 res!1063393) b!1553645))

(declare-fun m!1432313 () Bool)

(assert (=> b!1553645 m!1432313))

(assert (=> b!1553593 d!161575))

(declare-fun d!161581 () Bool)

(declare-fun res!1063406 () Bool)

(declare-fun e!865049 () Bool)

(assert (=> d!161581 (=> res!1063406 e!865049)))

(assert (=> d!161581 (= res!1063406 (and (is-Cons!36224 lt!669722) (= (_1!12393 (h!37670 lt!669722)) a0!49)))))

(assert (=> d!161581 (= (containsKey!761 lt!669722 a0!49) e!865049)))

(declare-fun b!1553662 () Bool)

(declare-fun e!865050 () Bool)

(assert (=> b!1553662 (= e!865049 e!865050)))

(declare-fun res!1063407 () Bool)

(assert (=> b!1553662 (=> (not res!1063407) (not e!865050))))

(assert (=> b!1553662 (= res!1063407 (and (or (not (is-Cons!36224 lt!669722)) (bvsle (_1!12393 (h!37670 lt!669722)) a0!49)) (is-Cons!36224 lt!669722) (bvslt (_1!12393 (h!37670 lt!669722)) a0!49)))))

(declare-fun b!1553663 () Bool)

(assert (=> b!1553663 (= e!865050 (containsKey!761 (t!50949 lt!669722) a0!49))))

(assert (= (and d!161581 (not res!1063406)) b!1553662))

(assert (= (and b!1553662 res!1063407) b!1553663))

(declare-fun m!1432317 () Bool)

(assert (=> b!1553663 m!1432317))

(assert (=> b!1553593 d!161581))

(declare-fun b!1553759 () Bool)

(declare-fun res!1063442 () Bool)

(declare-fun e!865113 () Bool)

(assert (=> b!1553759 (=> (not res!1063442) (not e!865113))))

(declare-fun lt!669769 () List!36228)

(assert (=> b!1553759 (= res!1063442 (containsKey!761 lt!669769 a!523))))

(declare-fun d!161585 () Bool)

(assert (=> d!161585 e!865113))

(declare-fun res!1063441 () Bool)

(assert (=> d!161585 (=> (not res!1063441) (not e!865113))))

(assert (=> d!161585 (= res!1063441 (isStrictlySorted!891 lt!669769))))

(declare-fun e!865114 () List!36228)

(assert (=> d!161585 (= lt!669769 e!865114)))

(declare-fun c!143297 () Bool)

(assert (=> d!161585 (= c!143297 (and (is-Cons!36224 (toList!11202 lm!249)) (bvslt (_1!12393 (h!37670 (toList!11202 lm!249))) a!523)))))

(assert (=> d!161585 (isStrictlySorted!891 (toList!11202 lm!249))))

(assert (=> d!161585 (= (insertStrictlySorted!507 (toList!11202 lm!249) a!523 b!96) lt!669769)))

(declare-fun b!1553760 () Bool)

(declare-fun e!865111 () List!36228)

(assert (=> b!1553760 (= e!865114 e!865111)))

(declare-fun c!143296 () Bool)

(assert (=> b!1553760 (= c!143296 (and (is-Cons!36224 (toList!11202 lm!249)) (= (_1!12393 (h!37670 (toList!11202 lm!249))) a!523)))))

(declare-fun call!71391 () List!36228)

(declare-fun bm!71386 () Bool)

(declare-fun e!865110 () List!36228)

(declare-fun $colon$colon!946 (List!36228 tuple2!24764) List!36228)

(assert (=> bm!71386 (= call!71391 ($colon$colon!946 e!865110 (ite c!143297 (h!37670 (toList!11202 lm!249)) (tuple2!24765 a!523 b!96))))))

(declare-fun c!143298 () Bool)

(assert (=> bm!71386 (= c!143298 c!143297)))

(declare-fun b!1553761 () Bool)

(assert (=> b!1553761 (= e!865114 call!71391)))

(declare-fun c!143295 () Bool)

(declare-fun b!1553762 () Bool)

(assert (=> b!1553762 (= e!865110 (ite c!143296 (t!50949 (toList!11202 lm!249)) (ite c!143295 (Cons!36224 (h!37670 (toList!11202 lm!249)) (t!50949 (toList!11202 lm!249))) Nil!36225)))))

(declare-fun bm!71387 () Bool)

(declare-fun call!71390 () List!36228)

(assert (=> bm!71387 (= call!71390 call!71391)))

(declare-fun b!1553763 () Bool)

(assert (=> b!1553763 (= c!143295 (and (is-Cons!36224 (toList!11202 lm!249)) (bvsgt (_1!12393 (h!37670 (toList!11202 lm!249))) a!523)))))

(declare-fun e!865112 () List!36228)

(assert (=> b!1553763 (= e!865111 e!865112)))

(declare-fun b!1553764 () Bool)

(assert (=> b!1553764 (= e!865110 (insertStrictlySorted!507 (t!50949 (toList!11202 lm!249)) a!523 b!96))))

(declare-fun b!1553765 () Bool)

(assert (=> b!1553765 (= e!865111 call!71390)))

(declare-fun b!1553766 () Bool)

(declare-fun call!71389 () List!36228)

(assert (=> b!1553766 (= e!865112 call!71389)))

(declare-fun b!1553767 () Bool)

(assert (=> b!1553767 (= e!865112 call!71389)))

(declare-fun b!1553768 () Bool)

(declare-fun contains!10148 (List!36228 tuple2!24764) Bool)

(assert (=> b!1553768 (= e!865113 (contains!10148 lt!669769 (tuple2!24765 a!523 b!96)))))

(declare-fun bm!71388 () Bool)

(assert (=> bm!71388 (= call!71389 call!71390)))

(assert (= (and d!161585 c!143297) b!1553761))

(assert (= (and d!161585 (not c!143297)) b!1553760))

(assert (= (and b!1553760 c!143296) b!1553765))

(assert (= (and b!1553760 (not c!143296)) b!1553763))

(assert (= (and b!1553763 c!143295) b!1553767))

(assert (= (and b!1553763 (not c!143295)) b!1553766))

(assert (= (or b!1553767 b!1553766) bm!71388))

(assert (= (or b!1553765 bm!71388) bm!71387))

(assert (= (or b!1553761 bm!71387) bm!71386))

(assert (= (and bm!71386 c!143298) b!1553764))

(assert (= (and bm!71386 (not c!143298)) b!1553762))

(assert (= (and d!161585 res!1063441) b!1553759))

(assert (= (and b!1553759 res!1063442) b!1553768))

(declare-fun m!1432345 () Bool)

(assert (=> b!1553768 m!1432345))

(declare-fun m!1432347 () Bool)

(assert (=> d!161585 m!1432347))

(assert (=> d!161585 m!1432237))

(declare-fun m!1432349 () Bool)

(assert (=> b!1553759 m!1432349))

(declare-fun m!1432351 () Bool)

(assert (=> b!1553764 m!1432351))

(declare-fun m!1432353 () Bool)

(assert (=> bm!71386 m!1432353))

(assert (=> b!1553593 d!161585))

(declare-fun d!161607 () Bool)

(declare-fun e!865141 () Bool)

(assert (=> d!161607 e!865141))

(declare-fun res!1063454 () Bool)

(assert (=> d!161607 (=> (not res!1063454) (not e!865141))))

(assert (=> d!161607 (= res!1063454 (= (containsKey!761 (insertStrictlySorted!507 (toList!11202 lm!249) a!523 b!96) a0!49) (containsKey!761 (toList!11202 lm!249) a0!49)))))

(declare-fun lt!669781 () Unit!51749)

(declare-fun choose!2041 (List!36228 (_ BitVec 64) B!2216 (_ BitVec 64)) Unit!51749)

(assert (=> d!161607 (= lt!669781 (choose!2041 (toList!11202 lm!249) a!523 b!96 a0!49))))

(declare-fun e!865140 () Bool)

(assert (=> d!161607 e!865140))

(declare-fun res!1063453 () Bool)

(assert (=> d!161607 (=> (not res!1063453) (not e!865140))))

(assert (=> d!161607 (= res!1063453 (isStrictlySorted!891 (toList!11202 lm!249)))))

(assert (=> d!161607 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!4 (toList!11202 lm!249) a!523 b!96 a0!49) lt!669781)))

(declare-fun b!1553809 () Bool)

(assert (=> b!1553809 (= e!865140 (not (= a!523 a0!49)))))

(declare-fun b!1553810 () Bool)

(assert (=> b!1553810 (= e!865141 (= (getValueByKey!739 (insertStrictlySorted!507 (toList!11202 lm!249) a!523 b!96) a0!49) (getValueByKey!739 (toList!11202 lm!249) a0!49)))))

(assert (= (and d!161607 res!1063453) b!1553809))

(assert (= (and d!161607 res!1063454) b!1553810))

(assert (=> d!161607 m!1432241))

(declare-fun m!1432373 () Bool)

(assert (=> d!161607 m!1432373))

(assert (=> d!161607 m!1432237))

(declare-fun m!1432375 () Bool)

(assert (=> d!161607 m!1432375))

(assert (=> d!161607 m!1432245))

(assert (=> d!161607 m!1432241))

(assert (=> b!1553810 m!1432241))

(assert (=> b!1553810 m!1432241))

(declare-fun m!1432377 () Bool)

(assert (=> b!1553810 m!1432377))

(assert (=> b!1553810 m!1432249))

(assert (=> b!1553593 d!161607))

(declare-fun b!1553830 () Bool)

(declare-fun e!865152 () Option!815)

(assert (=> b!1553830 (= e!865152 (Some!814 (_2!12393 (h!37670 lt!669722))))))

(declare-fun d!161623 () Bool)

(declare-fun c!143321 () Bool)

(assert (=> d!161623 (= c!143321 (and (is-Cons!36224 lt!669722) (= (_1!12393 (h!37670 lt!669722)) a0!49)))))

(assert (=> d!161623 (= (getValueByKey!739 lt!669722 a0!49) e!865152)))

(declare-fun b!1553831 () Bool)

(declare-fun e!865153 () Option!815)

(assert (=> b!1553831 (= e!865152 e!865153)))

(declare-fun c!143322 () Bool)

(assert (=> b!1553831 (= c!143322 (and (is-Cons!36224 lt!669722) (not (= (_1!12393 (h!37670 lt!669722)) a0!49))))))

(declare-fun b!1553833 () Bool)

(assert (=> b!1553833 (= e!865153 None!813)))

(declare-fun b!1553832 () Bool)

(assert (=> b!1553832 (= e!865153 (getValueByKey!739 (t!50949 lt!669722) a0!49))))

(assert (= (and d!161623 c!143321) b!1553830))

(assert (= (and d!161623 (not c!143321)) b!1553831))

(assert (= (and b!1553831 c!143322) b!1553832))

(assert (= (and b!1553831 (not c!143322)) b!1553833))

(declare-fun m!1432379 () Bool)

(assert (=> b!1553832 m!1432379))

(assert (=> b!1553594 d!161623))

(declare-fun b!1553838 () Bool)

(declare-fun e!865156 () Option!815)

(assert (=> b!1553838 (= e!865156 (Some!814 (_2!12393 (h!37670 (toList!11202 lm!249)))))))

(declare-fun d!161625 () Bool)

(declare-fun c!143323 () Bool)

(assert (=> d!161625 (= c!143323 (and (is-Cons!36224 (toList!11202 lm!249)) (= (_1!12393 (h!37670 (toList!11202 lm!249))) a0!49)))))

(assert (=> d!161625 (= (getValueByKey!739 (toList!11202 lm!249) a0!49) e!865156)))

(declare-fun b!1553839 () Bool)

(declare-fun e!865157 () Option!815)

(assert (=> b!1553839 (= e!865156 e!865157)))

(declare-fun c!143324 () Bool)

(assert (=> b!1553839 (= c!143324 (and (is-Cons!36224 (toList!11202 lm!249)) (not (= (_1!12393 (h!37670 (toList!11202 lm!249))) a0!49))))))

(declare-fun b!1553841 () Bool)

(assert (=> b!1553841 (= e!865157 None!813)))

(declare-fun b!1553840 () Bool)

(assert (=> b!1553840 (= e!865157 (getValueByKey!739 (t!50949 (toList!11202 lm!249)) a0!49))))

(assert (= (and d!161625 c!143323) b!1553838))

(assert (= (and d!161625 (not c!143323)) b!1553839))

(assert (= (and b!1553839 c!143324) b!1553840))

(assert (= (and b!1553839 (not c!143324)) b!1553841))

(declare-fun m!1432381 () Bool)

(assert (=> b!1553840 m!1432381))

(assert (=> b!1553594 d!161625))

(declare-fun d!161627 () Bool)

(declare-fun res!1063464 () Bool)

(declare-fun e!865158 () Bool)

(assert (=> d!161627 (=> res!1063464 e!865158)))

(assert (=> d!161627 (= res!1063464 (and (is-Cons!36224 (toList!11202 lm!249)) (= (_1!12393 (h!37670 (toList!11202 lm!249))) a0!49)))))

(assert (=> d!161627 (= (containsKey!761 (toList!11202 lm!249) a0!49) e!865158)))

(declare-fun b!1553842 () Bool)

(declare-fun e!865159 () Bool)

(assert (=> b!1553842 (= e!865158 e!865159)))

(declare-fun res!1063465 () Bool)

(assert (=> b!1553842 (=> (not res!1063465) (not e!865159))))

(assert (=> b!1553842 (= res!1063465 (and (or (not (is-Cons!36224 (toList!11202 lm!249))) (bvsle (_1!12393 (h!37670 (toList!11202 lm!249))) a0!49)) (is-Cons!36224 (toList!11202 lm!249)) (bvslt (_1!12393 (h!37670 (toList!11202 lm!249))) a0!49)))))

(declare-fun b!1553843 () Bool)

(assert (=> b!1553843 (= e!865159 (containsKey!761 (t!50949 (toList!11202 lm!249)) a0!49))))

(assert (= (and d!161627 (not res!1063464)) b!1553842))

(assert (= (and b!1553842 res!1063465) b!1553843))

(declare-fun m!1432383 () Bool)

(assert (=> b!1553843 m!1432383))

(assert (=> b!1553596 d!161627))

(declare-fun d!161629 () Bool)

(declare-fun e!865177 () Bool)

(assert (=> d!161629 e!865177))

(declare-fun res!1063476 () Bool)

(assert (=> d!161629 (=> res!1063476 e!865177)))

(declare-fun lt!669809 () Bool)

(assert (=> d!161629 (= res!1063476 (not lt!669809))))

(declare-fun lt!669812 () Bool)

(assert (=> d!161629 (= lt!669809 lt!669812)))

(declare-fun lt!669810 () Unit!51749)

(declare-fun e!865178 () Unit!51749)

(assert (=> d!161629 (= lt!669810 e!865178)))

(declare-fun c!143331 () Bool)

(assert (=> d!161629 (= c!143331 lt!669812)))

(assert (=> d!161629 (= lt!669812 (containsKey!761 (toList!11202 lm!249) a0!49))))

(assert (=> d!161629 (= (contains!10144 lm!249 a0!49) lt!669809)))

(declare-fun b!1553871 () Bool)

(declare-fun lt!669811 () Unit!51749)

(assert (=> b!1553871 (= e!865178 lt!669811)))

(assert (=> b!1553871 (= lt!669811 (lemmaContainsKeyImpliesGetValueByKeyDefined!504 (toList!11202 lm!249) a0!49))))

(assert (=> b!1553871 (isDefined!552 (getValueByKey!739 (toList!11202 lm!249) a0!49))))

(declare-fun b!1553872 () Bool)

(declare-fun Unit!51758 () Unit!51749)

(assert (=> b!1553872 (= e!865178 Unit!51758)))

(declare-fun b!1553873 () Bool)

(assert (=> b!1553873 (= e!865177 (isDefined!552 (getValueByKey!739 (toList!11202 lm!249) a0!49)))))

(assert (= (and d!161629 c!143331) b!1553871))

(assert (= (and d!161629 (not c!143331)) b!1553872))

(assert (= (and d!161629 (not res!1063476)) b!1553873))

(assert (=> d!161629 m!1432245))

(assert (=> b!1553871 m!1432257))

(assert (=> b!1553871 m!1432249))

(assert (=> b!1553871 m!1432249))

(assert (=> b!1553871 m!1432253))

(assert (=> b!1553873 m!1432249))

(assert (=> b!1553873 m!1432249))

(assert (=> b!1553873 m!1432253))

(assert (=> start!132434 d!161629))

(declare-fun d!161633 () Bool)

(assert (=> d!161633 (= (inv!57311 lm!249) (isStrictlySorted!891 (toList!11202 lm!249)))))

(declare-fun bs!44660 () Bool)

(assert (= bs!44660 d!161633))

(assert (=> bs!44660 m!1432237))

(assert (=> start!132434 d!161633))

(assert (=> b!1553597 d!161625))

(declare-fun d!161635 () Bool)

(declare-fun isEmpty!1136 (Option!815) Bool)

(assert (=> d!161635 (= (isDefined!552 (getValueByKey!739 (toList!11202 lm!249) a0!49)) (not (isEmpty!1136 (getValueByKey!739 (toList!11202 lm!249) a0!49))))))

(declare-fun bs!44661 () Bool)

(assert (= bs!44661 d!161635))

(assert (=> bs!44661 m!1432249))

(declare-fun m!1432411 () Bool)

(assert (=> bs!44661 m!1432411))

(assert (=> b!1553597 d!161635))

(declare-fun d!161637 () Bool)

(assert (=> d!161637 (isDefined!552 (getValueByKey!739 (toList!11202 lm!249) a0!49))))

(declare-fun lt!669818 () Unit!51749)

(declare-fun choose!2044 (List!36228 (_ BitVec 64)) Unit!51749)

(assert (=> d!161637 (= lt!669818 (choose!2044 (toList!11202 lm!249) a0!49))))

(declare-fun e!865185 () Bool)

(assert (=> d!161637 e!865185))

(declare-fun res!1063483 () Bool)

(assert (=> d!161637 (=> (not res!1063483) (not e!865185))))

(assert (=> d!161637 (= res!1063483 (isStrictlySorted!891 (toList!11202 lm!249)))))

(assert (=> d!161637 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!504 (toList!11202 lm!249) a0!49) lt!669818)))

(declare-fun b!1553880 () Bool)

(assert (=> b!1553880 (= e!865185 (containsKey!761 (toList!11202 lm!249) a0!49))))

(assert (= (and d!161637 res!1063483) b!1553880))

(assert (=> d!161637 m!1432249))

(assert (=> d!161637 m!1432249))

(assert (=> d!161637 m!1432253))

(declare-fun m!1432417 () Bool)

(assert (=> d!161637 m!1432417))

(assert (=> d!161637 m!1432237))

(assert (=> b!1553880 m!1432245))

(assert (=> b!1553597 d!161637))

(declare-fun d!161643 () Bool)

(declare-fun e!865186 () Bool)

(assert (=> d!161643 e!865186))

(declare-fun res!1063484 () Bool)

(assert (=> d!161643 (=> res!1063484 e!865186)))

(declare-fun lt!669819 () Bool)

(assert (=> d!161643 (= res!1063484 (not lt!669819))))

(declare-fun lt!669822 () Bool)

(assert (=> d!161643 (= lt!669819 lt!669822)))

(declare-fun lt!669820 () Unit!51749)

(declare-fun e!865187 () Unit!51749)

(assert (=> d!161643 (= lt!669820 e!865187)))

(declare-fun c!143332 () Bool)

(assert (=> d!161643 (= c!143332 lt!669822)))

(assert (=> d!161643 (= lt!669822 (containsKey!761 (toList!11202 (+!5012 lm!249 (tuple2!24765 a!523 b!96))) a0!49))))

(assert (=> d!161643 (= (contains!10144 (+!5012 lm!249 (tuple2!24765 a!523 b!96)) a0!49) lt!669819)))

(declare-fun b!1553881 () Bool)

(declare-fun lt!669821 () Unit!51749)

(assert (=> b!1553881 (= e!865187 lt!669821)))

(assert (=> b!1553881 (= lt!669821 (lemmaContainsKeyImpliesGetValueByKeyDefined!504 (toList!11202 (+!5012 lm!249 (tuple2!24765 a!523 b!96))) a0!49))))

(assert (=> b!1553881 (isDefined!552 (getValueByKey!739 (toList!11202 (+!5012 lm!249 (tuple2!24765 a!523 b!96))) a0!49))))

(declare-fun b!1553882 () Bool)

(declare-fun Unit!51759 () Unit!51749)

(assert (=> b!1553882 (= e!865187 Unit!51759)))

(declare-fun b!1553883 () Bool)

(assert (=> b!1553883 (= e!865186 (isDefined!552 (getValueByKey!739 (toList!11202 (+!5012 lm!249 (tuple2!24765 a!523 b!96))) a0!49)))))

(assert (= (and d!161643 c!143332) b!1553881))

(assert (= (and d!161643 (not c!143332)) b!1553882))

(assert (= (and d!161643 (not res!1063484)) b!1553883))

(declare-fun m!1432419 () Bool)

(assert (=> d!161643 m!1432419))

(declare-fun m!1432421 () Bool)

(assert (=> b!1553881 m!1432421))

(declare-fun m!1432423 () Bool)

(assert (=> b!1553881 m!1432423))

(assert (=> b!1553881 m!1432423))

(declare-fun m!1432427 () Bool)

(assert (=> b!1553881 m!1432427))

(assert (=> b!1553883 m!1432423))

(assert (=> b!1553883 m!1432423))

(assert (=> b!1553883 m!1432427))

(assert (=> b!1553597 d!161643))

(declare-fun d!161647 () Bool)

(declare-fun e!865195 () Bool)

(assert (=> d!161647 e!865195))

(declare-fun res!1063496 () Bool)

(assert (=> d!161647 (=> (not res!1063496) (not e!865195))))

(declare-fun lt!669844 () ListLongMap!22373)

(assert (=> d!161647 (= res!1063496 (contains!10144 lt!669844 (_1!12393 (tuple2!24765 a!523 b!96))))))

(declare-fun lt!669846 () List!36228)

(assert (=> d!161647 (= lt!669844 (ListLongMap!22374 lt!669846))))

(declare-fun lt!669847 () Unit!51749)

(declare-fun lt!669845 () Unit!51749)

(assert (=> d!161647 (= lt!669847 lt!669845)))

(assert (=> d!161647 (= (getValueByKey!739 lt!669846 (_1!12393 (tuple2!24765 a!523 b!96))) (Some!814 (_2!12393 (tuple2!24765 a!523 b!96))))))

(declare-fun lemmaContainsTupThenGetReturnValue!376 (List!36228 (_ BitVec 64) B!2216) Unit!51749)

(assert (=> d!161647 (= lt!669845 (lemmaContainsTupThenGetReturnValue!376 lt!669846 (_1!12393 (tuple2!24765 a!523 b!96)) (_2!12393 (tuple2!24765 a!523 b!96))))))

(assert (=> d!161647 (= lt!669846 (insertStrictlySorted!507 (toList!11202 lm!249) (_1!12393 (tuple2!24765 a!523 b!96)) (_2!12393 (tuple2!24765 a!523 b!96))))))

(assert (=> d!161647 (= (+!5012 lm!249 (tuple2!24765 a!523 b!96)) lt!669844)))

(declare-fun b!1553896 () Bool)

(declare-fun res!1063495 () Bool)

(assert (=> b!1553896 (=> (not res!1063495) (not e!865195))))

(assert (=> b!1553896 (= res!1063495 (= (getValueByKey!739 (toList!11202 lt!669844) (_1!12393 (tuple2!24765 a!523 b!96))) (Some!814 (_2!12393 (tuple2!24765 a!523 b!96)))))))

(declare-fun b!1553897 () Bool)

(assert (=> b!1553897 (= e!865195 (contains!10148 (toList!11202 lt!669844) (tuple2!24765 a!523 b!96)))))

(assert (= (and d!161647 res!1063496) b!1553896))

(assert (= (and b!1553896 res!1063495) b!1553897))

(declare-fun m!1432437 () Bool)

(assert (=> d!161647 m!1432437))

(declare-fun m!1432439 () Bool)

(assert (=> d!161647 m!1432439))

(declare-fun m!1432441 () Bool)

(assert (=> d!161647 m!1432441))

(declare-fun m!1432443 () Bool)

(assert (=> d!161647 m!1432443))

(declare-fun m!1432445 () Bool)

(assert (=> b!1553896 m!1432445))

(declare-fun m!1432447 () Bool)

(assert (=> b!1553897 m!1432447))

(assert (=> b!1553597 d!161647))

(declare-fun b!1553904 () Bool)

(declare-fun e!865199 () Bool)

(declare-fun tp!112131 () Bool)

(assert (=> b!1553904 (= e!865199 (and tp_is_empty!38227 tp!112131))))

(assert (=> b!1553595 (= tp!112119 e!865199)))

(assert (= (and b!1553595 (is-Cons!36224 (toList!11202 lm!249))) b!1553904))

(push 1)

