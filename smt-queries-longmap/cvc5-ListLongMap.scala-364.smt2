; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6994 () Bool)

(assert start!6994)

(declare-datatypes ((array!3005 0))(
  ( (array!3006 (arr!1446 (Array (_ BitVec 32) (_ BitVec 64))) (size!1664 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!3005)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6994 (and (bvslt (size!1664 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1664 a!4412)) (= (size!1664 a!4412) size!30) (= a!4412 (array!3006 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1446 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1664 a!4412)) (bvsge (bvsub size!30 (bvadd #b00000000000000000000000000000001 i!1489)) (bvsub size!30 i!1489)))))

(declare-fun array_inv!858 (array!3005) Bool)

(assert (=> start!6994 (array_inv!858 a!4412)))

(assert (=> start!6994 true))

(declare-fun bs!2106 () Bool)

(assert (= bs!2106 start!6994))

(declare-fun m!39779 () Bool)

(assert (=> bs!2106 m!39779))

(declare-fun m!39781 () Bool)

(assert (=> bs!2106 m!39781))

(push 1)

(assert (not start!6994))

(check-sat)

(pop 1)

(push 1)

(check-sat)

