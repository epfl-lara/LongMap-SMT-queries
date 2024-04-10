; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6982 () Bool)

(assert start!6982)

(declare-datatypes ((array!2993 0))(
  ( (array!2994 (arr!1440 (Array (_ BitVec 32) (_ BitVec 64))) (size!1658 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2993)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6982 (and (bvslt (size!1658 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1658 a!4412)) (= (size!1658 a!4412) size!30) (= a!4412 (array!2994 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (bvsge i!1489 (size!1658 a!4412)))))

(declare-fun array_inv!852 (array!2993) Bool)

(assert (=> start!6982 (array_inv!852 a!4412)))

(assert (=> start!6982 true))

(declare-fun bs!2094 () Bool)

(assert (= bs!2094 start!6982))

(declare-fun m!39761 () Bool)

(assert (=> bs!2094 m!39761))

(push 1)

(assert (not start!6982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

