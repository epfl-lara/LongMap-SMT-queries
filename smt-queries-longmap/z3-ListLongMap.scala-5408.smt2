; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72370 () Bool)

(assert start!72370)

(declare-fun lt!380875 () Int)

(declare-datatypes ((List!15922 0))(
  ( (Nil!15919) (Cons!15918 (h!17055 (_ BitVec 64)) (t!22285 List!15922)) )
))
(declare-fun l!404 () List!15922)

(declare-fun length!38 (List!15922) Int)

(assert (=> start!72370 (= lt!380875 (length!38 l!404))))

(assert (=> start!72370 false))

(assert (=> start!72370 true))

(declare-fun bs!23558 () Bool)

(assert (= bs!23558 start!72370))

(declare-fun m!783299 () Bool)

(assert (=> bs!23558 m!783299))

(check-sat (not start!72370))
(check-sat)
