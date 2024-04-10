; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36196 () Bool)

(assert start!36196)

(declare-fun b!362842 () Bool)

(declare-fun e!222209 () Bool)

(declare-fun e!222210 () Bool)

(assert (=> b!362842 (= e!222209 (not e!222210))))

(declare-fun res!202134 () Bool)

(assert (=> b!362842 (=> res!202134 e!222210)))

(declare-datatypes ((array!20512 0))(
  ( (array!20513 (arr!9738 (Array (_ BitVec 32) (_ BitVec 64))) (size!10090 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20512)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362842 (= res!202134 (or (bvslt (size!10090 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167171 () (_ BitVec 32))

(declare-fun lt!167165 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20512 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362842 (= (bvadd lt!167171 lt!167165) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10090 a!4337)))))

(declare-datatypes ((Unit!11176 0))(
  ( (Unit!11177) )
))
(declare-fun lt!167164 () Unit!11176)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11176)

(assert (=> b!362842 (= lt!167164 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10090 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167166 () (_ BitVec 32))

(assert (=> b!362842 (= lt!167166 lt!167165)))

(assert (=> b!362842 (= lt!167165 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10090 a!4337)))))

(declare-fun lt!167167 () array!20512)

(assert (=> b!362842 (= lt!167166 (arrayCountValidKeys!0 lt!167167 (bvadd #b00000000000000000000000000000001 i!1478) (size!10090 a!4337)))))

(declare-fun lt!167169 () Unit!11176)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20512 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11176)

(assert (=> b!362842 (= lt!167169 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167170 () (_ BitVec 32))

(assert (=> b!362842 (= lt!167170 (bvadd #b00000000000000000000000000000001 lt!167171))))

(assert (=> b!362842 (= lt!167170 (arrayCountValidKeys!0 lt!167167 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362842 (= lt!167171 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362842 (= lt!167167 (array!20513 (store (arr!9738 a!4337) i!1478 k!2980) (size!10090 a!4337)))))

(declare-fun lt!167168 () Unit!11176)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20512 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11176)

(assert (=> b!362842 (= lt!167168 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362843 () Bool)

(declare-fun res!202131 () Bool)

(assert (=> b!362843 (=> (not res!202131) (not e!222209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362843 (= res!202131 (validKeyInArray!0 k!2980))))

(declare-fun b!362844 () Bool)

(declare-fun res!202133 () Bool)

(assert (=> b!362844 (=> (not res!202133) (not e!222209))))

(assert (=> b!362844 (= res!202133 (bvslt (size!10090 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!202132 () Bool)

(assert (=> start!36196 (=> (not res!202132) (not e!222209))))

(assert (=> start!36196 (= res!202132 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10090 a!4337))))))

(assert (=> start!36196 e!222209))

(assert (=> start!36196 true))

(declare-fun array_inv!7180 (array!20512) Bool)

(assert (=> start!36196 (array_inv!7180 a!4337)))

(declare-fun b!362845 () Bool)

(assert (=> b!362845 (= e!222210 true)))

(assert (=> b!362845 (= (bvadd lt!167170 lt!167166) (arrayCountValidKeys!0 lt!167167 #b00000000000000000000000000000000 (size!10090 a!4337)))))

(declare-fun lt!167163 () Unit!11176)

(assert (=> b!362845 (= lt!167163 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167167 #b00000000000000000000000000000000 (size!10090 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362846 () Bool)

(declare-fun res!202135 () Bool)

(assert (=> b!362846 (=> (not res!202135) (not e!222209))))

(assert (=> b!362846 (= res!202135 (not (validKeyInArray!0 (select (arr!9738 a!4337) i!1478))))))

(assert (= (and start!36196 res!202132) b!362846))

(assert (= (and b!362846 res!202135) b!362843))

(assert (= (and b!362843 res!202131) b!362844))

(assert (= (and b!362844 res!202133) b!362842))

(assert (= (and b!362842 (not res!202134)) b!362845))

(declare-fun m!359603 () Bool)

(assert (=> b!362843 m!359603))

(declare-fun m!359605 () Bool)

(assert (=> start!36196 m!359605))

(declare-fun m!359607 () Bool)

(assert (=> b!362846 m!359607))

(assert (=> b!362846 m!359607))

(declare-fun m!359609 () Bool)

(assert (=> b!362846 m!359609))

(declare-fun m!359611 () Bool)

(assert (=> b!362842 m!359611))

(declare-fun m!359613 () Bool)

(assert (=> b!362842 m!359613))

(declare-fun m!359615 () Bool)

(assert (=> b!362842 m!359615))

(declare-fun m!359617 () Bool)

(assert (=> b!362842 m!359617))

(declare-fun m!359619 () Bool)

(assert (=> b!362842 m!359619))

(declare-fun m!359621 () Bool)

(assert (=> b!362842 m!359621))

(declare-fun m!359623 () Bool)

(assert (=> b!362842 m!359623))

(declare-fun m!359625 () Bool)

(assert (=> b!362842 m!359625))

(declare-fun m!359627 () Bool)

(assert (=> b!362842 m!359627))

(declare-fun m!359629 () Bool)

(assert (=> b!362845 m!359629))

(declare-fun m!359631 () Bool)

(assert (=> b!362845 m!359631))

(push 1)

(assert (not b!362846))

(assert (not b!362845))

(assert (not start!36196))

(assert (not b!362843))

(assert (not b!362842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

