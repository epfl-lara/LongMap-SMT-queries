; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106560 () Bool)

(assert start!106560)

(declare-datatypes ((B!2002 0))(
  ( (B!2003 (val!16336 Int)) )
))
(declare-datatypes ((tuple2!21190 0))(
  ( (tuple2!21191 (_1!10606 (_ BitVec 64)) (_2!10606 B!2002)) )
))
(declare-datatypes ((List!28328 0))(
  ( (Nil!28325) (Cons!28324 (h!29533 tuple2!21190) (t!41852 List!28328)) )
))
(declare-fun l!706 () List!28328)

(declare-fun e!721309 () Bool)

(declare-fun v1!26 () B!2002)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun b!1266426 () Bool)

(declare-fun removeStrictlySorted!159 (List!28328 (_ BitVec 64)) List!28328)

(declare-fun insertStrictlySorted!469 (List!28328 (_ BitVec 64) B!2002) List!28328)

(assert (=> b!1266426 (= e!721309 (not (= (removeStrictlySorted!159 (insertStrictlySorted!469 l!706 key1!31 v1!26) key1!31) l!706)))))

(declare-fun b!1266425 () Bool)

(declare-fun res!843145 () Bool)

(assert (=> b!1266425 (=> (not res!843145) (not e!721309))))

(get-info :version)

(assert (=> b!1266425 (= res!843145 (not ((_ is Cons!28324) l!706)))))

(declare-fun res!843143 () Bool)

(assert (=> start!106560 (=> (not res!843143) (not e!721309))))

(declare-fun isStrictlySorted!803 (List!28328) Bool)

(assert (=> start!106560 (= res!843143 (isStrictlySorted!803 l!706))))

(assert (=> start!106560 e!721309))

(declare-fun e!721310 () Bool)

(assert (=> start!106560 e!721310))

(assert (=> start!106560 true))

(declare-fun tp_is_empty!32535 () Bool)

(assert (=> start!106560 tp_is_empty!32535))

(declare-fun b!1266424 () Bool)

(declare-fun res!843144 () Bool)

(assert (=> b!1266424 (=> (not res!843144) (not e!721309))))

(declare-fun containsKey!662 (List!28328 (_ BitVec 64)) Bool)

(assert (=> b!1266424 (= res!843144 (not (containsKey!662 l!706 key1!31)))))

(declare-fun b!1266427 () Bool)

(declare-fun tp!96434 () Bool)

(assert (=> b!1266427 (= e!721310 (and tp_is_empty!32535 tp!96434))))

(assert (= (and start!106560 res!843143) b!1266424))

(assert (= (and b!1266424 res!843144) b!1266425))

(assert (= (and b!1266425 res!843145) b!1266426))

(assert (= (and start!106560 ((_ is Cons!28324) l!706)) b!1266427))

(declare-fun m!1166183 () Bool)

(assert (=> b!1266426 m!1166183))

(assert (=> b!1266426 m!1166183))

(declare-fun m!1166185 () Bool)

(assert (=> b!1266426 m!1166185))

(declare-fun m!1166187 () Bool)

(assert (=> start!106560 m!1166187))

(declare-fun m!1166189 () Bool)

(assert (=> b!1266424 m!1166189))

(check-sat (not b!1266427) (not b!1266424) tp_is_empty!32535 (not b!1266426) (not start!106560))
(check-sat)
(get-model)

(declare-fun d!139219 () Bool)

(declare-fun res!843163 () Bool)

(declare-fun e!721325 () Bool)

(assert (=> d!139219 (=> res!843163 e!721325)))

(assert (=> d!139219 (= res!843163 (or ((_ is Nil!28325) l!706) ((_ is Nil!28325) (t!41852 l!706))))))

(assert (=> d!139219 (= (isStrictlySorted!803 l!706) e!721325)))

(declare-fun b!1266448 () Bool)

(declare-fun e!721326 () Bool)

(assert (=> b!1266448 (= e!721325 e!721326)))

(declare-fun res!843164 () Bool)

(assert (=> b!1266448 (=> (not res!843164) (not e!721326))))

(assert (=> b!1266448 (= res!843164 (bvslt (_1!10606 (h!29533 l!706)) (_1!10606 (h!29533 (t!41852 l!706)))))))

(declare-fun b!1266449 () Bool)

(assert (=> b!1266449 (= e!721326 (isStrictlySorted!803 (t!41852 l!706)))))

(assert (= (and d!139219 (not res!843163)) b!1266448))

(assert (= (and b!1266448 res!843164) b!1266449))

(declare-fun m!1166199 () Bool)

(assert (=> b!1266449 m!1166199))

(assert (=> start!106560 d!139219))

(declare-fun d!139225 () Bool)

(declare-fun e!721352 () Bool)

(assert (=> d!139225 e!721352))

(declare-fun res!843175 () Bool)

(assert (=> d!139225 (=> (not res!843175) (not e!721352))))

(declare-fun lt!574143 () List!28328)

(assert (=> d!139225 (= res!843175 (isStrictlySorted!803 lt!574143))))

(declare-fun e!721354 () List!28328)

(assert (=> d!139225 (= lt!574143 e!721354)))

(declare-fun c!123452 () Bool)

(assert (=> d!139225 (= c!123452 (and ((_ is Cons!28324) (insertStrictlySorted!469 l!706 key1!31 v1!26)) (= (_1!10606 (h!29533 (insertStrictlySorted!469 l!706 key1!31 v1!26))) key1!31)))))

(assert (=> d!139225 (isStrictlySorted!803 (insertStrictlySorted!469 l!706 key1!31 v1!26))))

(assert (=> d!139225 (= (removeStrictlySorted!159 (insertStrictlySorted!469 l!706 key1!31 v1!26) key1!31) lt!574143)))

(declare-fun b!1266492 () Bool)

(assert (=> b!1266492 (= e!721354 (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26)))))

(declare-fun e!721355 () List!28328)

(declare-fun b!1266493 () Bool)

(declare-fun $colon$colon!645 (List!28328 tuple2!21190) List!28328)

(assert (=> b!1266493 (= e!721355 ($colon$colon!645 (removeStrictlySorted!159 (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26)) key1!31) (h!29533 (insertStrictlySorted!469 l!706 key1!31 v1!26))))))

(declare-fun b!1266494 () Bool)

(assert (=> b!1266494 (= e!721352 (not (containsKey!662 lt!574143 key1!31)))))

(declare-fun b!1266495 () Bool)

(assert (=> b!1266495 (= e!721355 Nil!28325)))

(declare-fun b!1266496 () Bool)

(assert (=> b!1266496 (= e!721354 e!721355)))

(declare-fun c!123454 () Bool)

(assert (=> b!1266496 (= c!123454 (and ((_ is Cons!28324) (insertStrictlySorted!469 l!706 key1!31 v1!26)) (not (= (_1!10606 (h!29533 (insertStrictlySorted!469 l!706 key1!31 v1!26))) key1!31))))))

(assert (= (and d!139225 c!123452) b!1266492))

(assert (= (and d!139225 (not c!123452)) b!1266496))

(assert (= (and b!1266496 c!123454) b!1266493))

(assert (= (and b!1266496 (not c!123454)) b!1266495))

(assert (= (and d!139225 res!843175) b!1266494))

(declare-fun m!1166215 () Bool)

(assert (=> d!139225 m!1166215))

(assert (=> d!139225 m!1166183))

(declare-fun m!1166219 () Bool)

(assert (=> d!139225 m!1166219))

(declare-fun m!1166221 () Bool)

(assert (=> b!1266493 m!1166221))

(assert (=> b!1266493 m!1166221))

(declare-fun m!1166227 () Bool)

(assert (=> b!1266493 m!1166227))

(declare-fun m!1166231 () Bool)

(assert (=> b!1266494 m!1166231))

(assert (=> b!1266426 d!139225))

(declare-fun b!1266577 () Bool)

(declare-fun e!721397 () List!28328)

(declare-fun call!62492 () List!28328)

(assert (=> b!1266577 (= e!721397 call!62492)))

(declare-fun e!721398 () Bool)

(declare-fun b!1266578 () Bool)

(declare-fun lt!574152 () List!28328)

(declare-fun contains!7643 (List!28328 tuple2!21190) Bool)

(assert (=> b!1266578 (= e!721398 (contains!7643 lt!574152 (tuple2!21191 key1!31 v1!26)))))

(declare-fun call!62494 () List!28328)

(declare-fun bm!62489 () Bool)

(declare-fun e!721400 () List!28328)

(declare-fun c!123488 () Bool)

(assert (=> bm!62489 (= call!62494 ($colon$colon!645 e!721400 (ite c!123488 (h!29533 l!706) (tuple2!21191 key1!31 v1!26))))))

(declare-fun c!123490 () Bool)

(assert (=> bm!62489 (= c!123490 c!123488)))

(declare-fun b!1266579 () Bool)

(declare-fun res!843193 () Bool)

(assert (=> b!1266579 (=> (not res!843193) (not e!721398))))

(assert (=> b!1266579 (= res!843193 (containsKey!662 lt!574152 key1!31))))

(declare-fun b!1266580 () Bool)

(declare-fun e!721399 () List!28328)

(assert (=> b!1266580 (= e!721399 call!62494)))

(declare-fun b!1266582 () Bool)

(declare-fun c!123487 () Bool)

(assert (=> b!1266582 (= c!123487 (and ((_ is Cons!28324) l!706) (bvsgt (_1!10606 (h!29533 l!706)) key1!31)))))

(declare-fun e!721396 () List!28328)

(assert (=> b!1266582 (= e!721396 e!721397)))

(declare-fun b!1266583 () Bool)

(assert (=> b!1266583 (= e!721397 call!62492)))

(declare-fun bm!62490 () Bool)

(declare-fun call!62493 () List!28328)

(assert (=> bm!62490 (= call!62492 call!62493)))

(declare-fun d!139233 () Bool)

(assert (=> d!139233 e!721398))

(declare-fun res!843192 () Bool)

(assert (=> d!139233 (=> (not res!843192) (not e!721398))))

(assert (=> d!139233 (= res!843192 (isStrictlySorted!803 lt!574152))))

(assert (=> d!139233 (= lt!574152 e!721399)))

(assert (=> d!139233 (= c!123488 (and ((_ is Cons!28324) l!706) (bvslt (_1!10606 (h!29533 l!706)) key1!31)))))

(assert (=> d!139233 (isStrictlySorted!803 l!706)))

(assert (=> d!139233 (= (insertStrictlySorted!469 l!706 key1!31 v1!26) lt!574152)))

(declare-fun b!1266581 () Bool)

(assert (=> b!1266581 (= e!721400 (insertStrictlySorted!469 (t!41852 l!706) key1!31 v1!26))))

(declare-fun b!1266584 () Bool)

(declare-fun c!123489 () Bool)

(assert (=> b!1266584 (= e!721400 (ite c!123489 (t!41852 l!706) (ite c!123487 (Cons!28324 (h!29533 l!706) (t!41852 l!706)) Nil!28325)))))

(declare-fun b!1266585 () Bool)

(assert (=> b!1266585 (= e!721396 call!62493)))

(declare-fun b!1266586 () Bool)

(assert (=> b!1266586 (= e!721399 e!721396)))

(assert (=> b!1266586 (= c!123489 (and ((_ is Cons!28324) l!706) (= (_1!10606 (h!29533 l!706)) key1!31)))))

(declare-fun bm!62491 () Bool)

(assert (=> bm!62491 (= call!62493 call!62494)))

(assert (= (and d!139233 c!123488) b!1266580))

(assert (= (and d!139233 (not c!123488)) b!1266586))

(assert (= (and b!1266586 c!123489) b!1266585))

(assert (= (and b!1266586 (not c!123489)) b!1266582))

(assert (= (and b!1266582 c!123487) b!1266583))

(assert (= (and b!1266582 (not c!123487)) b!1266577))

(assert (= (or b!1266583 b!1266577) bm!62490))

(assert (= (or b!1266585 bm!62490) bm!62491))

(assert (= (or b!1266580 bm!62491) bm!62489))

(assert (= (and bm!62489 c!123490) b!1266581))

(assert (= (and bm!62489 (not c!123490)) b!1266584))

(assert (= (and d!139233 res!843192) b!1266579))

(assert (= (and b!1266579 res!843193) b!1266578))

(declare-fun m!1166253 () Bool)

(assert (=> b!1266579 m!1166253))

(declare-fun m!1166255 () Bool)

(assert (=> b!1266578 m!1166255))

(declare-fun m!1166257 () Bool)

(assert (=> d!139233 m!1166257))

(assert (=> d!139233 m!1166187))

(declare-fun m!1166259 () Bool)

(assert (=> bm!62489 m!1166259))

(declare-fun m!1166261 () Bool)

(assert (=> b!1266581 m!1166261))

(assert (=> b!1266426 d!139233))

(declare-fun d!139239 () Bool)

(declare-fun res!843216 () Bool)

(declare-fun e!721423 () Bool)

(assert (=> d!139239 (=> res!843216 e!721423)))

(assert (=> d!139239 (= res!843216 (and ((_ is Cons!28324) l!706) (= (_1!10606 (h!29533 l!706)) key1!31)))))

(assert (=> d!139239 (= (containsKey!662 l!706 key1!31) e!721423)))

(declare-fun b!1266609 () Bool)

(declare-fun e!721424 () Bool)

(assert (=> b!1266609 (= e!721423 e!721424)))

(declare-fun res!843217 () Bool)

(assert (=> b!1266609 (=> (not res!843217) (not e!721424))))

(assert (=> b!1266609 (= res!843217 (and (or (not ((_ is Cons!28324) l!706)) (bvsle (_1!10606 (h!29533 l!706)) key1!31)) ((_ is Cons!28324) l!706) (bvslt (_1!10606 (h!29533 l!706)) key1!31)))))

(declare-fun b!1266610 () Bool)

(assert (=> b!1266610 (= e!721424 (containsKey!662 (t!41852 l!706) key1!31))))

(assert (= (and d!139239 (not res!843216)) b!1266609))

(assert (= (and b!1266609 res!843217) b!1266610))

(declare-fun m!1166269 () Bool)

(assert (=> b!1266610 m!1166269))

(assert (=> b!1266424 d!139239))

(declare-fun b!1266625 () Bool)

(declare-fun e!721433 () Bool)

(declare-fun tp!96446 () Bool)

(assert (=> b!1266625 (= e!721433 (and tp_is_empty!32535 tp!96446))))

(assert (=> b!1266427 (= tp!96434 e!721433)))

(assert (= (and b!1266427 ((_ is Cons!28324) (t!41852 l!706))) b!1266625))

(check-sat (not d!139225) (not b!1266579) (not b!1266610) (not b!1266625) tp_is_empty!32535 (not b!1266581) (not b!1266494) (not b!1266578) (not bm!62489) (not b!1266449) (not d!139233) (not b!1266493))
(check-sat)
(get-model)

(declare-fun d!139247 () Bool)

(assert (=> d!139247 (= ($colon$colon!645 (removeStrictlySorted!159 (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26)) key1!31) (h!29533 (insertStrictlySorted!469 l!706 key1!31 v1!26))) (Cons!28324 (h!29533 (insertStrictlySorted!469 l!706 key1!31 v1!26)) (removeStrictlySorted!159 (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26)) key1!31)))))

(assert (=> b!1266493 d!139247))

(declare-fun d!139253 () Bool)

(declare-fun e!721440 () Bool)

(assert (=> d!139253 e!721440))

(declare-fun res!843224 () Bool)

(assert (=> d!139253 (=> (not res!843224) (not e!721440))))

(declare-fun lt!574153 () List!28328)

(assert (=> d!139253 (= res!843224 (isStrictlySorted!803 lt!574153))))

(declare-fun e!721441 () List!28328)

(assert (=> d!139253 (= lt!574153 e!721441)))

(declare-fun c!123491 () Bool)

(assert (=> d!139253 (= c!123491 (and ((_ is Cons!28324) (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26))) (= (_1!10606 (h!29533 (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26)))) key1!31)))))

(assert (=> d!139253 (isStrictlySorted!803 (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26)))))

(assert (=> d!139253 (= (removeStrictlySorted!159 (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26)) key1!31) lt!574153)))

(declare-fun b!1266632 () Bool)

(assert (=> b!1266632 (= e!721441 (t!41852 (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26))))))

(declare-fun e!721442 () List!28328)

(declare-fun b!1266633 () Bool)

(assert (=> b!1266633 (= e!721442 ($colon$colon!645 (removeStrictlySorted!159 (t!41852 (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26))) key1!31) (h!29533 (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26)))))))

(declare-fun b!1266634 () Bool)

(assert (=> b!1266634 (= e!721440 (not (containsKey!662 lt!574153 key1!31)))))

(declare-fun b!1266635 () Bool)

(assert (=> b!1266635 (= e!721442 Nil!28325)))

(declare-fun b!1266636 () Bool)

(assert (=> b!1266636 (= e!721441 e!721442)))

(declare-fun c!123492 () Bool)

(assert (=> b!1266636 (= c!123492 (and ((_ is Cons!28324) (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26))) (not (= (_1!10606 (h!29533 (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26)))) key1!31))))))

(assert (= (and d!139253 c!123491) b!1266632))

(assert (= (and d!139253 (not c!123491)) b!1266636))

(assert (= (and b!1266636 c!123492) b!1266633))

(assert (= (and b!1266636 (not c!123492)) b!1266635))

(assert (= (and d!139253 res!843224) b!1266634))

(declare-fun m!1166277 () Bool)

(assert (=> d!139253 m!1166277))

(declare-fun m!1166279 () Bool)

(assert (=> d!139253 m!1166279))

(declare-fun m!1166281 () Bool)

(assert (=> b!1266633 m!1166281))

(assert (=> b!1266633 m!1166281))

(declare-fun m!1166283 () Bool)

(assert (=> b!1266633 m!1166283))

(declare-fun m!1166285 () Bool)

(assert (=> b!1266634 m!1166285))

(assert (=> b!1266493 d!139253))

(declare-fun b!1266637 () Bool)

(declare-fun e!721444 () List!28328)

(declare-fun call!62495 () List!28328)

(assert (=> b!1266637 (= e!721444 call!62495)))

(declare-fun lt!574154 () List!28328)

(declare-fun b!1266638 () Bool)

(declare-fun e!721445 () Bool)

(assert (=> b!1266638 (= e!721445 (contains!7643 lt!574154 (tuple2!21191 key1!31 v1!26)))))

(declare-fun bm!62492 () Bool)

(declare-fun e!721447 () List!28328)

(declare-fun c!123494 () Bool)

(declare-fun call!62497 () List!28328)

(assert (=> bm!62492 (= call!62497 ($colon$colon!645 e!721447 (ite c!123494 (h!29533 (t!41852 l!706)) (tuple2!21191 key1!31 v1!26))))))

(declare-fun c!123496 () Bool)

(assert (=> bm!62492 (= c!123496 c!123494)))

(declare-fun b!1266639 () Bool)

(declare-fun res!843226 () Bool)

(assert (=> b!1266639 (=> (not res!843226) (not e!721445))))

(assert (=> b!1266639 (= res!843226 (containsKey!662 lt!574154 key1!31))))

(declare-fun b!1266640 () Bool)

(declare-fun e!721446 () List!28328)

(assert (=> b!1266640 (= e!721446 call!62497)))

(declare-fun b!1266642 () Bool)

(declare-fun c!123493 () Bool)

(assert (=> b!1266642 (= c!123493 (and ((_ is Cons!28324) (t!41852 l!706)) (bvsgt (_1!10606 (h!29533 (t!41852 l!706))) key1!31)))))

(declare-fun e!721443 () List!28328)

(assert (=> b!1266642 (= e!721443 e!721444)))

(declare-fun b!1266643 () Bool)

(assert (=> b!1266643 (= e!721444 call!62495)))

(declare-fun bm!62493 () Bool)

(declare-fun call!62496 () List!28328)

(assert (=> bm!62493 (= call!62495 call!62496)))

(declare-fun d!139257 () Bool)

(assert (=> d!139257 e!721445))

(declare-fun res!843225 () Bool)

(assert (=> d!139257 (=> (not res!843225) (not e!721445))))

(assert (=> d!139257 (= res!843225 (isStrictlySorted!803 lt!574154))))

(assert (=> d!139257 (= lt!574154 e!721446)))

(assert (=> d!139257 (= c!123494 (and ((_ is Cons!28324) (t!41852 l!706)) (bvslt (_1!10606 (h!29533 (t!41852 l!706))) key1!31)))))

(assert (=> d!139257 (isStrictlySorted!803 (t!41852 l!706))))

(assert (=> d!139257 (= (insertStrictlySorted!469 (t!41852 l!706) key1!31 v1!26) lt!574154)))

(declare-fun b!1266641 () Bool)

(assert (=> b!1266641 (= e!721447 (insertStrictlySorted!469 (t!41852 (t!41852 l!706)) key1!31 v1!26))))

(declare-fun c!123495 () Bool)

(declare-fun b!1266644 () Bool)

(assert (=> b!1266644 (= e!721447 (ite c!123495 (t!41852 (t!41852 l!706)) (ite c!123493 (Cons!28324 (h!29533 (t!41852 l!706)) (t!41852 (t!41852 l!706))) Nil!28325)))))

(declare-fun b!1266645 () Bool)

(assert (=> b!1266645 (= e!721443 call!62496)))

(declare-fun b!1266646 () Bool)

(assert (=> b!1266646 (= e!721446 e!721443)))

(assert (=> b!1266646 (= c!123495 (and ((_ is Cons!28324) (t!41852 l!706)) (= (_1!10606 (h!29533 (t!41852 l!706))) key1!31)))))

(declare-fun bm!62494 () Bool)

(assert (=> bm!62494 (= call!62496 call!62497)))

(assert (= (and d!139257 c!123494) b!1266640))

(assert (= (and d!139257 (not c!123494)) b!1266646))

(assert (= (and b!1266646 c!123495) b!1266645))

(assert (= (and b!1266646 (not c!123495)) b!1266642))

(assert (= (and b!1266642 c!123493) b!1266643))

(assert (= (and b!1266642 (not c!123493)) b!1266637))

(assert (= (or b!1266643 b!1266637) bm!62493))

(assert (= (or b!1266645 bm!62493) bm!62494))

(assert (= (or b!1266640 bm!62494) bm!62492))

(assert (= (and bm!62492 c!123496) b!1266641))

(assert (= (and bm!62492 (not c!123496)) b!1266644))

(assert (= (and d!139257 res!843225) b!1266639))

(assert (= (and b!1266639 res!843226) b!1266638))

(declare-fun m!1166287 () Bool)

(assert (=> b!1266639 m!1166287))

(declare-fun m!1166289 () Bool)

(assert (=> b!1266638 m!1166289))

(declare-fun m!1166291 () Bool)

(assert (=> d!139257 m!1166291))

(assert (=> d!139257 m!1166199))

(declare-fun m!1166293 () Bool)

(assert (=> bm!62492 m!1166293))

(declare-fun m!1166295 () Bool)

(assert (=> b!1266641 m!1166295))

(assert (=> b!1266581 d!139257))

(declare-fun d!139259 () Bool)

(declare-fun res!843227 () Bool)

(declare-fun e!721448 () Bool)

(assert (=> d!139259 (=> res!843227 e!721448)))

(assert (=> d!139259 (= res!843227 (and ((_ is Cons!28324) lt!574152) (= (_1!10606 (h!29533 lt!574152)) key1!31)))))

(assert (=> d!139259 (= (containsKey!662 lt!574152 key1!31) e!721448)))

(declare-fun b!1266647 () Bool)

(declare-fun e!721449 () Bool)

(assert (=> b!1266647 (= e!721448 e!721449)))

(declare-fun res!843228 () Bool)

(assert (=> b!1266647 (=> (not res!843228) (not e!721449))))

(assert (=> b!1266647 (= res!843228 (and (or (not ((_ is Cons!28324) lt!574152)) (bvsle (_1!10606 (h!29533 lt!574152)) key1!31)) ((_ is Cons!28324) lt!574152) (bvslt (_1!10606 (h!29533 lt!574152)) key1!31)))))

(declare-fun b!1266648 () Bool)

(assert (=> b!1266648 (= e!721449 (containsKey!662 (t!41852 lt!574152) key1!31))))

(assert (= (and d!139259 (not res!843227)) b!1266647))

(assert (= (and b!1266647 res!843228) b!1266648))

(declare-fun m!1166297 () Bool)

(assert (=> b!1266648 m!1166297))

(assert (=> b!1266579 d!139259))

(declare-fun d!139261 () Bool)

(declare-fun res!843229 () Bool)

(declare-fun e!721450 () Bool)

(assert (=> d!139261 (=> res!843229 e!721450)))

(assert (=> d!139261 (= res!843229 (and ((_ is Cons!28324) (t!41852 l!706)) (= (_1!10606 (h!29533 (t!41852 l!706))) key1!31)))))

(assert (=> d!139261 (= (containsKey!662 (t!41852 l!706) key1!31) e!721450)))

(declare-fun b!1266649 () Bool)

(declare-fun e!721451 () Bool)

(assert (=> b!1266649 (= e!721450 e!721451)))

(declare-fun res!843230 () Bool)

(assert (=> b!1266649 (=> (not res!843230) (not e!721451))))

(assert (=> b!1266649 (= res!843230 (and (or (not ((_ is Cons!28324) (t!41852 l!706))) (bvsle (_1!10606 (h!29533 (t!41852 l!706))) key1!31)) ((_ is Cons!28324) (t!41852 l!706)) (bvslt (_1!10606 (h!29533 (t!41852 l!706))) key1!31)))))

(declare-fun b!1266650 () Bool)

(assert (=> b!1266650 (= e!721451 (containsKey!662 (t!41852 (t!41852 l!706)) key1!31))))

(assert (= (and d!139261 (not res!843229)) b!1266649))

(assert (= (and b!1266649 res!843230) b!1266650))

(declare-fun m!1166299 () Bool)

(assert (=> b!1266650 m!1166299))

(assert (=> b!1266610 d!139261))

(declare-fun d!139263 () Bool)

(declare-fun res!843235 () Bool)

(declare-fun e!721456 () Bool)

(assert (=> d!139263 (=> res!843235 e!721456)))

(assert (=> d!139263 (= res!843235 (or ((_ is Nil!28325) (t!41852 l!706)) ((_ is Nil!28325) (t!41852 (t!41852 l!706)))))))

(assert (=> d!139263 (= (isStrictlySorted!803 (t!41852 l!706)) e!721456)))

(declare-fun b!1266655 () Bool)

(declare-fun e!721457 () Bool)

(assert (=> b!1266655 (= e!721456 e!721457)))

(declare-fun res!843236 () Bool)

(assert (=> b!1266655 (=> (not res!843236) (not e!721457))))

(assert (=> b!1266655 (= res!843236 (bvslt (_1!10606 (h!29533 (t!41852 l!706))) (_1!10606 (h!29533 (t!41852 (t!41852 l!706))))))))

(declare-fun b!1266656 () Bool)

(assert (=> b!1266656 (= e!721457 (isStrictlySorted!803 (t!41852 (t!41852 l!706))))))

(assert (= (and d!139263 (not res!843235)) b!1266655))

(assert (= (and b!1266655 res!843236) b!1266656))

(declare-fun m!1166301 () Bool)

(assert (=> b!1266656 m!1166301))

(assert (=> b!1266449 d!139263))

(declare-fun d!139265 () Bool)

(declare-fun res!843237 () Bool)

(declare-fun e!721458 () Bool)

(assert (=> d!139265 (=> res!843237 e!721458)))

(assert (=> d!139265 (= res!843237 (and ((_ is Cons!28324) lt!574143) (= (_1!10606 (h!29533 lt!574143)) key1!31)))))

(assert (=> d!139265 (= (containsKey!662 lt!574143 key1!31) e!721458)))

(declare-fun b!1266657 () Bool)

(declare-fun e!721459 () Bool)

(assert (=> b!1266657 (= e!721458 e!721459)))

(declare-fun res!843238 () Bool)

(assert (=> b!1266657 (=> (not res!843238) (not e!721459))))

(assert (=> b!1266657 (= res!843238 (and (or (not ((_ is Cons!28324) lt!574143)) (bvsle (_1!10606 (h!29533 lt!574143)) key1!31)) ((_ is Cons!28324) lt!574143) (bvslt (_1!10606 (h!29533 lt!574143)) key1!31)))))

(declare-fun b!1266658 () Bool)

(assert (=> b!1266658 (= e!721459 (containsKey!662 (t!41852 lt!574143) key1!31))))

(assert (= (and d!139265 (not res!843237)) b!1266657))

(assert (= (and b!1266657 res!843238) b!1266658))

(declare-fun m!1166303 () Bool)

(assert (=> b!1266658 m!1166303))

(assert (=> b!1266494 d!139265))

(declare-fun d!139267 () Bool)

(assert (=> d!139267 (= ($colon$colon!645 e!721400 (ite c!123488 (h!29533 l!706) (tuple2!21191 key1!31 v1!26))) (Cons!28324 (ite c!123488 (h!29533 l!706) (tuple2!21191 key1!31 v1!26)) e!721400))))

(assert (=> bm!62489 d!139267))

(declare-fun d!139269 () Bool)

(declare-fun res!843239 () Bool)

(declare-fun e!721460 () Bool)

(assert (=> d!139269 (=> res!843239 e!721460)))

(assert (=> d!139269 (= res!843239 (or ((_ is Nil!28325) lt!574143) ((_ is Nil!28325) (t!41852 lt!574143))))))

(assert (=> d!139269 (= (isStrictlySorted!803 lt!574143) e!721460)))

(declare-fun b!1266659 () Bool)

(declare-fun e!721461 () Bool)

(assert (=> b!1266659 (= e!721460 e!721461)))

(declare-fun res!843240 () Bool)

(assert (=> b!1266659 (=> (not res!843240) (not e!721461))))

(assert (=> b!1266659 (= res!843240 (bvslt (_1!10606 (h!29533 lt!574143)) (_1!10606 (h!29533 (t!41852 lt!574143)))))))

(declare-fun b!1266660 () Bool)

(assert (=> b!1266660 (= e!721461 (isStrictlySorted!803 (t!41852 lt!574143)))))

(assert (= (and d!139269 (not res!843239)) b!1266659))

(assert (= (and b!1266659 res!843240) b!1266660))

(declare-fun m!1166305 () Bool)

(assert (=> b!1266660 m!1166305))

(assert (=> d!139225 d!139269))

(declare-fun d!139271 () Bool)

(declare-fun res!843243 () Bool)

(declare-fun e!721464 () Bool)

(assert (=> d!139271 (=> res!843243 e!721464)))

(assert (=> d!139271 (= res!843243 (or ((_ is Nil!28325) (insertStrictlySorted!469 l!706 key1!31 v1!26)) ((_ is Nil!28325) (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26)))))))

(assert (=> d!139271 (= (isStrictlySorted!803 (insertStrictlySorted!469 l!706 key1!31 v1!26)) e!721464)))

(declare-fun b!1266663 () Bool)

(declare-fun e!721465 () Bool)

(assert (=> b!1266663 (= e!721464 e!721465)))

(declare-fun res!843244 () Bool)

(assert (=> b!1266663 (=> (not res!843244) (not e!721465))))

(assert (=> b!1266663 (= res!843244 (bvslt (_1!10606 (h!29533 (insertStrictlySorted!469 l!706 key1!31 v1!26))) (_1!10606 (h!29533 (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26))))))))

(declare-fun b!1266664 () Bool)

(assert (=> b!1266664 (= e!721465 (isStrictlySorted!803 (t!41852 (insertStrictlySorted!469 l!706 key1!31 v1!26))))))

(assert (= (and d!139271 (not res!843243)) b!1266663))

(assert (= (and b!1266663 res!843244) b!1266664))

(assert (=> b!1266664 m!1166279))

(assert (=> d!139225 d!139271))

(declare-fun d!139275 () Bool)

(declare-fun res!843247 () Bool)

(declare-fun e!721468 () Bool)

(assert (=> d!139275 (=> res!843247 e!721468)))

(assert (=> d!139275 (= res!843247 (or ((_ is Nil!28325) lt!574152) ((_ is Nil!28325) (t!41852 lt!574152))))))

(assert (=> d!139275 (= (isStrictlySorted!803 lt!574152) e!721468)))

(declare-fun b!1266667 () Bool)

(declare-fun e!721469 () Bool)

(assert (=> b!1266667 (= e!721468 e!721469)))

(declare-fun res!843248 () Bool)

(assert (=> b!1266667 (=> (not res!843248) (not e!721469))))

(assert (=> b!1266667 (= res!843248 (bvslt (_1!10606 (h!29533 lt!574152)) (_1!10606 (h!29533 (t!41852 lt!574152)))))))

(declare-fun b!1266668 () Bool)

(assert (=> b!1266668 (= e!721469 (isStrictlySorted!803 (t!41852 lt!574152)))))

(assert (= (and d!139275 (not res!843247)) b!1266667))

(assert (= (and b!1266667 res!843248) b!1266668))

(declare-fun m!1166315 () Bool)

(assert (=> b!1266668 m!1166315))

(assert (=> d!139233 d!139275))

(assert (=> d!139233 d!139219))

(declare-fun lt!574162 () Bool)

(declare-fun d!139279 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!638 (List!28328) (InoxSet tuple2!21190))

(assert (=> d!139279 (= lt!574162 (select (content!638 lt!574152) (tuple2!21191 key1!31 v1!26)))))

(declare-fun e!721490 () Bool)

(assert (=> d!139279 (= lt!574162 e!721490)))

(declare-fun res!843263 () Bool)

(assert (=> d!139279 (=> (not res!843263) (not e!721490))))

(assert (=> d!139279 (= res!843263 ((_ is Cons!28324) lt!574152))))

(assert (=> d!139279 (= (contains!7643 lt!574152 (tuple2!21191 key1!31 v1!26)) lt!574162)))

(declare-fun b!1266695 () Bool)

(declare-fun e!721489 () Bool)

(assert (=> b!1266695 (= e!721490 e!721489)))

(declare-fun res!843262 () Bool)

(assert (=> b!1266695 (=> res!843262 e!721489)))

(assert (=> b!1266695 (= res!843262 (= (h!29533 lt!574152) (tuple2!21191 key1!31 v1!26)))))

(declare-fun b!1266696 () Bool)

(assert (=> b!1266696 (= e!721489 (contains!7643 (t!41852 lt!574152) (tuple2!21191 key1!31 v1!26)))))

(assert (= (and d!139279 res!843263) b!1266695))

(assert (= (and b!1266695 (not res!843262)) b!1266696))

(declare-fun m!1166341 () Bool)

(assert (=> d!139279 m!1166341))

(declare-fun m!1166343 () Bool)

(assert (=> d!139279 m!1166343))

(declare-fun m!1166345 () Bool)

(assert (=> b!1266696 m!1166345))

(assert (=> b!1266578 d!139279))

(declare-fun b!1266699 () Bool)

(declare-fun e!721493 () Bool)

(declare-fun tp!96448 () Bool)

(assert (=> b!1266699 (= e!721493 (and tp_is_empty!32535 tp!96448))))

(assert (=> b!1266625 (= tp!96446 e!721493)))

(assert (= (and b!1266625 ((_ is Cons!28324) (t!41852 (t!41852 l!706)))) b!1266699))

(check-sat (not bm!62492) (not d!139253) tp_is_empty!32535 (not b!1266664) (not b!1266638) (not b!1266660) (not d!139279) (not b!1266633) (not b!1266648) (not b!1266668) (not b!1266696) (not b!1266656) (not b!1266641) (not b!1266699) (not b!1266658) (not b!1266639) (not b!1266634) (not d!139257) (not b!1266650))
(check-sat)
