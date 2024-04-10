; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72202 () Bool)

(assert start!72202)

(declare-fun lt!380514 () Int)

(declare-datatypes ((List!16018 0))(
  ( (Nil!16015) (Cons!16014 (h!17145 (_ BitVec 64)) (t!22389 List!16018)) )
))
(declare-fun l!404 () List!16018)

(declare-fun length!38 (List!16018) Int)

(assert (=> start!72202 (= lt!380514 (length!38 l!404))))

(assert (=> start!72202 false))

(assert (=> start!72202 true))

(declare-fun bs!23545 () Bool)

(assert (= bs!23545 start!72202))

(declare-fun m!782007 () Bool)

(assert (=> bs!23545 m!782007))

(push 1)

(assert (not start!72202))

(check-sat)

(pop 1)

