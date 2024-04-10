; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92132 () Bool)

(assert start!92132)

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65984 0))(
  ( (array!65985 (arr!31736 (Array (_ BitVec 32) (_ BitVec 64))) (size!32272 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65984)

(assert (=> start!92132 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32272 a!3488)) (bvslt (size!32272 a!3488) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!32272 a!3488)))))

(assert (=> start!92132 true))

(declare-fun array_inv!24516 (array!65984) Bool)

(assert (=> start!92132 (array_inv!24516 a!3488)))

(declare-fun bs!30644 () Bool)

(assert (= bs!30644 start!92132))

(declare-fun m!969053 () Bool)

(assert (=> bs!30644 m!969053))

(check-sat (not start!92132))
(check-sat)
