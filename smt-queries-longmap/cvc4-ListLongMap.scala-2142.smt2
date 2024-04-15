; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36132 () Bool)

(assert start!36132)

(declare-fun b!362214 () Bool)

(declare-fun res!201649 () Bool)

(declare-fun e!221829 () Bool)

(assert (=> b!362214 (=> (not res!201649) (not e!221829))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362214 (= res!201649 (validKeyInArray!0 k!2980))))

(declare-fun b!362215 () Bool)

(declare-fun res!201647 () Bool)

(assert (=> b!362215 (=> (not res!201647) (not e!221829))))

(declare-datatypes ((array!20444 0))(
  ( (array!20445 (arr!9704 (Array (_ BitVec 32) (_ BitVec 64))) (size!10057 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20444)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362215 (= res!201647 (not (validKeyInArray!0 (select (arr!9704 a!4337) i!1478))))))

(declare-fun res!201648 () Bool)

(assert (=> start!36132 (=> (not res!201648) (not e!221829))))

(assert (=> start!36132 (= res!201648 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10057 a!4337))))))

(assert (=> start!36132 e!221829))

(assert (=> start!36132 true))

(declare-fun array_inv!7153 (array!20444) Bool)

(assert (=> start!36132 (array_inv!7153 a!4337)))

(declare-fun b!362216 () Bool)

(declare-fun res!201646 () Bool)

(assert (=> b!362216 (=> (not res!201646) (not e!221829))))

(assert (=> b!362216 (= res!201646 (bvslt (size!10057 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362217 () Bool)

(declare-fun e!221828 () Bool)

(assert (=> b!362217 (= e!221829 (not e!221828))))

(declare-fun res!201645 () Bool)

(assert (=> b!362217 (=> res!201645 e!221828)))

(assert (=> b!362217 (= res!201645 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-fun lt!166526 () array!20444)

(declare-fun arrayCountValidKeys!0 (array!20444 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362217 (= (arrayCountValidKeys!0 lt!166526 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362217 (= lt!166526 (array!20445 (store (arr!9704 a!4337) i!1478 k!2980) (size!10057 a!4337)))))

(declare-datatypes ((Unit!11104 0))(
  ( (Unit!11105) )
))
(declare-fun lt!166528 () Unit!11104)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20444 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11104)

(assert (=> b!362217 (= lt!166528 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362218 () Bool)

(assert (=> b!362218 (= e!221828 true)))

(declare-fun lt!166527 () (_ BitVec 32))

(assert (=> b!362218 (= lt!166527 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166529 () (_ BitVec 32))

(assert (=> b!362218 (= lt!166529 (arrayCountValidKeys!0 lt!166526 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (= (and start!36132 res!201648) b!362215))

(assert (= (and b!362215 res!201647) b!362214))

(assert (= (and b!362214 res!201649) b!362216))

(assert (= (and b!362216 res!201646) b!362217))

(assert (= (and b!362217 (not res!201645)) b!362218))

(declare-fun m!358305 () Bool)

(assert (=> b!362218 m!358305))

(declare-fun m!358307 () Bool)

(assert (=> b!362218 m!358307))

(declare-fun m!358309 () Bool)

(assert (=> b!362217 m!358309))

(declare-fun m!358311 () Bool)

(assert (=> b!362217 m!358311))

(declare-fun m!358313 () Bool)

(assert (=> b!362217 m!358313))

(declare-fun m!358315 () Bool)

(assert (=> b!362217 m!358315))

(declare-fun m!358317 () Bool)

(assert (=> b!362215 m!358317))

(assert (=> b!362215 m!358317))

(declare-fun m!358319 () Bool)

(assert (=> b!362215 m!358319))

(declare-fun m!358321 () Bool)

(assert (=> b!362214 m!358321))

(declare-fun m!358323 () Bool)

(assert (=> start!36132 m!358323))

(push 1)

(assert (not b!362218))

(assert (not b!362217))

(assert (not b!362214))

(assert (not b!362215))

(assert (not start!36132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

