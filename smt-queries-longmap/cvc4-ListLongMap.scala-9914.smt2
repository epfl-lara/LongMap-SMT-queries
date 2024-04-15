; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117250 () Bool)

(assert start!117250)

(declare-fun b!1379446 () Bool)

(declare-fun e!781449 () Bool)

(declare-fun e!781447 () Bool)

(assert (=> b!1379446 (= e!781449 (not e!781447))))

(declare-fun res!921927 () Bool)

(assert (=> b!1379446 (=> res!921927 e!781447)))

(declare-fun lt!607433 () (_ BitVec 32))

(declare-datatypes ((array!93800 0))(
  ( (array!93801 (arr!45299 (Array (_ BitVec 32) (_ BitVec 64))) (size!45851 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93800)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607436 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1379446 (= res!921927 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45851 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607433 (bvsub lt!607436 #b00000000000000000000000000000001)))))))

(declare-fun lt!607438 () (_ BitVec 32))

(declare-fun lt!607432 () (_ BitVec 32))

(assert (=> b!1379446 (= (bvadd lt!607438 lt!607432) lt!607433)))

(declare-fun lt!607437 () array!93800)

(declare-fun arrayCountValidKeys!0 (array!93800 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379446 (= lt!607433 (arrayCountValidKeys!0 lt!607437 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379446 (= lt!607438 (arrayCountValidKeys!0 lt!607437 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45716 0))(
  ( (Unit!45717) )
))
(declare-fun lt!607431 () Unit!45716)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45716)

(assert (=> b!1379446 (= lt!607431 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607437 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607435 () (_ BitVec 32))

(declare-fun lt!607434 () (_ BitVec 32))

(assert (=> b!1379446 (= (bvadd lt!607435 lt!607434) lt!607436)))

(assert (=> b!1379446 (= lt!607436 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379446 (= lt!607435 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607430 () Unit!45716)

(assert (=> b!1379446 (= lt!607430 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921931 () Bool)

(declare-fun e!781448 () Bool)

(assert (=> start!117250 (=> (not res!921931) (not e!781448))))

(assert (=> start!117250 (= res!921931 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45851 a!4094))))))

(assert (=> start!117250 e!781448))

(assert (=> start!117250 true))

(declare-fun array_inv!34532 (array!93800) Bool)

(assert (=> start!117250 (array_inv!34532 a!4094)))

(declare-fun b!1379447 () Bool)

(declare-fun res!921932 () Bool)

(assert (=> b!1379447 (=> (not res!921932) (not e!781448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379447 (= res!921932 (validKeyInArray!0 (select (arr!45299 a!4094) i!1451)))))

(declare-fun b!1379448 () Bool)

(assert (=> b!1379448 (= e!781447 true)))

(assert (=> b!1379448 (= (arrayCountValidKeys!0 lt!607437 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!607439 () Unit!45716)

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93800 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45716)

(assert (=> b!1379448 (= lt!607439 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1379449 () Bool)

(assert (=> b!1379449 (= e!781448 e!781449)))

(declare-fun res!921928 () Bool)

(assert (=> b!1379449 (=> (not res!921928) (not e!781449))))

(assert (=> b!1379449 (= res!921928 (and (= lt!607432 (bvsub lt!607434 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379449 (= lt!607432 (arrayCountValidKeys!0 lt!607437 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379449 (= lt!607434 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379449 (= lt!607437 (array!93801 (store (arr!45299 a!4094) i!1451 k!2953) (size!45851 a!4094)))))

(declare-fun b!1379450 () Bool)

(declare-fun res!921929 () Bool)

(assert (=> b!1379450 (=> (not res!921929) (not e!781448))))

(assert (=> b!1379450 (= res!921929 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379451 () Bool)

(declare-fun res!921930 () Bool)

(assert (=> b!1379451 (=> (not res!921930) (not e!781448))))

(assert (=> b!1379451 (= res!921930 (and (bvslt (size!45851 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45851 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117250 res!921931) b!1379447))

(assert (= (and b!1379447 res!921932) b!1379450))

(assert (= (and b!1379450 res!921929) b!1379451))

(assert (= (and b!1379451 res!921930) b!1379449))

(assert (= (and b!1379449 res!921928) b!1379446))

(assert (= (and b!1379446 (not res!921927)) b!1379448))

(declare-fun m!1264133 () Bool)

(assert (=> b!1379447 m!1264133))

(assert (=> b!1379447 m!1264133))

(declare-fun m!1264135 () Bool)

(assert (=> b!1379447 m!1264135))

(declare-fun m!1264137 () Bool)

(assert (=> b!1379450 m!1264137))

(declare-fun m!1264139 () Bool)

(assert (=> b!1379449 m!1264139))

(declare-fun m!1264141 () Bool)

(assert (=> b!1379449 m!1264141))

(declare-fun m!1264143 () Bool)

(assert (=> b!1379449 m!1264143))

(declare-fun m!1264145 () Bool)

(assert (=> start!117250 m!1264145))

(declare-fun m!1264147 () Bool)

(assert (=> b!1379448 m!1264147))

(declare-fun m!1264149 () Bool)

(assert (=> b!1379448 m!1264149))

(declare-fun m!1264151 () Bool)

(assert (=> b!1379448 m!1264151))

(declare-fun m!1264153 () Bool)

(assert (=> b!1379446 m!1264153))

(declare-fun m!1264155 () Bool)

(assert (=> b!1379446 m!1264155))

(declare-fun m!1264157 () Bool)

(assert (=> b!1379446 m!1264157))

(declare-fun m!1264159 () Bool)

(assert (=> b!1379446 m!1264159))

(declare-fun m!1264161 () Bool)

(assert (=> b!1379446 m!1264161))

(declare-fun m!1264163 () Bool)

(assert (=> b!1379446 m!1264163))

(push 1)

(assert (not b!1379449))

(assert (not start!117250))

(assert (not b!1379448))

(assert (not b!1379450))

(assert (not b!1379447))

(assert (not b!1379446))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

