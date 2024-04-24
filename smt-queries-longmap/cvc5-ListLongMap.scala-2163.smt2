; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36302 () Bool)

(assert start!36302)

(declare-fun res!202632 () Bool)

(declare-fun e!222521 () Bool)

(assert (=> start!36302 (=> (not res!202632) (not e!222521))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20577 0))(
  ( (array!20578 (arr!9767 (Array (_ BitVec 32) (_ BitVec 64))) (size!10119 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20577)

(assert (=> start!36302 (= res!202632 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10119 a!4337))))))

(assert (=> start!36302 e!222521))

(assert (=> start!36302 true))

(declare-fun array_inv!7239 (array!20577) Bool)

(assert (=> start!36302 (array_inv!7239 a!4337)))

(declare-fun b!363425 () Bool)

(declare-fun e!222519 () Bool)

(assert (=> b!363425 (= e!222519 true)))

(declare-fun lt!167677 () array!20577)

(declare-fun lt!167679 () (_ BitVec 32))

(declare-fun lt!167675 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20577 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363425 (= (bvadd lt!167675 lt!167679) (arrayCountValidKeys!0 lt!167677 #b00000000000000000000000000000000 (size!10119 a!4337)))))

(declare-datatypes ((Unit!11231 0))(
  ( (Unit!11232) )
))
(declare-fun lt!167673 () Unit!11231)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11231)

(assert (=> b!363425 (= lt!167673 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167677 #b00000000000000000000000000000000 (size!10119 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363426 () Bool)

(declare-fun res!202636 () Bool)

(assert (=> b!363426 (=> (not res!202636) (not e!222521))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363426 (= res!202636 (validKeyInArray!0 k!2980))))

(declare-fun b!363427 () Bool)

(declare-fun res!202634 () Bool)

(assert (=> b!363427 (=> (not res!202634) (not e!222521))))

(assert (=> b!363427 (= res!202634 (bvslt (size!10119 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363428 () Bool)

(assert (=> b!363428 (= e!222521 (not e!222519))))

(declare-fun res!202635 () Bool)

(assert (=> b!363428 (=> res!202635 e!222519)))

(assert (=> b!363428 (= res!202635 (or (bvslt (size!10119 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167674 () (_ BitVec 32))

(declare-fun lt!167676 () (_ BitVec 32))

(assert (=> b!363428 (= (bvadd lt!167674 lt!167676) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10119 a!4337)))))

(declare-fun lt!167681 () Unit!11231)

(assert (=> b!363428 (= lt!167681 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10119 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363428 (= lt!167679 lt!167676)))

(assert (=> b!363428 (= lt!167676 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10119 a!4337)))))

(assert (=> b!363428 (= lt!167679 (arrayCountValidKeys!0 lt!167677 (bvadd #b00000000000000000000000000000001 i!1478) (size!10119 a!4337)))))

(declare-fun lt!167680 () Unit!11231)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11231)

(assert (=> b!363428 (= lt!167680 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363428 (= lt!167675 (bvadd #b00000000000000000000000000000001 lt!167674))))

(assert (=> b!363428 (= lt!167675 (arrayCountValidKeys!0 lt!167677 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363428 (= lt!167674 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363428 (= lt!167677 (array!20578 (store (arr!9767 a!4337) i!1478 k!2980) (size!10119 a!4337)))))

(declare-fun lt!167678 () Unit!11231)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11231)

(assert (=> b!363428 (= lt!167678 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363429 () Bool)

(declare-fun res!202633 () Bool)

(assert (=> b!363429 (=> (not res!202633) (not e!222521))))

(assert (=> b!363429 (= res!202633 (not (validKeyInArray!0 (select (arr!9767 a!4337) i!1478))))))

(assert (= (and start!36302 res!202632) b!363429))

(assert (= (and b!363429 res!202633) b!363426))

(assert (= (and b!363426 res!202636) b!363427))

(assert (= (and b!363427 res!202634) b!363428))

(assert (= (and b!363428 (not res!202635)) b!363425))

(declare-fun m!360769 () Bool)

(assert (=> start!36302 m!360769))

(declare-fun m!360771 () Bool)

(assert (=> b!363429 m!360771))

(assert (=> b!363429 m!360771))

(declare-fun m!360773 () Bool)

(assert (=> b!363429 m!360773))

(declare-fun m!360775 () Bool)

(assert (=> b!363426 m!360775))

(declare-fun m!360777 () Bool)

(assert (=> b!363428 m!360777))

(declare-fun m!360779 () Bool)

(assert (=> b!363428 m!360779))

(declare-fun m!360781 () Bool)

(assert (=> b!363428 m!360781))

(declare-fun m!360783 () Bool)

(assert (=> b!363428 m!360783))

(declare-fun m!360785 () Bool)

(assert (=> b!363428 m!360785))

(declare-fun m!360787 () Bool)

(assert (=> b!363428 m!360787))

(declare-fun m!360789 () Bool)

(assert (=> b!363428 m!360789))

(declare-fun m!360791 () Bool)

(assert (=> b!363428 m!360791))

(declare-fun m!360793 () Bool)

(assert (=> b!363428 m!360793))

(declare-fun m!360795 () Bool)

(assert (=> b!363425 m!360795))

(declare-fun m!360797 () Bool)

(assert (=> b!363425 m!360797))

(push 1)

(assert (not b!363425))

(assert (not start!36302))

(assert (not b!363429))

(assert (not b!363426))

(assert (not b!363428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

