; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36158 () Bool)

(assert start!36158)

(declare-fun b!362409 () Bool)

(declare-fun e!221946 () Bool)

(assert (=> b!362409 (= e!221946 true)))

(declare-fun lt!166685 () (_ BitVec 32))

(declare-datatypes ((array!20470 0))(
  ( (array!20471 (arr!9717 (Array (_ BitVec 32) (_ BitVec 64))) (size!10070 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20470)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20470 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362409 (= lt!166685 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166684 () (_ BitVec 32))

(declare-fun lt!166683 () array!20470)

(assert (=> b!362409 (= lt!166684 (arrayCountValidKeys!0 lt!166683 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!201842 () Bool)

(declare-fun e!221944 () Bool)

(assert (=> start!36158 (=> (not res!201842) (not e!221944))))

(assert (=> start!36158 (= res!201842 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10070 a!4337))))))

(assert (=> start!36158 e!221944))

(assert (=> start!36158 true))

(declare-fun array_inv!7166 (array!20470) Bool)

(assert (=> start!36158 (array_inv!7166 a!4337)))

(declare-fun b!362410 () Bool)

(assert (=> b!362410 (= e!221944 (not e!221946))))

(declare-fun res!201843 () Bool)

(assert (=> b!362410 (=> res!201843 e!221946)))

(assert (=> b!362410 (= res!201843 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(assert (=> b!362410 (= (arrayCountValidKeys!0 lt!166683 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362410 (= lt!166683 (array!20471 (store (arr!9717 a!4337) i!1478 k!2980) (size!10070 a!4337)))))

(declare-datatypes ((Unit!11130 0))(
  ( (Unit!11131) )
))
(declare-fun lt!166682 () Unit!11130)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20470 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11130)

(assert (=> b!362410 (= lt!166682 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362411 () Bool)

(declare-fun res!201840 () Bool)

(assert (=> b!362411 (=> (not res!201840) (not e!221944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362411 (= res!201840 (validKeyInArray!0 k!2980))))

(declare-fun b!362412 () Bool)

(declare-fun res!201841 () Bool)

(assert (=> b!362412 (=> (not res!201841) (not e!221944))))

(assert (=> b!362412 (= res!201841 (bvslt (size!10070 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362413 () Bool)

(declare-fun res!201844 () Bool)

(assert (=> b!362413 (=> (not res!201844) (not e!221944))))

(assert (=> b!362413 (= res!201844 (not (validKeyInArray!0 (select (arr!9717 a!4337) i!1478))))))

(assert (= (and start!36158 res!201842) b!362413))

(assert (= (and b!362413 res!201844) b!362411))

(assert (= (and b!362411 res!201840) b!362412))

(assert (= (and b!362412 res!201841) b!362410))

(assert (= (and b!362410 (not res!201843)) b!362409))

(declare-fun m!358565 () Bool)

(assert (=> start!36158 m!358565))

(declare-fun m!358567 () Bool)

(assert (=> b!362413 m!358567))

(assert (=> b!362413 m!358567))

(declare-fun m!358569 () Bool)

(assert (=> b!362413 m!358569))

(declare-fun m!358571 () Bool)

(assert (=> b!362410 m!358571))

(declare-fun m!358573 () Bool)

(assert (=> b!362410 m!358573))

(declare-fun m!358575 () Bool)

(assert (=> b!362410 m!358575))

(declare-fun m!358577 () Bool)

(assert (=> b!362410 m!358577))

(declare-fun m!358579 () Bool)

(assert (=> b!362411 m!358579))

(declare-fun m!358581 () Bool)

(assert (=> b!362409 m!358581))

(declare-fun m!358583 () Bool)

(assert (=> b!362409 m!358583))

(push 1)

(assert (not b!362411))

(assert (not b!362410))

(assert (not b!362409))

(assert (not start!36158))

(assert (not b!362413))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

