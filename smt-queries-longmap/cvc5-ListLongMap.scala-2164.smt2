; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36308 () Bool)

(assert start!36308)

(declare-fun b!363248 () Bool)

(declare-fun res!202552 () Bool)

(declare-fun e!222406 () Bool)

(assert (=> b!363248 (=> (not res!202552) (not e!222406))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363248 (= res!202552 (validKeyInArray!0 k!2980))))

(declare-fun b!363249 () Bool)

(declare-fun e!222405 () Bool)

(assert (=> b!363249 (= e!222406 (not e!222405))))

(declare-fun res!202555 () Bool)

(assert (=> b!363249 (=> res!202555 e!222405)))

(declare-datatypes ((array!20584 0))(
  ( (array!20585 (arr!9771 (Array (_ BitVec 32) (_ BitVec 64))) (size!10124 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20584)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!363249 (= res!202555 (or (bvslt (size!10124 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167519 () (_ BitVec 32))

(declare-fun lt!167521 () (_ BitVec 32))

(declare-fun lt!167522 () (_ BitVec 32))

(assert (=> b!363249 (= (bvadd lt!167519 lt!167521) lt!167522)))

(declare-fun arrayCountValidKeys!0 (array!20584 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363249 (= lt!167522 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10124 a!4337)))))

(declare-datatypes ((Unit!11226 0))(
  ( (Unit!11227) )
))
(declare-fun lt!167517 () Unit!11226)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11226)

(assert (=> b!363249 (= lt!167517 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10124 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167524 () (_ BitVec 32))

(assert (=> b!363249 (= lt!167524 lt!167521)))

(assert (=> b!363249 (= lt!167521 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10124 a!4337)))))

(declare-fun lt!167518 () array!20584)

(assert (=> b!363249 (= lt!167524 (arrayCountValidKeys!0 lt!167518 (bvadd #b00000000000000000000000000000001 i!1478) (size!10124 a!4337)))))

(declare-fun lt!167523 () Unit!11226)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20584 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11226)

(assert (=> b!363249 (= lt!167523 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167526 () (_ BitVec 32))

(assert (=> b!363249 (= lt!167526 (bvadd #b00000000000000000000000000000001 lt!167519))))

(assert (=> b!363249 (= lt!167526 (arrayCountValidKeys!0 lt!167518 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363249 (= lt!167519 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363249 (= lt!167518 (array!20585 (store (arr!9771 a!4337) i!1478 k!2980) (size!10124 a!4337)))))

(declare-fun lt!167527 () Unit!11226)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20584 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11226)

(assert (=> b!363249 (= lt!167527 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363251 () Bool)

(declare-fun lt!167525 () (_ BitVec 32))

(assert (=> b!363251 (= e!222405 (= lt!167525 (bvadd #b00000000000000000000000000000001 lt!167522)))))

(assert (=> b!363251 (= (bvadd lt!167526 lt!167524) lt!167525)))

(assert (=> b!363251 (= lt!167525 (arrayCountValidKeys!0 lt!167518 #b00000000000000000000000000000000 (size!10124 a!4337)))))

(declare-fun lt!167520 () Unit!11226)

(assert (=> b!363251 (= lt!167520 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167518 #b00000000000000000000000000000000 (size!10124 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363252 () Bool)

(declare-fun res!202554 () Bool)

(assert (=> b!363252 (=> (not res!202554) (not e!222406))))

(assert (=> b!363252 (= res!202554 (not (validKeyInArray!0 (select (arr!9771 a!4337) i!1478))))))

(declare-fun res!202553 () Bool)

(assert (=> start!36308 (=> (not res!202553) (not e!222406))))

(assert (=> start!36308 (= res!202553 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10124 a!4337))))))

(assert (=> start!36308 e!222406))

(assert (=> start!36308 true))

(declare-fun array_inv!7220 (array!20584) Bool)

(assert (=> start!36308 (array_inv!7220 a!4337)))

(declare-fun b!363250 () Bool)

(declare-fun res!202551 () Bool)

(assert (=> b!363250 (=> (not res!202551) (not e!222406))))

(assert (=> b!363250 (= res!202551 (bvslt (size!10124 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36308 res!202553) b!363252))

(assert (= (and b!363252 res!202554) b!363248))

(assert (= (and b!363248 res!202552) b!363250))

(assert (= (and b!363250 res!202551) b!363249))

(assert (= (and b!363249 (not res!202555)) b!363251))

(declare-fun m!359905 () Bool)

(assert (=> start!36308 m!359905))

(declare-fun m!359907 () Bool)

(assert (=> b!363252 m!359907))

(assert (=> b!363252 m!359907))

(declare-fun m!359909 () Bool)

(assert (=> b!363252 m!359909))

(declare-fun m!359911 () Bool)

(assert (=> b!363248 m!359911))

(declare-fun m!359913 () Bool)

(assert (=> b!363251 m!359913))

(declare-fun m!359915 () Bool)

(assert (=> b!363251 m!359915))

(declare-fun m!359917 () Bool)

(assert (=> b!363249 m!359917))

(declare-fun m!359919 () Bool)

(assert (=> b!363249 m!359919))

(declare-fun m!359921 () Bool)

(assert (=> b!363249 m!359921))

(declare-fun m!359923 () Bool)

(assert (=> b!363249 m!359923))

(declare-fun m!359925 () Bool)

(assert (=> b!363249 m!359925))

(declare-fun m!359927 () Bool)

(assert (=> b!363249 m!359927))

(declare-fun m!359929 () Bool)

(assert (=> b!363249 m!359929))

(declare-fun m!359931 () Bool)

(assert (=> b!363249 m!359931))

(declare-fun m!359933 () Bool)

(assert (=> b!363249 m!359933))

(push 1)

(assert (not start!36308))

(assert (not b!363249))

(assert (not b!363252))

(assert (not b!363251))

(assert (not b!363248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

