; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137140 () Bool)

(assert start!137140)

(declare-fun b!1580199 () Bool)

(declare-fun e!881544 () Bool)

(declare-fun tp_is_empty!39211 () Bool)

(declare-fun tp!114487 () Bool)

(assert (=> b!1580199 (= e!881544 (and tp_is_empty!39211 tp!114487))))

(declare-fun b!1580200 () Bool)

(declare-fun res!1079604 () Bool)

(declare-fun e!881546 () Bool)

(assert (=> b!1580200 (=> (not res!1079604) (not e!881546))))

(declare-fun key!405 () (_ BitVec 64))

(declare-datatypes ((B!2666 0))(
  ( (B!2667 (val!19695 Int)) )
))
(declare-datatypes ((tuple2!25584 0))(
  ( (tuple2!25585 (_1!12803 (_ BitVec 64)) (_2!12803 B!2666)) )
))
(declare-datatypes ((List!36856 0))(
  ( (Nil!36853) (Cons!36852 (h!38396 tuple2!25584) (t!51762 List!36856)) )
))
(declare-fun l!1390 () List!36856)

(declare-fun value!194 () B!2666)

(declare-fun contains!10442 (List!36856 tuple2!25584) Bool)

(assert (=> b!1580200 (= res!1079604 (contains!10442 l!1390 (tuple2!25585 key!405 value!194)))))

(declare-fun b!1580202 () Bool)

(declare-fun res!1079602 () Bool)

(assert (=> b!1580202 (=> (not res!1079602) (not e!881546))))

(declare-fun containsKey!917 (List!36856 (_ BitVec 64)) Bool)

(assert (=> b!1580202 (= res!1079602 (containsKey!917 l!1390 key!405))))

(declare-fun b!1580203 () Bool)

(declare-fun e!881545 () Bool)

(declare-datatypes ((Option!904 0))(
  ( (Some!903 (v!22398 B!2666)) (None!902) )
))
(declare-fun getValueByKey!817 (List!36856 (_ BitVec 64)) Option!904)

(assert (=> b!1580203 (= e!881545 (not (= (getValueByKey!817 l!1390 key!405) (Some!903 value!194))))))

(declare-fun b!1580204 () Bool)

(assert (=> b!1580204 (= e!881546 e!881545)))

(declare-fun res!1079601 () Bool)

(assert (=> b!1580204 (=> (not res!1079601) (not e!881545))))

(declare-datatypes ((tuple2!25586 0))(
  ( (tuple2!25587 (_1!12804 tuple2!25584) (_2!12804 List!36856)) )
))
(declare-datatypes ((Option!905 0))(
  ( (Some!904 (v!22399 tuple2!25586)) (None!903) )
))
(declare-fun lt!676503 () Option!905)

(declare-fun isEmpty!1170 (Option!905) Bool)

(assert (=> b!1580204 (= res!1079601 (not (isEmpty!1170 lt!676503)))))

(declare-fun unapply!82 (List!36856) Option!905)

(assert (=> b!1580204 (= lt!676503 (unapply!82 l!1390))))

(declare-fun b!1580201 () Bool)

(declare-fun res!1079603 () Bool)

(assert (=> b!1580201 (=> (not res!1079603) (not e!881545))))

(get-info :version)

(declare-fun get!26790 (Option!905) tuple2!25586)

(assert (=> b!1580201 (= res!1079603 ((_ is Nil!36853) (_2!12804 (get!26790 lt!676503))))))

(declare-fun res!1079600 () Bool)

(assert (=> start!137140 (=> (not res!1079600) (not e!881546))))

(declare-fun isStrictlySorted!1071 (List!36856) Bool)

(assert (=> start!137140 (= res!1079600 (isStrictlySorted!1071 l!1390))))

(assert (=> start!137140 e!881546))

(assert (=> start!137140 e!881544))

(assert (=> start!137140 true))

(assert (=> start!137140 tp_is_empty!39211))

(assert (= (and start!137140 res!1079600) b!1580202))

(assert (= (and b!1580202 res!1079602) b!1580200))

(assert (= (and b!1580200 res!1079604) b!1580204))

(assert (= (and b!1580204 res!1079601) b!1580201))

(assert (= (and b!1580201 res!1079603) b!1580203))

(assert (= (and start!137140 ((_ is Cons!36852) l!1390)) b!1580199))

(declare-fun m!1451013 () Bool)

(assert (=> b!1580201 m!1451013))

(declare-fun m!1451015 () Bool)

(assert (=> b!1580204 m!1451015))

(declare-fun m!1451017 () Bool)

(assert (=> b!1580204 m!1451017))

(declare-fun m!1451019 () Bool)

(assert (=> b!1580203 m!1451019))

(declare-fun m!1451021 () Bool)

(assert (=> start!137140 m!1451021))

(declare-fun m!1451023 () Bool)

(assert (=> b!1580202 m!1451023))

(declare-fun m!1451025 () Bool)

(assert (=> b!1580200 m!1451025))

(check-sat (not b!1580200) (not b!1580201) (not b!1580204) (not b!1580199) (not b!1580202) tp_is_empty!39211 (not start!137140) (not b!1580203))
(check-sat)
(get-model)

(declare-fun d!166197 () Bool)

(declare-fun lt!676514 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!824 (List!36856) (InoxSet tuple2!25584))

(assert (=> d!166197 (= lt!676514 (select (content!824 l!1390) (tuple2!25585 key!405 value!194)))))

(declare-fun e!881578 () Bool)

(assert (=> d!166197 (= lt!676514 e!881578)))

(declare-fun res!1079648 () Bool)

(assert (=> d!166197 (=> (not res!1079648) (not e!881578))))

(assert (=> d!166197 (= res!1079648 ((_ is Cons!36852) l!1390))))

(assert (=> d!166197 (= (contains!10442 l!1390 (tuple2!25585 key!405 value!194)) lt!676514)))

(declare-fun b!1580253 () Bool)

(declare-fun e!881577 () Bool)

(assert (=> b!1580253 (= e!881578 e!881577)))

(declare-fun res!1079647 () Bool)

(assert (=> b!1580253 (=> res!1079647 e!881577)))

(assert (=> b!1580253 (= res!1079647 (= (h!38396 l!1390) (tuple2!25585 key!405 value!194)))))

(declare-fun b!1580254 () Bool)

(assert (=> b!1580254 (= e!881577 (contains!10442 (t!51762 l!1390) (tuple2!25585 key!405 value!194)))))

(assert (= (and d!166197 res!1079648) b!1580253))

(assert (= (and b!1580253 (not res!1079647)) b!1580254))

(declare-fun m!1451055 () Bool)

(assert (=> d!166197 m!1451055))

(declare-fun m!1451057 () Bool)

(assert (=> d!166197 m!1451057))

(declare-fun m!1451059 () Bool)

(assert (=> b!1580254 m!1451059))

(assert (=> b!1580200 d!166197))

(declare-fun d!166203 () Bool)

(assert (=> d!166203 (= (get!26790 lt!676503) (v!22399 lt!676503))))

(assert (=> b!1580201 d!166203))

(declare-fun d!166209 () Bool)

(declare-fun res!1079661 () Bool)

(declare-fun e!881595 () Bool)

(assert (=> d!166209 (=> res!1079661 e!881595)))

(assert (=> d!166209 (= res!1079661 (or ((_ is Nil!36853) l!1390) ((_ is Nil!36853) (t!51762 l!1390))))))

(assert (=> d!166209 (= (isStrictlySorted!1071 l!1390) e!881595)))

(declare-fun b!1580275 () Bool)

(declare-fun e!881596 () Bool)

(assert (=> b!1580275 (= e!881595 e!881596)))

(declare-fun res!1079662 () Bool)

(assert (=> b!1580275 (=> (not res!1079662) (not e!881596))))

(assert (=> b!1580275 (= res!1079662 (bvslt (_1!12803 (h!38396 l!1390)) (_1!12803 (h!38396 (t!51762 l!1390)))))))

(declare-fun b!1580276 () Bool)

(assert (=> b!1580276 (= e!881596 (isStrictlySorted!1071 (t!51762 l!1390)))))

(assert (= (and d!166209 (not res!1079661)) b!1580275))

(assert (= (and b!1580275 res!1079662) b!1580276))

(declare-fun m!1451069 () Bool)

(assert (=> b!1580276 m!1451069))

(assert (=> start!137140 d!166209))

(declare-fun d!166213 () Bool)

(declare-fun res!1079671 () Bool)

(declare-fun e!881607 () Bool)

(assert (=> d!166213 (=> res!1079671 e!881607)))

(assert (=> d!166213 (= res!1079671 (and ((_ is Cons!36852) l!1390) (= (_1!12803 (h!38396 l!1390)) key!405)))))

(assert (=> d!166213 (= (containsKey!917 l!1390 key!405) e!881607)))

(declare-fun b!1580289 () Bool)

(declare-fun e!881608 () Bool)

(assert (=> b!1580289 (= e!881607 e!881608)))

(declare-fun res!1079672 () Bool)

(assert (=> b!1580289 (=> (not res!1079672) (not e!881608))))

(assert (=> b!1580289 (= res!1079672 (and (or (not ((_ is Cons!36852) l!1390)) (bvsle (_1!12803 (h!38396 l!1390)) key!405)) ((_ is Cons!36852) l!1390) (bvslt (_1!12803 (h!38396 l!1390)) key!405)))))

(declare-fun b!1580290 () Bool)

(assert (=> b!1580290 (= e!881608 (containsKey!917 (t!51762 l!1390) key!405))))

(assert (= (and d!166213 (not res!1079671)) b!1580289))

(assert (= (and b!1580289 res!1079672) b!1580290))

(declare-fun m!1451075 () Bool)

(assert (=> b!1580290 m!1451075))

(assert (=> b!1580202 d!166213))

(declare-fun b!1580316 () Bool)

(declare-fun e!881628 () Option!904)

(assert (=> b!1580316 (= e!881628 None!902)))

(declare-fun b!1580313 () Bool)

(declare-fun e!881627 () Option!904)

(assert (=> b!1580313 (= e!881627 (Some!903 (_2!12803 (h!38396 l!1390))))))

(declare-fun d!166225 () Bool)

(declare-fun c!146454 () Bool)

(assert (=> d!166225 (= c!146454 (and ((_ is Cons!36852) l!1390) (= (_1!12803 (h!38396 l!1390)) key!405)))))

(assert (=> d!166225 (= (getValueByKey!817 l!1390 key!405) e!881627)))

(declare-fun b!1580315 () Bool)

(assert (=> b!1580315 (= e!881628 (getValueByKey!817 (t!51762 l!1390) key!405))))

(declare-fun b!1580314 () Bool)

(assert (=> b!1580314 (= e!881627 e!881628)))

(declare-fun c!146455 () Bool)

(assert (=> b!1580314 (= c!146455 (and ((_ is Cons!36852) l!1390) (not (= (_1!12803 (h!38396 l!1390)) key!405))))))

(assert (= (and d!166225 c!146454) b!1580313))

(assert (= (and d!166225 (not c!146454)) b!1580314))

(assert (= (and b!1580314 c!146455) b!1580315))

(assert (= (and b!1580314 (not c!146455)) b!1580316))

(declare-fun m!1451081 () Bool)

(assert (=> b!1580315 m!1451081))

(assert (=> b!1580203 d!166225))

(declare-fun d!166231 () Bool)

(assert (=> d!166231 (= (isEmpty!1170 lt!676503) (not ((_ is Some!904) lt!676503)))))

(assert (=> b!1580204 d!166231))

(declare-fun d!166233 () Bool)

(assert (=> d!166233 (= (unapply!82 l!1390) (ite ((_ is Nil!36853) l!1390) None!903 (Some!904 (tuple2!25587 (h!38396 l!1390) (t!51762 l!1390)))))))

(assert (=> b!1580204 d!166233))

(declare-fun b!1580339 () Bool)

(declare-fun e!881641 () Bool)

(declare-fun tp!114498 () Bool)

(assert (=> b!1580339 (= e!881641 (and tp_is_empty!39211 tp!114498))))

(assert (=> b!1580199 (= tp!114487 e!881641)))

(assert (= (and b!1580199 ((_ is Cons!36852) (t!51762 l!1390))) b!1580339))

(check-sat (not b!1580290) (not b!1580339) (not b!1580254) (not b!1580276) (not d!166197) (not b!1580315) tp_is_empty!39211)
(check-sat)
(get-model)

(declare-fun b!1580349 () Bool)

(declare-fun e!881647 () Option!904)

(assert (=> b!1580349 (= e!881647 None!902)))

(declare-fun b!1580346 () Bool)

(declare-fun e!881646 () Option!904)

(assert (=> b!1580346 (= e!881646 (Some!903 (_2!12803 (h!38396 (t!51762 l!1390)))))))

(declare-fun d!166239 () Bool)

(declare-fun c!146462 () Bool)

(assert (=> d!166239 (= c!146462 (and ((_ is Cons!36852) (t!51762 l!1390)) (= (_1!12803 (h!38396 (t!51762 l!1390))) key!405)))))

(assert (=> d!166239 (= (getValueByKey!817 (t!51762 l!1390) key!405) e!881646)))

(declare-fun b!1580348 () Bool)

(assert (=> b!1580348 (= e!881647 (getValueByKey!817 (t!51762 (t!51762 l!1390)) key!405))))

(declare-fun b!1580347 () Bool)

(assert (=> b!1580347 (= e!881646 e!881647)))

(declare-fun c!146463 () Bool)

(assert (=> b!1580347 (= c!146463 (and ((_ is Cons!36852) (t!51762 l!1390)) (not (= (_1!12803 (h!38396 (t!51762 l!1390))) key!405))))))

(assert (= (and d!166239 c!146462) b!1580346))

(assert (= (and d!166239 (not c!146462)) b!1580347))

(assert (= (and b!1580347 c!146463) b!1580348))

(assert (= (and b!1580347 (not c!146463)) b!1580349))

(declare-fun m!1451091 () Bool)

(assert (=> b!1580348 m!1451091))

(assert (=> b!1580315 d!166239))

(declare-fun d!166241 () Bool)

(declare-fun c!146466 () Bool)

(assert (=> d!166241 (= c!146466 ((_ is Nil!36853) l!1390))))

(declare-fun e!881650 () (InoxSet tuple2!25584))

(assert (=> d!166241 (= (content!824 l!1390) e!881650)))

(declare-fun b!1580354 () Bool)

(assert (=> b!1580354 (= e!881650 ((as const (Array tuple2!25584 Bool)) false))))

(declare-fun b!1580355 () Bool)

(assert (=> b!1580355 (= e!881650 ((_ map or) (store ((as const (Array tuple2!25584 Bool)) false) (h!38396 l!1390) true) (content!824 (t!51762 l!1390))))))

(assert (= (and d!166241 c!146466) b!1580354))

(assert (= (and d!166241 (not c!146466)) b!1580355))

(declare-fun m!1451093 () Bool)

(assert (=> b!1580355 m!1451093))

(declare-fun m!1451095 () Bool)

(assert (=> b!1580355 m!1451095))

(assert (=> d!166197 d!166241))

(declare-fun d!166243 () Bool)

(declare-fun res!1079689 () Bool)

(declare-fun e!881651 () Bool)

(assert (=> d!166243 (=> res!1079689 e!881651)))

(assert (=> d!166243 (= res!1079689 (and ((_ is Cons!36852) (t!51762 l!1390)) (= (_1!12803 (h!38396 (t!51762 l!1390))) key!405)))))

(assert (=> d!166243 (= (containsKey!917 (t!51762 l!1390) key!405) e!881651)))

(declare-fun b!1580356 () Bool)

(declare-fun e!881652 () Bool)

(assert (=> b!1580356 (= e!881651 e!881652)))

(declare-fun res!1079690 () Bool)

(assert (=> b!1580356 (=> (not res!1079690) (not e!881652))))

(assert (=> b!1580356 (= res!1079690 (and (or (not ((_ is Cons!36852) (t!51762 l!1390))) (bvsle (_1!12803 (h!38396 (t!51762 l!1390))) key!405)) ((_ is Cons!36852) (t!51762 l!1390)) (bvslt (_1!12803 (h!38396 (t!51762 l!1390))) key!405)))))

(declare-fun b!1580357 () Bool)

(assert (=> b!1580357 (= e!881652 (containsKey!917 (t!51762 (t!51762 l!1390)) key!405))))

(assert (= (and d!166243 (not res!1079689)) b!1580356))

(assert (= (and b!1580356 res!1079690) b!1580357))

(declare-fun m!1451097 () Bool)

(assert (=> b!1580357 m!1451097))

(assert (=> b!1580290 d!166243))

(declare-fun d!166245 () Bool)

(declare-fun res!1079691 () Bool)

(declare-fun e!881653 () Bool)

(assert (=> d!166245 (=> res!1079691 e!881653)))

(assert (=> d!166245 (= res!1079691 (or ((_ is Nil!36853) (t!51762 l!1390)) ((_ is Nil!36853) (t!51762 (t!51762 l!1390)))))))

(assert (=> d!166245 (= (isStrictlySorted!1071 (t!51762 l!1390)) e!881653)))

(declare-fun b!1580358 () Bool)

(declare-fun e!881654 () Bool)

(assert (=> b!1580358 (= e!881653 e!881654)))

(declare-fun res!1079692 () Bool)

(assert (=> b!1580358 (=> (not res!1079692) (not e!881654))))

(assert (=> b!1580358 (= res!1079692 (bvslt (_1!12803 (h!38396 (t!51762 l!1390))) (_1!12803 (h!38396 (t!51762 (t!51762 l!1390))))))))

(declare-fun b!1580359 () Bool)

(assert (=> b!1580359 (= e!881654 (isStrictlySorted!1071 (t!51762 (t!51762 l!1390))))))

(assert (= (and d!166245 (not res!1079691)) b!1580358))

(assert (= (and b!1580358 res!1079692) b!1580359))

(declare-fun m!1451099 () Bool)

(assert (=> b!1580359 m!1451099))

(assert (=> b!1580276 d!166245))

(declare-fun lt!676519 () Bool)

(declare-fun d!166247 () Bool)

(assert (=> d!166247 (= lt!676519 (select (content!824 (t!51762 l!1390)) (tuple2!25585 key!405 value!194)))))

(declare-fun e!881656 () Bool)

(assert (=> d!166247 (= lt!676519 e!881656)))

(declare-fun res!1079694 () Bool)

(assert (=> d!166247 (=> (not res!1079694) (not e!881656))))

(assert (=> d!166247 (= res!1079694 ((_ is Cons!36852) (t!51762 l!1390)))))

(assert (=> d!166247 (= (contains!10442 (t!51762 l!1390) (tuple2!25585 key!405 value!194)) lt!676519)))

(declare-fun b!1580360 () Bool)

(declare-fun e!881655 () Bool)

(assert (=> b!1580360 (= e!881656 e!881655)))

(declare-fun res!1079693 () Bool)

(assert (=> b!1580360 (=> res!1079693 e!881655)))

(assert (=> b!1580360 (= res!1079693 (= (h!38396 (t!51762 l!1390)) (tuple2!25585 key!405 value!194)))))

(declare-fun b!1580361 () Bool)

(assert (=> b!1580361 (= e!881655 (contains!10442 (t!51762 (t!51762 l!1390)) (tuple2!25585 key!405 value!194)))))

(assert (= (and d!166247 res!1079694) b!1580360))

(assert (= (and b!1580360 (not res!1079693)) b!1580361))

(assert (=> d!166247 m!1451095))

(declare-fun m!1451101 () Bool)

(assert (=> d!166247 m!1451101))

(declare-fun m!1451103 () Bool)

(assert (=> b!1580361 m!1451103))

(assert (=> b!1580254 d!166247))

(declare-fun b!1580362 () Bool)

(declare-fun e!881657 () Bool)

(declare-fun tp!114503 () Bool)

(assert (=> b!1580362 (= e!881657 (and tp_is_empty!39211 tp!114503))))

(assert (=> b!1580339 (= tp!114498 e!881657)))

(assert (= (and b!1580339 ((_ is Cons!36852) (t!51762 (t!51762 l!1390)))) b!1580362))

(check-sat (not b!1580359) (not d!166247) (not b!1580361) (not b!1580362) (not b!1580348) tp_is_empty!39211 (not b!1580357) (not b!1580355))
(check-sat)
