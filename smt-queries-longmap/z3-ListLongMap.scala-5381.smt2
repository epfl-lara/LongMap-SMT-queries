; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71886 () Bool)

(assert start!71886)

(declare-fun b!835349 () Bool)

(declare-fun e!466020 () Bool)

(declare-fun e!466023 () Bool)

(assert (=> b!835349 (= e!466020 (not e!466023))))

(declare-fun res!568221 () Bool)

(assert (=> b!835349 (=> (not res!568221) (not e!466023))))

(declare-datatypes ((array!46796 0))(
  ( (array!46797 (arr!22432 (Array (_ BitVec 32) (_ BitVec 64))) (size!22853 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46796)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835349 (= res!568221 (and (bvsge (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvslt to!390 (size!22853 a!4227))))))

(declare-fun lt!379704 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46796 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835349 (= (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (bvadd #b00000000000000000000000000000001 lt!379704))))

(declare-datatypes ((Unit!28715 0))(
  ( (Unit!28716) )
))
(declare-fun lt!379703 () Unit!28715)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46796 (_ BitVec 32) (_ BitVec 32)) Unit!28715)

(assert (=> b!835349 (= lt!379703 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835350 () Bool)

(declare-fun e!466021 () Bool)

(assert (=> b!835350 (= e!466021 e!466020)))

(declare-fun res!568224 () Bool)

(assert (=> b!835350 (=> (not res!568224) (not e!466020))))

(declare-fun lt!379705 () (_ BitVec 32))

(assert (=> b!835350 (= res!568224 (and (= lt!379705 lt!379704) (not (= to!390 (size!22853 a!4227)))))))

(assert (=> b!835350 (= lt!379704 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k0!2968 () (_ BitVec 64))

(assert (=> b!835350 (= lt!379705 (arrayCountValidKeys!0 (array!46797 (store (arr!22432 a!4227) i!1466 k0!2968) (size!22853 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!835352 () Bool)

(declare-fun res!568223 () Bool)

(assert (=> b!835352 (=> (not res!568223) (not e!466020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835352 (= res!568223 (validKeyInArray!0 (select (arr!22432 a!4227) to!390)))))

(declare-fun b!835353 () Bool)

(declare-fun res!568225 () Bool)

(assert (=> b!835353 (=> (not res!568225) (not e!466021))))

(assert (=> b!835353 (= res!568225 (and (bvslt (size!22853 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22853 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835354 () Bool)

(declare-fun res!568222 () Bool)

(assert (=> b!835354 (=> (not res!568222) (not e!466021))))

(assert (=> b!835354 (= res!568222 (not (validKeyInArray!0 (select (arr!22432 a!4227) i!1466))))))

(declare-fun b!835355 () Bool)

(declare-fun res!568226 () Bool)

(assert (=> b!835355 (=> (not res!568226) (not e!466021))))

(assert (=> b!835355 (= res!568226 (validKeyInArray!0 k0!2968))))

(declare-fun res!568220 () Bool)

(assert (=> start!71886 (=> (not res!568220) (not e!466021))))

(assert (=> start!71886 (= res!568220 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22853 a!4227))))))

(assert (=> start!71886 e!466021))

(assert (=> start!71886 true))

(declare-fun array_inv!17879 (array!46796) Bool)

(assert (=> start!71886 (array_inv!17879 a!4227)))

(declare-fun b!835351 () Bool)

(assert (=> b!835351 (= e!466023 (validKeyInArray!0 (select (store (arr!22432 a!4227) i!1466 k0!2968) to!390)))))

(assert (= (and start!71886 res!568220) b!835354))

(assert (= (and b!835354 res!568222) b!835355))

(assert (= (and b!835355 res!568226) b!835353))

(assert (= (and b!835353 res!568225) b!835350))

(assert (= (and b!835350 res!568224) b!835352))

(assert (= (and b!835352 res!568223) b!835349))

(assert (= (and b!835349 res!568221) b!835351))

(declare-fun m!780515 () Bool)

(assert (=> b!835352 m!780515))

(assert (=> b!835352 m!780515))

(declare-fun m!780517 () Bool)

(assert (=> b!835352 m!780517))

(declare-fun m!780519 () Bool)

(assert (=> b!835351 m!780519))

(declare-fun m!780521 () Bool)

(assert (=> b!835351 m!780521))

(assert (=> b!835351 m!780521))

(declare-fun m!780523 () Bool)

(assert (=> b!835351 m!780523))

(declare-fun m!780525 () Bool)

(assert (=> b!835354 m!780525))

(assert (=> b!835354 m!780525))

(declare-fun m!780527 () Bool)

(assert (=> b!835354 m!780527))

(declare-fun m!780529 () Bool)

(assert (=> b!835350 m!780529))

(assert (=> b!835350 m!780519))

(declare-fun m!780531 () Bool)

(assert (=> b!835350 m!780531))

(declare-fun m!780533 () Bool)

(assert (=> b!835355 m!780533))

(declare-fun m!780535 () Bool)

(assert (=> b!835349 m!780535))

(declare-fun m!780537 () Bool)

(assert (=> b!835349 m!780537))

(declare-fun m!780539 () Bool)

(assert (=> start!71886 m!780539))

(check-sat (not b!835351) (not b!835350) (not start!71886) (not b!835352) (not b!835355) (not b!835349) (not b!835354))
(check-sat)
