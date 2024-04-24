; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36194 () Bool)

(assert start!36194)

(declare-fun b!362883 () Bool)

(declare-fun res!202222 () Bool)

(declare-fun e!222230 () Bool)

(assert (=> b!362883 (=> (not res!202222) (not e!222230))))

(declare-datatypes ((array!20505 0))(
  ( (array!20506 (arr!9734 (Array (_ BitVec 32) (_ BitVec 64))) (size!10086 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20505)

(assert (=> b!362883 (= res!202222 (bvslt (size!10086 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362884 () Bool)

(declare-fun e!222232 () Bool)

(assert (=> b!362884 (= e!222232 true)))

(declare-fun lt!167344 () array!20505)

(declare-fun lt!167345 () (_ BitVec 32))

(declare-fun lt!167347 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20505 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362884 (= (bvadd lt!167347 lt!167345) (arrayCountValidKeys!0 lt!167344 #b00000000000000000000000000000000 (size!10086 a!4337)))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((Unit!11177 0))(
  ( (Unit!11178) )
))
(declare-fun lt!167346 () Unit!11177)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11177)

(assert (=> b!362884 (= lt!167346 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167344 #b00000000000000000000000000000000 (size!10086 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362885 () Bool)

(declare-fun res!202219 () Bool)

(assert (=> b!362885 (=> (not res!202219) (not e!222230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362885 (= res!202219 (not (validKeyInArray!0 (select (arr!9734 a!4337) i!1478))))))

(declare-fun res!202218 () Bool)

(assert (=> start!36194 (=> (not res!202218) (not e!222230))))

(assert (=> start!36194 (= res!202218 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10086 a!4337))))))

(assert (=> start!36194 e!222230))

(assert (=> start!36194 true))

(declare-fun array_inv!7206 (array!20505) Bool)

(assert (=> start!36194 (array_inv!7206 a!4337)))

(declare-fun b!362886 () Bool)

(declare-fun res!202221 () Bool)

(assert (=> b!362886 (=> (not res!202221) (not e!222230))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362886 (= res!202221 (validKeyInArray!0 k!2980))))

(declare-fun b!362887 () Bool)

(assert (=> b!362887 (= e!222230 (not e!222232))))

(declare-fun res!202220 () Bool)

(assert (=> b!362887 (=> res!202220 e!222232)))

(assert (=> b!362887 (= res!202220 (or (bvslt (size!10086 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167349 () (_ BitVec 32))

(declare-fun lt!167348 () (_ BitVec 32))

(assert (=> b!362887 (= (bvadd lt!167349 lt!167348) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10086 a!4337)))))

(declare-fun lt!167350 () Unit!11177)

(assert (=> b!362887 (= lt!167350 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10086 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362887 (= lt!167345 lt!167348)))

(assert (=> b!362887 (= lt!167348 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10086 a!4337)))))

(assert (=> b!362887 (= lt!167345 (arrayCountValidKeys!0 lt!167344 (bvadd #b00000000000000000000000000000001 i!1478) (size!10086 a!4337)))))

(declare-fun lt!167351 () Unit!11177)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11177)

(assert (=> b!362887 (= lt!167351 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362887 (= lt!167347 (bvadd #b00000000000000000000000000000001 lt!167349))))

(assert (=> b!362887 (= lt!167347 (arrayCountValidKeys!0 lt!167344 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362887 (= lt!167349 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362887 (= lt!167344 (array!20506 (store (arr!9734 a!4337) i!1478 k!2980) (size!10086 a!4337)))))

(declare-fun lt!167352 () Unit!11177)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20505 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11177)

(assert (=> b!362887 (= lt!167352 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(assert (= (and start!36194 res!202218) b!362885))

(assert (= (and b!362885 res!202219) b!362886))

(assert (= (and b!362886 res!202221) b!362883))

(assert (= (and b!362883 res!202222) b!362887))

(assert (= (and b!362887 (not res!202220)) b!362884))

(declare-fun m!360013 () Bool)

(assert (=> start!36194 m!360013))

(declare-fun m!360015 () Bool)

(assert (=> b!362885 m!360015))

(assert (=> b!362885 m!360015))

(declare-fun m!360017 () Bool)

(assert (=> b!362885 m!360017))

(declare-fun m!360019 () Bool)

(assert (=> b!362887 m!360019))

(declare-fun m!360021 () Bool)

(assert (=> b!362887 m!360021))

(declare-fun m!360023 () Bool)

(assert (=> b!362887 m!360023))

(declare-fun m!360025 () Bool)

(assert (=> b!362887 m!360025))

(declare-fun m!360027 () Bool)

(assert (=> b!362887 m!360027))

(declare-fun m!360029 () Bool)

(assert (=> b!362887 m!360029))

(declare-fun m!360031 () Bool)

(assert (=> b!362887 m!360031))

(declare-fun m!360033 () Bool)

(assert (=> b!362887 m!360033))

(declare-fun m!360035 () Bool)

(assert (=> b!362887 m!360035))

(declare-fun m!360037 () Bool)

(assert (=> b!362886 m!360037))

(declare-fun m!360039 () Bool)

(assert (=> b!362884 m!360039))

(declare-fun m!360041 () Bool)

(assert (=> b!362884 m!360041))

(push 1)

(assert (not start!36194))

(assert (not b!362886))

(assert (not b!362884))

(assert (not b!362887))

(assert (not b!362885))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

