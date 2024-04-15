; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117086 () Bool)

(assert start!117086)

(declare-fun b!1378259 () Bool)

(declare-fun res!920837 () Bool)

(declare-fun e!780774 () Bool)

(assert (=> b!1378259 (=> (not res!920837) (not e!780774))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378259 (= res!920837 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378260 () Bool)

(declare-fun e!780775 () Bool)

(assert (=> b!1378260 (= e!780775 (not true))))

(declare-datatypes ((array!93657 0))(
  ( (array!93658 (arr!45229 (Array (_ BitVec 32) (_ BitVec 64))) (size!45781 (_ BitVec 32))) )
))
(declare-fun lt!606295 () array!93657)

(declare-fun lt!606293 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93657 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378260 (= (bvadd (arrayCountValidKeys!0 lt!606295 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606293) (arrayCountValidKeys!0 lt!606295 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45612 0))(
  ( (Unit!45613) )
))
(declare-fun lt!606294 () Unit!45612)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45612)

(assert (=> b!1378260 (= lt!606294 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606295 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606296 () (_ BitVec 32))

(declare-fun a!4094 () array!93657)

(assert (=> b!1378260 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606296) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606292 () Unit!45612)

(assert (=> b!1378260 (= lt!606292 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!920838 () Bool)

(assert (=> start!117086 (=> (not res!920838) (not e!780774))))

(assert (=> start!117086 (= res!920838 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45781 a!4094))))))

(assert (=> start!117086 e!780774))

(assert (=> start!117086 true))

(declare-fun array_inv!34462 (array!93657) Bool)

(assert (=> start!117086 (array_inv!34462 a!4094)))

(declare-fun b!1378261 () Bool)

(declare-fun res!920839 () Bool)

(assert (=> b!1378261 (=> (not res!920839) (not e!780774))))

(assert (=> b!1378261 (= res!920839 (validKeyInArray!0 (select (arr!45229 a!4094) i!1451)))))

(declare-fun b!1378262 () Bool)

(declare-fun res!920840 () Bool)

(assert (=> b!1378262 (=> (not res!920840) (not e!780774))))

(assert (=> b!1378262 (= res!920840 (and (bvslt (size!45781 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45781 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378263 () Bool)

(assert (=> b!1378263 (= e!780774 e!780775)))

(declare-fun res!920836 () Bool)

(assert (=> b!1378263 (=> (not res!920836) (not e!780775))))

(assert (=> b!1378263 (= res!920836 (and (= lt!606293 (bvsub lt!606296 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378263 (= lt!606293 (arrayCountValidKeys!0 lt!606295 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378263 (= lt!606296 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378263 (= lt!606295 (array!93658 (store (arr!45229 a!4094) i!1451 k0!2953) (size!45781 a!4094)))))

(assert (= (and start!117086 res!920838) b!1378261))

(assert (= (and b!1378261 res!920839) b!1378259))

(assert (= (and b!1378259 res!920837) b!1378262))

(assert (= (and b!1378262 res!920840) b!1378263))

(assert (= (and b!1378263 res!920836) b!1378260))

(declare-fun m!1262373 () Bool)

(assert (=> start!117086 m!1262373))

(declare-fun m!1262375 () Bool)

(assert (=> b!1378259 m!1262375))

(declare-fun m!1262377 () Bool)

(assert (=> b!1378261 m!1262377))

(assert (=> b!1378261 m!1262377))

(declare-fun m!1262379 () Bool)

(assert (=> b!1378261 m!1262379))

(declare-fun m!1262381 () Bool)

(assert (=> b!1378263 m!1262381))

(declare-fun m!1262383 () Bool)

(assert (=> b!1378263 m!1262383))

(declare-fun m!1262385 () Bool)

(assert (=> b!1378263 m!1262385))

(declare-fun m!1262387 () Bool)

(assert (=> b!1378260 m!1262387))

(declare-fun m!1262389 () Bool)

(assert (=> b!1378260 m!1262389))

(declare-fun m!1262391 () Bool)

(assert (=> b!1378260 m!1262391))

(declare-fun m!1262393 () Bool)

(assert (=> b!1378260 m!1262393))

(declare-fun m!1262395 () Bool)

(assert (=> b!1378260 m!1262395))

(declare-fun m!1262397 () Bool)

(assert (=> b!1378260 m!1262397))

(check-sat (not b!1378263) (not b!1378261) (not b!1378260) (not b!1378259) (not start!117086))
(check-sat)
