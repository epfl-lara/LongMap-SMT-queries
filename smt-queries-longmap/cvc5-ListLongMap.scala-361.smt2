; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6974 () Bool)

(assert start!6974)

(declare-datatypes ((array!2965 0))(
  ( (array!2966 (arr!1426 (Array (_ BitVec 32) (_ BitVec 64))) (size!1644 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2965)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6974 (and (bvslt (size!1644 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1644 a!4412)) (= (size!1644 a!4412) size!30) (= a!4412 (array!2966 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (bvslt (bvsub size!30 i!1489) #b00000000000000000000000000000000))))

(declare-fun array_inv!849 (array!2965) Bool)

(assert (=> start!6974 (array_inv!849 a!4412)))

(assert (=> start!6974 true))

(declare-fun bs!2088 () Bool)

(assert (= bs!2088 start!6974))

(declare-fun m!39663 () Bool)

(assert (=> bs!2088 m!39663))

(push 1)

(assert (not start!6974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

