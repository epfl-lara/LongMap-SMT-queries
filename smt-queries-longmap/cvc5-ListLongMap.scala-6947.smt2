; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87716 () Bool)

(assert start!87716)

(declare-fun res!680813 () Bool)

(declare-fun e!570779 () Bool)

(assert (=> start!87716 (=> (not res!680813) (not e!570779))))

(declare-datatypes ((B!1392 0))(
  ( (B!1393 (val!11780 Int)) )
))
(declare-datatypes ((tuple2!15110 0))(
  ( (tuple2!15111 (_1!7566 (_ BitVec 64)) (_2!7566 B!1392)) )
))
(declare-datatypes ((List!21388 0))(
  ( (Nil!21385) (Cons!21384 (h!22591 tuple2!15110) (t!30381 List!21388)) )
))
(declare-fun l!412 () List!21388)

(declare-fun isStrictlySorted!542 (List!21388) Bool)

(assert (=> start!87716 (= res!680813 (isStrictlySorted!542 l!412))))

(assert (=> start!87716 e!570779))

(declare-fun e!570780 () Bool)

(assert (=> start!87716 e!570780))

(declare-fun b!1014480 () Bool)

(declare-fun ListPrimitiveSize!99 (List!21388) Int)

(assert (=> b!1014480 (= e!570779 (< (ListPrimitiveSize!99 l!412) 0))))

(declare-fun b!1014481 () Bool)

(declare-fun tp_is_empty!23459 () Bool)

(declare-fun tp!70398 () Bool)

(assert (=> b!1014481 (= e!570780 (and tp_is_empty!23459 tp!70398))))

(assert (= (and start!87716 res!680813) b!1014480))

(assert (= (and start!87716 (is-Cons!21384 l!412)) b!1014481))

(declare-fun m!937987 () Bool)

(assert (=> start!87716 m!937987))

(declare-fun m!937989 () Bool)

(assert (=> b!1014480 m!937989))

(push 1)

(assert (not start!87716))

(assert (not b!1014480))

(assert (not b!1014481))

(assert tp_is_empty!23459)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120871 () Bool)

(declare-fun res!680822 () Bool)

(declare-fun e!570791 () Bool)

(assert (=> d!120871 (=> res!680822 e!570791)))

(assert (=> d!120871 (= res!680822 (or (is-Nil!21385 l!412) (is-Nil!21385 (t!30381 l!412))))))

(assert (=> d!120871 (= (isStrictlySorted!542 l!412) e!570791)))

(declare-fun b!1014494 () Bool)

(declare-fun e!570792 () Bool)

(assert (=> b!1014494 (= e!570791 e!570792)))

(declare-fun res!680823 () Bool)

(assert (=> b!1014494 (=> (not res!680823) (not e!570792))))

(assert (=> b!1014494 (= res!680823 (bvslt (_1!7566 (h!22591 l!412)) (_1!7566 (h!22591 (t!30381 l!412)))))))

(declare-fun b!1014495 () Bool)

(assert (=> b!1014495 (= e!570792 (isStrictlySorted!542 (t!30381 l!412)))))

(assert (= (and d!120871 (not res!680822)) b!1014494))

(assert (= (and b!1014494 res!680823) b!1014495))

(declare-fun m!937991 () Bool)

(assert (=> b!1014495 m!937991))

(assert (=> start!87716 d!120871))

(declare-fun d!120875 () Bool)

(declare-fun lt!448394 () Int)

(assert (=> d!120875 (>= lt!448394 0)))

(declare-fun e!570798 () Int)

(assert (=> d!120875 (= lt!448394 e!570798)))

(declare-fun c!102823 () Bool)

(assert (=> d!120875 (= c!102823 (is-Nil!21385 l!412))))

(assert (=> d!120875 (= (ListPrimitiveSize!99 l!412) lt!448394)))

(declare-fun b!1014504 () Bool)

(assert (=> b!1014504 (= e!570798 0)))

(declare-fun b!1014505 () Bool)

(assert (=> b!1014505 (= e!570798 (+ 1 (ListPrimitiveSize!99 (t!30381 l!412))))))

(assert (= (and d!120875 c!102823) b!1014504))

(assert (= (and d!120875 (not c!102823)) b!1014505))

(declare-fun m!937997 () Bool)

(assert (=> b!1014505 m!937997))

(assert (=> b!1014480 d!120875))

(declare-fun b!1014514 () Bool)

(declare-fun e!570803 () Bool)

(declare-fun tp!70401 () Bool)

(assert (=> b!1014514 (= e!570803 (and tp_is_empty!23459 tp!70401))))

(assert (=> b!1014481 (= tp!70398 e!570803)))

(assert (= (and b!1014481 (is-Cons!21384 (t!30381 l!412))) b!1014514))

(push 1)

(assert (not b!1014505))

(assert (not b!1014495))

(assert (not b!1014514))

(assert tp_is_empty!23459)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

