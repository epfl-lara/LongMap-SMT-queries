; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103424 () Bool)

(assert start!103424)

(declare-fun b!1240217 () Bool)

(declare-fun res!827504 () Bool)

(declare-fun e!702914 () Bool)

(assert (=> b!1240217 (=> (not res!827504) (not e!702914))))

(declare-datatypes ((array!79906 0))(
  ( (array!79907 (arr!38550 (Array (_ BitVec 32) (_ BitVec 64))) (size!39086 (_ BitVec 32))) )
))
(declare-fun a!3575 () array!79906)

(declare-fun k0!2808 () (_ BitVec 64))

(declare-fun from!2953 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1240217 (= res!827504 (arrayContainsKey!0 a!3575 k0!2808 from!2953))))

(declare-fun res!827506 () Bool)

(assert (=> start!103424 (=> (not res!827506) (not e!702914))))

(declare-fun newFrom!281 () (_ BitVec 32))

(assert (=> start!103424 (= res!827506 (and (bvsge from!2953 #b00000000000000000000000000000000) (bvslt from!2953 (size!39086 a!3575)) (bvsge newFrom!281 #b00000000000000000000000000000000) (bvsle newFrom!281 from!2953) (bvslt (size!39086 a!3575) #b01111111111111111111111111111111)))))

(assert (=> start!103424 e!702914))

(assert (=> start!103424 true))

(declare-fun array_inv!29398 (array!79906) Bool)

(assert (=> start!103424 (array_inv!29398 a!3575)))

(declare-fun b!1240218 () Bool)

(declare-fun res!827503 () Bool)

(assert (=> b!1240218 (=> (not res!827503) (not e!702914))))

(assert (=> b!1240218 (= res!827503 (and (bvsgt from!2953 newFrom!281) (bvsge (bvsub from!2953 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2953 #b00000000000000000000000000000001) (size!39086 a!3575))))))

(declare-fun b!1240220 () Bool)

(assert (=> b!1240220 (= e!702914 (not true))))

(assert (=> b!1240220 (arrayContainsKey!0 a!3575 k0!2808 newFrom!281)))

(declare-datatypes ((Unit!41221 0))(
  ( (Unit!41222) )
))
(declare-fun lt!561911 () Unit!41221)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79906 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!41221)

(assert (=> b!1240220 (= lt!561911 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001) newFrom!281))))

(declare-fun b!1240219 () Bool)

(declare-fun res!827505 () Bool)

(assert (=> b!1240219 (=> (not res!827505) (not e!702914))))

(assert (=> b!1240219 (= res!827505 (arrayContainsKey!0 a!3575 k0!2808 (bvsub from!2953 #b00000000000000000000000000000001)))))

(assert (= (and start!103424 res!827506) b!1240217))

(assert (= (and b!1240217 res!827504) b!1240218))

(assert (= (and b!1240218 res!827503) b!1240219))

(assert (= (and b!1240219 res!827505) b!1240220))

(declare-fun m!1143569 () Bool)

(assert (=> b!1240217 m!1143569))

(declare-fun m!1143571 () Bool)

(assert (=> start!103424 m!1143571))

(declare-fun m!1143573 () Bool)

(assert (=> b!1240220 m!1143573))

(declare-fun m!1143575 () Bool)

(assert (=> b!1240220 m!1143575))

(declare-fun m!1143577 () Bool)

(assert (=> b!1240219 m!1143577))

(check-sat (not b!1240217) (not b!1240220) (not start!103424) (not b!1240219))
