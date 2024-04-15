; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136798 () Bool)

(assert start!136798)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105752 0))(
  ( (array!105753 (arr!50984 (Array (_ BitVec 32) (_ BitVec 64))) (size!51536 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105752)

(declare-fun k0!2737 () (_ BitVec 64))

(assert (=> start!136798 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51536 a!3471)) (bvslt (size!51536 a!3471) #b01111111111111111111111111111111) (not (= (select (arr!50984 a!3471) from!2846) k0!2737)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) (size!51536 a!3471)) (bvsge (bvsub (size!51536 a!3471) (bvadd #b00000000000000000000000000000001 from!2846)) (bvsub (size!51536 a!3471) from!2846)))))

(assert (=> start!136798 true))

(declare-fun array_inv!39920 (array!105752) Bool)

(assert (=> start!136798 (array_inv!39920 a!3471)))

(declare-fun bs!45666 () Bool)

(assert (= bs!45666 start!136798))

(declare-fun m!1449981 () Bool)

(assert (=> bs!45666 m!1449981))

(declare-fun m!1449983 () Bool)

(assert (=> bs!45666 m!1449983))

(check-sat (not start!136798))
(check-sat)
