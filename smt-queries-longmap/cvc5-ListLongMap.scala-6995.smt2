; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88940 () Bool)

(assert start!88940)

(declare-fun b!1020284 () Bool)

(declare-fun res!683702 () Bool)

(declare-fun e!574249 () Bool)

(assert (=> b!1020284 (=> (not res!683702) (not e!574249))))

(declare-datatypes ((B!1680 0))(
  ( (B!1681 (val!11924 Int)) )
))
(declare-datatypes ((tuple2!15398 0))(
  ( (tuple2!15399 (_1!7710 (_ BitVec 64)) (_2!7710 B!1680)) )
))
(declare-datatypes ((List!21601 0))(
  ( (Nil!21598) (Cons!21597 (h!22804 tuple2!15398) (t!30597 List!21601)) )
))
(declare-fun l!996 () List!21601)

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!539 (List!21601 (_ BitVec 64)) Bool)

(assert (=> b!1020284 (= res!683702 (containsKey!539 l!996 key!261))))

(declare-fun res!683704 () Bool)

(assert (=> start!88940 (=> (not res!683704) (not e!574249))))

(declare-fun isStrictlySorted!665 (List!21601) Bool)

(assert (=> start!88940 (= res!683704 (isStrictlySorted!665 l!996))))

(assert (=> start!88940 e!574249))

(declare-fun e!574250 () Bool)

(assert (=> start!88940 e!574250))

(assert (=> start!88940 true))

(declare-fun tp_is_empty!23747 () Bool)

(assert (=> start!88940 tp_is_empty!23747))

(declare-fun b!1020285 () Bool)

(declare-fun e!574251 () Bool)

(assert (=> b!1020285 (= e!574249 e!574251)))

(declare-fun res!683705 () Bool)

(assert (=> b!1020285 (=> (not res!683705) (not e!574251))))

(assert (=> b!1020285 (= res!683705 (and (is-Cons!21597 l!996) (bvslt (_1!7710 (h!22804 l!996)) key!261)))))

(declare-fun value!172 () B!1680)

(declare-fun lt!450131 () List!21601)

(declare-fun insertStrictlySorted!356 (List!21601 (_ BitVec 64) B!1680) List!21601)

(assert (=> b!1020285 (= lt!450131 (insertStrictlySorted!356 l!996 key!261 value!172))))

(declare-fun b!1020286 () Bool)

(declare-fun res!683703 () Bool)

(assert (=> b!1020286 (=> (not res!683703) (not e!574251))))

(assert (=> b!1020286 (= res!683703 (isStrictlySorted!665 (t!30597 l!996)))))

(declare-fun b!1020287 () Bool)

(assert (=> b!1020287 (= e!574251 (not (containsKey!539 (t!30597 l!996) key!261)))))

(declare-fun b!1020288 () Bool)

(declare-fun tp!71119 () Bool)

(assert (=> b!1020288 (= e!574250 (and tp_is_empty!23747 tp!71119))))

(assert (= (and start!88940 res!683704) b!1020284))

(assert (= (and b!1020284 res!683702) b!1020285))

(assert (= (and b!1020285 res!683705) b!1020286))

(assert (= (and b!1020286 res!683703) b!1020287))

(assert (= (and start!88940 (is-Cons!21597 l!996)) b!1020288))

(declare-fun m!941219 () Bool)

(assert (=> b!1020286 m!941219))

(declare-fun m!941221 () Bool)

(assert (=> start!88940 m!941221))

(declare-fun m!941223 () Bool)

(assert (=> b!1020287 m!941223))

(declare-fun m!941225 () Bool)

(assert (=> b!1020285 m!941225))

(declare-fun m!941227 () Bool)

(assert (=> b!1020284 m!941227))

(push 1)

(assert (not b!1020288))

(assert (not b!1020284))

(assert (not b!1020287))

(assert (not b!1020285))

(assert tp_is_empty!23747)

(assert (not start!88940))

(assert (not b!1020286))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122429 () Bool)

(declare-fun res!683716 () Bool)

(declare-fun e!574262 () Bool)

(assert (=> d!122429 (=> res!683716 e!574262)))

(assert (=> d!122429 (= res!683716 (or (is-Nil!21598 l!996) (is-Nil!21598 (t!30597 l!996))))))

(assert (=> d!122429 (= (isStrictlySorted!665 l!996) e!574262)))

(declare-fun b!1020299 () Bool)

(declare-fun e!574263 () Bool)

(assert (=> b!1020299 (= e!574262 e!574263)))

(declare-fun res!683717 () Bool)

(assert (=> b!1020299 (=> (not res!683717) (not e!574263))))

(assert (=> b!1020299 (= res!683717 (bvslt (_1!7710 (h!22804 l!996)) (_1!7710 (h!22804 (t!30597 l!996)))))))

(declare-fun b!1020300 () Bool)

(assert (=> b!1020300 (= e!574263 (isStrictlySorted!665 (t!30597 l!996)))))

(assert (= (and d!122429 (not res!683716)) b!1020299))

(assert (= (and b!1020299 res!683717) b!1020300))

(assert (=> b!1020300 m!941219))

(assert (=> start!88940 d!122429))

(declare-fun d!122433 () Bool)

(declare-fun res!683720 () Bool)

(declare-fun e!574266 () Bool)

(assert (=> d!122433 (=> res!683720 e!574266)))

(assert (=> d!122433 (= res!683720 (or (is-Nil!21598 (t!30597 l!996)) (is-Nil!21598 (t!30597 (t!30597 l!996)))))))

(assert (=> d!122433 (= (isStrictlySorted!665 (t!30597 l!996)) e!574266)))

(declare-fun b!1020303 () Bool)

(declare-fun e!574267 () Bool)

(assert (=> b!1020303 (= e!574266 e!574267)))

(declare-fun res!683721 () Bool)

(assert (=> b!1020303 (=> (not res!683721) (not e!574267))))

(assert (=> b!1020303 (= res!683721 (bvslt (_1!7710 (h!22804 (t!30597 l!996))) (_1!7710 (h!22804 (t!30597 (t!30597 l!996))))))))

(declare-fun b!1020304 () Bool)

(assert (=> b!1020304 (= e!574267 (isStrictlySorted!665 (t!30597 (t!30597 l!996))))))

(assert (= (and d!122433 (not res!683720)) b!1020303))

(assert (= (and b!1020303 res!683721) b!1020304))

(declare-fun m!941231 () Bool)

(assert (=> b!1020304 m!941231))

(assert (=> b!1020286 d!122433))

(declare-fun d!122435 () Bool)

(declare-fun res!683740 () Bool)

(declare-fun e!574286 () Bool)

(assert (=> d!122435 (=> res!683740 e!574286)))

(assert (=> d!122435 (= res!683740 (and (is-Cons!21597 (t!30597 l!996)) (= (_1!7710 (h!22804 (t!30597 l!996))) key!261)))))

(assert (=> d!122435 (= (containsKey!539 (t!30597 l!996) key!261) e!574286)))

(declare-fun b!1020323 () Bool)

(declare-fun e!574287 () Bool)

(assert (=> b!1020323 (= e!574286 e!574287)))

(declare-fun res!683741 () Bool)

(assert (=> b!1020323 (=> (not res!683741) (not e!574287))))

(assert (=> b!1020323 (= res!683741 (and (or (not (is-Cons!21597 (t!30597 l!996))) (bvsle (_1!7710 (h!22804 (t!30597 l!996))) key!261)) (is-Cons!21597 (t!30597 l!996)) (bvslt (_1!7710 (h!22804 (t!30597 l!996))) key!261)))))

(declare-fun b!1020324 () Bool)

(assert (=> b!1020324 (= e!574287 (containsKey!539 (t!30597 (t!30597 l!996)) key!261))))

(assert (= (and d!122435 (not res!683740)) b!1020323))

(assert (= (and b!1020323 res!683741) b!1020324))

(declare-fun m!941237 () Bool)

(assert (=> b!1020324 m!941237))

(assert (=> b!1020287 d!122435))

(declare-fun e!574332 () List!21601)

(declare-fun call!43109 () List!21601)

(declare-fun c!103675 () Bool)

(declare-fun bm!43106 () Bool)

(declare-fun $colon$colon!584 (List!21601 tuple2!15398) List!21601)

(assert (=> bm!43106 (= call!43109 ($colon$colon!584 e!574332 (ite c!103675 (h!22804 l!996) (tuple2!15399 key!261 value!172))))))

(declare-fun c!103674 () Bool)

(assert (=> bm!43106 (= c!103674 c!103675)))

(declare-fun b!1020403 () Bool)

(declare-fun e!574333 () List!21601)

(declare-fun e!574335 () List!21601)

(assert (=> b!1020403 (= e!574333 e!574335)))

(declare-fun c!103676 () Bool)

(assert (=> b!1020403 (= c!103676 (and (is-Cons!21597 l!996) (= (_1!7710 (h!22804 l!996)) key!261)))))

(declare-fun bm!43107 () Bool)

(declare-fun call!43111 () List!21601)

(declare-fun call!43110 () List!21601)

(assert (=> bm!43107 (= call!43111 call!43110)))

(declare-fun b!1020404 () Bool)

(assert (=> b!1020404 (= e!574335 call!43110)))

(declare-fun b!1020405 () Bool)

(assert (=> b!1020405 (= e!574332 (insertStrictlySorted!356 (t!30597 l!996) key!261 value!172))))

(declare-fun bm!43108 () Bool)

(assert (=> bm!43108 (= call!43110 call!43109)))

(declare-fun b!1020409 () Bool)

(assert (=> b!1020409 (= e!574333 call!43109)))

(declare-fun c!103677 () Bool)

(declare-fun b!1020410 () Bool)

(assert (=> b!1020410 (= e!574332 (ite c!103676 (t!30597 l!996) (ite c!103677 (Cons!21597 (h!22804 l!996) (t!30597 l!996)) Nil!21598)))))

(declare-fun d!122447 () Bool)

(declare-fun e!574334 () Bool)

(assert (=> d!122447 e!574334))

(declare-fun res!683763 () Bool)

(assert (=> d!122447 (=> (not res!683763) (not e!574334))))

(declare-fun lt!450139 () List!21601)

(assert (=> d!122447 (= res!683763 (isStrictlySorted!665 lt!450139))))

(assert (=> d!122447 (= lt!450139 e!574333)))

(assert (=> d!122447 (= c!103675 (and (is-Cons!21597 l!996) (bvslt (_1!7710 (h!22804 l!996)) key!261)))))

(assert (=> d!122447 (isStrictlySorted!665 l!996)))

(assert (=> d!122447 (= (insertStrictlySorted!356 l!996 key!261 value!172) lt!450139)))

(declare-fun b!1020407 () Bool)

(assert (=> b!1020407 (= c!103677 (and (is-Cons!21597 l!996) (bvsgt (_1!7710 (h!22804 l!996)) key!261)))))

(declare-fun e!574331 () List!21601)

(assert (=> b!1020407 (= e!574335 e!574331)))

(declare-fun b!1020411 () Bool)

(declare-fun contains!5926 (List!21601 tuple2!15398) Bool)

(assert (=> b!1020411 (= e!574334 (contains!5926 lt!450139 (tuple2!15399 key!261 value!172)))))

(declare-fun b!1020412 () Bool)

(assert (=> b!1020412 (= e!574331 call!43111)))

(declare-fun b!1020413 () Bool)

(assert (=> b!1020413 (= e!574331 call!43111)))

(declare-fun b!1020414 () Bool)

(declare-fun res!683762 () Bool)

(assert (=> b!1020414 (=> (not res!683762) (not e!574334))))

(assert (=> b!1020414 (= res!683762 (containsKey!539 lt!450139 key!261))))

(assert (= (and d!122447 c!103675) b!1020409))

(assert (= (and d!122447 (not c!103675)) b!1020403))

(assert (= (and b!1020403 c!103676) b!1020404))

(assert (= (and b!1020403 (not c!103676)) b!1020407))

(assert (= (and b!1020407 c!103677) b!1020412))

(assert (= (and b!1020407 (not c!103677)) b!1020413))

(assert (= (or b!1020412 b!1020413) bm!43107))

(assert (= (or b!1020404 bm!43107) bm!43108))

(assert (= (or b!1020409 bm!43108) bm!43106))

(assert (= (and bm!43106 c!103674) b!1020405))

(assert (= (and bm!43106 (not c!103674)) b!1020410))

(assert (= (and d!122447 res!683763) b!1020414))

(assert (= (and b!1020414 res!683762) b!1020411))

(declare-fun m!941251 () Bool)

(assert (=> d!122447 m!941251))

(assert (=> d!122447 m!941221))

(declare-fun m!941253 () Bool)

(assert (=> bm!43106 m!941253))

(declare-fun m!941255 () Bool)

(assert (=> b!1020405 m!941255))

(declare-fun m!941257 () Bool)

(assert (=> b!1020414 m!941257))

(declare-fun m!941259 () Bool)

(assert (=> b!1020411 m!941259))

(assert (=> b!1020285 d!122447))

(declare-fun d!122455 () Bool)

(declare-fun res!683768 () Bool)

(declare-fun e!574341 () Bool)

(assert (=> d!122455 (=> res!683768 e!574341)))

(assert (=> d!122455 (= res!683768 (and (is-Cons!21597 l!996) (= (_1!7710 (h!22804 l!996)) key!261)))))

(assert (=> d!122455 (= (containsKey!539 l!996 key!261) e!574341)))

(declare-fun b!1020420 () Bool)

(declare-fun e!574342 () Bool)

(assert (=> b!1020420 (= e!574341 e!574342)))

(declare-fun res!683769 () Bool)

(assert (=> b!1020420 (=> (not res!683769) (not e!574342))))

(assert (=> b!1020420 (= res!683769 (and (or (not (is-Cons!21597 l!996)) (bvsle (_1!7710 (h!22804 l!996)) key!261)) (is-Cons!21597 l!996) (bvslt (_1!7710 (h!22804 l!996)) key!261)))))

(declare-fun b!1020421 () Bool)

(assert (=> b!1020421 (= e!574342 (containsKey!539 (t!30597 l!996) key!261))))

(assert (= (and d!122455 (not res!683768)) b!1020420))

(assert (= (and b!1020420 res!683769) b!1020421))

(assert (=> b!1020421 m!941223))

(assert (=> b!1020284 d!122455))

(declare-fun b!1020426 () Bool)

(declare-fun e!574345 () Bool)

(declare-fun tp!71125 () Bool)

(assert (=> b!1020426 (= e!574345 (and tp_is_empty!23747 tp!71125))))

(assert (=> b!1020288 (= tp!71119 e!574345)))

(assert (= (and b!1020288 (is-Cons!21597 (t!30597 l!996))) b!1020426))

(push 1)

(assert (not b!1020405))

(assert (not b!1020426))

(assert (not bm!43106))

(assert tp_is_empty!23747)

(assert (not b!1020324))

(assert (not b!1020411))

(assert (not d!122447))

(assert (not b!1020421))

(assert (not b!1020300))

(assert (not b!1020304))

(assert (not b!1020414))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

