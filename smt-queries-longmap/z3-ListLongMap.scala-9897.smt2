; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117128 () Bool)

(assert start!117128)

(declare-fun res!921179 () Bool)

(declare-fun e!781008 () Bool)

(assert (=> start!117128 (=> (not res!921179) (not e!781008))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93745 0))(
  ( (array!93746 (arr!45273 (Array (_ BitVec 32) (_ BitVec 64))) (size!45823 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93745)

(assert (=> start!117128 (= res!921179 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45823 a!4094))))))

(assert (=> start!117128 e!781008))

(assert (=> start!117128 true))

(declare-fun array_inv!34301 (array!93745) Bool)

(assert (=> start!117128 (array_inv!34301 a!4094)))

(declare-fun b!1378645 () Bool)

(declare-fun e!781009 () Bool)

(assert (=> b!1378645 (= e!781009 true)))

(declare-fun lt!606924 () array!93745)

(declare-fun arrayCountValidKeys!0 (array!93745 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378645 (= (arrayCountValidKeys!0 lt!606924 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-datatypes ((Unit!45809 0))(
  ( (Unit!45810) )
))
(declare-fun lt!606929 () Unit!45809)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93745 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45809)

(assert (=> b!1378645 (= lt!606929 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k0!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1378646 () Bool)

(declare-fun res!921184 () Bool)

(assert (=> b!1378646 (=> (not res!921184) (not e!781008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378646 (= res!921184 (validKeyInArray!0 (select (arr!45273 a!4094) i!1451)))))

(declare-fun b!1378647 () Bool)

(declare-fun res!921183 () Bool)

(assert (=> b!1378647 (=> (not res!921183) (not e!781008))))

(assert (=> b!1378647 (= res!921183 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378648 () Bool)

(declare-fun res!921181 () Bool)

(assert (=> b!1378648 (=> (not res!921181) (not e!781008))))

(assert (=> b!1378648 (= res!921181 (and (bvslt (size!45823 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45823 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378649 () Bool)

(declare-fun e!781007 () Bool)

(assert (=> b!1378649 (= e!781008 e!781007)))

(declare-fun res!921180 () Bool)

(assert (=> b!1378649 (=> (not res!921180) (not e!781007))))

(declare-fun lt!606923 () (_ BitVec 32))

(declare-fun lt!606925 () (_ BitVec 32))

(assert (=> b!1378649 (= res!921180 (and (= lt!606923 (bvsub lt!606925 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378649 (= lt!606923 (arrayCountValidKeys!0 lt!606924 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378649 (= lt!606925 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378649 (= lt!606924 (array!93746 (store (arr!45273 a!4094) i!1451 k0!2953) (size!45823 a!4094)))))

(declare-fun b!1378650 () Bool)

(assert (=> b!1378650 (= e!781007 (not e!781009))))

(declare-fun res!921182 () Bool)

(assert (=> b!1378650 (=> res!921182 e!781009)))

(declare-fun lt!606930 () (_ BitVec 32))

(declare-fun lt!606927 () (_ BitVec 32))

(assert (=> b!1378650 (= res!921182 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45823 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606930 (bvsub lt!606927 #b00000000000000000000000000000001)))))))

(declare-fun lt!606921 () (_ BitVec 32))

(assert (=> b!1378650 (= (bvadd lt!606921 lt!606923) lt!606930)))

(assert (=> b!1378650 (= lt!606930 (arrayCountValidKeys!0 lt!606924 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378650 (= lt!606921 (arrayCountValidKeys!0 lt!606924 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606922 () Unit!45809)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45809)

(assert (=> b!1378650 (= lt!606922 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606924 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606926 () (_ BitVec 32))

(assert (=> b!1378650 (= (bvadd lt!606926 lt!606925) lt!606927)))

(assert (=> b!1378650 (= lt!606927 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378650 (= lt!606926 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606928 () Unit!45809)

(assert (=> b!1378650 (= lt!606928 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117128 res!921179) b!1378646))

(assert (= (and b!1378646 res!921184) b!1378647))

(assert (= (and b!1378647 res!921183) b!1378648))

(assert (= (and b!1378648 res!921181) b!1378649))

(assert (= (and b!1378649 res!921180) b!1378650))

(assert (= (and b!1378650 (not res!921182)) b!1378645))

(declare-fun m!1263431 () Bool)

(assert (=> b!1378647 m!1263431))

(declare-fun m!1263433 () Bool)

(assert (=> b!1378649 m!1263433))

(declare-fun m!1263435 () Bool)

(assert (=> b!1378649 m!1263435))

(declare-fun m!1263437 () Bool)

(assert (=> b!1378649 m!1263437))

(declare-fun m!1263439 () Bool)

(assert (=> b!1378646 m!1263439))

(assert (=> b!1378646 m!1263439))

(declare-fun m!1263441 () Bool)

(assert (=> b!1378646 m!1263441))

(declare-fun m!1263443 () Bool)

(assert (=> b!1378645 m!1263443))

(declare-fun m!1263445 () Bool)

(assert (=> b!1378645 m!1263445))

(declare-fun m!1263447 () Bool)

(assert (=> b!1378645 m!1263447))

(declare-fun m!1263449 () Bool)

(assert (=> b!1378650 m!1263449))

(declare-fun m!1263451 () Bool)

(assert (=> b!1378650 m!1263451))

(declare-fun m!1263453 () Bool)

(assert (=> b!1378650 m!1263453))

(declare-fun m!1263455 () Bool)

(assert (=> b!1378650 m!1263455))

(declare-fun m!1263457 () Bool)

(assert (=> b!1378650 m!1263457))

(declare-fun m!1263459 () Bool)

(assert (=> b!1378650 m!1263459))

(declare-fun m!1263461 () Bool)

(assert (=> start!117128 m!1263461))

(check-sat (not b!1378645) (not b!1378650) (not b!1378646) (not b!1378649) (not b!1378647) (not start!117128))
(check-sat)
