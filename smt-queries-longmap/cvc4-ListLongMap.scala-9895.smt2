; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117112 () Bool)

(assert start!117112)

(declare-fun b!1378468 () Bool)

(declare-fun e!780906 () Bool)

(assert (=> b!1378468 (= e!780906 true)))

(declare-datatypes ((array!93683 0))(
  ( (array!93684 (arr!45242 (Array (_ BitVec 32) (_ BitVec 64))) (size!45794 (_ BitVec 32))) )
))
(declare-fun lt!606562 () array!93683)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun a!4094 () array!93683)

(declare-fun arrayCountValidKeys!0 (array!93683 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378468 (= (arrayCountValidKeys!0 lt!606562 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45638 0))(
  ( (Unit!45639) )
))
(declare-fun lt!606558 () Unit!45638)

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93683 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45638)

(assert (=> b!1378468 (= lt!606558 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1378469 () Bool)

(declare-fun res!921049 () Bool)

(declare-fun e!780907 () Bool)

(assert (=> b!1378469 (=> (not res!921049) (not e!780907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378469 (= res!921049 (validKeyInArray!0 (select (arr!45242 a!4094) i!1451)))))

(declare-fun b!1378470 () Bool)

(declare-fun res!921047 () Bool)

(assert (=> b!1378470 (=> (not res!921047) (not e!780907))))

(assert (=> b!1378470 (= res!921047 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378471 () Bool)

(declare-fun e!780904 () Bool)

(assert (=> b!1378471 (= e!780904 (not e!780906))))

(declare-fun res!921050 () Bool)

(assert (=> b!1378471 (=> res!921050 e!780906)))

(declare-fun lt!606565 () (_ BitVec 32))

(declare-fun lt!606563 () (_ BitVec 32))

(assert (=> b!1378471 (= res!921050 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45794 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606565 (bvsub lt!606563 #b00000000000000000000000000000001)))))))

(declare-fun lt!606557 () (_ BitVec 32))

(declare-fun lt!606560 () (_ BitVec 32))

(assert (=> b!1378471 (= (bvadd lt!606557 lt!606560) lt!606565)))

(assert (=> b!1378471 (= lt!606565 (arrayCountValidKeys!0 lt!606562 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378471 (= lt!606557 (arrayCountValidKeys!0 lt!606562 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606566 () Unit!45638)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45638)

(assert (=> b!1378471 (= lt!606566 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606562 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606559 () (_ BitVec 32))

(declare-fun lt!606561 () (_ BitVec 32))

(assert (=> b!1378471 (= (bvadd lt!606559 lt!606561) lt!606563)))

(assert (=> b!1378471 (= lt!606563 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378471 (= lt!606559 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606564 () Unit!45638)

(assert (=> b!1378471 (= lt!606564 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378472 () Bool)

(assert (=> b!1378472 (= e!780907 e!780904)))

(declare-fun res!921046 () Bool)

(assert (=> b!1378472 (=> (not res!921046) (not e!780904))))

(assert (=> b!1378472 (= res!921046 (and (= lt!606560 (bvsub lt!606561 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378472 (= lt!606560 (arrayCountValidKeys!0 lt!606562 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378472 (= lt!606561 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378472 (= lt!606562 (array!93684 (store (arr!45242 a!4094) i!1451 k!2953) (size!45794 a!4094)))))

(declare-fun res!921045 () Bool)

(assert (=> start!117112 (=> (not res!921045) (not e!780907))))

(assert (=> start!117112 (= res!921045 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45794 a!4094))))))

(assert (=> start!117112 e!780907))

(assert (=> start!117112 true))

(declare-fun array_inv!34475 (array!93683) Bool)

(assert (=> start!117112 (array_inv!34475 a!4094)))

(declare-fun b!1378473 () Bool)

(declare-fun res!921048 () Bool)

(assert (=> b!1378473 (=> (not res!921048) (not e!780907))))

(assert (=> b!1378473 (= res!921048 (and (bvslt (size!45794 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45794 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117112 res!921045) b!1378469))

(assert (= (and b!1378469 res!921049) b!1378470))

(assert (= (and b!1378470 res!921047) b!1378473))

(assert (= (and b!1378473 res!921048) b!1378472))

(assert (= (and b!1378472 res!921046) b!1378471))

(assert (= (and b!1378471 (not res!921050)) b!1378468))

(declare-fun m!1262735 () Bool)

(assert (=> b!1378471 m!1262735))

(declare-fun m!1262737 () Bool)

(assert (=> b!1378471 m!1262737))

(declare-fun m!1262739 () Bool)

(assert (=> b!1378471 m!1262739))

(declare-fun m!1262741 () Bool)

(assert (=> b!1378471 m!1262741))

(declare-fun m!1262743 () Bool)

(assert (=> b!1378471 m!1262743))

(declare-fun m!1262745 () Bool)

(assert (=> b!1378471 m!1262745))

(declare-fun m!1262747 () Bool)

(assert (=> start!117112 m!1262747))

(declare-fun m!1262749 () Bool)

(assert (=> b!1378468 m!1262749))

(declare-fun m!1262751 () Bool)

(assert (=> b!1378468 m!1262751))

(declare-fun m!1262753 () Bool)

(assert (=> b!1378468 m!1262753))

(declare-fun m!1262755 () Bool)

(assert (=> b!1378470 m!1262755))

(declare-fun m!1262757 () Bool)

(assert (=> b!1378472 m!1262757))

(declare-fun m!1262759 () Bool)

(assert (=> b!1378472 m!1262759))

(declare-fun m!1262761 () Bool)

(assert (=> b!1378472 m!1262761))

(declare-fun m!1262763 () Bool)

(assert (=> b!1378469 m!1262763))

(assert (=> b!1378469 m!1262763))

(declare-fun m!1262765 () Bool)

(assert (=> b!1378469 m!1262765))

(push 1)

(assert (not b!1378468))

(assert (not b!1378472))

(assert (not b!1378469))

(assert (not start!117112))

(assert (not b!1378470))

(assert (not b!1378471))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

