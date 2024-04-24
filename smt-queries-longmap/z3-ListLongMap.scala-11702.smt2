; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137258 () Bool)

(assert start!137258)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105947 0))(
  ( (array!105948 (arr!51073 (Array (_ BitVec 32) (_ BitVec 64))) (size!51624 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105947)

(declare-fun k0!2737 () (_ BitVec 64))

(assert (=> start!137258 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51624 a!3471)) (bvslt (size!51624 a!3471) #b01111111111111111111111111111111) (not (= (select (arr!51073 a!3471) from!2846) k0!2737)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) (size!51624 a!3471)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) #b00000000000000000000000000000000))))

(assert (=> start!137258 true))

(declare-fun array_inv!40028 (array!105947) Bool)

(assert (=> start!137258 (array_inv!40028 a!3471)))

(declare-fun bs!45723 () Bool)

(assert (= bs!45723 start!137258))

(declare-fun m!1453155 () Bool)

(assert (=> bs!45723 m!1453155))

(declare-fun m!1453157 () Bool)

(assert (=> bs!45723 m!1453157))

(check-sat (not start!137258))
(check-sat)
