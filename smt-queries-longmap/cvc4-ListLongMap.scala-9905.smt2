; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117178 () Bool)

(assert start!117178)

(declare-fun b!1379014 () Bool)

(declare-fun e!781183 () Bool)

(declare-fun e!781184 () Bool)

(assert (=> b!1379014 (= e!781183 e!781184)))

(declare-fun res!921553 () Bool)

(assert (=> b!1379014 (=> (not res!921553) (not e!781184))))

(declare-datatypes ((array!93795 0))(
  ( (array!93796 (arr!45298 (Array (_ BitVec 32) (_ BitVec 64))) (size!45848 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93795)

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607050 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93795 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379014 (= res!921553 (= (arrayCountValidKeys!0 (array!93796 (store (arr!45298 a!4094) i!1451 k!2953) (size!45848 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!607050 #b00000000000000000000000000000001)))))

(assert (=> b!1379014 (= lt!607050 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun res!921548 () Bool)

(assert (=> start!117178 (=> (not res!921548) (not e!781183))))

(assert (=> start!117178 (= res!921548 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45848 a!4094))))))

(assert (=> start!117178 e!781183))

(assert (=> start!117178 true))

(declare-fun array_inv!34326 (array!93795) Bool)

(assert (=> start!117178 (array_inv!34326 a!4094)))

(declare-fun b!1379015 () Bool)

(declare-fun res!921552 () Bool)

(assert (=> b!1379015 (=> (not res!921552) (not e!781183))))

(assert (=> b!1379015 (= res!921552 (and (bvslt (size!45848 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45848 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379016 () Bool)

(declare-fun res!921550 () Bool)

(assert (=> b!1379016 (=> (not res!921550) (not e!781184))))

(assert (=> b!1379016 (= res!921550 (bvsgt from!3466 #b00000000000000000000000000000000))))

(declare-fun b!1379017 () Bool)

(assert (=> b!1379017 (= e!781184 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))))

(assert (=> b!1379017 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607050) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45823 0))(
  ( (Unit!45824) )
))
(declare-fun lt!607049 () Unit!45823)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93795 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45823)

(assert (=> b!1379017 (= lt!607049 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379018 () Bool)

(declare-fun res!921551 () Bool)

(assert (=> b!1379018 (=> (not res!921551) (not e!781183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379018 (= res!921551 (validKeyInArray!0 (select (arr!45298 a!4094) i!1451)))))

(declare-fun b!1379019 () Bool)

(declare-fun res!921549 () Bool)

(assert (=> b!1379019 (=> (not res!921549) (not e!781183))))

(assert (=> b!1379019 (= res!921549 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117178 res!921548) b!1379018))

(assert (= (and b!1379018 res!921551) b!1379019))

(assert (= (and b!1379019 res!921549) b!1379015))

(assert (= (and b!1379015 res!921552) b!1379014))

(assert (= (and b!1379014 res!921553) b!1379016))

(assert (= (and b!1379016 res!921550) b!1379017))

(declare-fun m!1263847 () Bool)

(assert (=> b!1379017 m!1263847))

(declare-fun m!1263849 () Bool)

(assert (=> b!1379017 m!1263849))

(declare-fun m!1263851 () Bool)

(assert (=> b!1379017 m!1263851))

(declare-fun m!1263853 () Bool)

(assert (=> start!117178 m!1263853))

(declare-fun m!1263855 () Bool)

(assert (=> b!1379019 m!1263855))

(declare-fun m!1263857 () Bool)

(assert (=> b!1379014 m!1263857))

(declare-fun m!1263859 () Bool)

(assert (=> b!1379014 m!1263859))

(declare-fun m!1263861 () Bool)

(assert (=> b!1379014 m!1263861))

(declare-fun m!1263863 () Bool)

(assert (=> b!1379018 m!1263863))

(assert (=> b!1379018 m!1263863))

(declare-fun m!1263865 () Bool)

(assert (=> b!1379018 m!1263865))

(push 1)

(assert (not b!1379014))

(assert (not b!1379019))

(assert (not b!1379017))

(assert (not b!1379018))

(assert (not start!117178))

(check-sat)

(pop 1)

(push 1)

(check-sat)

