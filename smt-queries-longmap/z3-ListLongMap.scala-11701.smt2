; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136828 () Bool)

(assert start!136828)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105817 0))(
  ( (array!105818 (arr!51017 (Array (_ BitVec 32) (_ BitVec 64))) (size!51567 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105817)

(assert (=> start!136828 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51567 a!3471)) (bvslt (size!51567 a!3471) #b01111111111111111111111111111111) (bvslt (bvsub (size!51567 a!3471) from!2846) #b00000000000000000000000000000000))))

(assert (=> start!136828 true))

(declare-fun array_inv!39744 (array!105817) Bool)

(assert (=> start!136828 (array_inv!39744 a!3471)))

(declare-fun bs!45706 () Bool)

(assert (= bs!45706 start!136828))

(declare-fun m!1450857 () Bool)

(assert (=> bs!45706 m!1450857))

(check-sat (not start!136828))
(check-sat)
