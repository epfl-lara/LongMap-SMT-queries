; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2070 () Bool)

(assert start!2070)

(declare-fun res!10931 () Bool)

(declare-fun e!8338 () Bool)

(assert (=> start!2070 (=> (not res!10931) (not e!8338))))

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

(declare-fun isStrictlySorted!99 (List!414) Bool)

(assert (=> start!2070 (= res!10931 (isStrictlySorted!99 l!522))))

(assert (=> start!2070 e!8338))

(declare-fun e!8337 () Bool)

(assert (=> start!2070 e!8337))

(declare-fun tp_is_empty!709 () Bool)

(assert (=> start!2070 tp_is_empty!709))

(declare-fun b!13983 () Bool)

(declare-fun res!10930 () Bool)

(assert (=> b!13983 (=> (not res!10930) (not e!8338))))

(declare-fun value!159 () B!530)

(get-info :version)

(assert (=> b!13983 (= res!10930 (and ((_ is Cons!410) l!522) (= (_2!261 (h!976 l!522)) value!159)))))

(declare-fun b!13984 () Bool)

(declare-fun ListPrimitiveSize!22 (List!414) Int)

(assert (=> b!13984 (= e!8338 (>= (ListPrimitiveSize!22 (t!2810 l!522)) (ListPrimitiveSize!22 l!522)))))

(declare-fun b!13985 () Bool)

(declare-fun tp!2285 () Bool)

(assert (=> b!13985 (= e!8337 (and tp_is_empty!709 tp!2285))))

(assert (= (and start!2070 res!10931) b!13983))

(assert (= (and b!13983 res!10930) b!13984))

(assert (= (and start!2070 ((_ is Cons!410) l!522)) b!13985))

(declare-fun m!9357 () Bool)

(assert (=> start!2070 m!9357))

(declare-fun m!9359 () Bool)

(assert (=> b!13984 m!9359))

(declare-fun m!9361 () Bool)

(assert (=> b!13984 m!9361))

(check-sat (not start!2070) (not b!13984) (not b!13985) tp_is_empty!709)
(check-sat)
(get-model)

(declare-fun d!2077 () Bool)

(declare-fun res!10948 () Bool)

(declare-fun e!8355 () Bool)

(assert (=> d!2077 (=> res!10948 e!8355)))

(assert (=> d!2077 (= res!10948 (or ((_ is Nil!411) l!522) ((_ is Nil!411) (t!2810 l!522))))))

(assert (=> d!2077 (= (isStrictlySorted!99 l!522) e!8355)))

(declare-fun b!14008 () Bool)

(declare-fun e!8356 () Bool)

(assert (=> b!14008 (= e!8355 e!8356)))

(declare-fun res!10949 () Bool)

(assert (=> b!14008 (=> (not res!10949) (not e!8356))))

(assert (=> b!14008 (= res!10949 (bvslt (_1!261 (h!976 l!522)) (_1!261 (h!976 (t!2810 l!522)))))))

(declare-fun b!14009 () Bool)

(assert (=> b!14009 (= e!8356 (isStrictlySorted!99 (t!2810 l!522)))))

(assert (= (and d!2077 (not res!10948)) b!14008))

(assert (= (and b!14008 res!10949) b!14009))

(declare-fun m!9375 () Bool)

(assert (=> b!14009 m!9375))

(assert (=> start!2070 d!2077))

(declare-fun d!2083 () Bool)

(declare-fun lt!3564 () Int)

(assert (=> d!2083 (>= lt!3564 0)))

(declare-fun e!8367 () Int)

(assert (=> d!2083 (= lt!3564 e!8367)))

(declare-fun c!1278 () Bool)

(assert (=> d!2083 (= c!1278 ((_ is Nil!411) (t!2810 l!522)))))

(assert (=> d!2083 (= (ListPrimitiveSize!22 (t!2810 l!522)) lt!3564)))

(declare-fun b!14022 () Bool)

(assert (=> b!14022 (= e!8367 0)))

(declare-fun b!14023 () Bool)

(assert (=> b!14023 (= e!8367 (+ 1 (ListPrimitiveSize!22 (t!2810 (t!2810 l!522)))))))

(assert (= (and d!2083 c!1278) b!14022))

(assert (= (and d!2083 (not c!1278)) b!14023))

(declare-fun m!9377 () Bool)

(assert (=> b!14023 m!9377))

(assert (=> b!13984 d!2083))

(declare-fun d!2085 () Bool)

(declare-fun lt!3565 () Int)

(assert (=> d!2085 (>= lt!3565 0)))

(declare-fun e!8372 () Int)

(assert (=> d!2085 (= lt!3565 e!8372)))

(declare-fun c!1279 () Bool)

(assert (=> d!2085 (= c!1279 ((_ is Nil!411) l!522))))

(assert (=> d!2085 (= (ListPrimitiveSize!22 l!522) lt!3565)))

(declare-fun b!14028 () Bool)

(assert (=> b!14028 (= e!8372 0)))

(declare-fun b!14029 () Bool)

(assert (=> b!14029 (= e!8372 (+ 1 (ListPrimitiveSize!22 (t!2810 l!522))))))

(assert (= (and d!2085 c!1279) b!14028))

(assert (= (and d!2085 (not c!1279)) b!14029))

(assert (=> b!14029 m!9359))

(assert (=> b!13984 d!2085))

(declare-fun b!14042 () Bool)

(declare-fun e!8378 () Bool)

(declare-fun tp!2294 () Bool)

(assert (=> b!14042 (= e!8378 (and tp_is_empty!709 tp!2294))))

(assert (=> b!13985 (= tp!2285 e!8378)))

(assert (= (and b!13985 ((_ is Cons!410) (t!2810 l!522))) b!14042))

(check-sat tp_is_empty!709 (not b!14023) (not b!14029) (not b!14009) (not b!14042))
(check-sat)
