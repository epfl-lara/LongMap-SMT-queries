; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36302 () Bool)

(assert start!36302)

(declare-fun b!363203 () Bool)

(declare-fun res!202510 () Bool)

(declare-fun e!222379 () Bool)

(assert (=> b!363203 (=> (not res!202510) (not e!222379))))

(declare-datatypes ((array!20578 0))(
  ( (array!20579 (arr!9768 (Array (_ BitVec 32) (_ BitVec 64))) (size!10121 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20578)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363203 (= res!202510 (not (validKeyInArray!0 (select (arr!9768 a!4337) i!1478))))))

(declare-fun b!363204 () Bool)

(declare-fun e!222378 () Bool)

(assert (=> b!363204 (= e!222379 (not e!222378))))

(declare-fun res!202506 () Bool)

(assert (=> b!363204 (=> res!202506 e!222378)))

(assert (=> b!363204 (= res!202506 (or (bvslt (size!10121 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167428 () (_ BitVec 32))

(declare-fun lt!167421 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20578 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363204 (= (bvadd lt!167428 lt!167421) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10121 a!4337)))))

(declare-datatypes ((Unit!11220 0))(
  ( (Unit!11221) )
))
(declare-fun lt!167423 () Unit!11220)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11220)

(assert (=> b!363204 (= lt!167423 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10121 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167420 () (_ BitVec 32))

(assert (=> b!363204 (= lt!167420 lt!167421)))

(assert (=> b!363204 (= lt!167421 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10121 a!4337)))))

(declare-fun lt!167427 () array!20578)

(assert (=> b!363204 (= lt!167420 (arrayCountValidKeys!0 lt!167427 (bvadd #b00000000000000000000000000000001 i!1478) (size!10121 a!4337)))))

(declare-fun lt!167426 () Unit!11220)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20578 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11220)

(assert (=> b!363204 (= lt!167426 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167425 () (_ BitVec 32))

(assert (=> b!363204 (= lt!167425 (bvadd #b00000000000000000000000000000001 lt!167428))))

(assert (=> b!363204 (= lt!167425 (arrayCountValidKeys!0 lt!167427 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363204 (= lt!167428 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363204 (= lt!167427 (array!20579 (store (arr!9768 a!4337) i!1478 k!2980) (size!10121 a!4337)))))

(declare-fun lt!167422 () Unit!11220)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20578 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11220)

(assert (=> b!363204 (= lt!167422 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363205 () Bool)

(declare-fun res!202507 () Bool)

(assert (=> b!363205 (=> (not res!202507) (not e!222379))))

(assert (=> b!363205 (= res!202507 (validKeyInArray!0 k!2980))))

(declare-fun b!363207 () Bool)

(assert (=> b!363207 (= e!222378 true)))

(assert (=> b!363207 (= (bvadd lt!167425 lt!167420) (arrayCountValidKeys!0 lt!167427 #b00000000000000000000000000000000 (size!10121 a!4337)))))

(declare-fun lt!167424 () Unit!11220)

(assert (=> b!363207 (= lt!167424 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167427 #b00000000000000000000000000000000 (size!10121 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363206 () Bool)

(declare-fun res!202508 () Bool)

(assert (=> b!363206 (=> (not res!202508) (not e!222379))))

(assert (=> b!363206 (= res!202508 (bvslt (size!10121 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!202509 () Bool)

(assert (=> start!36302 (=> (not res!202509) (not e!222379))))

(assert (=> start!36302 (= res!202509 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10121 a!4337))))))

(assert (=> start!36302 e!222379))

(assert (=> start!36302 true))

(declare-fun array_inv!7217 (array!20578) Bool)

(assert (=> start!36302 (array_inv!7217 a!4337)))

(assert (= (and start!36302 res!202509) b!363203))

(assert (= (and b!363203 res!202510) b!363205))

(assert (= (and b!363205 res!202507) b!363206))

(assert (= (and b!363206 res!202508) b!363204))

(assert (= (and b!363204 (not res!202506)) b!363207))

(declare-fun m!359815 () Bool)

(assert (=> b!363204 m!359815))

(declare-fun m!359817 () Bool)

(assert (=> b!363204 m!359817))

(declare-fun m!359819 () Bool)

(assert (=> b!363204 m!359819))

(declare-fun m!359821 () Bool)

(assert (=> b!363204 m!359821))

(declare-fun m!359823 () Bool)

(assert (=> b!363204 m!359823))

(declare-fun m!359825 () Bool)

(assert (=> b!363204 m!359825))

(declare-fun m!359827 () Bool)

(assert (=> b!363204 m!359827))

(declare-fun m!359829 () Bool)

(assert (=> b!363204 m!359829))

(declare-fun m!359831 () Bool)

(assert (=> b!363204 m!359831))

(declare-fun m!359833 () Bool)

(assert (=> b!363205 m!359833))

(declare-fun m!359835 () Bool)

(assert (=> b!363207 m!359835))

(declare-fun m!359837 () Bool)

(assert (=> b!363207 m!359837))

(declare-fun m!359839 () Bool)

(assert (=> start!36302 m!359839))

(declare-fun m!359841 () Bool)

(assert (=> b!363203 m!359841))

(assert (=> b!363203 m!359841))

(declare-fun m!359843 () Bool)

(assert (=> b!363203 m!359843))

(push 1)

(assert (not b!363207))

(assert (not b!363205))

(assert (not b!363203))

(assert (not b!363204))

(assert (not start!36302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

