; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137062 () Bool)

(assert start!137062)

(declare-fun b!1579919 () Bool)

(declare-fun e!881364 () Bool)

(declare-fun tp_is_empty!39159 () Bool)

(declare-fun tp!114390 () Bool)

(assert (=> b!1579919 (= e!881364 (and tp_is_empty!39159 tp!114390))))

(declare-fun res!1079265 () Bool)

(declare-fun e!881365 () Bool)

(assert (=> start!137062 (=> (not res!1079265) (not e!881365))))

(declare-datatypes ((B!2614 0))(
  ( (B!2615 (val!19669 Int)) )
))
(declare-datatypes ((tuple2!25442 0))(
  ( (tuple2!25443 (_1!12732 (_ BitVec 64)) (_2!12732 B!2614)) )
))
(declare-datatypes ((List!36789 0))(
  ( (Nil!36786) (Cons!36785 (h!38328 tuple2!25442) (t!51703 List!36789)) )
))
(declare-fun l!1390 () List!36789)

(declare-fun isStrictlySorted!1047 (List!36789) Bool)

(assert (=> start!137062 (= res!1079265 (isStrictlySorted!1047 l!1390))))

(assert (=> start!137062 e!881365))

(assert (=> start!137062 e!881364))

(assert (=> start!137062 true))

(assert (=> start!137062 tp_is_empty!39159))

(declare-fun b!1579920 () Bool)

(declare-fun e!881366 () Bool)

(declare-datatypes ((tuple2!25444 0))(
  ( (tuple2!25445 (_1!12733 tuple2!25442) (_2!12733 List!36789)) )
))
(declare-datatypes ((Option!888 0))(
  ( (Some!887 (v!22382 tuple2!25444)) (None!886) )
))
(declare-fun lt!676645 () Option!888)

(declare-fun isDefined!598 (Option!888) Bool)

(assert (=> b!1579920 (= e!881366 (not (isDefined!598 lt!676645)))))

(declare-fun b!1579921 () Bool)

(assert (=> b!1579921 (= e!881365 e!881366)))

(declare-fun res!1079263 () Bool)

(assert (=> b!1579921 (=> (not res!1079263) (not e!881366))))

(declare-fun isEmpty!1155 (Option!888) Bool)

(assert (=> b!1579921 (= res!1079263 (not (isEmpty!1155 lt!676645)))))

(declare-fun unapply!71 (List!36789) Option!888)

(assert (=> b!1579921 (= lt!676645 (unapply!71 l!1390))))

(declare-fun b!1579922 () Bool)

(declare-fun res!1079262 () Bool)

(assert (=> b!1579922 (=> (not res!1079262) (not e!881365))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!893 (List!36789 (_ BitVec 64)) Bool)

(assert (=> b!1579922 (= res!1079262 (containsKey!893 l!1390 key!405))))

(declare-fun b!1579923 () Bool)

(declare-fun res!1079264 () Bool)

(assert (=> b!1579923 (=> (not res!1079264) (not e!881365))))

(declare-fun value!194 () B!2614)

(declare-fun contains!10461 (List!36789 tuple2!25442) Bool)

(assert (=> b!1579923 (= res!1079264 (contains!10461 l!1390 (tuple2!25443 key!405 value!194)))))

(assert (= (and start!137062 res!1079265) b!1579922))

(assert (= (and b!1579922 res!1079262) b!1579923))

(assert (= (and b!1579923 res!1079264) b!1579921))

(assert (= (and b!1579921 res!1079263) b!1579920))

(get-info :version)

(assert (= (and start!137062 ((_ is Cons!36785) l!1390)) b!1579919))

(declare-fun m!1451527 () Bool)

(assert (=> b!1579920 m!1451527))

(declare-fun m!1451529 () Bool)

(assert (=> b!1579923 m!1451529))

(declare-fun m!1451531 () Bool)

(assert (=> start!137062 m!1451531))

(declare-fun m!1451533 () Bool)

(assert (=> b!1579922 m!1451533))

(declare-fun m!1451535 () Bool)

(assert (=> b!1579921 m!1451535))

(declare-fun m!1451537 () Bool)

(assert (=> b!1579921 m!1451537))

(check-sat (not b!1579921) (not b!1579919) (not start!137062) tp_is_empty!39159 (not b!1579922) (not b!1579923) (not b!1579920))
(check-sat)
(get-model)

(declare-fun lt!676651 () Bool)

(declare-fun d!166357 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!828 (List!36789) (InoxSet tuple2!25442))

(assert (=> d!166357 (= lt!676651 (select (content!828 l!1390) (tuple2!25443 key!405 value!194)))))

(declare-fun e!881384 () Bool)

(assert (=> d!166357 (= lt!676651 e!881384)))

(declare-fun res!1079287 () Bool)

(assert (=> d!166357 (=> (not res!1079287) (not e!881384))))

(assert (=> d!166357 (= res!1079287 ((_ is Cons!36785) l!1390))))

(assert (=> d!166357 (= (contains!10461 l!1390 (tuple2!25443 key!405 value!194)) lt!676651)))

(declare-fun b!1579947 () Bool)

(declare-fun e!881385 () Bool)

(assert (=> b!1579947 (= e!881384 e!881385)))

(declare-fun res!1079286 () Bool)

(assert (=> b!1579947 (=> res!1079286 e!881385)))

(assert (=> b!1579947 (= res!1079286 (= (h!38328 l!1390) (tuple2!25443 key!405 value!194)))))

(declare-fun b!1579948 () Bool)

(assert (=> b!1579948 (= e!881385 (contains!10461 (t!51703 l!1390) (tuple2!25443 key!405 value!194)))))

(assert (= (and d!166357 res!1079287) b!1579947))

(assert (= (and b!1579947 (not res!1079286)) b!1579948))

(declare-fun m!1451551 () Bool)

(assert (=> d!166357 m!1451551))

(declare-fun m!1451553 () Bool)

(assert (=> d!166357 m!1451553))

(declare-fun m!1451555 () Bool)

(assert (=> b!1579948 m!1451555))

(assert (=> b!1579923 d!166357))

(declare-fun d!166363 () Bool)

(declare-fun res!1079304 () Bool)

(declare-fun e!881402 () Bool)

(assert (=> d!166363 (=> res!1079304 e!881402)))

(assert (=> d!166363 (= res!1079304 (and ((_ is Cons!36785) l!1390) (= (_1!12732 (h!38328 l!1390)) key!405)))))

(assert (=> d!166363 (= (containsKey!893 l!1390 key!405) e!881402)))

(declare-fun b!1579965 () Bool)

(declare-fun e!881403 () Bool)

(assert (=> b!1579965 (= e!881402 e!881403)))

(declare-fun res!1079305 () Bool)

(assert (=> b!1579965 (=> (not res!1079305) (not e!881403))))

(assert (=> b!1579965 (= res!1079305 (and (or (not ((_ is Cons!36785) l!1390)) (bvsle (_1!12732 (h!38328 l!1390)) key!405)) ((_ is Cons!36785) l!1390) (bvslt (_1!12732 (h!38328 l!1390)) key!405)))))

(declare-fun b!1579966 () Bool)

(assert (=> b!1579966 (= e!881403 (containsKey!893 (t!51703 l!1390) key!405))))

(assert (= (and d!166363 (not res!1079304)) b!1579965))

(assert (= (and b!1579965 res!1079305) b!1579966))

(declare-fun m!1451565 () Bool)

(assert (=> b!1579966 m!1451565))

(assert (=> b!1579922 d!166363))

(declare-fun d!166369 () Bool)

(assert (=> d!166369 (= (isDefined!598 lt!676645) (not (isEmpty!1155 lt!676645)))))

(declare-fun bs!45765 () Bool)

(assert (= bs!45765 d!166369))

(assert (=> bs!45765 m!1451535))

(assert (=> b!1579920 d!166369))

(declare-fun d!166373 () Bool)

(declare-fun res!1079318 () Bool)

(declare-fun e!881416 () Bool)

(assert (=> d!166373 (=> res!1079318 e!881416)))

(assert (=> d!166373 (= res!1079318 (or ((_ is Nil!36786) l!1390) ((_ is Nil!36786) (t!51703 l!1390))))))

(assert (=> d!166373 (= (isStrictlySorted!1047 l!1390) e!881416)))

(declare-fun b!1579979 () Bool)

(declare-fun e!881417 () Bool)

(assert (=> b!1579979 (= e!881416 e!881417)))

(declare-fun res!1079319 () Bool)

(assert (=> b!1579979 (=> (not res!1079319) (not e!881417))))

(assert (=> b!1579979 (= res!1079319 (bvslt (_1!12732 (h!38328 l!1390)) (_1!12732 (h!38328 (t!51703 l!1390)))))))

(declare-fun b!1579980 () Bool)

(assert (=> b!1579980 (= e!881417 (isStrictlySorted!1047 (t!51703 l!1390)))))

(assert (= (and d!166373 (not res!1079318)) b!1579979))

(assert (= (and b!1579979 res!1079319) b!1579980))

(declare-fun m!1451571 () Bool)

(assert (=> b!1579980 m!1451571))

(assert (=> start!137062 d!166373))

(declare-fun d!166383 () Bool)

(assert (=> d!166383 (= (isEmpty!1155 lt!676645) (not ((_ is Some!887) lt!676645)))))

(assert (=> b!1579921 d!166383))

(declare-fun d!166385 () Bool)

(assert (=> d!166385 (= (unapply!71 l!1390) (ite ((_ is Nil!36786) l!1390) None!886 (Some!887 (tuple2!25445 (h!38328 l!1390) (t!51703 l!1390)))))))

(assert (=> b!1579921 d!166385))

(declare-fun b!1579995 () Bool)

(declare-fun e!881430 () Bool)

(declare-fun tp!114396 () Bool)

(assert (=> b!1579995 (= e!881430 (and tp_is_empty!39159 tp!114396))))

(assert (=> b!1579919 (= tp!114390 e!881430)))

(assert (= (and b!1579919 ((_ is Cons!36785) (t!51703 l!1390))) b!1579995))

(check-sat (not d!166369) (not b!1579966) (not b!1579995) (not b!1579948) (not d!166357) (not b!1579980) tp_is_empty!39159)
(check-sat)
