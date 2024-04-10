; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2132 () Bool)

(assert start!2132)

(declare-fun res!11128 () Bool)

(declare-fun e!8594 () Bool)

(assert (=> start!2132 (=> (not res!11128) (not e!8594))))

(declare-datatypes ((B!544 0))(
  ( (B!545 (val!370 Int)) )
))
(declare-datatypes ((tuple2!540 0))(
  ( (tuple2!541 (_1!270 (_ BitVec 64)) (_2!270 B!544)) )
))
(declare-datatypes ((List!425 0))(
  ( (Nil!422) (Cons!421 (h!987 tuple2!540) (t!2824 List!425)) )
))
(declare-fun l!522 () List!425)

(declare-fun isStrictlySorted!112 (List!425) Bool)

(assert (=> start!2132 (= res!11128 (isStrictlySorted!112 l!522))))

(assert (=> start!2132 e!8594))

(declare-fun e!8593 () Bool)

(assert (=> start!2132 e!8593))

(declare-fun tp_is_empty!723 () Bool)

(assert (=> start!2132 tp_is_empty!723))

(declare-fun b!14358 () Bool)

(declare-fun res!11127 () Bool)

(assert (=> b!14358 (=> (not res!11127) (not e!8594))))

(declare-fun value!159 () B!544)

(get-info :version)

(assert (=> b!14358 (= res!11127 (and (not (= (_2!270 (h!987 l!522)) value!159)) ((_ is Cons!421) l!522)))))

(declare-fun b!14359 () Bool)

(declare-fun ListPrimitiveSize!26 (List!425) Int)

(assert (=> b!14359 (= e!8594 (>= (ListPrimitiveSize!26 (t!2824 l!522)) (ListPrimitiveSize!26 l!522)))))

(declare-fun b!14360 () Bool)

(declare-fun tp!2327 () Bool)

(assert (=> b!14360 (= e!8593 (and tp_is_empty!723 tp!2327))))

(assert (= (and start!2132 res!11128) b!14358))

(assert (= (and b!14358 res!11127) b!14359))

(assert (= (and start!2132 ((_ is Cons!421) l!522)) b!14360))

(declare-fun m!9617 () Bool)

(assert (=> start!2132 m!9617))

(declare-fun m!9619 () Bool)

(assert (=> b!14359 m!9619))

(declare-fun m!9621 () Bool)

(assert (=> b!14359 m!9621))

(check-sat (not start!2132) (not b!14359) (not b!14360) tp_is_empty!723)
(check-sat)
(get-model)

(declare-fun d!2241 () Bool)

(declare-fun res!11151 () Bool)

(declare-fun e!8617 () Bool)

(assert (=> d!2241 (=> res!11151 e!8617)))

(assert (=> d!2241 (= res!11151 (or ((_ is Nil!422) l!522) ((_ is Nil!422) (t!2824 l!522))))))

(assert (=> d!2241 (= (isStrictlySorted!112 l!522) e!8617)))

(declare-fun b!14386 () Bool)

(declare-fun e!8618 () Bool)

(assert (=> b!14386 (= e!8617 e!8618)))

(declare-fun res!11152 () Bool)

(assert (=> b!14386 (=> (not res!11152) (not e!8618))))

(assert (=> b!14386 (= res!11152 (bvslt (_1!270 (h!987 l!522)) (_1!270 (h!987 (t!2824 l!522)))))))

(declare-fun b!14387 () Bool)

(assert (=> b!14387 (= e!8618 (isStrictlySorted!112 (t!2824 l!522)))))

(assert (= (and d!2241 (not res!11151)) b!14386))

(assert (= (and b!14386 res!11152) b!14387))

(declare-fun m!9631 () Bool)

(assert (=> b!14387 m!9631))

(assert (=> start!2132 d!2241))

(declare-fun d!2249 () Bool)

(declare-fun lt!3601 () Int)

(assert (=> d!2249 (>= lt!3601 0)))

(declare-fun e!8625 () Int)

(assert (=> d!2249 (= lt!3601 e!8625)))

(declare-fun c!1341 () Bool)

(assert (=> d!2249 (= c!1341 ((_ is Nil!422) (t!2824 l!522)))))

(assert (=> d!2249 (= (ListPrimitiveSize!26 (t!2824 l!522)) lt!3601)))

(declare-fun b!14400 () Bool)

(assert (=> b!14400 (= e!8625 0)))

(declare-fun b!14401 () Bool)

(assert (=> b!14401 (= e!8625 (+ 1 (ListPrimitiveSize!26 (t!2824 (t!2824 l!522)))))))

(assert (= (and d!2249 c!1341) b!14400))

(assert (= (and d!2249 (not c!1341)) b!14401))

(declare-fun m!9635 () Bool)

(assert (=> b!14401 m!9635))

(assert (=> b!14359 d!2249))

(declare-fun d!2253 () Bool)

(declare-fun lt!3604 () Int)

(assert (=> d!2253 (>= lt!3604 0)))

(declare-fun e!8628 () Int)

(assert (=> d!2253 (= lt!3604 e!8628)))

(declare-fun c!1344 () Bool)

(assert (=> d!2253 (= c!1344 ((_ is Nil!422) l!522))))

(assert (=> d!2253 (= (ListPrimitiveSize!26 l!522) lt!3604)))

(declare-fun b!14406 () Bool)

(assert (=> b!14406 (= e!8628 0)))

(declare-fun b!14407 () Bool)

(assert (=> b!14407 (= e!8628 (+ 1 (ListPrimitiveSize!26 (t!2824 l!522))))))

(assert (= (and d!2253 c!1344) b!14406))

(assert (= (and d!2253 (not c!1344)) b!14407))

(assert (=> b!14407 m!9619))

(assert (=> b!14359 d!2253))

(declare-fun b!14425 () Bool)

(declare-fun e!8638 () Bool)

(declare-fun tp!2338 () Bool)

(assert (=> b!14425 (= e!8638 (and tp_is_empty!723 tp!2338))))

(assert (=> b!14360 (= tp!2327 e!8638)))

(assert (= (and b!14360 ((_ is Cons!421) (t!2824 l!522))) b!14425))

(check-sat (not b!14425) (not b!14387) (not b!14401) (not b!14407) tp_is_empty!723)
(check-sat)
