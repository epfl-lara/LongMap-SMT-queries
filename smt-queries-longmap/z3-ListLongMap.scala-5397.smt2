; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71978 () Bool)

(assert start!71978)

(declare-fun res!568897 () Bool)

(declare-fun e!466429 () Bool)

(assert (=> start!71978 (=> (not res!568897) (not e!466429))))

(declare-datatypes ((B!1184 0))(
  ( (B!1185 (val!7674 Int)) )
))
(declare-datatypes ((tuple2!10216 0))(
  ( (tuple2!10217 (_1!5119 (_ BitVec 64)) (_2!5119 B!1184)) )
))
(declare-datatypes ((List!15978 0))(
  ( (Nil!15975) (Cons!15974 (h!17105 tuple2!10216) (t!22340 List!15978)) )
))
(declare-fun l!390 () List!15978)

(declare-fun isStrictlySorted!445 (List!15978) Bool)

(assert (=> start!71978 (= res!568897 (isStrictlySorted!445 l!390))))

(assert (=> start!71978 e!466429))

(declare-fun e!466430 () Bool)

(assert (=> start!71978 e!466430))

(declare-fun b!836084 () Bool)

(declare-fun ListPrimitiveSize!67 (List!15978) Int)

(assert (=> b!836084 (= e!466429 (< (ListPrimitiveSize!67 l!390) 0))))

(declare-fun b!836085 () Bool)

(declare-fun tp_is_empty!15253 () Bool)

(declare-fun tp!47423 () Bool)

(assert (=> b!836085 (= e!466430 (and tp_is_empty!15253 tp!47423))))

(assert (= (and start!71978 res!568897) b!836084))

(get-info :version)

(assert (= (and start!71978 ((_ is Cons!15974) l!390)) b!836085))

(declare-fun m!780905 () Bool)

(assert (=> start!71978 m!780905))

(declare-fun m!780907 () Bool)

(assert (=> b!836084 m!780907))

(check-sat (not start!71978) (not b!836084) (not b!836085) tp_is_empty!15253)
(check-sat)
(get-model)

(declare-fun d!107373 () Bool)

(declare-fun res!568912 () Bool)

(declare-fun e!466453 () Bool)

(assert (=> d!107373 (=> res!568912 e!466453)))

(assert (=> d!107373 (= res!568912 (or ((_ is Nil!15975) l!390) ((_ is Nil!15975) (t!22340 l!390))))))

(assert (=> d!107373 (= (isStrictlySorted!445 l!390) e!466453)))

(declare-fun b!836110 () Bool)

(declare-fun e!466454 () Bool)

(assert (=> b!836110 (= e!466453 e!466454)))

(declare-fun res!568913 () Bool)

(assert (=> b!836110 (=> (not res!568913) (not e!466454))))

(assert (=> b!836110 (= res!568913 (bvslt (_1!5119 (h!17105 l!390)) (_1!5119 (h!17105 (t!22340 l!390)))))))

(declare-fun b!836111 () Bool)

(assert (=> b!836111 (= e!466454 (isStrictlySorted!445 (t!22340 l!390)))))

(assert (= (and d!107373 (not res!568912)) b!836110))

(assert (= (and b!836110 res!568913) b!836111))

(declare-fun m!780917 () Bool)

(assert (=> b!836111 m!780917))

(assert (=> start!71978 d!107373))

(declare-fun d!107379 () Bool)

(declare-fun lt!380158 () Int)

(assert (=> d!107379 (>= lt!380158 0)))

(declare-fun e!466466 () Int)

(assert (=> d!107379 (= lt!380158 e!466466)))

(declare-fun c!90971 () Bool)

(assert (=> d!107379 (= c!90971 ((_ is Nil!15975) l!390))))

(assert (=> d!107379 (= (ListPrimitiveSize!67 l!390) lt!380158)))

(declare-fun b!836128 () Bool)

(assert (=> b!836128 (= e!466466 0)))

(declare-fun b!836129 () Bool)

(assert (=> b!836129 (= e!466466 (+ 1 (ListPrimitiveSize!67 (t!22340 l!390))))))

(assert (= (and d!107379 c!90971) b!836128))

(assert (= (and d!107379 (not c!90971)) b!836129))

(declare-fun m!780923 () Bool)

(assert (=> b!836129 m!780923))

(assert (=> b!836084 d!107379))

(declare-fun b!836138 () Bool)

(declare-fun e!466472 () Bool)

(declare-fun tp!47432 () Bool)

(assert (=> b!836138 (= e!466472 (and tp_is_empty!15253 tp!47432))))

(assert (=> b!836085 (= tp!47423 e!466472)))

(assert (= (and b!836085 ((_ is Cons!15974) (t!22340 l!390))) b!836138))

(check-sat (not b!836129) (not b!836111) (not b!836138) tp_is_empty!15253)
(check-sat)
