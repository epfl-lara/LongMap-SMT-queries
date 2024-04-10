; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106558 () Bool)

(assert start!106558)

(declare-fun b!1266415 () Bool)

(declare-fun e!721304 () Bool)

(declare-fun tp_is_empty!32533 () Bool)

(declare-fun tp!96431 () Bool)

(assert (=> b!1266415 (= e!721304 (and tp_is_empty!32533 tp!96431))))

(declare-fun b!1266413 () Bool)

(declare-fun res!843134 () Bool)

(declare-fun e!721303 () Bool)

(assert (=> b!1266413 (=> (not res!843134) (not e!721303))))

(declare-datatypes ((B!2000 0))(
  ( (B!2001 (val!16335 Int)) )
))
(declare-datatypes ((tuple2!21188 0))(
  ( (tuple2!21189 (_1!10605 (_ BitVec 64)) (_2!10605 B!2000)) )
))
(declare-datatypes ((List!28327 0))(
  ( (Nil!28324) (Cons!28323 (h!29532 tuple2!21188) (t!41851 List!28327)) )
))
(declare-fun l!706 () List!28327)

(assert (=> b!1266413 (= res!843134 (not (is-Cons!28323 l!706)))))

(declare-fun b!1266412 () Bool)

(declare-fun res!843135 () Bool)

(assert (=> b!1266412 (=> (not res!843135) (not e!721303))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!661 (List!28327 (_ BitVec 64)) Bool)

(assert (=> b!1266412 (= res!843135 (not (containsKey!661 l!706 key1!31)))))

(declare-fun res!843136 () Bool)

(assert (=> start!106558 (=> (not res!843136) (not e!721303))))

(declare-fun isStrictlySorted!802 (List!28327) Bool)

(assert (=> start!106558 (= res!843136 (isStrictlySorted!802 l!706))))

(assert (=> start!106558 e!721303))

(assert (=> start!106558 e!721304))

(assert (=> start!106558 true))

(assert (=> start!106558 tp_is_empty!32533))

(declare-fun v1!26 () B!2000)

(declare-fun b!1266414 () Bool)

(declare-fun removeStrictlySorted!158 (List!28327 (_ BitVec 64)) List!28327)

(declare-fun insertStrictlySorted!468 (List!28327 (_ BitVec 64) B!2000) List!28327)

(assert (=> b!1266414 (= e!721303 (not (= (removeStrictlySorted!158 (insertStrictlySorted!468 l!706 key1!31 v1!26) key1!31) l!706)))))

(assert (= (and start!106558 res!843136) b!1266412))

(assert (= (and b!1266412 res!843135) b!1266413))

(assert (= (and b!1266413 res!843134) b!1266414))

(assert (= (and start!106558 (is-Cons!28323 l!706)) b!1266415))

(declare-fun m!1166175 () Bool)

(assert (=> b!1266412 m!1166175))

(declare-fun m!1166177 () Bool)

(assert (=> start!106558 m!1166177))

(declare-fun m!1166179 () Bool)

(assert (=> b!1266414 m!1166179))

(assert (=> b!1266414 m!1166179))

(declare-fun m!1166181 () Bool)

(assert (=> b!1266414 m!1166181))

(push 1)

(assert (not b!1266412))

(assert (not b!1266414))

(assert (not start!106558))

(assert tp_is_empty!32533)

(assert (not b!1266415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1266479 () Bool)

(declare-fun e!721344 () List!28327)

(declare-fun e!721343 () List!28327)

(assert (=> b!1266479 (= e!721344 e!721343)))

(declare-fun c!123450 () Bool)

(assert (=> b!1266479 (= c!123450 (and (is-Cons!28323 (insertStrictlySorted!468 l!706 key1!31 v1!26)) (not (= (_1!10605 (h!29532 (insertStrictlySorted!468 l!706 key1!31 v1!26))) key1!31))))))

(declare-fun b!1266480 () Bool)

(declare-fun $colon$colon!644 (List!28327 tuple2!21188) List!28327)

(assert (=> b!1266480 (= e!721343 ($colon$colon!644 (removeStrictlySorted!158 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26)) key1!31) (h!29532 (insertStrictlySorted!468 l!706 key1!31 v1!26))))))

(declare-fun b!1266481 () Bool)

(assert (=> b!1266481 (= e!721344 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26)))))

(declare-fun b!1266482 () Bool)

(assert (=> b!1266482 (= e!721343 Nil!28324)))

(declare-fun b!1266478 () Bool)

(declare-fun e!721345 () Bool)

(declare-fun lt!574141 () List!28327)

(assert (=> b!1266478 (= e!721345 (not (containsKey!661 lt!574141 key1!31)))))

(declare-fun d!139223 () Bool)

(assert (=> d!139223 e!721345))

(declare-fun res!843169 () Bool)

(assert (=> d!139223 (=> (not res!843169) (not e!721345))))

(assert (=> d!139223 (= res!843169 (isStrictlySorted!802 lt!574141))))

(assert (=> d!139223 (= lt!574141 e!721344)))

(declare-fun c!123449 () Bool)

(assert (=> d!139223 (= c!123449 (and (is-Cons!28323 (insertStrictlySorted!468 l!706 key1!31 v1!26)) (= (_1!10605 (h!29532 (insertStrictlySorted!468 l!706 key1!31 v1!26))) key1!31)))))

(assert (=> d!139223 (isStrictlySorted!802 (insertStrictlySorted!468 l!706 key1!31 v1!26))))

(assert (=> d!139223 (= (removeStrictlySorted!158 (insertStrictlySorted!468 l!706 key1!31 v1!26) key1!31) lt!574141)))

(assert (= (and d!139223 c!123449) b!1266481))

(assert (= (and d!139223 (not c!123449)) b!1266479))

(assert (= (and b!1266479 c!123450) b!1266480))

(assert (= (and b!1266479 (not c!123450)) b!1266482))

(assert (= (and d!139223 res!843169) b!1266478))

(declare-fun m!1166203 () Bool)

(assert (=> b!1266480 m!1166203))

(assert (=> b!1266480 m!1166203))

(declare-fun m!1166205 () Bool)

(assert (=> b!1266480 m!1166205))

(declare-fun m!1166207 () Bool)

(assert (=> b!1266478 m!1166207))

(declare-fun m!1166209 () Bool)

(assert (=> d!139223 m!1166209))

(assert (=> d!139223 m!1166179))

(declare-fun m!1166211 () Bool)

(assert (=> d!139223 m!1166211))

(assert (=> b!1266414 d!139223))

(declare-fun b!1266557 () Bool)

(declare-fun e!721389 () List!28327)

(declare-fun call!62486 () List!28327)

(assert (=> b!1266557 (= e!721389 call!62486)))

(declare-fun b!1266558 () Bool)

(declare-fun e!721388 () List!28327)

(declare-fun call!62488 () List!28327)

(assert (=> b!1266558 (= e!721388 call!62488)))

(declare-fun b!1266559 () Bool)

(declare-fun e!721386 () List!28327)

(declare-fun call!62487 () List!28327)

(assert (=> b!1266559 (= e!721386 call!62487)))

(declare-fun e!721390 () List!28327)

(declare-fun bm!62483 () Bool)

(declare-fun c!123481 () Bool)

(assert (=> bm!62483 (= call!62488 ($colon$colon!644 e!721390 (ite c!123481 (h!29532 l!706) (tuple2!21189 key1!31 v1!26))))))

(declare-fun c!123480 () Bool)

(assert (=> bm!62483 (= c!123480 c!123481)))

(declare-fun d!139229 () Bool)

(declare-fun e!721387 () Bool)

(assert (=> d!139229 e!721387))

(declare-fun res!843189 () Bool)

(assert (=> d!139229 (=> (not res!843189) (not e!721387))))

(declare-fun lt!574150 () List!28327)

(assert (=> d!139229 (= res!843189 (isStrictlySorted!802 lt!574150))))

(assert (=> d!139229 (= lt!574150 e!721388)))

(assert (=> d!139229 (= c!123481 (and (is-Cons!28323 l!706) (bvslt (_1!10605 (h!29532 l!706)) key1!31)))))

(assert (=> d!139229 (isStrictlySorted!802 l!706)))

(assert (=> d!139229 (= (insertStrictlySorted!468 l!706 key1!31 v1!26) lt!574150)))

(declare-fun b!1266560 () Bool)

(declare-fun c!123482 () Bool)

(assert (=> b!1266560 (= c!123482 (and (is-Cons!28323 l!706) (bvsgt (_1!10605 (h!29532 l!706)) key1!31)))))

(assert (=> b!1266560 (= e!721386 e!721389)))

(declare-fun bm!62484 () Bool)

(assert (=> bm!62484 (= call!62487 call!62488)))

(declare-fun b!1266561 () Bool)

(assert (=> b!1266561 (= e!721390 (insertStrictlySorted!468 (t!41851 l!706) key1!31 v1!26))))

(declare-fun bm!62485 () Bool)

(assert (=> bm!62485 (= call!62486 call!62487)))

(declare-fun b!1266562 () Bool)

(declare-fun contains!7644 (List!28327 tuple2!21188) Bool)

(assert (=> b!1266562 (= e!721387 (contains!7644 lt!574150 (tuple2!21189 key1!31 v1!26)))))

(declare-fun b!1266563 () Bool)

(assert (=> b!1266563 (= e!721389 call!62486)))

(declare-fun b!1266564 () Bool)

(assert (=> b!1266564 (= e!721388 e!721386)))

(declare-fun c!123479 () Bool)

(assert (=> b!1266564 (= c!123479 (and (is-Cons!28323 l!706) (= (_1!10605 (h!29532 l!706)) key1!31)))))

(declare-fun b!1266565 () Bool)

(declare-fun res!843188 () Bool)

(assert (=> b!1266565 (=> (not res!843188) (not e!721387))))

(assert (=> b!1266565 (= res!843188 (containsKey!661 lt!574150 key1!31))))

(declare-fun b!1266566 () Bool)

(assert (=> b!1266566 (= e!721390 (ite c!123479 (t!41851 l!706) (ite c!123482 (Cons!28323 (h!29532 l!706) (t!41851 l!706)) Nil!28324)))))

(assert (= (and d!139229 c!123481) b!1266558))

(assert (= (and d!139229 (not c!123481)) b!1266564))

(assert (= (and b!1266564 c!123479) b!1266559))

(assert (= (and b!1266564 (not c!123479)) b!1266560))

(assert (= (and b!1266560 c!123482) b!1266557))

(assert (= (and b!1266560 (not c!123482)) b!1266563))

(assert (= (or b!1266557 b!1266563) bm!62485))

(assert (= (or b!1266559 bm!62485) bm!62484))

(assert (= (or b!1266558 bm!62484) bm!62483))

(assert (= (and bm!62483 c!123480) b!1266561))

(assert (= (and bm!62483 (not c!123480)) b!1266566))

(assert (= (and d!139229 res!843189) b!1266565))

(assert (= (and b!1266565 res!843188) b!1266562))

(declare-fun m!1166233 () Bool)

(assert (=> b!1266562 m!1166233))

(declare-fun m!1166235 () Bool)

(assert (=> d!139229 m!1166235))

(assert (=> d!139229 m!1166177))

(declare-fun m!1166237 () Bool)

(assert (=> bm!62483 m!1166237))

(declare-fun m!1166239 () Bool)

(assert (=> b!1266565 m!1166239))

(declare-fun m!1166241 () Bool)

(assert (=> b!1266561 m!1166241))

(assert (=> b!1266414 d!139229))

(declare-fun d!139235 () Bool)

(declare-fun res!843198 () Bool)

(declare-fun e!721405 () Bool)

(assert (=> d!139235 (=> res!843198 e!721405)))

(assert (=> d!139235 (= res!843198 (and (is-Cons!28323 l!706) (= (_1!10605 (h!29532 l!706)) key1!31)))))

(assert (=> d!139235 (= (containsKey!661 l!706 key1!31) e!721405)))

(declare-fun b!1266591 () Bool)

(declare-fun e!721406 () Bool)

(assert (=> b!1266591 (= e!721405 e!721406)))

(declare-fun res!843199 () Bool)

(assert (=> b!1266591 (=> (not res!843199) (not e!721406))))

(assert (=> b!1266591 (= res!843199 (and (or (not (is-Cons!28323 l!706)) (bvsle (_1!10605 (h!29532 l!706)) key1!31)) (is-Cons!28323 l!706) (bvslt (_1!10605 (h!29532 l!706)) key1!31)))))

(declare-fun b!1266592 () Bool)

(assert (=> b!1266592 (= e!721406 (containsKey!661 (t!41851 l!706) key1!31))))

(assert (= (and d!139235 (not res!843198)) b!1266591))

(assert (= (and b!1266591 res!843199) b!1266592))

(declare-fun m!1166263 () Bool)

(assert (=> b!1266592 m!1166263))

(assert (=> b!1266412 d!139235))

(declare-fun d!139241 () Bool)

(declare-fun res!843214 () Bool)

(declare-fun e!721421 () Bool)

(assert (=> d!139241 (=> res!843214 e!721421)))

(assert (=> d!139241 (= res!843214 (or (is-Nil!28324 l!706) (is-Nil!28324 (t!41851 l!706))))))

(assert (=> d!139241 (= (isStrictlySorted!802 l!706) e!721421)))

(declare-fun b!1266607 () Bool)

(declare-fun e!721422 () Bool)

(assert (=> b!1266607 (= e!721421 e!721422)))

(declare-fun res!843215 () Bool)

(assert (=> b!1266607 (=> (not res!843215) (not e!721422))))

(assert (=> b!1266607 (= res!843215 (bvslt (_1!10605 (h!29532 l!706)) (_1!10605 (h!29532 (t!41851 l!706)))))))

(declare-fun b!1266608 () Bool)

(assert (=> b!1266608 (= e!721422 (isStrictlySorted!802 (t!41851 l!706)))))

(assert (= (and d!139241 (not res!843214)) b!1266607))

(assert (= (and b!1266607 res!843215) b!1266608))

(declare-fun m!1166267 () Bool)

(assert (=> b!1266608 m!1166267))

(assert (=> start!106558 d!139241))

(declare-fun b!1266624 () Bool)

(declare-fun e!721432 () Bool)

(declare-fun tp!96445 () Bool)

(assert (=> b!1266624 (= e!721432 (and tp_is_empty!32533 tp!96445))))

(assert (=> b!1266415 (= tp!96431 e!721432)))

(assert (= (and b!1266415 (is-Cons!28323 (t!41851 l!706))) b!1266624))

(push 1)

(assert (not b!1266478))

(assert (not d!139223))

(assert (not b!1266480))

(assert (not bm!62483))

(assert (not b!1266561))

(assert (not b!1266592))

(assert (not b!1266608))

(assert tp_is_empty!32533)

(assert (not b!1266624))

(assert (not b!1266562))

(assert (not d!139229))

(assert (not b!1266565))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139243 () Bool)

(assert (=> d!139243 (= ($colon$colon!644 e!721390 (ite c!123481 (h!29532 l!706) (tuple2!21189 key1!31 v1!26))) (Cons!28323 (ite c!123481 (h!29532 l!706) (tuple2!21189 key1!31 v1!26)) e!721390))))

(assert (=> bm!62483 d!139243))

(declare-fun d!139245 () Bool)

(declare-fun res!843218 () Bool)

(declare-fun e!721434 () Bool)

(assert (=> d!139245 (=> res!843218 e!721434)))

(assert (=> d!139245 (= res!843218 (or (is-Nil!28324 (t!41851 l!706)) (is-Nil!28324 (t!41851 (t!41851 l!706)))))))

(assert (=> d!139245 (= (isStrictlySorted!802 (t!41851 l!706)) e!721434)))

(declare-fun b!1266626 () Bool)

(declare-fun e!721435 () Bool)

(assert (=> b!1266626 (= e!721434 e!721435)))

(declare-fun res!843219 () Bool)

(assert (=> b!1266626 (=> (not res!843219) (not e!721435))))

(assert (=> b!1266626 (= res!843219 (bvslt (_1!10605 (h!29532 (t!41851 l!706))) (_1!10605 (h!29532 (t!41851 (t!41851 l!706))))))))

(declare-fun b!1266627 () Bool)

(assert (=> b!1266627 (= e!721435 (isStrictlySorted!802 (t!41851 (t!41851 l!706))))))

(assert (= (and d!139245 (not res!843218)) b!1266626))

(assert (= (and b!1266626 res!843219) b!1266627))

(declare-fun m!1166271 () Bool)

(assert (=> b!1266627 m!1166271))

(assert (=> b!1266608 d!139245))

(declare-fun d!139249 () Bool)

(declare-fun res!843220 () Bool)

(declare-fun e!721436 () Bool)

(assert (=> d!139249 (=> res!843220 e!721436)))

(assert (=> d!139249 (= res!843220 (and (is-Cons!28323 lt!574141) (= (_1!10605 (h!29532 lt!574141)) key1!31)))))

(assert (=> d!139249 (= (containsKey!661 lt!574141 key1!31) e!721436)))

(declare-fun b!1266628 () Bool)

(declare-fun e!721437 () Bool)

(assert (=> b!1266628 (= e!721436 e!721437)))

(declare-fun res!843221 () Bool)

(assert (=> b!1266628 (=> (not res!843221) (not e!721437))))

(assert (=> b!1266628 (= res!843221 (and (or (not (is-Cons!28323 lt!574141)) (bvsle (_1!10605 (h!29532 lt!574141)) key1!31)) (is-Cons!28323 lt!574141) (bvslt (_1!10605 (h!29532 lt!574141)) key1!31)))))

(declare-fun b!1266629 () Bool)

(assert (=> b!1266629 (= e!721437 (containsKey!661 (t!41851 lt!574141) key1!31))))

(assert (= (and d!139249 (not res!843220)) b!1266628))

(assert (= (and b!1266628 res!843221) b!1266629))

(declare-fun m!1166273 () Bool)

(assert (=> b!1266629 m!1166273))

(assert (=> b!1266478 d!139249))

(declare-fun d!139251 () Bool)

(declare-fun res!843222 () Bool)

(declare-fun e!721438 () Bool)

(assert (=> d!139251 (=> res!843222 e!721438)))

(assert (=> d!139251 (= res!843222 (and (is-Cons!28323 (t!41851 l!706)) (= (_1!10605 (h!29532 (t!41851 l!706))) key1!31)))))

(assert (=> d!139251 (= (containsKey!661 (t!41851 l!706) key1!31) e!721438)))

(declare-fun b!1266630 () Bool)

(declare-fun e!721439 () Bool)

(assert (=> b!1266630 (= e!721438 e!721439)))

(declare-fun res!843223 () Bool)

(assert (=> b!1266630 (=> (not res!843223) (not e!721439))))

(assert (=> b!1266630 (= res!843223 (and (or (not (is-Cons!28323 (t!41851 l!706))) (bvsle (_1!10605 (h!29532 (t!41851 l!706))) key1!31)) (is-Cons!28323 (t!41851 l!706)) (bvslt (_1!10605 (h!29532 (t!41851 l!706))) key1!31)))))

(declare-fun b!1266631 () Bool)

(assert (=> b!1266631 (= e!721439 (containsKey!661 (t!41851 (t!41851 l!706)) key1!31))))

(assert (= (and d!139251 (not res!843222)) b!1266630))

(assert (= (and b!1266630 res!843223) b!1266631))

(declare-fun m!1166275 () Bool)

(assert (=> b!1266631 m!1166275))

(assert (=> b!1266592 d!139251))

(declare-fun lt!574157 () Bool)

(declare-fun d!139255 () Bool)

(declare-fun content!637 (List!28327) (Set tuple2!21188))

(assert (=> d!139255 (= lt!574157 (set.member (tuple2!21189 key1!31 v1!26) (content!637 lt!574150)))))

(declare-fun e!721462 () Bool)

(assert (=> d!139255 (= lt!574157 e!721462)))

(declare-fun res!843241 () Bool)

(assert (=> d!139255 (=> (not res!843241) (not e!721462))))

(assert (=> d!139255 (= res!843241 (is-Cons!28323 lt!574150))))

(assert (=> d!139255 (= (contains!7644 lt!574150 (tuple2!21189 key1!31 v1!26)) lt!574157)))

(declare-fun b!1266661 () Bool)

(declare-fun e!721463 () Bool)

(assert (=> b!1266661 (= e!721462 e!721463)))

(declare-fun res!843242 () Bool)

(assert (=> b!1266661 (=> res!843242 e!721463)))

(assert (=> b!1266661 (= res!843242 (= (h!29532 lt!574150) (tuple2!21189 key1!31 v1!26)))))

(declare-fun b!1266662 () Bool)

(assert (=> b!1266662 (= e!721463 (contains!7644 (t!41851 lt!574150) (tuple2!21189 key1!31 v1!26)))))

(assert (= (and d!139255 res!843241) b!1266661))

(assert (= (and b!1266661 (not res!843242)) b!1266662))

(declare-fun m!1166307 () Bool)

(assert (=> d!139255 m!1166307))

(declare-fun m!1166309 () Bool)

(assert (=> d!139255 m!1166309))

(declare-fun m!1166311 () Bool)

(assert (=> b!1266662 m!1166311))

(assert (=> b!1266562 d!139255))

(declare-fun d!139273 () Bool)

(declare-fun res!843245 () Bool)

(declare-fun e!721466 () Bool)

(assert (=> d!139273 (=> res!843245 e!721466)))

(assert (=> d!139273 (= res!843245 (or (is-Nil!28324 lt!574141) (is-Nil!28324 (t!41851 lt!574141))))))

(assert (=> d!139273 (= (isStrictlySorted!802 lt!574141) e!721466)))

(declare-fun b!1266665 () Bool)

(declare-fun e!721467 () Bool)

(assert (=> b!1266665 (= e!721466 e!721467)))

(declare-fun res!843246 () Bool)

(assert (=> b!1266665 (=> (not res!843246) (not e!721467))))

(assert (=> b!1266665 (= res!843246 (bvslt (_1!10605 (h!29532 lt!574141)) (_1!10605 (h!29532 (t!41851 lt!574141)))))))

(declare-fun b!1266666 () Bool)

(assert (=> b!1266666 (= e!721467 (isStrictlySorted!802 (t!41851 lt!574141)))))

(assert (= (and d!139273 (not res!843245)) b!1266665))

(assert (= (and b!1266665 res!843246) b!1266666))

(declare-fun m!1166313 () Bool)

(assert (=> b!1266666 m!1166313))

(assert (=> d!139223 d!139273))

(declare-fun d!139277 () Bool)

(declare-fun res!843249 () Bool)

(declare-fun e!721470 () Bool)

(assert (=> d!139277 (=> res!843249 e!721470)))

(assert (=> d!139277 (= res!843249 (or (is-Nil!28324 (insertStrictlySorted!468 l!706 key1!31 v1!26)) (is-Nil!28324 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26)))))))

(assert (=> d!139277 (= (isStrictlySorted!802 (insertStrictlySorted!468 l!706 key1!31 v1!26)) e!721470)))

(declare-fun b!1266669 () Bool)

(declare-fun e!721471 () Bool)

(assert (=> b!1266669 (= e!721470 e!721471)))

(declare-fun res!843250 () Bool)

(assert (=> b!1266669 (=> (not res!843250) (not e!721471))))

(assert (=> b!1266669 (= res!843250 (bvslt (_1!10605 (h!29532 (insertStrictlySorted!468 l!706 key1!31 v1!26))) (_1!10605 (h!29532 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26))))))))

(declare-fun b!1266670 () Bool)

(assert (=> b!1266670 (= e!721471 (isStrictlySorted!802 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26))))))

(assert (= (and d!139277 (not res!843249)) b!1266669))

(assert (= (and b!1266669 res!843250) b!1266670))

(declare-fun m!1166317 () Bool)

(assert (=> b!1266670 m!1166317))

(assert (=> d!139223 d!139277))

(declare-fun d!139281 () Bool)

(declare-fun res!843251 () Bool)

(declare-fun e!721472 () Bool)

(assert (=> d!139281 (=> res!843251 e!721472)))

(assert (=> d!139281 (= res!843251 (and (is-Cons!28323 lt!574150) (= (_1!10605 (h!29532 lt!574150)) key1!31)))))

(assert (=> d!139281 (= (containsKey!661 lt!574150 key1!31) e!721472)))

(declare-fun b!1266671 () Bool)

(declare-fun e!721473 () Bool)

(assert (=> b!1266671 (= e!721472 e!721473)))

(declare-fun res!843252 () Bool)

(assert (=> b!1266671 (=> (not res!843252) (not e!721473))))

(assert (=> b!1266671 (= res!843252 (and (or (not (is-Cons!28323 lt!574150)) (bvsle (_1!10605 (h!29532 lt!574150)) key1!31)) (is-Cons!28323 lt!574150) (bvslt (_1!10605 (h!29532 lt!574150)) key1!31)))))

(declare-fun b!1266672 () Bool)

(assert (=> b!1266672 (= e!721473 (containsKey!661 (t!41851 lt!574150) key1!31))))

(assert (= (and d!139281 (not res!843251)) b!1266671))

(assert (= (and b!1266671 res!843252) b!1266672))

(declare-fun m!1166319 () Bool)

(assert (=> b!1266672 m!1166319))

(assert (=> b!1266565 d!139281))

(declare-fun b!1266673 () Bool)

(declare-fun e!721477 () List!28327)

(declare-fun call!62498 () List!28327)

(assert (=> b!1266673 (= e!721477 call!62498)))

(declare-fun b!1266674 () Bool)

(declare-fun e!721476 () List!28327)

(declare-fun call!62500 () List!28327)

(assert (=> b!1266674 (= e!721476 call!62500)))

(declare-fun b!1266675 () Bool)

(declare-fun e!721474 () List!28327)

(declare-fun call!62499 () List!28327)

(assert (=> b!1266675 (= e!721474 call!62499)))

(declare-fun bm!62495 () Bool)

(declare-fun c!123499 () Bool)

(declare-fun e!721478 () List!28327)

(assert (=> bm!62495 (= call!62500 ($colon$colon!644 e!721478 (ite c!123499 (h!29532 (t!41851 l!706)) (tuple2!21189 key1!31 v1!26))))))

(declare-fun c!123498 () Bool)

(assert (=> bm!62495 (= c!123498 c!123499)))

(declare-fun d!139283 () Bool)

(declare-fun e!721475 () Bool)

(assert (=> d!139283 e!721475))

(declare-fun res!843254 () Bool)

(assert (=> d!139283 (=> (not res!843254) (not e!721475))))

(declare-fun lt!574158 () List!28327)

(assert (=> d!139283 (= res!843254 (isStrictlySorted!802 lt!574158))))

(assert (=> d!139283 (= lt!574158 e!721476)))

(assert (=> d!139283 (= c!123499 (and (is-Cons!28323 (t!41851 l!706)) (bvslt (_1!10605 (h!29532 (t!41851 l!706))) key1!31)))))

(assert (=> d!139283 (isStrictlySorted!802 (t!41851 l!706))))

(assert (=> d!139283 (= (insertStrictlySorted!468 (t!41851 l!706) key1!31 v1!26) lt!574158)))

(declare-fun b!1266676 () Bool)

(declare-fun c!123500 () Bool)

(assert (=> b!1266676 (= c!123500 (and (is-Cons!28323 (t!41851 l!706)) (bvsgt (_1!10605 (h!29532 (t!41851 l!706))) key1!31)))))

(assert (=> b!1266676 (= e!721474 e!721477)))

(declare-fun bm!62496 () Bool)

(assert (=> bm!62496 (= call!62499 call!62500)))

(declare-fun b!1266677 () Bool)

(assert (=> b!1266677 (= e!721478 (insertStrictlySorted!468 (t!41851 (t!41851 l!706)) key1!31 v1!26))))

(declare-fun bm!62497 () Bool)

(assert (=> bm!62497 (= call!62498 call!62499)))

(declare-fun b!1266678 () Bool)

(assert (=> b!1266678 (= e!721475 (contains!7644 lt!574158 (tuple2!21189 key1!31 v1!26)))))

(declare-fun b!1266679 () Bool)

(assert (=> b!1266679 (= e!721477 call!62498)))

(declare-fun b!1266680 () Bool)

(assert (=> b!1266680 (= e!721476 e!721474)))

(declare-fun c!123497 () Bool)

(assert (=> b!1266680 (= c!123497 (and (is-Cons!28323 (t!41851 l!706)) (= (_1!10605 (h!29532 (t!41851 l!706))) key1!31)))))

(declare-fun b!1266681 () Bool)

(declare-fun res!843253 () Bool)

(assert (=> b!1266681 (=> (not res!843253) (not e!721475))))

(assert (=> b!1266681 (= res!843253 (containsKey!661 lt!574158 key1!31))))

(declare-fun b!1266682 () Bool)

(assert (=> b!1266682 (= e!721478 (ite c!123497 (t!41851 (t!41851 l!706)) (ite c!123500 (Cons!28323 (h!29532 (t!41851 l!706)) (t!41851 (t!41851 l!706))) Nil!28324)))))

(assert (= (and d!139283 c!123499) b!1266674))

(assert (= (and d!139283 (not c!123499)) b!1266680))

(assert (= (and b!1266680 c!123497) b!1266675))

(assert (= (and b!1266680 (not c!123497)) b!1266676))

(assert (= (and b!1266676 c!123500) b!1266673))

(assert (= (and b!1266676 (not c!123500)) b!1266679))

(assert (= (or b!1266673 b!1266679) bm!62497))

(assert (= (or b!1266675 bm!62497) bm!62496))

(assert (= (or b!1266674 bm!62496) bm!62495))

(assert (= (and bm!62495 c!123498) b!1266677))

(assert (= (and bm!62495 (not c!123498)) b!1266682))

(assert (= (and d!139283 res!843254) b!1266681))

(assert (= (and b!1266681 res!843253) b!1266678))

(declare-fun m!1166321 () Bool)

(assert (=> b!1266678 m!1166321))

(declare-fun m!1166323 () Bool)

(assert (=> d!139283 m!1166323))

(assert (=> d!139283 m!1166267))

(declare-fun m!1166325 () Bool)

(assert (=> bm!62495 m!1166325))

(declare-fun m!1166327 () Bool)

(assert (=> b!1266681 m!1166327))

(declare-fun m!1166329 () Bool)

(assert (=> b!1266677 m!1166329))

(assert (=> b!1266561 d!139283))

(declare-fun d!139285 () Bool)

(assert (=> d!139285 (= ($colon$colon!644 (removeStrictlySorted!158 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26)) key1!31) (h!29532 (insertStrictlySorted!468 l!706 key1!31 v1!26))) (Cons!28323 (h!29532 (insertStrictlySorted!468 l!706 key1!31 v1!26)) (removeStrictlySorted!158 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26)) key1!31)))))

(assert (=> b!1266480 d!139285))

(declare-fun b!1266686 () Bool)

(declare-fun e!721482 () List!28327)

(declare-fun e!721481 () List!28327)

(assert (=> b!1266686 (= e!721482 e!721481)))

(declare-fun c!123502 () Bool)

(assert (=> b!1266686 (= c!123502 (and (is-Cons!28323 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26))) (not (= (_1!10605 (h!29532 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26)))) key1!31))))))

(declare-fun b!1266687 () Bool)

(assert (=> b!1266687 (= e!721481 ($colon$colon!644 (removeStrictlySorted!158 (t!41851 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26))) key1!31) (h!29532 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26)))))))

(declare-fun b!1266688 () Bool)

(assert (=> b!1266688 (= e!721482 (t!41851 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26))))))

(declare-fun b!1266689 () Bool)

(assert (=> b!1266689 (= e!721481 Nil!28324)))

(declare-fun b!1266685 () Bool)

(declare-fun e!721483 () Bool)

(declare-fun lt!574161 () List!28327)

(assert (=> b!1266685 (= e!721483 (not (containsKey!661 lt!574161 key1!31)))))

(declare-fun d!139287 () Bool)

(assert (=> d!139287 e!721483))

(declare-fun res!843257 () Bool)

(assert (=> d!139287 (=> (not res!843257) (not e!721483))))

(assert (=> d!139287 (= res!843257 (isStrictlySorted!802 lt!574161))))

(assert (=> d!139287 (= lt!574161 e!721482)))

(declare-fun c!123501 () Bool)

(assert (=> d!139287 (= c!123501 (and (is-Cons!28323 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26))) (= (_1!10605 (h!29532 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26)))) key1!31)))))

(assert (=> d!139287 (isStrictlySorted!802 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26)))))

(assert (=> d!139287 (= (removeStrictlySorted!158 (t!41851 (insertStrictlySorted!468 l!706 key1!31 v1!26)) key1!31) lt!574161)))

(assert (= (and d!139287 c!123501) b!1266688))

(assert (= (and d!139287 (not c!123501)) b!1266686))

(assert (= (and b!1266686 c!123502) b!1266687))

(assert (= (and b!1266686 (not c!123502)) b!1266689))

(assert (= (and d!139287 res!843257) b!1266685))

(declare-fun m!1166331 () Bool)

(assert (=> b!1266687 m!1166331))

(assert (=> b!1266687 m!1166331))

(declare-fun m!1166333 () Bool)

(assert (=> b!1266687 m!1166333))

(declare-fun m!1166335 () Bool)

(assert (=> b!1266685 m!1166335))

(declare-fun m!1166337 () Bool)

(assert (=> d!139287 m!1166337))

(assert (=> d!139287 m!1166317))

(assert (=> b!1266480 d!139287))

(declare-fun d!139289 () Bool)

(declare-fun res!843260 () Bool)

(declare-fun e!721486 () Bool)

(assert (=> d!139289 (=> res!843260 e!721486)))

(assert (=> d!139289 (= res!843260 (or (is-Nil!28324 lt!574150) (is-Nil!28324 (t!41851 lt!574150))))))

(assert (=> d!139289 (= (isStrictlySorted!802 lt!574150) e!721486)))

(declare-fun b!1266692 () Bool)

(declare-fun e!721487 () Bool)

(assert (=> b!1266692 (= e!721486 e!721487)))

(declare-fun res!843261 () Bool)

(assert (=> b!1266692 (=> (not res!843261) (not e!721487))))

(assert (=> b!1266692 (= res!843261 (bvslt (_1!10605 (h!29532 lt!574150)) (_1!10605 (h!29532 (t!41851 lt!574150)))))))

(declare-fun b!1266693 () Bool)

(assert (=> b!1266693 (= e!721487 (isStrictlySorted!802 (t!41851 lt!574150)))))

(assert (= (and d!139289 (not res!843260)) b!1266692))

(assert (= (and b!1266692 res!843261) b!1266693))

(declare-fun m!1166339 () Bool)

(assert (=> b!1266693 m!1166339))

(assert (=> d!139229 d!139289))

(assert (=> d!139229 d!139241))

(declare-fun b!1266694 () Bool)

(declare-fun e!721488 () Bool)

(declare-fun tp!96447 () Bool)

(assert (=> b!1266694 (= e!721488 (and tp_is_empty!32533 tp!96447))))

(assert (=> b!1266624 (= tp!96445 e!721488)))

(assert (= (and b!1266624 (is-Cons!28323 (t!41851 (t!41851 l!706)))) b!1266694))

(push 1)

