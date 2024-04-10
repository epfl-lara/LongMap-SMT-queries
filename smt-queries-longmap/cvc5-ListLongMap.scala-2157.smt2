; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36252 () Bool)

(assert start!36252)

(declare-fun b!363139 () Bool)

(declare-fun e!222369 () Bool)

(assert (=> b!363139 (= e!222369 (not true))))

(declare-datatypes ((array!20553 0))(
  ( (array!20554 (arr!9757 (Array (_ BitVec 32) (_ BitVec 64))) (size!10109 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20553)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!20553 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363139 (= (arrayCountValidKeys!0 (array!20554 (store (arr!9757 a!4337) i!1478 k!2980) (size!10109 a!4337)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-datatypes ((Unit!11202 0))(
  ( (Unit!11203) )
))
(declare-fun lt!167368 () Unit!11202)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11202)

(assert (=> b!363139 (= lt!167368 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363137 () Bool)

(declare-fun res!202371 () Bool)

(assert (=> b!363137 (=> (not res!202371) (not e!222369))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363137 (= res!202371 (validKeyInArray!0 k!2980))))

(declare-fun res!202370 () Bool)

(assert (=> start!36252 (=> (not res!202370) (not e!222369))))

(assert (=> start!36252 (= res!202370 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10109 a!4337))))))

(assert (=> start!36252 e!222369))

(assert (=> start!36252 true))

(declare-fun array_inv!7199 (array!20553) Bool)

(assert (=> start!36252 (array_inv!7199 a!4337)))

(declare-fun b!363138 () Bool)

(declare-fun res!202369 () Bool)

(assert (=> b!363138 (=> (not res!202369) (not e!222369))))

(assert (=> b!363138 (= res!202369 (bvslt (size!10109 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363136 () Bool)

(declare-fun res!202372 () Bool)

(assert (=> b!363136 (=> (not res!202372) (not e!222369))))

(assert (=> b!363136 (= res!202372 (not (validKeyInArray!0 (select (arr!9757 a!4337) i!1478))))))

(assert (= (and start!36252 res!202370) b!363136))

(assert (= (and b!363136 res!202372) b!363137))

(assert (= (and b!363137 res!202371) b!363138))

(assert (= (and b!363138 res!202369) b!363139))

(declare-fun m!360011 () Bool)

(assert (=> b!363139 m!360011))

(declare-fun m!360013 () Bool)

(assert (=> b!363139 m!360013))

(declare-fun m!360015 () Bool)

(assert (=> b!363139 m!360015))

(declare-fun m!360017 () Bool)

(assert (=> b!363139 m!360017))

(declare-fun m!360019 () Bool)

(assert (=> b!363137 m!360019))

(declare-fun m!360021 () Bool)

(assert (=> start!36252 m!360021))

(declare-fun m!360023 () Bool)

(assert (=> b!363136 m!360023))

(assert (=> b!363136 m!360023))

(declare-fun m!360025 () Bool)

(assert (=> b!363136 m!360025))

(push 1)

(assert (not start!36252))

(assert (not b!363139))

(assert (not b!363136))

(assert (not b!363137))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

