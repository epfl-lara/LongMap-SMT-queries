; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117122 () Bool)

(assert start!117122)

(declare-fun res!921129 () Bool)

(declare-fun e!780973 () Bool)

(assert (=> start!117122 (=> (not res!921129) (not e!780973))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93739 0))(
  ( (array!93740 (arr!45270 (Array (_ BitVec 32) (_ BitVec 64))) (size!45820 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93739)

(assert (=> start!117122 (= res!921129 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45820 a!4094))))))

(assert (=> start!117122 e!780973))

(assert (=> start!117122 true))

(declare-fun array_inv!34298 (array!93739) Bool)

(assert (=> start!117122 (array_inv!34298 a!4094)))

(declare-fun b!1378591 () Bool)

(declare-fun res!921126 () Bool)

(assert (=> b!1378591 (=> (not res!921126) (not e!780973))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378591 (= res!921126 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1378592 () Bool)

(declare-fun e!780972 () Bool)

(assert (=> b!1378592 (= e!780972 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606836 () array!93739)

(declare-fun arrayCountValidKeys!0 (array!93739 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378592 (= (arrayCountValidKeys!0 lt!606836 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-datatypes ((Unit!45803 0))(
  ( (Unit!45804) )
))
(declare-fun lt!606831 () Unit!45803)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93739 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45803)

(assert (=> b!1378592 (= lt!606831 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k0!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1378593 () Bool)

(declare-fun res!921125 () Bool)

(assert (=> b!1378593 (=> (not res!921125) (not e!780973))))

(assert (=> b!1378593 (= res!921125 (and (bvslt (size!45820 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45820 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378594 () Bool)

(declare-fun res!921130 () Bool)

(assert (=> b!1378594 (=> (not res!921130) (not e!780973))))

(assert (=> b!1378594 (= res!921130 (validKeyInArray!0 (select (arr!45270 a!4094) i!1451)))))

(declare-fun b!1378595 () Bool)

(declare-fun e!780974 () Bool)

(assert (=> b!1378595 (= e!780973 e!780974)))

(declare-fun res!921128 () Bool)

(assert (=> b!1378595 (=> (not res!921128) (not e!780974))))

(declare-fun lt!606835 () (_ BitVec 32))

(declare-fun lt!606840 () (_ BitVec 32))

(assert (=> b!1378595 (= res!921128 (and (= lt!606835 (bvsub lt!606840 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378595 (= lt!606835 (arrayCountValidKeys!0 lt!606836 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378595 (= lt!606840 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378595 (= lt!606836 (array!93740 (store (arr!45270 a!4094) i!1451 k0!2953) (size!45820 a!4094)))))

(declare-fun b!1378596 () Bool)

(assert (=> b!1378596 (= e!780974 (not e!780972))))

(declare-fun res!921127 () Bool)

(assert (=> b!1378596 (=> res!921127 e!780972)))

(declare-fun lt!606834 () (_ BitVec 32))

(declare-fun lt!606833 () (_ BitVec 32))

(assert (=> b!1378596 (= res!921127 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45820 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606833 (bvsub lt!606834 #b00000000000000000000000000000001)))))))

(declare-fun lt!606838 () (_ BitVec 32))

(assert (=> b!1378596 (= (bvadd lt!606838 lt!606835) lt!606833)))

(assert (=> b!1378596 (= lt!606833 (arrayCountValidKeys!0 lt!606836 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378596 (= lt!606838 (arrayCountValidKeys!0 lt!606836 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606837 () Unit!45803)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45803)

(assert (=> b!1378596 (= lt!606837 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606836 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606839 () (_ BitVec 32))

(assert (=> b!1378596 (= (bvadd lt!606839 lt!606840) lt!606834)))

(assert (=> b!1378596 (= lt!606834 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378596 (= lt!606839 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606832 () Unit!45803)

(assert (=> b!1378596 (= lt!606832 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117122 res!921129) b!1378594))

(assert (= (and b!1378594 res!921130) b!1378591))

(assert (= (and b!1378591 res!921126) b!1378593))

(assert (= (and b!1378593 res!921125) b!1378595))

(assert (= (and b!1378595 res!921128) b!1378596))

(assert (= (and b!1378596 (not res!921127)) b!1378592))

(declare-fun m!1263335 () Bool)

(assert (=> b!1378596 m!1263335))

(declare-fun m!1263337 () Bool)

(assert (=> b!1378596 m!1263337))

(declare-fun m!1263339 () Bool)

(assert (=> b!1378596 m!1263339))

(declare-fun m!1263341 () Bool)

(assert (=> b!1378596 m!1263341))

(declare-fun m!1263343 () Bool)

(assert (=> b!1378596 m!1263343))

(declare-fun m!1263345 () Bool)

(assert (=> b!1378596 m!1263345))

(declare-fun m!1263347 () Bool)

(assert (=> b!1378594 m!1263347))

(assert (=> b!1378594 m!1263347))

(declare-fun m!1263349 () Bool)

(assert (=> b!1378594 m!1263349))

(declare-fun m!1263351 () Bool)

(assert (=> b!1378595 m!1263351))

(declare-fun m!1263353 () Bool)

(assert (=> b!1378595 m!1263353))

(declare-fun m!1263355 () Bool)

(assert (=> b!1378595 m!1263355))

(declare-fun m!1263357 () Bool)

(assert (=> b!1378591 m!1263357))

(declare-fun m!1263359 () Bool)

(assert (=> start!117122 m!1263359))

(declare-fun m!1263361 () Bool)

(assert (=> b!1378592 m!1263361))

(declare-fun m!1263363 () Bool)

(assert (=> b!1378592 m!1263363))

(declare-fun m!1263365 () Bool)

(assert (=> b!1378592 m!1263365))

(check-sat (not b!1378594) (not b!1378592) (not start!117122) (not b!1378595) (not b!1378596) (not b!1378591))
(check-sat)
