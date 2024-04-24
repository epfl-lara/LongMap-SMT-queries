; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6998 () Bool)

(assert start!6998)

(declare-datatypes ((array!2991 0))(
  ( (array!2992 (arr!1439 (Array (_ BitVec 32) (_ BitVec 64))) (size!1657 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2991)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6998 (and (bvslt (size!1657 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1657 a!4412)) (= (size!1657 a!4412) size!30) (= a!4412 (array!2992 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1439 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1657 a!4412)) (bvsge (bvsub size!30 (bvadd #b00000000000000000000000000000001 i!1489)) (bvsub size!30 i!1489)))))

(declare-fun array_inv!842 (array!2991) Bool)

(assert (=> start!6998 (array_inv!842 a!4412)))

(assert (=> start!6998 true))

(declare-fun bs!2106 () Bool)

(assert (= bs!2106 start!6998))

(declare-fun m!39655 () Bool)

(assert (=> bs!2106 m!39655))

(declare-fun m!39657 () Bool)

(assert (=> bs!2106 m!39657))

(check-sat (not start!6998))
(check-sat)
