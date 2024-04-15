; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117104 () Bool)

(assert start!117104)

(declare-fun b!1378397 () Bool)

(declare-fun res!920975 () Bool)

(declare-fun e!780857 () Bool)

(assert (=> b!1378397 (=> (not res!920975) (not e!780857))))

(declare-datatypes ((array!93675 0))(
  ( (array!93676 (arr!45238 (Array (_ BitVec 32) (_ BitVec 64))) (size!45790 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93675)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378397 (= res!920975 (and (bvslt (size!45790 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45790 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378398 () Bool)

(declare-fun e!780856 () Bool)

(declare-fun e!780858 () Bool)

(assert (=> b!1378398 (= e!780856 (not e!780858))))

(declare-fun res!920973 () Bool)

(assert (=> b!1378398 (=> res!920973 e!780858)))

(declare-fun lt!606438 () (_ BitVec 32))

(declare-fun lt!606445 () (_ BitVec 32))

(assert (=> b!1378398 (= res!920973 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45790 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606445 (bvsub lt!606438 #b00000000000000000000000000000001)))))))

(declare-fun lt!606446 () (_ BitVec 32))

(declare-fun lt!606440 () (_ BitVec 32))

(assert (=> b!1378398 (= (bvadd lt!606446 lt!606440) lt!606445)))

(declare-fun lt!606441 () array!93675)

(declare-fun arrayCountValidKeys!0 (array!93675 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378398 (= lt!606445 (arrayCountValidKeys!0 lt!606441 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378398 (= lt!606446 (arrayCountValidKeys!0 lt!606441 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45630 0))(
  ( (Unit!45631) )
))
(declare-fun lt!606443 () Unit!45630)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45630)

(assert (=> b!1378398 (= lt!606443 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606441 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606442 () (_ BitVec 32))

(declare-fun lt!606437 () (_ BitVec 32))

(assert (=> b!1378398 (= (bvadd lt!606442 lt!606437) lt!606438)))

(assert (=> b!1378398 (= lt!606438 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378398 (= lt!606442 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606444 () Unit!45630)

(assert (=> b!1378398 (= lt!606444 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378399 () Bool)

(assert (=> b!1378399 (= e!780858 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378399 (= (arrayCountValidKeys!0 lt!606441 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun lt!606439 () Unit!45630)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93675 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45630)

(assert (=> b!1378399 (= lt!606439 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k0!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1378400 () Bool)

(assert (=> b!1378400 (= e!780857 e!780856)))

(declare-fun res!920974 () Bool)

(assert (=> b!1378400 (=> (not res!920974) (not e!780856))))

(assert (=> b!1378400 (= res!920974 (and (= lt!606440 (bvsub lt!606437 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378400 (= lt!606440 (arrayCountValidKeys!0 lt!606441 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378400 (= lt!606437 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378400 (= lt!606441 (array!93676 (store (arr!45238 a!4094) i!1451 k0!2953) (size!45790 a!4094)))))

(declare-fun b!1378401 () Bool)

(declare-fun res!920976 () Bool)

(assert (=> b!1378401 (=> (not res!920976) (not e!780857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378401 (= res!920976 (validKeyInArray!0 (select (arr!45238 a!4094) i!1451)))))

(declare-fun res!920978 () Bool)

(assert (=> start!117104 (=> (not res!920978) (not e!780857))))

(assert (=> start!117104 (= res!920978 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45790 a!4094))))))

(assert (=> start!117104 e!780857))

(assert (=> start!117104 true))

(declare-fun array_inv!34471 (array!93675) Bool)

(assert (=> start!117104 (array_inv!34471 a!4094)))

(declare-fun b!1378396 () Bool)

(declare-fun res!920977 () Bool)

(assert (=> b!1378396 (=> (not res!920977) (not e!780857))))

(assert (=> b!1378396 (= res!920977 (not (validKeyInArray!0 k0!2953)))))

(assert (= (and start!117104 res!920978) b!1378401))

(assert (= (and b!1378401 res!920976) b!1378396))

(assert (= (and b!1378396 res!920977) b!1378397))

(assert (= (and b!1378397 res!920975) b!1378400))

(assert (= (and b!1378400 res!920974) b!1378398))

(assert (= (and b!1378398 (not res!920973)) b!1378399))

(declare-fun m!1262607 () Bool)

(assert (=> start!117104 m!1262607))

(declare-fun m!1262609 () Bool)

(assert (=> b!1378396 m!1262609))

(declare-fun m!1262611 () Bool)

(assert (=> b!1378401 m!1262611))

(assert (=> b!1378401 m!1262611))

(declare-fun m!1262613 () Bool)

(assert (=> b!1378401 m!1262613))

(declare-fun m!1262615 () Bool)

(assert (=> b!1378398 m!1262615))

(declare-fun m!1262617 () Bool)

(assert (=> b!1378398 m!1262617))

(declare-fun m!1262619 () Bool)

(assert (=> b!1378398 m!1262619))

(declare-fun m!1262621 () Bool)

(assert (=> b!1378398 m!1262621))

(declare-fun m!1262623 () Bool)

(assert (=> b!1378398 m!1262623))

(declare-fun m!1262625 () Bool)

(assert (=> b!1378398 m!1262625))

(declare-fun m!1262627 () Bool)

(assert (=> b!1378400 m!1262627))

(declare-fun m!1262629 () Bool)

(assert (=> b!1378400 m!1262629))

(declare-fun m!1262631 () Bool)

(assert (=> b!1378400 m!1262631))

(declare-fun m!1262633 () Bool)

(assert (=> b!1378399 m!1262633))

(declare-fun m!1262635 () Bool)

(assert (=> b!1378399 m!1262635))

(declare-fun m!1262637 () Bool)

(assert (=> b!1378399 m!1262637))

(check-sat (not b!1378401) (not b!1378398) (not b!1378399) (not start!117104) (not b!1378400) (not b!1378396))
(check-sat)
