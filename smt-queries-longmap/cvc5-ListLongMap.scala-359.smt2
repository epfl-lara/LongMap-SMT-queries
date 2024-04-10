; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6964 () Bool)

(assert start!6964)

(declare-datatypes ((array!2975 0))(
  ( (array!2976 (arr!1431 (Array (_ BitVec 32) (_ BitVec 64))) (size!1649 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2975)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6964 (and (bvslt (size!1649 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1649 a!4412)) (= (size!1649 a!4412) size!30) (= a!4412 (array!2976 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (not (= (select (arr!1431 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun array_inv!843 (array!2975) Bool)

(assert (=> start!6964 (array_inv!843 a!4412)))

(assert (=> start!6964 true))

(declare-fun bs!2076 () Bool)

(assert (= bs!2076 start!6964))

(declare-fun m!39737 () Bool)

(assert (=> bs!2076 m!39737))

(declare-fun m!39739 () Bool)

(assert (=> bs!2076 m!39739))

(push 1)

(assert (not start!6964))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)
