; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6988 () Bool)

(assert start!6988)

(declare-datatypes ((array!2999 0))(
  ( (array!3000 (arr!1443 (Array (_ BitVec 32) (_ BitVec 64))) (size!1661 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2999)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6988 (and (bvslt (size!1661 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1661 a!4412)) (= (size!1661 a!4412) size!30) (= a!4412 (array!3000 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1443 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1489) (size!1661 a!4412))))))

(declare-fun array_inv!855 (array!2999) Bool)

(assert (=> start!6988 (array_inv!855 a!4412)))

(assert (=> start!6988 true))

(declare-fun bs!2100 () Bool)

(assert (= bs!2100 start!6988))

(declare-fun m!39767 () Bool)

(assert (=> bs!2100 m!39767))

(declare-fun m!39769 () Bool)

(assert (=> bs!2100 m!39769))

(push 1)

(assert (not start!6988))

(check-sat)

(pop 1)

(push 1)

(check-sat)
