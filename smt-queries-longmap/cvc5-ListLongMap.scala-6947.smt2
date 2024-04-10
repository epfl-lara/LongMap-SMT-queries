; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87474 () Bool)

(assert start!87474)

(declare-fun res!680289 () Bool)

(declare-fun e!569910 () Bool)

(assert (=> start!87474 (=> (not res!680289) (not e!569910))))

(declare-datatypes ((B!1388 0))(
  ( (B!1389 (val!11778 Int)) )
))
(declare-datatypes ((tuple2!15102 0))(
  ( (tuple2!15103 (_1!7562 (_ BitVec 64)) (_2!7562 B!1388)) )
))
(declare-datatypes ((List!21397 0))(
  ( (Nil!21394) (Cons!21393 (h!22591 tuple2!15102) (t!30398 List!21397)) )
))
(declare-fun l!412 () List!21397)

(declare-fun isStrictlySorted!552 (List!21397) Bool)

(assert (=> start!87474 (= res!680289 (isStrictlySorted!552 l!412))))

(assert (=> start!87474 e!569910))

(declare-fun e!569911 () Bool)

(assert (=> start!87474 e!569911))

(declare-fun b!1013134 () Bool)

(declare-fun ListPrimitiveSize!97 (List!21397) Int)

(assert (=> b!1013134 (= e!569910 (< (ListPrimitiveSize!97 l!412) 0))))

(declare-fun b!1013135 () Bool)

(declare-fun tp_is_empty!23455 () Bool)

(declare-fun tp!70391 () Bool)

(assert (=> b!1013135 (= e!569911 (and tp_is_empty!23455 tp!70391))))

(assert (= (and start!87474 res!680289) b!1013134))

(assert (= (and start!87474 (is-Cons!21393 l!412)) b!1013135))

(declare-fun m!936303 () Bool)

(assert (=> start!87474 m!936303))

(declare-fun m!936305 () Bool)

(assert (=> b!1013134 m!936305))

(push 1)

(assert (not b!1013134))

(assert (not start!87474))

(assert (not b!1013135))

(assert tp_is_empty!23455)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120397 () Bool)

(declare-fun lt!447878 () Int)

(assert (=> d!120397 (>= lt!447878 0)))

(declare-fun e!569932 () Int)

(assert (=> d!120397 (= lt!447878 e!569932)))

(declare-fun c!102407 () Bool)

(assert (=> d!120397 (= c!102407 (is-Nil!21394 l!412))))

(assert (=> d!120397 (= (ListPrimitiveSize!97 l!412) lt!447878)))

(declare-fun b!1013160 () Bool)

(assert (=> b!1013160 (= e!569932 0)))

(declare-fun b!1013161 () Bool)

(assert (=> b!1013161 (= e!569932 (+ 1 (ListPrimitiveSize!97 (t!30398 l!412))))))

(assert (= (and d!120397 c!102407) b!1013160))

(assert (= (and d!120397 (not c!102407)) b!1013161))

(declare-fun m!936315 () Bool)

(assert (=> b!1013161 m!936315))

(assert (=> b!1013134 d!120397))

(declare-fun d!120399 () Bool)

(declare-fun res!680308 () Bool)

(declare-fun e!569942 () Bool)

(assert (=> d!120399 (=> res!680308 e!569942)))

(assert (=> d!120399 (= res!680308 (or (is-Nil!21394 l!412) (is-Nil!21394 (t!30398 l!412))))))

(assert (=> d!120399 (= (isStrictlySorted!552 l!412) e!569942)))

(declare-fun b!1013174 () Bool)

(declare-fun e!569943 () Bool)

(assert (=> b!1013174 (= e!569942 e!569943)))

(declare-fun res!680309 () Bool)

(assert (=> b!1013174 (=> (not res!680309) (not e!569943))))

(assert (=> b!1013174 (= res!680309 (bvslt (_1!7562 (h!22591 l!412)) (_1!7562 (h!22591 (t!30398 l!412)))))))

(declare-fun b!1013175 () Bool)

(assert (=> b!1013175 (= e!569943 (isStrictlySorted!552 (t!30398 l!412)))))

(assert (= (and d!120399 (not res!680308)) b!1013174))

(assert (= (and b!1013174 res!680309) b!1013175))

(declare-fun m!936321 () Bool)

(assert (=> b!1013175 m!936321))

(assert (=> start!87474 d!120399))

(declare-fun b!1013184 () Bool)

(declare-fun e!569950 () Bool)

(declare-fun tp!70400 () Bool)

(assert (=> b!1013184 (= e!569950 (and tp_is_empty!23455 tp!70400))))

(assert (=> b!1013135 (= tp!70391 e!569950)))

(assert (= (and b!1013135 (is-Cons!21393 (t!30398 l!412))) b!1013184))

(push 1)

