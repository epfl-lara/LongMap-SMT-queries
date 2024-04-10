; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36174 () Bool)

(assert start!36174)

(declare-fun b!362695 () Bool)

(declare-fun res!201983 () Bool)

(declare-fun e!222126 () Bool)

(assert (=> b!362695 (=> (not res!201983) (not e!222126))))

(declare-datatypes ((array!20490 0))(
  ( (array!20491 (arr!9727 (Array (_ BitVec 32) (_ BitVec 64))) (size!10079 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20490)

(assert (=> b!362695 (= res!201983 (bvslt (size!10079 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362696 () Bool)

(assert (=> b!362696 (= e!222126 (not true))))

(declare-fun lt!166927 () array!20490)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20490 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362696 (= (arrayCountValidKeys!0 lt!166927 (bvadd #b00000000000000000000000000000001 i!1478) (size!10079 a!4337)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10079 a!4337)))))

(declare-datatypes ((Unit!11154 0))(
  ( (Unit!11155) )
))
(declare-fun lt!166928 () Unit!11154)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20490 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11154)

(assert (=> b!362696 (= lt!166928 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362696 (= (arrayCountValidKeys!0 lt!166927 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362696 (= lt!166927 (array!20491 (store (arr!9727 a!4337) i!1478 k!2980) (size!10079 a!4337)))))

(declare-fun lt!166926 () Unit!11154)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20490 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11154)

(assert (=> b!362696 (= lt!166926 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362693 () Bool)

(declare-fun res!201982 () Bool)

(assert (=> b!362693 (=> (not res!201982) (not e!222126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362693 (= res!201982 (not (validKeyInArray!0 (select (arr!9727 a!4337) i!1478))))))

(declare-fun b!362694 () Bool)

(declare-fun res!201984 () Bool)

(assert (=> b!362694 (=> (not res!201984) (not e!222126))))

(assert (=> b!362694 (= res!201984 (validKeyInArray!0 k!2980))))

(declare-fun res!201985 () Bool)

(assert (=> start!36174 (=> (not res!201985) (not e!222126))))

(assert (=> start!36174 (= res!201985 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10079 a!4337))))))

(assert (=> start!36174 e!222126))

(assert (=> start!36174 true))

(declare-fun array_inv!7169 (array!20490) Bool)

(assert (=> start!36174 (array_inv!7169 a!4337)))

(assert (= (and start!36174 res!201985) b!362693))

(assert (= (and b!362693 res!201982) b!362694))

(assert (= (and b!362694 res!201984) b!362695))

(assert (= (and b!362695 res!201983) b!362696))

(declare-fun m!359309 () Bool)

(assert (=> b!362696 m!359309))

(declare-fun m!359311 () Bool)

(assert (=> b!362696 m!359311))

(declare-fun m!359313 () Bool)

(assert (=> b!362696 m!359313))

(declare-fun m!359315 () Bool)

(assert (=> b!362696 m!359315))

(declare-fun m!359317 () Bool)

(assert (=> b!362696 m!359317))

(declare-fun m!359319 () Bool)

(assert (=> b!362696 m!359319))

(declare-fun m!359321 () Bool)

(assert (=> b!362696 m!359321))

(declare-fun m!359323 () Bool)

(assert (=> b!362693 m!359323))

(assert (=> b!362693 m!359323))

(declare-fun m!359325 () Bool)

(assert (=> b!362693 m!359325))

(declare-fun m!359327 () Bool)

(assert (=> b!362694 m!359327))

(declare-fun m!359329 () Bool)

(assert (=> start!36174 m!359329))

(push 1)

(assert (not start!36174))

(assert (not b!362693))

(assert (not b!362694))

(assert (not b!362696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

