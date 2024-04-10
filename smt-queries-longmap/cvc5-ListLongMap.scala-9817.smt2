; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116552 () Bool)

(assert start!116552)

(declare-fun b!1374576 () Bool)

(declare-fun res!917763 () Bool)

(declare-fun e!778709 () Bool)

(assert (=> b!1374576 (=> (not res!917763) (not e!778709))))

(declare-datatypes ((array!93252 0))(
  ( (array!93253 (arr!45032 (Array (_ BitVec 32) (_ BitVec 64))) (size!45582 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93252)

(assert (=> b!1374576 (= res!917763 (bvslt (size!45582 a!4142) #b01111111111111111111111111111111))))

(declare-fun res!917764 () Bool)

(assert (=> start!116552 (=> (not res!917764) (not e!778709))))

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> start!116552 (= res!917764 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45582 a!4142))))))

(assert (=> start!116552 e!778709))

(assert (=> start!116552 true))

(declare-fun array_inv!34060 (array!93252) Bool)

(assert (=> start!116552 (array_inv!34060 a!4142)))

(declare-fun b!1374577 () Bool)

(declare-fun res!917760 () Bool)

(assert (=> b!1374577 (=> (not res!917760) (not e!778709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374577 (= res!917760 (validKeyInArray!0 (select (arr!45032 a!4142) i!1457)))))

(declare-fun b!1374578 () Bool)

(declare-fun e!778710 () Bool)

(assert (=> b!1374578 (= e!778709 (not e!778710))))

(declare-fun res!917762 () Bool)

(assert (=> b!1374578 (=> res!917762 e!778710)))

(assert (=> b!1374578 (= res!917762 (or (bvslt (size!45582 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603804 () (_ BitVec 32))

(declare-fun lt!603807 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93252 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374578 (= (bvadd lt!603804 lt!603807) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45582 a!4142)))))

(declare-datatypes ((Unit!45465 0))(
  ( (Unit!45466) )
))
(declare-fun lt!603806 () Unit!45465)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93252 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45465)

(assert (=> b!1374578 (= lt!603806 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45582 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603800 () (_ BitVec 32))

(assert (=> b!1374578 (= lt!603800 lt!603807)))

(assert (=> b!1374578 (= lt!603807 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45582 a!4142)))))

(declare-fun lt!603803 () array!93252)

(assert (=> b!1374578 (= lt!603800 (arrayCountValidKeys!0 lt!603803 (bvadd #b00000000000000000000000000000001 i!1457) (size!45582 a!4142)))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lt!603802 () Unit!45465)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93252 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45465)

(assert (=> b!1374578 (= lt!603802 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603805 () (_ BitVec 32))

(assert (=> b!1374578 (= lt!603805 (bvsub lt!603804 #b00000000000000000000000000000001))))

(assert (=> b!1374578 (= lt!603805 (arrayCountValidKeys!0 lt!603803 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374578 (= lt!603804 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374578 (= lt!603803 (array!93253 (store (arr!45032 a!4142) i!1457 k!2959) (size!45582 a!4142)))))

(declare-fun lt!603801 () Unit!45465)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93252 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45465)

(assert (=> b!1374578 (= lt!603801 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374579 () Bool)

(assert (=> b!1374579 (= e!778710 true)))

(assert (=> b!1374579 (= (bvadd lt!603805 lt!603800) (arrayCountValidKeys!0 lt!603803 #b00000000000000000000000000000000 (size!45582 a!4142)))))

(declare-fun lt!603808 () Unit!45465)

(assert (=> b!1374579 (= lt!603808 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603803 #b00000000000000000000000000000000 (size!45582 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374580 () Bool)

(declare-fun res!917761 () Bool)

(assert (=> b!1374580 (=> (not res!917761) (not e!778709))))

(assert (=> b!1374580 (= res!917761 (not (validKeyInArray!0 k!2959)))))

(assert (= (and start!116552 res!917764) b!1374577))

(assert (= (and b!1374577 res!917760) b!1374580))

(assert (= (and b!1374580 res!917761) b!1374576))

(assert (= (and b!1374576 res!917763) b!1374578))

(assert (= (and b!1374578 (not res!917762)) b!1374579))

(declare-fun m!1258087 () Bool)

(assert (=> start!116552 m!1258087))

(declare-fun m!1258089 () Bool)

(assert (=> b!1374578 m!1258089))

(declare-fun m!1258091 () Bool)

(assert (=> b!1374578 m!1258091))

(declare-fun m!1258093 () Bool)

(assert (=> b!1374578 m!1258093))

(declare-fun m!1258095 () Bool)

(assert (=> b!1374578 m!1258095))

(declare-fun m!1258097 () Bool)

(assert (=> b!1374578 m!1258097))

(declare-fun m!1258099 () Bool)

(assert (=> b!1374578 m!1258099))

(declare-fun m!1258101 () Bool)

(assert (=> b!1374578 m!1258101))

(declare-fun m!1258103 () Bool)

(assert (=> b!1374578 m!1258103))

(declare-fun m!1258105 () Bool)

(assert (=> b!1374578 m!1258105))

(declare-fun m!1258107 () Bool)

(assert (=> b!1374579 m!1258107))

(declare-fun m!1258109 () Bool)

(assert (=> b!1374579 m!1258109))

(declare-fun m!1258111 () Bool)

(assert (=> b!1374577 m!1258111))

(assert (=> b!1374577 m!1258111))

(declare-fun m!1258113 () Bool)

(assert (=> b!1374577 m!1258113))

(declare-fun m!1258115 () Bool)

(assert (=> b!1374580 m!1258115))

(push 1)

(assert (not b!1374577))

(assert (not b!1374579))

(assert (not b!1374578))

(assert (not b!1374580))

(assert (not start!116552))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

