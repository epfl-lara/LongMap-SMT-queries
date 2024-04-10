; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6978 () Bool)

(assert start!6978)

(declare-datatypes ((array!2989 0))(
  ( (array!2990 (arr!1438 (Array (_ BitVec 32) (_ BitVec 64))) (size!1656 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2989)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6978 (and (bvslt (size!1656 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1656 a!4412)) (= (size!1656 a!4412) size!30) (= a!4412 (array!2990 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (bvslt (bvsub size!30 i!1489) #b00000000000000000000000000000000))))

(declare-fun array_inv!850 (array!2989) Bool)

(assert (=> start!6978 (array_inv!850 a!4412)))

(assert (=> start!6978 true))

(declare-fun bs!2089 () Bool)

(assert (= bs!2089 start!6978))

(declare-fun m!39757 () Bool)

(assert (=> bs!2089 m!39757))

(check-sat (not start!6978))
(check-sat)
