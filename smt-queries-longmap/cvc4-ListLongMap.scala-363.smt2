; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6984 () Bool)

(assert start!6984)

(declare-datatypes ((array!2975 0))(
  ( (array!2976 (arr!1431 (Array (_ BitVec 32) (_ BitVec 64))) (size!1649 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2975)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6984 (and (bvslt (size!1649 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1649 a!4412)) (= (size!1649 a!4412) size!30) (= a!4412 (array!2976 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1431 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1489) (size!1649 a!4412))))))

(declare-fun array_inv!854 (array!2975) Bool)

(assert (=> start!6984 (array_inv!854 a!4412)))

(assert (=> start!6984 true))

(declare-fun bs!2099 () Bool)

(assert (= bs!2099 start!6984))

(declare-fun m!39675 () Bool)

(assert (=> bs!2099 m!39675))

(declare-fun m!39677 () Bool)

(assert (=> bs!2099 m!39677))

(push 1)

(assert (not start!6984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

