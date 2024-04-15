; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92128 () Bool)

(assert start!92128)

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!65921 0))(
  ( (array!65922 (arr!31704 (Array (_ BitVec 32) (_ BitVec 64))) (size!32242 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!65921)

(assert (=> start!92128 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32242 a!3488)) (bvslt (size!32242 a!3488) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!32242 a!3488)))))

(assert (=> start!92128 true))

(declare-fun array_inv!24487 (array!65921) Bool)

(assert (=> start!92128 (array_inv!24487 a!3488)))

(declare-fun bs!30614 () Bool)

(assert (= bs!30614 start!92128))

(declare-fun m!968431 () Bool)

(assert (=> bs!30614 m!968431))

(check-sat (not start!92128))
(check-sat)
