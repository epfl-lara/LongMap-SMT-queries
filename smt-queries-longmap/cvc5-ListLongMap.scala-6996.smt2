; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88726 () Bool)

(assert start!88726)

(declare-fun res!683275 () Bool)

(declare-fun e!573514 () Bool)

(assert (=> start!88726 (=> (not res!683275) (not e!573514))))

(declare-datatypes ((B!1682 0))(
  ( (B!1683 (val!11925 Int)) )
))
(declare-datatypes ((tuple2!15396 0))(
  ( (tuple2!15397 (_1!7709 (_ BitVec 64)) (_2!7709 B!1682)) )
))
(declare-datatypes ((List!21613 0))(
  ( (Nil!21610) (Cons!21609 (h!22807 tuple2!15396) (t!30617 List!21613)) )
))
(declare-fun l!996 () List!21613)

(declare-fun isStrictlySorted!678 (List!21613) Bool)

(assert (=> start!88726 (= res!683275 (isStrictlySorted!678 l!996))))

(assert (=> start!88726 e!573514))

(declare-fun e!573515 () Bool)

(assert (=> start!88726 e!573515))

(assert (=> start!88726 true))

(declare-fun tp_is_empty!23749 () Bool)

(assert (=> start!88726 tp_is_empty!23749))

(declare-fun b!1019133 () Bool)

(declare-fun res!683274 () Bool)

(declare-fun e!573516 () Bool)

(assert (=> b!1019133 (=> (not res!683274) (not e!573516))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!538 (List!21613 (_ BitVec 64)) Bool)

(assert (=> b!1019133 (= res!683274 (containsKey!538 (t!30617 l!996) key!261))))

(declare-fun b!1019134 () Bool)

(declare-fun ListPrimitiveSize!136 (List!21613) Int)

(assert (=> b!1019134 (= e!573516 (>= (ListPrimitiveSize!136 (t!30617 l!996)) (ListPrimitiveSize!136 l!996)))))

(declare-fun b!1019135 () Bool)

(declare-fun res!683272 () Bool)

(assert (=> b!1019135 (=> (not res!683272) (not e!573516))))

(assert (=> b!1019135 (= res!683272 (isStrictlySorted!678 (t!30617 l!996)))))

(declare-fun b!1019136 () Bool)

(assert (=> b!1019136 (= e!573514 e!573516)))

(declare-fun res!683276 () Bool)

(assert (=> b!1019136 (=> (not res!683276) (not e!573516))))

(assert (=> b!1019136 (= res!683276 (and (is-Cons!21609 l!996) (bvslt (_1!7709 (h!22807 l!996)) key!261)))))

(declare-fun value!172 () B!1682)

(declare-fun lt!449628 () List!21613)

(declare-fun insertStrictlySorted!356 (List!21613 (_ BitVec 64) B!1682) List!21613)

(assert (=> b!1019136 (= lt!449628 (insertStrictlySorted!356 l!996 key!261 value!172))))

(declare-fun b!1019137 () Bool)

(declare-fun res!683273 () Bool)

(assert (=> b!1019137 (=> (not res!683273) (not e!573514))))

(assert (=> b!1019137 (= res!683273 (containsKey!538 l!996 key!261))))

(declare-fun b!1019138 () Bool)

(declare-fun tp!71131 () Bool)

(assert (=> b!1019138 (= e!573515 (and tp_is_empty!23749 tp!71131))))

(assert (= (and start!88726 res!683275) b!1019137))

(assert (= (and b!1019137 res!683273) b!1019136))

(assert (= (and b!1019136 res!683276) b!1019135))

(assert (= (and b!1019135 res!683272) b!1019133))

(assert (= (and b!1019133 res!683274) b!1019134))

(assert (= (and start!88726 (is-Cons!21609 l!996)) b!1019138))

(declare-fun m!939607 () Bool)

(assert (=> b!1019136 m!939607))

(declare-fun m!939609 () Bool)

(assert (=> b!1019137 m!939609))

(declare-fun m!939611 () Bool)

(assert (=> b!1019135 m!939611))

(declare-fun m!939613 () Bool)

(assert (=> b!1019134 m!939613))

(declare-fun m!939615 () Bool)

(assert (=> b!1019134 m!939615))

(declare-fun m!939617 () Bool)

(assert (=> b!1019133 m!939617))

(declare-fun m!939619 () Bool)

(assert (=> start!88726 m!939619))

(push 1)

(assert tp_is_empty!23749)

(assert (not b!1019134))

(assert (not b!1019138))

(assert (not b!1019137))

(assert (not b!1019136))

(assert (not b!1019133))

(assert (not start!88726))

(assert (not b!1019135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1019229 () Bool)

(declare-fun c!103286 () Bool)

(assert (=> b!1019229 (= c!103286 (and (is-Cons!21609 l!996) (bvsgt (_1!7709 (h!22807 l!996)) key!261)))))

(declare-fun e!573576 () List!21613)

(declare-fun e!573577 () List!21613)

(assert (=> b!1019229 (= e!573576 e!573577)))

(declare-fun b!1019230 () Bool)

(declare-fun call!43054 () List!21613)

(assert (=> b!1019230 (= e!573577 call!43054)))

(declare-fun b!1019231 () Bool)

(declare-fun e!573575 () List!21613)

(declare-fun call!43056 () List!21613)

(assert (=> b!1019231 (= e!573575 call!43056)))

(declare-fun e!573578 () Bool)

(declare-fun b!1019232 () Bool)

(declare-fun lt!449641 () List!21613)

(declare-fun contains!5906 (List!21613 tuple2!15396) Bool)

(assert (=> b!1019232 (= e!573578 (contains!5906 lt!449641 (tuple2!15397 key!261 value!172)))))

(declare-fun bm!43051 () Bool)

(declare-fun call!43055 () List!21613)

(assert (=> bm!43051 (= call!43054 call!43055)))

(declare-fun b!1019233 () Bool)

(declare-fun e!573579 () List!21613)

(assert (=> b!1019233 (= e!573579 (insertStrictlySorted!356 (t!30617 l!996) key!261 value!172))))

(declare-fun bm!43053 () Bool)

(assert (=> bm!43053 (= call!43055 call!43056)))

(declare-fun b!1019234 () Bool)

(assert (=> b!1019234 (= e!573575 e!573576)))

(declare-fun c!103285 () Bool)

(assert (=> b!1019234 (= c!103285 (and (is-Cons!21609 l!996) (= (_1!7709 (h!22807 l!996)) key!261)))))

(declare-fun b!1019235 () Bool)

(assert (=> b!1019235 (= e!573579 (ite c!103285 (t!30617 l!996) (ite c!103286 (Cons!21609 (h!22807 l!996) (t!30617 l!996)) Nil!21610)))))

(declare-fun b!1019236 () Bool)

(assert (=> b!1019236 (= e!573577 call!43054)))

(declare-fun c!103283 () Bool)

(declare-fun bm!43052 () Bool)

(declare-fun $colon$colon!586 (List!21613 tuple2!15396) List!21613)

(assert (=> bm!43052 (= call!43056 ($colon$colon!586 e!573579 (ite c!103283 (h!22807 l!996) (tuple2!15397 key!261 value!172))))))

(declare-fun c!103284 () Bool)

(assert (=> bm!43052 (= c!103284 c!103283)))

(declare-fun d!121999 () Bool)

(assert (=> d!121999 e!573578))

(declare-fun res!683338 () Bool)

(assert (=> d!121999 (=> (not res!683338) (not e!573578))))

(assert (=> d!121999 (= res!683338 (isStrictlySorted!678 lt!449641))))

(assert (=> d!121999 (= lt!449641 e!573575)))

(assert (=> d!121999 (= c!103283 (and (is-Cons!21609 l!996) (bvslt (_1!7709 (h!22807 l!996)) key!261)))))

(assert (=> d!121999 (isStrictlySorted!678 l!996)))

(assert (=> d!121999 (= (insertStrictlySorted!356 l!996 key!261 value!172) lt!449641)))

(declare-fun b!1019237 () Bool)

(assert (=> b!1019237 (= e!573576 call!43055)))

(declare-fun b!1019238 () Bool)

(declare-fun res!683337 () Bool)

(assert (=> b!1019238 (=> (not res!683337) (not e!573578))))

(assert (=> b!1019238 (= res!683337 (containsKey!538 lt!449641 key!261))))

(assert (= (and d!121999 c!103283) b!1019231))

(assert (= (and d!121999 (not c!103283)) b!1019234))

(assert (= (and b!1019234 c!103285) b!1019237))

(assert (= (and b!1019234 (not c!103285)) b!1019229))

(assert (= (and b!1019229 c!103286) b!1019230))

(assert (= (and b!1019229 (not c!103286)) b!1019236))

(assert (= (or b!1019230 b!1019236) bm!43051))

(assert (= (or b!1019237 bm!43051) bm!43053))

(assert (= (or b!1019231 bm!43053) bm!43052))

(assert (= (and bm!43052 c!103284) b!1019233))

(assert (= (and bm!43052 (not c!103284)) b!1019235))

(assert (= (and d!121999 res!683338) b!1019238))

(assert (= (and b!1019238 res!683337) b!1019232))

(declare-fun m!939657 () Bool)

(assert (=> b!1019232 m!939657))

(declare-fun m!939659 () Bool)

(assert (=> bm!43052 m!939659))

(declare-fun m!939661 () Bool)

(assert (=> b!1019238 m!939661))

(declare-fun m!939663 () Bool)

(assert (=> d!121999 m!939663))

(assert (=> d!121999 m!939619))

(declare-fun m!939665 () Bool)

(assert (=> b!1019233 m!939665))

(assert (=> b!1019136 d!121999))

(declare-fun d!122017 () Bool)

(declare-fun res!683343 () Bool)

(declare-fun e!573587 () Bool)

(assert (=> d!122017 (=> res!683343 e!573587)))

(assert (=> d!122017 (= res!683343 (or (is-Nil!21610 l!996) (is-Nil!21610 (t!30617 l!996))))))

(assert (=> d!122017 (= (isStrictlySorted!678 l!996) e!573587)))

(declare-fun b!1019249 () Bool)

(declare-fun e!573588 () Bool)

(assert (=> b!1019249 (= e!573587 e!573588)))

(declare-fun res!683344 () Bool)

(assert (=> b!1019249 (=> (not res!683344) (not e!573588))))

(assert (=> b!1019249 (= res!683344 (bvslt (_1!7709 (h!22807 l!996)) (_1!7709 (h!22807 (t!30617 l!996)))))))

(declare-fun b!1019250 () Bool)

(assert (=> b!1019250 (= e!573588 (isStrictlySorted!678 (t!30617 l!996)))))

(assert (= (and d!122017 (not res!683343)) b!1019249))

(assert (= (and b!1019249 res!683344) b!1019250))

(assert (=> b!1019250 m!939611))

(assert (=> start!88726 d!122017))

(declare-fun d!122019 () Bool)

(declare-fun res!683349 () Bool)

(declare-fun e!573594 () Bool)

(assert (=> d!122019 (=> res!683349 e!573594)))

(assert (=> d!122019 (= res!683349 (and (is-Cons!21609 l!996) (= (_1!7709 (h!22807 l!996)) key!261)))))

(assert (=> d!122019 (= (containsKey!538 l!996 key!261) e!573594)))

(declare-fun b!1019259 () Bool)

(declare-fun e!573595 () Bool)

(assert (=> b!1019259 (= e!573594 e!573595)))

(declare-fun res!683350 () Bool)

(assert (=> b!1019259 (=> (not res!683350) (not e!573595))))

(assert (=> b!1019259 (= res!683350 (and (or (not (is-Cons!21609 l!996)) (bvsle (_1!7709 (h!22807 l!996)) key!261)) (is-Cons!21609 l!996) (bvslt (_1!7709 (h!22807 l!996)) key!261)))))

(declare-fun b!1019260 () Bool)

(assert (=> b!1019260 (= e!573595 (containsKey!538 (t!30617 l!996) key!261))))

(assert (= (and d!122019 (not res!683349)) b!1019259))

(assert (= (and b!1019259 res!683350) b!1019260))

(assert (=> b!1019260 m!939617))

(assert (=> b!1019137 d!122019))

(declare-fun d!122025 () Bool)

(declare-fun lt!449650 () Int)

(assert (=> d!122025 (>= lt!449650 0)))

(declare-fun e!573604 () Int)

(assert (=> d!122025 (= lt!449650 e!573604)))

(declare-fun c!103299 () Bool)

(assert (=> d!122025 (= c!103299 (is-Nil!21610 (t!30617 l!996)))))

(assert (=> d!122025 (= (ListPrimitiveSize!136 (t!30617 l!996)) lt!449650)))

(declare-fun b!1019275 () Bool)

(assert (=> b!1019275 (= e!573604 0)))

(declare-fun b!1019276 () Bool)

(assert (=> b!1019276 (= e!573604 (+ 1 (ListPrimitiveSize!136 (t!30617 (t!30617 l!996)))))))

(assert (= (and d!122025 c!103299) b!1019275))

(assert (= (and d!122025 (not c!103299)) b!1019276))

(declare-fun m!939669 () Bool)

(assert (=> b!1019276 m!939669))

(assert (=> b!1019134 d!122025))

(declare-fun d!122027 () Bool)

(declare-fun lt!449651 () Int)

(assert (=> d!122027 (>= lt!449651 0)))

(declare-fun e!573605 () Int)

(assert (=> d!122027 (= lt!449651 e!573605)))

(declare-fun c!103300 () Bool)

(assert (=> d!122027 (= c!103300 (is-Nil!21610 l!996))))

(assert (=> d!122027 (= (ListPrimitiveSize!136 l!996) lt!449651)))

(declare-fun b!1019277 () Bool)

(assert (=> b!1019277 (= e!573605 0)))

(declare-fun b!1019278 () Bool)

(assert (=> b!1019278 (= e!573605 (+ 1 (ListPrimitiveSize!136 (t!30617 l!996))))))

(assert (= (and d!122027 c!103300) b!1019277))

(assert (= (and d!122027 (not c!103300)) b!1019278))

(assert (=> b!1019278 m!939613))

(assert (=> b!1019134 d!122027))

(declare-fun d!122029 () Bool)

(declare-fun res!683351 () Bool)

(declare-fun e!573606 () Bool)

(assert (=> d!122029 (=> res!683351 e!573606)))

(assert (=> d!122029 (= res!683351 (and (is-Cons!21609 (t!30617 l!996)) (= (_1!7709 (h!22807 (t!30617 l!996))) key!261)))))

(assert (=> d!122029 (= (containsKey!538 (t!30617 l!996) key!261) e!573606)))

(declare-fun b!1019279 () Bool)

(declare-fun e!573607 () Bool)

(assert (=> b!1019279 (= e!573606 e!573607)))

(declare-fun res!683352 () Bool)

(assert (=> b!1019279 (=> (not res!683352) (not e!573607))))

(assert (=> b!1019279 (= res!683352 (and (or (not (is-Cons!21609 (t!30617 l!996))) (bvsle (_1!7709 (h!22807 (t!30617 l!996))) key!261)) (is-Cons!21609 (t!30617 l!996)) (bvslt (_1!7709 (h!22807 (t!30617 l!996))) key!261)))))

(declare-fun b!1019280 () Bool)

(assert (=> b!1019280 (= e!573607 (containsKey!538 (t!30617 (t!30617 l!996)) key!261))))

(assert (= (and d!122029 (not res!683351)) b!1019279))

(assert (= (and b!1019279 res!683352) b!1019280))

(declare-fun m!939671 () Bool)

(assert (=> b!1019280 m!939671))

(assert (=> b!1019133 d!122029))

(declare-fun d!122031 () Bool)

(declare-fun res!683353 () Bool)

(declare-fun e!573610 () Bool)

(assert (=> d!122031 (=> res!683353 e!573610)))

(assert (=> d!122031 (= res!683353 (or (is-Nil!21610 (t!30617 l!996)) (is-Nil!21610 (t!30617 (t!30617 l!996)))))))

(assert (=> d!122031 (= (isStrictlySorted!678 (t!30617 l!996)) e!573610)))

(declare-fun b!1019285 () Bool)

(declare-fun e!573611 () Bool)

(assert (=> b!1019285 (= e!573610 e!573611)))

(declare-fun res!683354 () Bool)

(assert (=> b!1019285 (=> (not res!683354) (not e!573611))))

(assert (=> b!1019285 (= res!683354 (bvslt (_1!7709 (h!22807 (t!30617 l!996))) (_1!7709 (h!22807 (t!30617 (t!30617 l!996))))))))

(declare-fun b!1019286 () Bool)

(assert (=> b!1019286 (= e!573611 (isStrictlySorted!678 (t!30617 (t!30617 l!996))))))

(assert (= (and d!122031 (not res!683353)) b!1019285))

(assert (= (and b!1019285 res!683354) b!1019286))

(declare-fun m!939673 () Bool)

(assert (=> b!1019286 m!939673))

(assert (=> b!1019135 d!122031))

(declare-fun b!1019291 () Bool)

(declare-fun e!573616 () Bool)

(declare-fun tp!71140 () Bool)

(assert (=> b!1019291 (= e!573616 (and tp_is_empty!23749 tp!71140))))

(assert (=> b!1019138 (= tp!71131 e!573616)))

(assert (= (and b!1019138 (is-Cons!21609 (t!30617 l!996))) b!1019291))

(push 1)

(assert (not bm!43052))

(assert (not b!1019232))

(assert tp_is_empty!23749)

(assert (not b!1019286))

(assert (not b!1019233))

(assert (not b!1019260))

(assert (not b!1019280))

(assert (not b!1019278))

(assert (not b!1019250))

(assert (not b!1019291))

(assert (not b!1019276))

(assert (not d!121999))

(assert (not b!1019238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

