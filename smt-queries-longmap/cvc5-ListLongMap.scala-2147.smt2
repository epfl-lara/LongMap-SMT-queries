; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36164 () Bool)

(assert start!36164)

(declare-fun res!201877 () Bool)

(declare-fun e!221963 () Bool)

(assert (=> start!36164 (=> (not res!201877) (not e!221963))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20476 0))(
  ( (array!20477 (arr!9720 (Array (_ BitVec 32) (_ BitVec 64))) (size!10073 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20476)

(assert (=> start!36164 (= res!201877 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10073 a!4337))))))

(assert (=> start!36164 e!221963))

(assert (=> start!36164 true))

(declare-fun array_inv!7169 (array!20476) Bool)

(assert (=> start!36164 (array_inv!7169 a!4337)))

(declare-fun b!362447 () Bool)

(declare-fun res!201880 () Bool)

(assert (=> b!362447 (=> (not res!201880) (not e!221963))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362447 (= res!201880 (validKeyInArray!0 k!2980))))

(declare-fun b!362449 () Bool)

(assert (=> b!362449 (= e!221963 (not true))))

(declare-fun lt!166710 () array!20476)

(declare-fun arrayCountValidKeys!0 (array!20476 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362449 (= (arrayCountValidKeys!0 lt!166710 (bvadd #b00000000000000000000000000000001 i!1478) (size!10073 a!4337)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10073 a!4337)))))

(declare-datatypes ((Unit!11136 0))(
  ( (Unit!11137) )
))
(declare-fun lt!166711 () Unit!11136)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20476 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11136)

(assert (=> b!362449 (= lt!166711 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362449 (= (arrayCountValidKeys!0 lt!166710 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362449 (= lt!166710 (array!20477 (store (arr!9720 a!4337) i!1478 k!2980) (size!10073 a!4337)))))

(declare-fun lt!166712 () Unit!11136)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20476 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11136)

(assert (=> b!362449 (= lt!166712 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362446 () Bool)

(declare-fun res!201878 () Bool)

(assert (=> b!362446 (=> (not res!201878) (not e!221963))))

(assert (=> b!362446 (= res!201878 (not (validKeyInArray!0 (select (arr!9720 a!4337) i!1478))))))

(declare-fun b!362448 () Bool)

(declare-fun res!201879 () Bool)

(assert (=> b!362448 (=> (not res!201879) (not e!221963))))

(assert (=> b!362448 (= res!201879 (bvslt (size!10073 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36164 res!201877) b!362446))

(assert (= (and b!362446 res!201878) b!362447))

(assert (= (and b!362447 res!201880) b!362448))

(assert (= (and b!362448 res!201879) b!362449))

(declare-fun m!358629 () Bool)

(assert (=> start!36164 m!358629))

(declare-fun m!358631 () Bool)

(assert (=> b!362447 m!358631))

(declare-fun m!358633 () Bool)

(assert (=> b!362449 m!358633))

(declare-fun m!358635 () Bool)

(assert (=> b!362449 m!358635))

(declare-fun m!358637 () Bool)

(assert (=> b!362449 m!358637))

(declare-fun m!358639 () Bool)

(assert (=> b!362449 m!358639))

(declare-fun m!358641 () Bool)

(assert (=> b!362449 m!358641))

(declare-fun m!358643 () Bool)

(assert (=> b!362449 m!358643))

(declare-fun m!358645 () Bool)

(assert (=> b!362449 m!358645))

(declare-fun m!358647 () Bool)

(assert (=> b!362446 m!358647))

(assert (=> b!362446 m!358647))

(declare-fun m!358649 () Bool)

(assert (=> b!362446 m!358649))

(push 1)

(assert (not b!362449))

(assert (not start!36164))

(assert (not b!362447))

(assert (not b!362446))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

