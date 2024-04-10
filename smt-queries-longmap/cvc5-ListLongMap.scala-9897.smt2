; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117126 () Bool)

(assert start!117126)

(declare-fun b!1378627 () Bool)

(declare-fun res!921164 () Bool)

(declare-fun e!780995 () Bool)

(assert (=> b!1378627 (=> (not res!921164) (not e!780995))))

(declare-datatypes ((array!93743 0))(
  ( (array!93744 (arr!45272 (Array (_ BitVec 32) (_ BitVec 64))) (size!45822 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93743)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378627 (= res!921164 (and (bvslt (size!45822 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45822 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378628 () Bool)

(declare-fun res!921163 () Bool)

(assert (=> b!1378628 (=> (not res!921163) (not e!780995))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378628 (= res!921163 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378629 () Bool)

(declare-fun e!780998 () Bool)

(assert (=> b!1378629 (= e!780998 true)))

(declare-fun lt!606891 () array!93743)

(declare-fun arrayCountValidKeys!0 (array!93743 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378629 (= (arrayCountValidKeys!0 lt!606891 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45807 0))(
  ( (Unit!45808) )
))
(declare-fun lt!606899 () Unit!45807)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93743 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45807)

(assert (=> b!1378629 (= lt!606899 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1378630 () Bool)

(declare-fun e!780996 () Bool)

(assert (=> b!1378630 (= e!780995 e!780996)))

(declare-fun res!921165 () Bool)

(assert (=> b!1378630 (=> (not res!921165) (not e!780996))))

(declare-fun lt!606897 () (_ BitVec 32))

(declare-fun lt!606895 () (_ BitVec 32))

(assert (=> b!1378630 (= res!921165 (and (= lt!606895 (bvsub lt!606897 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378630 (= lt!606895 (arrayCountValidKeys!0 lt!606891 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378630 (= lt!606897 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378630 (= lt!606891 (array!93744 (store (arr!45272 a!4094) i!1451 k!2953) (size!45822 a!4094)))))

(declare-fun b!1378631 () Bool)

(assert (=> b!1378631 (= e!780996 (not e!780998))))

(declare-fun res!921161 () Bool)

(assert (=> b!1378631 (=> res!921161 e!780998)))

(declare-fun lt!606893 () (_ BitVec 32))

(declare-fun lt!606896 () (_ BitVec 32))

(assert (=> b!1378631 (= res!921161 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45822 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606893 (bvsub lt!606896 #b00000000000000000000000000000001)))))))

(declare-fun lt!606900 () (_ BitVec 32))

(assert (=> b!1378631 (= (bvadd lt!606900 lt!606895) lt!606893)))

(assert (=> b!1378631 (= lt!606893 (arrayCountValidKeys!0 lt!606891 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378631 (= lt!606900 (arrayCountValidKeys!0 lt!606891 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606892 () Unit!45807)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45807)

(assert (=> b!1378631 (= lt!606892 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606891 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606898 () (_ BitVec 32))

(assert (=> b!1378631 (= (bvadd lt!606898 lt!606897) lt!606896)))

(assert (=> b!1378631 (= lt!606896 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378631 (= lt!606898 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606894 () Unit!45807)

(assert (=> b!1378631 (= lt!606894 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921162 () Bool)

(assert (=> start!117126 (=> (not res!921162) (not e!780995))))

(assert (=> start!117126 (= res!921162 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45822 a!4094))))))

(assert (=> start!117126 e!780995))

(assert (=> start!117126 true))

(declare-fun array_inv!34300 (array!93743) Bool)

(assert (=> start!117126 (array_inv!34300 a!4094)))

(declare-fun b!1378632 () Bool)

(declare-fun res!921166 () Bool)

(assert (=> b!1378632 (=> (not res!921166) (not e!780995))))

(assert (=> b!1378632 (= res!921166 (validKeyInArray!0 (select (arr!45272 a!4094) i!1451)))))

(assert (= (and start!117126 res!921162) b!1378632))

(assert (= (and b!1378632 res!921166) b!1378628))

(assert (= (and b!1378628 res!921163) b!1378627))

(assert (= (and b!1378627 res!921164) b!1378630))

(assert (= (and b!1378630 res!921165) b!1378631))

(assert (= (and b!1378631 (not res!921161)) b!1378629))

(declare-fun m!1263399 () Bool)

(assert (=> b!1378631 m!1263399))

(declare-fun m!1263401 () Bool)

(assert (=> b!1378631 m!1263401))

(declare-fun m!1263403 () Bool)

(assert (=> b!1378631 m!1263403))

(declare-fun m!1263405 () Bool)

(assert (=> b!1378631 m!1263405))

(declare-fun m!1263407 () Bool)

(assert (=> b!1378631 m!1263407))

(declare-fun m!1263409 () Bool)

(assert (=> b!1378631 m!1263409))

(declare-fun m!1263411 () Bool)

(assert (=> b!1378629 m!1263411))

(declare-fun m!1263413 () Bool)

(assert (=> b!1378629 m!1263413))

(declare-fun m!1263415 () Bool)

(assert (=> b!1378629 m!1263415))

(declare-fun m!1263417 () Bool)

(assert (=> b!1378630 m!1263417))

(declare-fun m!1263419 () Bool)

(assert (=> b!1378630 m!1263419))

(declare-fun m!1263421 () Bool)

(assert (=> b!1378630 m!1263421))

(declare-fun m!1263423 () Bool)

(assert (=> start!117126 m!1263423))

(declare-fun m!1263425 () Bool)

(assert (=> b!1378632 m!1263425))

(assert (=> b!1378632 m!1263425))

(declare-fun m!1263427 () Bool)

(assert (=> b!1378632 m!1263427))

(declare-fun m!1263429 () Bool)

(assert (=> b!1378628 m!1263429))

(push 1)

(assert (not b!1378631))

(assert (not b!1378629))

(assert (not b!1378632))

(assert (not start!117126))

(assert (not b!1378630))

