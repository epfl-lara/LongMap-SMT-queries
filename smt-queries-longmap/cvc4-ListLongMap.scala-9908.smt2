; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117190 () Bool)

(assert start!117190)

(declare-fun b!1379066 () Bool)

(declare-fun res!921645 () Bool)

(declare-fun e!781223 () Bool)

(assert (=> b!1379066 (=> (not res!921645) (not e!781223))))

(declare-datatypes ((array!93761 0))(
  ( (array!93762 (arr!45281 (Array (_ BitVec 32) (_ BitVec 64))) (size!45833 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93761)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1379066 (= res!921645 (and (bvslt (size!45833 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45833 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!921647 () Bool)

(assert (=> start!117190 (=> (not res!921647) (not e!781223))))

(assert (=> start!117190 (= res!921647 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45833 a!4094))))))

(assert (=> start!117190 e!781223))

(assert (=> start!117190 true))

(declare-fun array_inv!34514 (array!93761) Bool)

(assert (=> start!117190 (array_inv!34514 a!4094)))

(declare-fun b!1379067 () Bool)

(declare-fun res!921644 () Bool)

(assert (=> b!1379067 (=> (not res!921644) (not e!781223))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379067 (= res!921644 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379068 () Bool)

(declare-fun e!781224 () Bool)

(assert (=> b!1379068 (= e!781223 e!781224)))

(declare-fun res!921646 () Bool)

(assert (=> b!1379068 (=> (not res!921646) (not e!781224))))

(declare-fun lt!606985 () (_ BitVec 32))

(declare-fun lt!606986 () (_ BitVec 32))

(assert (=> b!1379068 (= res!921646 (and (= lt!606985 (bvsub lt!606986 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606982 () array!93761)

(declare-fun arrayCountValidKeys!0 (array!93761 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379068 (= lt!606985 (arrayCountValidKeys!0 lt!606982 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379068 (= lt!606986 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379068 (= lt!606982 (array!93762 (store (arr!45281 a!4094) i!1451 k!2953) (size!45833 a!4094)))))

(declare-fun b!1379069 () Bool)

(declare-fun res!921643 () Bool)

(assert (=> b!1379069 (=> (not res!921643) (not e!781223))))

(assert (=> b!1379069 (= res!921643 (validKeyInArray!0 (select (arr!45281 a!4094) i!1451)))))

(declare-fun b!1379070 () Bool)

(assert (=> b!1379070 (= e!781224 (not true))))

(assert (=> b!1379070 (= (bvadd (arrayCountValidKeys!0 lt!606982 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606985) (arrayCountValidKeys!0 lt!606982 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45680 0))(
  ( (Unit!45681) )
))
(declare-fun lt!606984 () Unit!45680)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45680)

(assert (=> b!1379070 (= lt!606984 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606982 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1379070 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606986) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606983 () Unit!45680)

(assert (=> b!1379070 (= lt!606983 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117190 res!921647) b!1379069))

(assert (= (and b!1379069 res!921643) b!1379067))

(assert (= (and b!1379067 res!921644) b!1379066))

(assert (= (and b!1379066 res!921645) b!1379068))

(assert (= (and b!1379068 res!921646) b!1379070))

(declare-fun m!1263545 () Bool)

(assert (=> b!1379069 m!1263545))

(assert (=> b!1379069 m!1263545))

(declare-fun m!1263547 () Bool)

(assert (=> b!1379069 m!1263547))

(declare-fun m!1263549 () Bool)

(assert (=> start!117190 m!1263549))

(declare-fun m!1263551 () Bool)

(assert (=> b!1379067 m!1263551))

(declare-fun m!1263553 () Bool)

(assert (=> b!1379070 m!1263553))

(declare-fun m!1263555 () Bool)

(assert (=> b!1379070 m!1263555))

(declare-fun m!1263557 () Bool)

(assert (=> b!1379070 m!1263557))

(declare-fun m!1263559 () Bool)

(assert (=> b!1379070 m!1263559))

(declare-fun m!1263561 () Bool)

(assert (=> b!1379070 m!1263561))

(declare-fun m!1263563 () Bool)

(assert (=> b!1379070 m!1263563))

(declare-fun m!1263565 () Bool)

(assert (=> b!1379068 m!1263565))

(declare-fun m!1263567 () Bool)

(assert (=> b!1379068 m!1263567))

(declare-fun m!1263569 () Bool)

(assert (=> b!1379068 m!1263569))

(push 1)

(assert (not b!1379067))

(assert (not b!1379070))

(assert (not b!1379068))

(assert (not b!1379069))

(assert (not start!117190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

