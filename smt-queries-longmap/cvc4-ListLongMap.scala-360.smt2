; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6974 () Bool)

(assert start!6974)

(declare-datatypes ((array!2985 0))(
  ( (array!2986 (arr!1436 (Array (_ BitVec 32) (_ BitVec 64))) (size!1654 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2985)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6974 (and (bvslt (size!1654 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1654 a!4412)) (= (size!1654 a!4412) size!30) (bvslt size!30 #b00000000000000000000000000000000))))

(declare-fun array_inv!848 (array!2985) Bool)

(assert (=> start!6974 (array_inv!848 a!4412)))

(assert (=> start!6974 true))

(declare-fun bs!2084 () Bool)

(assert (= bs!2084 start!6974))

(declare-fun m!39753 () Bool)

(assert (=> bs!2084 m!39753))

(push 1)

(assert (not start!6974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

