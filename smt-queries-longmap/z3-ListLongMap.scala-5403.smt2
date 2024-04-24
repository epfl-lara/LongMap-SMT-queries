; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72294 () Bool)

(assert start!72294)

(declare-datatypes ((List!15907 0))(
  ( (Nil!15904) (Cons!15903 (h!17040 (_ BitVec 64)) (t!22270 List!15907)) )
))
(declare-fun l!632 () List!15907)

(declare-fun ListPrimitiveSize!73 (List!15907) Int)

(assert (=> start!72294 (< (ListPrimitiveSize!73 l!632) 0)))

(assert (=> start!72294 true))

(declare-fun bs!23528 () Bool)

(assert (= bs!23528 start!72294))

(declare-fun m!783187 () Bool)

(assert (=> bs!23528 m!783187))

(check-sat (not start!72294))
(check-sat)
(get-model)

(declare-fun d!108040 () Bool)

(declare-fun lt!380830 () Int)

(assert (=> d!108040 (>= lt!380830 0)))

(declare-fun e!467497 () Int)

(assert (=> d!108040 (= lt!380830 e!467497)))

(declare-fun c!91383 () Bool)

(get-info :version)

(assert (=> d!108040 (= c!91383 ((_ is Nil!15904) l!632))))

(assert (=> d!108040 (= (ListPrimitiveSize!73 l!632) lt!380830)))

(declare-fun b!837687 () Bool)

(assert (=> b!837687 (= e!467497 0)))

(declare-fun b!837688 () Bool)

(assert (=> b!837688 (= e!467497 (+ 1 (ListPrimitiveSize!73 (t!22270 l!632))))))

(assert (= (and d!108040 c!91383) b!837687))

(assert (= (and d!108040 (not c!91383)) b!837688))

(declare-fun m!783193 () Bool)

(assert (=> b!837688 m!783193))

(assert (=> start!72294 d!108040))

(check-sat (not b!837688))
(check-sat)
