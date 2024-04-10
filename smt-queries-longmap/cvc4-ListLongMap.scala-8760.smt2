; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106358 () Bool)

(assert start!106358)

(declare-datatypes ((B!1956 0))(
  ( (B!1957 (val!16313 Int)) )
))
(declare-datatypes ((tuple2!21144 0))(
  ( (tuple2!21145 (_1!10583 (_ BitVec 64)) (_2!10583 B!1956)) )
))
(declare-datatypes ((List!28305 0))(
  ( (Nil!28302) (Cons!28301 (h!29510 tuple2!21144) (t!41826 List!28305)) )
))
(declare-fun l!706 () List!28305)

(declare-fun v1!26 () B!1956)

(declare-fun e!720419 () Bool)

(declare-fun b!1265078 () Bool)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun isStrictlySorted!783 (List!28305) Bool)

(declare-fun insertStrictlySorted!461 (List!28305 (_ BitVec 64) B!1956) List!28305)

(assert (=> b!1265078 (= e!720419 (not (isStrictlySorted!783 (insertStrictlySorted!461 l!706 key1!31 v1!26))))))

(declare-fun removeStrictlySorted!154 (List!28305 (_ BitVec 64)) List!28305)

(assert (=> b!1265078 (= (removeStrictlySorted!154 (insertStrictlySorted!461 (t!41826 l!706) key1!31 v1!26) key1!31) (t!41826 l!706))))

(declare-datatypes ((Unit!42181 0))(
  ( (Unit!42182) )
))
(declare-fun lt!574011 () Unit!42181)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!9 (List!28305 (_ BitVec 64) B!1956) Unit!42181)

(assert (=> b!1265078 (= lt!574011 (lemmaInsertStrictlySortedThenRemoveIsSame!9 (t!41826 l!706) key1!31 v1!26))))

(declare-fun res!842416 () Bool)

(assert (=> start!106358 (=> (not res!842416) (not e!720419))))

(assert (=> start!106358 (= res!842416 (isStrictlySorted!783 l!706))))

(assert (=> start!106358 e!720419))

(declare-fun e!720418 () Bool)

(assert (=> start!106358 e!720418))

(assert (=> start!106358 true))

(declare-fun tp_is_empty!32489 () Bool)

(assert (=> start!106358 tp_is_empty!32489))

(declare-fun b!1265079 () Bool)

(declare-fun res!842415 () Bool)

(assert (=> b!1265079 (=> (not res!842415) (not e!720419))))

(declare-fun containsKey!642 (List!28305 (_ BitVec 64)) Bool)

(assert (=> b!1265079 (= res!842415 (not (containsKey!642 (t!41826 l!706) key1!31)))))

(declare-fun b!1265080 () Bool)

(declare-fun tp!96299 () Bool)

(assert (=> b!1265080 (= e!720418 (and tp_is_empty!32489 tp!96299))))

(declare-fun b!1265081 () Bool)

(declare-fun res!842414 () Bool)

(assert (=> b!1265081 (=> (not res!842414) (not e!720419))))

(assert (=> b!1265081 (= res!842414 (is-Cons!28301 l!706))))

(declare-fun b!1265082 () Bool)

(declare-fun res!842412 () Bool)

(assert (=> b!1265082 (=> (not res!842412) (not e!720419))))

(assert (=> b!1265082 (= res!842412 (not (containsKey!642 l!706 key1!31)))))

(declare-fun b!1265083 () Bool)

(declare-fun res!842413 () Bool)

(assert (=> b!1265083 (=> (not res!842413) (not e!720419))))

(assert (=> b!1265083 (= res!842413 (isStrictlySorted!783 (t!41826 l!706)))))

(assert (= (and start!106358 res!842416) b!1265082))

(assert (= (and b!1265082 res!842412) b!1265081))

(assert (= (and b!1265081 res!842414) b!1265083))

(assert (= (and b!1265083 res!842413) b!1265079))

(assert (= (and b!1265079 res!842415) b!1265078))

(assert (= (and start!106358 (is-Cons!28301 l!706)) b!1265080))

(declare-fun m!1165449 () Bool)

(assert (=> b!1265083 m!1165449))

(declare-fun m!1165451 () Bool)

(assert (=> b!1265082 m!1165451))

(declare-fun m!1165453 () Bool)

(assert (=> b!1265078 m!1165453))

(declare-fun m!1165455 () Bool)

(assert (=> b!1265078 m!1165455))

(declare-fun m!1165457 () Bool)

(assert (=> b!1265078 m!1165457))

(declare-fun m!1165459 () Bool)

(assert (=> b!1265078 m!1165459))

(assert (=> b!1265078 m!1165457))

(declare-fun m!1165461 () Bool)

(assert (=> b!1265078 m!1165461))

(assert (=> b!1265078 m!1165453))

(declare-fun m!1165463 () Bool)

(assert (=> b!1265079 m!1165463))

(declare-fun m!1165465 () Bool)

(assert (=> start!106358 m!1165465))

(push 1)

(assert tp_is_empty!32489)

(assert (not b!1265083))

(assert (not b!1265080))

(assert (not start!106358))

(assert (not b!1265078))

(assert (not b!1265079))

(assert (not b!1265082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138845 () Bool)

(declare-fun res!842429 () Bool)

(declare-fun e!720432 () Bool)

(assert (=> d!138845 (=> res!842429 e!720432)))

(assert (=> d!138845 (= res!842429 (or (is-Nil!28302 (t!41826 l!706)) (is-Nil!28302 (t!41826 (t!41826 l!706)))))))

(assert (=> d!138845 (= (isStrictlySorted!783 (t!41826 l!706)) e!720432)))

(declare-fun b!1265096 () Bool)

(declare-fun e!720433 () Bool)

(assert (=> b!1265096 (= e!720432 e!720433)))

(declare-fun res!842430 () Bool)

(assert (=> b!1265096 (=> (not res!842430) (not e!720433))))

(assert (=> b!1265096 (= res!842430 (bvslt (_1!10583 (h!29510 (t!41826 l!706))) (_1!10583 (h!29510 (t!41826 (t!41826 l!706))))))))

(declare-fun b!1265097 () Bool)

(assert (=> b!1265097 (= e!720433 (isStrictlySorted!783 (t!41826 (t!41826 l!706))))))

(assert (= (and d!138845 (not res!842429)) b!1265096))

(assert (= (and b!1265096 res!842430) b!1265097))

(declare-fun m!1165467 () Bool)

(assert (=> b!1265097 m!1165467))

(assert (=> b!1265083 d!138845))

(declare-fun b!1265130 () Bool)

(declare-fun e!720464 () Bool)

(declare-fun lt!574014 () List!28305)

(assert (=> b!1265130 (= e!720464 (not (containsKey!642 lt!574014 key1!31)))))

(declare-fun b!1265131 () Bool)

(declare-fun e!720463 () List!28305)

(assert (=> b!1265131 (= e!720463 Nil!28302)))

(declare-fun b!1265132 () Bool)

(declare-fun e!720462 () List!28305)

(assert (=> b!1265132 (= e!720462 e!720463)))

(declare-fun c!123222 () Bool)

(assert (=> b!1265132 (= c!123222 (and (is-Cons!28301 (insertStrictlySorted!461 (t!41826 l!706) key1!31 v1!26)) (not (= (_1!10583 (h!29510 (insertStrictlySorted!461 (t!41826 l!706) key1!31 v1!26))) key1!31))))))

(declare-fun b!1265133 () Bool)

(declare-fun $colon$colon!635 (List!28305 tuple2!21144) List!28305)

(assert (=> b!1265133 (= e!720463 ($colon$colon!635 (removeStrictlySorted!154 (t!41826 (insertStrictlySorted!461 (t!41826 l!706) key1!31 v1!26)) key1!31) (h!29510 (insertStrictlySorted!461 (t!41826 l!706) key1!31 v1!26))))))

(declare-fun d!138849 () Bool)

(assert (=> d!138849 e!720464))

(declare-fun res!842455 () Bool)

(assert (=> d!138849 (=> (not res!842455) (not e!720464))))

(assert (=> d!138849 (= res!842455 (isStrictlySorted!783 lt!574014))))

(assert (=> d!138849 (= lt!574014 e!720462)))

(declare-fun c!123223 () Bool)

(assert (=> d!138849 (= c!123223 (and (is-Cons!28301 (insertStrictlySorted!461 (t!41826 l!706) key1!31 v1!26)) (= (_1!10583 (h!29510 (insertStrictlySorted!461 (t!41826 l!706) key1!31 v1!26))) key1!31)))))

(assert (=> d!138849 (isStrictlySorted!783 (insertStrictlySorted!461 (t!41826 l!706) key1!31 v1!26))))

(assert (=> d!138849 (= (removeStrictlySorted!154 (insertStrictlySorted!461 (t!41826 l!706) key1!31 v1!26) key1!31) lt!574014)))

(declare-fun b!1265134 () Bool)

(assert (=> b!1265134 (= e!720462 (t!41826 (insertStrictlySorted!461 (t!41826 l!706) key1!31 v1!26)))))

(assert (= (and d!138849 c!123223) b!1265134))

(assert (= (and d!138849 (not c!123223)) b!1265132))

(assert (= (and b!1265132 c!123222) b!1265133))

(assert (= (and b!1265132 (not c!123222)) b!1265131))

(assert (= (and d!138849 res!842455) b!1265130))

(declare-fun m!1165477 () Bool)

(assert (=> b!1265130 m!1165477))

(declare-fun m!1165479 () Bool)

(assert (=> b!1265133 m!1165479))

(assert (=> b!1265133 m!1165479))

(declare-fun m!1165481 () Bool)

(assert (=> b!1265133 m!1165481))

(declare-fun m!1165483 () Bool)

(assert (=> d!138849 m!1165483))

(assert (=> d!138849 m!1165457))

(declare-fun m!1165485 () Bool)

(assert (=> d!138849 m!1165485))

(assert (=> b!1265078 d!138849))

(declare-fun e!720513 () List!28305)

(declare-fun c!123262 () Bool)

(declare-fun b!1265218 () Bool)

(declare-fun c!123263 () Bool)

(assert (=> b!1265218 (= e!720513 (ite c!123262 (t!41826 l!706) (ite c!123263 (Cons!28301 (h!29510 l!706) (t!41826 l!706)) Nil!28302)))))

(declare-fun b!1265219 () Bool)

(declare-fun e!720510 () List!28305)

(declare-fun e!720509 () List!28305)

(assert (=> b!1265219 (= e!720510 e!720509)))

(assert (=> b!1265219 (= c!123262 (and (is-Cons!28301 l!706) (= (_1!10583 (h!29510 l!706)) key1!31)))))

(declare-fun b!1265220 () Bool)

(declare-fun res!842466 () Bool)

(declare-fun e!720512 () Bool)

(assert (=> b!1265220 (=> (not res!842466) (not e!720512))))

(declare-fun lt!574027 () List!28305)

(assert (=> b!1265220 (= res!842466 (containsKey!642 lt!574027 key1!31))))

(declare-fun b!1265221 () Bool)

(assert (=> b!1265221 (= c!123263 (and (is-Cons!28301 l!706) (bvsgt (_1!10583 (h!29510 l!706)) key1!31)))))

(declare-fun e!720511 () List!28305)

(assert (=> b!1265221 (= e!720509 e!720511)))

(declare-fun call!62379 () List!28305)

(declare-fun c!123260 () Bool)

(declare-fun bm!62375 () Bool)

(assert (=> bm!62375 (= call!62379 ($colon$colon!635 e!720513 (ite c!123260 (h!29510 l!706) (tuple2!21145 key1!31 v1!26))))))

(declare-fun c!123261 () Bool)

(assert (=> bm!62375 (= c!123261 c!123260)))

(declare-fun b!1265222 () Bool)

(assert (=> b!1265222 (= e!720510 call!62379)))

(declare-fun bm!62376 () Bool)

(declare-fun call!62380 () List!28305)

(declare-fun call!62378 () List!28305)

(assert (=> bm!62376 (= call!62380 call!62378)))

(declare-fun bm!62377 () Bool)

(assert (=> bm!62377 (= call!62378 call!62379)))

(declare-fun b!1265217 () Bool)

(assert (=> b!1265217 (= e!720509 call!62378)))

(declare-fun d!138865 () Bool)

(assert (=> d!138865 e!720512))

(declare-fun res!842467 () Bool)

(assert (=> d!138865 (=> (not res!842467) (not e!720512))))

(assert (=> d!138865 (= res!842467 (isStrictlySorted!783 lt!574027))))

(assert (=> d!138865 (= lt!574027 e!720510)))

(assert (=> d!138865 (= c!123260 (and (is-Cons!28301 l!706) (bvslt (_1!10583 (h!29510 l!706)) key1!31)))))

(assert (=> d!138865 (isStrictlySorted!783 l!706)))

(assert (=> d!138865 (= (insertStrictlySorted!461 l!706 key1!31 v1!26) lt!574027)))

(declare-fun b!1265223 () Bool)

(assert (=> b!1265223 (= e!720511 call!62380)))

(declare-fun b!1265224 () Bool)

(assert (=> b!1265224 (= e!720513 (insertStrictlySorted!461 (t!41826 l!706) key1!31 v1!26))))

(declare-fun b!1265225 () Bool)

(declare-fun contains!7636 (List!28305 tuple2!21144) Bool)

(assert (=> b!1265225 (= e!720512 (contains!7636 lt!574027 (tuple2!21145 key1!31 v1!26)))))

(declare-fun b!1265226 () Bool)

(assert (=> b!1265226 (= e!720511 call!62380)))

(assert (= (and d!138865 c!123260) b!1265222))

(assert (= (and d!138865 (not c!123260)) b!1265219))

(assert (= (and b!1265219 c!123262) b!1265217))

(assert (= (and b!1265219 (not c!123262)) b!1265221))

(assert (= (and b!1265221 c!123263) b!1265226))

(assert (= (and b!1265221 (not c!123263)) b!1265223))

(assert (= (or b!1265226 b!1265223) bm!62376))

(assert (= (or b!1265217 bm!62376) bm!62377))

(assert (= (or b!1265222 bm!62377) bm!62375))

(assert (= (and bm!62375 c!123261) b!1265224))

(assert (= (and bm!62375 (not c!123261)) b!1265218))

(assert (= (and d!138865 res!842467) b!1265220))

(assert (= (and b!1265220 res!842466) b!1265225))

(declare-fun m!1165507 () Bool)

(assert (=> b!1265225 m!1165507))

(assert (=> b!1265224 m!1165457))

(declare-fun m!1165509 () Bool)

(assert (=> bm!62375 m!1165509))

(declare-fun m!1165511 () Bool)

(assert (=> d!138865 m!1165511))

(assert (=> d!138865 m!1165465))

(declare-fun m!1165513 () Bool)

(assert (=> b!1265220 m!1165513))

(assert (=> b!1265078 d!138865))

(declare-fun d!138871 () Bool)

(assert (=> d!138871 (= (removeStrictlySorted!154 (insertStrictlySorted!461 (t!41826 l!706) key1!31 v1!26) key1!31) (t!41826 l!706))))

(declare-fun lt!574032 () Unit!42181)

(declare-fun choose!1883 (List!28305 (_ BitVec 64) B!1956) Unit!42181)

(assert (=> d!138871 (= lt!574032 (choose!1883 (t!41826 l!706) key1!31 v1!26))))

(assert (=> d!138871 (isStrictlySorted!783 (t!41826 l!706))))

(assert (=> d!138871 (= (lemmaInsertStrictlySortedThenRemoveIsSame!9 (t!41826 l!706) key1!31 v1!26) lt!574032)))

(declare-fun bs!35810 () Bool)

(assert (= bs!35810 d!138871))

(assert (=> bs!35810 m!1165457))

(assert (=> bs!35810 m!1165457))

(assert (=> bs!35810 m!1165461))

(declare-fun m!1165523 () Bool)

(assert (=> bs!35810 m!1165523))

(assert (=> bs!35810 m!1165449))

(assert (=> b!1265078 d!138871))

(declare-fun c!123275 () Bool)

(declare-fun b!1265256 () Bool)

(declare-fun c!123274 () Bool)

(declare-fun e!720532 () List!28305)

(assert (=> b!1265256 (= e!720532 (ite c!123274 (t!41826 (t!41826 l!706)) (ite c!123275 (Cons!28301 (h!29510 (t!41826 l!706)) (t!41826 (t!41826 l!706))) Nil!28302)))))

(declare-fun b!1265257 () Bool)

(declare-fun e!720529 () List!28305)

(declare-fun e!720528 () List!28305)

(assert (=> b!1265257 (= e!720529 e!720528)))

(assert (=> b!1265257 (= c!123274 (and (is-Cons!28301 (t!41826 l!706)) (= (_1!10583 (h!29510 (t!41826 l!706))) key1!31)))))

(declare-fun b!1265258 () Bool)

(declare-fun res!842480 () Bool)

(declare-fun e!720531 () Bool)

(assert (=> b!1265258 (=> (not res!842480) (not e!720531))))

(declare-fun lt!574033 () List!28305)

(assert (=> b!1265258 (= res!842480 (containsKey!642 lt!574033 key1!31))))

(declare-fun b!1265259 () Bool)

(assert (=> b!1265259 (= c!123275 (and (is-Cons!28301 (t!41826 l!706)) (bvsgt (_1!10583 (h!29510 (t!41826 l!706))) key1!31)))))

(declare-fun e!720530 () List!28305)

(assert (=> b!1265259 (= e!720528 e!720530)))

(declare-fun bm!62384 () Bool)

(declare-fun call!62388 () List!28305)

(declare-fun c!123272 () Bool)

(assert (=> bm!62384 (= call!62388 ($colon$colon!635 e!720532 (ite c!123272 (h!29510 (t!41826 l!706)) (tuple2!21145 key1!31 v1!26))))))

(declare-fun c!123273 () Bool)

(assert (=> bm!62384 (= c!123273 c!123272)))

(declare-fun b!1265260 () Bool)

(assert (=> b!1265260 (= e!720529 call!62388)))

(declare-fun bm!62385 () Bool)

(declare-fun call!62389 () List!28305)

(declare-fun call!62387 () List!28305)

(assert (=> bm!62385 (= call!62389 call!62387)))

(declare-fun bm!62386 () Bool)

(assert (=> bm!62386 (= call!62387 call!62388)))

(declare-fun b!1265255 () Bool)

(assert (=> b!1265255 (= e!720528 call!62387)))

(declare-fun d!138873 () Bool)

(assert (=> d!138873 e!720531))

(declare-fun res!842481 () Bool)

(assert (=> d!138873 (=> (not res!842481) (not e!720531))))

(assert (=> d!138873 (= res!842481 (isStrictlySorted!783 lt!574033))))

(assert (=> d!138873 (= lt!574033 e!720529)))

(assert (=> d!138873 (= c!123272 (and (is-Cons!28301 (t!41826 l!706)) (bvslt (_1!10583 (h!29510 (t!41826 l!706))) key1!31)))))

(assert (=> d!138873 (isStrictlySorted!783 (t!41826 l!706))))

(assert (=> d!138873 (= (insertStrictlySorted!461 (t!41826 l!706) key1!31 v1!26) lt!574033)))

(declare-fun b!1265261 () Bool)

(assert (=> b!1265261 (= e!720530 call!62389)))

(declare-fun b!1265262 () Bool)

(assert (=> b!1265262 (= e!720532 (insertStrictlySorted!461 (t!41826 (t!41826 l!706)) key1!31 v1!26))))

(declare-fun b!1265263 () Bool)

(assert (=> b!1265263 (= e!720531 (contains!7636 lt!574033 (tuple2!21145 key1!31 v1!26)))))

(declare-fun b!1265264 () Bool)

(assert (=> b!1265264 (= e!720530 call!62389)))

(assert (= (and d!138873 c!123272) b!1265260))

(assert (= (and d!138873 (not c!123272)) b!1265257))

(assert (= (and b!1265257 c!123274) b!1265255))

(assert (= (and b!1265257 (not c!123274)) b!1265259))

(assert (= (and b!1265259 c!123275) b!1265264))

(assert (= (and b!1265259 (not c!123275)) b!1265261))

(assert (= (or b!1265264 b!1265261) bm!62385))

(assert (= (or b!1265255 bm!62385) bm!62386))

(assert (= (or b!1265260 bm!62386) bm!62384))

(assert (= (and bm!62384 c!123273) b!1265262))

(assert (= (and bm!62384 (not c!123273)) b!1265256))

(assert (= (and d!138873 res!842481) b!1265258))

(assert (= (and b!1265258 res!842480) b!1265263))

(declare-fun m!1165533 () Bool)

(assert (=> b!1265263 m!1165533))

(declare-fun m!1165535 () Bool)

(assert (=> b!1265262 m!1165535))

(declare-fun m!1165537 () Bool)

(assert (=> bm!62384 m!1165537))

(declare-fun m!1165539 () Bool)

(assert (=> d!138873 m!1165539))

(assert (=> d!138873 m!1165449))

(declare-fun m!1165541 () Bool)

(assert (=> b!1265258 m!1165541))

(assert (=> b!1265078 d!138873))

(declare-fun d!138879 () Bool)

(declare-fun res!842482 () Bool)

(declare-fun e!720533 () Bool)

(assert (=> d!138879 (=> res!842482 e!720533)))

(assert (=> d!138879 (= res!842482 (or (is-Nil!28302 (insertStrictlySorted!461 l!706 key1!31 v1!26)) (is-Nil!28302 (t!41826 (insertStrictlySorted!461 l!706 key1!31 v1!26)))))))

(assert (=> d!138879 (= (isStrictlySorted!783 (insertStrictlySorted!461 l!706 key1!31 v1!26)) e!720533)))

(declare-fun b!1265265 () Bool)

(declare-fun e!720534 () Bool)

(assert (=> b!1265265 (= e!720533 e!720534)))

(declare-fun res!842483 () Bool)

(assert (=> b!1265265 (=> (not res!842483) (not e!720534))))

(assert (=> b!1265265 (= res!842483 (bvslt (_1!10583 (h!29510 (insertStrictlySorted!461 l!706 key1!31 v1!26))) (_1!10583 (h!29510 (t!41826 (insertStrictlySorted!461 l!706 key1!31 v1!26))))))))

(declare-fun b!1265266 () Bool)

(assert (=> b!1265266 (= e!720534 (isStrictlySorted!783 (t!41826 (insertStrictlySorted!461 l!706 key1!31 v1!26))))))

(assert (= (and d!138879 (not res!842482)) b!1265265))

(assert (= (and b!1265265 res!842483) b!1265266))

(declare-fun m!1165543 () Bool)

(assert (=> b!1265266 m!1165543))

(assert (=> b!1265078 d!138879))

(declare-fun d!138881 () Bool)

(declare-fun res!842492 () Bool)

(declare-fun e!720549 () Bool)

(assert (=> d!138881 (=> res!842492 e!720549)))

(assert (=> d!138881 (= res!842492 (and (is-Cons!28301 l!706) (= (_1!10583 (h!29510 l!706)) key1!31)))))

(assert (=> d!138881 (= (containsKey!642 l!706 key1!31) e!720549)))

(declare-fun b!1265291 () Bool)

(declare-fun e!720550 () Bool)

(assert (=> b!1265291 (= e!720549 e!720550)))

(declare-fun res!842493 () Bool)

(assert (=> b!1265291 (=> (not res!842493) (not e!720550))))

(assert (=> b!1265291 (= res!842493 (and (or (not (is-Cons!28301 l!706)) (bvsle (_1!10583 (h!29510 l!706)) key1!31)) (is-Cons!28301 l!706) (bvslt (_1!10583 (h!29510 l!706)) key1!31)))))

(declare-fun b!1265292 () Bool)

(assert (=> b!1265292 (= e!720550 (containsKey!642 (t!41826 l!706) key1!31))))

(assert (= (and d!138881 (not res!842492)) b!1265291))

(assert (= (and b!1265291 res!842493) b!1265292))

(assert (=> b!1265292 m!1165463))

(assert (=> b!1265082 d!138881))

(declare-fun d!138889 () Bool)

(declare-fun res!842496 () Bool)

(declare-fun e!720553 () Bool)

(assert (=> d!138889 (=> res!842496 e!720553)))

(assert (=> d!138889 (= res!842496 (or (is-Nil!28302 l!706) (is-Nil!28302 (t!41826 l!706))))))

(assert (=> d!138889 (= (isStrictlySorted!783 l!706) e!720553)))

(declare-fun b!1265295 () Bool)

(declare-fun e!720554 () Bool)

(assert (=> b!1265295 (= e!720553 e!720554)))

(declare-fun res!842497 () Bool)

(assert (=> b!1265295 (=> (not res!842497) (not e!720554))))

(assert (=> b!1265295 (= res!842497 (bvslt (_1!10583 (h!29510 l!706)) (_1!10583 (h!29510 (t!41826 l!706)))))))

(declare-fun b!1265296 () Bool)

(assert (=> b!1265296 (= e!720554 (isStrictlySorted!783 (t!41826 l!706)))))

(assert (= (and d!138889 (not res!842496)) b!1265295))

(assert (= (and b!1265295 res!842497) b!1265296))

(assert (=> b!1265296 m!1165449))

(assert (=> start!106358 d!138889))

(declare-fun d!138894 () Bool)

(declare-fun res!842501 () Bool)

(declare-fun e!720558 () Bool)

(assert (=> d!138894 (=> res!842501 e!720558)))

(assert (=> d!138894 (= res!842501 (and (is-Cons!28301 (t!41826 l!706)) (= (_1!10583 (h!29510 (t!41826 l!706))) key1!31)))))

(assert (=> d!138894 (= (containsKey!642 (t!41826 l!706) key1!31) e!720558)))

(declare-fun b!1265300 () Bool)

(declare-fun e!720560 () Bool)

(assert (=> b!1265300 (= e!720558 e!720560)))

(declare-fun res!842503 () Bool)

(assert (=> b!1265300 (=> (not res!842503) (not e!720560))))

(assert (=> b!1265300 (= res!842503 (and (or (not (is-Cons!28301 (t!41826 l!706))) (bvsle (_1!10583 (h!29510 (t!41826 l!706))) key1!31)) (is-Cons!28301 (t!41826 l!706)) (bvslt (_1!10583 (h!29510 (t!41826 l!706))) key1!31)))))

