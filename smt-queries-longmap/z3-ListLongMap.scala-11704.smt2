; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137270 () Bool)

(assert start!137270)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105959 0))(
  ( (array!105960 (arr!51079 (Array (_ BitVec 32) (_ BitVec 64))) (size!51630 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105959)

(declare-fun k0!2737 () (_ BitVec 64))

(assert (=> start!137270 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51630 a!3471)) (bvslt (size!51630 a!3471) #b01111111111111111111111111111111) (not (= (select (arr!51079 a!3471) from!2846) k0!2737)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) (size!51630 a!3471)) (bvsge (bvsub (size!51630 a!3471) (bvadd #b00000000000000000000000000000001 from!2846)) (bvsub (size!51630 a!3471) from!2846)))))

(assert (=> start!137270 true))

(declare-fun array_inv!40034 (array!105959) Bool)

(assert (=> start!137270 (array_inv!40034 a!3471)))

(declare-fun bs!45735 () Bool)

(assert (= bs!45735 start!137270))

(declare-fun m!1453173 () Bool)

(assert (=> bs!45735 m!1453173))

(declare-fun m!1453175 () Bool)

(assert (=> bs!45735 m!1453175))

(check-sat (not start!137270))
(check-sat)
