; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6966 () Bool)

(assert start!6966)

(declare-datatypes ((array!2977 0))(
  ( (array!2978 (arr!1432 (Array (_ BitVec 32) (_ BitVec 64))) (size!1650 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2977)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6966 (and (bvslt (size!1650 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1650 a!4412)) (= (size!1650 a!4412) size!30) (= a!4412 (array!2978 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (not (= (select (arr!1432 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun array_inv!844 (array!2977) Bool)

(assert (=> start!6966 (array_inv!844 a!4412)))

(assert (=> start!6966 true))

(declare-fun bs!2077 () Bool)

(assert (= bs!2077 start!6966))

(declare-fun m!39741 () Bool)

(assert (=> bs!2077 m!39741))

(declare-fun m!39743 () Bool)

(assert (=> bs!2077 m!39743))

(check-sat (not start!6966))
(check-sat)
