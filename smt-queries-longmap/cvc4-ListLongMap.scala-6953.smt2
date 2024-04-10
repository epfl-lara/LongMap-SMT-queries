; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87688 () Bool)

(assert start!87688)

(declare-fun res!680727 () Bool)

(declare-fun e!570585 () Bool)

(assert (=> start!87688 (=> (not res!680727) (not e!570585))))

(declare-datatypes ((B!1428 0))(
  ( (B!1429 (val!11798 Int)) )
))
(declare-datatypes ((tuple2!15142 0))(
  ( (tuple2!15143 (_1!7582 (_ BitVec 64)) (_2!7582 B!1428)) )
))
(declare-datatypes ((List!21429 0))(
  ( (Nil!21426) (Cons!21425 (h!22623 tuple2!15142) (t!30430 List!21429)) )
))
(declare-fun l!412 () List!21429)

(declare-fun isStrictlySorted!572 (List!21429) Bool)

(assert (=> start!87688 (= res!680727 (isStrictlySorted!572 l!412))))

(assert (=> start!87688 e!570585))

(declare-fun e!570586 () Bool)

(assert (=> start!87688 e!570586))

(declare-fun tp_is_empty!23495 () Bool)

(assert (=> start!87688 tp_is_empty!23495))

(declare-fun b!1014282 () Bool)

(declare-fun res!680726 () Bool)

(assert (=> b!1014282 (=> (not res!680726) (not e!570585))))

(declare-fun value!115 () B!1428)

(assert (=> b!1014282 (= res!680726 (and (not (= (_2!7582 (h!22623 l!412)) value!115)) (is-Cons!21425 l!412)))))

(declare-fun b!1014283 () Bool)

(declare-fun ListPrimitiveSize!111 (List!21429) Int)

(assert (=> b!1014283 (= e!570585 (>= (ListPrimitiveSize!111 (t!30430 l!412)) (ListPrimitiveSize!111 l!412)))))

(declare-fun b!1014284 () Bool)

(declare-fun tp!70508 () Bool)

(assert (=> b!1014284 (= e!570586 (and tp_is_empty!23495 tp!70508))))

(assert (= (and start!87688 res!680727) b!1014282))

(assert (= (and b!1014282 res!680726) b!1014283))

(assert (= (and start!87688 (is-Cons!21425 l!412)) b!1014284))

(declare-fun m!936993 () Bool)

(assert (=> start!87688 m!936993))

(declare-fun m!936995 () Bool)

(assert (=> b!1014283 m!936995))

(declare-fun m!936997 () Bool)

(assert (=> b!1014283 m!936997))

(push 1)

(assert (not start!87688))

(assert (not b!1014283))

(assert (not b!1014284))

(assert tp_is_empty!23495)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120733 () Bool)

(declare-fun res!680744 () Bool)

(declare-fun e!570603 () Bool)

(assert (=> d!120733 (=> res!680744 e!570603)))

(assert (=> d!120733 (= res!680744 (or (is-Nil!21426 l!412) (is-Nil!21426 (t!30430 l!412))))))

(assert (=> d!120733 (= (isStrictlySorted!572 l!412) e!570603)))

(declare-fun b!1014301 () Bool)

(declare-fun e!570604 () Bool)

(assert (=> b!1014301 (= e!570603 e!570604)))

(declare-fun res!680745 () Bool)

(assert (=> b!1014301 (=> (not res!680745) (not e!570604))))

(assert (=> b!1014301 (= res!680745 (bvslt (_1!7582 (h!22623 l!412)) (_1!7582 (h!22623 (t!30430 l!412)))))))

(declare-fun b!1014302 () Bool)

(assert (=> b!1014302 (= e!570604 (isStrictlySorted!572 (t!30430 l!412)))))

(assert (= (and d!120733 (not res!680744)) b!1014301))

(assert (= (and b!1014301 res!680745) b!1014302))

(declare-fun m!937003 () Bool)

(assert (=> b!1014302 m!937003))

(assert (=> start!87688 d!120733))

(declare-fun d!120739 () Bool)

(declare-fun lt!448479 () Int)

(assert (=> d!120739 (>= lt!448479 0)))

(declare-fun e!570613 () Int)

(assert (=> d!120739 (= lt!448479 e!570613)))

(declare-fun c!102654 () Bool)

(assert (=> d!120739 (= c!102654 (is-Nil!21426 (t!30430 l!412)))))

(assert (=> d!120739 (= (ListPrimitiveSize!111 (t!30430 l!412)) lt!448479)))

(declare-fun b!1014321 () Bool)

(assert (=> b!1014321 (= e!570613 0)))

(declare-fun b!1014322 () Bool)

(assert (=> b!1014322 (= e!570613 (+ 1 (ListPrimitiveSize!111 (t!30430 (t!30430 l!412)))))))

(assert (= (and d!120739 c!102654) b!1014321))

(assert (= (and d!120739 (not c!102654)) b!1014322))

(declare-fun m!937007 () Bool)

(assert (=> b!1014322 m!937007))

(assert (=> b!1014283 d!120739))

(declare-fun d!120743 () Bool)

(declare-fun lt!448481 () Int)

(assert (=> d!120743 (>= lt!448481 0)))

(declare-fun e!570617 () Int)

(assert (=> d!120743 (= lt!448481 e!570617)))

(declare-fun c!102656 () Bool)

(assert (=> d!120743 (= c!102656 (is-Nil!21426 l!412))))

(assert (=> d!120743 (= (ListPrimitiveSize!111 l!412) lt!448481)))

(declare-fun b!1014327 () Bool)

(assert (=> b!1014327 (= e!570617 0)))

(declare-fun b!1014328 () Bool)

(assert (=> b!1014328 (= e!570617 (+ 1 (ListPrimitiveSize!111 (t!30430 l!412))))))

(assert (= (and d!120743 c!102656) b!1014327))

