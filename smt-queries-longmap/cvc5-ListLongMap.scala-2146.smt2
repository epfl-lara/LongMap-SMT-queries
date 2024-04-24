; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36158 () Bool)

(assert start!36158)

(declare-fun b!362631 () Bool)

(declare-fun e!222086 () Bool)

(assert (=> b!362631 (= e!222086 true)))

(declare-fun lt!166935 () (_ BitVec 32))

(declare-datatypes ((array!20469 0))(
  ( (array!20470 (arr!9716 (Array (_ BitVec 32) (_ BitVec 64))) (size!10068 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20469)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20469 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362631 (= lt!166935 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166938 () (_ BitVec 32))

(declare-fun lt!166936 () array!20469)

(assert (=> b!362631 (= lt!166938 (arrayCountValidKeys!0 lt!166936 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!201970 () Bool)

(declare-fun e!222088 () Bool)

(assert (=> start!36158 (=> (not res!201970) (not e!222088))))

(assert (=> start!36158 (= res!201970 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10068 a!4337))))))

(assert (=> start!36158 e!222088))

(assert (=> start!36158 true))

(declare-fun array_inv!7188 (array!20469) Bool)

(assert (=> start!36158 (array_inv!7188 a!4337)))

(declare-fun b!362632 () Bool)

(declare-fun res!201968 () Bool)

(assert (=> b!362632 (=> (not res!201968) (not e!222088))))

(assert (=> b!362632 (= res!201968 (bvslt (size!10068 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362633 () Bool)

(declare-fun res!201966 () Bool)

(assert (=> b!362633 (=> (not res!201966) (not e!222088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362633 (= res!201966 (not (validKeyInArray!0 (select (arr!9716 a!4337) i!1478))))))

(declare-fun b!362634 () Bool)

(assert (=> b!362634 (= e!222088 (not e!222086))))

(declare-fun res!201967 () Bool)

(assert (=> b!362634 (=> res!201967 e!222086)))

(assert (=> b!362634 (= res!201967 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(assert (=> b!362634 (= (arrayCountValidKeys!0 lt!166936 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362634 (= lt!166936 (array!20470 (store (arr!9716 a!4337) i!1478 k!2980) (size!10068 a!4337)))))

(declare-datatypes ((Unit!11141 0))(
  ( (Unit!11142) )
))
(declare-fun lt!166937 () Unit!11141)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20469 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11141)

(assert (=> b!362634 (= lt!166937 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362635 () Bool)

(declare-fun res!201969 () Bool)

(assert (=> b!362635 (=> (not res!201969) (not e!222088))))

(assert (=> b!362635 (= res!201969 (validKeyInArray!0 k!2980))))

(assert (= (and start!36158 res!201970) b!362633))

(assert (= (and b!362633 res!201966) b!362635))

(assert (= (and b!362635 res!201969) b!362632))

(assert (= (and b!362632 res!201968) b!362634))

(assert (= (and b!362634 (not res!201967)) b!362631))

(declare-fun m!359519 () Bool)

(assert (=> b!362635 m!359519))

(declare-fun m!359521 () Bool)

(assert (=> b!362631 m!359521))

(declare-fun m!359523 () Bool)

(assert (=> b!362631 m!359523))

(declare-fun m!359525 () Bool)

(assert (=> start!36158 m!359525))

(declare-fun m!359527 () Bool)

(assert (=> b!362633 m!359527))

(assert (=> b!362633 m!359527))

(declare-fun m!359529 () Bool)

(assert (=> b!362633 m!359529))

(declare-fun m!359531 () Bool)

(assert (=> b!362634 m!359531))

(declare-fun m!359533 () Bool)

(assert (=> b!362634 m!359533))

(declare-fun m!359535 () Bool)

(assert (=> b!362634 m!359535))

(declare-fun m!359537 () Bool)

(assert (=> b!362634 m!359537))

(push 1)

(assert (not b!362635))

(assert (not b!362634))

(assert (not b!362633))

(assert (not start!36158))

(assert (not b!362631))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

