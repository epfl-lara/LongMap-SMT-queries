; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36202 () Bool)

(assert start!36202)

(declare-fun res!202177 () Bool)

(declare-fun e!222236 () Bool)

(assert (=> start!36202 (=> (not res!202177) (not e!222236))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20518 0))(
  ( (array!20519 (arr!9741 (Array (_ BitVec 32) (_ BitVec 64))) (size!10093 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20518)

(assert (=> start!36202 (= res!202177 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10093 a!4337))))))

(assert (=> start!36202 e!222236))

(assert (=> start!36202 true))

(declare-fun array_inv!7183 (array!20518) Bool)

(assert (=> start!36202 (array_inv!7183 a!4337)))

(declare-fun b!362887 () Bool)

(declare-fun e!222237 () Bool)

(assert (=> b!362887 (= e!222236 (not e!222237))))

(declare-fun res!202178 () Bool)

(assert (=> b!362887 (=> res!202178 e!222237)))

(assert (=> b!362887 (= res!202178 (or (bvslt (size!10093 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167250 () (_ BitVec 32))

(declare-fun lt!167252 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20518 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362887 (= (bvadd lt!167250 lt!167252) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10093 a!4337)))))

(declare-datatypes ((Unit!11182 0))(
  ( (Unit!11183) )
))
(declare-fun lt!167244 () Unit!11182)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11182)

(assert (=> b!362887 (= lt!167244 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10093 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167248 () (_ BitVec 32))

(assert (=> b!362887 (= lt!167248 lt!167252)))

(assert (=> b!362887 (= lt!167252 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10093 a!4337)))))

(declare-fun lt!167247 () array!20518)

(assert (=> b!362887 (= lt!167248 (arrayCountValidKeys!0 lt!167247 (bvadd #b00000000000000000000000000000001 i!1478) (size!10093 a!4337)))))

(declare-fun lt!167249 () Unit!11182)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20518 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11182)

(assert (=> b!362887 (= lt!167249 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167251 () (_ BitVec 32))

(assert (=> b!362887 (= lt!167251 (bvadd #b00000000000000000000000000000001 lt!167250))))

(assert (=> b!362887 (= lt!167251 (arrayCountValidKeys!0 lt!167247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362887 (= lt!167250 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362887 (= lt!167247 (array!20519 (store (arr!9741 a!4337) i!1478 k!2980) (size!10093 a!4337)))))

(declare-fun lt!167245 () Unit!11182)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20518 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11182)

(assert (=> b!362887 (= lt!167245 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362888 () Bool)

(assert (=> b!362888 (= e!222237 true)))

(assert (=> b!362888 (= (bvadd lt!167251 lt!167248) (arrayCountValidKeys!0 lt!167247 #b00000000000000000000000000000000 (size!10093 a!4337)))))

(declare-fun lt!167246 () Unit!11182)

(assert (=> b!362888 (= lt!167246 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167247 #b00000000000000000000000000000000 (size!10093 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362889 () Bool)

(declare-fun res!202176 () Bool)

(assert (=> b!362889 (=> (not res!202176) (not e!222236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362889 (= res!202176 (not (validKeyInArray!0 (select (arr!9741 a!4337) i!1478))))))

(declare-fun b!362890 () Bool)

(declare-fun res!202179 () Bool)

(assert (=> b!362890 (=> (not res!202179) (not e!222236))))

(assert (=> b!362890 (= res!202179 (validKeyInArray!0 k!2980))))

(declare-fun b!362891 () Bool)

(declare-fun res!202180 () Bool)

(assert (=> b!362891 (=> (not res!202180) (not e!222236))))

(assert (=> b!362891 (= res!202180 (bvslt (size!10093 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36202 res!202177) b!362889))

(assert (= (and b!362889 res!202176) b!362890))

(assert (= (and b!362890 res!202179) b!362891))

(assert (= (and b!362891 res!202180) b!362887))

(assert (= (and b!362887 (not res!202178)) b!362888))

(declare-fun m!359693 () Bool)

(assert (=> b!362887 m!359693))

(declare-fun m!359695 () Bool)

(assert (=> b!362887 m!359695))

(declare-fun m!359697 () Bool)

(assert (=> b!362887 m!359697))

(declare-fun m!359699 () Bool)

(assert (=> b!362887 m!359699))

(declare-fun m!359701 () Bool)

(assert (=> b!362887 m!359701))

(declare-fun m!359703 () Bool)

(assert (=> b!362887 m!359703))

(declare-fun m!359705 () Bool)

(assert (=> b!362887 m!359705))

(declare-fun m!359707 () Bool)

(assert (=> b!362887 m!359707))

(declare-fun m!359709 () Bool)

(assert (=> b!362887 m!359709))

(declare-fun m!359711 () Bool)

(assert (=> b!362888 m!359711))

(declare-fun m!359713 () Bool)

(assert (=> b!362888 m!359713))

(declare-fun m!359715 () Bool)

(assert (=> b!362890 m!359715))

(declare-fun m!359717 () Bool)

(assert (=> start!36202 m!359717))

(declare-fun m!359719 () Bool)

(assert (=> b!362889 m!359719))

(assert (=> b!362889 m!359719))

(declare-fun m!359721 () Bool)

(assert (=> b!362889 m!359721))

(push 1)

(assert (not start!36202))

(assert (not b!362889))

(assert (not b!362887))

(assert (not b!362888))

(assert (not b!362890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

