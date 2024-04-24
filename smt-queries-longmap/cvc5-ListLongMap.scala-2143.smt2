; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36140 () Bool)

(assert start!36140)

(declare-fun res!201832 () Bool)

(declare-fun e!222007 () Bool)

(assert (=> start!36140 (=> (not res!201832) (not e!222007))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20451 0))(
  ( (array!20452 (arr!9707 (Array (_ BitVec 32) (_ BitVec 64))) (size!10059 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20451)

(assert (=> start!36140 (= res!201832 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10059 a!4337))))))

(assert (=> start!36140 e!222007))

(assert (=> start!36140 true))

(declare-fun array_inv!7179 (array!20451) Bool)

(assert (=> start!36140 (array_inv!7179 a!4337)))

(declare-fun b!362496 () Bool)

(declare-fun res!201833 () Bool)

(assert (=> b!362496 (=> (not res!201833) (not e!222007))))

(assert (=> b!362496 (= res!201833 (bvslt (size!10059 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362497 () Bool)

(declare-fun res!201835 () Bool)

(assert (=> b!362497 (=> (not res!201835) (not e!222007))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362497 (= res!201835 (validKeyInArray!0 k!2980))))

(declare-fun b!362498 () Bool)

(declare-fun e!222006 () Bool)

(assert (=> b!362498 (= e!222006 true)))

(declare-fun lt!166828 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20451 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362498 (= lt!166828 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166830 () (_ BitVec 32))

(declare-fun lt!166829 () array!20451)

(assert (=> b!362498 (= lt!166830 (arrayCountValidKeys!0 lt!166829 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362499 () Bool)

(declare-fun res!201831 () Bool)

(assert (=> b!362499 (=> (not res!201831) (not e!222007))))

(assert (=> b!362499 (= res!201831 (not (validKeyInArray!0 (select (arr!9707 a!4337) i!1478))))))

(declare-fun b!362500 () Bool)

(assert (=> b!362500 (= e!222007 (not e!222006))))

(declare-fun res!201834 () Bool)

(assert (=> b!362500 (=> res!201834 e!222006)))

(assert (=> b!362500 (= res!201834 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(assert (=> b!362500 (= (arrayCountValidKeys!0 lt!166829 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362500 (= lt!166829 (array!20452 (store (arr!9707 a!4337) i!1478 k!2980) (size!10059 a!4337)))))

(declare-datatypes ((Unit!11123 0))(
  ( (Unit!11124) )
))
(declare-fun lt!166827 () Unit!11123)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20451 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11123)

(assert (=> b!362500 (= lt!166827 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(assert (= (and start!36140 res!201832) b!362499))

(assert (= (and b!362499 res!201831) b!362497))

(assert (= (and b!362497 res!201835) b!362496))

(assert (= (and b!362496 res!201833) b!362500))

(assert (= (and b!362500 (not res!201834)) b!362498))

(declare-fun m!359339 () Bool)

(assert (=> start!36140 m!359339))

(declare-fun m!359341 () Bool)

(assert (=> b!362499 m!359341))

(assert (=> b!362499 m!359341))

(declare-fun m!359343 () Bool)

(assert (=> b!362499 m!359343))

(declare-fun m!359345 () Bool)

(assert (=> b!362497 m!359345))

(declare-fun m!359347 () Bool)

(assert (=> b!362498 m!359347))

(declare-fun m!359349 () Bool)

(assert (=> b!362498 m!359349))

(declare-fun m!359351 () Bool)

(assert (=> b!362500 m!359351))

(declare-fun m!359353 () Bool)

(assert (=> b!362500 m!359353))

(declare-fun m!359355 () Bool)

(assert (=> b!362500 m!359355))

(declare-fun m!359357 () Bool)

(assert (=> b!362500 m!359357))

(push 1)

(assert (not b!362499))

(assert (not b!362498))

(assert (not b!362497))

(assert (not start!36140))

(assert (not b!362500))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

