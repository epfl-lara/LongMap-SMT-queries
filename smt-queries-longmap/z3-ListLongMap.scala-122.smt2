; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2072 () Bool)

(assert start!2072)

(declare-fun res!10938 () Bool)

(declare-fun e!8347 () Bool)

(assert (=> start!2072 (=> (not res!10938) (not e!8347))))

(declare-datatypes ((B!532 0))(
  ( (B!533 (val!364 Int)) )
))
(declare-datatypes ((tuple2!528 0))(
  ( (tuple2!529 (_1!264 (_ BitVec 64)) (_2!264 B!532)) )
))
(declare-datatypes ((List!419 0))(
  ( (Nil!416) (Cons!415 (h!981 tuple2!528) (t!2815 List!419)) )
))
(declare-fun l!522 () List!419)

(declare-fun isStrictlySorted!106 (List!419) Bool)

(assert (=> start!2072 (= res!10938 (isStrictlySorted!106 l!522))))

(assert (=> start!2072 e!8347))

(declare-fun e!8348 () Bool)

(assert (=> start!2072 e!8348))

(declare-fun tp_is_empty!711 () Bool)

(assert (=> start!2072 tp_is_empty!711))

(declare-fun b!13998 () Bool)

(declare-fun res!10939 () Bool)

(assert (=> b!13998 (=> (not res!10939) (not e!8347))))

(declare-fun value!159 () B!532)

(get-info :version)

(assert (=> b!13998 (= res!10939 (and ((_ is Cons!415) l!522) (= (_2!264 (h!981 l!522)) value!159)))))

(declare-fun b!13999 () Bool)

(declare-fun ListPrimitiveSize!23 (List!419) Int)

(assert (=> b!13999 (= e!8347 (>= (ListPrimitiveSize!23 (t!2815 l!522)) (ListPrimitiveSize!23 l!522)))))

(declare-fun b!14000 () Bool)

(declare-fun tp!2288 () Bool)

(assert (=> b!14000 (= e!8348 (and tp_is_empty!711 tp!2288))))

(assert (= (and start!2072 res!10938) b!13998))

(assert (= (and b!13998 res!10939) b!13999))

(assert (= (and start!2072 ((_ is Cons!415) l!522)) b!14000))

(declare-fun m!9371 () Bool)

(assert (=> start!2072 m!9371))

(declare-fun m!9373 () Bool)

(assert (=> b!13999 m!9373))

(declare-fun m!9375 () Bool)

(assert (=> b!13999 m!9375))

(check-sat (not b!13999) (not start!2072) (not b!14000) tp_is_empty!711)
(check-sat)
(get-model)

(declare-fun d!2082 () Bool)

(declare-fun lt!3569 () Int)

(assert (=> d!2082 (>= lt!3569 0)))

(declare-fun e!8362 () Int)

(assert (=> d!2082 (= lt!3569 e!8362)))

(declare-fun c!1285 () Bool)

(assert (=> d!2082 (= c!1285 ((_ is Nil!416) (t!2815 l!522)))))

(assert (=> d!2082 (= (ListPrimitiveSize!23 (t!2815 l!522)) lt!3569)))

(declare-fun b!14024 () Bool)

(assert (=> b!14024 (= e!8362 0)))

(declare-fun b!14025 () Bool)

(assert (=> b!14025 (= e!8362 (+ 1 (ListPrimitiveSize!23 (t!2815 (t!2815 l!522)))))))

(assert (= (and d!2082 c!1285) b!14024))

(assert (= (and d!2082 (not c!1285)) b!14025))

(declare-fun m!9385 () Bool)

(assert (=> b!14025 m!9385))

(assert (=> b!13999 d!2082))

(declare-fun d!2089 () Bool)

(declare-fun lt!3571 () Int)

(assert (=> d!2089 (>= lt!3571 0)))

(declare-fun e!8364 () Int)

(assert (=> d!2089 (= lt!3571 e!8364)))

(declare-fun c!1287 () Bool)

(assert (=> d!2089 (= c!1287 ((_ is Nil!416) l!522))))

(assert (=> d!2089 (= (ListPrimitiveSize!23 l!522) lt!3571)))

(declare-fun b!14028 () Bool)

(assert (=> b!14028 (= e!8364 0)))

(declare-fun b!14029 () Bool)

(assert (=> b!14029 (= e!8364 (+ 1 (ListPrimitiveSize!23 (t!2815 l!522))))))

(assert (= (and d!2089 c!1287) b!14028))

(assert (= (and d!2089 (not c!1287)) b!14029))

(assert (=> b!14029 m!9373))

(assert (=> b!13999 d!2089))

(declare-fun d!2093 () Bool)

(declare-fun res!10960 () Bool)

(declare-fun e!8381 () Bool)

(assert (=> d!2093 (=> res!10960 e!8381)))

(assert (=> d!2093 (= res!10960 (or ((_ is Nil!416) l!522) ((_ is Nil!416) (t!2815 l!522))))))

(assert (=> d!2093 (= (isStrictlySorted!106 l!522) e!8381)))

(declare-fun b!14048 () Bool)

(declare-fun e!8382 () Bool)

(assert (=> b!14048 (= e!8381 e!8382)))

(declare-fun res!10961 () Bool)

(assert (=> b!14048 (=> (not res!10961) (not e!8382))))

(assert (=> b!14048 (= res!10961 (bvslt (_1!264 (h!981 l!522)) (_1!264 (h!981 (t!2815 l!522)))))))

(declare-fun b!14049 () Bool)

(assert (=> b!14049 (= e!8382 (isStrictlySorted!106 (t!2815 l!522)))))

(assert (= (and d!2093 (not res!10960)) b!14048))

(assert (= (and b!14048 res!10961) b!14049))

(declare-fun m!9391 () Bool)

(assert (=> b!14049 m!9391))

(assert (=> start!2072 d!2093))

(declare-fun b!14063 () Bool)

(declare-fun e!8390 () Bool)

(declare-fun tp!2297 () Bool)

(assert (=> b!14063 (= e!8390 (and tp_is_empty!711 tp!2297))))

(assert (=> b!14000 (= tp!2288 e!8390)))

(assert (= (and b!14000 ((_ is Cons!415) (t!2815 l!522))) b!14063))

(check-sat (not b!14029) (not b!14049) (not b!14063) tp_is_empty!711 (not b!14025))
(check-sat)
