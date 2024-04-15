; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2070 () Bool)

(assert start!2070)

(declare-fun res!10932 () Bool)

(declare-fun e!8342 () Bool)

(assert (=> start!2070 (=> (not res!10932) (not e!8342))))

(declare-datatypes ((B!530 0))(
  ( (B!531 (val!363 Int)) )
))
(declare-datatypes ((tuple2!522 0))(
  ( (tuple2!523 (_1!261 (_ BitVec 64)) (_2!261 B!530)) )
))
(declare-datatypes ((List!414 0))(
  ( (Nil!411) (Cons!410 (h!976 tuple2!522) (t!2810 List!414)) )
))
(declare-fun l!522 () List!414)

(declare-fun isStrictlySorted!102 (List!414) Bool)

(assert (=> start!2070 (= res!10932 (isStrictlySorted!102 l!522))))

(assert (=> start!2070 e!8342))

(declare-fun e!8341 () Bool)

(assert (=> start!2070 e!8341))

(declare-fun tp_is_empty!709 () Bool)

(assert (=> start!2070 tp_is_empty!709))

(declare-fun b!13989 () Bool)

(declare-fun res!10933 () Bool)

(assert (=> b!13989 (=> (not res!10933) (not e!8342))))

(declare-fun value!159 () B!530)

(get-info :version)

(assert (=> b!13989 (= res!10933 (and ((_ is Cons!410) l!522) (= (_2!261 (h!976 l!522)) value!159)))))

(declare-fun b!13990 () Bool)

(declare-fun ListPrimitiveSize!22 (List!414) Int)

(assert (=> b!13990 (= e!8342 (>= (ListPrimitiveSize!22 (t!2810 l!522)) (ListPrimitiveSize!22 l!522)))))

(declare-fun b!13991 () Bool)

(declare-fun tp!2285 () Bool)

(assert (=> b!13991 (= e!8341 (and tp_is_empty!709 tp!2285))))

(assert (= (and start!2070 res!10932) b!13989))

(assert (= (and b!13989 res!10933) b!13990))

(assert (= (and start!2070 ((_ is Cons!410) l!522)) b!13991))

(declare-fun m!9357 () Bool)

(assert (=> start!2070 m!9357))

(declare-fun m!9359 () Bool)

(assert (=> b!13990 m!9359))

(declare-fun m!9361 () Bool)

(assert (=> b!13990 m!9361))

(check-sat (not b!13990) (not start!2070) (not b!13991) tp_is_empty!709)
(check-sat)
(get-model)

(declare-fun d!2081 () Bool)

(declare-fun lt!3568 () Int)

(assert (=> d!2081 (>= lt!3568 0)))

(declare-fun e!8363 () Int)

(assert (=> d!2081 (= lt!3568 e!8363)))

(declare-fun c!1286 () Bool)

(assert (=> d!2081 (= c!1286 ((_ is Nil!411) (t!2810 l!522)))))

(assert (=> d!2081 (= (ListPrimitiveSize!22 (t!2810 l!522)) lt!3568)))

(declare-fun b!14026 () Bool)

(assert (=> b!14026 (= e!8363 0)))

(declare-fun b!14027 () Bool)

(assert (=> b!14027 (= e!8363 (+ 1 (ListPrimitiveSize!22 (t!2810 (t!2810 l!522)))))))

(assert (= (and d!2081 c!1286) b!14026))

(assert (= (and d!2081 (not c!1286)) b!14027))

(declare-fun m!9379 () Bool)

(assert (=> b!14027 m!9379))

(assert (=> b!13990 d!2081))

(declare-fun d!2091 () Bool)

(declare-fun lt!3573 () Int)

(assert (=> d!2091 (>= lt!3573 0)))

(declare-fun e!8366 () Int)

(assert (=> d!2091 (= lt!3573 e!8366)))

(declare-fun c!1289 () Bool)

(assert (=> d!2091 (= c!1289 ((_ is Nil!411) l!522))))

(assert (=> d!2091 (= (ListPrimitiveSize!22 l!522) lt!3573)))

(declare-fun b!14032 () Bool)

(assert (=> b!14032 (= e!8366 0)))

(declare-fun b!14033 () Bool)

(assert (=> b!14033 (= e!8366 (+ 1 (ListPrimitiveSize!22 (t!2810 l!522))))))

(assert (= (and d!2091 c!1289) b!14032))

(assert (= (and d!2091 (not c!1289)) b!14033))

(assert (=> b!14033 m!9359))

(assert (=> b!13990 d!2091))

(declare-fun d!2097 () Bool)

(declare-fun res!10962 () Bool)

(declare-fun e!8383 () Bool)

(assert (=> d!2097 (=> res!10962 e!8383)))

(assert (=> d!2097 (= res!10962 (or ((_ is Nil!411) l!522) ((_ is Nil!411) (t!2810 l!522))))))

(assert (=> d!2097 (= (isStrictlySorted!102 l!522) e!8383)))

(declare-fun b!14050 () Bool)

(declare-fun e!8384 () Bool)

(assert (=> b!14050 (= e!8383 e!8384)))

(declare-fun res!10963 () Bool)

(assert (=> b!14050 (=> (not res!10963) (not e!8384))))

(assert (=> b!14050 (= res!10963 (bvslt (_1!261 (h!976 l!522)) (_1!261 (h!976 (t!2810 l!522)))))))

(declare-fun b!14051 () Bool)

(assert (=> b!14051 (= e!8384 (isStrictlySorted!102 (t!2810 l!522)))))

(assert (= (and d!2097 (not res!10962)) b!14050))

(assert (= (and b!14050 res!10963) b!14051))

(declare-fun m!9385 () Bool)

(assert (=> b!14051 m!9385))

(assert (=> start!2070 d!2097))

(declare-fun b!14066 () Bool)

(declare-fun e!8393 () Bool)

(declare-fun tp!2300 () Bool)

(assert (=> b!14066 (= e!8393 (and tp_is_empty!709 tp!2300))))

(assert (=> b!13991 (= tp!2285 e!8393)))

(assert (= (and b!13991 ((_ is Cons!410) (t!2810 l!522))) b!14066))

(check-sat (not b!14066) tp_is_empty!709 (not b!14027) (not b!14033) (not b!14051))
(check-sat)
