; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36316 () Bool)

(assert start!36316)

(declare-fun res!202635 () Bool)

(declare-fun e!222552 () Bool)

(assert (=> start!36316 (=> (not res!202635) (not e!222552))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20596 0))(
  ( (array!20597 (arr!9777 (Array (_ BitVec 32) (_ BitVec 64))) (size!10129 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20596)

(assert (=> start!36316 (= res!202635 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10129 a!4337))))))

(assert (=> start!36316 e!222552))

(assert (=> start!36316 true))

(declare-fun array_inv!7219 (array!20596) Bool)

(assert (=> start!36316 (array_inv!7219 a!4337)))

(declare-fun b!363474 () Bool)

(declare-fun res!202637 () Bool)

(assert (=> b!363474 (=> (not res!202637) (not e!222552))))

(assert (=> b!363474 (= res!202637 (bvslt (size!10129 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363475 () Bool)

(declare-fun res!202638 () Bool)

(assert (=> b!363475 (=> (not res!202638) (not e!222552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363475 (= res!202638 (not (validKeyInArray!0 (select (arr!9777 a!4337) i!1478))))))

(declare-fun b!363476 () Bool)

(declare-fun e!222553 () Bool)

(assert (=> b!363476 (= e!222552 (not e!222553))))

(declare-fun res!202639 () Bool)

(assert (=> b!363476 (=> res!202639 e!222553)))

(assert (=> b!363476 (= res!202639 (or (bvslt (size!10129 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167654 () (_ BitVec 32))

(declare-fun lt!167655 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20596 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363476 (= (bvadd lt!167654 lt!167655) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10129 a!4337)))))

(declare-datatypes ((Unit!11242 0))(
  ( (Unit!11243) )
))
(declare-fun lt!167660 () Unit!11242)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11242)

(assert (=> b!363476 (= lt!167660 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10129 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167662 () (_ BitVec 32))

(assert (=> b!363476 (= lt!167662 lt!167655)))

(assert (=> b!363476 (= lt!167655 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10129 a!4337)))))

(declare-fun lt!167661 () array!20596)

(assert (=> b!363476 (= lt!167662 (arrayCountValidKeys!0 lt!167661 (bvadd #b00000000000000000000000000000001 i!1478) (size!10129 a!4337)))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lt!167658 () Unit!11242)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20596 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11242)

(assert (=> b!363476 (= lt!167658 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167656 () (_ BitVec 32))

(assert (=> b!363476 (= lt!167656 (bvadd #b00000000000000000000000000000001 lt!167654))))

(assert (=> b!363476 (= lt!167656 (arrayCountValidKeys!0 lt!167661 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363476 (= lt!167654 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363476 (= lt!167661 (array!20597 (store (arr!9777 a!4337) i!1478 k!2980) (size!10129 a!4337)))))

(declare-fun lt!167659 () Unit!11242)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20596 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11242)

(assert (=> b!363476 (= lt!167659 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363477 () Bool)

(assert (=> b!363477 (= e!222553 true)))

(assert (=> b!363477 (= (bvadd lt!167656 lt!167662) (arrayCountValidKeys!0 lt!167661 #b00000000000000000000000000000000 (size!10129 a!4337)))))

(declare-fun lt!167657 () Unit!11242)

(assert (=> b!363477 (= lt!167657 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167661 #b00000000000000000000000000000000 (size!10129 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363478 () Bool)

(declare-fun res!202636 () Bool)

(assert (=> b!363478 (=> (not res!202636) (not e!222552))))

(assert (=> b!363478 (= res!202636 (validKeyInArray!0 k!2980))))

(assert (= (and start!36316 res!202635) b!363475))

(assert (= (and b!363475 res!202638) b!363478))

(assert (= (and b!363478 res!202636) b!363474))

(assert (= (and b!363474 res!202637) b!363476))

(assert (= (and b!363476 (not res!202639)) b!363477))

(declare-fun m!360539 () Bool)

(assert (=> b!363476 m!360539))

(declare-fun m!360541 () Bool)

(assert (=> b!363476 m!360541))

(declare-fun m!360543 () Bool)

(assert (=> b!363476 m!360543))

(declare-fun m!360545 () Bool)

(assert (=> b!363476 m!360545))

(declare-fun m!360547 () Bool)

(assert (=> b!363476 m!360547))

(declare-fun m!360549 () Bool)

(assert (=> b!363476 m!360549))

(declare-fun m!360551 () Bool)

(assert (=> b!363476 m!360551))

(declare-fun m!360553 () Bool)

(assert (=> b!363476 m!360553))

(declare-fun m!360555 () Bool)

(assert (=> b!363476 m!360555))

(declare-fun m!360557 () Bool)

(assert (=> b!363475 m!360557))

(assert (=> b!363475 m!360557))

(declare-fun m!360559 () Bool)

(assert (=> b!363475 m!360559))

(declare-fun m!360561 () Bool)

(assert (=> start!36316 m!360561))

(declare-fun m!360563 () Bool)

(assert (=> b!363478 m!360563))

(declare-fun m!360565 () Bool)

(assert (=> b!363477 m!360565))

(declare-fun m!360567 () Bool)

(assert (=> b!363477 m!360567))

(push 1)

(assert (not b!363477))

(assert (not b!363475))

(assert (not start!36316))

(assert (not b!363476))

(assert (not b!363478))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

