; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117182 () Bool)

(assert start!117182)

(declare-fun b!1379006 () Bool)

(declare-fun res!921586 () Bool)

(declare-fun e!781187 () Bool)

(assert (=> b!1379006 (=> (not res!921586) (not e!781187))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379006 (= res!921586 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379007 () Bool)

(declare-fun e!781188 () Bool)

(assert (=> b!1379007 (= e!781188 (not true))))

(declare-fun lt!606922 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-datatypes ((array!93753 0))(
  ( (array!93754 (arr!45277 (Array (_ BitVec 32) (_ BitVec 64))) (size!45829 (_ BitVec 32))) )
))
(declare-fun lt!606925 () array!93753)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93753 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379007 (= (bvadd (arrayCountValidKeys!0 lt!606925 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606922) (arrayCountValidKeys!0 lt!606925 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45672 0))(
  ( (Unit!45673) )
))
(declare-fun lt!606923 () Unit!45672)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45672)

(assert (=> b!1379007 (= lt!606923 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606925 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun a!4094 () array!93753)

(declare-fun lt!606924 () (_ BitVec 32))

(assert (=> b!1379007 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606924) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606926 () Unit!45672)

(assert (=> b!1379007 (= lt!606926 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379008 () Bool)

(declare-fun res!921583 () Bool)

(assert (=> b!1379008 (=> (not res!921583) (not e!781187))))

(assert (=> b!1379008 (= res!921583 (validKeyInArray!0 (select (arr!45277 a!4094) i!1451)))))

(declare-fun b!1379009 () Bool)

(declare-fun res!921585 () Bool)

(assert (=> b!1379009 (=> (not res!921585) (not e!781187))))

(assert (=> b!1379009 (= res!921585 (and (bvslt (size!45829 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45829 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921587 () Bool)

(assert (=> start!117182 (=> (not res!921587) (not e!781187))))

(assert (=> start!117182 (= res!921587 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45829 a!4094))))))

(assert (=> start!117182 e!781187))

(assert (=> start!117182 true))

(declare-fun array_inv!34510 (array!93753) Bool)

(assert (=> start!117182 (array_inv!34510 a!4094)))

(declare-fun b!1379010 () Bool)

(assert (=> b!1379010 (= e!781187 e!781188)))

(declare-fun res!921584 () Bool)

(assert (=> b!1379010 (=> (not res!921584) (not e!781188))))

(assert (=> b!1379010 (= res!921584 (and (= lt!606922 (bvsub lt!606924 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379010 (= lt!606922 (arrayCountValidKeys!0 lt!606925 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379010 (= lt!606924 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379010 (= lt!606925 (array!93754 (store (arr!45277 a!4094) i!1451 k0!2953) (size!45829 a!4094)))))

(assert (= (and start!117182 res!921587) b!1379008))

(assert (= (and b!1379008 res!921583) b!1379006))

(assert (= (and b!1379006 res!921586) b!1379009))

(assert (= (and b!1379009 res!921585) b!1379010))

(assert (= (and b!1379010 res!921584) b!1379007))

(declare-fun m!1263441 () Bool)

(assert (=> b!1379007 m!1263441))

(declare-fun m!1263443 () Bool)

(assert (=> b!1379007 m!1263443))

(declare-fun m!1263445 () Bool)

(assert (=> b!1379007 m!1263445))

(declare-fun m!1263447 () Bool)

(assert (=> b!1379007 m!1263447))

(declare-fun m!1263449 () Bool)

(assert (=> b!1379007 m!1263449))

(declare-fun m!1263451 () Bool)

(assert (=> b!1379007 m!1263451))

(declare-fun m!1263453 () Bool)

(assert (=> b!1379010 m!1263453))

(declare-fun m!1263455 () Bool)

(assert (=> b!1379010 m!1263455))

(declare-fun m!1263457 () Bool)

(assert (=> b!1379010 m!1263457))

(declare-fun m!1263459 () Bool)

(assert (=> b!1379006 m!1263459))

(declare-fun m!1263461 () Bool)

(assert (=> b!1379008 m!1263461))

(assert (=> b!1379008 m!1263461))

(declare-fun m!1263463 () Bool)

(assert (=> b!1379008 m!1263463))

(declare-fun m!1263465 () Bool)

(assert (=> start!117182 m!1263465))

(check-sat (not b!1379007) (not b!1379006) (not b!1379008) (not b!1379010) (not start!117182))
(check-sat)
