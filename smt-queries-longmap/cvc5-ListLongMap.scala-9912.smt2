; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117476 () Bool)

(assert start!117476)

(declare-fun b!1380736 () Bool)

(declare-fun res!922388 () Bool)

(declare-fun e!782269 () Bool)

(assert (=> b!1380736 (=> (not res!922388) (not e!782269))))

(declare-datatypes ((array!93956 0))(
  ( (array!93957 (arr!45372 (Array (_ BitVec 32) (_ BitVec 64))) (size!45923 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93956)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380736 (= res!922388 (validKeyInArray!0 (select (arr!45372 a!4094) i!1451)))))

(declare-fun lt!607949 () (_ BitVec 32))

(declare-fun e!782271 () Bool)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607951 () (_ BitVec 32))

(declare-fun b!1380737 () Bool)

(assert (=> b!1380737 (= e!782271 (not (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45923 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607949 (bvsub lt!607951 #b00000000000000000000000000000001))) (bvslt (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))))

(declare-fun lt!607950 () (_ BitVec 32))

(declare-fun lt!607953 () (_ BitVec 32))

(assert (=> b!1380737 (= (bvadd lt!607950 lt!607953) lt!607949)))

(declare-fun lt!607946 () array!93956)

(declare-fun arrayCountValidKeys!0 (array!93956 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380737 (= lt!607949 (arrayCountValidKeys!0 lt!607946 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380737 (= lt!607950 (arrayCountValidKeys!0 lt!607946 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45804 0))(
  ( (Unit!45805) )
))
(declare-fun lt!607952 () Unit!45804)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45804)

(assert (=> b!1380737 (= lt!607952 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607946 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607948 () (_ BitVec 32))

(declare-fun lt!607947 () (_ BitVec 32))

(assert (=> b!1380737 (= (bvadd lt!607948 lt!607947) lt!607951)))

(assert (=> b!1380737 (= lt!607951 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380737 (= lt!607948 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607954 () Unit!45804)

(assert (=> b!1380737 (= lt!607954 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!922386 () Bool)

(assert (=> start!117476 (=> (not res!922386) (not e!782269))))

(assert (=> start!117476 (= res!922386 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45923 a!4094))))))

(assert (=> start!117476 e!782269))

(assert (=> start!117476 true))

(declare-fun array_inv!34653 (array!93956) Bool)

(assert (=> start!117476 (array_inv!34653 a!4094)))

(declare-fun b!1380738 () Bool)

(declare-fun res!922385 () Bool)

(assert (=> b!1380738 (=> (not res!922385) (not e!782269))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1380738 (= res!922385 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1380739 () Bool)

(assert (=> b!1380739 (= e!782269 e!782271)))

(declare-fun res!922389 () Bool)

(assert (=> b!1380739 (=> (not res!922389) (not e!782271))))

(assert (=> b!1380739 (= res!922389 (and (= lt!607953 (bvsub lt!607947 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1380739 (= lt!607953 (arrayCountValidKeys!0 lt!607946 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380739 (= lt!607947 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1380739 (= lt!607946 (array!93957 (store (arr!45372 a!4094) i!1451 k!2953) (size!45923 a!4094)))))

(declare-fun b!1380740 () Bool)

(declare-fun res!922387 () Bool)

(assert (=> b!1380740 (=> (not res!922387) (not e!782269))))

(assert (=> b!1380740 (= res!922387 (and (bvslt (size!45923 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45923 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117476 res!922386) b!1380736))

(assert (= (and b!1380736 res!922388) b!1380738))

(assert (= (and b!1380738 res!922385) b!1380740))

(assert (= (and b!1380740 res!922387) b!1380739))

(assert (= (and b!1380739 res!922389) b!1380737))

(declare-fun m!1266119 () Bool)

(assert (=> b!1380737 m!1266119))

(declare-fun m!1266121 () Bool)

(assert (=> b!1380737 m!1266121))

(declare-fun m!1266123 () Bool)

(assert (=> b!1380737 m!1266123))

(declare-fun m!1266125 () Bool)

(assert (=> b!1380737 m!1266125))

(declare-fun m!1266127 () Bool)

(assert (=> b!1380737 m!1266127))

(declare-fun m!1266129 () Bool)

(assert (=> b!1380737 m!1266129))

(declare-fun m!1266131 () Bool)

(assert (=> start!117476 m!1266131))

(declare-fun m!1266133 () Bool)

(assert (=> b!1380739 m!1266133))

(declare-fun m!1266135 () Bool)

(assert (=> b!1380739 m!1266135))

(declare-fun m!1266137 () Bool)

(assert (=> b!1380739 m!1266137))

(declare-fun m!1266139 () Bool)

(assert (=> b!1380738 m!1266139))

(declare-fun m!1266141 () Bool)

(assert (=> b!1380736 m!1266141))

(assert (=> b!1380736 m!1266141))

(declare-fun m!1266143 () Bool)

(assert (=> b!1380736 m!1266143))

(push 1)

(assert (not start!117476))

(assert (not b!1380737))

(assert (not b!1380736))

(assert (not b!1380738))

(assert (not b!1380739))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

