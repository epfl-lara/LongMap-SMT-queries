; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36150 () Bool)

(assert start!36150)

(declare-fun b!362515 () Bool)

(declare-fun res!201806 () Bool)

(declare-fun e!222019 () Bool)

(assert (=> b!362515 (=> (not res!201806) (not e!222019))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362515 (= res!201806 (validKeyInArray!0 k!2980))))

(declare-fun b!362516 () Bool)

(declare-fun res!201808 () Bool)

(assert (=> b!362516 (=> (not res!201808) (not e!222019))))

(declare-datatypes ((array!20466 0))(
  ( (array!20467 (arr!9715 (Array (_ BitVec 32) (_ BitVec 64))) (size!10067 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20466)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362516 (= res!201808 (not (validKeyInArray!0 (select (arr!9715 a!4337) i!1478))))))

(declare-fun b!362517 () Bool)

(declare-fun res!201804 () Bool)

(assert (=> b!362517 (=> (not res!201804) (not e!222019))))

(assert (=> b!362517 (= res!201804 (bvslt (size!10067 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362518 () Bool)

(declare-fun e!222020 () Bool)

(assert (=> b!362518 (= e!222019 (not e!222020))))

(declare-fun res!201807 () Bool)

(assert (=> b!362518 (=> res!201807 e!222020)))

(assert (=> b!362518 (= res!201807 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-fun lt!166786 () array!20466)

(declare-fun arrayCountValidKeys!0 (array!20466 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362518 (= (arrayCountValidKeys!0 lt!166786 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362518 (= lt!166786 (array!20467 (store (arr!9715 a!4337) i!1478 k!2980) (size!10067 a!4337)))))

(declare-datatypes ((Unit!11130 0))(
  ( (Unit!11131) )
))
(declare-fun lt!166784 () Unit!11130)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20466 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11130)

(assert (=> b!362518 (= lt!166784 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun res!201805 () Bool)

(assert (=> start!36150 (=> (not res!201805) (not e!222019))))

(assert (=> start!36150 (= res!201805 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10067 a!4337))))))

(assert (=> start!36150 e!222019))

(assert (=> start!36150 true))

(declare-fun array_inv!7157 (array!20466) Bool)

(assert (=> start!36150 (array_inv!7157 a!4337)))

(declare-fun b!362519 () Bool)

(assert (=> b!362519 (= e!222020 true)))

(declare-fun lt!166785 () (_ BitVec 32))

(assert (=> b!362519 (= lt!166785 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166787 () (_ BitVec 32))

(assert (=> b!362519 (= lt!166787 (arrayCountValidKeys!0 lt!166786 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (= (and start!36150 res!201805) b!362516))

(assert (= (and b!362516 res!201808) b!362515))

(assert (= (and b!362515 res!201806) b!362517))

(assert (= (and b!362517 res!201804) b!362518))

(assert (= (and b!362518 (not res!201807)) b!362519))

(declare-fun m!359069 () Bool)

(assert (=> b!362515 m!359069))

(declare-fun m!359071 () Bool)

(assert (=> b!362518 m!359071))

(declare-fun m!359073 () Bool)

(assert (=> b!362518 m!359073))

(declare-fun m!359075 () Bool)

(assert (=> b!362518 m!359075))

(declare-fun m!359077 () Bool)

(assert (=> b!362518 m!359077))

(declare-fun m!359079 () Bool)

(assert (=> start!36150 m!359079))

(declare-fun m!359081 () Bool)

(assert (=> b!362519 m!359081))

(declare-fun m!359083 () Bool)

(assert (=> b!362519 m!359083))

(declare-fun m!359085 () Bool)

(assert (=> b!362516 m!359085))

(assert (=> b!362516 m!359085))

(declare-fun m!359087 () Bool)

(assert (=> b!362516 m!359087))

(push 1)

(assert (not start!36150))

(assert (not b!362519))

(assert (not b!362516))

(assert (not b!362518))

(assert (not b!362515))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

