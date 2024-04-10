; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1980 () Bool)

(assert start!1980)

(declare-fun res!10507 () Bool)

(declare-fun e!7979 () Bool)

(assert (=> start!1980 (=> (not res!10507) (not e!7979))))

(declare-datatypes ((B!482 0))(
  ( (B!483 (val!339 Int)) )
))
(declare-datatypes ((tuple2!478 0))(
  ( (tuple2!479 (_1!239 (_ BitVec 64)) (_2!239 B!482)) )
))
(declare-datatypes ((List!394 0))(
  ( (Nil!391) (Cons!390 (h!956 tuple2!478) (t!2790 List!394)) )
))
(declare-fun l!522 () List!394)

(declare-fun isStrictlySorted!81 (List!394) Bool)

(assert (=> start!1980 (= res!10507 (isStrictlySorted!81 l!522))))

(assert (=> start!1980 e!7979))

(declare-fun e!7978 () Bool)

(assert (=> start!1980 e!7978))

(declare-fun tp_is_empty!661 () Bool)

(assert (=> start!1980 tp_is_empty!661))

(declare-fun b!13320 () Bool)

(declare-fun res!10506 () Bool)

(assert (=> b!13320 (=> (not res!10506) (not e!7979))))

(declare-fun value!159 () B!482)

(assert (=> b!13320 (= res!10506 (and (not (= (_2!239 (h!956 l!522)) value!159)) (is-Cons!390 l!522)))))

(declare-fun b!13321 () Bool)

(assert (=> b!13321 (= e!7979 (not (isStrictlySorted!81 (t!2790 l!522))))))

(declare-fun b!13322 () Bool)

(declare-fun tp!2168 () Bool)

(assert (=> b!13322 (= e!7978 (and tp_is_empty!661 tp!2168))))

(assert (= (and start!1980 res!10507) b!13320))

(assert (= (and b!13320 res!10506) b!13321))

(assert (= (and start!1980 (is-Cons!390 l!522)) b!13322))

(declare-fun m!9083 () Bool)

(assert (=> start!1980 m!9083))

(declare-fun m!9085 () Bool)

(assert (=> b!13321 m!9085))

(push 1)

(assert (not start!1980))

(assert (not b!13321))

(assert (not b!13322))

(assert tp_is_empty!661)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2001 () Bool)

(declare-fun res!10532 () Bool)

(declare-fun e!8004 () Bool)

(assert (=> d!2001 (=> res!10532 e!8004)))

(assert (=> d!2001 (= res!10532 (or (is-Nil!391 l!522) (is-Nil!391 (t!2790 l!522))))))

(assert (=> d!2001 (= (isStrictlySorted!81 l!522) e!8004)))

(declare-fun b!13353 () Bool)

(declare-fun e!8006 () Bool)

(assert (=> b!13353 (= e!8004 e!8006)))

(declare-fun res!10535 () Bool)

(assert (=> b!13353 (=> (not res!10535) (not e!8006))))

(assert (=> b!13353 (= res!10535 (bvslt (_1!239 (h!956 l!522)) (_1!239 (h!956 (t!2790 l!522)))))))

(declare-fun b!13355 () Bool)

(assert (=> b!13355 (= e!8006 (isStrictlySorted!81 (t!2790 l!522)))))

(assert (= (and d!2001 (not res!10532)) b!13353))

(assert (= (and b!13353 res!10535) b!13355))

(assert (=> b!13355 m!9085))

(assert (=> start!1980 d!2001))

(declare-fun d!2007 () Bool)

(declare-fun res!10540 () Bool)

(declare-fun e!8012 () Bool)

(assert (=> d!2007 (=> res!10540 e!8012)))

(assert (=> d!2007 (= res!10540 (or (is-Nil!391 (t!2790 l!522)) (is-Nil!391 (t!2790 (t!2790 l!522)))))))

(assert (=> d!2007 (= (isStrictlySorted!81 (t!2790 l!522)) e!8012)))

(declare-fun b!13361 () Bool)

(declare-fun e!8013 () Bool)

(assert (=> b!13361 (= e!8012 e!8013)))

(declare-fun res!10541 () Bool)

(assert (=> b!13361 (=> (not res!10541) (not e!8013))))

(assert (=> b!13361 (= res!10541 (bvslt (_1!239 (h!956 (t!2790 l!522))) (_1!239 (h!956 (t!2790 (t!2790 l!522))))))))

(declare-fun b!13362 () Bool)

(assert (=> b!13362 (= e!8013 (isStrictlySorted!81 (t!2790 (t!2790 l!522))))))

(assert (= (and d!2007 (not res!10540)) b!13361))

(assert (= (and b!13361 res!10541) b!13362))

(declare-fun m!9099 () Bool)

(assert (=> b!13362 m!9099))

(assert (=> b!13321 d!2007))

(declare-fun b!13377 () Bool)

(declare-fun e!8022 () Bool)

(declare-fun tp!2181 () Bool)

(assert (=> b!13377 (= e!8022 (and tp_is_empty!661 tp!2181))))

(assert (=> b!13322 (= tp!2168 e!8022)))

(assert (= (and b!13322 (is-Cons!390 (t!2790 l!522))) b!13377))

(push 1)

(assert (not b!13362))

(assert (not b!13355))

(assert (not b!13377))

(assert tp_is_empty!661)

(check-sat)

