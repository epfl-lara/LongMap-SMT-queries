; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117244 () Bool)

(assert start!117244)

(declare-fun b!1379426 () Bool)

(declare-fun res!921864 () Bool)

(declare-fun e!781421 () Bool)

(assert (=> b!1379426 (=> (not res!921864) (not e!781421))))

(declare-datatypes ((array!93840 0))(
  ( (array!93841 (arr!45319 (Array (_ BitVec 32) (_ BitVec 64))) (size!45869 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93840)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379426 (= res!921864 (validKeyInArray!0 (select (arr!45319 a!4094) i!1451)))))

(declare-fun b!1379427 () Bool)

(declare-fun e!781420 () Bool)

(assert (=> b!1379427 (= e!781421 e!781420)))

(declare-fun res!921868 () Bool)

(assert (=> b!1379427 (=> (not res!921868) (not e!781420))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607469 () (_ BitVec 32))

(declare-fun lt!607466 () (_ BitVec 32))

(assert (=> b!1379427 (= res!921868 (and (= lt!607469 (bvsub lt!607466 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!607465 () array!93840)

(declare-fun arrayCountValidKeys!0 (array!93840 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379427 (= lt!607469 (arrayCountValidKeys!0 lt!607465 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379427 (= lt!607466 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379427 (= lt!607465 (array!93841 (store (arr!45319 a!4094) i!1451 k!2953) (size!45869 a!4094)))))

(declare-fun b!1379428 () Bool)

(declare-fun res!921867 () Bool)

(assert (=> b!1379428 (=> (not res!921867) (not e!781421))))

(assert (=> b!1379428 (= res!921867 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379429 () Bool)

(declare-fun lt!607467 () (_ BitVec 32))

(declare-fun lt!607473 () (_ BitVec 32))

(assert (=> b!1379429 (= e!781420 (not (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45869 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607473 (bvsub lt!607467 #b00000000000000000000000000000001))) (bvslt (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))))

(declare-fun lt!607471 () (_ BitVec 32))

(assert (=> b!1379429 (= (bvadd lt!607471 lt!607469) lt!607473)))

(assert (=> b!1379429 (= lt!607473 (arrayCountValidKeys!0 lt!607465 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379429 (= lt!607471 (arrayCountValidKeys!0 lt!607465 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45865 0))(
  ( (Unit!45866) )
))
(declare-fun lt!607470 () Unit!45865)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45865)

(assert (=> b!1379429 (= lt!607470 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607465 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607472 () (_ BitVec 32))

(assert (=> b!1379429 (= (bvadd lt!607472 lt!607466) lt!607467)))

(assert (=> b!1379429 (= lt!607467 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379429 (= lt!607472 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607468 () Unit!45865)

(assert (=> b!1379429 (= lt!607468 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921866 () Bool)

(assert (=> start!117244 (=> (not res!921866) (not e!781421))))

(assert (=> start!117244 (= res!921866 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45869 a!4094))))))

(assert (=> start!117244 e!781421))

(assert (=> start!117244 true))

(declare-fun array_inv!34347 (array!93840) Bool)

(assert (=> start!117244 (array_inv!34347 a!4094)))

(declare-fun b!1379430 () Bool)

(declare-fun res!921865 () Bool)

(assert (=> b!1379430 (=> (not res!921865) (not e!781421))))

(assert (=> b!1379430 (= res!921865 (and (bvslt (size!45869 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45869 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117244 res!921866) b!1379426))

(assert (= (and b!1379426 res!921864) b!1379428))

(assert (= (and b!1379428 res!921867) b!1379430))

(assert (= (and b!1379430 res!921865) b!1379427))

(assert (= (and b!1379427 res!921868) b!1379429))

(declare-fun m!1264483 () Bool)

(assert (=> b!1379428 m!1264483))

(declare-fun m!1264485 () Bool)

(assert (=> b!1379429 m!1264485))

(declare-fun m!1264487 () Bool)

(assert (=> b!1379429 m!1264487))

(declare-fun m!1264489 () Bool)

(assert (=> b!1379429 m!1264489))

(declare-fun m!1264491 () Bool)

(assert (=> b!1379429 m!1264491))

(declare-fun m!1264493 () Bool)

(assert (=> b!1379429 m!1264493))

(declare-fun m!1264495 () Bool)

(assert (=> b!1379429 m!1264495))

(declare-fun m!1264497 () Bool)

(assert (=> b!1379426 m!1264497))

(assert (=> b!1379426 m!1264497))

(declare-fun m!1264499 () Bool)

(assert (=> b!1379426 m!1264499))

(declare-fun m!1264501 () Bool)

(assert (=> b!1379427 m!1264501))

(declare-fun m!1264503 () Bool)

(assert (=> b!1379427 m!1264503))

(declare-fun m!1264505 () Bool)

(assert (=> b!1379427 m!1264505))

(declare-fun m!1264507 () Bool)

(assert (=> start!117244 m!1264507))

(push 1)

(assert (not start!117244))

(assert (not b!1379428))

(assert (not b!1379427))

(assert (not b!1379426))

(assert (not b!1379429))

(check-sat)

(pop 1)

(push 1)

(check-sat)

