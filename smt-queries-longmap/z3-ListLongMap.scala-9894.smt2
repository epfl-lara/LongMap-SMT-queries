; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117110 () Bool)

(assert start!117110)

(declare-fun b!1378483 () Bool)

(declare-fun e!780900 () Bool)

(declare-fun e!780901 () Bool)

(assert (=> b!1378483 (= e!780900 e!780901)))

(declare-fun res!921021 () Bool)

(assert (=> b!1378483 (=> (not res!921021) (not e!780901))))

(declare-fun lt!606654 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606656 () (_ BitVec 32))

(assert (=> b!1378483 (= res!921021 (and (= lt!606654 (bvsub lt!606656 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93727 0))(
  ( (array!93728 (arr!45264 (Array (_ BitVec 32) (_ BitVec 64))) (size!45814 (_ BitVec 32))) )
))
(declare-fun lt!606651 () array!93727)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93727 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378483 (= lt!606654 (arrayCountValidKeys!0 lt!606651 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93727)

(assert (=> b!1378483 (= lt!606656 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1378483 (= lt!606651 (array!93728 (store (arr!45264 a!4094) i!1451 k0!2953) (size!45814 a!4094)))))

(declare-fun b!1378484 () Bool)

(declare-fun res!921017 () Bool)

(assert (=> b!1378484 (=> (not res!921017) (not e!780900))))

(assert (=> b!1378484 (= res!921017 (and (bvslt (size!45814 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45814 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378486 () Bool)

(declare-fun res!921020 () Bool)

(assert (=> b!1378486 (=> (not res!921020) (not e!780900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378486 (= res!921020 (validKeyInArray!0 (select (arr!45264 a!4094) i!1451)))))

(declare-fun b!1378487 () Bool)

(declare-fun e!780902 () Bool)

(assert (=> b!1378487 (= e!780901 (not e!780902))))

(declare-fun res!921018 () Bool)

(assert (=> b!1378487 (=> res!921018 e!780902)))

(declare-fun lt!606653 () (_ BitVec 32))

(declare-fun lt!606657 () (_ BitVec 32))

(assert (=> b!1378487 (= res!921018 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45814 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606653 (bvsub lt!606657 #b00000000000000000000000000000001)))))))

(declare-fun lt!606655 () (_ BitVec 32))

(assert (=> b!1378487 (= (bvadd lt!606655 lt!606654) lt!606653)))

(assert (=> b!1378487 (= lt!606653 (arrayCountValidKeys!0 lt!606651 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378487 (= lt!606655 (arrayCountValidKeys!0 lt!606651 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45791 0))(
  ( (Unit!45792) )
))
(declare-fun lt!606659 () Unit!45791)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45791)

(assert (=> b!1378487 (= lt!606659 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606651 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606652 () (_ BitVec 32))

(assert (=> b!1378487 (= (bvadd lt!606652 lt!606656) lt!606657)))

(assert (=> b!1378487 (= lt!606657 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378487 (= lt!606652 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606658 () Unit!45791)

(assert (=> b!1378487 (= lt!606658 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378488 () Bool)

(declare-fun res!921022 () Bool)

(assert (=> b!1378488 (=> (not res!921022) (not e!780900))))

(assert (=> b!1378488 (= res!921022 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378485 () Bool)

(assert (=> b!1378485 (= e!780902 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378485 (= (arrayCountValidKeys!0 lt!606651 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!606660 () Unit!45791)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93727 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45791)

(assert (=> b!1378485 (= lt!606660 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k0!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun res!921019 () Bool)

(assert (=> start!117110 (=> (not res!921019) (not e!780900))))

(assert (=> start!117110 (= res!921019 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45814 a!4094))))))

(assert (=> start!117110 e!780900))

(assert (=> start!117110 true))

(declare-fun array_inv!34292 (array!93727) Bool)

(assert (=> start!117110 (array_inv!34292 a!4094)))

(assert (= (and start!117110 res!921019) b!1378486))

(assert (= (and b!1378486 res!921020) b!1378488))

(assert (= (and b!1378488 res!921022) b!1378484))

(assert (= (and b!1378484 res!921017) b!1378483))

(assert (= (and b!1378483 res!921021) b!1378487))

(assert (= (and b!1378487 (not res!921018)) b!1378485))

(declare-fun m!1263143 () Bool)

(assert (=> b!1378487 m!1263143))

(declare-fun m!1263145 () Bool)

(assert (=> b!1378487 m!1263145))

(declare-fun m!1263147 () Bool)

(assert (=> b!1378487 m!1263147))

(declare-fun m!1263149 () Bool)

(assert (=> b!1378487 m!1263149))

(declare-fun m!1263151 () Bool)

(assert (=> b!1378487 m!1263151))

(declare-fun m!1263153 () Bool)

(assert (=> b!1378487 m!1263153))

(declare-fun m!1263155 () Bool)

(assert (=> b!1378486 m!1263155))

(assert (=> b!1378486 m!1263155))

(declare-fun m!1263157 () Bool)

(assert (=> b!1378486 m!1263157))

(declare-fun m!1263159 () Bool)

(assert (=> b!1378485 m!1263159))

(declare-fun m!1263161 () Bool)

(assert (=> b!1378485 m!1263161))

(declare-fun m!1263163 () Bool)

(assert (=> b!1378485 m!1263163))

(declare-fun m!1263165 () Bool)

(assert (=> b!1378488 m!1263165))

(declare-fun m!1263167 () Bool)

(assert (=> start!117110 m!1263167))

(declare-fun m!1263169 () Bool)

(assert (=> b!1378483 m!1263169))

(declare-fun m!1263171 () Bool)

(assert (=> b!1378483 m!1263171))

(declare-fun m!1263173 () Bool)

(assert (=> b!1378483 m!1263173))

(check-sat (not b!1378483) (not b!1378486) (not start!117110) (not b!1378487) (not b!1378488) (not b!1378485))
(check-sat)
