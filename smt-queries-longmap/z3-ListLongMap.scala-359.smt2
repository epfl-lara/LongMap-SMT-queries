; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6958 () Bool)

(assert start!6958)

(declare-datatypes ((array!2949 0))(
  ( (array!2950 (arr!1418 (Array (_ BitVec 32) (_ BitVec 64))) (size!1636 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2949)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6958 (and (bvslt (size!1636 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1636 a!4412)) (= (size!1636 a!4412) size!30) (= a!4412 (array!2950 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (not (= (select (arr!1418 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun array_inv!841 (array!2949) Bool)

(assert (=> start!6958 (array_inv!841 a!4412)))

(assert (=> start!6958 true))

(declare-fun bs!2074 () Bool)

(assert (= bs!2074 start!6958))

(declare-fun m!39641 () Bool)

(assert (=> bs!2074 m!39641))

(declare-fun m!39643 () Bool)

(assert (=> bs!2074 m!39643))

(check-sat (not start!6958))
(check-sat)
