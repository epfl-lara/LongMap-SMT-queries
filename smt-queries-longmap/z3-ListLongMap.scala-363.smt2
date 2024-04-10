; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6990 () Bool)

(assert start!6990)

(declare-datatypes ((array!3001 0))(
  ( (array!3002 (arr!1444 (Array (_ BitVec 32) (_ BitVec 64))) (size!1662 (_ BitVec 32))) )
))
(declare-fun a!4412 () array!3001)

(declare-fun i!1489 () (_ BitVec 32))

(declare-fun size!30 () (_ BitVec 32))

(assert (=> start!6990 (and (bvslt (size!1662 a!4412) #b01111111111111111111111111111111) (bvsge i!1489 #b00000000000000000000000000000000) (bvsle i!1489 (size!1662 a!4412)) (= (size!1662 a!4412) size!30) (= a!4412 (array!3002 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!30)) (not (= i!1489 size!30)) (= (select (arr!1444 a!4412) i!1489) #b0000000000000000000000000000000000000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 i!1489) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 i!1489) (size!1662 a!4412))))))

(declare-fun array_inv!856 (array!3001) Bool)

(assert (=> start!6990 (array_inv!856 a!4412)))

(assert (=> start!6990 true))

(declare-fun bs!2101 () Bool)

(assert (= bs!2101 start!6990))

(declare-fun m!39771 () Bool)

(assert (=> bs!2101 m!39771))

(declare-fun m!39773 () Bool)

(assert (=> bs!2101 m!39773))

(check-sat (not start!6990))
(check-sat)
