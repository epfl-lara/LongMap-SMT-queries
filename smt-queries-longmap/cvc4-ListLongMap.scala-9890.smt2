; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117082 () Bool)

(assert start!117082)

(declare-fun res!920809 () Bool)

(declare-fun e!780756 () Bool)

(assert (=> start!117082 (=> (not res!920809) (not e!780756))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93653 0))(
  ( (array!93654 (arr!45227 (Array (_ BitVec 32) (_ BitVec 64))) (size!45779 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93653)

(assert (=> start!117082 (= res!920809 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45779 a!4094))))))

(assert (=> start!117082 e!780756))

(assert (=> start!117082 true))

(declare-fun array_inv!34460 (array!93653) Bool)

(assert (=> start!117082 (array_inv!34460 a!4094)))

(declare-fun b!1378229 () Bool)

(declare-fun res!920810 () Bool)

(assert (=> b!1378229 (=> (not res!920810) (not e!780756))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378229 (= res!920810 (and (bvslt (size!45779 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45779 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378230 () Bool)

(declare-fun e!780755 () Bool)

(assert (=> b!1378230 (= e!780755 (not true))))

(declare-fun lt!606262 () array!93653)

(declare-fun lt!606264 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93653 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378230 (= (bvadd (arrayCountValidKeys!0 lt!606262 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606264) (arrayCountValidKeys!0 lt!606262 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45608 0))(
  ( (Unit!45609) )
))
(declare-fun lt!606263 () Unit!45608)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93653 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45608)

(assert (=> b!1378230 (= lt!606263 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606262 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606265 () (_ BitVec 32))

(assert (=> b!1378230 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!606265) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!606266 () Unit!45608)

(assert (=> b!1378230 (= lt!606266 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378231 () Bool)

(assert (=> b!1378231 (= e!780756 e!780755)))

(declare-fun res!920806 () Bool)

(assert (=> b!1378231 (=> (not res!920806) (not e!780755))))

(assert (=> b!1378231 (= res!920806 (and (= lt!606264 (bvsub lt!606265 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378231 (= lt!606264 (arrayCountValidKeys!0 lt!606262 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378231 (= lt!606265 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378231 (= lt!606262 (array!93654 (store (arr!45227 a!4094) i!1451 k!2953) (size!45779 a!4094)))))

(declare-fun b!1378232 () Bool)

(declare-fun res!920807 () Bool)

(assert (=> b!1378232 (=> (not res!920807) (not e!780756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378232 (= res!920807 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378233 () Bool)

(declare-fun res!920808 () Bool)

(assert (=> b!1378233 (=> (not res!920808) (not e!780756))))

(assert (=> b!1378233 (= res!920808 (validKeyInArray!0 (select (arr!45227 a!4094) i!1451)))))

(assert (= (and start!117082 res!920809) b!1378233))

(assert (= (and b!1378233 res!920808) b!1378232))

(assert (= (and b!1378232 res!920807) b!1378229))

(assert (= (and b!1378229 res!920810) b!1378231))

(assert (= (and b!1378231 res!920806) b!1378230))

(declare-fun m!1262321 () Bool)

(assert (=> b!1378232 m!1262321))

(declare-fun m!1262323 () Bool)

(assert (=> b!1378230 m!1262323))

(declare-fun m!1262325 () Bool)

(assert (=> b!1378230 m!1262325))

(declare-fun m!1262327 () Bool)

(assert (=> b!1378230 m!1262327))

(declare-fun m!1262329 () Bool)

(assert (=> b!1378230 m!1262329))

(declare-fun m!1262331 () Bool)

(assert (=> b!1378230 m!1262331))

(declare-fun m!1262333 () Bool)

(assert (=> b!1378230 m!1262333))

(declare-fun m!1262335 () Bool)

(assert (=> b!1378231 m!1262335))

(declare-fun m!1262337 () Bool)

(assert (=> b!1378231 m!1262337))

(declare-fun m!1262339 () Bool)

(assert (=> b!1378231 m!1262339))

(declare-fun m!1262341 () Bool)

(assert (=> start!117082 m!1262341))

(declare-fun m!1262343 () Bool)

(assert (=> b!1378233 m!1262343))

(assert (=> b!1378233 m!1262343))

(declare-fun m!1262345 () Bool)

(assert (=> b!1378233 m!1262345))

(push 1)

(assert (not start!117082))

(assert (not b!1378233))

(assert (not b!1378231))

(assert (not b!1378230))

(assert (not b!1378232))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

