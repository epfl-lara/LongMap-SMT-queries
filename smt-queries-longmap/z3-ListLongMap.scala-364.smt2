; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6988 () Bool)

(assert start!6988)

(declare-datatypes ((array!2979 0))(
  ( (array!2980 (arr!1433 (Array (_ BitVec 32) (_ BitVec 64))) (size!1651 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!2979)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6988 (and (bvslt (size!1651 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1651 a!4412)) (= (size!1651 a!4412) size!30) (= a!4412 (array!2980 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1433 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1489) (size!1651 a!4412)) (bvsge (bvsub size!30 (bvadd #b00000000000000000000000000000001 i!1489)) (bvsub size!30 i!1489)))))

(declare-fun array_inv!856 (array!2979) Bool)

(assert (=> start!6988 (array_inv!856 a!4412)))

(assert (=> start!6988 true))

(declare-fun bs!2104 () Bool)

(assert (= bs!2104 start!6988))

(declare-fun m!39683 () Bool)

(assert (=> bs!2104 m!39683))

(declare-fun m!39685 () Bool)

(assert (=> bs!2104 m!39685))

(check-sat (not start!6988))
(check-sat)
