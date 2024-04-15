; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116660 () Bool)

(assert start!116660)

(declare-fun b!1375112 () Bool)

(declare-fun e!779001 () Bool)

(declare-fun e!779000 () Bool)

(assert (=> b!1375112 (= e!779001 (not e!779000))))

(declare-fun res!918215 () Bool)

(assert (=> b!1375112 (=> res!918215 e!779000)))

(declare-datatypes ((array!93283 0))(
  ( (array!93284 (arr!45045 (Array (_ BitVec 32) (_ BitVec 64))) (size!45597 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93283)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1375112 (= res!918215 (or (bvslt (size!45597 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!604011 () (_ BitVec 32))

(declare-fun lt!604009 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93283 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375112 (= (bvadd lt!604011 lt!604009) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45597 a!4142)))))

(declare-datatypes ((Unit!45370 0))(
  ( (Unit!45371) )
))
(declare-fun lt!604008 () Unit!45370)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93283 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45370)

(assert (=> b!1375112 (= lt!604008 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45597 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604006 () (_ BitVec 32))

(assert (=> b!1375112 (= lt!604006 lt!604009)))

(assert (=> b!1375112 (= lt!604009 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45597 a!4142)))))

(declare-fun lt!604013 () array!93283)

(assert (=> b!1375112 (= lt!604006 (arrayCountValidKeys!0 lt!604013 (bvadd #b00000000000000000000000000000001 i!1457) (size!45597 a!4142)))))

(declare-fun lt!604005 () Unit!45370)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93283 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45370)

(assert (=> b!1375112 (= lt!604005 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604012 () (_ BitVec 32))

(assert (=> b!1375112 (= lt!604012 (bvsub lt!604011 #b00000000000000000000000000000001))))

(assert (=> b!1375112 (= lt!604012 (arrayCountValidKeys!0 lt!604013 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375112 (= lt!604011 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375112 (= lt!604013 (array!93284 (store (arr!45045 a!4142) i!1457 k!2959) (size!45597 a!4142)))))

(declare-fun lt!604010 () Unit!45370)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93283 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45370)

(assert (=> b!1375112 (= lt!604010 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375113 () Bool)

(declare-fun res!918212 () Bool)

(assert (=> b!1375113 (=> (not res!918212) (not e!779001))))

(assert (=> b!1375113 (= res!918212 (bvslt (size!45597 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!918213 () Bool)

(assert (=> start!116660 (=> (not res!918213) (not e!779001))))

(assert (=> start!116660 (= res!918213 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45597 a!4142))))))

(assert (=> start!116660 e!779001))

(assert (=> start!116660 true))

(declare-fun array_inv!34278 (array!93283) Bool)

(assert (=> start!116660 (array_inv!34278 a!4142)))

(declare-fun b!1375114 () Bool)

(declare-fun res!918211 () Bool)

(assert (=> b!1375114 (=> (not res!918211) (not e!779001))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375114 (= res!918211 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375115 () Bool)

(assert (=> b!1375115 (= e!779000 true)))

(assert (=> b!1375115 (= (bvadd lt!604012 lt!604006) (arrayCountValidKeys!0 lt!604013 #b00000000000000000000000000000000 (size!45597 a!4142)))))

(declare-fun lt!604007 () Unit!45370)

(assert (=> b!1375115 (= lt!604007 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!604013 #b00000000000000000000000000000000 (size!45597 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375116 () Bool)

(declare-fun res!918214 () Bool)

(assert (=> b!1375116 (=> (not res!918214) (not e!779001))))

(assert (=> b!1375116 (= res!918214 (validKeyInArray!0 (select (arr!45045 a!4142) i!1457)))))

(assert (= (and start!116660 res!918213) b!1375116))

(assert (= (and b!1375116 res!918214) b!1375114))

(assert (= (and b!1375114 res!918211) b!1375113))

(assert (= (and b!1375113 res!918212) b!1375112))

(assert (= (and b!1375112 (not res!918215)) b!1375115))

(declare-fun m!1258425 () Bool)

(assert (=> b!1375115 m!1258425))

(declare-fun m!1258427 () Bool)

(assert (=> b!1375115 m!1258427))

(declare-fun m!1258429 () Bool)

(assert (=> b!1375112 m!1258429))

(declare-fun m!1258431 () Bool)

(assert (=> b!1375112 m!1258431))

(declare-fun m!1258433 () Bool)

(assert (=> b!1375112 m!1258433))

(declare-fun m!1258435 () Bool)

(assert (=> b!1375112 m!1258435))

(declare-fun m!1258437 () Bool)

(assert (=> b!1375112 m!1258437))

(declare-fun m!1258439 () Bool)

(assert (=> b!1375112 m!1258439))

(declare-fun m!1258441 () Bool)

(assert (=> b!1375112 m!1258441))

(declare-fun m!1258443 () Bool)

(assert (=> b!1375112 m!1258443))

(declare-fun m!1258445 () Bool)

(assert (=> b!1375112 m!1258445))

(declare-fun m!1258447 () Bool)

(assert (=> b!1375114 m!1258447))

(declare-fun m!1258449 () Bool)

(assert (=> b!1375116 m!1258449))

(assert (=> b!1375116 m!1258449))

(declare-fun m!1258451 () Bool)

(assert (=> b!1375116 m!1258451))

(declare-fun m!1258453 () Bool)

(assert (=> start!116660 m!1258453))

(push 1)

(assert (not b!1375112))

(assert (not b!1375116))

(assert (not b!1375115))

(assert (not start!116660))

(assert (not b!1375114))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

