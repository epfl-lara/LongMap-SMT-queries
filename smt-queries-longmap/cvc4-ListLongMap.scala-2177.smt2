; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36400 () Bool)

(assert start!36400)

(declare-fun b!364094 () Bool)

(declare-fun res!203257 () Bool)

(declare-fun e!222930 () Bool)

(assert (=> b!364094 (=> (not res!203257) (not e!222930))))

(declare-datatypes ((array!20680 0))(
  ( (array!20681 (arr!9819 (Array (_ BitVec 32) (_ BitVec 64))) (size!10171 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20680)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364094 (= res!203257 (not (validKeyInArray!0 (select (arr!9819 a!4289) i!1472))))))

(declare-fun b!364095 () Bool)

(declare-fun res!203256 () Bool)

(assert (=> b!364095 (=> (not res!203256) (not e!222930))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364095 (= res!203256 (and (bvslt (size!10171 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10171 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364096 () Bool)

(declare-fun e!222929 () Bool)

(assert (=> b!364096 (= e!222929 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)))))

(declare-fun lt!168329 () array!20680)

(declare-fun arrayCountValidKeys!0 (array!20680 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364096 (= (arrayCountValidKeys!0 lt!168329 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-datatypes ((Unit!11308 0))(
  ( (Unit!11309) )
))
(declare-fun lt!168328 () Unit!11308)

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20680 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11308)

(assert (=> b!364096 (= lt!168328 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun res!203258 () Bool)

(assert (=> start!36400 (=> (not res!203258) (not e!222930))))

(assert (=> start!36400 (= res!203258 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10171 a!4289))))))

(assert (=> start!36400 e!222930))

(assert (=> start!36400 true))

(declare-fun array_inv!7261 (array!20680) Bool)

(assert (=> start!36400 (array_inv!7261 a!4289)))

(declare-fun b!364097 () Bool)

(declare-fun e!222928 () Bool)

(assert (=> b!364097 (= e!222928 (not e!222929))))

(declare-fun res!203255 () Bool)

(assert (=> b!364097 (=> res!203255 e!222929)))

(declare-fun lt!168330 () (_ BitVec 32))

(declare-fun lt!168335 () (_ BitVec 32))

(assert (=> b!364097 (= res!203255 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10171 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168335 (bvadd #b00000000000000000000000000000001 lt!168330)))))))

(declare-fun lt!168334 () (_ BitVec 32))

(declare-fun lt!168336 () (_ BitVec 32))

(assert (=> b!364097 (= (bvadd lt!168334 lt!168336) lt!168335)))

(assert (=> b!364097 (= lt!168335 (arrayCountValidKeys!0 lt!168329 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364097 (= lt!168334 (arrayCountValidKeys!0 lt!168329 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168332 () Unit!11308)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11308)

(assert (=> b!364097 (= lt!168332 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168329 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168331 () (_ BitVec 32))

(declare-fun lt!168337 () (_ BitVec 32))

(assert (=> b!364097 (= (bvadd lt!168331 lt!168337) lt!168330)))

(assert (=> b!364097 (= lt!168330 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364097 (= lt!168331 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168333 () Unit!11308)

(assert (=> b!364097 (= lt!168333 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun b!364098 () Bool)

(declare-fun res!203259 () Bool)

(assert (=> b!364098 (=> (not res!203259) (not e!222930))))

(assert (=> b!364098 (= res!203259 (validKeyInArray!0 k!2974))))

(declare-fun b!364099 () Bool)

(assert (=> b!364099 (= e!222930 e!222928)))

(declare-fun res!203260 () Bool)

(assert (=> b!364099 (=> (not res!203260) (not e!222928))))

(assert (=> b!364099 (= res!203260 (and (= lt!168336 (bvadd #b00000000000000000000000000000001 lt!168337)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!364099 (= lt!168336 (arrayCountValidKeys!0 lt!168329 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364099 (= lt!168337 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364099 (= lt!168329 (array!20681 (store (arr!9819 a!4289) i!1472 k!2974) (size!10171 a!4289)))))

(assert (= (and start!36400 res!203258) b!364094))

(assert (= (and b!364094 res!203257) b!364098))

(assert (= (and b!364098 res!203259) b!364095))

(assert (= (and b!364095 res!203256) b!364099))

(assert (= (and b!364099 res!203260) b!364097))

(assert (= (and b!364097 (not res!203255)) b!364096))

(declare-fun m!361533 () Bool)

(assert (=> b!364099 m!361533))

(declare-fun m!361535 () Bool)

(assert (=> b!364099 m!361535))

(declare-fun m!361537 () Bool)

(assert (=> b!364099 m!361537))

(declare-fun m!361539 () Bool)

(assert (=> b!364097 m!361539))

(declare-fun m!361541 () Bool)

(assert (=> b!364097 m!361541))

(declare-fun m!361543 () Bool)

(assert (=> b!364097 m!361543))

(declare-fun m!361545 () Bool)

(assert (=> b!364097 m!361545))

(declare-fun m!361547 () Bool)

(assert (=> b!364097 m!361547))

(declare-fun m!361549 () Bool)

(assert (=> b!364097 m!361549))

(declare-fun m!361551 () Bool)

(assert (=> b!364098 m!361551))

(declare-fun m!361553 () Bool)

(assert (=> b!364094 m!361553))

(assert (=> b!364094 m!361553))

(declare-fun m!361555 () Bool)

(assert (=> b!364094 m!361555))

(declare-fun m!361557 () Bool)

(assert (=> b!364096 m!361557))

(declare-fun m!361559 () Bool)

(assert (=> b!364096 m!361559))

(declare-fun m!361561 () Bool)

(assert (=> b!364096 m!361561))

(declare-fun m!361563 () Bool)

(assert (=> start!36400 m!361563))

(push 1)

(assert (not b!364098))

(assert (not start!36400))

(assert (not b!364099))

(assert (not b!364094))

(assert (not b!364097))

(assert (not b!364096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

