; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36138 () Bool)

(assert start!36138)

(declare-fun b!362259 () Bool)

(declare-fun e!221854 () Bool)

(declare-fun e!221856 () Bool)

(assert (=> b!362259 (= e!221854 (not e!221856))))

(declare-fun res!201692 () Bool)

(assert (=> b!362259 (=> res!201692 e!221856)))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362259 (= res!201692 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-datatypes ((array!20450 0))(
  ( (array!20451 (arr!9707 (Array (_ BitVec 32) (_ BitVec 64))) (size!10060 (_ BitVec 32))) )
))
(declare-fun lt!166564 () array!20450)

(declare-fun a!4337 () array!20450)

(declare-fun arrayCountValidKeys!0 (array!20450 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362259 (= (arrayCountValidKeys!0 lt!166564 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362259 (= lt!166564 (array!20451 (store (arr!9707 a!4337) i!1478 k!2980) (size!10060 a!4337)))))

(declare-datatypes ((Unit!11110 0))(
  ( (Unit!11111) )
))
(declare-fun lt!166563 () Unit!11110)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20450 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11110)

(assert (=> b!362259 (= lt!166563 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362260 () Bool)

(declare-fun res!201693 () Bool)

(assert (=> b!362260 (=> (not res!201693) (not e!221854))))

(assert (=> b!362260 (= res!201693 (bvslt (size!10060 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362261 () Bool)

(assert (=> b!362261 (= e!221856 true)))

(declare-fun lt!166565 () (_ BitVec 32))

(assert (=> b!362261 (= lt!166565 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166562 () (_ BitVec 32))

(assert (=> b!362261 (= lt!166562 (arrayCountValidKeys!0 lt!166564 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362262 () Bool)

(declare-fun res!201690 () Bool)

(assert (=> b!362262 (=> (not res!201690) (not e!221854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362262 (= res!201690 (not (validKeyInArray!0 (select (arr!9707 a!4337) i!1478))))))

(declare-fun b!362263 () Bool)

(declare-fun res!201694 () Bool)

(assert (=> b!362263 (=> (not res!201694) (not e!221854))))

(assert (=> b!362263 (= res!201694 (validKeyInArray!0 k!2980))))

(declare-fun res!201691 () Bool)

(assert (=> start!36138 (=> (not res!201691) (not e!221854))))

(assert (=> start!36138 (= res!201691 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10060 a!4337))))))

(assert (=> start!36138 e!221854))

(assert (=> start!36138 true))

(declare-fun array_inv!7156 (array!20450) Bool)

(assert (=> start!36138 (array_inv!7156 a!4337)))

(assert (= (and start!36138 res!201691) b!362262))

(assert (= (and b!362262 res!201690) b!362263))

(assert (= (and b!362263 res!201694) b!362260))

(assert (= (and b!362260 res!201693) b!362259))

(assert (= (and b!362259 (not res!201692)) b!362261))

(declare-fun m!358365 () Bool)

(assert (=> b!362261 m!358365))

(declare-fun m!358367 () Bool)

(assert (=> b!362261 m!358367))

(declare-fun m!358369 () Bool)

(assert (=> start!36138 m!358369))

(declare-fun m!358371 () Bool)

(assert (=> b!362263 m!358371))

(declare-fun m!358373 () Bool)

(assert (=> b!362259 m!358373))

(declare-fun m!358375 () Bool)

(assert (=> b!362259 m!358375))

(declare-fun m!358377 () Bool)

(assert (=> b!362259 m!358377))

(declare-fun m!358379 () Bool)

(assert (=> b!362259 m!358379))

(declare-fun m!358381 () Bool)

(assert (=> b!362262 m!358381))

(assert (=> b!362262 m!358381))

(declare-fun m!358383 () Bool)

(assert (=> b!362262 m!358383))

(push 1)

(assert (not b!362262))

(assert (not b!362261))

(assert (not start!36138))

(assert (not b!362263))

(assert (not b!362259))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

