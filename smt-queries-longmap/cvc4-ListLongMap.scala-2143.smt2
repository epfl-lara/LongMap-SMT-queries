; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36154 () Bool)

(assert start!36154)

(declare-fun b!362545 () Bool)

(declare-fun e!222037 () Bool)

(assert (=> b!362545 (= e!222037 true)))

(declare-fun lt!166809 () (_ BitVec 32))

(declare-datatypes ((array!20470 0))(
  ( (array!20471 (arr!9717 (Array (_ BitVec 32) (_ BitVec 64))) (size!10069 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20470)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20470 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362545 (= lt!166809 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166810 () (_ BitVec 32))

(declare-fun lt!166811 () array!20470)

(assert (=> b!362545 (= lt!166810 (arrayCountValidKeys!0 lt!166811 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362546 () Bool)

(declare-fun res!201834 () Bool)

(declare-fun e!222039 () Bool)

(assert (=> b!362546 (=> (not res!201834) (not e!222039))))

(assert (=> b!362546 (= res!201834 (bvslt (size!10069 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362547 () Bool)

(declare-fun res!201838 () Bool)

(assert (=> b!362547 (=> (not res!201838) (not e!222039))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362547 (= res!201838 (validKeyInArray!0 k!2980))))

(declare-fun b!362548 () Bool)

(declare-fun res!201836 () Bool)

(assert (=> b!362548 (=> (not res!201836) (not e!222039))))

(assert (=> b!362548 (= res!201836 (not (validKeyInArray!0 (select (arr!9717 a!4337) i!1478))))))

(declare-fun b!362549 () Bool)

(assert (=> b!362549 (= e!222039 (not e!222037))))

(declare-fun res!201835 () Bool)

(assert (=> b!362549 (=> res!201835 e!222037)))

(assert (=> b!362549 (= res!201835 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(assert (=> b!362549 (= (arrayCountValidKeys!0 lt!166811 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362549 (= lt!166811 (array!20471 (store (arr!9717 a!4337) i!1478 k!2980) (size!10069 a!4337)))))

(declare-datatypes ((Unit!11134 0))(
  ( (Unit!11135) )
))
(declare-fun lt!166808 () Unit!11134)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20470 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11134)

(assert (=> b!362549 (= lt!166808 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun res!201837 () Bool)

(assert (=> start!36154 (=> (not res!201837) (not e!222039))))

(assert (=> start!36154 (= res!201837 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10069 a!4337))))))

(assert (=> start!36154 e!222039))

(assert (=> start!36154 true))

(declare-fun array_inv!7159 (array!20470) Bool)

(assert (=> start!36154 (array_inv!7159 a!4337)))

(assert (= (and start!36154 res!201837) b!362548))

(assert (= (and b!362548 res!201836) b!362547))

(assert (= (and b!362547 res!201838) b!362546))

(assert (= (and b!362546 res!201834) b!362549))

(assert (= (and b!362549 (not res!201835)) b!362545))

(declare-fun m!359109 () Bool)

(assert (=> b!362545 m!359109))

(declare-fun m!359111 () Bool)

(assert (=> b!362545 m!359111))

(declare-fun m!359113 () Bool)

(assert (=> start!36154 m!359113))

(declare-fun m!359115 () Bool)

(assert (=> b!362547 m!359115))

(declare-fun m!359117 () Bool)

(assert (=> b!362548 m!359117))

(assert (=> b!362548 m!359117))

(declare-fun m!359119 () Bool)

(assert (=> b!362548 m!359119))

(declare-fun m!359121 () Bool)

(assert (=> b!362549 m!359121))

(declare-fun m!359123 () Bool)

(assert (=> b!362549 m!359123))

(declare-fun m!359125 () Bool)

(assert (=> b!362549 m!359125))

(declare-fun m!359127 () Bool)

(assert (=> b!362549 m!359127))

(push 1)

(assert (not b!362548))

(assert (not b!362549))

(assert (not b!362547))

(assert (not b!362545))

(assert (not start!36154))

(check-sat)

(pop 1)

