; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117408 () Bool)

(assert start!117408)

(declare-fun b!1380306 () Bool)

(declare-fun e!782023 () Bool)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1380306 (= e!782023 (not (and (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))))

(declare-datatypes ((array!93909 0))(
  ( (array!93910 (arr!45350 (Array (_ BitVec 32) (_ BitVec 64))) (size!45901 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93909)

(declare-fun lt!607524 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93909 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1380306 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607524) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-datatypes ((Unit!45760 0))(
  ( (Unit!45761) )
))
(declare-fun lt!607525 () Unit!45760)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93909 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45760)

(assert (=> b!1380306 (= lt!607525 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1380307 () Bool)

(declare-fun res!922052 () Bool)

(declare-fun e!782024 () Bool)

(assert (=> b!1380307 (=> (not res!922052) (not e!782024))))

(assert (=> b!1380307 (= res!922052 (and (bvslt (size!45901 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45901 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun res!922054 () Bool)

(assert (=> start!117408 (=> (not res!922054) (not e!782024))))

(assert (=> start!117408 (= res!922054 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45901 a!4094))))))

(assert (=> start!117408 e!782024))

(assert (=> start!117408 true))

(declare-fun array_inv!34631 (array!93909) Bool)

(assert (=> start!117408 (array_inv!34631 a!4094)))

(declare-fun b!1380308 () Bool)

(assert (=> b!1380308 (= e!782024 e!782023)))

(declare-fun res!922056 () Bool)

(assert (=> b!1380308 (=> (not res!922056) (not e!782023))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1380308 (= res!922056 (= (arrayCountValidKeys!0 (array!93910 (store (arr!45350 a!4094) i!1451 k!2953) (size!45901 a!4094)) from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub lt!607524 #b00000000000000000000000000000001)))))

(assert (=> b!1380308 (= lt!607524 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1380309 () Bool)

(declare-fun res!922051 () Bool)

(assert (=> b!1380309 (=> (not res!922051) (not e!782024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380309 (= res!922051 (validKeyInArray!0 (select (arr!45350 a!4094) i!1451)))))

(declare-fun b!1380310 () Bool)

(declare-fun res!922055 () Bool)

(assert (=> b!1380310 (=> (not res!922055) (not e!782024))))

(assert (=> b!1380310 (= res!922055 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1380311 () Bool)

(declare-fun res!922053 () Bool)

(assert (=> b!1380311 (=> (not res!922053) (not e!782023))))

(assert (=> b!1380311 (= res!922053 (bvsgt from!3466 #b00000000000000000000000000000000))))

(assert (= (and start!117408 res!922054) b!1380309))

(assert (= (and b!1380309 res!922051) b!1380310))

(assert (= (and b!1380310 res!922055) b!1380307))

(assert (= (and b!1380307 res!922052) b!1380308))

(assert (= (and b!1380308 res!922056) b!1380311))

(assert (= (and b!1380311 res!922053) b!1380306))

(declare-fun m!1265463 () Bool)

(assert (=> b!1380310 m!1265463))

(declare-fun m!1265465 () Bool)

(assert (=> start!117408 m!1265465))

(declare-fun m!1265467 () Bool)

(assert (=> b!1380308 m!1265467))

(declare-fun m!1265469 () Bool)

(assert (=> b!1380308 m!1265469))

(declare-fun m!1265471 () Bool)

(assert (=> b!1380308 m!1265471))

(declare-fun m!1265473 () Bool)

(assert (=> b!1380309 m!1265473))

(assert (=> b!1380309 m!1265473))

(declare-fun m!1265475 () Bool)

(assert (=> b!1380309 m!1265475))

(declare-fun m!1265477 () Bool)

(assert (=> b!1380306 m!1265477))

(declare-fun m!1265479 () Bool)

(assert (=> b!1380306 m!1265479))

(declare-fun m!1265481 () Bool)

(assert (=> b!1380306 m!1265481))

(push 1)

(assert (not b!1380308))

(assert (not b!1380310))

(assert (not start!117408))

(assert (not b!1380306))

(assert (not b!1380309))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

