; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36180 () Bool)

(assert start!36180)

(declare-fun b!362557 () Bool)

(declare-fun e!222025 () Bool)

(assert (=> b!362557 (= e!222025 true)))

(declare-fun lt!166906 () (_ BitVec 32))

(declare-datatypes ((array!20492 0))(
  ( (array!20493 (arr!9728 (Array (_ BitVec 32) (_ BitVec 64))) (size!10081 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20492)

(declare-fun lt!166909 () (_ BitVec 32))

(declare-fun lt!166908 () array!20492)

(declare-fun arrayCountValidKeys!0 (array!20492 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362557 (= (bvadd lt!166906 lt!166909) (arrayCountValidKeys!0 lt!166908 #b00000000000000000000000000000000 (size!10081 a!4337)))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((Unit!11152 0))(
  ( (Unit!11153) )
))
(declare-fun lt!166903 () Unit!11152)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20492 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11152)

(assert (=> b!362557 (= lt!166903 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!166908 #b00000000000000000000000000000000 (size!10081 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362558 () Bool)

(declare-fun res!201987 () Bool)

(declare-fun e!222027 () Bool)

(assert (=> b!362558 (=> (not res!201987) (not e!222027))))

(assert (=> b!362558 (= res!201987 (bvslt (size!10081 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362559 () Bool)

(assert (=> b!362559 (= e!222027 (not e!222025))))

(declare-fun res!201991 () Bool)

(assert (=> b!362559 (=> res!201991 e!222025)))

(assert (=> b!362559 (= res!201991 (or (bvslt (size!10081 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!166905 () (_ BitVec 32))

(declare-fun lt!166910 () (_ BitVec 32))

(assert (=> b!362559 (= (bvadd lt!166905 lt!166910) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10081 a!4337)))))

(declare-fun lt!166902 () Unit!11152)

(assert (=> b!362559 (= lt!166902 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10081 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362559 (= lt!166909 lt!166910)))

(assert (=> b!362559 (= lt!166910 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10081 a!4337)))))

(assert (=> b!362559 (= lt!166909 (arrayCountValidKeys!0 lt!166908 (bvadd #b00000000000000000000000000000001 i!1478) (size!10081 a!4337)))))

(declare-fun lt!166904 () Unit!11152)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20492 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11152)

(assert (=> b!362559 (= lt!166904 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362559 (= lt!166906 (bvadd #b00000000000000000000000000000001 lt!166905))))

(assert (=> b!362559 (= lt!166906 (arrayCountValidKeys!0 lt!166908 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362559 (= lt!166905 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362559 (= lt!166908 (array!20493 (store (arr!9728 a!4337) i!1478 k!2980) (size!10081 a!4337)))))

(declare-fun lt!166907 () Unit!11152)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20492 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11152)

(assert (=> b!362559 (= lt!166907 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362560 () Bool)

(declare-fun res!201988 () Bool)

(assert (=> b!362560 (=> (not res!201988) (not e!222027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362560 (= res!201988 (not (validKeyInArray!0 (select (arr!9728 a!4337) i!1478))))))

(declare-fun b!362556 () Bool)

(declare-fun res!201990 () Bool)

(assert (=> b!362556 (=> (not res!201990) (not e!222027))))

(assert (=> b!362556 (= res!201990 (validKeyInArray!0 k!2980))))

(declare-fun res!201989 () Bool)

(assert (=> start!36180 (=> (not res!201989) (not e!222027))))

(assert (=> start!36180 (= res!201989 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10081 a!4337))))))

(assert (=> start!36180 e!222027))

(assert (=> start!36180 true))

(declare-fun array_inv!7177 (array!20492) Bool)

(assert (=> start!36180 (array_inv!7177 a!4337)))

(assert (= (and start!36180 res!201989) b!362560))

(assert (= (and b!362560 res!201988) b!362556))

(assert (= (and b!362556 res!201990) b!362558))

(assert (= (and b!362558 res!201987) b!362559))

(assert (= (and b!362559 (not res!201991)) b!362557))

(declare-fun m!358849 () Bool)

(assert (=> b!362557 m!358849))

(declare-fun m!358851 () Bool)

(assert (=> b!362557 m!358851))

(declare-fun m!358853 () Bool)

(assert (=> b!362559 m!358853))

(declare-fun m!358855 () Bool)

(assert (=> b!362559 m!358855))

(declare-fun m!358857 () Bool)

(assert (=> b!362559 m!358857))

(declare-fun m!358859 () Bool)

(assert (=> b!362559 m!358859))

(declare-fun m!358861 () Bool)

(assert (=> b!362559 m!358861))

(declare-fun m!358863 () Bool)

(assert (=> b!362559 m!358863))

(declare-fun m!358865 () Bool)

(assert (=> b!362559 m!358865))

(declare-fun m!358867 () Bool)

(assert (=> b!362559 m!358867))

(declare-fun m!358869 () Bool)

(assert (=> b!362559 m!358869))

(declare-fun m!358871 () Bool)

(assert (=> b!362556 m!358871))

(declare-fun m!358873 () Bool)

(assert (=> start!36180 m!358873))

(declare-fun m!358875 () Bool)

(assert (=> b!362560 m!358875))

(assert (=> b!362560 m!358875))

(declare-fun m!358877 () Bool)

(assert (=> b!362560 m!358877))

(push 1)

(assert (not b!362556))

(assert (not b!362559))

(assert (not b!362557))

(assert (not start!36180))

(assert (not b!362560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

