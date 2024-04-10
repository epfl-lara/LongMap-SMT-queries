; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72206 () Bool)

(assert start!72206)

(declare-fun lt!380520 () Int)

(declare-datatypes ((List!16020 0))(
  ( (Nil!16017) (Cons!16016 (h!17147 (_ BitVec 64)) (t!22391 List!16020)) )
))
(declare-fun l!404 () List!16020)

(declare-fun length!40 (List!16020) Int)

(assert (=> start!72206 (= lt!380520 (length!40 l!404))))

(assert (=> start!72206 false))

(assert (=> start!72206 true))

(declare-fun bs!23547 () Bool)

(assert (= bs!23547 start!72206))

(declare-fun m!782011 () Bool)

(assert (=> bs!23547 m!782011))

(push 1)

(assert (not start!72206))

