; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117102 () Bool)

(assert start!117102)

(declare-fun b!1378418 () Bool)

(declare-fun res!920955 () Bool)

(declare-fun e!780858 () Bool)

(assert (=> b!1378418 (=> (not res!920955) (not e!780858))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378418 (= res!920955 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378419 () Bool)

(declare-fun res!920952 () Bool)

(assert (=> b!1378419 (=> (not res!920952) (not e!780858))))

(declare-datatypes ((array!93719 0))(
  ( (array!93720 (arr!45260 (Array (_ BitVec 32) (_ BitVec 64))) (size!45810 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93719)

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1378419 (= res!920952 (validKeyInArray!0 (select (arr!45260 a!4094) i!1451)))))

(declare-fun b!1378420 () Bool)

(declare-fun e!780859 () Bool)

(assert (=> b!1378420 (= e!780858 e!780859)))

(declare-fun res!920953 () Bool)

(assert (=> b!1378420 (=> (not res!920953) (not e!780859))))

(declare-fun lt!606567 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606568 () (_ BitVec 32))

(assert (=> b!1378420 (= res!920953 (and (= lt!606568 (bvsub lt!606567 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606566 () array!93719)

(declare-fun arrayCountValidKeys!0 (array!93719 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378420 (= lt!606568 (arrayCountValidKeys!0 lt!606566 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378420 (= lt!606567 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378420 (= lt!606566 (array!93720 (store (arr!45260 a!4094) i!1451 k!2953) (size!45810 a!4094)))))

(declare-fun res!920956 () Bool)

(assert (=> start!117102 (=> (not res!920956) (not e!780858))))

(assert (=> start!117102 (= res!920956 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45810 a!4094))))))

(assert (=> start!117102 e!780858))

(assert (=> start!117102 true))

(declare-fun array_inv!34288 (array!93719) Bool)

(assert (=> start!117102 (array_inv!34288 a!4094)))

(declare-fun b!1378421 () Bool)

(declare-fun res!920954 () Bool)

(assert (=> b!1378421 (=> (not res!920954) (not e!780858))))

(assert (=> b!1378421 (= res!920954 (and (bvslt (size!45810 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45810 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378422 () Bool)

(assert (=> b!1378422 (= e!780859 (not true))))

(assert (=> b!1378422 (= (bvadd (arrayCountValidKeys!0 lt!606566 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606568) (arrayCountValidKeys!0 lt!606566 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45783 0))(
  ( (Unit!45784) )
))
(declare-fun lt!606569 () Unit!45783)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45783)

(assert (=> b!1378422 (= lt!606569 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606566 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378422 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606567) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606570 () Unit!45783)

(assert (=> b!1378422 (= lt!606570 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117102 res!920956) b!1378419))

(assert (= (and b!1378419 res!920952) b!1378418))

(assert (= (and b!1378418 res!920955) b!1378421))

(assert (= (and b!1378421 res!920954) b!1378420))

(assert (= (and b!1378420 res!920953) b!1378422))

(declare-fun m!1263033 () Bool)

(assert (=> b!1378422 m!1263033))

(declare-fun m!1263035 () Bool)

(assert (=> b!1378422 m!1263035))

(declare-fun m!1263037 () Bool)

(assert (=> b!1378422 m!1263037))

(declare-fun m!1263039 () Bool)

(assert (=> b!1378422 m!1263039))

(declare-fun m!1263041 () Bool)

(assert (=> b!1378422 m!1263041))

(declare-fun m!1263043 () Bool)

(assert (=> b!1378422 m!1263043))

(declare-fun m!1263045 () Bool)

(assert (=> start!117102 m!1263045))

(declare-fun m!1263047 () Bool)

(assert (=> b!1378418 m!1263047))

(declare-fun m!1263049 () Bool)

(assert (=> b!1378419 m!1263049))

(assert (=> b!1378419 m!1263049))

(declare-fun m!1263051 () Bool)

(assert (=> b!1378419 m!1263051))

(declare-fun m!1263053 () Bool)

(assert (=> b!1378420 m!1263053))

(declare-fun m!1263055 () Bool)

(assert (=> b!1378420 m!1263055))

(declare-fun m!1263057 () Bool)

(assert (=> b!1378420 m!1263057))

(push 1)

(assert (not b!1378418))

(assert (not start!117102))

(assert (not b!1378419))

(assert (not b!1378420))

(assert (not b!1378422))

(check-sat)

(pop 1)

