; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136822 () Bool)

(assert start!136822)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105811 0))(
  ( (array!105812 (arr!51014 (Array (_ BitVec 32) (_ BitVec 64))) (size!51564 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105811)

(declare-fun k0!2737 () (_ BitVec 64))

(assert (=> start!136822 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51564 a!3471)) (bvslt (size!51564 a!3471) #b01111111111111111111111111111111) (not (= (select (arr!51014 a!3471) from!2846) k0!2737)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) (size!51564 a!3471)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) #b00000000000000000000000000000000))))

(assert (=> start!136822 true))

(declare-fun array_inv!39741 (array!105811) Bool)

(assert (=> start!136822 (array_inv!39741 a!3471)))

(declare-fun bs!45700 () Bool)

(assert (= bs!45700 start!136822))

(declare-fun m!1450847 () Bool)

(assert (=> bs!45700 m!1450847))

(declare-fun m!1450849 () Bool)

(assert (=> bs!45700 m!1450849))

(check-sat (not start!136822))
(check-sat)
