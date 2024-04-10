; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2074 () Bool)

(assert start!2074)

(declare-fun res!10945 () Bool)

(declare-fun e!8353 () Bool)

(assert (=> start!2074 (=> (not res!10945) (not e!8353))))

(declare-datatypes ((B!534 0))(
  ( (B!535 (val!365 Int)) )
))
(declare-datatypes ((tuple2!530 0))(
  ( (tuple2!531 (_1!265 (_ BitVec 64)) (_2!265 B!534)) )
))
(declare-datatypes ((List!420 0))(
  ( (Nil!417) (Cons!416 (h!982 tuple2!530) (t!2816 List!420)) )
))
(declare-fun l!522 () List!420)

(declare-fun isStrictlySorted!107 (List!420) Bool)

(assert (=> start!2074 (= res!10945 (isStrictlySorted!107 l!522))))

(assert (=> start!2074 e!8353))

(declare-fun e!8354 () Bool)

(assert (=> start!2074 e!8354))

(declare-fun tp_is_empty!713 () Bool)

(assert (=> start!2074 tp_is_empty!713))

(declare-fun b!14007 () Bool)

(declare-fun res!10944 () Bool)

(assert (=> b!14007 (=> (not res!10944) (not e!8353))))

(declare-fun value!159 () B!534)

(assert (=> b!14007 (= res!10944 (and (is-Cons!416 l!522) (= (_2!265 (h!982 l!522)) value!159)))))

(declare-fun b!14008 () Bool)

(declare-fun ListPrimitiveSize!24 (List!420) Int)

(assert (=> b!14008 (= e!8353 (>= (ListPrimitiveSize!24 (t!2816 l!522)) (ListPrimitiveSize!24 l!522)))))

(declare-fun b!14009 () Bool)

(declare-fun tp!2291 () Bool)

(assert (=> b!14009 (= e!8354 (and tp_is_empty!713 tp!2291))))

(assert (= (and start!2074 res!10945) b!14007))

(assert (= (and b!14007 res!10944) b!14008))

(assert (= (and start!2074 (is-Cons!416 l!522)) b!14009))

(declare-fun m!9377 () Bool)

(assert (=> start!2074 m!9377))

(declare-fun m!9379 () Bool)

(assert (=> b!14008 m!9379))

(declare-fun m!9381 () Bool)

(assert (=> b!14008 m!9381))

(push 1)

(assert (not b!14008))

(assert (not start!2074))

(assert (not b!14009))

(assert tp_is_empty!713)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2085 () Bool)

(declare-fun lt!3572 () Int)

(assert (=> d!2085 (>= lt!3572 0)))

(declare-fun e!8365 () Int)

(assert (=> d!2085 (= lt!3572 e!8365)))

(declare-fun c!1288 () Bool)

(assert (=> d!2085 (= c!1288 (is-Nil!417 (t!2816 l!522)))))

(assert (=> d!2085 (= (ListPrimitiveSize!24 (t!2816 l!522)) lt!3572)))

(declare-fun b!14030 () Bool)

(assert (=> b!14030 (= e!8365 0)))

(declare-fun b!14031 () Bool)

(assert (=> b!14031 (= e!8365 (+ 1 (ListPrimitiveSize!24 (t!2816 (t!2816 l!522)))))))

(assert (= (and d!2085 c!1288) b!14030))

(assert (= (and d!2085 (not c!1288)) b!14031))

(declare-fun m!9387 () Bool)

(assert (=> b!14031 m!9387))

(assert (=> b!14008 d!2085))

(declare-fun d!2095 () Bool)

(declare-fun lt!3573 () Int)

(assert (=> d!2095 (>= lt!3573 0)))

(declare-fun e!8366 () Int)

(assert (=> d!2095 (= lt!3573 e!8366)))

(declare-fun c!1289 () Bool)

(assert (=> d!2095 (= c!1289 (is-Nil!417 l!522))))

(assert (=> d!2095 (= (ListPrimitiveSize!24 l!522) lt!3573)))

(declare-fun b!14032 () Bool)

(assert (=> b!14032 (= e!8366 0)))

(declare-fun b!14033 () Bool)

(assert (=> b!14033 (= e!8366 (+ 1 (ListPrimitiveSize!24 (t!2816 l!522))))))

(assert (= (and d!2095 c!1289) b!14032))

(assert (= (and d!2095 (not c!1289)) b!14033))

(assert (=> b!14033 m!9379))

(assert (=> b!14008 d!2095))

(declare-fun d!2097 () Bool)

(declare-fun res!10962 () Bool)

(declare-fun e!8387 () Bool)

(assert (=> d!2097 (=> res!10962 e!8387)))

(assert (=> d!2097 (= res!10962 (or (is-Nil!417 l!522) (is-Nil!417 (t!2816 l!522))))))

(assert (=> d!2097 (= (isStrictlySorted!107 l!522) e!8387)))

(declare-fun b!14058 () Bool)

(declare-fun e!8388 () Bool)

(assert (=> b!14058 (= e!8387 e!8388)))

(declare-fun res!10963 () Bool)

(assert (=> b!14058 (=> (not res!10963) (not e!8388))))

(assert (=> b!14058 (= res!10963 (bvslt (_1!265 (h!982 l!522)) (_1!265 (h!982 (t!2816 l!522)))))))

(declare-fun b!14059 () Bool)

(assert (=> b!14059 (= e!8388 (isStrictlySorted!107 (t!2816 l!522)))))

