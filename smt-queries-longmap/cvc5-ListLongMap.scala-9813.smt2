; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116756 () Bool)

(assert start!116756)

(declare-fun b!1375729 () Bool)

(declare-fun e!779463 () Bool)

(assert (=> b!1375729 (= e!779463 (not true))))

(declare-fun lt!604011 () (_ BitVec 32))

(declare-fun lt!604008 () (_ BitVec 32))

(declare-datatypes ((array!93347 0))(
  ( (array!93348 (arr!45075 (Array (_ BitVec 32) (_ BitVec 64))) (size!45626 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93347)

(declare-fun arrayCountValidKeys!0 (array!93347 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375729 (= (bvadd lt!604011 lt!604008) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45626 a!4142)))))

(declare-datatypes ((Unit!45384 0))(
  ( (Unit!45385) )
))
(declare-fun lt!604012 () Unit!45384)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45384)

(assert (=> b!1375729 (= lt!604012 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45626 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604013 () (_ BitVec 32))

(assert (=> b!1375729 (= lt!604013 lt!604008)))

(assert (=> b!1375729 (= lt!604008 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45626 a!4142)))))

(declare-fun lt!604014 () array!93347)

(assert (=> b!1375729 (= lt!604013 (arrayCountValidKeys!0 lt!604014 (bvadd #b00000000000000000000000000000001 i!1457) (size!45626 a!4142)))))

(declare-fun lt!604009 () Unit!45384)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45384)

(assert (=> b!1375729 (= lt!604009 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375729 (= (arrayCountValidKeys!0 lt!604014 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!604011 #b00000000000000000000000000000001))))

(assert (=> b!1375729 (= lt!604011 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375729 (= lt!604014 (array!93348 (store (arr!45075 a!4142) i!1457 k!2959) (size!45626 a!4142)))))

(declare-fun lt!604010 () Unit!45384)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45384)

(assert (=> b!1375729 (= lt!604010 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375728 () Bool)

(declare-fun res!918130 () Bool)

(assert (=> b!1375728 (=> (not res!918130) (not e!779463))))

(assert (=> b!1375728 (= res!918130 (bvslt (size!45626 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375726 () Bool)

(declare-fun res!918131 () Bool)

(assert (=> b!1375726 (=> (not res!918131) (not e!779463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375726 (= res!918131 (validKeyInArray!0 (select (arr!45075 a!4142) i!1457)))))

(declare-fun res!918132 () Bool)

(assert (=> start!116756 (=> (not res!918132) (not e!779463))))

(assert (=> start!116756 (= res!918132 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45626 a!4142))))))

(assert (=> start!116756 e!779463))

(assert (=> start!116756 true))

(declare-fun array_inv!34356 (array!93347) Bool)

(assert (=> start!116756 (array_inv!34356 a!4142)))

(declare-fun b!1375727 () Bool)

(declare-fun res!918129 () Bool)

(assert (=> b!1375727 (=> (not res!918129) (not e!779463))))

(assert (=> b!1375727 (= res!918129 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116756 res!918132) b!1375726))

(assert (= (and b!1375726 res!918131) b!1375727))

(assert (= (and b!1375727 res!918129) b!1375728))

(assert (= (and b!1375728 res!918130) b!1375729))

(declare-fun m!1259387 () Bool)

(assert (=> b!1375729 m!1259387))

(declare-fun m!1259389 () Bool)

(assert (=> b!1375729 m!1259389))

(declare-fun m!1259391 () Bool)

(assert (=> b!1375729 m!1259391))

(declare-fun m!1259393 () Bool)

(assert (=> b!1375729 m!1259393))

(declare-fun m!1259395 () Bool)

(assert (=> b!1375729 m!1259395))

(declare-fun m!1259397 () Bool)

(assert (=> b!1375729 m!1259397))

(declare-fun m!1259399 () Bool)

(assert (=> b!1375729 m!1259399))

(declare-fun m!1259401 () Bool)

(assert (=> b!1375729 m!1259401))

(declare-fun m!1259403 () Bool)

(assert (=> b!1375729 m!1259403))

(declare-fun m!1259405 () Bool)

(assert (=> b!1375726 m!1259405))

(assert (=> b!1375726 m!1259405))

(declare-fun m!1259407 () Bool)

(assert (=> b!1375726 m!1259407))

(declare-fun m!1259409 () Bool)

(assert (=> start!116756 m!1259409))

(declare-fun m!1259411 () Bool)

(assert (=> b!1375727 m!1259411))

(push 1)

(assert (not b!1375727))

(assert (not b!1375729))

(assert (not start!116756))

(assert (not b!1375726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

