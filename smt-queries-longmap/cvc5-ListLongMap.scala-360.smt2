; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6970 () Bool)

(assert start!6970)

(declare-datatypes ((array!2981 0))(
  ( (array!2982 (arr!1434 (Array (_ BitVec 32) (_ BitVec 64))) (size!1652 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2981)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6970 (and (bvslt (size!1652 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1652 a!4412)) (= (size!1652 a!4412) size!30) (bvslt size!30 #b00000000000000000000000000000000))))

(declare-fun array_inv!846 (array!2981) Bool)

(assert (=> start!6970 (array_inv!846 a!4412)))

(assert (=> start!6970 true))

(declare-fun bs!2082 () Bool)

(assert (= bs!2082 start!6970))

(declare-fun m!39749 () Bool)

(assert (=> bs!2082 m!39749))

(push 1)

(assert (not start!6970))

(check-sat)

(pop 1)

(push 1)

(check-sat)

