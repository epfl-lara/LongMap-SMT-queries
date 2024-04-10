; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87876 () Bool)

(assert start!87876)

(declare-fun b!1015372 () Bool)

(assert (=> b!1015372 true))

(assert (=> b!1015372 true))

(declare-fun res!681096 () Bool)

(declare-fun e!571192 () Bool)

(assert (=> start!87876 (=> (not res!681096) (not e!571192))))

(declare-datatypes ((B!1460 0))(
  ( (B!1461 (val!11814 Int)) )
))
(declare-datatypes ((tuple2!15174 0))(
  ( (tuple2!15175 (_1!7598 (_ BitVec 64)) (_2!7598 B!1460)) )
))
(declare-datatypes ((List!21460 0))(
  ( (Nil!21457) (Cons!21456 (h!22654 tuple2!15174) (t!30461 List!21460)) )
))
(declare-fun l!412 () List!21460)

(declare-fun isStrictlySorted!588 (List!21460) Bool)

(assert (=> start!87876 (= res!681096 (isStrictlySorted!588 l!412))))

(assert (=> start!87876 e!571192))

(declare-fun e!571191 () Bool)

(assert (=> start!87876 e!571191))

(declare-fun tp_is_empty!23527 () Bool)

(assert (=> start!87876 tp_is_empty!23527))

(declare-fun b!1015371 () Bool)

(declare-fun res!681095 () Bool)

(assert (=> b!1015371 (=> (not res!681095) (not e!571192))))

(declare-fun value!115 () B!1460)

(assert (=> b!1015371 (= res!681095 (and (or (not (is-Cons!21456 l!412)) (not (= (_2!7598 (h!22654 l!412)) value!115))) (or (not (is-Cons!21456 l!412)) (= (_2!7598 (h!22654 l!412)) value!115)) (is-Nil!21457 l!412)))))

(declare-fun lambda!893 () Int)

(declare-datatypes ((List!21461 0))(
  ( (Nil!21458) (Cons!21457 (h!22655 (_ BitVec 64)) (t!30462 List!21461)) )
))
(declare-fun forall!253 (List!21461 Int) Bool)

(assert (=> b!1015372 (= e!571192 (not (forall!253 Nil!21458 lambda!893)))))

(declare-fun b!1015373 () Bool)

(declare-fun tp!70610 () Bool)

(assert (=> b!1015373 (= e!571191 (and tp_is_empty!23527 tp!70610))))

(assert (= (and start!87876 res!681096) b!1015371))

(assert (= (and b!1015371 res!681095) b!1015372))

(assert (= (and start!87876 (is-Cons!21456 l!412)) b!1015373))

(declare-fun m!937509 () Bool)

(assert (=> start!87876 m!937509))

(declare-fun m!937511 () Bool)

(assert (=> b!1015372 m!937511))

(push 1)

(assert (not b!1015372))

(assert (not start!87876))

(assert (not b!1015373))

(assert tp_is_empty!23527)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120959 () Bool)

(declare-fun res!681123 () Bool)

(declare-fun e!571219 () Bool)

(assert (=> d!120959 (=> res!681123 e!571219)))

(assert (=> d!120959 (= res!681123 (is-Nil!21458 Nil!21458))))

(assert (=> d!120959 (= (forall!253 Nil!21458 lambda!893) e!571219)))

(declare-fun b!1015418 () Bool)

(declare-fun e!571220 () Bool)

(assert (=> b!1015418 (= e!571219 e!571220)))

(declare-fun res!681124 () Bool)

(assert (=> b!1015418 (=> (not res!681124) (not e!571220))))

(declare-fun dynLambda!1899 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015418 (= res!681124 (dynLambda!1899 lambda!893 (h!22655 Nil!21458)))))

(declare-fun b!1015419 () Bool)

(assert (=> b!1015419 (= e!571220 (forall!253 (t!30462 Nil!21458) lambda!893))))

(assert (= (and d!120959 (not res!681123)) b!1015418))

(assert (= (and b!1015418 res!681124) b!1015419))

(declare-fun b_lambda!15415 () Bool)

(assert (=> (not b_lambda!15415) (not b!1015418)))

(declare-fun m!937523 () Bool)

(assert (=> b!1015418 m!937523))

(declare-fun m!937525 () Bool)

(assert (=> b!1015419 m!937525))

(assert (=> b!1015372 d!120959))

(declare-fun d!120965 () Bool)

(declare-fun res!681135 () Bool)

(declare-fun e!571234 () Bool)

(assert (=> d!120965 (=> res!681135 e!571234)))

(assert (=> d!120965 (= res!681135 (or (is-Nil!21457 l!412) (is-Nil!21457 (t!30461 l!412))))))

(assert (=> d!120965 (= (isStrictlySorted!588 l!412) e!571234)))

(declare-fun b!1015435 () Bool)

(declare-fun e!571235 () Bool)

(assert (=> b!1015435 (= e!571234 e!571235)))

(declare-fun res!681136 () Bool)

(assert (=> b!1015435 (=> (not res!681136) (not e!571235))))

(assert (=> b!1015435 (= res!681136 (bvslt (_1!7598 (h!22654 l!412)) (_1!7598 (h!22654 (t!30461 l!412)))))))

(declare-fun b!1015436 () Bool)

(assert (=> b!1015436 (= e!571235 (isStrictlySorted!588 (t!30461 l!412)))))

(assert (= (and d!120965 (not res!681135)) b!1015435))

(assert (= (and b!1015435 res!681136) b!1015436))

(declare-fun m!937533 () Bool)

(assert (=> b!1015436 m!937533))

(assert (=> start!87876 d!120965))

(declare-fun b!1015441 () Bool)

(declare-fun e!571238 () Bool)

(declare-fun tp!70622 () Bool)

(assert (=> b!1015441 (= e!571238 (and tp_is_empty!23527 tp!70622))))

(assert (=> b!1015373 (= tp!70610 e!571238)))

(assert (= (and b!1015373 (is-Cons!21456 (t!30461 l!412))) b!1015441))

(declare-fun b_lambda!15421 () Bool)

(assert (= b_lambda!15415 (or b!1015372 b_lambda!15421)))

(declare-fun bs!29437 () Bool)

(declare-fun d!120969 () Bool)

(assert (= bs!29437 (and d!120969 b!1015372)))

(declare-datatypes ((Option!585 0))(
  ( (Some!584 (v!14435 B!1460)) (None!583) )
))
