; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117254 () Bool)

(assert start!117254)

(declare-fun b!1379515 () Bool)

(declare-fun e!781478 () Bool)

(declare-fun e!781480 () Bool)

(assert (=> b!1379515 (= e!781478 (not e!781480))))

(declare-fun res!921955 () Bool)

(assert (=> b!1379515 (=> res!921955 e!781480)))

(declare-datatypes ((array!93850 0))(
  ( (array!93851 (arr!45324 (Array (_ BitVec 32) (_ BitVec 64))) (size!45874 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93850)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun lt!607622 () (_ BitVec 32))

(declare-fun lt!607619 () (_ BitVec 32))

(assert (=> b!1379515 (= res!921955 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45874 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607622 (bvsub lt!607619 #b00000000000000000000000000000001)))))))

(declare-fun lt!607620 () (_ BitVec 32))

(declare-fun lt!607617 () (_ BitVec 32))

(assert (=> b!1379515 (= (bvadd lt!607620 lt!607617) lt!607622)))

(declare-fun lt!607621 () array!93850)

(declare-fun arrayCountValidKeys!0 (array!93850 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379515 (= lt!607622 (arrayCountValidKeys!0 lt!607621 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379515 (= lt!607620 (arrayCountValidKeys!0 lt!607621 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45875 0))(
  ( (Unit!45876) )
))
(declare-fun lt!607614 () Unit!45875)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45875)

(assert (=> b!1379515 (= lt!607614 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607621 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607623 () (_ BitVec 32))

(declare-fun lt!607618 () (_ BitVec 32))

(assert (=> b!1379515 (= (bvadd lt!607623 lt!607618) lt!607619)))

(assert (=> b!1379515 (= lt!607619 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379515 (= lt!607623 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607616 () Unit!45875)

(assert (=> b!1379515 (= lt!607616 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379516 () Bool)

(assert (=> b!1379516 (= e!781480 true)))

(assert (=> b!1379516 (= (arrayCountValidKeys!0 lt!607621 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun lt!607615 () Unit!45875)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93850 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45875)

(assert (=> b!1379516 (= lt!607615 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k0!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1379517 () Bool)

(declare-fun e!781481 () Bool)

(assert (=> b!1379517 (= e!781481 e!781478)))

(declare-fun res!921953 () Bool)

(assert (=> b!1379517 (=> (not res!921953) (not e!781478))))

(assert (=> b!1379517 (= res!921953 (and (= lt!607617 (bvsub lt!607618 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379517 (= lt!607617 (arrayCountValidKeys!0 lt!607621 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379517 (= lt!607618 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379517 (= lt!607621 (array!93851 (store (arr!45324 a!4094) i!1451 k0!2953) (size!45874 a!4094)))))

(declare-fun b!1379518 () Bool)

(declare-fun res!921956 () Bool)

(assert (=> b!1379518 (=> (not res!921956) (not e!781481))))

(assert (=> b!1379518 (= res!921956 (and (bvslt (size!45874 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45874 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379519 () Bool)

(declare-fun res!921958 () Bool)

(assert (=> b!1379519 (=> (not res!921958) (not e!781481))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379519 (= res!921958 (not (validKeyInArray!0 k0!2953)))))

(declare-fun res!921957 () Bool)

(assert (=> start!117254 (=> (not res!921957) (not e!781481))))

(assert (=> start!117254 (= res!921957 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45874 a!4094))))))

(assert (=> start!117254 e!781481))

(assert (=> start!117254 true))

(declare-fun array_inv!34352 (array!93850) Bool)

(assert (=> start!117254 (array_inv!34352 a!4094)))

(declare-fun b!1379520 () Bool)

(declare-fun res!921954 () Bool)

(assert (=> b!1379520 (=> (not res!921954) (not e!781481))))

(assert (=> b!1379520 (= res!921954 (validKeyInArray!0 (select (arr!45324 a!4094) i!1451)))))

(assert (= (and start!117254 res!921957) b!1379520))

(assert (= (and b!1379520 res!921954) b!1379519))

(assert (= (and b!1379519 res!921958) b!1379518))

(assert (= (and b!1379518 res!921956) b!1379517))

(assert (= (and b!1379517 res!921953) b!1379515))

(assert (= (and b!1379515 (not res!921955)) b!1379516))

(declare-fun m!1264637 () Bool)

(assert (=> b!1379519 m!1264637))

(declare-fun m!1264639 () Bool)

(assert (=> start!117254 m!1264639))

(declare-fun m!1264641 () Bool)

(assert (=> b!1379515 m!1264641))

(declare-fun m!1264643 () Bool)

(assert (=> b!1379515 m!1264643))

(declare-fun m!1264645 () Bool)

(assert (=> b!1379515 m!1264645))

(declare-fun m!1264647 () Bool)

(assert (=> b!1379515 m!1264647))

(declare-fun m!1264649 () Bool)

(assert (=> b!1379515 m!1264649))

(declare-fun m!1264651 () Bool)

(assert (=> b!1379515 m!1264651))

(declare-fun m!1264653 () Bool)

(assert (=> b!1379517 m!1264653))

(declare-fun m!1264655 () Bool)

(assert (=> b!1379517 m!1264655))

(declare-fun m!1264657 () Bool)

(assert (=> b!1379517 m!1264657))

(declare-fun m!1264659 () Bool)

(assert (=> b!1379516 m!1264659))

(declare-fun m!1264661 () Bool)

(assert (=> b!1379516 m!1264661))

(declare-fun m!1264663 () Bool)

(assert (=> b!1379516 m!1264663))

(declare-fun m!1264665 () Bool)

(assert (=> b!1379520 m!1264665))

(assert (=> b!1379520 m!1264665))

(declare-fun m!1264667 () Bool)

(assert (=> b!1379520 m!1264667))

(check-sat (not b!1379516) (not b!1379517) (not b!1379520) (not start!117254) (not b!1379519) (not b!1379515))
