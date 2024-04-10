; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2070 () Bool)

(assert start!2070)

(declare-fun res!10933 () Bool)

(declare-fun e!8342 () Bool)

(assert (=> start!2070 (=> (not res!10933) (not e!8342))))

(declare-datatypes ((B!530 0))(
  ( (B!531 (val!363 Int)) )
))
(declare-datatypes ((tuple2!526 0))(
  ( (tuple2!527 (_1!263 (_ BitVec 64)) (_2!263 B!530)) )
))
(declare-datatypes ((List!418 0))(
  ( (Nil!415) (Cons!414 (h!980 tuple2!526) (t!2814 List!418)) )
))
(declare-fun l!522 () List!418)

(declare-fun isStrictlySorted!105 (List!418) Bool)

(assert (=> start!2070 (= res!10933 (isStrictlySorted!105 l!522))))

(assert (=> start!2070 e!8342))

(declare-fun e!8341 () Bool)

(assert (=> start!2070 e!8341))

(declare-fun tp_is_empty!709 () Bool)

(assert (=> start!2070 tp_is_empty!709))

(declare-fun b!13989 () Bool)

(declare-fun res!10932 () Bool)

(assert (=> b!13989 (=> (not res!10932) (not e!8342))))

(declare-fun value!159 () B!530)

(assert (=> b!13989 (= res!10932 (and (is-Cons!414 l!522) (= (_2!263 (h!980 l!522)) value!159)))))

(declare-fun b!13990 () Bool)

(declare-fun ListPrimitiveSize!22 (List!418) Int)

(assert (=> b!13990 (= e!8342 (>= (ListPrimitiveSize!22 (t!2814 l!522)) (ListPrimitiveSize!22 l!522)))))

(declare-fun b!13991 () Bool)

(declare-fun tp!2285 () Bool)

(assert (=> b!13991 (= e!8341 (and tp_is_empty!709 tp!2285))))

(assert (= (and start!2070 res!10933) b!13989))

(assert (= (and b!13989 res!10932) b!13990))

(assert (= (and start!2070 (is-Cons!414 l!522)) b!13991))

(declare-fun m!9365 () Bool)

(assert (=> start!2070 m!9365))

(declare-fun m!9367 () Bool)

(assert (=> b!13990 m!9367))

(declare-fun m!9369 () Bool)

(assert (=> b!13990 m!9369))

(push 1)

(assert (not b!13990))

(assert (not start!2070))

(assert (not b!13991))

(assert tp_is_empty!709)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2083 () Bool)

(declare-fun lt!3568 () Int)

(assert (=> d!2083 (>= lt!3568 0)))

(declare-fun e!8361 () Int)

(assert (=> d!2083 (= lt!3568 e!8361)))

(declare-fun c!1284 () Bool)

(assert (=> d!2083 (= c!1284 (is-Nil!415 (t!2814 l!522)))))

(assert (=> d!2083 (= (ListPrimitiveSize!22 (t!2814 l!522)) lt!3568)))

(declare-fun b!14022 () Bool)

(assert (=> b!14022 (= e!8361 0)))

(declare-fun b!14023 () Bool)

(assert (=> b!14023 (= e!8361 (+ 1 (ListPrimitiveSize!22 (t!2814 (t!2814 l!522)))))))

(assert (= (and d!2083 c!1284) b!14022))

(assert (= (and d!2083 (not c!1284)) b!14023))

(declare-fun m!9383 () Bool)

(assert (=> b!14023 m!9383))

(assert (=> b!13990 d!2083))

(declare-fun d!2087 () Bool)

(declare-fun lt!3570 () Int)

(assert (=> d!2087 (>= lt!3570 0)))

(declare-fun e!8363 () Int)

(assert (=> d!2087 (= lt!3570 e!8363)))

(declare-fun c!1286 () Bool)

(assert (=> d!2087 (= c!1286 (is-Nil!415 l!522))))

(assert (=> d!2087 (= (ListPrimitiveSize!22 l!522) lt!3570)))

(declare-fun b!14026 () Bool)

(assert (=> b!14026 (= e!8363 0)))

(declare-fun b!14027 () Bool)

(assert (=> b!14027 (= e!8363 (+ 1 (ListPrimitiveSize!22 (t!2814 l!522))))))

(assert (= (and d!2087 c!1286) b!14026))

(assert (= (and d!2087 (not c!1286)) b!14027))

(assert (=> b!14027 m!9367))

(assert (=> b!13990 d!2087))

(declare-fun d!2091 () Bool)

(declare-fun res!10958 () Bool)

(declare-fun e!8379 () Bool)

(assert (=> d!2091 (=> res!10958 e!8379)))

(assert (=> d!2091 (= res!10958 (or (is-Nil!415 l!522) (is-Nil!415 (t!2814 l!522))))))

(assert (=> d!2091 (= (isStrictlySorted!105 l!522) e!8379)))

(declare-fun b!14046 () Bool)

(declare-fun e!8380 () Bool)

(assert (=> b!14046 (= e!8379 e!8380)))

(declare-fun res!10959 () Bool)

(assert (=> b!14046 (=> (not res!10959) (not e!8380))))

(assert (=> b!14046 (= res!10959 (bvslt (_1!263 (h!980 l!522)) (_1!263 (h!980 (t!2814 l!522)))))))

(declare-fun b!14047 () Bool)

(assert (=> b!14047 (= e!8380 (isStrictlySorted!105 (t!2814 l!522)))))

(assert (= (and d!2091 (not res!10958)) b!14046))

(assert (= (and b!14046 res!10959) b!14047))

(declare-fun m!9389 () Bool)

(assert (=> b!14047 m!9389))

(assert (=> start!2070 d!2091))

(declare-fun b!14060 () Bool)

(declare-fun e!8389 () Bool)

(declare-fun tp!2296 () Bool)

(assert (=> b!14060 (= e!8389 (and tp_is_empty!709 tp!2296))))

(assert (=> b!13991 (= tp!2285 e!8389)))

(assert (= (and b!13991 (is-Cons!414 (t!2814 l!522))) b!14060))

(push 1)

(assert (not b!14027))

(assert tp_is_empty!709)

