; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117240 () Bool)

(assert start!117240)

(declare-fun b!1379357 () Bool)

(declare-fun e!781388 () Bool)

(declare-fun e!781390 () Bool)

(assert (=> b!1379357 (= e!781388 e!781390)))

(declare-fun res!921841 () Bool)

(assert (=> b!1379357 (=> (not res!921841) (not e!781390))))

(declare-fun lt!607281 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607289 () (_ BitVec 32))

(assert (=> b!1379357 (= res!921841 (and (= lt!607281 (bvsub lt!607289 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93790 0))(
  ( (array!93791 (arr!45294 (Array (_ BitVec 32) (_ BitVec 64))) (size!45846 (_ BitVec 32))) )
))
(declare-fun lt!607283 () array!93790)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93790 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379357 (= lt!607281 (arrayCountValidKeys!0 lt!607283 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93790)

(assert (=> b!1379357 (= lt!607289 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379357 (= lt!607283 (array!93791 (store (arr!45294 a!4094) i!1451 k!2953) (size!45846 a!4094)))))

(declare-fun b!1379358 () Bool)

(declare-fun res!921840 () Bool)

(assert (=> b!1379358 (=> (not res!921840) (not e!781388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379358 (= res!921840 (not (validKeyInArray!0 k!2953)))))

(declare-fun res!921839 () Bool)

(assert (=> start!117240 (=> (not res!921839) (not e!781388))))

(assert (=> start!117240 (= res!921839 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45846 a!4094))))))

(assert (=> start!117240 e!781388))

(assert (=> start!117240 true))

(declare-fun array_inv!34527 (array!93790) Bool)

(assert (=> start!117240 (array_inv!34527 a!4094)))

(declare-fun b!1379359 () Bool)

(declare-fun res!921842 () Bool)

(assert (=> b!1379359 (=> (not res!921842) (not e!781388))))

(assert (=> b!1379359 (= res!921842 (validKeyInArray!0 (select (arr!45294 a!4094) i!1451)))))

(declare-fun b!1379360 () Bool)

(declare-fun res!921838 () Bool)

(assert (=> b!1379360 (=> (not res!921838) (not e!781388))))

(assert (=> b!1379360 (= res!921838 (and (bvslt (size!45846 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45846 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379361 () Bool)

(declare-fun lt!607285 () (_ BitVec 32))

(declare-fun lt!607287 () (_ BitVec 32))

(assert (=> b!1379361 (= e!781390 (not (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45846 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607287 (bvsub lt!607285 #b00000000000000000000000000000001))) (bvslt (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))))

(declare-fun lt!607288 () (_ BitVec 32))

(assert (=> b!1379361 (= (bvadd lt!607288 lt!607281) lt!607287)))

(assert (=> b!1379361 (= lt!607287 (arrayCountValidKeys!0 lt!607283 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379361 (= lt!607288 (arrayCountValidKeys!0 lt!607283 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45706 0))(
  ( (Unit!45707) )
))
(declare-fun lt!607286 () Unit!45706)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45706)

(assert (=> b!1379361 (= lt!607286 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607283 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607284 () (_ BitVec 32))

(assert (=> b!1379361 (= (bvadd lt!607284 lt!607289) lt!607285)))

(assert (=> b!1379361 (= lt!607285 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379361 (= lt!607284 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607282 () Unit!45706)

(assert (=> b!1379361 (= lt!607282 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117240 res!921839) b!1379359))

(assert (= (and b!1379359 res!921842) b!1379358))

(assert (= (and b!1379358 res!921840) b!1379360))

(assert (= (and b!1379360 res!921838) b!1379357))

(assert (= (and b!1379357 res!921841) b!1379361))

(declare-fun m!1263979 () Bool)

(assert (=> b!1379357 m!1263979))

(declare-fun m!1263981 () Bool)

(assert (=> b!1379357 m!1263981))

(declare-fun m!1263983 () Bool)

(assert (=> b!1379357 m!1263983))

(declare-fun m!1263985 () Bool)

(assert (=> start!117240 m!1263985))

(declare-fun m!1263987 () Bool)

(assert (=> b!1379361 m!1263987))

(declare-fun m!1263989 () Bool)

(assert (=> b!1379361 m!1263989))

(declare-fun m!1263991 () Bool)

(assert (=> b!1379361 m!1263991))

(declare-fun m!1263993 () Bool)

(assert (=> b!1379361 m!1263993))

(declare-fun m!1263995 () Bool)

(assert (=> b!1379361 m!1263995))

(declare-fun m!1263997 () Bool)

(assert (=> b!1379361 m!1263997))

(declare-fun m!1263999 () Bool)

(assert (=> b!1379358 m!1263999))

(declare-fun m!1264001 () Bool)

(assert (=> b!1379359 m!1264001))

(assert (=> b!1379359 m!1264001))

(declare-fun m!1264003 () Bool)

(assert (=> b!1379359 m!1264003))

(push 1)

(assert (not b!1379358))

(assert (not b!1379357))

(assert (not start!117240))

(assert (not b!1379359))

(assert (not b!1379361))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

