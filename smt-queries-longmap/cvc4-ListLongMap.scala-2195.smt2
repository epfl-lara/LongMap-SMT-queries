; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36532 () Bool)

(assert start!36532)

(declare-fun b!365018 () Bool)

(declare-fun res!204087 () Bool)

(declare-fun e!223436 () Bool)

(assert (=> b!365018 (=> (not res!204087) (not e!223436))))

(declare-datatypes ((array!20791 0))(
  ( (array!20792 (arr!9873 (Array (_ BitVec 32) (_ BitVec 64))) (size!10225 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20791)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365018 (= res!204087 (not (validKeyInArray!0 (select (arr!9873 a!4289) i!1472))))))

(declare-fun b!365019 () Bool)

(declare-fun e!223438 () Bool)

(assert (=> b!365019 (= e!223438 true)))

(declare-fun lt!169119 () array!20791)

(declare-fun arrayCountValidKeys!0 (array!20791 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!365019 (= (arrayCountValidKeys!0 lt!169119 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-datatypes ((Unit!11380 0))(
  ( (Unit!11381) )
))
(declare-fun lt!169112 () Unit!11380)

(declare-fun k!2974 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20791 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11380)

(assert (=> b!365019 (= lt!169112 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4289 i!1472 k!2974 (bvsub from!3650 #b00000000000000000000000000000001)))))

(declare-fun b!365020 () Bool)

(declare-fun e!223437 () Bool)

(assert (=> b!365020 (= e!223436 e!223437)))

(declare-fun res!204084 () Bool)

(assert (=> b!365020 (=> (not res!204084) (not e!223437))))

(declare-fun lt!169118 () (_ BitVec 32))

(declare-fun lt!169113 () (_ BitVec 32))

(assert (=> b!365020 (= res!204084 (and (= lt!169113 (bvadd #b00000000000000000000000000000001 lt!169118)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(assert (=> b!365020 (= lt!169113 (arrayCountValidKeys!0 lt!169119 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!365020 (= lt!169118 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!365020 (= lt!169119 (array!20792 (store (arr!9873 a!4289) i!1472 k!2974) (size!10225 a!4289)))))

(declare-fun b!365021 () Bool)

(declare-fun res!204088 () Bool)

(assert (=> b!365021 (=> (not res!204088) (not e!223436))))

(assert (=> b!365021 (= res!204088 (and (bvslt (size!10225 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10225 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!365022 () Bool)

(declare-fun res!204085 () Bool)

(assert (=> b!365022 (=> (not res!204085) (not e!223436))))

(assert (=> b!365022 (= res!204085 (validKeyInArray!0 k!2974))))

(declare-fun res!204086 () Bool)

(assert (=> start!36532 (=> (not res!204086) (not e!223436))))

(assert (=> start!36532 (= res!204086 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10225 a!4289))))))

(assert (=> start!36532 e!223436))

(assert (=> start!36532 true))

(declare-fun array_inv!7315 (array!20791) Bool)

(assert (=> start!36532 (array_inv!7315 a!4289)))

(declare-fun b!365023 () Bool)

(assert (=> b!365023 (= e!223437 (not e!223438))))

(declare-fun res!204083 () Bool)

(assert (=> b!365023 (=> res!204083 e!223438)))

(declare-fun lt!169111 () (_ BitVec 32))

(declare-fun lt!169114 () (_ BitVec 32))

(assert (=> b!365023 (= res!204083 (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10225 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!169111 (bvadd #b00000000000000000000000000000001 lt!169114)))))))

(declare-fun lt!169120 () (_ BitVec 32))

(assert (=> b!365023 (= (bvadd lt!169120 lt!169113) lt!169111)))

(assert (=> b!365023 (= lt!169111 (arrayCountValidKeys!0 lt!169119 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!365023 (= lt!169120 (arrayCountValidKeys!0 lt!169119 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!169117 () Unit!11380)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11380)

(assert (=> b!365023 (= lt!169117 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!169119 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!169115 () (_ BitVec 32))

(assert (=> b!365023 (= (bvadd lt!169115 lt!169118) lt!169114)))

(assert (=> b!365023 (= lt!169114 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!365023 (= lt!169115 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!169116 () Unit!11380)

(assert (=> b!365023 (= lt!169116 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (= (and start!36532 res!204086) b!365018))

(assert (= (and b!365018 res!204087) b!365022))

(assert (= (and b!365022 res!204085) b!365021))

(assert (= (and b!365021 res!204088) b!365020))

(assert (= (and b!365020 res!204084) b!365023))

(assert (= (and b!365023 (not res!204083)) b!365019))

(declare-fun m!362835 () Bool)

(assert (=> b!365018 m!362835))

(assert (=> b!365018 m!362835))

(declare-fun m!362837 () Bool)

(assert (=> b!365018 m!362837))

(declare-fun m!362839 () Bool)

(assert (=> b!365019 m!362839))

(declare-fun m!362841 () Bool)

(assert (=> b!365019 m!362841))

(declare-fun m!362843 () Bool)

(assert (=> b!365019 m!362843))

(declare-fun m!362845 () Bool)

(assert (=> b!365020 m!362845))

(declare-fun m!362847 () Bool)

(assert (=> b!365020 m!362847))

(declare-fun m!362849 () Bool)

(assert (=> b!365020 m!362849))

(declare-fun m!362851 () Bool)

(assert (=> b!365023 m!362851))

(declare-fun m!362853 () Bool)

(assert (=> b!365023 m!362853))

(declare-fun m!362855 () Bool)

(assert (=> b!365023 m!362855))

(declare-fun m!362857 () Bool)

(assert (=> b!365023 m!362857))

(declare-fun m!362859 () Bool)

(assert (=> b!365023 m!362859))

(declare-fun m!362861 () Bool)

(assert (=> b!365023 m!362861))

(declare-fun m!362863 () Bool)

(assert (=> b!365022 m!362863))

(declare-fun m!362865 () Bool)

(assert (=> start!36532 m!362865))

(push 1)

(assert (not b!365020))

(assert (not start!36532))

(assert (not b!365023))

(assert (not b!365019))

(assert (not b!365022))

(assert (not b!365018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

