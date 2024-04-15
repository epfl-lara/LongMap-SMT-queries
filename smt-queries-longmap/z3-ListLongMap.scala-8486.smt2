; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103428 () Bool)

(assert start!103428)

(declare-fun res!827497 () Bool)

(declare-fun e!702895 () Bool)

(assert (=> start!103428 (=> (not res!827497) (not e!702895))))

(declare-datatypes ((array!79837 0))(
  ( (array!79838 (arr!38516 (Array (_ BitVec 32) (_ BitVec 64))) (size!39054 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79837)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103428 (= res!827497 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39054 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39054 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103428 e!702895))

(assert (=> start!103428 true))

(declare-fun array_inv!29499 (array!79837) Bool)

(assert (=> start!103428 (array_inv!29499 a!3575)))

(declare-fun b!1240169 () Bool)

(declare-fun res!827498 () Bool)

(assert (=> b!1240169 (=> (not res!827498) (not e!702895))))

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240169 (= res!827498 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(declare-fun b!1240170 () Bool)

(assert (=> b!1240170 (= e!702895 (and (bvsgt from!2953 newFrom!281) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!103428 res!827497) b!1240169))

(assert (= (and b!1240169 res!827498) b!1240170))

(declare-fun m!1143077 () Bool)

(assert (=> start!103428 m!1143077))

(declare-fun m!1143079 () Bool)

(assert (=> b!1240169 m!1143079))

(check-sat (not b!1240169) (not start!103428))
(check-sat)
