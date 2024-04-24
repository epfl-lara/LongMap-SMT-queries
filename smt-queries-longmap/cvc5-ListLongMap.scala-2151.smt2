; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36188 () Bool)

(assert start!36188)

(declare-fun b!362838 () Bool)

(declare-fun res!202174 () Bool)

(declare-fun e!222204 () Bool)

(assert (=> b!362838 (=> (not res!202174) (not e!222204))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362838 (= res!202174 (validKeyInArray!0 k!2980))))

(declare-fun b!362839 () Bool)

(declare-fun res!202176 () Bool)

(assert (=> b!362839 (=> (not res!202176) (not e!222204))))

(declare-datatypes ((array!20499 0))(
  ( (array!20500 (arr!9731 (Array (_ BitVec 32) (_ BitVec 64))) (size!10083 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20499)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362839 (= res!202176 (not (validKeyInArray!0 (select (arr!9731 a!4337) i!1478))))))

(declare-fun b!362840 () Bool)

(declare-fun res!202177 () Bool)

(assert (=> b!362840 (=> (not res!202177) (not e!222204))))

(assert (=> b!362840 (= res!202177 (bvslt (size!10083 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362841 () Bool)

(declare-fun e!222203 () Bool)

(assert (=> b!362841 (= e!222204 (not e!222203))))

(declare-fun res!202173 () Bool)

(assert (=> b!362841 (=> res!202173 e!222203)))

(assert (=> b!362841 (= res!202173 (or (bvslt (size!10083 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167269 () (_ BitVec 32))

(declare-fun lt!167268 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20499 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362841 (= (bvadd lt!167269 lt!167268) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10083 a!4337)))))

(declare-datatypes ((Unit!11171 0))(
  ( (Unit!11172) )
))
(declare-fun lt!167271 () Unit!11171)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11171)

(assert (=> b!362841 (= lt!167271 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10083 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167267 () (_ BitVec 32))

(assert (=> b!362841 (= lt!167267 lt!167268)))

(assert (=> b!362841 (= lt!167268 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10083 a!4337)))))

(declare-fun lt!167263 () array!20499)

(assert (=> b!362841 (= lt!167267 (arrayCountValidKeys!0 lt!167263 (bvadd #b00000000000000000000000000000001 i!1478) (size!10083 a!4337)))))

(declare-fun lt!167270 () Unit!11171)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20499 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11171)

(assert (=> b!362841 (= lt!167270 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167266 () (_ BitVec 32))

(assert (=> b!362841 (= lt!167266 (bvadd #b00000000000000000000000000000001 lt!167269))))

(assert (=> b!362841 (= lt!167266 (arrayCountValidKeys!0 lt!167263 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362841 (= lt!167269 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362841 (= lt!167263 (array!20500 (store (arr!9731 a!4337) i!1478 k!2980) (size!10083 a!4337)))))

(declare-fun lt!167265 () Unit!11171)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20499 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11171)

(assert (=> b!362841 (= lt!167265 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun res!202175 () Bool)

(assert (=> start!36188 (=> (not res!202175) (not e!222204))))

(assert (=> start!36188 (= res!202175 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10083 a!4337))))))

(assert (=> start!36188 e!222204))

(assert (=> start!36188 true))

(declare-fun array_inv!7203 (array!20499) Bool)

(assert (=> start!36188 (array_inv!7203 a!4337)))

(declare-fun b!362842 () Bool)

(assert (=> b!362842 (= e!222203 true)))

(assert (=> b!362842 (= (bvadd lt!167266 lt!167267) (arrayCountValidKeys!0 lt!167263 #b00000000000000000000000000000000 (size!10083 a!4337)))))

(declare-fun lt!167264 () Unit!11171)

(assert (=> b!362842 (= lt!167264 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167263 #b00000000000000000000000000000000 (size!10083 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (= (and start!36188 res!202175) b!362839))

(assert (= (and b!362839 res!202176) b!362838))

(assert (= (and b!362838 res!202174) b!362840))

(assert (= (and b!362840 res!202177) b!362841))

(assert (= (and b!362841 (not res!202173)) b!362842))

(declare-fun m!359923 () Bool)

(assert (=> start!36188 m!359923))

(declare-fun m!359925 () Bool)

(assert (=> b!362842 m!359925))

(declare-fun m!359927 () Bool)

(assert (=> b!362842 m!359927))

(declare-fun m!359929 () Bool)

(assert (=> b!362838 m!359929))

(declare-fun m!359931 () Bool)

(assert (=> b!362841 m!359931))

(declare-fun m!359933 () Bool)

(assert (=> b!362841 m!359933))

(declare-fun m!359935 () Bool)

(assert (=> b!362841 m!359935))

(declare-fun m!359937 () Bool)

(assert (=> b!362841 m!359937))

(declare-fun m!359939 () Bool)

(assert (=> b!362841 m!359939))

(declare-fun m!359941 () Bool)

(assert (=> b!362841 m!359941))

(declare-fun m!359943 () Bool)

(assert (=> b!362841 m!359943))

(declare-fun m!359945 () Bool)

(assert (=> b!362841 m!359945))

(declare-fun m!359947 () Bool)

(assert (=> b!362841 m!359947))

(declare-fun m!359949 () Bool)

(assert (=> b!362839 m!359949))

(assert (=> b!362839 m!359949))

(declare-fun m!359951 () Bool)

(assert (=> b!362839 m!359951))

(push 1)

(assert (not b!362842))

(assert (not b!362841))

(assert (not b!362838))

(assert (not b!362839))

(assert (not start!36188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

