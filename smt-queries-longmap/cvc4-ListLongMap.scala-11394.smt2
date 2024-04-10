; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132564 () Bool)

(assert start!132564)

(declare-fun b!1554214 () Bool)

(declare-fun e!865416 () Bool)

(declare-datatypes ((B!2244 0))(
  ( (B!2245 (val!19208 Int)) )
))
(declare-datatypes ((tuple2!24792 0))(
  ( (tuple2!24793 (_1!12407 (_ BitVec 64)) (_2!12407 B!2244)) )
))
(declare-datatypes ((List!36242 0))(
  ( (Nil!36239) (Cons!36238 (h!37684 tuple2!24792) (t!50963 List!36242)) )
))
(declare-datatypes ((ListLongMap!22401 0))(
  ( (ListLongMap!22402 (toList!11216 List!36242)) )
))
(declare-fun lm!249 () ListLongMap!22401)

(declare-fun isStrictlySorted!904 (List!36242) Bool)

(assert (=> b!1554214 (= e!865416 (not (isStrictlySorted!904 (toList!11216 lm!249))))))

(declare-fun e!865418 () Bool)

(assert (=> b!1554214 e!865418))

(declare-fun res!1063703 () Bool)

(assert (=> b!1554214 (=> (not res!1063703) (not e!865418))))

(declare-fun lt!669967 () List!36242)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun containsKey!775 (List!36242 (_ BitVec 64)) Bool)

(assert (=> b!1554214 (= res!1063703 (containsKey!775 lt!669967 a0!49))))

(declare-fun a!523 () (_ BitVec 64))

(declare-fun b!96 () B!2244)

(declare-fun insertStrictlySorted!515 (List!36242 (_ BitVec 64) B!2244) List!36242)

(assert (=> b!1554214 (= lt!669967 (insertStrictlySorted!515 (toList!11216 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51789 0))(
  ( (Unit!51790) )
))
(declare-fun lt!669968 () Unit!51789)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!12 (List!36242 (_ BitVec 64) B!2244 (_ BitVec 64)) Unit!51789)

(assert (=> b!1554214 (= lt!669968 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!12 (toList!11216 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1554215 () Bool)

(declare-fun e!865417 () Bool)

(declare-fun tp!112188 () Bool)

(assert (=> b!1554215 (= e!865417 tp!112188)))

(declare-fun b!1554216 () Bool)

(declare-fun res!1063704 () Bool)

(assert (=> b!1554216 (=> (not res!1063704) (not e!865416))))

(assert (=> b!1554216 (= res!1063704 (not (= a0!49 a!523)))))

(declare-fun res!1063705 () Bool)

(assert (=> start!132564 (=> (not res!1063705) (not e!865416))))

(declare-fun contains!10161 (ListLongMap!22401 (_ BitVec 64)) Bool)

(assert (=> start!132564 (= res!1063705 (contains!10161 lm!249 a0!49))))

(assert (=> start!132564 e!865416))

(declare-fun inv!57345 (ListLongMap!22401) Bool)

(assert (=> start!132564 (and (inv!57345 lm!249) e!865417)))

(assert (=> start!132564 true))

(declare-fun tp_is_empty!38255 () Bool)

(assert (=> start!132564 tp_is_empty!38255))

(declare-fun b!1554217 () Bool)

(declare-datatypes ((Option!829 0))(
  ( (Some!828 (v!22013 B!2244)) (None!827) )
))
(declare-fun getValueByKey!753 (List!36242 (_ BitVec 64)) Option!829)

(assert (=> b!1554217 (= e!865418 (= (getValueByKey!753 lt!669967 a0!49) (getValueByKey!753 (toList!11216 lm!249) a0!49)))))

(declare-fun b!1554218 () Bool)

(declare-fun res!1063702 () Bool)

(assert (=> b!1554218 (=> (not res!1063702) (not e!865416))))

(assert (=> b!1554218 (= res!1063702 (containsKey!775 (toList!11216 lm!249) a0!49))))

(assert (= (and start!132564 res!1063705) b!1554216))

(assert (= (and b!1554216 res!1063704) b!1554218))

(assert (= (and b!1554218 res!1063702) b!1554214))

(assert (= (and b!1554214 res!1063703) b!1554217))

(assert (= start!132564 b!1554215))

(declare-fun m!1432665 () Bool)

(assert (=> b!1554214 m!1432665))

(declare-fun m!1432667 () Bool)

(assert (=> b!1554214 m!1432667))

(declare-fun m!1432669 () Bool)

(assert (=> b!1554214 m!1432669))

(declare-fun m!1432671 () Bool)

(assert (=> b!1554214 m!1432671))

(declare-fun m!1432673 () Bool)

(assert (=> start!132564 m!1432673))

(declare-fun m!1432675 () Bool)

(assert (=> start!132564 m!1432675))

(declare-fun m!1432677 () Bool)

(assert (=> b!1554217 m!1432677))

(declare-fun m!1432679 () Bool)

(assert (=> b!1554217 m!1432679))

(declare-fun m!1432681 () Bool)

(assert (=> b!1554218 m!1432681))

(push 1)

(assert (not start!132564))

(assert (not b!1554215))

(assert (not b!1554214))

(assert (not b!1554217))

(assert (not b!1554218))

(assert tp_is_empty!38255)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!161703 () Bool)

(declare-fun res!1063716 () Bool)

(declare-fun e!865429 () Bool)

(assert (=> d!161703 (=> res!1063716 e!865429)))

(assert (=> d!161703 (= res!1063716 (or (is-Nil!36239 (toList!11216 lm!249)) (is-Nil!36239 (t!50963 (toList!11216 lm!249)))))))

(assert (=> d!161703 (= (isStrictlySorted!904 (toList!11216 lm!249)) e!865429)))

(declare-fun b!1554229 () Bool)

(declare-fun e!865430 () Bool)

(assert (=> b!1554229 (= e!865429 e!865430)))

(declare-fun res!1063717 () Bool)

(assert (=> b!1554229 (=> (not res!1063717) (not e!865430))))

(assert (=> b!1554229 (= res!1063717 (bvslt (_1!12407 (h!37684 (toList!11216 lm!249))) (_1!12407 (h!37684 (t!50963 (toList!11216 lm!249))))))))

(declare-fun b!1554230 () Bool)

(assert (=> b!1554230 (= e!865430 (isStrictlySorted!904 (t!50963 (toList!11216 lm!249))))))

(assert (= (and d!161703 (not res!1063716)) b!1554229))

(assert (= (and b!1554229 res!1063717) b!1554230))

(declare-fun m!1432685 () Bool)

(assert (=> b!1554230 m!1432685))

(assert (=> b!1554214 d!161703))

(declare-fun d!161709 () Bool)

(declare-fun res!1063730 () Bool)

(declare-fun e!865445 () Bool)

(assert (=> d!161709 (=> res!1063730 e!865445)))

(assert (=> d!161709 (= res!1063730 (and (is-Cons!36238 lt!669967) (= (_1!12407 (h!37684 lt!669967)) a0!49)))))

(assert (=> d!161709 (= (containsKey!775 lt!669967 a0!49) e!865445)))

(declare-fun b!1554247 () Bool)

(declare-fun e!865446 () Bool)

(assert (=> b!1554247 (= e!865445 e!865446)))

(declare-fun res!1063731 () Bool)

(assert (=> b!1554247 (=> (not res!1063731) (not e!865446))))

(assert (=> b!1554247 (= res!1063731 (and (or (not (is-Cons!36238 lt!669967)) (bvsle (_1!12407 (h!37684 lt!669967)) a0!49)) (is-Cons!36238 lt!669967) (bvslt (_1!12407 (h!37684 lt!669967)) a0!49)))))

(declare-fun b!1554248 () Bool)

(assert (=> b!1554248 (= e!865446 (containsKey!775 (t!50963 lt!669967) a0!49))))

(assert (= (and d!161709 (not res!1063730)) b!1554247))

(assert (= (and b!1554247 res!1063731) b!1554248))

(declare-fun m!1432689 () Bool)

(assert (=> b!1554248 m!1432689))

(assert (=> b!1554214 d!161709))

(declare-fun c!143378 () Bool)

(declare-fun c!143377 () Bool)

(declare-fun b!1554314 () Bool)

(declare-fun e!865489 () List!36242)

(assert (=> b!1554314 (= e!865489 (ite c!143377 (t!50963 (toList!11216 lm!249)) (ite c!143378 (Cons!36238 (h!37684 (toList!11216 lm!249)) (t!50963 (toList!11216 lm!249))) Nil!36239)))))

(declare-fun b!1554315 () Bool)

(declare-fun e!865488 () List!36242)

(declare-fun call!71416 () List!36242)

(assert (=> b!1554315 (= e!865488 call!71416)))

(declare-fun b!1554316 () Bool)

(assert (=> b!1554316 (= e!865488 call!71416)))

(declare-fun b!1554317 () Bool)

(declare-fun res!1063756 () Bool)

(declare-fun e!865486 () Bool)

(assert (=> b!1554317 (=> (not res!1063756) (not e!865486))))

(declare-fun lt!669986 () List!36242)

(assert (=> b!1554317 (= res!1063756 (containsKey!775 lt!669986 a!523))))

(declare-fun c!143376 () Bool)

(declare-fun bm!71413 () Bool)

(declare-fun call!71418 () List!36242)

(declare-fun $colon$colon!949 (List!36242 tuple2!24792) List!36242)

(assert (=> bm!71413 (= call!71418 ($colon$colon!949 e!865489 (ite c!143376 (h!37684 (toList!11216 lm!249)) (tuple2!24793 a!523 b!96))))))

(declare-fun c!143375 () Bool)

(assert (=> bm!71413 (= c!143375 c!143376)))

(declare-fun b!1554318 () Bool)

(declare-fun e!865490 () List!36242)

(declare-fun call!71417 () List!36242)

(assert (=> b!1554318 (= e!865490 call!71417)))

(declare-fun bm!71414 () Bool)

(assert (=> bm!71414 (= call!71416 call!71417)))

(declare-fun b!1554319 () Bool)

(assert (=> b!1554319 (= c!143378 (and (is-Cons!36238 (toList!11216 lm!249)) (bvsgt (_1!12407 (h!37684 (toList!11216 lm!249))) a!523)))))

(assert (=> b!1554319 (= e!865490 e!865488)))

(declare-fun b!1554320 () Bool)

(declare-fun contains!10164 (List!36242 tuple2!24792) Bool)

(assert (=> b!1554320 (= e!865486 (contains!10164 lt!669986 (tuple2!24793 a!523 b!96)))))

(declare-fun bm!71415 () Bool)

(assert (=> bm!71415 (= call!71417 call!71418)))

(declare-fun b!1554321 () Bool)

(assert (=> b!1554321 (= e!865489 (insertStrictlySorted!515 (t!50963 (toList!11216 lm!249)) a!523 b!96))))

(declare-fun d!161713 () Bool)

(assert (=> d!161713 e!865486))

(declare-fun res!1063755 () Bool)

(assert (=> d!161713 (=> (not res!1063755) (not e!865486))))

(assert (=> d!161713 (= res!1063755 (isStrictlySorted!904 lt!669986))))

(declare-fun e!865487 () List!36242)

(assert (=> d!161713 (= lt!669986 e!865487)))

(assert (=> d!161713 (= c!143376 (and (is-Cons!36238 (toList!11216 lm!249)) (bvslt (_1!12407 (h!37684 (toList!11216 lm!249))) a!523)))))

(assert (=> d!161713 (isStrictlySorted!904 (toList!11216 lm!249))))

(assert (=> d!161713 (= (insertStrictlySorted!515 (toList!11216 lm!249) a!523 b!96) lt!669986)))

(declare-fun b!1554322 () Bool)

(assert (=> b!1554322 (= e!865487 call!71418)))

(declare-fun b!1554323 () Bool)

(assert (=> b!1554323 (= e!865487 e!865490)))

(assert (=> b!1554323 (= c!143377 (and (is-Cons!36238 (toList!11216 lm!249)) (= (_1!12407 (h!37684 (toList!11216 lm!249))) a!523)))))

(assert (= (and d!161713 c!143376) b!1554322))

(assert (= (and d!161713 (not c!143376)) b!1554323))

(assert (= (and b!1554323 c!143377) b!1554318))

(assert (= (and b!1554323 (not c!143377)) b!1554319))

(assert (= (and b!1554319 c!143378) b!1554315))

(assert (= (and b!1554319 (not c!143378)) b!1554316))

(assert (= (or b!1554315 b!1554316) bm!71414))

(assert (= (or b!1554318 bm!71414) bm!71415))

(assert (= (or b!1554322 bm!71415) bm!71413))

(assert (= (and bm!71413 c!143375) b!1554321))

(assert (= (and bm!71413 (not c!143375)) b!1554314))

(assert (= (and d!161713 res!1063755) b!1554317))

(assert (= (and b!1554317 res!1063756) b!1554320))

(declare-fun m!1432703 () Bool)

(assert (=> b!1554317 m!1432703))

(declare-fun m!1432707 () Bool)

(assert (=> b!1554320 m!1432707))

(declare-fun m!1432711 () Bool)

(assert (=> d!161713 m!1432711))

(assert (=> d!161713 m!1432665))

(declare-fun m!1432715 () Bool)

(assert (=> bm!71413 m!1432715))

(declare-fun m!1432717 () Bool)

(assert (=> b!1554321 m!1432717))

(assert (=> b!1554214 d!161713))

(declare-fun d!161725 () Bool)

(declare-fun e!865510 () Bool)

(assert (=> d!161725 e!865510))

(declare-fun res!1063769 () Bool)

(assert (=> d!161725 (=> (not res!1063769) (not e!865510))))

(assert (=> d!161725 (= res!1063769 (= (containsKey!775 (insertStrictlySorted!515 (toList!11216 lm!249) a!523 b!96) a0!49) (containsKey!775 (toList!11216 lm!249) a0!49)))))

(declare-fun lt!669993 () Unit!51789)

(declare-fun choose!2048 (List!36242 (_ BitVec 64) B!2244 (_ BitVec 64)) Unit!51789)

(assert (=> d!161725 (= lt!669993 (choose!2048 (toList!11216 lm!249) a!523 b!96 a0!49))))

(declare-fun e!865509 () Bool)

(assert (=> d!161725 e!865509))

(declare-fun res!1063770 () Bool)

(assert (=> d!161725 (=> (not res!1063770) (not e!865509))))

(assert (=> d!161725 (= res!1063770 (isStrictlySorted!904 (toList!11216 lm!249)))))

(assert (=> d!161725 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!12 (toList!11216 lm!249) a!523 b!96 a0!49) lt!669993)))

(declare-fun b!1554352 () Bool)

(assert (=> b!1554352 (= e!865509 (not (= a!523 a0!49)))))

(declare-fun b!1554353 () Bool)

(assert (=> b!1554353 (= e!865510 (= (getValueByKey!753 (insertStrictlySorted!515 (toList!11216 lm!249) a!523 b!96) a0!49) (getValueByKey!753 (toList!11216 lm!249) a0!49)))))

(assert (= (and d!161725 res!1063770) b!1554352))

(assert (= (and d!161725 res!1063769) b!1554353))

(assert (=> d!161725 m!1432669))

(declare-fun m!1432719 () Bool)

(assert (=> d!161725 m!1432719))

(assert (=> d!161725 m!1432669))

(declare-fun m!1432723 () Bool)

(assert (=> d!161725 m!1432723))

(assert (=> d!161725 m!1432681))

(assert (=> d!161725 m!1432665))

(assert (=> b!1554353 m!1432669))

(assert (=> b!1554353 m!1432669))

(declare-fun m!1432727 () Bool)

(assert (=> b!1554353 m!1432727))

(assert (=> b!1554353 m!1432679))

(assert (=> b!1554214 d!161725))

(declare-fun d!161729 () Bool)

(declare-fun e!865534 () Bool)

(assert (=> d!161729 e!865534))

(declare-fun res!1063786 () Bool)

(assert (=> d!161729 (=> res!1063786 e!865534)))

(declare-fun lt!670017 () Bool)

(assert (=> d!161729 (= res!1063786 (not lt!670017))))

(declare-fun lt!670019 () Bool)

(assert (=> d!161729 (= lt!670017 lt!670019)))

(declare-fun lt!670016 () Unit!51789)

(declare-fun e!865533 () Unit!51789)

(assert (=> d!161729 (= lt!670016 e!865533)))

(declare-fun c!143395 () Bool)

(assert (=> d!161729 (= c!143395 lt!670019)))

(assert (=> d!161729 (= lt!670019 (containsKey!775 (toList!11216 lm!249) a0!49))))

(assert (=> d!161729 (= (contains!10161 lm!249 a0!49) lt!670017)))

(declare-fun b!1554384 () Bool)

(declare-fun lt!670014 () Unit!51789)

(assert (=> b!1554384 (= e!865533 lt!670014)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!518 (List!36242 (_ BitVec 64)) Unit!51789)

(assert (=> b!1554384 (= lt!670014 (lemmaContainsKeyImpliesGetValueByKeyDefined!518 (toList!11216 lm!249) a0!49))))

(declare-fun isDefined!566 (Option!829) Bool)

(assert (=> b!1554384 (isDefined!566 (getValueByKey!753 (toList!11216 lm!249) a0!49))))

(declare-fun b!1554386 () Bool)

(declare-fun Unit!51793 () Unit!51789)

(assert (=> b!1554386 (= e!865533 Unit!51793)))

(declare-fun b!1554388 () Bool)

(assert (=> b!1554388 (= e!865534 (isDefined!566 (getValueByKey!753 (toList!11216 lm!249) a0!49)))))

(assert (= (and d!161729 c!143395) b!1554384))

(assert (= (and d!161729 (not c!143395)) b!1554386))

(assert (= (and d!161729 (not res!1063786)) b!1554388))

(assert (=> d!161729 m!1432681))

(declare-fun m!1432745 () Bool)

(assert (=> b!1554384 m!1432745))

(assert (=> b!1554384 m!1432679))

(assert (=> b!1554384 m!1432679))

(declare-fun m!1432749 () Bool)

(assert (=> b!1554384 m!1432749))

(assert (=> b!1554388 m!1432679))

(assert (=> b!1554388 m!1432679))

(assert (=> b!1554388 m!1432749))

(assert (=> start!132564 d!161729))

(declare-fun d!161737 () Bool)

(assert (=> d!161737 (= (inv!57345 lm!249) (isStrictlySorted!904 (toList!11216 lm!249)))))

(declare-fun bs!44683 () Bool)

(assert (= bs!44683 d!161737))

(assert (=> bs!44683 m!1432665))

(assert (=> start!132564 d!161737))

(declare-fun d!161741 () Bool)

(declare-fun res!1063789 () Bool)

(declare-fun e!865538 () Bool)

(assert (=> d!161741 (=> res!1063789 e!865538)))

(assert (=> d!161741 (= res!1063789 (and (is-Cons!36238 (toList!11216 lm!249)) (= (_1!12407 (h!37684 (toList!11216 lm!249))) a0!49)))))

(assert (=> d!161741 (= (containsKey!775 (toList!11216 lm!249) a0!49) e!865538)))

(declare-fun b!1554392 () Bool)

(declare-fun e!865539 () Bool)

(assert (=> b!1554392 (= e!865538 e!865539)))

(declare-fun res!1063790 () Bool)

(assert (=> b!1554392 (=> (not res!1063790) (not e!865539))))

(assert (=> b!1554392 (= res!1063790 (and (or (not (is-Cons!36238 (toList!11216 lm!249))) (bvsle (_1!12407 (h!37684 (toList!11216 lm!249))) a0!49)) (is-Cons!36238 (toList!11216 lm!249)) (bvslt (_1!12407 (h!37684 (toList!11216 lm!249))) a0!49)))))

