; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92364 () Bool)

(assert start!92364)

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66031 0))(
  ( (array!66032 (arr!31753 (Array (_ BitVec 32) (_ BitVec 64))) (size!32290 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66031)

(assert (=> start!92364 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32290 a!3488)) (bvslt (size!32290 a!3488) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!32290 a!3488)))))

(assert (=> start!92364 true))

(declare-fun array_inv!24535 (array!66031) Bool)

(assert (=> start!92364 (array_inv!24535 a!3488)))

(declare-fun bs!30663 () Bool)

(assert (= bs!30663 start!92364))

(declare-fun m!970715 () Bool)

(assert (=> bs!30663 m!970715))

(check-sat (not start!92364))
(check-sat)
