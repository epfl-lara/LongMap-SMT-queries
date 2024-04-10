; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36312 () Bool)

(assert start!36312)

(declare-fun b!363444 () Bool)

(declare-fun e!222535 () Bool)

(assert (=> b!363444 (= e!222535 true)))

(declare-datatypes ((array!20592 0))(
  ( (array!20593 (arr!9775 (Array (_ BitVec 32) (_ BitVec 64))) (size!10127 (_ BitVec 32))) )
))
(declare-fun lt!167605 () array!20592)

(declare-fun lt!167602 () (_ BitVec 32))

(declare-fun lt!167603 () (_ BitVec 32))

(declare-fun a!4337 () array!20592)

(declare-fun arrayCountValidKeys!0 (array!20592 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363444 (= (bvadd lt!167603 lt!167602) (arrayCountValidKeys!0 lt!167605 #b00000000000000000000000000000000 (size!10127 a!4337)))))

(declare-datatypes ((Unit!11238 0))(
  ( (Unit!11239) )
))
(declare-fun lt!167606 () Unit!11238)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11238)

(assert (=> b!363444 (= lt!167606 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167605 #b00000000000000000000000000000000 (size!10127 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363445 () Bool)

(declare-fun res!202608 () Bool)

(declare-fun e!222534 () Bool)

(assert (=> b!363445 (=> (not res!202608) (not e!222534))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363445 (= res!202608 (validKeyInArray!0 k!2980))))

(declare-fun b!363446 () Bool)

(declare-fun res!202609 () Bool)

(assert (=> b!363446 (=> (not res!202609) (not e!222534))))

(assert (=> b!363446 (= res!202609 (not (validKeyInArray!0 (select (arr!9775 a!4337) i!1478))))))

(declare-fun b!363447 () Bool)

(assert (=> b!363447 (= e!222534 (not e!222535))))

(declare-fun res!202607 () Bool)

(assert (=> b!363447 (=> res!202607 e!222535)))

(assert (=> b!363447 (= res!202607 (or (bvslt (size!10127 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167607 () (_ BitVec 32))

(declare-fun lt!167601 () (_ BitVec 32))

(assert (=> b!363447 (= (bvadd lt!167607 lt!167601) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10127 a!4337)))))

(declare-fun lt!167600 () Unit!11238)

(assert (=> b!363447 (= lt!167600 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10127 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363447 (= lt!167602 lt!167601)))

(assert (=> b!363447 (= lt!167601 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10127 a!4337)))))

(assert (=> b!363447 (= lt!167602 (arrayCountValidKeys!0 lt!167605 (bvadd #b00000000000000000000000000000001 i!1478) (size!10127 a!4337)))))

(declare-fun lt!167608 () Unit!11238)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20592 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11238)

(assert (=> b!363447 (= lt!167608 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363447 (= lt!167603 (bvadd #b00000000000000000000000000000001 lt!167607))))

(assert (=> b!363447 (= lt!167603 (arrayCountValidKeys!0 lt!167605 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363447 (= lt!167607 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363447 (= lt!167605 (array!20593 (store (arr!9775 a!4337) i!1478 k!2980) (size!10127 a!4337)))))

(declare-fun lt!167604 () Unit!11238)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20592 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11238)

(assert (=> b!363447 (= lt!167604 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363448 () Bool)

(declare-fun res!202606 () Bool)

(assert (=> b!363448 (=> (not res!202606) (not e!222534))))

(assert (=> b!363448 (= res!202606 (bvslt (size!10127 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!202605 () Bool)

(assert (=> start!36312 (=> (not res!202605) (not e!222534))))

(assert (=> start!36312 (= res!202605 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10127 a!4337))))))

(assert (=> start!36312 e!222534))

(assert (=> start!36312 true))

(declare-fun array_inv!7217 (array!20592) Bool)

(assert (=> start!36312 (array_inv!7217 a!4337)))

(assert (= (and start!36312 res!202605) b!363446))

(assert (= (and b!363446 res!202609) b!363445))

(assert (= (and b!363445 res!202608) b!363448))

(assert (= (and b!363448 res!202606) b!363447))

(assert (= (and b!363447 (not res!202607)) b!363444))

(declare-fun m!360479 () Bool)

(assert (=> b!363447 m!360479))

(declare-fun m!360481 () Bool)

(assert (=> b!363447 m!360481))

(declare-fun m!360483 () Bool)

(assert (=> b!363447 m!360483))

(declare-fun m!360485 () Bool)

(assert (=> b!363447 m!360485))

(declare-fun m!360487 () Bool)

(assert (=> b!363447 m!360487))

(declare-fun m!360489 () Bool)

(assert (=> b!363447 m!360489))

(declare-fun m!360491 () Bool)

(assert (=> b!363447 m!360491))

(declare-fun m!360493 () Bool)

(assert (=> b!363447 m!360493))

(declare-fun m!360495 () Bool)

(assert (=> b!363447 m!360495))

(declare-fun m!360497 () Bool)

(assert (=> b!363444 m!360497))

(declare-fun m!360499 () Bool)

(assert (=> b!363444 m!360499))

(declare-fun m!360501 () Bool)

(assert (=> b!363445 m!360501))

(declare-fun m!360503 () Bool)

(assert (=> start!36312 m!360503))

(declare-fun m!360505 () Bool)

(assert (=> b!363446 m!360505))

(assert (=> b!363446 m!360505))

(declare-fun m!360507 () Bool)

(assert (=> b!363446 m!360507))

(push 1)

(assert (not start!36312))

(assert (not b!363444))

(assert (not b!363446))

(assert (not b!363445))

(assert (not b!363447))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

