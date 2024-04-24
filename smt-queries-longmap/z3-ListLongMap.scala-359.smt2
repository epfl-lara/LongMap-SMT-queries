; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6968 () Bool)

(assert start!6968)

(declare-datatypes ((array!2961 0))(
  ( (array!2962 (arr!1424 (Array (_ BitVec 32) (_ BitVec 64))) (size!1642 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2961)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6968 (and (bvslt (size!1642 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1642 a!4412)) (= (size!1642 a!4412) size!30) (= a!4412 (array!2962 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (not (= (select (arr!1424 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun array_inv!827 (array!2961) Bool)

(assert (=> start!6968 (array_inv!827 a!4412)))

(assert (=> start!6968 true))

(declare-fun bs!2076 () Bool)

(assert (= bs!2076 start!6968))

(declare-fun m!39613 () Bool)

(assert (=> bs!2076 m!39613))

(declare-fun m!39615 () Bool)

(assert (=> bs!2076 m!39615))

(check-sat (not start!6968))
(check-sat)
