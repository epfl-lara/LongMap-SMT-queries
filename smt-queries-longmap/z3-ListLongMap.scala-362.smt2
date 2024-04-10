; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6984 () Bool)

(assert start!6984)

(declare-datatypes ((array!2995 0))(
  ( (array!2996 (arr!1441 (Array (_ BitVec 32) (_ BitVec 64))) (size!1659 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2995)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6984 (and (bvslt (size!1659 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1659 a!4412)) (= (size!1659 a!4412) size!30) (= a!4412 (array!2996 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (bvsge i!1489 (size!1659 a!4412)))))

(declare-fun array_inv!853 (array!2995) Bool)

(assert (=> start!6984 (array_inv!853 a!4412)))

(assert (=> start!6984 true))

(declare-fun bs!2095 () Bool)

(assert (= bs!2095 start!6984))

(declare-fun m!39763 () Bool)

(assert (=> bs!2095 m!39763))

(check-sat (not start!6984))
(check-sat)
