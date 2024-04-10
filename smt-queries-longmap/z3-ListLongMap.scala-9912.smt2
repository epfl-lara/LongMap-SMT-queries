; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117242 () Bool)

(assert start!117242)

(declare-fun b!1379411 () Bool)

(declare-fun res!921849 () Bool)

(declare-fun e!781411 () Bool)

(assert (=> b!1379411 (=> (not res!921849) (not e!781411))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379411 (= res!921849 (not (validKeyInArray!0 k0!2953)))))

(declare-fun res!921853 () Bool)

(assert (=> start!117242 (=> (not res!921853) (not e!781411))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93838 0))(
  ( (array!93839 (arr!45318 (Array (_ BitVec 32) (_ BitVec 64))) (size!45868 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93838)

(assert (=> start!117242 (= res!921853 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45868 a!4094))))))

(assert (=> start!117242 e!781411))

(assert (=> start!117242 true))

(declare-fun array_inv!34346 (array!93838) Bool)

(assert (=> start!117242 (array_inv!34346 a!4094)))

(declare-fun b!1379412 () Bool)

(declare-fun res!921852 () Bool)

(assert (=> b!1379412 (=> (not res!921852) (not e!781411))))

(assert (=> b!1379412 (= res!921852 (validKeyInArray!0 (select (arr!45318 a!4094) i!1451)))))

(declare-fun b!1379413 () Bool)

(declare-fun res!921851 () Bool)

(assert (=> b!1379413 (=> (not res!921851) (not e!781411))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1379413 (= res!921851 (and (bvslt (size!45868 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45868 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379414 () Bool)

(declare-fun e!781412 () Bool)

(assert (=> b!1379414 (= e!781411 e!781412)))

(declare-fun res!921850 () Bool)

(assert (=> b!1379414 (=> (not res!921850) (not e!781412))))

(declare-fun lt!607439 () (_ BitVec 32))

(declare-fun lt!607445 () (_ BitVec 32))

(assert (=> b!1379414 (= res!921850 (and (= lt!607439 (bvsub lt!607445 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!607438 () array!93838)

(declare-fun arrayCountValidKeys!0 (array!93838 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379414 (= lt!607439 (arrayCountValidKeys!0 lt!607438 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379414 (= lt!607445 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379414 (= lt!607438 (array!93839 (store (arr!45318 a!4094) i!1451 k0!2953) (size!45868 a!4094)))))

(declare-fun b!1379415 () Bool)

(declare-fun lt!607444 () (_ BitVec 32))

(declare-fun lt!607442 () (_ BitVec 32))

(assert (=> b!1379415 (= e!781412 (not (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45868 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607444 (bvsub lt!607442 #b00000000000000000000000000000001))) (bvslt (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))))

(declare-fun lt!607441 () (_ BitVec 32))

(assert (=> b!1379415 (= (bvadd lt!607441 lt!607439) lt!607444)))

(assert (=> b!1379415 (= lt!607444 (arrayCountValidKeys!0 lt!607438 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379415 (= lt!607441 (arrayCountValidKeys!0 lt!607438 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45863 0))(
  ( (Unit!45864) )
))
(declare-fun lt!607446 () Unit!45863)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45863)

(assert (=> b!1379415 (= lt!607446 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607438 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607440 () (_ BitVec 32))

(assert (=> b!1379415 (= (bvadd lt!607440 lt!607445) lt!607442)))

(assert (=> b!1379415 (= lt!607442 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379415 (= lt!607440 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607443 () Unit!45863)

(assert (=> b!1379415 (= lt!607443 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117242 res!921853) b!1379412))

(assert (= (and b!1379412 res!921852) b!1379411))

(assert (= (and b!1379411 res!921849) b!1379413))

(assert (= (and b!1379413 res!921851) b!1379414))

(assert (= (and b!1379414 res!921850) b!1379415))

(declare-fun m!1264457 () Bool)

(assert (=> b!1379412 m!1264457))

(assert (=> b!1379412 m!1264457))

(declare-fun m!1264459 () Bool)

(assert (=> b!1379412 m!1264459))

(declare-fun m!1264461 () Bool)

(assert (=> b!1379414 m!1264461))

(declare-fun m!1264463 () Bool)

(assert (=> b!1379414 m!1264463))

(declare-fun m!1264465 () Bool)

(assert (=> b!1379414 m!1264465))

(declare-fun m!1264467 () Bool)

(assert (=> b!1379411 m!1264467))

(declare-fun m!1264469 () Bool)

(assert (=> b!1379415 m!1264469))

(declare-fun m!1264471 () Bool)

(assert (=> b!1379415 m!1264471))

(declare-fun m!1264473 () Bool)

(assert (=> b!1379415 m!1264473))

(declare-fun m!1264475 () Bool)

(assert (=> b!1379415 m!1264475))

(declare-fun m!1264477 () Bool)

(assert (=> b!1379415 m!1264477))

(declare-fun m!1264479 () Bool)

(assert (=> b!1379415 m!1264479))

(declare-fun m!1264481 () Bool)

(assert (=> start!117242 m!1264481))

(check-sat (not b!1379411) (not b!1379415) (not b!1379412) (not b!1379414) (not start!117242))
(check-sat)
