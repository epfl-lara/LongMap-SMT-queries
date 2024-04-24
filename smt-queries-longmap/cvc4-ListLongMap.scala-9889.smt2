; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117312 () Bool)

(assert start!117312)

(declare-fun res!921310 () Bool)

(declare-fun e!781611 () Bool)

(assert (=> start!117312 (=> (not res!921310) (not e!781611))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93813 0))(
  ( (array!93814 (arr!45302 (Array (_ BitVec 32) (_ BitVec 64))) (size!45853 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93813)

(assert (=> start!117312 (= res!921310 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45853 a!4094))))))

(assert (=> start!117312 e!781611))

(assert (=> start!117312 true))

(declare-fun array_inv!34583 (array!93813) Bool)

(assert (=> start!117312 (array_inv!34583 a!4094)))

(declare-fun b!1379563 () Bool)

(declare-fun res!921308 () Bool)

(assert (=> b!1379563 (=> (not res!921308) (not e!781611))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379563 (= res!921308 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379564 () Bool)

(declare-fun e!781609 () Bool)

(assert (=> b!1379564 (= e!781611 e!781609)))

(declare-fun res!921311 () Bool)

(assert (=> b!1379564 (=> (not res!921311) (not e!781609))))

(declare-fun lt!606883 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!606884 () (_ BitVec 32))

(assert (=> b!1379564 (= res!921311 (and (= lt!606884 (bvsub lt!606883 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!606885 () array!93813)

(declare-fun arrayCountValidKeys!0 (array!93813 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379564 (= lt!606884 (arrayCountValidKeys!0 lt!606885 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379564 (= lt!606883 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379564 (= lt!606885 (array!93814 (store (arr!45302 a!4094) i!1451 k!2953) (size!45853 a!4094)))))

(declare-fun b!1379565 () Bool)

(assert (=> b!1379565 (= e!781609 (not true))))

(assert (=> b!1379565 (= (bvadd (arrayCountValidKeys!0 lt!606885 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606884) (arrayCountValidKeys!0 lt!606885 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45700 0))(
  ( (Unit!45701) )
))
(declare-fun lt!606882 () Unit!45700)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45700)

(assert (=> b!1379565 (= lt!606882 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606885 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> b!1379565 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606883) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606886 () Unit!45700)

(assert (=> b!1379565 (= lt!606886 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379566 () Bool)

(declare-fun res!921309 () Bool)

(assert (=> b!1379566 (=> (not res!921309) (not e!781611))))

(assert (=> b!1379566 (= res!921309 (validKeyInArray!0 (select (arr!45302 a!4094) i!1451)))))

(declare-fun b!1379567 () Bool)

(declare-fun res!921312 () Bool)

(assert (=> b!1379567 (=> (not res!921312) (not e!781611))))

(assert (=> b!1379567 (= res!921312 (and (bvslt (size!45853 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45853 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117312 res!921310) b!1379566))

(assert (= (and b!1379566 res!921309) b!1379563))

(assert (= (and b!1379563 res!921308) b!1379567))

(assert (= (and b!1379567 res!921312) b!1379564))

(assert (= (and b!1379564 res!921311) b!1379565))

(declare-fun m!1264383 () Bool)

(assert (=> start!117312 m!1264383))

(declare-fun m!1264385 () Bool)

(assert (=> b!1379566 m!1264385))

(assert (=> b!1379566 m!1264385))

(declare-fun m!1264387 () Bool)

(assert (=> b!1379566 m!1264387))

(declare-fun m!1264389 () Bool)

(assert (=> b!1379564 m!1264389))

(declare-fun m!1264391 () Bool)

(assert (=> b!1379564 m!1264391))

(declare-fun m!1264393 () Bool)

(assert (=> b!1379564 m!1264393))

(declare-fun m!1264395 () Bool)

(assert (=> b!1379565 m!1264395))

(declare-fun m!1264397 () Bool)

(assert (=> b!1379565 m!1264397))

(declare-fun m!1264399 () Bool)

(assert (=> b!1379565 m!1264399))

(declare-fun m!1264401 () Bool)

(assert (=> b!1379565 m!1264401))

(declare-fun m!1264403 () Bool)

(assert (=> b!1379565 m!1264403))

(declare-fun m!1264405 () Bool)

(assert (=> b!1379565 m!1264405))

(declare-fun m!1264407 () Bool)

(assert (=> b!1379563 m!1264407))

(push 1)

(assert (not b!1379564))

(assert (not b!1379565))

(assert (not b!1379566))

(assert (not b!1379563))

(assert (not start!117312))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

