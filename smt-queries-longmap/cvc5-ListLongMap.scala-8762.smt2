; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106396 () Bool)

(assert start!106396)

(declare-fun b!1265337 () Bool)

(declare-datatypes ((B!1964 0))(
  ( (B!1965 (val!16317 Int)) )
))
(declare-datatypes ((tuple2!21152 0))(
  ( (tuple2!21153 (_1!10587 (_ BitVec 64)) (_2!10587 B!1964)) )
))
(declare-datatypes ((List!28309 0))(
  ( (Nil!28306) (Cons!28305 (h!29514 tuple2!21152) (t!41830 List!28309)) )
))
(declare-fun l!706 () List!28309)

(declare-fun e!720584 () Bool)

(declare-fun v1!26 () B!1964)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun isStrictlySorted!784 (List!28309) Bool)

(declare-fun insertStrictlySorted!462 (List!28309 (_ BitVec 64) B!1964) List!28309)

(assert (=> b!1265337 (= e!720584 (not (isStrictlySorted!784 (insertStrictlySorted!462 l!706 key1!31 v1!26))))))

(declare-fun res!842510 () Bool)

(assert (=> start!106396 (=> (not res!842510) (not e!720584))))

(assert (=> start!106396 (= res!842510 (isStrictlySorted!784 l!706))))

(assert (=> start!106396 e!720584))

(declare-fun e!720583 () Bool)

(assert (=> start!106396 e!720583))

(assert (=> start!106396 true))

(declare-fun tp_is_empty!32497 () Bool)

(assert (=> start!106396 tp_is_empty!32497))

(declare-fun b!1265338 () Bool)

(declare-fun tp!96320 () Bool)

(assert (=> b!1265338 (= e!720583 (and tp_is_empty!32497 tp!96320))))

(declare-fun b!1265336 () Bool)

(declare-fun res!842512 () Bool)

(assert (=> b!1265336 (=> (not res!842512) (not e!720584))))

(assert (=> b!1265336 (= res!842512 (not (is-Cons!28305 l!706)))))

(declare-fun b!1265335 () Bool)

(declare-fun res!842511 () Bool)

(assert (=> b!1265335 (=> (not res!842511) (not e!720584))))

(declare-fun containsKey!643 (List!28309 (_ BitVec 64)) Bool)

(assert (=> b!1265335 (= res!842511 (not (containsKey!643 l!706 key1!31)))))

(assert (= (and start!106396 res!842510) b!1265335))

(assert (= (and b!1265335 res!842511) b!1265336))

(assert (= (and b!1265336 res!842512) b!1265337))

(assert (= (and start!106396 (is-Cons!28305 l!706)) b!1265338))

(declare-fun m!1165575 () Bool)

(assert (=> b!1265337 m!1165575))

(assert (=> b!1265337 m!1165575))

(declare-fun m!1165577 () Bool)

(assert (=> b!1265337 m!1165577))

(declare-fun m!1165579 () Bool)

(assert (=> start!106396 m!1165579))

(declare-fun m!1165581 () Bool)

(assert (=> b!1265335 m!1165581))

(push 1)

(assert (not b!1265335))

(assert (not start!106396))

(assert (not b!1265338))

(assert tp_is_empty!32497)

(assert (not b!1265337))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138905 () Bool)

(declare-fun res!842547 () Bool)

(declare-fun e!720613 () Bool)

(assert (=> d!138905 (=> res!842547 e!720613)))

(assert (=> d!138905 (= res!842547 (and (is-Cons!28305 l!706) (= (_1!10587 (h!29514 l!706)) key1!31)))))

(assert (=> d!138905 (= (containsKey!643 l!706 key1!31) e!720613)))

(declare-fun b!1265379 () Bool)

(declare-fun e!720614 () Bool)

(assert (=> b!1265379 (= e!720613 e!720614)))

(declare-fun res!842548 () Bool)

(assert (=> b!1265379 (=> (not res!842548) (not e!720614))))

(assert (=> b!1265379 (= res!842548 (and (or (not (is-Cons!28305 l!706)) (bvsle (_1!10587 (h!29514 l!706)) key1!31)) (is-Cons!28305 l!706) (bvslt (_1!10587 (h!29514 l!706)) key1!31)))))

(declare-fun b!1265380 () Bool)

(assert (=> b!1265380 (= e!720614 (containsKey!643 (t!41830 l!706) key1!31))))

(assert (= (and d!138905 (not res!842547)) b!1265379))

(assert (= (and b!1265379 res!842548) b!1265380))

(declare-fun m!1165603 () Bool)

(assert (=> b!1265380 m!1165603))

(assert (=> b!1265335 d!138905))

(declare-fun d!138911 () Bool)

(declare-fun res!842559 () Bool)

(declare-fun e!720625 () Bool)

(assert (=> d!138911 (=> res!842559 e!720625)))

(assert (=> d!138911 (= res!842559 (or (is-Nil!28306 (insertStrictlySorted!462 l!706 key1!31 v1!26)) (is-Nil!28306 (t!41830 (insertStrictlySorted!462 l!706 key1!31 v1!26)))))))

(assert (=> d!138911 (= (isStrictlySorted!784 (insertStrictlySorted!462 l!706 key1!31 v1!26)) e!720625)))

(declare-fun b!1265391 () Bool)

(declare-fun e!720626 () Bool)

(assert (=> b!1265391 (= e!720625 e!720626)))

(declare-fun res!842560 () Bool)

(assert (=> b!1265391 (=> (not res!842560) (not e!720626))))

(assert (=> b!1265391 (= res!842560 (bvslt (_1!10587 (h!29514 (insertStrictlySorted!462 l!706 key1!31 v1!26))) (_1!10587 (h!29514 (t!41830 (insertStrictlySorted!462 l!706 key1!31 v1!26))))))))

(declare-fun b!1265392 () Bool)

(assert (=> b!1265392 (= e!720626 (isStrictlySorted!784 (t!41830 (insertStrictlySorted!462 l!706 key1!31 v1!26))))))

(assert (= (and d!138911 (not res!842559)) b!1265391))

(assert (= (and b!1265391 res!842560) b!1265392))

(declare-fun m!1165607 () Bool)

(assert (=> b!1265392 m!1165607))

(assert (=> b!1265337 d!138911))

(declare-fun b!1265477 () Bool)

(declare-fun res!842583 () Bool)

(declare-fun e!720676 () Bool)

(assert (=> b!1265477 (=> (not res!842583) (not e!720676))))

(declare-fun lt!574050 () List!28309)

(assert (=> b!1265477 (= res!842583 (containsKey!643 lt!574050 key1!31))))

(declare-fun b!1265478 () Bool)

(declare-fun e!720673 () List!28309)

(declare-fun e!720677 () List!28309)

(assert (=> b!1265478 (= e!720673 e!720677)))

(declare-fun c!123319 () Bool)

(assert (=> b!1265478 (= c!123319 (and (is-Cons!28305 l!706) (= (_1!10587 (h!29514 l!706)) key1!31)))))

(declare-fun bm!62417 () Bool)

(declare-fun e!720674 () List!28309)

(declare-fun c!123317 () Bool)

(declare-fun call!62421 () List!28309)

(declare-fun $colon$colon!640 (List!28309 tuple2!21152) List!28309)

(assert (=> bm!62417 (= call!62421 ($colon$colon!640 e!720674 (ite c!123317 (h!29514 l!706) (tuple2!21153 key1!31 v1!26))))))

(declare-fun c!123316 () Bool)

(assert (=> bm!62417 (= c!123316 c!123317)))

(declare-fun b!1265479 () Bool)

(assert (=> b!1265479 (= e!720673 call!62421)))

(declare-fun b!1265480 () Bool)

(declare-fun e!720675 () List!28309)

(declare-fun call!62420 () List!28309)

(assert (=> b!1265480 (= e!720675 call!62420)))

(declare-fun b!1265481 () Bool)

(declare-fun c!123318 () Bool)

(assert (=> b!1265481 (= c!123318 (and (is-Cons!28305 l!706) (bvsgt (_1!10587 (h!29514 l!706)) key1!31)))))

(assert (=> b!1265481 (= e!720677 e!720675)))

(declare-fun b!1265483 () Bool)

(assert (=> b!1265483 (= e!720675 call!62420)))

(declare-fun b!1265484 () Bool)

(declare-fun contains!7638 (List!28309 tuple2!21152) Bool)

(assert (=> b!1265484 (= e!720676 (contains!7638 lt!574050 (tuple2!21153 key1!31 v1!26)))))

(declare-fun bm!62418 () Bool)

(declare-fun call!62422 () List!28309)

(assert (=> bm!62418 (= call!62420 call!62422)))

(declare-fun bm!62419 () Bool)

(assert (=> bm!62419 (= call!62422 call!62421)))

(declare-fun b!1265482 () Bool)

(assert (=> b!1265482 (= e!720674 (ite c!123319 (t!41830 l!706) (ite c!123318 (Cons!28305 (h!29514 l!706) (t!41830 l!706)) Nil!28306)))))

(declare-fun d!138915 () Bool)

(assert (=> d!138915 e!720676))

(declare-fun res!842584 () Bool)

(assert (=> d!138915 (=> (not res!842584) (not e!720676))))

(assert (=> d!138915 (= res!842584 (isStrictlySorted!784 lt!574050))))

(assert (=> d!138915 (= lt!574050 e!720673)))

(assert (=> d!138915 (= c!123317 (and (is-Cons!28305 l!706) (bvslt (_1!10587 (h!29514 l!706)) key1!31)))))

(assert (=> d!138915 (isStrictlySorted!784 l!706)))

(assert (=> d!138915 (= (insertStrictlySorted!462 l!706 key1!31 v1!26) lt!574050)))

(declare-fun b!1265485 () Bool)

(assert (=> b!1265485 (= e!720674 (insertStrictlySorted!462 (t!41830 l!706) key1!31 v1!26))))

(declare-fun b!1265486 () Bool)

(assert (=> b!1265486 (= e!720677 call!62422)))

(assert (= (and d!138915 c!123317) b!1265479))

(assert (= (and d!138915 (not c!123317)) b!1265478))

(assert (= (and b!1265478 c!123319) b!1265486))

(assert (= (and b!1265478 (not c!123319)) b!1265481))

(assert (= (and b!1265481 c!123318) b!1265480))

(assert (= (and b!1265481 (not c!123318)) b!1265483))

(assert (= (or b!1265480 b!1265483) bm!62418))

(assert (= (or b!1265486 bm!62418) bm!62419))

(assert (= (or b!1265479 bm!62419) bm!62417))

(assert (= (and bm!62417 c!123316) b!1265485))

(assert (= (and bm!62417 (not c!123316)) b!1265482))

(assert (= (and d!138915 res!842584) b!1265477))

(assert (= (and b!1265477 res!842583) b!1265484))

(declare-fun m!1165627 () Bool)

(assert (=> d!138915 m!1165627))

(assert (=> d!138915 m!1165579))

(declare-fun m!1165631 () Bool)

(assert (=> b!1265485 m!1165631))

(declare-fun m!1165635 () Bool)

(assert (=> b!1265484 m!1165635))

(declare-fun m!1165637 () Bool)

(assert (=> b!1265477 m!1165637))

(declare-fun m!1165639 () Bool)

(assert (=> bm!62417 m!1165639))

(assert (=> b!1265337 d!138915))

(declare-fun d!138923 () Bool)

(declare-fun res!842589 () Bool)

(declare-fun e!720682 () Bool)

(assert (=> d!138923 (=> res!842589 e!720682)))

(assert (=> d!138923 (= res!842589 (or (is-Nil!28306 l!706) (is-Nil!28306 (t!41830 l!706))))))

(assert (=> d!138923 (= (isStrictlySorted!784 l!706) e!720682)))

(declare-fun b!1265493 () Bool)

(declare-fun e!720683 () Bool)

(assert (=> b!1265493 (= e!720682 e!720683)))

(declare-fun res!842590 () Bool)

(assert (=> b!1265493 (=> (not res!842590) (not e!720683))))

(assert (=> b!1265493 (= res!842590 (bvslt (_1!10587 (h!29514 l!706)) (_1!10587 (h!29514 (t!41830 l!706)))))))

(declare-fun b!1265494 () Bool)

(assert (=> b!1265494 (= e!720683 (isStrictlySorted!784 (t!41830 l!706)))))

(assert (= (and d!138923 (not res!842589)) b!1265493))

(assert (= (and b!1265493 res!842590) b!1265494))

(declare-fun m!1165643 () Bool)

(assert (=> b!1265494 m!1165643))

(assert (=> start!106396 d!138923))

(declare-fun b!1265508 () Bool)

(declare-fun e!720691 () Bool)

(declare-fun tp!96334 () Bool)

(assert (=> b!1265508 (= e!720691 (and tp_is_empty!32497 tp!96334))))

(assert (=> b!1265338 (= tp!96320 e!720691)))

(assert (= (and b!1265338 (is-Cons!28305 (t!41830 l!706))) b!1265508))

(push 1)

