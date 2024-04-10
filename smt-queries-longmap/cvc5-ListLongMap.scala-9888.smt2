; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117072 () Bool)

(assert start!117072)

(declare-fun b!1378193 () Bool)

(declare-fun e!780725 () Bool)

(assert (=> b!1378193 (= e!780725 (not true))))

(declare-datatypes ((array!93689 0))(
  ( (array!93690 (arr!45245 (Array (_ BitVec 32) (_ BitVec 64))) (size!45795 (_ BitVec 32))) )
))
(declare-fun lt!606344 () array!93689)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606341 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93689 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378193 (= (bvadd (arrayCountValidKeys!0 lt!606344 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606341) (arrayCountValidKeys!0 lt!606344 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45753 0))(
  ( (Unit!45754) )
))
(declare-fun lt!606345 () Unit!45753)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45753)

(assert (=> b!1378193 (= lt!606345 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606344 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun a!4094 () array!93689)

(declare-fun lt!606343 () (_ BitVec 32))

(assert (=> b!1378193 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606343) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606342 () Unit!45753)

(assert (=> b!1378193 (= lt!606342 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378194 () Bool)

(declare-fun res!920731 () Bool)

(declare-fun e!780724 () Bool)

(assert (=> b!1378194 (=> (not res!920731) (not e!780724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378194 (= res!920731 (validKeyInArray!0 (select (arr!45245 a!4094) i!1451)))))

(declare-fun b!1378195 () Bool)

(declare-fun res!920728 () Bool)

(assert (=> b!1378195 (=> (not res!920728) (not e!780724))))

(assert (=> b!1378195 (= res!920728 (and (bvslt (size!45795 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45795 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!920729 () Bool)

(assert (=> start!117072 (=> (not res!920729) (not e!780724))))

(assert (=> start!117072 (= res!920729 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45795 a!4094))))))

(assert (=> start!117072 e!780724))

(assert (=> start!117072 true))

(declare-fun array_inv!34273 (array!93689) Bool)

(assert (=> start!117072 (array_inv!34273 a!4094)))

(declare-fun b!1378196 () Bool)

(declare-fun res!920727 () Bool)

(assert (=> b!1378196 (=> (not res!920727) (not e!780724))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378196 (= res!920727 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378197 () Bool)

(assert (=> b!1378197 (= e!780724 e!780725)))

(declare-fun res!920730 () Bool)

(assert (=> b!1378197 (=> (not res!920730) (not e!780725))))

(assert (=> b!1378197 (= res!920730 (and (= lt!606341 (bvsub lt!606343 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378197 (= lt!606341 (arrayCountValidKeys!0 lt!606344 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378197 (= lt!606343 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378197 (= lt!606344 (array!93690 (store (arr!45245 a!4094) i!1451 k!2953) (size!45795 a!4094)))))

(assert (= (and start!117072 res!920729) b!1378194))

(assert (= (and b!1378194 res!920731) b!1378196))

(assert (= (and b!1378196 res!920727) b!1378195))

(assert (= (and b!1378195 res!920728) b!1378197))

(assert (= (and b!1378197 res!920730) b!1378193))

(declare-fun m!1262643 () Bool)

(assert (=> b!1378193 m!1262643))

(declare-fun m!1262645 () Bool)

(assert (=> b!1378193 m!1262645))

(declare-fun m!1262647 () Bool)

(assert (=> b!1378193 m!1262647))

(declare-fun m!1262649 () Bool)

(assert (=> b!1378193 m!1262649))

(declare-fun m!1262651 () Bool)

(assert (=> b!1378193 m!1262651))

(declare-fun m!1262653 () Bool)

(assert (=> b!1378193 m!1262653))

(declare-fun m!1262655 () Bool)

(assert (=> start!117072 m!1262655))

(declare-fun m!1262657 () Bool)

(assert (=> b!1378197 m!1262657))

(declare-fun m!1262659 () Bool)

(assert (=> b!1378197 m!1262659))

(declare-fun m!1262661 () Bool)

(assert (=> b!1378197 m!1262661))

(declare-fun m!1262663 () Bool)

(assert (=> b!1378194 m!1262663))

(assert (=> b!1378194 m!1262663))

(declare-fun m!1262665 () Bool)

(assert (=> b!1378194 m!1262665))

(declare-fun m!1262667 () Bool)

(assert (=> b!1378196 m!1262667))

(push 1)

