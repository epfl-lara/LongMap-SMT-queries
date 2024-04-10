; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36198 () Bool)

(assert start!36198)

(declare-fun b!362857 () Bool)

(declare-fun e!222219 () Bool)

(assert (=> b!362857 (= e!222219 true)))

(declare-fun lt!167194 () (_ BitVec 32))

(declare-datatypes ((array!20514 0))(
  ( (array!20515 (arr!9739 (Array (_ BitVec 32) (_ BitVec 64))) (size!10091 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20514)

(declare-fun lt!167193 () (_ BitVec 32))

(declare-fun lt!167192 () array!20514)

(declare-fun arrayCountValidKeys!0 (array!20514 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362857 (= (bvadd lt!167193 lt!167194) (arrayCountValidKeys!0 lt!167192 #b00000000000000000000000000000000 (size!10091 a!4337)))))

(declare-datatypes ((Unit!11178 0))(
  ( (Unit!11179) )
))
(declare-fun lt!167197 () Unit!11178)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11178)

(assert (=> b!362857 (= lt!167197 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167192 #b00000000000000000000000000000000 (size!10091 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!202146 () Bool)

(declare-fun e!222217 () Bool)

(assert (=> start!36198 (=> (not res!202146) (not e!222217))))

(assert (=> start!36198 (= res!202146 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10091 a!4337))))))

(assert (=> start!36198 e!222217))

(assert (=> start!36198 true))

(declare-fun array_inv!7181 (array!20514) Bool)

(assert (=> start!36198 (array_inv!7181 a!4337)))

(declare-fun b!362858 () Bool)

(declare-fun res!202149 () Bool)

(assert (=> b!362858 (=> (not res!202149) (not e!222217))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362858 (= res!202149 (not (validKeyInArray!0 (select (arr!9739 a!4337) i!1478))))))

(declare-fun b!362859 () Bool)

(declare-fun res!202150 () Bool)

(assert (=> b!362859 (=> (not res!202150) (not e!222217))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362859 (= res!202150 (validKeyInArray!0 k!2980))))

(declare-fun b!362860 () Bool)

(declare-fun res!202148 () Bool)

(assert (=> b!362860 (=> (not res!202148) (not e!222217))))

(assert (=> b!362860 (= res!202148 (bvslt (size!10091 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362861 () Bool)

(assert (=> b!362861 (= e!222217 (not e!222219))))

(declare-fun res!202147 () Bool)

(assert (=> b!362861 (=> res!202147 e!222219)))

(assert (=> b!362861 (= res!202147 (or (bvslt (size!10091 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167198 () (_ BitVec 32))

(declare-fun lt!167191 () (_ BitVec 32))

(assert (=> b!362861 (= (bvadd lt!167198 lt!167191) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10091 a!4337)))))

(declare-fun lt!167196 () Unit!11178)

(assert (=> b!362861 (= lt!167196 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10091 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362861 (= lt!167194 lt!167191)))

(assert (=> b!362861 (= lt!167191 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10091 a!4337)))))

(assert (=> b!362861 (= lt!167194 (arrayCountValidKeys!0 lt!167192 (bvadd #b00000000000000000000000000000001 i!1478) (size!10091 a!4337)))))

(declare-fun lt!167190 () Unit!11178)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20514 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11178)

(assert (=> b!362861 (= lt!167190 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362861 (= lt!167193 (bvadd #b00000000000000000000000000000001 lt!167198))))

(assert (=> b!362861 (= lt!167193 (arrayCountValidKeys!0 lt!167192 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362861 (= lt!167198 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362861 (= lt!167192 (array!20515 (store (arr!9739 a!4337) i!1478 k!2980) (size!10091 a!4337)))))

(declare-fun lt!167195 () Unit!11178)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20514 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11178)

(assert (=> b!362861 (= lt!167195 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(assert (= (and start!36198 res!202146) b!362858))

(assert (= (and b!362858 res!202149) b!362859))

(assert (= (and b!362859 res!202150) b!362860))

(assert (= (and b!362860 res!202148) b!362861))

(assert (= (and b!362861 (not res!202147)) b!362857))

(declare-fun m!359633 () Bool)

(assert (=> b!362857 m!359633))

(declare-fun m!359635 () Bool)

(assert (=> b!362857 m!359635))

(declare-fun m!359637 () Bool)

(assert (=> start!36198 m!359637))

(declare-fun m!359639 () Bool)

(assert (=> b!362859 m!359639))

(declare-fun m!359641 () Bool)

(assert (=> b!362861 m!359641))

(declare-fun m!359643 () Bool)

(assert (=> b!362861 m!359643))

(declare-fun m!359645 () Bool)

(assert (=> b!362861 m!359645))

(declare-fun m!359647 () Bool)

(assert (=> b!362861 m!359647))

(declare-fun m!359649 () Bool)

(assert (=> b!362861 m!359649))

(declare-fun m!359651 () Bool)

(assert (=> b!362861 m!359651))

(declare-fun m!359653 () Bool)

(assert (=> b!362861 m!359653))

(declare-fun m!359655 () Bool)

(assert (=> b!362861 m!359655))

(declare-fun m!359657 () Bool)

(assert (=> b!362861 m!359657))

(declare-fun m!359659 () Bool)

(assert (=> b!362858 m!359659))

(assert (=> b!362858 m!359659))

(declare-fun m!359661 () Bool)

(assert (=> b!362858 m!359661))

(push 1)

(assert (not start!36198))

(assert (not b!362858))

(assert (not b!362861))

(assert (not b!362859))

(assert (not b!362857))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

