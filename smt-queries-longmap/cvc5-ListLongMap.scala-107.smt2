; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1740 () Bool)

(assert start!1740)

(declare-fun b!12238 () Bool)

(declare-fun res!9925 () Bool)

(declare-fun e!7311 () Bool)

(assert (=> b!12238 (=> (not res!9925) (not e!7311))))

(declare-fun key!303 () (_ BitVec 64))

(declare-datatypes ((B!446 0))(
  ( (B!447 (val!318 Int)) )
))
(declare-datatypes ((tuple2!436 0))(
  ( (tuple2!437 (_1!218 (_ BitVec 64)) (_2!218 B!446)) )
))
(declare-datatypes ((List!370 0))(
  ( (Nil!367) (Cons!366 (h!932 tuple2!436) (t!2757 List!370)) )
))
(declare-fun l!1094 () List!370)

(declare-datatypes ((Option!50 0))(
  ( (Some!49 (v!1364 B!446)) (None!48) )
))
(declare-fun lt!3108 () Option!50)

(declare-fun getValueByKey!44 (List!370 (_ BitVec 64)) Option!50)

(assert (=> b!12238 (= res!9925 (= (getValueByKey!44 (t!2757 l!1094) key!303) lt!3108))))

(declare-fun b!12239 () Bool)

(declare-fun res!9924 () Bool)

(assert (=> b!12239 (=> (not res!9924) (not e!7311))))

(assert (=> b!12239 (= res!9924 (and (is-Cons!366 l!1094) (not (= (_1!218 (h!932 l!1094)) key!303))))))

(declare-fun b!12240 () Bool)

(declare-fun res!9928 () Bool)

(assert (=> b!12240 (=> (not res!9928) (not e!7311))))

(declare-fun isStrictlySorted!63 (List!370) Bool)

(assert (=> b!12240 (= res!9928 (isStrictlySorted!63 (t!2757 l!1094)))))

(declare-fun b!12241 () Bool)

(declare-fun e!7312 () Bool)

(declare-fun tp_is_empty!619 () Bool)

(declare-fun tp!2060 () Bool)

(assert (=> b!12241 (= e!7312 (and tp_is_empty!619 tp!2060))))

(declare-fun b!12242 () Bool)

(declare-fun ListPrimitiveSize!16 (List!370) Int)

(assert (=> b!12242 (= e!7311 (>= (ListPrimitiveSize!16 (t!2757 l!1094)) (ListPrimitiveSize!16 l!1094)))))

(declare-fun b!12237 () Bool)

(declare-fun e!7313 () Bool)

(assert (=> b!12237 (= e!7313 e!7311)))

(declare-fun res!9927 () Bool)

(assert (=> b!12237 (=> (not res!9927) (not e!7311))))

(assert (=> b!12237 (= res!9927 (= (getValueByKey!44 l!1094 key!303) lt!3108))))

(declare-fun v!194 () B!446)

(assert (=> b!12237 (= lt!3108 (Some!49 v!194))))

(declare-fun res!9926 () Bool)

(assert (=> start!1740 (=> (not res!9926) (not e!7313))))

(assert (=> start!1740 (= res!9926 (isStrictlySorted!63 l!1094))))

(assert (=> start!1740 e!7313))

(assert (=> start!1740 e!7312))

(assert (=> start!1740 tp_is_empty!619))

(assert (=> start!1740 true))

(assert (= (and start!1740 res!9926) b!12237))

(assert (= (and b!12237 res!9927) b!12239))

(assert (= (and b!12239 res!9924) b!12240))

(assert (= (and b!12240 res!9928) b!12238))

(assert (= (and b!12238 res!9925) b!12242))

(assert (= (and start!1740 (is-Cons!366 l!1094)) b!12241))

(declare-fun m!8399 () Bool)

(assert (=> b!12237 m!8399))

(declare-fun m!8401 () Bool)

(assert (=> b!12240 m!8401))

(declare-fun m!8403 () Bool)

(assert (=> b!12242 m!8403))

(declare-fun m!8405 () Bool)

(assert (=> b!12242 m!8405))

(declare-fun m!8407 () Bool)

(assert (=> b!12238 m!8407))

(declare-fun m!8409 () Bool)

(assert (=> start!1740 m!8409))

(push 1)

(assert (not start!1740))

(assert (not b!12238))

(assert (not b!12242))

(assert tp_is_empty!619)

(assert (not b!12241))

(assert (not b!12237))

(assert (not b!12240))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1719 () Bool)

(declare-fun res!9969 () Bool)

(declare-fun e!7348 () Bool)

(assert (=> d!1719 (=> res!9969 e!7348)))

(assert (=> d!1719 (= res!9969 (or (is-Nil!367 (t!2757 l!1094)) (is-Nil!367 (t!2757 (t!2757 l!1094)))))))

(assert (=> d!1719 (= (isStrictlySorted!63 (t!2757 l!1094)) e!7348)))

(declare-fun b!12301 () Bool)

(declare-fun e!7349 () Bool)

(assert (=> b!12301 (= e!7348 e!7349)))

(declare-fun res!9970 () Bool)

(assert (=> b!12301 (=> (not res!9970) (not e!7349))))

(assert (=> b!12301 (= res!9970 (bvslt (_1!218 (h!932 (t!2757 l!1094))) (_1!218 (h!932 (t!2757 (t!2757 l!1094))))))))

(declare-fun b!12302 () Bool)

(assert (=> b!12302 (= e!7349 (isStrictlySorted!63 (t!2757 (t!2757 l!1094))))))

(assert (= (and d!1719 (not res!9969)) b!12301))

(assert (= (and b!12301 res!9970) b!12302))

(declare-fun m!8437 () Bool)

(assert (=> b!12302 m!8437))

(assert (=> b!12240 d!1719))

(declare-fun d!1725 () Bool)

(declare-fun res!9975 () Bool)

(declare-fun e!7354 () Bool)

(assert (=> d!1725 (=> res!9975 e!7354)))

(assert (=> d!1725 (= res!9975 (or (is-Nil!367 l!1094) (is-Nil!367 (t!2757 l!1094))))))

(assert (=> d!1725 (= (isStrictlySorted!63 l!1094) e!7354)))

(declare-fun b!12307 () Bool)

(declare-fun e!7355 () Bool)

(assert (=> b!12307 (= e!7354 e!7355)))

(declare-fun res!9976 () Bool)

(assert (=> b!12307 (=> (not res!9976) (not e!7355))))

(assert (=> b!12307 (= res!9976 (bvslt (_1!218 (h!932 l!1094)) (_1!218 (h!932 (t!2757 l!1094)))))))

(declare-fun b!12308 () Bool)

(assert (=> b!12308 (= e!7355 (isStrictlySorted!63 (t!2757 l!1094)))))

(assert (= (and d!1725 (not res!9975)) b!12307))

(assert (= (and b!12307 res!9976) b!12308))

(assert (=> b!12308 m!8401))

(assert (=> start!1740 d!1725))

(declare-fun d!1727 () Bool)

(declare-fun lt!3121 () Int)

(assert (=> d!1727 (>= lt!3121 0)))

(declare-fun e!7370 () Int)

(assert (=> d!1727 (= lt!3121 e!7370)))

(declare-fun c!1083 () Bool)

(assert (=> d!1727 (= c!1083 (is-Nil!367 (t!2757 l!1094)))))

(assert (=> d!1727 (= (ListPrimitiveSize!16 (t!2757 l!1094)) lt!3121)))

(declare-fun b!12335 () Bool)

(assert (=> b!12335 (= e!7370 0)))

(declare-fun b!12336 () Bool)

(assert (=> b!12336 (= e!7370 (+ 1 (ListPrimitiveSize!16 (t!2757 (t!2757 l!1094)))))))

(assert (= (and d!1727 c!1083) b!12335))

(assert (= (and d!1727 (not c!1083)) b!12336))

(declare-fun m!8443 () Bool)

(assert (=> b!12336 m!8443))

(assert (=> b!12242 d!1727))

(declare-fun d!1737 () Bool)

(declare-fun lt!3122 () Int)

(assert (=> d!1737 (>= lt!3122 0)))

(declare-fun e!7375 () Int)

(assert (=> d!1737 (= lt!3122 e!7375)))

(declare-fun c!1086 () Bool)

(assert (=> d!1737 (= c!1086 (is-Nil!367 l!1094))))

(assert (=> d!1737 (= (ListPrimitiveSize!16 l!1094) lt!3122)))

(declare-fun b!12343 () Bool)

(assert (=> b!12343 (= e!7375 0)))

(declare-fun b!12344 () Bool)

(assert (=> b!12344 (= e!7375 (+ 1 (ListPrimitiveSize!16 (t!2757 l!1094))))))

(assert (= (and d!1737 c!1086) b!12343))

(assert (= (and d!1737 (not c!1086)) b!12344))

(assert (=> b!12344 m!8403))

(assert (=> b!12242 d!1737))

(declare-fun b!12376 () Bool)

(declare-fun e!7393 () Option!50)

(assert (=> b!12376 (= e!7393 (Some!49 (_2!218 (h!932 l!1094))))))

(declare-fun d!1743 () Bool)

(declare-fun c!1097 () Bool)

(assert (=> d!1743 (= c!1097 (and (is-Cons!366 l!1094) (= (_1!218 (h!932 l!1094)) key!303)))))

(assert (=> d!1743 (= (getValueByKey!44 l!1094 key!303) e!7393)))

(declare-fun b!12379 () Bool)

(declare-fun e!7394 () Option!50)

(assert (=> b!12379 (= e!7394 None!48)))

(declare-fun b!12377 () Bool)

(assert (=> b!12377 (= e!7393 e!7394)))

(declare-fun c!1098 () Bool)

(assert (=> b!12377 (= c!1098 (and (is-Cons!366 l!1094) (not (= (_1!218 (h!932 l!1094)) key!303))))))

(declare-fun b!12378 () Bool)

(assert (=> b!12378 (= e!7394 (getValueByKey!44 (t!2757 l!1094) key!303))))

(assert (= (and d!1743 c!1097) b!12376))

(assert (= (and d!1743 (not c!1097)) b!12377))

(assert (= (and b!12377 c!1098) b!12378))

(assert (= (and b!12377 (not c!1098)) b!12379))

(assert (=> b!12378 m!8407))

(assert (=> b!12237 d!1743))

(declare-fun b!12381 () Bool)

(declare-fun e!7396 () Option!50)

(assert (=> b!12381 (= e!7396 (Some!49 (_2!218 (h!932 (t!2757 l!1094)))))))

(declare-fun d!1749 () Bool)

(declare-fun c!1099 () Bool)

(assert (=> d!1749 (= c!1099 (and (is-Cons!366 (t!2757 l!1094)) (= (_1!218 (h!932 (t!2757 l!1094))) key!303)))))

(assert (=> d!1749 (= (getValueByKey!44 (t!2757 l!1094) key!303) e!7396)))

(declare-fun b!12384 () Bool)

(declare-fun e!7397 () Option!50)

(assert (=> b!12384 (= e!7397 None!48)))

(declare-fun b!12382 () Bool)

(assert (=> b!12382 (= e!7396 e!7397)))

(declare-fun c!1100 () Bool)

(assert (=> b!12382 (= c!1100 (and (is-Cons!366 (t!2757 l!1094)) (not (= (_1!218 (h!932 (t!2757 l!1094))) key!303))))))

(declare-fun b!12383 () Bool)

(assert (=> b!12383 (= e!7397 (getValueByKey!44 (t!2757 (t!2757 l!1094)) key!303))))

(assert (= (and d!1749 c!1099) b!12381))

(assert (= (and d!1749 (not c!1099)) b!12382))

(assert (= (and b!12382 c!1100) b!12383))

(assert (= (and b!12382 (not c!1100)) b!12384))

(declare-fun m!8451 () Bool)

(assert (=> b!12383 m!8451))

(assert (=> b!12238 d!1749))

(declare-fun b!12389 () Bool)

(declare-fun e!7400 () Bool)

(declare-fun tp!2075 () Bool)

(assert (=> b!12389 (= e!7400 (and tp_is_empty!619 tp!2075))))

(assert (=> b!12241 (= tp!2060 e!7400)))

(assert (= (and b!12241 (is-Cons!366 (t!2757 l!1094))) b!12389))

(push 1)

