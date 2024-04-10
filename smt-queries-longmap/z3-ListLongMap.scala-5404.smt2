; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72140 () Bool)

(assert start!72140)

(declare-fun res!569211 () Bool)

(declare-fun e!466923 () Bool)

(assert (=> start!72140 (=> (not res!569211) (not e!466923))))

(declare-datatypes ((List!16007 0))(
  ( (Nil!16004) (Cons!16003 (h!17134 (_ BitVec 64)) (t!22378 List!16007)) )
))
(declare-fun l!632 () List!16007)

(get-info :version)

(assert (=> start!72140 (= res!569211 (and (not ((_ is Nil!16004) l!632)) (not ((_ is Nil!16004) (t!22378 l!632))) (bvslt (h!17134 l!632) (h!17134 (t!22378 l!632)))))))

(assert (=> start!72140 e!466923))

(assert (=> start!72140 true))

(declare-fun b!836795 () Bool)

(declare-fun ListPrimitiveSize!77 (List!16007) Int)

(assert (=> b!836795 (= e!466923 (>= (ListPrimitiveSize!77 (t!22378 l!632)) (ListPrimitiveSize!77 l!632)))))

(assert (= (and start!72140 res!569211) b!836795))

(declare-fun m!781913 () Bool)

(assert (=> b!836795 m!781913))

(declare-fun m!781915 () Bool)

(assert (=> b!836795 m!781915))

(check-sat (not b!836795))
(check-sat)
(get-model)

(declare-fun d!107723 () Bool)

(declare-fun lt!380473 () Int)

(assert (=> d!107723 (>= lt!380473 0)))

(declare-fun e!466929 () Int)

(assert (=> d!107723 (= lt!380473 e!466929)))

(declare-fun c!91106 () Bool)

(assert (=> d!107723 (= c!91106 ((_ is Nil!16004) (t!22378 l!632)))))

(assert (=> d!107723 (= (ListPrimitiveSize!77 (t!22378 l!632)) lt!380473)))

(declare-fun b!836803 () Bool)

(assert (=> b!836803 (= e!466929 0)))

(declare-fun b!836804 () Bool)

(assert (=> b!836804 (= e!466929 (+ 1 (ListPrimitiveSize!77 (t!22378 (t!22378 l!632)))))))

(assert (= (and d!107723 c!91106) b!836803))

(assert (= (and d!107723 (not c!91106)) b!836804))

(declare-fun m!781921 () Bool)

(assert (=> b!836804 m!781921))

(assert (=> b!836795 d!107723))

(declare-fun d!107725 () Bool)

(declare-fun lt!380474 () Int)

(assert (=> d!107725 (>= lt!380474 0)))

(declare-fun e!466930 () Int)

(assert (=> d!107725 (= lt!380474 e!466930)))

(declare-fun c!91107 () Bool)

(assert (=> d!107725 (= c!91107 ((_ is Nil!16004) l!632))))

(assert (=> d!107725 (= (ListPrimitiveSize!77 l!632) lt!380474)))

(declare-fun b!836805 () Bool)

(assert (=> b!836805 (= e!466930 0)))

(declare-fun b!836806 () Bool)

(assert (=> b!836806 (= e!466930 (+ 1 (ListPrimitiveSize!77 (t!22378 l!632))))))

(assert (= (and d!107725 c!91107) b!836805))

(assert (= (and d!107725 (not c!91107)) b!836806))

(assert (=> b!836806 m!781913))

(assert (=> b!836795 d!107725))

(check-sat (not b!836804) (not b!836806))
(check-sat)
