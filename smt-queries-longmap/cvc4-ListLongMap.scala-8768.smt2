; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106562 () Bool)

(assert start!106562)

(declare-fun b!1266437 () Bool)

(declare-fun res!843154 () Bool)

(declare-fun e!721315 () Bool)

(assert (=> b!1266437 (=> (not res!843154) (not e!721315))))

(declare-datatypes ((B!2004 0))(
  ( (B!2005 (val!16337 Int)) )
))
(declare-datatypes ((tuple2!21192 0))(
  ( (tuple2!21193 (_1!10607 (_ BitVec 64)) (_2!10607 B!2004)) )
))
(declare-datatypes ((List!28329 0))(
  ( (Nil!28326) (Cons!28325 (h!29534 tuple2!21192) (t!41853 List!28329)) )
))
(declare-fun l!706 () List!28329)

(assert (=> b!1266437 (= res!843154 (not (is-Cons!28325 l!706)))))

(declare-fun b!1266436 () Bool)

(declare-fun res!843152 () Bool)

(assert (=> b!1266436 (=> (not res!843152) (not e!721315))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!663 (List!28329 (_ BitVec 64)) Bool)

(assert (=> b!1266436 (= res!843152 (not (containsKey!663 l!706 key1!31)))))

(declare-fun b!1266438 () Bool)

(declare-fun v1!26 () B!2004)

(declare-fun removeStrictlySorted!160 (List!28329 (_ BitVec 64)) List!28329)

(declare-fun insertStrictlySorted!470 (List!28329 (_ BitVec 64) B!2004) List!28329)

(assert (=> b!1266438 (= e!721315 (not (= (removeStrictlySorted!160 (insertStrictlySorted!470 l!706 key1!31 v1!26) key1!31) l!706)))))

(declare-fun b!1266439 () Bool)

(declare-fun e!721316 () Bool)

(declare-fun tp_is_empty!32537 () Bool)

(declare-fun tp!96437 () Bool)

(assert (=> b!1266439 (= e!721316 (and tp_is_empty!32537 tp!96437))))

(declare-fun res!843153 () Bool)

(assert (=> start!106562 (=> (not res!843153) (not e!721315))))

(declare-fun isStrictlySorted!804 (List!28329) Bool)

(assert (=> start!106562 (= res!843153 (isStrictlySorted!804 l!706))))

(assert (=> start!106562 e!721315))

(assert (=> start!106562 e!721316))

(assert (=> start!106562 true))

(assert (=> start!106562 tp_is_empty!32537))

(assert (= (and start!106562 res!843153) b!1266436))

(assert (= (and b!1266436 res!843152) b!1266437))

(assert (= (and b!1266437 res!843154) b!1266438))

(assert (= (and start!106562 (is-Cons!28325 l!706)) b!1266439))

(declare-fun m!1166191 () Bool)

(assert (=> b!1266436 m!1166191))

(declare-fun m!1166193 () Bool)

(assert (=> b!1266438 m!1166193))

(assert (=> b!1266438 m!1166193))

(declare-fun m!1166195 () Bool)

(assert (=> b!1266438 m!1166195))

(declare-fun m!1166197 () Bool)

(assert (=> start!106562 m!1166197))

(push 1)

(assert (not b!1266439))

(assert tp_is_empty!32537)

(assert (not b!1266438))

(assert (not b!1266436))

(assert (not start!106562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139221 () Bool)

(declare-fun res!843165 () Bool)

(declare-fun e!721327 () Bool)

(assert (=> d!139221 (=> res!843165 e!721327)))

(assert (=> d!139221 (= res!843165 (or (is-Nil!28326 l!706) (is-Nil!28326 (t!41853 l!706))))))

(assert (=> d!139221 (= (isStrictlySorted!804 l!706) e!721327)))

(declare-fun b!1266450 () Bool)

(declare-fun e!721328 () Bool)

(assert (=> b!1266450 (= e!721327 e!721328)))

(declare-fun res!843166 () Bool)

(assert (=> b!1266450 (=> (not res!843166) (not e!721328))))

(assert (=> b!1266450 (= res!843166 (bvslt (_1!10607 (h!29534 l!706)) (_1!10607 (h!29534 (t!41853 l!706)))))))

(declare-fun b!1266451 () Bool)

(assert (=> b!1266451 (= e!721328 (isStrictlySorted!804 (t!41853 l!706)))))

(assert (= (and d!139221 (not res!843165)) b!1266450))

(assert (= (and b!1266450 res!843166) b!1266451))

(declare-fun m!1166201 () Bool)

(assert (=> b!1266451 m!1166201))

(assert (=> start!106562 d!139221))

(declare-fun e!721351 () List!28329)

(declare-fun b!1266487 () Bool)

(assert (=> b!1266487 (= e!721351 (t!41853 (insertStrictlySorted!470 l!706 key1!31 v1!26)))))

(declare-fun b!1266488 () Bool)

(declare-fun e!721350 () List!28329)

(assert (=> b!1266488 (= e!721351 e!721350)))

(declare-fun c!123453 () Bool)

(assert (=> b!1266488 (= c!123453 (and (is-Cons!28325 (insertStrictlySorted!470 l!706 key1!31 v1!26)) (not (= (_1!10607 (h!29534 (insertStrictlySorted!470 l!706 key1!31 v1!26))) key1!31))))))

(declare-fun b!1266489 () Bool)

(assert (=> b!1266489 (= e!721350 Nil!28326)))

(declare-fun b!1266491 () Bool)

(declare-fun e!721353 () Bool)

(declare-fun lt!574142 () List!28329)

(assert (=> b!1266491 (= e!721353 (not (containsKey!663 lt!574142 key1!31)))))

(declare-fun b!1266490 () Bool)

(declare-fun $colon$colon!646 (List!28329 tuple2!21192) List!28329)

(assert (=> b!1266490 (= e!721350 ($colon$colon!646 (removeStrictlySorted!160 (t!41853 (insertStrictlySorted!470 l!706 key1!31 v1!26)) key1!31) (h!29534 (insertStrictlySorted!470 l!706 key1!31 v1!26))))))

(declare-fun d!139227 () Bool)

(assert (=> d!139227 e!721353))

(declare-fun res!843174 () Bool)

(assert (=> d!139227 (=> (not res!843174) (not e!721353))))

(assert (=> d!139227 (= res!843174 (isStrictlySorted!804 lt!574142))))

(assert (=> d!139227 (= lt!574142 e!721351)))

(declare-fun c!123451 () Bool)

(assert (=> d!139227 (= c!123451 (and (is-Cons!28325 (insertStrictlySorted!470 l!706 key1!31 v1!26)) (= (_1!10607 (h!29534 (insertStrictlySorted!470 l!706 key1!31 v1!26))) key1!31)))))

(assert (=> d!139227 (isStrictlySorted!804 (insertStrictlySorted!470 l!706 key1!31 v1!26))))

(assert (=> d!139227 (= (removeStrictlySorted!160 (insertStrictlySorted!470 l!706 key1!31 v1!26) key1!31) lt!574142)))

(assert (= (and d!139227 c!123451) b!1266487))

(assert (= (and d!139227 (not c!123451)) b!1266488))

(assert (= (and b!1266488 c!123453) b!1266490))

(assert (= (and b!1266488 (not c!123453)) b!1266489))

(assert (= (and d!139227 res!843174) b!1266491))

(declare-fun m!1166213 () Bool)

(assert (=> b!1266491 m!1166213))

(declare-fun m!1166217 () Bool)

(assert (=> b!1266490 m!1166217))

(assert (=> b!1266490 m!1166217))

(declare-fun m!1166223 () Bool)

(assert (=> b!1266490 m!1166223))

(declare-fun m!1166225 () Bool)

(assert (=> d!139227 m!1166225))

(assert (=> d!139227 m!1166193))

(declare-fun m!1166229 () Bool)

(assert (=> d!139227 m!1166229))

(assert (=> b!1266438 d!139227))

(declare-fun b!1266567 () Bool)

(declare-fun e!721394 () List!28329)

(declare-fun call!62491 () List!28329)

(assert (=> b!1266567 (= e!721394 call!62491)))

(declare-fun c!123486 () Bool)

(declare-fun b!1266568 () Bool)

(declare-fun c!123484 () Bool)

(declare-fun e!721395 () List!28329)

(assert (=> b!1266568 (= e!721395 (ite c!123486 (t!41853 l!706) (ite c!123484 (Cons!28325 (h!29534 l!706) (t!41853 l!706)) Nil!28326)))))

(declare-fun c!123485 () Bool)

(declare-fun bm!62486 () Bool)

(assert (=> bm!62486 (= call!62491 ($colon$colon!646 e!721395 (ite c!123485 (h!29534 l!706) (tuple2!21193 key1!31 v1!26))))))

(declare-fun c!123483 () Bool)

(assert (=> bm!62486 (= c!123483 c!123485)))

(declare-fun b!1266569 () Bool)

(assert (=> b!1266569 (= c!123484 (and (is-Cons!28325 l!706) (bvsgt (_1!10607 (h!29534 l!706)) key1!31)))))

(declare-fun e!721393 () List!28329)

(declare-fun e!721392 () List!28329)

(assert (=> b!1266569 (= e!721393 e!721392)))

(declare-fun d!139231 () Bool)

(declare-fun e!721391 () Bool)

(assert (=> d!139231 e!721391))

(declare-fun res!843191 () Bool)

(assert (=> d!139231 (=> (not res!843191) (not e!721391))))

(declare-fun lt!574151 () List!28329)

(assert (=> d!139231 (= res!843191 (isStrictlySorted!804 lt!574151))))

(assert (=> d!139231 (= lt!574151 e!721394)))

(assert (=> d!139231 (= c!123485 (and (is-Cons!28325 l!706) (bvslt (_1!10607 (h!29534 l!706)) key1!31)))))

(assert (=> d!139231 (isStrictlySorted!804 l!706)))

(assert (=> d!139231 (= (insertStrictlySorted!470 l!706 key1!31 v1!26) lt!574151)))

(declare-fun b!1266570 () Bool)

(declare-fun res!843190 () Bool)

(assert (=> b!1266570 (=> (not res!843190) (not e!721391))))

(assert (=> b!1266570 (= res!843190 (containsKey!663 lt!574151 key1!31))))

(declare-fun b!1266571 () Bool)

(declare-fun call!62490 () List!28329)

(assert (=> b!1266571 (= e!721392 call!62490)))

(declare-fun b!1266572 () Bool)

(assert (=> b!1266572 (= e!721394 e!721393)))

(assert (=> b!1266572 (= c!123486 (and (is-Cons!28325 l!706) (= (_1!10607 (h!29534 l!706)) key1!31)))))

(declare-fun b!1266573 () Bool)

(declare-fun call!62489 () List!28329)

(assert (=> b!1266573 (= e!721393 call!62489)))

(declare-fun b!1266574 () Bool)

(declare-fun contains!7645 (List!28329 tuple2!21192) Bool)

(assert (=> b!1266574 (= e!721391 (contains!7645 lt!574151 (tuple2!21193 key1!31 v1!26)))))

(declare-fun b!1266575 () Bool)

(assert (=> b!1266575 (= e!721392 call!62490)))

(declare-fun b!1266576 () Bool)

(assert (=> b!1266576 (= e!721395 (insertStrictlySorted!470 (t!41853 l!706) key1!31 v1!26))))

(declare-fun bm!62487 () Bool)

(assert (=> bm!62487 (= call!62490 call!62489)))

(declare-fun bm!62488 () Bool)

(assert (=> bm!62488 (= call!62489 call!62491)))

(assert (= (and d!139231 c!123485) b!1266567))

(assert (= (and d!139231 (not c!123485)) b!1266572))

(assert (= (and b!1266572 c!123486) b!1266573))

(assert (= (and b!1266572 (not c!123486)) b!1266569))

(assert (= (and b!1266569 c!123484) b!1266575))

(assert (= (and b!1266569 (not c!123484)) b!1266571))

(assert (= (or b!1266575 b!1266571) bm!62487))

(assert (= (or b!1266573 bm!62487) bm!62488))

(assert (= (or b!1266567 bm!62488) bm!62486))

(assert (= (and bm!62486 c!123483) b!1266576))

(assert (= (and bm!62486 (not c!123483)) b!1266568))

(assert (= (and d!139231 res!843191) b!1266570))

(assert (= (and b!1266570 res!843190) b!1266574))

(declare-fun m!1166243 () Bool)

(assert (=> b!1266576 m!1166243))

(declare-fun m!1166245 () Bool)

(assert (=> b!1266570 m!1166245))

(declare-fun m!1166247 () Bool)

(assert (=> b!1266574 m!1166247))

(declare-fun m!1166249 () Bool)

(assert (=> bm!62486 m!1166249))

(declare-fun m!1166251 () Bool)

(assert (=> d!139231 m!1166251))

(assert (=> d!139231 m!1166197))

(assert (=> b!1266438 d!139231))

(declare-fun d!139237 () Bool)

(declare-fun res!843212 () Bool)

(declare-fun e!721419 () Bool)

(assert (=> d!139237 (=> res!843212 e!721419)))

(assert (=> d!139237 (= res!843212 (and (is-Cons!28325 l!706) (= (_1!10607 (h!29534 l!706)) key1!31)))))

(assert (=> d!139237 (= (containsKey!663 l!706 key1!31) e!721419)))

(declare-fun b!1266605 () Bool)

(declare-fun e!721420 () Bool)

(assert (=> b!1266605 (= e!721419 e!721420)))

(declare-fun res!843213 () Bool)

(assert (=> b!1266605 (=> (not res!843213) (not e!721420))))

(assert (=> b!1266605 (= res!843213 (and (or (not (is-Cons!28325 l!706)) (bvsle (_1!10607 (h!29534 l!706)) key1!31)) (is-Cons!28325 l!706) (bvslt (_1!10607 (h!29534 l!706)) key1!31)))))

(declare-fun b!1266606 () Bool)

(assert (=> b!1266606 (= e!721420 (containsKey!663 (t!41853 l!706) key1!31))))

(assert (= (and d!139237 (not res!843212)) b!1266605))

(assert (= (and b!1266605 res!843213) b!1266606))

(declare-fun m!1166265 () Bool)

(assert (=> b!1266606 m!1166265))

(assert (=> b!1266436 d!139237))

(declare-fun b!1266623 () Bool)

(declare-fun e!721431 () Bool)

(declare-fun tp!96444 () Bool)

(assert (=> b!1266623 (= e!721431 (and tp_is_empty!32537 tp!96444))))

(assert (=> b!1266439 (= tp!96437 e!721431)))

(assert (= (and b!1266439 (is-Cons!28325 (t!41853 l!706))) b!1266623))

(push 1)

(assert (not b!1266490))

(assert (not b!1266574))

(assert (not d!139231))

(assert tp_is_empty!32537)

(assert (not b!1266576))

(assert (not b!1266570))

(assert (not b!1266606))

(assert (not b!1266623))

(assert (not b!1266491))

(assert (not b!1266451))

(assert (not d!139227))

(assert (not bm!62486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139291 () Bool)

(declare-fun res!843264 () Bool)

(declare-fun e!721491 () Bool)

(assert (=> d!139291 (=> res!843264 e!721491)))

(assert (=> d!139291 (= res!843264 (or (is-Nil!28326 lt!574142) (is-Nil!28326 (t!41853 lt!574142))))))

(assert (=> d!139291 (= (isStrictlySorted!804 lt!574142) e!721491)))

(declare-fun b!1266697 () Bool)

(declare-fun e!721492 () Bool)

(assert (=> b!1266697 (= e!721491 e!721492)))

(declare-fun res!843265 () Bool)

(assert (=> b!1266697 (=> (not res!843265) (not e!721492))))

(assert (=> b!1266697 (= res!843265 (bvslt (_1!10607 (h!29534 lt!574142)) (_1!10607 (h!29534 (t!41853 lt!574142)))))))

(declare-fun b!1266698 () Bool)

(assert (=> b!1266698 (= e!721492 (isStrictlySorted!804 (t!41853 lt!574142)))))

(assert (= (and d!139291 (not res!843264)) b!1266697))

(assert (= (and b!1266697 res!843265) b!1266698))

(declare-fun m!1166347 () Bool)

(assert (=> b!1266698 m!1166347))

(assert (=> d!139227 d!139291))

(declare-fun d!139293 () Bool)

(declare-fun res!843266 () Bool)

(declare-fun e!721494 () Bool)

(assert (=> d!139293 (=> res!843266 e!721494)))

(assert (=> d!139293 (= res!843266 (or (is-Nil!28326 (insertStrictlySorted!470 l!706 key1!31 v1!26)) (is-Nil!28326 (t!41853 (insertStrictlySorted!470 l!706 key1!31 v1!26)))))))

(assert (=> d!139293 (= (isStrictlySorted!804 (insertStrictlySorted!470 l!706 key1!31 v1!26)) e!721494)))

(declare-fun b!1266700 () Bool)

(declare-fun e!721495 () Bool)

(assert (=> b!1266700 (= e!721494 e!721495)))

(declare-fun res!843267 () Bool)

(assert (=> b!1266700 (=> (not res!843267) (not e!721495))))

(assert (=> b!1266700 (= res!843267 (bvslt (_1!10607 (h!29534 (insertStrictlySorted!470 l!706 key1!31 v1!26))) (_1!10607 (h!29534 (t!41853 (insertStrictlySorted!470 l!706 key1!31 v1!26))))))))

(declare-fun b!1266701 () Bool)

(assert (=> b!1266701 (= e!721495 (isStrictlySorted!804 (t!41853 (insertStrictlySorted!470 l!706 key1!31 v1!26))))))

(assert (= (and d!139293 (not res!843266)) b!1266700))

(assert (= (and b!1266700 res!843267) b!1266701))

(declare-fun m!1166349 () Bool)

(assert (=> b!1266701 m!1166349))

(assert (=> d!139227 d!139293))

(declare-fun d!139295 () Bool)

(declare-fun res!843268 () Bool)

(declare-fun e!721496 () Bool)

(assert (=> d!139295 (=> res!843268 e!721496)))

(assert (=> d!139295 (= res!843268 (or (is-Nil!28326 lt!574151) (is-Nil!28326 (t!41853 lt!574151))))))

(assert (=> d!139295 (= (isStrictlySorted!804 lt!574151) e!721496)))

(declare-fun b!1266702 () Bool)

(declare-fun e!721497 () Bool)

(assert (=> b!1266702 (= e!721496 e!721497)))

(declare-fun res!843269 () Bool)

(assert (=> b!1266702 (=> (not res!843269) (not e!721497))))

(assert (=> b!1266702 (= res!843269 (bvslt (_1!10607 (h!29534 lt!574151)) (_1!10607 (h!29534 (t!41853 lt!574151)))))))

(declare-fun b!1266703 () Bool)

(assert (=> b!1266703 (= e!721497 (isStrictlySorted!804 (t!41853 lt!574151)))))

(assert (= (and d!139295 (not res!843268)) b!1266702))

(assert (= (and b!1266702 res!843269) b!1266703))

(declare-fun m!1166351 () Bool)

(assert (=> b!1266703 m!1166351))

(assert (=> d!139231 d!139295))

(assert (=> d!139231 d!139221))

(declare-fun b!1266704 () Bool)

(declare-fun e!721501 () List!28329)

(declare-fun call!62503 () List!28329)

(assert (=> b!1266704 (= e!721501 call!62503)))

(declare-fun e!721502 () List!28329)

(declare-fun c!123506 () Bool)

(declare-fun c!123504 () Bool)

(declare-fun b!1266705 () Bool)

(assert (=> b!1266705 (= e!721502 (ite c!123506 (t!41853 (t!41853 l!706)) (ite c!123504 (Cons!28325 (h!29534 (t!41853 l!706)) (t!41853 (t!41853 l!706))) Nil!28326)))))

(declare-fun c!123505 () Bool)

(declare-fun bm!62498 () Bool)

(assert (=> bm!62498 (= call!62503 ($colon$colon!646 e!721502 (ite c!123505 (h!29534 (t!41853 l!706)) (tuple2!21193 key1!31 v1!26))))))

(declare-fun c!123503 () Bool)

(assert (=> bm!62498 (= c!123503 c!123505)))

(declare-fun b!1266706 () Bool)

(assert (=> b!1266706 (= c!123504 (and (is-Cons!28325 (t!41853 l!706)) (bvsgt (_1!10607 (h!29534 (t!41853 l!706))) key1!31)))))

(declare-fun e!721500 () List!28329)

(declare-fun e!721499 () List!28329)

(assert (=> b!1266706 (= e!721500 e!721499)))

(declare-fun d!139297 () Bool)

(declare-fun e!721498 () Bool)

(assert (=> d!139297 e!721498))

(declare-fun res!843271 () Bool)

(assert (=> d!139297 (=> (not res!843271) (not e!721498))))

(declare-fun lt!574163 () List!28329)

(assert (=> d!139297 (= res!843271 (isStrictlySorted!804 lt!574163))))

(assert (=> d!139297 (= lt!574163 e!721501)))

(assert (=> d!139297 (= c!123505 (and (is-Cons!28325 (t!41853 l!706)) (bvslt (_1!10607 (h!29534 (t!41853 l!706))) key1!31)))))

(assert (=> d!139297 (isStrictlySorted!804 (t!41853 l!706))))

(assert (=> d!139297 (= (insertStrictlySorted!470 (t!41853 l!706) key1!31 v1!26) lt!574163)))

(declare-fun b!1266707 () Bool)

(declare-fun res!843270 () Bool)

(assert (=> b!1266707 (=> (not res!843270) (not e!721498))))

(assert (=> b!1266707 (= res!843270 (containsKey!663 lt!574163 key1!31))))

(declare-fun b!1266708 () Bool)

(declare-fun call!62502 () List!28329)

(assert (=> b!1266708 (= e!721499 call!62502)))

(declare-fun b!1266709 () Bool)

(assert (=> b!1266709 (= e!721501 e!721500)))

(assert (=> b!1266709 (= c!123506 (and (is-Cons!28325 (t!41853 l!706)) (= (_1!10607 (h!29534 (t!41853 l!706))) key1!31)))))

(declare-fun b!1266710 () Bool)

(declare-fun call!62501 () List!28329)

(assert (=> b!1266710 (= e!721500 call!62501)))

(declare-fun b!1266711 () Bool)

(assert (=> b!1266711 (= e!721498 (contains!7645 lt!574163 (tuple2!21193 key1!31 v1!26)))))

(declare-fun b!1266712 () Bool)

(assert (=> b!1266712 (= e!721499 call!62502)))

(declare-fun b!1266713 () Bool)

(assert (=> b!1266713 (= e!721502 (insertStrictlySorted!470 (t!41853 (t!41853 l!706)) key1!31 v1!26))))

(declare-fun bm!62499 () Bool)

(assert (=> bm!62499 (= call!62502 call!62501)))

(declare-fun bm!62500 () Bool)

(assert (=> bm!62500 (= call!62501 call!62503)))

(assert (= (and d!139297 c!123505) b!1266704))

(assert (= (and d!139297 (not c!123505)) b!1266709))

(assert (= (and b!1266709 c!123506) b!1266710))

(assert (= (and b!1266709 (not c!123506)) b!1266706))

(assert (= (and b!1266706 c!123504) b!1266712))

(assert (= (and b!1266706 (not c!123504)) b!1266708))

(assert (= (or b!1266712 b!1266708) bm!62499))

(assert (= (or b!1266710 bm!62499) bm!62500))

(assert (= (or b!1266704 bm!62500) bm!62498))

(assert (= (and bm!62498 c!123503) b!1266713))

(assert (= (and bm!62498 (not c!123503)) b!1266705))

(assert (= (and d!139297 res!843271) b!1266707))

(assert (= (and b!1266707 res!843270) b!1266711))

(declare-fun m!1166353 () Bool)

(assert (=> b!1266713 m!1166353))

(declare-fun m!1166355 () Bool)

(assert (=> b!1266707 m!1166355))

(declare-fun m!1166357 () Bool)

(assert (=> b!1266711 m!1166357))

(declare-fun m!1166359 () Bool)

(assert (=> bm!62498 m!1166359))

(declare-fun m!1166361 () Bool)

(assert (=> d!139297 m!1166361))

(assert (=> d!139297 m!1166201))

(assert (=> b!1266576 d!139297))

(declare-fun d!139299 () Bool)

(declare-fun res!843272 () Bool)

(declare-fun e!721503 () Bool)

(assert (=> d!139299 (=> res!843272 e!721503)))

(assert (=> d!139299 (= res!843272 (and (is-Cons!28325 lt!574142) (= (_1!10607 (h!29534 lt!574142)) key1!31)))))

(assert (=> d!139299 (= (containsKey!663 lt!574142 key1!31) e!721503)))

(declare-fun b!1266714 () Bool)

(declare-fun e!721504 () Bool)

(assert (=> b!1266714 (= e!721503 e!721504)))

(declare-fun res!843273 () Bool)

(assert (=> b!1266714 (=> (not res!843273) (not e!721504))))

(assert (=> b!1266714 (= res!843273 (and (or (not (is-Cons!28325 lt!574142)) (bvsle (_1!10607 (h!29534 lt!574142)) key1!31)) (is-Cons!28325 lt!574142) (bvslt (_1!10607 (h!29534 lt!574142)) key1!31)))))

(declare-fun b!1266715 () Bool)

(assert (=> b!1266715 (= e!721504 (containsKey!663 (t!41853 lt!574142) key1!31))))

(assert (= (and d!139299 (not res!843272)) b!1266714))

(assert (= (and b!1266714 res!843273) b!1266715))

(declare-fun m!1166363 () Bool)

(assert (=> b!1266715 m!1166363))

(assert (=> b!1266491 d!139299))

(declare-fun d!139301 () Bool)

(declare-fun res!843274 () Bool)

(declare-fun e!721505 () Bool)

(assert (=> d!139301 (=> res!843274 e!721505)))

(assert (=> d!139301 (= res!843274 (and (is-Cons!28325 lt!574151) (= (_1!10607 (h!29534 lt!574151)) key1!31)))))

(assert (=> d!139301 (= (containsKey!663 lt!574151 key1!31) e!721505)))

(declare-fun b!1266716 () Bool)

(declare-fun e!721506 () Bool)

(assert (=> b!1266716 (= e!721505 e!721506)))

(declare-fun res!843275 () Bool)

(assert (=> b!1266716 (=> (not res!843275) (not e!721506))))

(assert (=> b!1266716 (= res!843275 (and (or (not (is-Cons!28325 lt!574151)) (bvsle (_1!10607 (h!29534 lt!574151)) key1!31)) (is-Cons!28325 lt!574151) (bvslt (_1!10607 (h!29534 lt!574151)) key1!31)))))

(declare-fun b!1266717 () Bool)

(assert (=> b!1266717 (= e!721506 (containsKey!663 (t!41853 lt!574151) key1!31))))

(assert (= (and d!139301 (not res!843274)) b!1266716))

(assert (= (and b!1266716 res!843275) b!1266717))

(declare-fun m!1166365 () Bool)

(assert (=> b!1266717 m!1166365))

(assert (=> b!1266570 d!139301))

(declare-fun d!139303 () Bool)

(declare-fun res!843276 () Bool)

(declare-fun e!721507 () Bool)

(assert (=> d!139303 (=> res!843276 e!721507)))

(assert (=> d!139303 (= res!843276 (and (is-Cons!28325 (t!41853 l!706)) (= (_1!10607 (h!29534 (t!41853 l!706))) key1!31)))))

(assert (=> d!139303 (= (containsKey!663 (t!41853 l!706) key1!31) e!721507)))

(declare-fun b!1266718 () Bool)

(declare-fun e!721508 () Bool)

(assert (=> b!1266718 (= e!721507 e!721508)))

(declare-fun res!843277 () Bool)

(assert (=> b!1266718 (=> (not res!843277) (not e!721508))))

(assert (=> b!1266718 (= res!843277 (and (or (not (is-Cons!28325 (t!41853 l!706))) (bvsle (_1!10607 (h!29534 (t!41853 l!706))) key1!31)) (is-Cons!28325 (t!41853 l!706)) (bvslt (_1!10607 (h!29534 (t!41853 l!706))) key1!31)))))

(declare-fun b!1266719 () Bool)

(assert (=> b!1266719 (= e!721508 (containsKey!663 (t!41853 (t!41853 l!706)) key1!31))))

(assert (= (and d!139303 (not res!843276)) b!1266718))

(assert (= (and b!1266718 res!843277) b!1266719))

(declare-fun m!1166367 () Bool)

(assert (=> b!1266719 m!1166367))

(assert (=> b!1266606 d!139303))

(declare-fun d!139305 () Bool)

(declare-fun res!843278 () Bool)

(declare-fun e!721509 () Bool)

(assert (=> d!139305 (=> res!843278 e!721509)))

(assert (=> d!139305 (= res!843278 (or (is-Nil!28326 (t!41853 l!706)) (is-Nil!28326 (t!41853 (t!41853 l!706)))))))

(assert (=> d!139305 (= (isStrictlySorted!804 (t!41853 l!706)) e!721509)))

(declare-fun b!1266720 () Bool)

(declare-fun e!721510 () Bool)

(assert (=> b!1266720 (= e!721509 e!721510)))

(declare-fun res!843279 () Bool)

(assert (=> b!1266720 (=> (not res!843279) (not e!721510))))

(assert (=> b!1266720 (= res!843279 (bvslt (_1!10607 (h!29534 (t!41853 l!706))) (_1!10607 (h!29534 (t!41853 (t!41853 l!706))))))))

(declare-fun b!1266721 () Bool)

(assert (=> b!1266721 (= e!721510 (isStrictlySorted!804 (t!41853 (t!41853 l!706))))))

(assert (= (and d!139305 (not res!843278)) b!1266720))

(assert (= (and b!1266720 res!843279) b!1266721))

