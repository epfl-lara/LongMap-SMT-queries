; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72184 () Bool)

(assert start!72184)

(declare-fun lt!380278 () Int)

(declare-datatypes ((List!16017 0))(
  ( (Nil!16014) (Cons!16013 (h!17144 (_ BitVec 64)) (t!22379 List!16017)) )
))
(declare-fun l!404 () List!16017)

(declare-fun length!38 (List!16017) Int)

(assert (=> start!72184 (= lt!380278 (length!38 l!404))))

(assert (=> start!72184 false))

(assert (=> start!72184 true))

(declare-fun bs!23512 () Bool)

(assert (= bs!23512 start!72184))

(declare-fun m!781253 () Bool)

(assert (=> bs!23512 m!781253))

(check-sat (not start!72184))
(check-sat)
