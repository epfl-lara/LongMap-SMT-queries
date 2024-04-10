; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36178 () Bool)

(assert start!36178)

(declare-fun b!362720 () Bool)

(declare-fun e!222138 () Bool)

(assert (=> b!362720 (= e!222138 (not true))))

(declare-datatypes ((array!20494 0))(
  ( (array!20495 (arr!9729 (Array (_ BitVec 32) (_ BitVec 64))) (size!10081 (_ BitVec 32))) )
))
(declare-fun lt!166946 () array!20494)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun a!4337 () array!20494)

(declare-fun arrayCountValidKeys!0 (array!20494 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362720 (= (arrayCountValidKeys!0 lt!166946 (bvadd #b00000000000000000000000000000001 i!1478) (size!10081 a!4337)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10081 a!4337)))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-datatypes ((Unit!11158 0))(
  ( (Unit!11159) )
))
(declare-fun lt!166944 () Unit!11158)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20494 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11158)

(assert (=> b!362720 (= lt!166944 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362720 (= (arrayCountValidKeys!0 lt!166946 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362720 (= lt!166946 (array!20495 (store (arr!9729 a!4337) i!1478 k!2980) (size!10081 a!4337)))))

(declare-fun lt!166945 () Unit!11158)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20494 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11158)

(assert (=> b!362720 (= lt!166945 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun res!202006 () Bool)

(assert (=> start!36178 (=> (not res!202006) (not e!222138))))

(assert (=> start!36178 (= res!202006 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10081 a!4337))))))

(assert (=> start!36178 e!222138))

(assert (=> start!36178 true))

(declare-fun array_inv!7171 (array!20494) Bool)

(assert (=> start!36178 (array_inv!7171 a!4337)))

(declare-fun b!362719 () Bool)

(declare-fun res!202009 () Bool)

(assert (=> b!362719 (=> (not res!202009) (not e!222138))))

(assert (=> b!362719 (= res!202009 (bvslt (size!10081 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362717 () Bool)

(declare-fun res!202008 () Bool)

(assert (=> b!362717 (=> (not res!202008) (not e!222138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362717 (= res!202008 (not (validKeyInArray!0 (select (arr!9729 a!4337) i!1478))))))

(declare-fun b!362718 () Bool)

(declare-fun res!202007 () Bool)

(assert (=> b!362718 (=> (not res!202007) (not e!222138))))

(assert (=> b!362718 (= res!202007 (validKeyInArray!0 k!2980))))

(assert (= (and start!36178 res!202006) b!362717))

(assert (= (and b!362717 res!202008) b!362718))

(assert (= (and b!362718 res!202007) b!362719))

(assert (= (and b!362719 res!202009) b!362720))

(declare-fun m!359353 () Bool)

(assert (=> b!362720 m!359353))

(declare-fun m!359355 () Bool)

(assert (=> b!362720 m!359355))

(declare-fun m!359357 () Bool)

(assert (=> b!362720 m!359357))

(declare-fun m!359359 () Bool)

(assert (=> b!362720 m!359359))

(declare-fun m!359361 () Bool)

(assert (=> b!362720 m!359361))

(declare-fun m!359363 () Bool)

(assert (=> b!362720 m!359363))

(declare-fun m!359365 () Bool)

(assert (=> b!362720 m!359365))

(declare-fun m!359367 () Bool)

(assert (=> start!36178 m!359367))

(declare-fun m!359369 () Bool)

(assert (=> b!362717 m!359369))

(assert (=> b!362717 m!359369))

(declare-fun m!359371 () Bool)

(assert (=> b!362717 m!359371))

(declare-fun m!359373 () Bool)

(assert (=> b!362718 m!359373))

(push 1)

(assert (not b!362717))

(assert (not b!362718))

(assert (not b!362720))

(assert (not start!36178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

