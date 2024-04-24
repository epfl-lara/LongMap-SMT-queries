; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36146 () Bool)

(assert start!36146)

(declare-fun b!362541 () Bool)

(declare-fun e!222033 () Bool)

(assert (=> b!362541 (= e!222033 true)))

(declare-fun lt!166864 () (_ BitVec 32))

(declare-datatypes ((array!20457 0))(
  ( (array!20458 (arr!9710 (Array (_ BitVec 32) (_ BitVec 64))) (size!10062 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20457)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20457 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362541 (= lt!166864 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166866 () (_ BitVec 32))

(declare-fun lt!166865 () array!20457)

(assert (=> b!362541 (= lt!166866 (arrayCountValidKeys!0 lt!166865 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362542 () Bool)

(declare-fun e!222034 () Bool)

(assert (=> b!362542 (= e!222034 (not e!222033))))

(declare-fun res!201879 () Bool)

(assert (=> b!362542 (=> res!201879 e!222033)))

(assert (=> b!362542 (= res!201879 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(assert (=> b!362542 (= (arrayCountValidKeys!0 lt!166865 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362542 (= lt!166865 (array!20458 (store (arr!9710 a!4337) i!1478 k!2980) (size!10062 a!4337)))))

(declare-datatypes ((Unit!11129 0))(
  ( (Unit!11130) )
))
(declare-fun lt!166863 () Unit!11129)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11129)

(assert (=> b!362542 (= lt!166863 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362543 () Bool)

(declare-fun res!201876 () Bool)

(assert (=> b!362543 (=> (not res!201876) (not e!222034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362543 (= res!201876 (not (validKeyInArray!0 (select (arr!9710 a!4337) i!1478))))))

(declare-fun res!201878 () Bool)

(assert (=> start!36146 (=> (not res!201878) (not e!222034))))

(assert (=> start!36146 (= res!201878 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10062 a!4337))))))

(assert (=> start!36146 e!222034))

(assert (=> start!36146 true))

(declare-fun array_inv!7182 (array!20457) Bool)

(assert (=> start!36146 (array_inv!7182 a!4337)))

(declare-fun b!362544 () Bool)

(declare-fun res!201877 () Bool)

(assert (=> b!362544 (=> (not res!201877) (not e!222034))))

(assert (=> b!362544 (= res!201877 (bvslt (size!10062 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362545 () Bool)

(declare-fun res!201880 () Bool)

(assert (=> b!362545 (=> (not res!201880) (not e!222034))))

(assert (=> b!362545 (= res!201880 (validKeyInArray!0 k!2980))))

(assert (= (and start!36146 res!201878) b!362543))

(assert (= (and b!362543 res!201876) b!362545))

(assert (= (and b!362545 res!201880) b!362544))

(assert (= (and b!362544 res!201877) b!362542))

(assert (= (and b!362542 (not res!201879)) b!362541))

(declare-fun m!359399 () Bool)

(assert (=> start!36146 m!359399))

(declare-fun m!359401 () Bool)

(assert (=> b!362545 m!359401))

(declare-fun m!359403 () Bool)

(assert (=> b!362542 m!359403))

(declare-fun m!359405 () Bool)

(assert (=> b!362542 m!359405))

(declare-fun m!359407 () Bool)

(assert (=> b!362542 m!359407))

(declare-fun m!359409 () Bool)

(assert (=> b!362542 m!359409))

(declare-fun m!359411 () Bool)

(assert (=> b!362543 m!359411))

(assert (=> b!362543 m!359411))

(declare-fun m!359413 () Bool)

(assert (=> b!362543 m!359413))

(declare-fun m!359415 () Bool)

(assert (=> b!362541 m!359415))

(declare-fun m!359417 () Bool)

(assert (=> b!362541 m!359417))

(push 1)

(assert (not b!362541))

(assert (not b!362542))

(assert (not b!362543))

(assert (not b!362545))

(assert (not start!36146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

