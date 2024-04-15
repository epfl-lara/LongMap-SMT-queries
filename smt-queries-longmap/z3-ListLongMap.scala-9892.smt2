; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117092 () Bool)

(assert start!117092)

(declare-fun res!920883 () Bool)

(declare-fun e!780800 () Bool)

(assert (=> start!117092 (=> (not res!920883) (not e!780800))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93663 0))(
  ( (array!93664 (arr!45232 (Array (_ BitVec 32) (_ BitVec 64))) (size!45784 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93663)

(assert (=> start!117092 (= res!920883 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45784 a!4094))))))

(assert (=> start!117092 e!780800))

(assert (=> start!117092 true))

(declare-fun array_inv!34465 (array!93663) Bool)

(assert (=> start!117092 (array_inv!34465 a!4094)))

(declare-fun b!1378304 () Bool)

(declare-fun res!920882 () Bool)

(assert (=> b!1378304 (=> (not res!920882) (not e!780800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378304 (= res!920882 (validKeyInArray!0 (select (arr!45232 a!4094) i!1451)))))

(declare-fun b!1378305 () Bool)

(declare-fun e!780802 () Bool)

(assert (=> b!1378305 (= e!780800 e!780802)))

(declare-fun res!920885 () Bool)

(assert (=> b!1378305 (=> (not res!920885) (not e!780802))))

(declare-fun lt!606339 () (_ BitVec 32))

(declare-fun lt!606338 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378305 (= res!920885 (and (= lt!606338 (bvsub lt!606339 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606340 () array!93663)

(declare-fun arrayCountValidKeys!0 (array!93663 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378305 (= lt!606338 (arrayCountValidKeys!0 lt!606340 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378305 (= lt!606339 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k0!2953 () (_ BitVec 64))

(assert (=> b!1378305 (= lt!606340 (array!93664 (store (arr!45232 a!4094) i!1451 k0!2953) (size!45784 a!4094)))))

(declare-fun b!1378306 () Bool)

(declare-fun res!920884 () Bool)

(assert (=> b!1378306 (=> (not res!920884) (not e!780800))))

(assert (=> b!1378306 (= res!920884 (and (bvslt (size!45784 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45784 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378307 () Bool)

(assert (=> b!1378307 (= e!780802 (not true))))

(assert (=> b!1378307 (= (bvadd (arrayCountValidKeys!0 lt!606340 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606338) (arrayCountValidKeys!0 lt!606340 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45618 0))(
  ( (Unit!45619) )
))
(declare-fun lt!606337 () Unit!45618)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45618)

(assert (=> b!1378307 (= lt!606337 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606340 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378307 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606339) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606341 () Unit!45618)

(assert (=> b!1378307 (= lt!606341 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378308 () Bool)

(declare-fun res!920881 () Bool)

(assert (=> b!1378308 (=> (not res!920881) (not e!780800))))

(assert (=> b!1378308 (= res!920881 (not (validKeyInArray!0 k0!2953)))))

(assert (= (and start!117092 res!920883) b!1378304))

(assert (= (and b!1378304 res!920882) b!1378308))

(assert (= (and b!1378308 res!920881) b!1378306))

(assert (= (and b!1378306 res!920884) b!1378305))

(assert (= (and b!1378305 res!920885) b!1378307))

(declare-fun m!1262451 () Bool)

(assert (=> start!117092 m!1262451))

(declare-fun m!1262453 () Bool)

(assert (=> b!1378308 m!1262453))

(declare-fun m!1262455 () Bool)

(assert (=> b!1378304 m!1262455))

(assert (=> b!1378304 m!1262455))

(declare-fun m!1262457 () Bool)

(assert (=> b!1378304 m!1262457))

(declare-fun m!1262459 () Bool)

(assert (=> b!1378305 m!1262459))

(declare-fun m!1262461 () Bool)

(assert (=> b!1378305 m!1262461))

(declare-fun m!1262463 () Bool)

(assert (=> b!1378305 m!1262463))

(declare-fun m!1262465 () Bool)

(assert (=> b!1378307 m!1262465))

(declare-fun m!1262467 () Bool)

(assert (=> b!1378307 m!1262467))

(declare-fun m!1262469 () Bool)

(assert (=> b!1378307 m!1262469))

(declare-fun m!1262471 () Bool)

(assert (=> b!1378307 m!1262471))

(declare-fun m!1262473 () Bool)

(assert (=> b!1378307 m!1262473))

(declare-fun m!1262475 () Bool)

(assert (=> b!1378307 m!1262475))

(check-sat (not b!1378307) (not start!117092) (not b!1378305) (not b!1378308) (not b!1378304))
(check-sat)
