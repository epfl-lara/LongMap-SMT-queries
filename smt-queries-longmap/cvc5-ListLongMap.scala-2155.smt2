; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36230 () Bool)

(assert start!36230)

(declare-fun b!363039 () Bool)

(declare-fun res!202320 () Bool)

(declare-fun e!222314 () Bool)

(assert (=> b!363039 (=> (not res!202320) (not e!222314))))

(declare-datatypes ((array!20526 0))(
  ( (array!20527 (arr!9743 (Array (_ BitVec 32) (_ BitVec 64))) (size!10095 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20526)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363039 (= res!202320 (not (validKeyInArray!0 (select (arr!9743 a!4337) i!1478))))))

(declare-fun b!363041 () Bool)

(declare-fun res!202318 () Bool)

(assert (=> b!363041 (=> (not res!202318) (not e!222314))))

(assert (=> b!363041 (= res!202318 (bvslt (size!10095 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363042 () Bool)

(assert (=> b!363042 (= e!222314 (not true))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20526 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363042 (= (arrayCountValidKeys!0 (array!20527 (store (arr!9743 a!4337) i!1478 k!2980) (size!10095 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11183 0))(
  ( (Unit!11184) )
))
(declare-fun lt!167375 () Unit!11183)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20526 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11183)

(assert (=> b!363042 (= lt!167375 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun res!202319 () Bool)

(assert (=> start!36230 (=> (not res!202319) (not e!222314))))

(assert (=> start!36230 (= res!202319 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10095 a!4337))))))

(assert (=> start!36230 e!222314))

(assert (=> start!36230 true))

(declare-fun array_inv!7215 (array!20526) Bool)

(assert (=> start!36230 (array_inv!7215 a!4337)))

(declare-fun b!363040 () Bool)

(declare-fun res!202321 () Bool)

(assert (=> b!363040 (=> (not res!202321) (not e!222314))))

(assert (=> b!363040 (= res!202321 (validKeyInArray!0 k!2980))))

(assert (= (and start!36230 res!202319) b!363039))

(assert (= (and b!363039 res!202320) b!363040))

(assert (= (and b!363040 res!202321) b!363041))

(assert (= (and b!363041 res!202318) b!363042))

(declare-fun m!360177 () Bool)

(assert (=> b!363039 m!360177))

(assert (=> b!363039 m!360177))

(declare-fun m!360179 () Bool)

(assert (=> b!363039 m!360179))

(declare-fun m!360181 () Bool)

(assert (=> b!363042 m!360181))

(declare-fun m!360183 () Bool)

(assert (=> b!363042 m!360183))

(declare-fun m!360185 () Bool)

(assert (=> b!363042 m!360185))

(declare-fun m!360187 () Bool)

(assert (=> b!363042 m!360187))

(declare-fun m!360189 () Bool)

(assert (=> start!36230 m!360189))

(declare-fun m!360191 () Bool)

(assert (=> b!363040 m!360191))

(push 1)

(assert (not b!363039))

(assert (not b!363040))

(assert (not start!36230))

(assert (not b!363042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

