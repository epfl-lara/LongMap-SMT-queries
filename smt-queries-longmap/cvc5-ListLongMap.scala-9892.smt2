; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117096 () Bool)

(assert start!117096)

(declare-fun b!1378373 () Bool)

(declare-fun res!920911 () Bool)

(declare-fun e!780831 () Bool)

(assert (=> b!1378373 (=> (not res!920911) (not e!780831))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378373 (= res!920911 (not (validKeyInArray!0 k!2953)))))

(declare-fun res!920910 () Bool)

(assert (=> start!117096 (=> (not res!920910) (not e!780831))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93713 0))(
  ( (array!93714 (arr!45257 (Array (_ BitVec 32) (_ BitVec 64))) (size!45807 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93713)

(assert (=> start!117096 (= res!920910 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45807 a!4094))))))

(assert (=> start!117096 e!780831))

(assert (=> start!117096 true))

(declare-fun array_inv!34285 (array!93713) Bool)

(assert (=> start!117096 (array_inv!34285 a!4094)))

(declare-fun b!1378374 () Bool)

(declare-fun res!920907 () Bool)

(assert (=> b!1378374 (=> (not res!920907) (not e!780831))))

(assert (=> b!1378374 (= res!920907 (validKeyInArray!0 (select (arr!45257 a!4094) i!1451)))))

(declare-fun b!1378375 () Bool)

(declare-fun res!920909 () Bool)

(assert (=> b!1378375 (=> (not res!920909) (not e!780831))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378375 (= res!920909 (and (bvslt (size!45807 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45807 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378376 () Bool)

(declare-fun e!780832 () Bool)

(assert (=> b!1378376 (= e!780832 (not true))))

(declare-fun lt!606523 () array!93713)

(declare-fun lt!606521 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93713 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378376 (= (bvadd (arrayCountValidKeys!0 lt!606523 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606521) (arrayCountValidKeys!0 lt!606523 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45777 0))(
  ( (Unit!45778) )
))
(declare-fun lt!606525 () Unit!45777)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45777)

(assert (=> b!1378376 (= lt!606525 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606523 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606524 () (_ BitVec 32))

(assert (=> b!1378376 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606524) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606522 () Unit!45777)

(assert (=> b!1378376 (= lt!606522 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378377 () Bool)

(assert (=> b!1378377 (= e!780831 e!780832)))

(declare-fun res!920908 () Bool)

(assert (=> b!1378377 (=> (not res!920908) (not e!780832))))

(assert (=> b!1378377 (= res!920908 (and (= lt!606521 (bvsub lt!606524 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378377 (= lt!606521 (arrayCountValidKeys!0 lt!606523 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378377 (= lt!606524 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378377 (= lt!606523 (array!93714 (store (arr!45257 a!4094) i!1451 k!2953) (size!45807 a!4094)))))

(assert (= (and start!117096 res!920910) b!1378374))

(assert (= (and b!1378374 res!920907) b!1378373))

(assert (= (and b!1378373 res!920911) b!1378375))

(assert (= (and b!1378375 res!920909) b!1378377))

(assert (= (and b!1378377 res!920908) b!1378376))

(declare-fun m!1262955 () Bool)

(assert (=> b!1378373 m!1262955))

(declare-fun m!1262957 () Bool)

(assert (=> start!117096 m!1262957))

(declare-fun m!1262959 () Bool)

(assert (=> b!1378376 m!1262959))

(declare-fun m!1262961 () Bool)

(assert (=> b!1378376 m!1262961))

(declare-fun m!1262963 () Bool)

(assert (=> b!1378376 m!1262963))

(declare-fun m!1262965 () Bool)

(assert (=> b!1378376 m!1262965))

(declare-fun m!1262967 () Bool)

(assert (=> b!1378376 m!1262967))

(declare-fun m!1262969 () Bool)

(assert (=> b!1378376 m!1262969))

(declare-fun m!1262971 () Bool)

(assert (=> b!1378377 m!1262971))

(declare-fun m!1262973 () Bool)

(assert (=> b!1378377 m!1262973))

(declare-fun m!1262975 () Bool)

(assert (=> b!1378377 m!1262975))

(declare-fun m!1262977 () Bool)

(assert (=> b!1378374 m!1262977))

(assert (=> b!1378374 m!1262977))

(declare-fun m!1262979 () Bool)

(assert (=> b!1378374 m!1262979))

(push 1)

(assert (not b!1378377))

(assert (not b!1378376))

(assert (not b!1378373))

(assert (not b!1378374))

(assert (not start!117096))

(check-sat)

(pop 1)

