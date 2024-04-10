; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1768 () Bool)

(assert start!1768)

(declare-fun b!12438 () Bool)

(declare-fun res!10027 () Bool)

(declare-fun e!7426 () Bool)

(assert (=> b!12438 (=> (not res!10027) (not e!7426))))

(declare-datatypes ((B!456 0))(
  ( (B!457 (val!323 Int)) )
))
(declare-datatypes ((Option!55 0))(
  ( (Some!54 (v!1369 B!456)) (None!53) )
))
(declare-fun lt!3152 () Option!55)

(declare-fun key!303 () (_ BitVec 64))

(declare-datatypes ((tuple2!446 0))(
  ( (tuple2!447 (_1!223 (_ BitVec 64)) (_2!223 B!456)) )
))
(declare-datatypes ((List!375 0))(
  ( (Nil!372) (Cons!371 (h!937 tuple2!446) (t!2762 List!375)) )
))
(declare-fun l!1094 () List!375)

(declare-fun getValueByKey!49 (List!375 (_ BitVec 64)) Option!55)

(assert (=> b!12438 (= res!10027 (= (getValueByKey!49 (t!2762 l!1094) key!303) lt!3152))))

(declare-fun res!10025 () Bool)

(declare-fun e!7427 () Bool)

(assert (=> start!1768 (=> (not res!10025) (not e!7427))))

(declare-fun isStrictlySorted!68 (List!375) Bool)

(assert (=> start!1768 (= res!10025 (isStrictlySorted!68 l!1094))))

(assert (=> start!1768 e!7427))

(declare-fun e!7425 () Bool)

(assert (=> start!1768 e!7425))

(declare-fun tp_is_empty!629 () Bool)

(assert (=> start!1768 tp_is_empty!629))

(assert (=> start!1768 true))

(declare-fun b!12439 () Bool)

(assert (=> b!12439 (= e!7427 e!7426)))

(declare-fun res!10023 () Bool)

(assert (=> b!12439 (=> (not res!10023) (not e!7426))))

(assert (=> b!12439 (= res!10023 (= (getValueByKey!49 l!1094 key!303) lt!3152))))

(declare-fun v!194 () B!456)

(assert (=> b!12439 (= lt!3152 (Some!54 v!194))))

(declare-fun b!12440 () Bool)

(declare-fun res!10024 () Bool)

(assert (=> b!12440 (=> (not res!10024) (not e!7426))))

(assert (=> b!12440 (= res!10024 (and (is-Cons!371 l!1094) (not (= (_1!223 (h!937 l!1094)) key!303))))))

(declare-fun b!12441 () Bool)

(declare-fun res!10026 () Bool)

(assert (=> b!12441 (=> (not res!10026) (not e!7426))))

(assert (=> b!12441 (= res!10026 (isStrictlySorted!68 (t!2762 l!1094)))))

(declare-fun b!12442 () Bool)

(declare-fun lt!3153 () tuple2!446)

(declare-fun contains!185 (List!375 tuple2!446) Bool)

(assert (=> b!12442 (= e!7426 (not (contains!185 l!1094 lt!3153)))))

(assert (=> b!12442 (contains!185 (t!2762 l!1094) lt!3153)))

(assert (=> b!12442 (= lt!3153 (tuple2!447 key!303 v!194))))

(declare-datatypes ((Unit!268 0))(
  ( (Unit!269) )
))
(declare-fun lt!3151 () Unit!268)

(declare-fun lemmaGetValueByKeyImpliesContainsTuple!6 (List!375 (_ BitVec 64) B!456) Unit!268)

(assert (=> b!12442 (= lt!3151 (lemmaGetValueByKeyImpliesContainsTuple!6 (t!2762 l!1094) key!303 v!194))))

(declare-fun b!12443 () Bool)

(declare-fun tp!2084 () Bool)

(assert (=> b!12443 (= e!7425 (and tp_is_empty!629 tp!2084))))

(assert (= (and start!1768 res!10025) b!12439))

(assert (= (and b!12439 res!10023) b!12440))

(assert (= (and b!12440 res!10024) b!12441))

(assert (= (and b!12441 res!10026) b!12438))

(assert (= (and b!12438 res!10027) b!12442))

(assert (= (and start!1768 (is-Cons!371 l!1094)) b!12443))

(declare-fun m!8481 () Bool)

(assert (=> b!12442 m!8481))

(declare-fun m!8483 () Bool)

(assert (=> b!12442 m!8483))

(declare-fun m!8485 () Bool)

(assert (=> b!12442 m!8485))

(declare-fun m!8487 () Bool)

(assert (=> b!12438 m!8487))

(declare-fun m!8489 () Bool)

(assert (=> b!12439 m!8489))

(declare-fun m!8491 () Bool)

(assert (=> start!1768 m!8491))

(declare-fun m!8493 () Bool)

(assert (=> b!12441 m!8493))

(push 1)

(assert tp_is_empty!629)

(assert (not b!12442))

(assert (not b!12443))

(assert (not b!12441))

(assert (not b!12438))

(assert (not b!12439))

(assert (not start!1768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!12479 () Bool)

(declare-fun e!7448 () Option!55)

(declare-fun e!7449 () Option!55)

(assert (=> b!12479 (= e!7448 e!7449)))

(declare-fun c!1116 () Bool)

(assert (=> b!12479 (= c!1116 (and (is-Cons!371 (t!2762 l!1094)) (not (= (_1!223 (h!937 (t!2762 l!1094))) key!303))))))

(declare-fun d!1755 () Bool)

(declare-fun c!1115 () Bool)

(assert (=> d!1755 (= c!1115 (and (is-Cons!371 (t!2762 l!1094)) (= (_1!223 (h!937 (t!2762 l!1094))) key!303)))))

(assert (=> d!1755 (= (getValueByKey!49 (t!2762 l!1094) key!303) e!7448)))

(declare-fun b!12478 () Bool)

(assert (=> b!12478 (= e!7448 (Some!54 (_2!223 (h!937 (t!2762 l!1094)))))))

(declare-fun b!12480 () Bool)

(assert (=> b!12480 (= e!7449 (getValueByKey!49 (t!2762 (t!2762 l!1094)) key!303))))

(declare-fun b!12481 () Bool)

(assert (=> b!12481 (= e!7449 None!53)))

(assert (= (and d!1755 c!1115) b!12478))

(assert (= (and d!1755 (not c!1115)) b!12479))

(assert (= (and b!12479 c!1116) b!12480))

(assert (= (and b!12479 (not c!1116)) b!12481))

(declare-fun m!8499 () Bool)

(assert (=> b!12480 m!8499))

(assert (=> b!12438 d!1755))

(declare-fun d!1765 () Bool)

(declare-fun lt!3160 () Bool)

(declare-fun content!10 (List!375) (Set tuple2!446))

(assert (=> d!1765 (= lt!3160 (member lt!3153 (content!10 l!1094)))))

(declare-fun e!7474 () Bool)

(assert (=> d!1765 (= lt!3160 e!7474)))

(declare-fun res!10054 () Bool)

(assert (=> d!1765 (=> (not res!10054) (not e!7474))))

(assert (=> d!1765 (= res!10054 (is-Cons!371 l!1094))))

(assert (=> d!1765 (= (contains!185 l!1094 lt!3153) lt!3160)))

(declare-fun b!12510 () Bool)

(declare-fun e!7475 () Bool)

(assert (=> b!12510 (= e!7474 e!7475)))

(declare-fun res!10055 () Bool)

(assert (=> b!12510 (=> res!10055 e!7475)))

(assert (=> b!12510 (= res!10055 (= (h!937 l!1094) lt!3153))))

(declare-fun b!12511 () Bool)

(assert (=> b!12511 (= e!7475 (contains!185 (t!2762 l!1094) lt!3153))))

