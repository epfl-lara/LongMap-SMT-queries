; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72128 () Bool)

(assert start!72128)

(declare-datatypes ((List!16004 0))(
  ( (Nil!16001) (Cons!16000 (h!17131 (_ BitVec 64)) (t!22375 List!16004)) )
))
(declare-fun l!632 () List!16004)

(declare-fun ListPrimitiveSize!74 (List!16004) Int)

(assert (=> start!72128 (< (ListPrimitiveSize!74 l!632) 0)))

(assert (=> start!72128 true))

(declare-fun bs!23517 () Bool)

(assert (= bs!23517 start!72128))

(declare-fun m!781899 () Bool)

(assert (=> bs!23517 m!781899))

(check-sat (not start!72128))
(check-sat)
(get-model)

(declare-fun d!107717 () Bool)

(declare-fun lt!380469 () Int)

(assert (=> d!107717 (>= lt!380469 0)))

(declare-fun e!466916 () Int)

