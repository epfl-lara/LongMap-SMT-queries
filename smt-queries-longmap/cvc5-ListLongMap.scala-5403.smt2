; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72126 () Bool)

(assert start!72126)

(declare-datatypes ((List!16003 0))(
  ( (Nil!16000) (Cons!15999 (h!17130 (_ BitVec 64)) (t!22374 List!16003)) )
))
(declare-fun l!632 () List!16003)

(declare-fun ListPrimitiveSize!73 (List!16003) Int)

(assert (=> start!72126 (< (ListPrimitiveSize!73 l!632) 0)))

(assert (=> start!72126 true))

(declare-fun bs!23516 () Bool)

(assert (= bs!23516 start!72126))

(declare-fun m!781897 () Bool)

(assert (=> bs!23516 m!781897))

(push 1)

(assert (not start!72126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107715 () Bool)

(declare-fun lt!380464 () Int)

(assert (=> d!107715 (>= lt!380464 0)))

(declare-fun e!466911 () Int)

(assert (=> d!107715 (= lt!380464 e!466911)))

(declare-fun c!91097 () Bool)

(assert (=> d!107715 (= c!91097 (is-Nil!16000 l!632))))

(assert (=> d!107715 (= (ListPrimitiveSize!73 l!632) lt!380464)))

(declare-fun b!836776 () Bool)

(assert (=> b!836776 (= e!466911 0)))

(declare-fun b!836777 () Bool)

(assert (=> b!836777 (= e!466911 (+ 1 (ListPrimitiveSize!73 (t!22374 l!632))))))

(assert (= (and d!107715 c!91097) b!836776))

(assert (= (and d!107715 (not c!91097)) b!836777))

(declare-fun m!781903 () Bool)

(assert (=> b!836777 m!781903))

(assert (=> start!72126 d!107715))

(push 1)

(assert (not b!836777))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

