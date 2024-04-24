; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117348 () Bool)

(assert start!117348)

(declare-fun b!1379847 () Bool)

(declare-fun res!921597 () Bool)

(declare-fun e!781787 () Bool)

(assert (=> b!1379847 (=> (not res!921597) (not e!781787))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379847 (= res!921597 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379848 () Bool)

(declare-fun e!781788 () Bool)

(assert (=> b!1379848 (= e!781787 e!781788)))

(declare-fun res!921593 () Bool)

(assert (=> b!1379848 (=> (not res!921593) (not e!781788))))

(declare-fun lt!607222 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607228 () (_ BitVec 32))

(assert (=> b!1379848 (= res!921593 (and (= lt!607228 (bvsub lt!607222 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93849 0))(
  ( (array!93850 (arr!45320 (Array (_ BitVec 32) (_ BitVec 64))) (size!45871 (_ BitVec 32))) )
))
(declare-fun lt!607224 () array!93849)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93849 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379848 (= lt!607228 (arrayCountValidKeys!0 lt!607224 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93849)

(assert (=> b!1379848 (= lt!607222 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379848 (= lt!607224 (array!93850 (store (arr!45320 a!4094) i!1451 k!2953) (size!45871 a!4094)))))

(declare-fun b!1379849 () Bool)

(declare-fun res!921594 () Bool)

(assert (=> b!1379849 (=> (not res!921594) (not e!781787))))

(assert (=> b!1379849 (= res!921594 (validKeyInArray!0 (select (arr!45320 a!4094) i!1451)))))

(declare-fun b!1379851 () Bool)

(declare-fun e!781785 () Bool)

(assert (=> b!1379851 (= e!781788 (not e!781785))))

(declare-fun res!921595 () Bool)

(assert (=> b!1379851 (=> res!921595 e!781785)))

(declare-fun lt!607230 () (_ BitVec 32))

(declare-fun lt!607229 () (_ BitVec 32))

(assert (=> b!1379851 (= res!921595 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45871 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607230 (bvsub lt!607229 #b00000000000000000000000000000001)))))))

(declare-fun lt!607223 () (_ BitVec 32))

(assert (=> b!1379851 (= (bvadd lt!607223 lt!607228) lt!607230)))

(assert (=> b!1379851 (= lt!607230 (arrayCountValidKeys!0 lt!607224 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379851 (= lt!607223 (arrayCountValidKeys!0 lt!607224 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45736 0))(
  ( (Unit!45737) )
))
(declare-fun lt!607226 () Unit!45736)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93849 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45736)

(assert (=> b!1379851 (= lt!607226 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607224 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607227 () (_ BitVec 32))

(assert (=> b!1379851 (= (bvadd lt!607227 lt!607222) lt!607229)))

(assert (=> b!1379851 (= lt!607229 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379851 (= lt!607227 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607231 () Unit!45736)

(assert (=> b!1379851 (= lt!607231 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379852 () Bool)

(declare-fun res!921596 () Bool)

(assert (=> b!1379852 (=> (not res!921596) (not e!781787))))

(assert (=> b!1379852 (= res!921596 (and (bvslt (size!45871 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45871 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921592 () Bool)

(assert (=> start!117348 (=> (not res!921592) (not e!781787))))

(assert (=> start!117348 (= res!921592 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45871 a!4094))))))

(assert (=> start!117348 e!781787))

(assert (=> start!117348 true))

(declare-fun array_inv!34601 (array!93849) Bool)

(assert (=> start!117348 (array_inv!34601 a!4094)))

(declare-fun b!1379850 () Bool)

(assert (=> b!1379850 (= e!781785 true)))

(assert (=> b!1379850 (= (arrayCountValidKeys!0 lt!607224 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!607225 () Unit!45736)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93849 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45736)

(assert (=> b!1379850 (= lt!607225 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(assert (= (and start!117348 res!921592) b!1379849))

(assert (= (and b!1379849 res!921594) b!1379847))

(assert (= (and b!1379847 res!921597) b!1379852))

(assert (= (and b!1379852 res!921596) b!1379848))

(assert (= (and b!1379848 res!921593) b!1379851))

(assert (= (and b!1379851 (not res!921595)) b!1379850))

(declare-fun m!1264875 () Bool)

(assert (=> b!1379851 m!1264875))

(declare-fun m!1264877 () Bool)

(assert (=> b!1379851 m!1264877))

(declare-fun m!1264879 () Bool)

(assert (=> b!1379851 m!1264879))

(declare-fun m!1264881 () Bool)

(assert (=> b!1379851 m!1264881))

(declare-fun m!1264883 () Bool)

(assert (=> b!1379851 m!1264883))

(declare-fun m!1264885 () Bool)

(assert (=> b!1379851 m!1264885))

(declare-fun m!1264887 () Bool)

(assert (=> b!1379850 m!1264887))

(declare-fun m!1264889 () Bool)

(assert (=> b!1379850 m!1264889))

(declare-fun m!1264891 () Bool)

(assert (=> b!1379850 m!1264891))

(declare-fun m!1264893 () Bool)

(assert (=> b!1379848 m!1264893))

(declare-fun m!1264895 () Bool)

(assert (=> b!1379848 m!1264895))

(declare-fun m!1264897 () Bool)

(assert (=> b!1379848 m!1264897))

(declare-fun m!1264899 () Bool)

(assert (=> b!1379847 m!1264899))

(declare-fun m!1264901 () Bool)

(assert (=> start!117348 m!1264901))

(declare-fun m!1264903 () Bool)

(assert (=> b!1379849 m!1264903))

(assert (=> b!1379849 m!1264903))

(declare-fun m!1264905 () Bool)

(assert (=> b!1379849 m!1264905))

(push 1)

(assert (not b!1379851))

(assert (not b!1379847))

(assert (not start!117348))

(assert (not b!1379848))

(assert (not b!1379849))

(assert (not b!1379850))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

