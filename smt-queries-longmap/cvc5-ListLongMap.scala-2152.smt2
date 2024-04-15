; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36194 () Bool)

(assert start!36194)

(declare-fun b!362661 () Bool)

(declare-fun res!202096 () Bool)

(declare-fun e!222090 () Bool)

(assert (=> b!362661 (=> (not res!202096) (not e!222090))))

(declare-datatypes ((array!20506 0))(
  ( (array!20507 (arr!9735 (Array (_ BitVec 32) (_ BitVec 64))) (size!10088 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20506)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362661 (= res!202096 (not (validKeyInArray!0 (select (arr!9735 a!4337) i!1478))))))

(declare-fun res!202095 () Bool)

(assert (=> start!36194 (=> (not res!202095) (not e!222090))))

(assert (=> start!36194 (= res!202095 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10088 a!4337))))))

(assert (=> start!36194 e!222090))

(assert (=> start!36194 true))

(declare-fun array_inv!7184 (array!20506) Bool)

(assert (=> start!36194 (array_inv!7184 a!4337)))

(declare-fun b!362662 () Bool)

(declare-fun e!222088 () Bool)

(assert (=> b!362662 (= e!222088 true)))

(declare-fun lt!167092 () array!20506)

(declare-fun lt!167094 () (_ BitVec 32))

(declare-fun lt!167099 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20506 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362662 (= (bvadd lt!167099 lt!167094) (arrayCountValidKeys!0 lt!167092 #b00000000000000000000000000000000 (size!10088 a!4337)))))

(declare-datatypes ((Unit!11166 0))(
  ( (Unit!11167) )
))
(declare-fun lt!167095 () Unit!11166)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11166)

(assert (=> b!362662 (= lt!167095 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167092 #b00000000000000000000000000000000 (size!10088 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362663 () Bool)

(declare-fun res!202092 () Bool)

(assert (=> b!362663 (=> (not res!202092) (not e!222090))))

(assert (=> b!362663 (= res!202092 (bvslt (size!10088 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362664 () Bool)

(assert (=> b!362664 (= e!222090 (not e!222088))))

(declare-fun res!202093 () Bool)

(assert (=> b!362664 (=> res!202093 e!222088)))

(assert (=> b!362664 (= res!202093 (or (bvslt (size!10088 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167096 () (_ BitVec 32))

(declare-fun lt!167091 () (_ BitVec 32))

(assert (=> b!362664 (= (bvadd lt!167096 lt!167091) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10088 a!4337)))))

(declare-fun lt!167097 () Unit!11166)

(assert (=> b!362664 (= lt!167097 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10088 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362664 (= lt!167094 lt!167091)))

(assert (=> b!362664 (= lt!167091 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10088 a!4337)))))

(assert (=> b!362664 (= lt!167094 (arrayCountValidKeys!0 lt!167092 (bvadd #b00000000000000000000000000000001 i!1478) (size!10088 a!4337)))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lt!167093 () Unit!11166)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20506 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11166)

(assert (=> b!362664 (= lt!167093 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362664 (= lt!167099 (bvadd #b00000000000000000000000000000001 lt!167096))))

(assert (=> b!362664 (= lt!167099 (arrayCountValidKeys!0 lt!167092 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362664 (= lt!167096 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362664 (= lt!167092 (array!20507 (store (arr!9735 a!4337) i!1478 k!2980) (size!10088 a!4337)))))

(declare-fun lt!167098 () Unit!11166)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20506 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11166)

(assert (=> b!362664 (= lt!167098 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362665 () Bool)

(declare-fun res!202094 () Bool)

(assert (=> b!362665 (=> (not res!202094) (not e!222090))))

(assert (=> b!362665 (= res!202094 (validKeyInArray!0 k!2980))))

(assert (= (and start!36194 res!202095) b!362661))

(assert (= (and b!362661 res!202096) b!362665))

(assert (= (and b!362665 res!202094) b!362663))

(assert (= (and b!362663 res!202092) b!362664))

(assert (= (and b!362664 (not res!202093)) b!362662))

(declare-fun m!359059 () Bool)

(assert (=> b!362662 m!359059))

(declare-fun m!359061 () Bool)

(assert (=> b!362662 m!359061))

(declare-fun m!359063 () Bool)

(assert (=> start!36194 m!359063))

(declare-fun m!359065 () Bool)

(assert (=> b!362665 m!359065))

(declare-fun m!359067 () Bool)

(assert (=> b!362661 m!359067))

(assert (=> b!362661 m!359067))

(declare-fun m!359069 () Bool)

(assert (=> b!362661 m!359069))

(declare-fun m!359071 () Bool)

(assert (=> b!362664 m!359071))

(declare-fun m!359073 () Bool)

(assert (=> b!362664 m!359073))

(declare-fun m!359075 () Bool)

(assert (=> b!362664 m!359075))

(declare-fun m!359077 () Bool)

(assert (=> b!362664 m!359077))

(declare-fun m!359079 () Bool)

(assert (=> b!362664 m!359079))

(declare-fun m!359081 () Bool)

(assert (=> b!362664 m!359081))

(declare-fun m!359083 () Bool)

(assert (=> b!362664 m!359083))

(declare-fun m!359085 () Bool)

(assert (=> b!362664 m!359085))

(declare-fun m!359087 () Bool)

(assert (=> b!362664 m!359087))

(push 1)

(assert (not start!36194))

(assert (not b!362664))

(assert (not b!362661))

(assert (not b!362662))

(assert (not b!362665))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

