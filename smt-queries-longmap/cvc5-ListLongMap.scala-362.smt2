; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6980 () Bool)

(assert start!6980)

(declare-datatypes ((array!2971 0))(
  ( (array!2972 (arr!1429 (Array (_ BitVec 32) (_ BitVec 64))) (size!1647 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2971)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6980 (and (bvslt (size!1647 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1647 a!4412)) (= (size!1647 a!4412) size!30) (= a!4412 (array!2972 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (bvsge i!1489 (size!1647 a!4412)))))

(declare-fun array_inv!852 (array!2971) Bool)

(assert (=> start!6980 (array_inv!852 a!4412)))

(assert (=> start!6980 true))

(declare-fun bs!2094 () Bool)

(assert (= bs!2094 start!6980))

(declare-fun m!39669 () Bool)

(assert (=> bs!2094 m!39669))

(push 1)

(assert (not start!6980))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

