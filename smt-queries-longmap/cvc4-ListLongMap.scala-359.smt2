; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6968 () Bool)

(assert start!6968)

(declare-datatypes ((array!2979 0))(
  ( (array!2980 (arr!1433 (Array (_ BitVec 32) (_ BitVec 64))) (size!1651 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2979)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6968 (and (bvslt (size!1651 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1651 a!4412)) (= (size!1651 a!4412) size!30) (= a!4412 (array!2980 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (not (= (select (arr!1433 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun array_inv!845 (array!2979) Bool)

(assert (=> start!6968 (array_inv!845 a!4412)))

(assert (=> start!6968 true))

(declare-fun bs!2078 () Bool)

(assert (= bs!2078 start!6968))

(declare-fun m!39745 () Bool)

(assert (=> bs!2078 m!39745))

(declare-fun m!39747 () Bool)

(assert (=> bs!2078 m!39747))

(push 1)

(assert (not start!6968))

(check-sat)

(pop 1)

(push 1)

(check-sat)
