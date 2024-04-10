; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136834 () Bool)

(assert start!136834)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105823 0))(
  ( (array!105824 (arr!51020 (Array (_ BitVec 32) (_ BitVec 64))) (size!51570 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105823)

(declare-fun k0!2737 () (_ BitVec 64))

(assert (=> start!136834 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51570 a!3471)) (bvslt (size!51570 a!3471) #b01111111111111111111111111111111) (not (= (select (arr!51020 a!3471) from!2846) k0!2737)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) (size!51570 a!3471)) (bvsge (bvsub (size!51570 a!3471) (bvadd #b00000000000000000000000000000001 from!2846)) (bvsub (size!51570 a!3471) from!2846)))))

(assert (=> start!136834 true))

(declare-fun array_inv!39747 (array!105823) Bool)

(assert (=> start!136834 (array_inv!39747 a!3471)))

(declare-fun bs!45712 () Bool)

(assert (= bs!45712 start!136834))

(declare-fun m!1450865 () Bool)

(assert (=> bs!45712 m!1450865))

(declare-fun m!1450867 () Bool)

(assert (=> bs!45712 m!1450867))

(check-sat (not start!136834))
(check-sat)
