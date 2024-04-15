; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136786 () Bool)

(assert start!136786)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105740 0))(
  ( (array!105741 (arr!50978 (Array (_ BitVec 32) (_ BitVec 64))) (size!51530 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105740)

(declare-fun k0!2737 () (_ BitVec 64))

(assert (=> start!136786 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51530 a!3471)) (bvslt (size!51530 a!3471) #b01111111111111111111111111111111) (not (= (select (arr!50978 a!3471) from!2846) k0!2737)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) (size!51530 a!3471)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) #b00000000000000000000000000000000))))

(assert (=> start!136786 true))

(declare-fun array_inv!39914 (array!105740) Bool)

(assert (=> start!136786 (array_inv!39914 a!3471)))

(declare-fun bs!45654 () Bool)

(assert (= bs!45654 start!136786))

(declare-fun m!1449963 () Bool)

(assert (=> bs!45654 m!1449963))

(declare-fun m!1449965 () Bool)

(assert (=> bs!45654 m!1449965))

(check-sat (not start!136786))
(check-sat)
