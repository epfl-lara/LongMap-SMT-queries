; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106400 () Bool)

(assert start!106400)

(declare-fun b!1265360 () Bool)

(declare-fun res!842530 () Bool)

(declare-fun e!720596 () Bool)

(assert (=> b!1265360 (=> (not res!842530) (not e!720596))))

(declare-datatypes ((B!1968 0))(
  ( (B!1969 (val!16319 Int)) )
))
(declare-datatypes ((tuple2!21156 0))(
  ( (tuple2!21157 (_1!10589 (_ BitVec 64)) (_2!10589 B!1968)) )
))
(declare-datatypes ((List!28311 0))(
  ( (Nil!28308) (Cons!28307 (h!29516 tuple2!21156) (t!41832 List!28311)) )
))
(declare-fun l!706 () List!28311)

(assert (=> b!1265360 (= res!842530 (not (is-Cons!28307 l!706)))))

(declare-fun res!842528 () Bool)

(assert (=> start!106400 (=> (not res!842528) (not e!720596))))

(declare-fun isStrictlySorted!786 (List!28311) Bool)

(assert (=> start!106400 (= res!842528 (isStrictlySorted!786 l!706))))

(assert (=> start!106400 e!720596))

(declare-fun e!720595 () Bool)

(assert (=> start!106400 e!720595))

(assert (=> start!106400 true))

(declare-fun tp_is_empty!32501 () Bool)

(assert (=> start!106400 tp_is_empty!32501))

(declare-fun b!1265362 () Bool)

(declare-fun tp!96326 () Bool)

(assert (=> b!1265362 (= e!720595 (and tp_is_empty!32501 tp!96326))))

(declare-fun b!1265359 () Bool)

(declare-fun res!842529 () Bool)

(assert (=> b!1265359 (=> (not res!842529) (not e!720596))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!645 (List!28311 (_ BitVec 64)) Bool)

(assert (=> b!1265359 (= res!842529 (not (containsKey!645 l!706 key1!31)))))

(declare-fun b!1265361 () Bool)

(declare-fun v1!26 () B!1968)

(declare-fun insertStrictlySorted!464 (List!28311 (_ BitVec 64) B!1968) List!28311)

(assert (=> b!1265361 (= e!720596 (not (isStrictlySorted!786 (insertStrictlySorted!464 l!706 key1!31 v1!26))))))

(assert (= (and start!106400 res!842528) b!1265359))

(assert (= (and b!1265359 res!842529) b!1265360))

(assert (= (and b!1265360 res!842530) b!1265361))

(assert (= (and start!106400 (is-Cons!28307 l!706)) b!1265362))

(declare-fun m!1165591 () Bool)

(assert (=> start!106400 m!1165591))

(declare-fun m!1165593 () Bool)

(assert (=> b!1265359 m!1165593))

(declare-fun m!1165595 () Bool)

(assert (=> b!1265361 m!1165595))

(assert (=> b!1265361 m!1165595))

(declare-fun m!1165597 () Bool)

(assert (=> b!1265361 m!1165597))

(push 1)

(assert (not start!106400))

(assert (not b!1265362))

(assert tp_is_empty!32501)

(assert (not b!1265361))

(assert (not b!1265359))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138903 () Bool)

(declare-fun res!842543 () Bool)

(declare-fun e!720609 () Bool)

(assert (=> d!138903 (=> res!842543 e!720609)))

(assert (=> d!138903 (= res!842543 (or (is-Nil!28308 (insertStrictlySorted!464 l!706 key1!31 v1!26)) (is-Nil!28308 (t!41832 (insertStrictlySorted!464 l!706 key1!31 v1!26)))))))

(assert (=> d!138903 (= (isStrictlySorted!786 (insertStrictlySorted!464 l!706 key1!31 v1!26)) e!720609)))

(declare-fun b!1265375 () Bool)

(declare-fun e!720610 () Bool)

(assert (=> b!1265375 (= e!720609 e!720610)))

(declare-fun res!842544 () Bool)

(assert (=> b!1265375 (=> (not res!842544) (not e!720610))))

(assert (=> b!1265375 (= res!842544 (bvslt (_1!10589 (h!29516 (insertStrictlySorted!464 l!706 key1!31 v1!26))) (_1!10589 (h!29516 (t!41832 (insertStrictlySorted!464 l!706 key1!31 v1!26))))))))

(declare-fun b!1265376 () Bool)

(assert (=> b!1265376 (= e!720610 (isStrictlySorted!786 (t!41832 (insertStrictlySorted!464 l!706 key1!31 v1!26))))))

(assert (= (and d!138903 (not res!842543)) b!1265375))

(assert (= (and b!1265375 res!842544) b!1265376))

(declare-fun m!1165599 () Bool)

(assert (=> b!1265376 m!1165599))

(assert (=> b!1265361 d!138903))

(declare-fun bm!62411 () Bool)

(declare-fun call!62416 () List!28311)

(declare-fun c!123309 () Bool)

(declare-fun e!720655 () List!28311)

(declare-fun $colon$colon!638 (List!28311 tuple2!21156) List!28311)

(assert (=> bm!62411 (= call!62416 ($colon$colon!638 e!720655 (ite c!123309 (h!29516 l!706) (tuple2!21157 key1!31 v1!26))))))

(declare-fun c!123311 () Bool)

(assert (=> bm!62411 (= c!123311 c!123309)))

(declare-fun bm!62412 () Bool)

(declare-fun call!62415 () List!28311)

(declare-fun call!62414 () List!28311)

(assert (=> bm!62412 (= call!62415 call!62414)))

(declare-fun b!1265449 () Bool)

(declare-fun e!720659 () List!28311)

(assert (=> b!1265449 (= e!720659 call!62415)))

(declare-fun b!1265450 () Bool)

(assert (=> b!1265450 (= e!720655 (insertStrictlySorted!464 (t!41832 l!706) key1!31 v1!26))))

(declare-fun b!1265451 () Bool)

(declare-fun c!123310 () Bool)

(assert (=> b!1265451 (= c!123310 (and (is-Cons!28307 l!706) (bvsgt (_1!10589 (h!29516 l!706)) key1!31)))))

(declare-fun e!720657 () List!28311)

(assert (=> b!1265451 (= e!720657 e!720659)))

(declare-fun b!1265452 () Bool)

(declare-fun c!123308 () Bool)

(assert (=> b!1265452 (= e!720655 (ite c!123308 (t!41832 l!706) (ite c!123310 (Cons!28307 (h!29516 l!706) (t!41832 l!706)) Nil!28308)))))

(declare-fun b!1265453 () Bool)

(declare-fun e!720656 () List!28311)

(assert (=> b!1265453 (= e!720656 e!720657)))

(assert (=> b!1265453 (= c!123308 (and (is-Cons!28307 l!706) (= (_1!10589 (h!29516 l!706)) key1!31)))))

(declare-fun lt!574048 () List!28311)

(declare-fun b!1265454 () Bool)

(declare-fun e!720658 () Bool)

(declare-fun contains!7639 (List!28311 tuple2!21156) Bool)

(assert (=> b!1265454 (= e!720658 (contains!7639 lt!574048 (tuple2!21157 key1!31 v1!26)))))

(declare-fun b!1265455 () Bool)

(assert (=> b!1265455 (= e!720659 call!62415)))

(declare-fun b!1265456 () Bool)

(assert (=> b!1265456 (= e!720657 call!62414)))

(declare-fun bm!62413 () Bool)

(assert (=> bm!62413 (= call!62414 call!62416)))

(declare-fun b!1265457 () Bool)

(declare-fun res!842570 () Bool)

(assert (=> b!1265457 (=> (not res!842570) (not e!720658))))

(assert (=> b!1265457 (= res!842570 (containsKey!645 lt!574048 key1!31))))

(declare-fun b!1265458 () Bool)

(assert (=> b!1265458 (= e!720656 call!62416)))

(declare-fun d!138907 () Bool)

(assert (=> d!138907 e!720658))

(declare-fun res!842569 () Bool)

(assert (=> d!138907 (=> (not res!842569) (not e!720658))))

(assert (=> d!138907 (= res!842569 (isStrictlySorted!786 lt!574048))))

(assert (=> d!138907 (= lt!574048 e!720656)))

(assert (=> d!138907 (= c!123309 (and (is-Cons!28307 l!706) (bvslt (_1!10589 (h!29516 l!706)) key1!31)))))

(assert (=> d!138907 (isStrictlySorted!786 l!706)))

(assert (=> d!138907 (= (insertStrictlySorted!464 l!706 key1!31 v1!26) lt!574048)))

(assert (= (and d!138907 c!123309) b!1265458))

(assert (= (and d!138907 (not c!123309)) b!1265453))

(assert (= (and b!1265453 c!123308) b!1265456))

(assert (= (and b!1265453 (not c!123308)) b!1265451))

(assert (= (and b!1265451 c!123310) b!1265455))

(assert (= (and b!1265451 (not c!123310)) b!1265449))

(assert (= (or b!1265455 b!1265449) bm!62412))

(assert (= (or b!1265456 bm!62412) bm!62413))

(assert (= (or b!1265458 bm!62413) bm!62411))

(assert (= (and bm!62411 c!123311) b!1265450))

(assert (= (and bm!62411 (not c!123311)) b!1265452))

(assert (= (and d!138907 res!842569) b!1265457))

(assert (= (and b!1265457 res!842570) b!1265454))

(declare-fun m!1165609 () Bool)

(assert (=> b!1265457 m!1165609))

(declare-fun m!1165611 () Bool)

(assert (=> d!138907 m!1165611))

(assert (=> d!138907 m!1165591))

(declare-fun m!1165613 () Bool)

(assert (=> b!1265450 m!1165613))

(declare-fun m!1165615 () Bool)

(assert (=> b!1265454 m!1165615))

(declare-fun m!1165617 () Bool)

(assert (=> bm!62411 m!1165617))

(assert (=> b!1265361 d!138907))

(declare-fun d!138917 () Bool)

(declare-fun res!842575 () Bool)

(declare-fun e!720662 () Bool)

(assert (=> d!138917 (=> res!842575 e!720662)))

(assert (=> d!138917 (= res!842575 (or (is-Nil!28308 l!706) (is-Nil!28308 (t!41832 l!706))))))

(assert (=> d!138917 (= (isStrictlySorted!786 l!706) e!720662)))

(declare-fun b!1265463 () Bool)

(declare-fun e!720663 () Bool)

(assert (=> b!1265463 (= e!720662 e!720663)))

(declare-fun res!842576 () Bool)

(assert (=> b!1265463 (=> (not res!842576) (not e!720663))))

(assert (=> b!1265463 (= res!842576 (bvslt (_1!10589 (h!29516 l!706)) (_1!10589 (h!29516 (t!41832 l!706)))))))

(declare-fun b!1265464 () Bool)

(assert (=> b!1265464 (= e!720663 (isStrictlySorted!786 (t!41832 l!706)))))

(assert (= (and d!138917 (not res!842575)) b!1265463))

(assert (= (and b!1265463 res!842576) b!1265464))

(declare-fun m!1165619 () Bool)

(assert (=> b!1265464 m!1165619))

(assert (=> start!106400 d!138917))

(declare-fun d!138919 () Bool)

(declare-fun res!842587 () Bool)

(declare-fun e!720680 () Bool)

(assert (=> d!138919 (=> res!842587 e!720680)))

(assert (=> d!138919 (= res!842587 (and (is-Cons!28307 l!706) (= (_1!10589 (h!29516 l!706)) key1!31)))))

(assert (=> d!138919 (= (containsKey!645 l!706 key1!31) e!720680)))

(declare-fun b!1265491 () Bool)

(declare-fun e!720681 () Bool)

(assert (=> b!1265491 (= e!720680 e!720681)))

(declare-fun res!842588 () Bool)

(assert (=> b!1265491 (=> (not res!842588) (not e!720681))))

