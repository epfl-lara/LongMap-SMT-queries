; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117094 () Bool)

(assert start!117094)

(declare-fun b!1378358 () Bool)

(declare-fun res!920894 () Bool)

(declare-fun e!780824 () Bool)

(assert (=> b!1378358 (=> (not res!920894) (not e!780824))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378358 (= res!920894 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378360 () Bool)

(declare-fun res!920896 () Bool)

(assert (=> b!1378360 (=> (not res!920896) (not e!780824))))

(declare-datatypes ((array!93711 0))(
  ( (array!93712 (arr!45256 (Array (_ BitVec 32) (_ BitVec 64))) (size!45806 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93711)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378360 (= res!920896 (and (bvslt (size!45806 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45806 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378361 () Bool)

(declare-fun e!780823 () Bool)

(assert (=> b!1378361 (= e!780824 e!780823)))

(declare-fun res!920893 () Bool)

(assert (=> b!1378361 (=> (not res!920893) (not e!780823))))

(declare-fun lt!606507 () (_ BitVec 32))

(declare-fun lt!606506 () (_ BitVec 32))

(assert (=> b!1378361 (= res!920893 (and (= lt!606506 (bvsub lt!606507 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606508 () array!93711)

(declare-fun arrayCountValidKeys!0 (array!93711 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378361 (= lt!606506 (arrayCountValidKeys!0 lt!606508 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378361 (= lt!606507 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378361 (= lt!606508 (array!93712 (store (arr!45256 a!4094) i!1451 k!2953) (size!45806 a!4094)))))

(declare-fun b!1378362 () Bool)

(declare-fun res!920895 () Bool)

(assert (=> b!1378362 (=> (not res!920895) (not e!780824))))

(assert (=> b!1378362 (= res!920895 (validKeyInArray!0 (select (arr!45256 a!4094) i!1451)))))

(declare-fun res!920892 () Bool)

(assert (=> start!117094 (=> (not res!920892) (not e!780824))))

(assert (=> start!117094 (= res!920892 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45806 a!4094))))))

(assert (=> start!117094 e!780824))

(assert (=> start!117094 true))

(declare-fun array_inv!34284 (array!93711) Bool)

(assert (=> start!117094 (array_inv!34284 a!4094)))

(declare-fun b!1378359 () Bool)

(assert (=> b!1378359 (= e!780823 (not true))))

(assert (=> b!1378359 (= (bvadd (arrayCountValidKeys!0 lt!606508 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606506) (arrayCountValidKeys!0 lt!606508 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45775 0))(
  ( (Unit!45776) )
))
(declare-fun lt!606510 () Unit!45775)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45775)

(assert (=> b!1378359 (= lt!606510 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606508 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378359 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606507) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606509 () Unit!45775)

(assert (=> b!1378359 (= lt!606509 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117094 res!920892) b!1378362))

(assert (= (and b!1378362 res!920895) b!1378358))

(assert (= (and b!1378358 res!920894) b!1378360))

(assert (= (and b!1378360 res!920896) b!1378361))

(assert (= (and b!1378361 res!920893) b!1378359))

(declare-fun m!1262929 () Bool)

(assert (=> b!1378359 m!1262929))

(declare-fun m!1262931 () Bool)

(assert (=> b!1378359 m!1262931))

(declare-fun m!1262933 () Bool)

(assert (=> b!1378359 m!1262933))

(declare-fun m!1262935 () Bool)

(assert (=> b!1378359 m!1262935))

(declare-fun m!1262937 () Bool)

(assert (=> b!1378359 m!1262937))

(declare-fun m!1262939 () Bool)

(assert (=> b!1378359 m!1262939))

(declare-fun m!1262941 () Bool)

(assert (=> b!1378361 m!1262941))

(declare-fun m!1262943 () Bool)

(assert (=> b!1378361 m!1262943))

(declare-fun m!1262945 () Bool)

(assert (=> b!1378361 m!1262945))

(declare-fun m!1262947 () Bool)

(assert (=> b!1378358 m!1262947))

(declare-fun m!1262949 () Bool)

(assert (=> b!1378362 m!1262949))

(assert (=> b!1378362 m!1262949))

(declare-fun m!1262951 () Bool)

(assert (=> b!1378362 m!1262951))

(declare-fun m!1262953 () Bool)

(assert (=> start!117094 m!1262953))

(push 1)

(assert (not b!1378358))

(assert (not start!117094))

(assert (not b!1378361))

(assert (not b!1378362))

(assert (not b!1378359))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

