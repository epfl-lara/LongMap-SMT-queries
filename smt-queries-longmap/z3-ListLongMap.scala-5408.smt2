; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72204 () Bool)

(assert start!72204)

(declare-fun lt!380517 () Int)

(declare-datatypes ((List!16019 0))(
  ( (Nil!16016) (Cons!16015 (h!17146 (_ BitVec 64)) (t!22390 List!16019)) )
))
(declare-fun l!404 () List!16019)

(declare-fun length!39 (List!16019) Int)

(assert (=> start!72204 (= lt!380517 (length!39 l!404))))

(assert (=> start!72204 false))

(assert (=> start!72204 true))

(declare-fun bs!23546 () Bool)

(assert (= bs!23546 start!72204))

(declare-fun m!782009 () Bool)

(assert (=> bs!23546 m!782009))

(check-sat (not start!72204))
(check-sat)
