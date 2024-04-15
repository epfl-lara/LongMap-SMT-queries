; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136792 () Bool)

(assert start!136792)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105746 0))(
  ( (array!105747 (arr!50981 (Array (_ BitVec 32) (_ BitVec 64))) (size!51533 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105746)

(assert (=> start!136792 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51533 a!3471)) (bvslt (size!51533 a!3471) #b01111111111111111111111111111111) (bvslt (bvsub (size!51533 a!3471) from!2846) #b00000000000000000000000000000000))))

(assert (=> start!136792 true))

(declare-fun array_inv!39917 (array!105746) Bool)

(assert (=> start!136792 (array_inv!39917 a!3471)))

(declare-fun bs!45660 () Bool)

(assert (= bs!45660 start!136792))

(declare-fun m!1449975 () Bool)

(assert (=> bs!45660 m!1449975))

(check-sat (not start!136792))
(check-sat)
