; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36186 () Bool)

(assert start!36186)

(declare-fun b!362601 () Bool)

(declare-fun res!202032 () Bool)

(declare-fun e!222052 () Bool)

(assert (=> b!362601 (=> (not res!202032) (not e!222052))))

(declare-datatypes ((array!20498 0))(
  ( (array!20499 (arr!9731 (Array (_ BitVec 32) (_ BitVec 64))) (size!10084 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20498)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362601 (= res!202032 (not (validKeyInArray!0 (select (arr!9731 a!4337) i!1478))))))

(declare-fun b!362602 () Bool)

(declare-fun e!222054 () Bool)

(assert (=> b!362602 (= e!222052 (not e!222054))))

(declare-fun res!202035 () Bool)

(assert (=> b!362602 (=> res!202035 e!222054)))

(assert (=> b!362602 (= res!202035 (or (bvslt (size!10084 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!166989 () (_ BitVec 32))

(declare-fun lt!166986 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20498 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362602 (= (bvadd lt!166989 lt!166986) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10084 a!4337)))))

(declare-datatypes ((Unit!11158 0))(
  ( (Unit!11159) )
))
(declare-fun lt!166991 () Unit!11158)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20498 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11158)

(assert (=> b!362602 (= lt!166991 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10084 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166984 () (_ BitVec 32))

(assert (=> b!362602 (= lt!166984 lt!166986)))

(assert (=> b!362602 (= lt!166986 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10084 a!4337)))))

(declare-fun lt!166990 () array!20498)

(assert (=> b!362602 (= lt!166984 (arrayCountValidKeys!0 lt!166990 (bvadd #b00000000000000000000000000000001 i!1478) (size!10084 a!4337)))))

(declare-fun lt!166985 () Unit!11158)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20498 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11158)

(assert (=> b!362602 (= lt!166985 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166987 () (_ BitVec 32))

(assert (=> b!362602 (= lt!166987 (bvadd #b00000000000000000000000000000001 lt!166989))))

(assert (=> b!362602 (= lt!166987 (arrayCountValidKeys!0 lt!166990 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362602 (= lt!166989 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362602 (= lt!166990 (array!20499 (store (arr!9731 a!4337) i!1478 k!2980) (size!10084 a!4337)))))

(declare-fun lt!166988 () Unit!11158)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20498 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11158)

(assert (=> b!362602 (= lt!166988 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362603 () Bool)

(assert (=> b!362603 (= e!222054 true)))

(assert (=> b!362603 (= (bvadd lt!166987 lt!166984) (arrayCountValidKeys!0 lt!166990 #b00000000000000000000000000000000 (size!10084 a!4337)))))

(declare-fun lt!166983 () Unit!11158)

(assert (=> b!362603 (= lt!166983 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!166990 #b00000000000000000000000000000000 (size!10084 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362604 () Bool)

(declare-fun res!202036 () Bool)

(assert (=> b!362604 (=> (not res!202036) (not e!222052))))

(assert (=> b!362604 (= res!202036 (validKeyInArray!0 k!2980))))

(declare-fun res!202034 () Bool)

(assert (=> start!36186 (=> (not res!202034) (not e!222052))))

(assert (=> start!36186 (= res!202034 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10084 a!4337))))))

(assert (=> start!36186 e!222052))

(assert (=> start!36186 true))

(declare-fun array_inv!7180 (array!20498) Bool)

(assert (=> start!36186 (array_inv!7180 a!4337)))

(declare-fun b!362605 () Bool)

(declare-fun res!202033 () Bool)

(assert (=> b!362605 (=> (not res!202033) (not e!222052))))

(assert (=> b!362605 (= res!202033 (bvslt (size!10084 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36186 res!202034) b!362601))

(assert (= (and b!362601 res!202032) b!362604))

(assert (= (and b!362604 res!202036) b!362605))

(assert (= (and b!362605 res!202033) b!362602))

(assert (= (and b!362602 (not res!202035)) b!362603))

(declare-fun m!358939 () Bool)

(assert (=> b!362602 m!358939))

(declare-fun m!358941 () Bool)

(assert (=> b!362602 m!358941))

(declare-fun m!358943 () Bool)

(assert (=> b!362602 m!358943))

(declare-fun m!358945 () Bool)

(assert (=> b!362602 m!358945))

(declare-fun m!358947 () Bool)

(assert (=> b!362602 m!358947))

(declare-fun m!358949 () Bool)

(assert (=> b!362602 m!358949))

(declare-fun m!358951 () Bool)

(assert (=> b!362602 m!358951))

(declare-fun m!358953 () Bool)

(assert (=> b!362602 m!358953))

(declare-fun m!358955 () Bool)

(assert (=> b!362602 m!358955))

(declare-fun m!358957 () Bool)

(assert (=> start!36186 m!358957))

(declare-fun m!358959 () Bool)

(assert (=> b!362603 m!358959))

(declare-fun m!358961 () Bool)

(assert (=> b!362603 m!358961))

(declare-fun m!358963 () Bool)

(assert (=> b!362601 m!358963))

(assert (=> b!362601 m!358963))

(declare-fun m!358965 () Bool)

(assert (=> b!362601 m!358965))

(declare-fun m!358967 () Bool)

(assert (=> b!362604 m!358967))

(push 1)

(assert (not b!362602))

(assert (not b!362604))

(assert (not start!36186))

(assert (not b!362603))

(assert (not b!362601))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

