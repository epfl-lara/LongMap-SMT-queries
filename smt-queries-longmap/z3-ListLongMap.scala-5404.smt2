; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72306 () Bool)

(assert start!72306)

(declare-fun res!569552 () Bool)

(declare-fun e!467502 () Bool)

(assert (=> start!72306 (=> (not res!569552) (not e!467502))))

(declare-datatypes ((List!15910 0))(
  ( (Nil!15907) (Cons!15906 (h!17043 (_ BitVec 64)) (t!22273 List!15910)) )
))
(declare-fun l!632 () List!15910)

(get-info :version)

(assert (=> start!72306 (= res!569552 (and (not ((_ is Nil!15907) l!632)) (not ((_ is Nil!15907) (t!22273 l!632))) (bvslt (h!17043 l!632) (h!17043 (t!22273 l!632)))))))

(assert (=> start!72306 e!467502))

(assert (=> start!72306 true))

(declare-fun b!837695 () Bool)

(declare-fun ListPrimitiveSize!76 (List!15910) Int)

(assert (=> b!837695 (= e!467502 (>= (ListPrimitiveSize!76 (t!22273 l!632)) (ListPrimitiveSize!76 l!632)))))

(assert (= (and start!72306 res!569552) b!837695))

(declare-fun m!783199 () Bool)

(assert (=> b!837695 m!783199))

(declare-fun m!783201 () Bool)

(assert (=> b!837695 m!783201))

(check-sat (not b!837695))
(check-sat)
(get-model)

(declare-fun d!108045 () Bool)

(declare-fun lt!380834 () Int)

(assert (=> d!108045 (>= lt!380834 0)))

(declare-fun e!467511 () Int)

(assert (=> d!108045 (= lt!380834 e!467511)))

(declare-fun c!91388 () Bool)

(assert (=> d!108045 (= c!91388 ((_ is Nil!15907) (t!22273 l!632)))))

(assert (=> d!108045 (= (ListPrimitiveSize!76 (t!22273 l!632)) lt!380834)))

(declare-fun b!837706 () Bool)

(assert (=> b!837706 (= e!467511 0)))

(declare-fun b!837707 () Bool)

(assert (=> b!837707 (= e!467511 (+ 1 (ListPrimitiveSize!76 (t!22273 (t!22273 l!632)))))))

(assert (= (and d!108045 c!91388) b!837706))

(assert (= (and d!108045 (not c!91388)) b!837707))

(declare-fun m!783211 () Bool)

(assert (=> b!837707 m!783211))

(assert (=> b!837695 d!108045))

(declare-fun d!108049 () Bool)

(declare-fun lt!380835 () Int)

(assert (=> d!108049 (>= lt!380835 0)))

(declare-fun e!467512 () Int)

(assert (=> d!108049 (= lt!380835 e!467512)))

(declare-fun c!91389 () Bool)

(assert (=> d!108049 (= c!91389 ((_ is Nil!15907) l!632))))

(assert (=> d!108049 (= (ListPrimitiveSize!76 l!632) lt!380835)))

(declare-fun b!837708 () Bool)

(assert (=> b!837708 (= e!467512 0)))

(declare-fun b!837709 () Bool)

(assert (=> b!837709 (= e!467512 (+ 1 (ListPrimitiveSize!76 (t!22273 l!632))))))

(assert (= (and d!108049 c!91389) b!837708))

(assert (= (and d!108049 (not c!91389)) b!837709))

(assert (=> b!837709 m!783199))

(assert (=> b!837695 d!108049))

(check-sat (not b!837709) (not b!837707))
(check-sat)
