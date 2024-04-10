; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117114 () Bool)

(assert start!117114)

(declare-fun b!1378519 () Bool)

(declare-fun res!921056 () Bool)

(declare-fun e!780925 () Bool)

(assert (=> b!1378519 (=> (not res!921056) (not e!780925))))

(declare-datatypes ((array!93731 0))(
  ( (array!93732 (arr!45266 (Array (_ BitVec 32) (_ BitVec 64))) (size!45816 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93731)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378519 (= res!921056 (and (bvslt (size!45816 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45816 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378520 () Bool)

(declare-fun e!780923 () Bool)

(assert (=> b!1378520 (= e!780925 e!780923)))

(declare-fun res!921054 () Bool)

(assert (=> b!1378520 (=> (not res!921054) (not e!780923))))

(declare-fun lt!606716 () (_ BitVec 32))

(declare-fun lt!606718 () (_ BitVec 32))

(assert (=> b!1378520 (= res!921054 (and (= lt!606716 (bvsub lt!606718 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606715 () array!93731)

(declare-fun arrayCountValidKeys!0 (array!93731 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378520 (= lt!606716 (arrayCountValidKeys!0 lt!606715 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378520 (= lt!606718 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378520 (= lt!606715 (array!93732 (store (arr!45266 a!4094) i!1451 k!2953) (size!45816 a!4094)))))

(declare-fun b!1378521 () Bool)

(declare-fun e!780926 () Bool)

(assert (=> b!1378521 (= e!780923 (not e!780926))))

(declare-fun res!921057 () Bool)

(assert (=> b!1378521 (=> res!921057 e!780926)))

(declare-fun lt!606713 () (_ BitVec 32))

(declare-fun lt!606714 () (_ BitVec 32))

(assert (=> b!1378521 (= res!921057 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45816 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606713 (bvsub lt!606714 #b00000000000000000000000000000001)))))))

(declare-fun lt!606711 () (_ BitVec 32))

(assert (=> b!1378521 (= (bvadd lt!606711 lt!606716) lt!606713)))

(assert (=> b!1378521 (= lt!606713 (arrayCountValidKeys!0 lt!606715 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378521 (= lt!606711 (arrayCountValidKeys!0 lt!606715 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45795 0))(
  ( (Unit!45796) )
))
(declare-fun lt!606720 () Unit!45795)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45795)

(assert (=> b!1378521 (= lt!606720 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606715 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606719 () (_ BitVec 32))

(assert (=> b!1378521 (= (bvadd lt!606719 lt!606718) lt!606714)))

(assert (=> b!1378521 (= lt!606714 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378521 (= lt!606719 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606717 () Unit!45795)

(assert (=> b!1378521 (= lt!606717 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378522 () Bool)

(declare-fun res!921053 () Bool)

(assert (=> b!1378522 (=> (not res!921053) (not e!780925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378522 (= res!921053 (validKeyInArray!0 (select (arr!45266 a!4094) i!1451)))))

(declare-fun res!921055 () Bool)

(assert (=> start!117114 (=> (not res!921055) (not e!780925))))

(assert (=> start!117114 (= res!921055 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45816 a!4094))))))

(assert (=> start!117114 e!780925))

(assert (=> start!117114 true))

(declare-fun array_inv!34294 (array!93731) Bool)

(assert (=> start!117114 (array_inv!34294 a!4094)))

(declare-fun b!1378523 () Bool)

(declare-fun res!921058 () Bool)

(assert (=> b!1378523 (=> (not res!921058) (not e!780925))))

(assert (=> b!1378523 (= res!921058 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378524 () Bool)

(assert (=> b!1378524 (= e!780926 true)))

(assert (=> b!1378524 (= (arrayCountValidKeys!0 lt!606715 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!606712 () Unit!45795)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93731 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45795)

(assert (=> b!1378524 (= lt!606712 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(assert (= (and start!117114 res!921055) b!1378522))

(assert (= (and b!1378522 res!921053) b!1378523))

(assert (= (and b!1378523 res!921058) b!1378519))

(assert (= (and b!1378519 res!921056) b!1378520))

(assert (= (and b!1378520 res!921054) b!1378521))

(assert (= (and b!1378521 (not res!921057)) b!1378524))

(declare-fun m!1263207 () Bool)

(assert (=> b!1378520 m!1263207))

(declare-fun m!1263209 () Bool)

(assert (=> b!1378520 m!1263209))

(declare-fun m!1263211 () Bool)

(assert (=> b!1378520 m!1263211))

(declare-fun m!1263213 () Bool)

(assert (=> b!1378521 m!1263213))

(declare-fun m!1263215 () Bool)

(assert (=> b!1378521 m!1263215))

(declare-fun m!1263217 () Bool)

(assert (=> b!1378521 m!1263217))

(declare-fun m!1263219 () Bool)

(assert (=> b!1378521 m!1263219))

(declare-fun m!1263221 () Bool)

(assert (=> b!1378521 m!1263221))

(declare-fun m!1263223 () Bool)

(assert (=> b!1378521 m!1263223))

(declare-fun m!1263225 () Bool)

(assert (=> b!1378524 m!1263225))

(declare-fun m!1263227 () Bool)

(assert (=> b!1378524 m!1263227))

(declare-fun m!1263229 () Bool)

(assert (=> b!1378524 m!1263229))

(declare-fun m!1263231 () Bool)

(assert (=> b!1378522 m!1263231))

(assert (=> b!1378522 m!1263231))

(declare-fun m!1263233 () Bool)

(assert (=> b!1378522 m!1263233))

(declare-fun m!1263235 () Bool)

(assert (=> b!1378523 m!1263235))

(declare-fun m!1263237 () Bool)

(assert (=> start!117114 m!1263237))

(push 1)

(assert (not b!1378524))

(assert (not b!1378520))

(assert (not b!1378521))

(assert (not start!117114))

