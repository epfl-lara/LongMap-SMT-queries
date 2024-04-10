; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117082 () Bool)

(assert start!117082)

(declare-fun b!1378268 () Bool)

(declare-fun e!780770 () Bool)

(declare-fun e!780768 () Bool)

(assert (=> b!1378268 (= e!780770 e!780768)))

(declare-fun res!920802 () Bool)

(assert (=> b!1378268 (=> (not res!920802) (not e!780768))))

(declare-fun lt!606417 () (_ BitVec 32))

(declare-fun lt!606416 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378268 (= res!920802 (and (= lt!606416 (bvsub lt!606417 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93699 0))(
  ( (array!93700 (arr!45250 (Array (_ BitVec 32) (_ BitVec 64))) (size!45800 (_ BitVec 32))) )
))
(declare-fun lt!606418 () array!93699)

(declare-fun arrayCountValidKeys!0 (array!93699 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378268 (= lt!606416 (arrayCountValidKeys!0 lt!606418 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93699)

(assert (=> b!1378268 (= lt!606417 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378268 (= lt!606418 (array!93700 (store (arr!45250 a!4094) i!1451 k!2953) (size!45800 a!4094)))))

(declare-fun b!1378269 () Bool)

(declare-fun res!920806 () Bool)

(assert (=> b!1378269 (=> (not res!920806) (not e!780770))))

(assert (=> b!1378269 (= res!920806 (and (bvslt (size!45800 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45800 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378270 () Bool)

(declare-fun res!920805 () Bool)

(assert (=> b!1378270 (=> (not res!920805) (not e!780770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378270 (= res!920805 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378271 () Bool)

(declare-fun res!920804 () Bool)

(assert (=> b!1378271 (=> (not res!920804) (not e!780770))))

(assert (=> b!1378271 (= res!920804 (validKeyInArray!0 (select (arr!45250 a!4094) i!1451)))))

(declare-fun b!1378272 () Bool)

(assert (=> b!1378272 (= e!780768 (not true))))

(assert (=> b!1378272 (= (bvadd (arrayCountValidKeys!0 lt!606418 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606416) (arrayCountValidKeys!0 lt!606418 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45763 0))(
  ( (Unit!45764) )
))
(declare-fun lt!606419 () Unit!45763)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45763)

(assert (=> b!1378272 (= lt!606419 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606418 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1378272 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606417) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606420 () Unit!45763)

(assert (=> b!1378272 (= lt!606420 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!920803 () Bool)

(assert (=> start!117082 (=> (not res!920803) (not e!780770))))

(assert (=> start!117082 (= res!920803 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45800 a!4094))))))

(assert (=> start!117082 e!780770))

(assert (=> start!117082 true))

(declare-fun array_inv!34278 (array!93699) Bool)

(assert (=> start!117082 (array_inv!34278 a!4094)))

(assert (= (and start!117082 res!920803) b!1378271))

(assert (= (and b!1378271 res!920804) b!1378270))

(assert (= (and b!1378270 res!920805) b!1378269))

(assert (= (and b!1378269 res!920806) b!1378268))

(assert (= (and b!1378268 res!920802) b!1378272))

(declare-fun m!1262773 () Bool)

(assert (=> b!1378271 m!1262773))

(assert (=> b!1378271 m!1262773))

(declare-fun m!1262775 () Bool)

(assert (=> b!1378271 m!1262775))

(declare-fun m!1262777 () Bool)

(assert (=> b!1378270 m!1262777))

(declare-fun m!1262779 () Bool)

(assert (=> start!117082 m!1262779))

(declare-fun m!1262781 () Bool)

(assert (=> b!1378268 m!1262781))

(declare-fun m!1262783 () Bool)

(assert (=> b!1378268 m!1262783))

(declare-fun m!1262785 () Bool)

(assert (=> b!1378268 m!1262785))

(declare-fun m!1262787 () Bool)

(assert (=> b!1378272 m!1262787))

(declare-fun m!1262789 () Bool)

(assert (=> b!1378272 m!1262789))

(declare-fun m!1262791 () Bool)

(assert (=> b!1378272 m!1262791))

(declare-fun m!1262793 () Bool)

(assert (=> b!1378272 m!1262793))

(declare-fun m!1262795 () Bool)

(assert (=> b!1378272 m!1262795))

(declare-fun m!1262797 () Bool)

(assert (=> b!1378272 m!1262797))

(push 1)

(assert (not b!1378271))

(assert (not start!117082))

(assert (not b!1378268))

(assert (not b!1378270))

(assert (not b!1378272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

