; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103436 () Bool)

(assert start!103436)

(declare-fun res!827547 () Bool)

(declare-fun e!702950 () Bool)

(assert (=> start!103436 (=> (not res!827547) (not e!702950))))

(declare-datatypes ((array!79918 0))(
  ( (array!79919 (arr!38556 (Array (_ BitVec 32) (_ BitVec 64))) (size!39092 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79918)

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103436 (= res!827547 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39092 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39092 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103436 e!702950))

(assert (=> start!103436 true))

(declare-fun array_inv!29404 (array!79918) Bool)

(assert (=> start!103436 (array_inv!29404 a!3575)))

(declare-fun b!1240261 () Bool)

(declare-fun res!827548 () Bool)

(assert (=> b!1240261 (=> (not res!827548) (not e!702950))))

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240261 (= res!827548 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(declare-fun b!1240262 () Bool)

(assert (=> b!1240262 (= e!702950 (and (bvsgt from!2953 newFrom!281) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!103436 res!827547) b!1240261))

(assert (= (and b!1240261 res!827548) b!1240262))

(declare-fun m!1143605 () Bool)

(assert (=> start!103436 m!1143605))

(declare-fun m!1143607 () Bool)

(assert (=> b!1240261 m!1143607))

(check-sat (not b!1240261) (not start!103436))
(check-sat)
