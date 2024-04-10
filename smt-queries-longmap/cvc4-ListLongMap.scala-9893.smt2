; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117106 () Bool)

(assert start!117106)

(declare-fun res!920986 () Bool)

(declare-fun e!780876 () Bool)

(assert (=> start!117106 (=> (not res!920986) (not e!780876))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93723 0))(
  ( (array!93724 (arr!45262 (Array (_ BitVec 32) (_ BitVec 64))) (size!45812 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93723)

(assert (=> start!117106 (= res!920986 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45812 a!4094))))))

(assert (=> start!117106 e!780876))

(assert (=> start!117106 true))

(declare-fun array_inv!34290 (array!93723) Bool)

(assert (=> start!117106 (array_inv!34290 a!4094)))

(declare-fun b!1378448 () Bool)

(declare-fun res!920982 () Bool)

(assert (=> b!1378448 (=> (not res!920982) (not e!780876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378448 (= res!920982 (validKeyInArray!0 (select (arr!45262 a!4094) i!1451)))))

(declare-fun b!1378449 () Bool)

(declare-fun e!780877 () Bool)

(assert (=> b!1378449 (= e!780877 (not true))))

(declare-fun lt!606597 () array!93723)

(declare-fun lt!606598 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93723 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378449 (= (bvadd (arrayCountValidKeys!0 lt!606597 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606598) (arrayCountValidKeys!0 lt!606597 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45787 0))(
  ( (Unit!45788) )
))
(declare-fun lt!606599 () Unit!45787)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45787)

(assert (=> b!1378449 (= lt!606599 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606597 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606600 () (_ BitVec 32))

(assert (=> b!1378449 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606600) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606596 () Unit!45787)

(assert (=> b!1378449 (= lt!606596 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378450 () Bool)

(declare-fun res!920985 () Bool)

(assert (=> b!1378450 (=> (not res!920985) (not e!780876))))

(assert (=> b!1378450 (= res!920985 (and (bvslt (size!45812 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45812 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378451 () Bool)

(assert (=> b!1378451 (= e!780876 e!780877)))

(declare-fun res!920983 () Bool)

(assert (=> b!1378451 (=> (not res!920983) (not e!780877))))

(assert (=> b!1378451 (= res!920983 (and (= lt!606598 (bvsub lt!606600 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378451 (= lt!606598 (arrayCountValidKeys!0 lt!606597 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378451 (= lt!606600 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378451 (= lt!606597 (array!93724 (store (arr!45262 a!4094) i!1451 k!2953) (size!45812 a!4094)))))

(declare-fun b!1378452 () Bool)

(declare-fun res!920984 () Bool)

(assert (=> b!1378452 (=> (not res!920984) (not e!780876))))

(assert (=> b!1378452 (= res!920984 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117106 res!920986) b!1378448))

(assert (= (and b!1378448 res!920982) b!1378452))

(assert (= (and b!1378452 res!920984) b!1378450))

(assert (= (and b!1378450 res!920985) b!1378451))

(assert (= (and b!1378451 res!920983) b!1378449))

(declare-fun m!1263085 () Bool)

(assert (=> b!1378452 m!1263085))

(declare-fun m!1263087 () Bool)

(assert (=> b!1378449 m!1263087))

(declare-fun m!1263089 () Bool)

(assert (=> b!1378449 m!1263089))

(declare-fun m!1263091 () Bool)

(assert (=> b!1378449 m!1263091))

(declare-fun m!1263093 () Bool)

(assert (=> b!1378449 m!1263093))

(declare-fun m!1263095 () Bool)

(assert (=> b!1378449 m!1263095))

(declare-fun m!1263097 () Bool)

(assert (=> b!1378449 m!1263097))

(declare-fun m!1263099 () Bool)

(assert (=> start!117106 m!1263099))

(declare-fun m!1263101 () Bool)

(assert (=> b!1378448 m!1263101))

(assert (=> b!1378448 m!1263101))

(declare-fun m!1263103 () Bool)

(assert (=> b!1378448 m!1263103))

(declare-fun m!1263105 () Bool)

(assert (=> b!1378451 m!1263105))

(declare-fun m!1263107 () Bool)

(assert (=> b!1378451 m!1263107))

(declare-fun m!1263109 () Bool)

(assert (=> b!1378451 m!1263109))

(push 1)

(assert (not b!1378451))

(assert (not b!1378452))

(assert (not b!1378449))

(assert (not b!1378448))

(assert (not start!117106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

