; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117360 () Bool)

(assert start!117360)

(declare-fun b!1379955 () Bool)

(declare-fun res!921702 () Bool)

(declare-fun e!781857 () Bool)

(assert (=> b!1379955 (=> (not res!921702) (not e!781857))))

(declare-datatypes ((array!93861 0))(
  ( (array!93862 (arr!45326 (Array (_ BitVec 32) (_ BitVec 64))) (size!45877 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93861)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379955 (= res!921702 (validKeyInArray!0 (select (arr!45326 a!4094) i!1451)))))

(declare-fun b!1379956 () Bool)

(declare-fun res!921704 () Bool)

(assert (=> b!1379956 (=> (not res!921704) (not e!781857))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379956 (= res!921704 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379957 () Bool)

(declare-fun e!781858 () Bool)

(assert (=> b!1379957 (= e!781857 e!781858)))

(declare-fun res!921700 () Bool)

(assert (=> b!1379957 (=> (not res!921700) (not e!781858))))

(declare-fun lt!607403 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607402 () (_ BitVec 32))

(assert (=> b!1379957 (= res!921700 (and (= lt!607403 (bvsub lt!607402 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!607408 () array!93861)

(declare-fun arrayCountValidKeys!0 (array!93861 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379957 (= lt!607403 (arrayCountValidKeys!0 lt!607408 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379957 (= lt!607402 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379957 (= lt!607408 (array!93862 (store (arr!45326 a!4094) i!1451 k!2953) (size!45877 a!4094)))))

(declare-fun b!1379958 () Bool)

(declare-fun e!781859 () Bool)

(assert (=> b!1379958 (= e!781858 (not e!781859))))

(declare-fun res!921705 () Bool)

(assert (=> b!1379958 (=> res!921705 e!781859)))

(declare-fun lt!607405 () (_ BitVec 32))

(declare-fun lt!607410 () (_ BitVec 32))

(assert (=> b!1379958 (= res!921705 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45877 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607405 (bvsub lt!607410 #b00000000000000000000000000000001)))))))

(declare-fun lt!607407 () (_ BitVec 32))

(assert (=> b!1379958 (= (bvadd lt!607407 lt!607403) lt!607405)))

(assert (=> b!1379958 (= lt!607405 (arrayCountValidKeys!0 lt!607408 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379958 (= lt!607407 (arrayCountValidKeys!0 lt!607408 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45748 0))(
  ( (Unit!45749) )
))
(declare-fun lt!607409 () Unit!45748)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45748)

(assert (=> b!1379958 (= lt!607409 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607408 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607406 () (_ BitVec 32))

(assert (=> b!1379958 (= (bvadd lt!607406 lt!607402) lt!607410)))

(assert (=> b!1379958 (= lt!607410 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379958 (= lt!607406 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607404 () Unit!45748)

(assert (=> b!1379958 (= lt!607404 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379959 () Bool)

(declare-fun res!921701 () Bool)

(assert (=> b!1379959 (=> (not res!921701) (not e!781857))))

(assert (=> b!1379959 (= res!921701 (and (bvslt (size!45877 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45877 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921703 () Bool)

(assert (=> start!117360 (=> (not res!921703) (not e!781857))))

(assert (=> start!117360 (= res!921703 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45877 a!4094))))))

(assert (=> start!117360 e!781857))

(assert (=> start!117360 true))

(declare-fun array_inv!34607 (array!93861) Bool)

(assert (=> start!117360 (array_inv!34607 a!4094)))

(declare-fun b!1379960 () Bool)

(assert (=> b!1379960 (= e!781859 true)))

(assert (=> b!1379960 (= (arrayCountValidKeys!0 lt!607408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!607411 () Unit!45748)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93861 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45748)

(assert (=> b!1379960 (= lt!607411 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(assert (= (and start!117360 res!921703) b!1379955))

(assert (= (and b!1379955 res!921702) b!1379956))

(assert (= (and b!1379956 res!921704) b!1379959))

(assert (= (and b!1379959 res!921701) b!1379957))

(assert (= (and b!1379957 res!921700) b!1379958))

(assert (= (and b!1379958 (not res!921705)) b!1379960))

(declare-fun m!1265067 () Bool)

(assert (=> b!1379960 m!1265067))

(declare-fun m!1265069 () Bool)

(assert (=> b!1379960 m!1265069))

(declare-fun m!1265071 () Bool)

(assert (=> b!1379960 m!1265071))

(declare-fun m!1265073 () Bool)

(assert (=> b!1379956 m!1265073))

(declare-fun m!1265075 () Bool)

(assert (=> b!1379957 m!1265075))

(declare-fun m!1265077 () Bool)

(assert (=> b!1379957 m!1265077))

(declare-fun m!1265079 () Bool)

(assert (=> b!1379957 m!1265079))

(declare-fun m!1265081 () Bool)

(assert (=> b!1379958 m!1265081))

(declare-fun m!1265083 () Bool)

(assert (=> b!1379958 m!1265083))

(declare-fun m!1265085 () Bool)

(assert (=> b!1379958 m!1265085))

(declare-fun m!1265087 () Bool)

(assert (=> b!1379958 m!1265087))

(declare-fun m!1265089 () Bool)

(assert (=> b!1379958 m!1265089))

(declare-fun m!1265091 () Bool)

(assert (=> b!1379958 m!1265091))

(declare-fun m!1265093 () Bool)

(assert (=> b!1379955 m!1265093))

(assert (=> b!1379955 m!1265093))

(declare-fun m!1265095 () Bool)

(assert (=> b!1379955 m!1265095))

(declare-fun m!1265097 () Bool)

(assert (=> start!117360 m!1265097))

(push 1)

(assert (not b!1379957))

(assert (not b!1379958))

(assert (not b!1379955))

(assert (not start!117360))

(assert (not b!1379960))

(assert (not b!1379956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

