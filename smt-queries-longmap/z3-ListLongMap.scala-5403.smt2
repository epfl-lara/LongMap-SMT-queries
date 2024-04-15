; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72108 () Bool)

(assert start!72108)

(declare-datatypes ((List!16002 0))(
  ( (Nil!15999) (Cons!15998 (h!17129 (_ BitVec 64)) (t!22364 List!16002)) )
))
(declare-fun l!632 () List!16002)

(declare-fun ListPrimitiveSize!73 (List!16002) Int)

(assert (=> start!72108 (< (ListPrimitiveSize!73 l!632) 0)))

(assert (=> start!72108 true))

(declare-fun bs!23482 () Bool)

(assert (= bs!23482 start!72108))

(declare-fun m!781141 () Bool)

(assert (=> bs!23482 m!781141))

(check-sat (not start!72108))
(check-sat)
(get-model)

(declare-fun d!107517 () Bool)

(declare-fun lt!380232 () Int)

(assert (=> d!107517 (>= lt!380232 0)))

(declare-fun e!466767 () Int)

(assert (=> d!107517 (= lt!380232 e!466767)))

(declare-fun c!91036 () Bool)

(get-info :version)

(assert (=> d!107517 (= c!91036 ((_ is Nil!15999) l!632))))

(assert (=> d!107517 (= (ListPrimitiveSize!73 l!632) lt!380232)))

(declare-fun b!836545 () Bool)

(assert (=> b!836545 (= e!466767 0)))

(declare-fun b!836546 () Bool)

(assert (=> b!836546 (= e!466767 (+ 1 (ListPrimitiveSize!73 (t!22364 l!632))))))

(assert (= (and d!107517 c!91036) b!836545))

(assert (= (and d!107517 (not c!91036)) b!836546))

(declare-fun m!781147 () Bool)

(assert (=> b!836546 m!781147))

(assert (=> start!72108 d!107517))

(check-sat (not b!836546))
(check-sat)
