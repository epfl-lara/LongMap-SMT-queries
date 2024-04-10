; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6976 () Bool)

(assert start!6976)

(declare-datatypes ((array!2987 0))(
  ( (array!2988 (arr!1437 (Array (_ BitVec 32) (_ BitVec 64))) (size!1655 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2987)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6976 (and (bvslt (size!1655 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1655 a!4412)) (= (size!1655 a!4412) size!30) (= a!4412 (array!2988 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (bvslt (bvsub size!30 i!1489) #b00000000000000000000000000000000))))

(declare-fun array_inv!849 (array!2987) Bool)

(assert (=> start!6976 (array_inv!849 a!4412)))

(assert (=> start!6976 true))

(declare-fun bs!2088 () Bool)

(assert (= bs!2088 start!6976))

(declare-fun m!39755 () Bool)

(assert (=> bs!2088 m!39755))

(push 1)

(assert (not start!6976))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)
