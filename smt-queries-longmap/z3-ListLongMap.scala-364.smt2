; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6996 () Bool)

(assert start!6996)

(declare-datatypes ((array!3007 0))(
  ( (array!3008 (arr!1447 (Array (_ BitVec 32) (_ BitVec 64))) (size!1665 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!3007)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6996 (and (bvslt (size!1665 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1665 a!4412)) (= (size!1665 a!4412) size!30) (= a!4412 (array!3008 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1447 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1665 a!4412)) (bvsge (bvsub size!30 (bvadd #b00000000000000000000000000000001 i!1489)) (bvsub size!30 i!1489)))))

(declare-fun array_inv!859 (array!3007) Bool)

(assert (=> start!6996 (array_inv!859 a!4412)))

(assert (=> start!6996 true))

(declare-fun bs!2107 () Bool)

(assert (= bs!2107 start!6996))

(declare-fun m!39783 () Bool)

(assert (=> bs!2107 m!39783))

(declare-fun m!39785 () Bool)

(assert (=> bs!2107 m!39785))

(check-sat (not start!6996))
(check-sat)
