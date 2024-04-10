; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137894 () Bool)

(assert start!137894)

(declare-fun res!1081667 () Bool)

(declare-fun e!883848 () Bool)

(assert (=> start!137894 (=> (not res!1081667) (not e!883848))))

(declare-datatypes ((B!2856 0))(
  ( (B!2857 (val!19790 Int)) )
))
(declare-datatypes ((tuple2!25748 0))(
  ( (tuple2!25749 (_1!12885 (_ BitVec 64)) (_2!12885 B!2856)) )
))
(declare-datatypes ((List!36910 0))(
  ( (Nil!36907) (Cons!36906 (h!38449 tuple2!25748) (t!51824 List!36910)) )
))
(declare-fun l!548 () List!36910)

(declare-fun isStrictlySorted!1144 (List!36910) Bool)

(assert (=> start!137894 (= res!1081667 (isStrictlySorted!1144 l!548))))

(assert (=> start!137894 e!883848))

(declare-fun e!883849 () Bool)

(assert (=> start!137894 e!883849))

(declare-fun b!1583433 () Bool)

(declare-fun ListPrimitiveSize!213 (List!36910) Int)

(assert (=> b!1583433 (= e!883848 (< (ListPrimitiveSize!213 l!548) 0))))

(declare-fun b!1583434 () Bool)

(declare-fun tp_is_empty!39389 () Bool)

(declare-fun tp!114955 () Bool)

(assert (=> b!1583434 (= e!883849 (and tp_is_empty!39389 tp!114955))))

(assert (= (and start!137894 res!1081667) b!1583433))

(assert (= (and start!137894 (is-Cons!36906 l!548)) b!1583434))

(declare-fun m!1453309 () Bool)

(assert (=> start!137894 m!1453309))

(declare-fun m!1453311 () Bool)

(assert (=> b!1583433 m!1453311))

(push 1)

(assert (not b!1583433))

(assert (not start!137894))

(assert (not b!1583434))

(assert tp_is_empty!39389)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167231 () Bool)

(declare-fun lt!677172 () Int)

(assert (=> d!167231 (>= lt!677172 0)))

(declare-fun e!883861 () Int)

(assert (=> d!167231 (= lt!677172 e!883861)))

(declare-fun c!146735 () Bool)

(assert (=> d!167231 (= c!146735 (is-Nil!36907 l!548))))

(assert (=> d!167231 (= (ListPrimitiveSize!213 l!548) lt!677172)))

(declare-fun b!1583451 () Bool)

(assert (=> b!1583451 (= e!883861 0)))

(declare-fun b!1583452 () Bool)

(assert (=> b!1583452 (= e!883861 (+ 1 (ListPrimitiveSize!213 (t!51824 l!548))))))

(assert (= (and d!167231 c!146735) b!1583451))

(assert (= (and d!167231 (not c!146735)) b!1583452))

(declare-fun m!1453317 () Bool)

(assert (=> b!1583452 m!1453317))

(assert (=> b!1583433 d!167231))

(declare-fun d!167239 () Bool)

(declare-fun res!1081683 () Bool)

(declare-fun e!883876 () Bool)

(assert (=> d!167239 (=> res!1081683 e!883876)))

(assert (=> d!167239 (= res!1081683 (or (is-Nil!36907 l!548) (is-Nil!36907 (t!51824 l!548))))))

(assert (=> d!167239 (= (isStrictlySorted!1144 l!548) e!883876)))

(declare-fun b!1583473 () Bool)

(declare-fun e!883878 () Bool)

(assert (=> b!1583473 (= e!883876 e!883878)))

(declare-fun res!1081685 () Bool)

(assert (=> b!1583473 (=> (not res!1081685) (not e!883878))))

(assert (=> b!1583473 (= res!1081685 (bvslt (_1!12885 (h!38449 l!548)) (_1!12885 (h!38449 (t!51824 l!548)))))))

(declare-fun b!1583474 () Bool)

(assert (=> b!1583474 (= e!883878 (isStrictlySorted!1144 (t!51824 l!548)))))

(assert (= (and d!167239 (not res!1081683)) b!1583473))

(assert (= (and b!1583473 res!1081685) b!1583474))

(declare-fun m!1453323 () Bool)

(assert (=> b!1583474 m!1453323))

(assert (=> start!137894 d!167239))

(declare-fun b!1583485 () Bool)

(declare-fun e!883885 () Bool)

(declare-fun tp!114964 () Bool)

(assert (=> b!1583485 (= e!883885 (and tp_is_empty!39389 tp!114964))))

(assert (=> b!1583434 (= tp!114955 e!883885)))

(assert (= (and b!1583434 (is-Cons!36906 (t!51824 l!548))) b!1583485))

(push 1)

