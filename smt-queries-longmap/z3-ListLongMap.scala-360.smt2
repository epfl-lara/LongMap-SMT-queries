; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6974 () Bool)

(assert start!6974)

(declare-datatypes ((array!2967 0))(
  ( (array!2968 (arr!1427 (Array (_ BitVec 32) (_ BitVec 64))) (size!1645 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2967)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6974 (and (bvslt (size!1645 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1645 a!4412)) (= (size!1645 a!4412) size!30) (bvslt size!30 #b00000000000000000000000000000000))))

(declare-fun array_inv!830 (array!2967) Bool)

(assert (=> start!6974 (array_inv!830 a!4412)))

(assert (=> start!6974 true))

(declare-fun bs!2082 () Bool)

(assert (= bs!2082 start!6974))

(declare-fun m!39625 () Bool)

(assert (=> bs!2082 m!39625))

(check-sat (not start!6974))
(check-sat)
