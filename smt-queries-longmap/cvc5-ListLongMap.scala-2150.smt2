; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36182 () Bool)

(assert start!36182)

(declare-fun b!362793 () Bool)

(declare-fun res!202128 () Bool)

(declare-fun e!222178 () Bool)

(assert (=> b!362793 (=> (not res!202128) (not e!222178))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362793 (= res!202128 (validKeyInArray!0 k!2980))))

(declare-fun b!362794 () Bool)

(declare-fun res!202129 () Bool)

(assert (=> b!362794 (=> (not res!202129) (not e!222178))))

(declare-datatypes ((array!20493 0))(
  ( (array!20494 (arr!9728 (Array (_ BitVec 32) (_ BitVec 64))) (size!10080 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20493)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362794 (= res!202129 (not (validKeyInArray!0 (select (arr!9728 a!4337) i!1478))))))

(declare-fun b!362795 () Bool)

(declare-fun e!222177 () Bool)

(assert (=> b!362795 (= e!222178 (not e!222177))))

(declare-fun res!202131 () Bool)

(assert (=> b!362795 (=> res!202131 e!222177)))

(assert (=> b!362795 (= res!202131 (or (bvslt (size!10080 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167189 () (_ BitVec 32))

(declare-fun lt!167187 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20493 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362795 (= (bvadd lt!167189 lt!167187) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10080 a!4337)))))

(declare-datatypes ((Unit!11165 0))(
  ( (Unit!11166) )
))
(declare-fun lt!167183 () Unit!11165)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11165)

(assert (=> b!362795 (= lt!167183 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10080 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167184 () (_ BitVec 32))

(assert (=> b!362795 (= lt!167184 lt!167187)))

(assert (=> b!362795 (= lt!167187 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10080 a!4337)))))

(declare-fun lt!167190 () array!20493)

(assert (=> b!362795 (= lt!167184 (arrayCountValidKeys!0 lt!167190 (bvadd #b00000000000000000000000000000001 i!1478) (size!10080 a!4337)))))

(declare-fun lt!167185 () Unit!11165)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20493 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11165)

(assert (=> b!362795 (= lt!167185 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167182 () (_ BitVec 32))

(assert (=> b!362795 (= lt!167182 (bvadd #b00000000000000000000000000000001 lt!167189))))

(assert (=> b!362795 (= lt!167182 (arrayCountValidKeys!0 lt!167190 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362795 (= lt!167189 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362795 (= lt!167190 (array!20494 (store (arr!9728 a!4337) i!1478 k!2980) (size!10080 a!4337)))))

(declare-fun lt!167186 () Unit!11165)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20493 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11165)

(assert (=> b!362795 (= lt!167186 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362796 () Bool)

(declare-fun res!202130 () Bool)

(assert (=> b!362796 (=> (not res!202130) (not e!222178))))

(assert (=> b!362796 (= res!202130 (bvslt (size!10080 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362797 () Bool)

(assert (=> b!362797 (= e!222177 true)))

(assert (=> b!362797 (= (bvadd lt!167182 lt!167184) (arrayCountValidKeys!0 lt!167190 #b00000000000000000000000000000000 (size!10080 a!4337)))))

(declare-fun lt!167188 () Unit!11165)

(assert (=> b!362797 (= lt!167188 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167190 #b00000000000000000000000000000000 (size!10080 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!202132 () Bool)

(assert (=> start!36182 (=> (not res!202132) (not e!222178))))

(assert (=> start!36182 (= res!202132 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10080 a!4337))))))

(assert (=> start!36182 e!222178))

(assert (=> start!36182 true))

(declare-fun array_inv!7200 (array!20493) Bool)

(assert (=> start!36182 (array_inv!7200 a!4337)))

(assert (= (and start!36182 res!202132) b!362794))

(assert (= (and b!362794 res!202129) b!362793))

(assert (= (and b!362793 res!202128) b!362796))

(assert (= (and b!362796 res!202130) b!362795))

(assert (= (and b!362795 (not res!202131)) b!362797))

(declare-fun m!359833 () Bool)

(assert (=> start!36182 m!359833))

(declare-fun m!359835 () Bool)

(assert (=> b!362795 m!359835))

(declare-fun m!359837 () Bool)

(assert (=> b!362795 m!359837))

(declare-fun m!359839 () Bool)

(assert (=> b!362795 m!359839))

(declare-fun m!359841 () Bool)

(assert (=> b!362795 m!359841))

(declare-fun m!359843 () Bool)

(assert (=> b!362795 m!359843))

(declare-fun m!359845 () Bool)

(assert (=> b!362795 m!359845))

(declare-fun m!359847 () Bool)

(assert (=> b!362795 m!359847))

(declare-fun m!359849 () Bool)

(assert (=> b!362795 m!359849))

(declare-fun m!359851 () Bool)

(assert (=> b!362795 m!359851))

(declare-fun m!359853 () Bool)

(assert (=> b!362797 m!359853))

(declare-fun m!359855 () Bool)

(assert (=> b!362797 m!359855))

(declare-fun m!359857 () Bool)

(assert (=> b!362794 m!359857))

(assert (=> b!362794 m!359857))

(declare-fun m!359859 () Bool)

(assert (=> b!362794 m!359859))

(declare-fun m!359861 () Bool)

(assert (=> b!362793 m!359861))

(push 1)

(assert (not b!362793))

(assert (not b!362797))

(assert (not start!36182))

(assert (not b!362795))

(assert (not b!362794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

