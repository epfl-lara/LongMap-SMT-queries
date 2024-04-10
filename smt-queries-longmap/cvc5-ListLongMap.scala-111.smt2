; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1926 () Bool)

(assert start!1926)

(declare-fun res!10287 () Bool)

(declare-fun e!7778 () Bool)

(assert (=> start!1926 (=> (not res!10287) (not e!7778))))

(declare-datatypes ((B!464 0))(
  ( (B!465 (val!330 Int)) )
))
(declare-datatypes ((tuple2!460 0))(
  ( (tuple2!461 (_1!230 (_ BitVec 64)) (_2!230 B!464)) )
))
(declare-datatypes ((List!385 0))(
  ( (Nil!382) (Cons!381 (h!947 tuple2!460) (t!2778 List!385)) )
))
(declare-fun l!522 () List!385)

(declare-fun isStrictlySorted!72 (List!385) Bool)

(assert (=> start!1926 (= res!10287 (isStrictlySorted!72 l!522))))

(assert (=> start!1926 e!7778))

(declare-fun e!7777 () Bool)

(assert (=> start!1926 e!7777))

(declare-fun tp_is_empty!643 () Bool)

(assert (=> start!1926 tp_is_empty!643))

(declare-fun b!12978 () Bool)

(declare-fun res!10288 () Bool)

(assert (=> b!12978 (=> (not res!10288) (not e!7778))))

(declare-fun value!159 () B!464)

(assert (=> b!12978 (= res!10288 (and (is-Cons!381 l!522) (= (_2!230 (h!947 l!522)) value!159)))))

(declare-fun b!12979 () Bool)

(assert (=> b!12979 (= e!7778 (not (isStrictlySorted!72 (t!2778 l!522))))))

(declare-fun b!12980 () Bool)

(declare-fun tp!2123 () Bool)

(assert (=> b!12980 (= e!7777 (and tp_is_empty!643 tp!2123))))

(assert (= (and start!1926 res!10287) b!12978))

(assert (= (and b!12978 res!10288) b!12979))

(assert (= (and start!1926 (is-Cons!381 l!522)) b!12980))

(declare-fun m!8909 () Bool)

(assert (=> start!1926 m!8909))

(declare-fun m!8911 () Bool)

(assert (=> b!12979 m!8911))

(push 1)

(assert (not start!1926))

(assert (not b!12979))

(assert (not b!12980))

(assert tp_is_empty!643)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1934 () Bool)

(declare-fun res!10316 () Bool)

(declare-fun e!7806 () Bool)

(assert (=> d!1934 (=> res!10316 e!7806)))

(assert (=> d!1934 (= res!10316 (or (is-Nil!382 l!522) (is-Nil!382 (t!2778 l!522))))))

(assert (=> d!1934 (= (isStrictlySorted!72 l!522) e!7806)))

(declare-fun b!13014 () Bool)

(declare-fun e!7808 () Bool)

(assert (=> b!13014 (= e!7806 e!7808)))

(declare-fun res!10318 () Bool)

(assert (=> b!13014 (=> (not res!10318) (not e!7808))))

(assert (=> b!13014 (= res!10318 (bvslt (_1!230 (h!947 l!522)) (_1!230 (h!947 (t!2778 l!522)))))))

(declare-fun b!13016 () Bool)

(assert (=> b!13016 (= e!7808 (isStrictlySorted!72 (t!2778 l!522)))))

(assert (= (and d!1934 (not res!10316)) b!13014))

(assert (= (and b!13014 res!10318) b!13016))

(assert (=> b!13016 m!8911))

(assert (=> start!1926 d!1934))

(declare-fun d!1943 () Bool)

(declare-fun res!10322 () Bool)

(declare-fun e!7812 () Bool)

(assert (=> d!1943 (=> res!10322 e!7812)))

(assert (=> d!1943 (= res!10322 (or (is-Nil!382 (t!2778 l!522)) (is-Nil!382 (t!2778 (t!2778 l!522)))))))

(assert (=> d!1943 (= (isStrictlySorted!72 (t!2778 l!522)) e!7812)))

(declare-fun b!13020 () Bool)

(declare-fun e!7814 () Bool)

(assert (=> b!13020 (= e!7812 e!7814)))

(declare-fun res!10324 () Bool)

(assert (=> b!13020 (=> (not res!10324) (not e!7814))))

(assert (=> b!13020 (= res!10324 (bvslt (_1!230 (h!947 (t!2778 l!522))) (_1!230 (h!947 (t!2778 (t!2778 l!522))))))))

(declare-fun b!13022 () Bool)

(assert (=> b!13022 (= e!7814 (isStrictlySorted!72 (t!2778 (t!2778 l!522))))))

(assert (= (and d!1943 (not res!10322)) b!13020))

(assert (= (and b!13020 res!10324) b!13022))

(declare-fun m!8925 () Bool)

(assert (=> b!13022 m!8925))

(assert (=> b!12979 d!1943))

(declare-fun b!13037 () Bool)

(declare-fun e!7823 () Bool)

(declare-fun tp!2138 () Bool)

(assert (=> b!13037 (= e!7823 (and tp_is_empty!643 tp!2138))))

(assert (=> b!12980 (= tp!2123 e!7823)))

(assert (= (and b!12980 (is-Cons!381 (t!2778 l!522))) b!13037))

(push 1)

(assert (not b!13022))

(assert (not b!13016))

(assert (not b!13037))

(assert tp_is_empty!643)

(check-sat)

(pop 1)

