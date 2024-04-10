; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6992 () Bool)

(assert start!6992)

(declare-datatypes ((array!3003 0))(
  ( (array!3004 (arr!1445 (Array (_ BitVec 32) (_ BitVec 64))) (size!1663 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!3003)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6992 (and (bvslt (size!1663 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1663 a!4412)) (= (size!1663 a!4412) size!30) (= a!4412 (array!3004 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1445 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1489) (size!1663 a!4412))))))

(declare-fun array_inv!857 (array!3003) Bool)

(assert (=> start!6992 (array_inv!857 a!4412)))

(assert (=> start!6992 true))

(declare-fun bs!2102 () Bool)

(assert (= bs!2102 start!6992))

(declare-fun m!39775 () Bool)

(assert (=> bs!2102 m!39775))

(declare-fun m!39777 () Bool)

(assert (=> bs!2102 m!39777))

(push 1)

(assert (not start!6992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

