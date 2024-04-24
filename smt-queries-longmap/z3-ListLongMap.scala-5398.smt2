; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72182 () Bool)

(assert start!72182)

(declare-fun res!569378 () Bool)

(declare-fun e!467211 () Bool)

(assert (=> start!72182 (=> (not res!569378) (not e!467211))))

(declare-datatypes ((B!1190 0))(
  ( (B!1191 (val!7677 Int)) )
))
(declare-datatypes ((tuple2!10138 0))(
  ( (tuple2!10139 (_1!5080 (_ BitVec 64)) (_2!5080 B!1190)) )
))
(declare-datatypes ((List!15886 0))(
  ( (Nil!15883) (Cons!15882 (h!17019 tuple2!10138) (t!22249 List!15886)) )
))
(declare-fun l!390 () List!15886)

(declare-fun isStrictlySorted!440 (List!15886) Bool)

(assert (=> start!72182 (= res!569378 (isStrictlySorted!440 l!390))))

(assert (=> start!72182 e!467211))

(declare-fun e!467212 () Bool)

(assert (=> start!72182 e!467212))

(declare-fun b!837295 () Bool)

(declare-fun res!569379 () Bool)

(assert (=> b!837295 (=> (not res!569379) (not e!467211))))

(get-info :version)

(assert (=> b!837295 (= res!569379 ((_ is Cons!15882) l!390))))

(declare-fun b!837296 () Bool)

(declare-fun ListPrimitiveSize!70 (List!15886) Int)

(assert (=> b!837296 (= e!467211 (>= (ListPrimitiveSize!70 (t!22249 l!390)) (ListPrimitiveSize!70 l!390)))))

(declare-fun b!837297 () Bool)

(declare-fun tp_is_empty!15259 () Bool)

(declare-fun tp!47441 () Bool)

(assert (=> b!837297 (= e!467212 (and tp_is_empty!15259 tp!47441))))

(assert (= (and start!72182 res!569378) b!837295))

(assert (= (and b!837295 res!569379) b!837296))

(assert (= (and start!72182 ((_ is Cons!15882) l!390)) b!837297))

(declare-fun m!782971 () Bool)

(assert (=> start!72182 m!782971))

(declare-fun m!782973 () Bool)

(assert (=> b!837296 m!782973))

(declare-fun m!782975 () Bool)

(assert (=> b!837296 m!782975))

(check-sat (not start!72182) (not b!837296) (not b!837297) tp_is_empty!15259)
(check-sat)
(get-model)

(declare-fun d!107903 () Bool)

(declare-fun res!569408 () Bool)

(declare-fun e!467241 () Bool)

(assert (=> d!107903 (=> res!569408 e!467241)))

(assert (=> d!107903 (= res!569408 (or ((_ is Nil!15883) l!390) ((_ is Nil!15883) (t!22249 l!390))))))

(assert (=> d!107903 (= (isStrictlySorted!440 l!390) e!467241)))

(declare-fun b!837332 () Bool)

(declare-fun e!467242 () Bool)

(assert (=> b!837332 (= e!467241 e!467242)))

(declare-fun res!569409 () Bool)

(assert (=> b!837332 (=> (not res!569409) (not e!467242))))

(assert (=> b!837332 (= res!569409 (bvslt (_1!5080 (h!17019 l!390)) (_1!5080 (h!17019 (t!22249 l!390)))))))

(declare-fun b!837333 () Bool)

(assert (=> b!837333 (= e!467242 (isStrictlySorted!440 (t!22249 l!390)))))

(assert (= (and d!107903 (not res!569408)) b!837332))

(assert (= (and b!837332 res!569409) b!837333))

(declare-fun m!782993 () Bool)

(assert (=> b!837333 m!782993))

(assert (=> start!72182 d!107903))

(declare-fun d!107913 () Bool)

(declare-fun lt!380766 () Int)

(assert (=> d!107913 (>= lt!380766 0)))

(declare-fun e!467252 () Int)

(assert (=> d!107913 (= lt!380766 e!467252)))

(declare-fun c!91329 () Bool)

(assert (=> d!107913 (= c!91329 ((_ is Nil!15883) (t!22249 l!390)))))

(assert (=> d!107913 (= (ListPrimitiveSize!70 (t!22249 l!390)) lt!380766)))

(declare-fun b!837352 () Bool)

(assert (=> b!837352 (= e!467252 0)))

(declare-fun b!837353 () Bool)

(assert (=> b!837353 (= e!467252 (+ 1 (ListPrimitiveSize!70 (t!22249 (t!22249 l!390)))))))

(assert (= (and d!107913 c!91329) b!837352))

(assert (= (and d!107913 (not c!91329)) b!837353))

(declare-fun m!782999 () Bool)

(assert (=> b!837353 m!782999))

(assert (=> b!837296 d!107913))

(declare-fun d!107919 () Bool)

(declare-fun lt!380768 () Int)

(assert (=> d!107919 (>= lt!380768 0)))

(declare-fun e!467256 () Int)

(assert (=> d!107919 (= lt!380768 e!467256)))

(declare-fun c!91331 () Bool)

(assert (=> d!107919 (= c!91331 ((_ is Nil!15883) l!390))))

(assert (=> d!107919 (= (ListPrimitiveSize!70 l!390) lt!380768)))

(declare-fun b!837362 () Bool)

(assert (=> b!837362 (= e!467256 0)))

(declare-fun b!837363 () Bool)

(assert (=> b!837363 (= e!467256 (+ 1 (ListPrimitiveSize!70 (t!22249 l!390))))))

(assert (= (and d!107919 c!91331) b!837362))

(assert (= (and d!107919 (not c!91331)) b!837363))

(assert (=> b!837363 m!782973))

(assert (=> b!837296 d!107919))

(declare-fun b!837372 () Bool)

(declare-fun e!467263 () Bool)

(declare-fun tp!47456 () Bool)

(assert (=> b!837372 (= e!467263 (and tp_is_empty!15259 tp!47456))))

(assert (=> b!837297 (= tp!47441 e!467263)))

(assert (= (and b!837297 ((_ is Cons!15882) (t!22249 l!390))) b!837372))

(check-sat (not b!837372) (not b!837333) tp_is_empty!15259 (not b!837353) (not b!837363))
(check-sat)
