; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71954 () Bool)

(assert start!71954)

(declare-fun b!836115 () Bool)

(declare-fun e!466437 () Bool)

(assert (=> b!836115 (= e!466437 (not true))))

(declare-datatypes ((array!46864 0))(
  ( (array!46865 (arr!22466 (Array (_ BitVec 32) (_ BitVec 64))) (size!22887 (_ BitVec 32))) )
))
(declare-fun lt!380360 () array!46864)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun a!4227 () array!46864)

(declare-fun arrayCountValidKeys!0 (array!46864 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!836115 (= (arrayCountValidKeys!0 lt!380360 (bvadd #b00000000000000000000000000000001 i!1466) (size!22887 a!4227)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (size!22887 a!4227)))))

(declare-datatypes ((Unit!28777 0))(
  ( (Unit!28778) )
))
(declare-fun lt!380355 () Unit!28777)

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun to!390 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!46864 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!28777)

(assert (=> b!836115 (= lt!380355 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4227 i!1466 k!2968 (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun res!568844 () Bool)

(declare-fun e!466436 () Bool)

(assert (=> start!71954 (=> (not res!568844) (not e!466436))))

(assert (=> start!71954 (= res!568844 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22887 a!4227))))))

(assert (=> start!71954 e!466436))

(assert (=> start!71954 true))

(declare-fun array_inv!17913 (array!46864) Bool)

(assert (=> start!71954 (array_inv!17913 a!4227)))

(declare-fun b!836116 () Bool)

(declare-fun e!466440 () Bool)

(assert (=> b!836116 (= e!466440 e!466437)))

(declare-fun res!568850 () Bool)

(assert (=> b!836116 (=> (not res!568850) (not e!466437))))

(assert (=> b!836116 (= res!568850 (and (bvsge (bvadd #b00000000000000000000000000000001 to!390) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!390) (size!22887 a!4227)) (bvsgt (bvadd #b00000000000000000000000000000001 to!390) i!1466)))))

(declare-fun lt!380354 () Unit!28777)

(declare-fun e!466439 () Unit!28777)

(assert (=> b!836116 (= lt!380354 e!466439)))

(declare-fun c!91031 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!836116 (= c!91031 (validKeyInArray!0 (select (arr!22466 a!4227) to!390)))))

(declare-fun b!836117 () Bool)

(declare-fun res!568848 () Bool)

(assert (=> b!836117 (=> (not res!568848) (not e!466436))))

(assert (=> b!836117 (= res!568848 (and (bvslt (size!22887 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22887 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun call!36811 () (_ BitVec 32))

(declare-fun bm!36808 () Bool)

(assert (=> bm!36808 (= call!36811 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(declare-fun b!836118 () Bool)

(declare-fun res!568845 () Bool)

(assert (=> b!836118 (=> (not res!568845) (not e!466437))))

(assert (=> b!836118 (= res!568845 (= (arrayCountValidKeys!0 lt!380360 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390))))))

(declare-fun b!836119 () Bool)

(assert (=> b!836119 (= e!466436 e!466440)))

(declare-fun res!568846 () Bool)

(assert (=> b!836119 (=> (not res!568846) (not e!466440))))

(declare-fun lt!380356 () (_ BitVec 32))

(declare-fun lt!380359 () (_ BitVec 32))

(assert (=> b!836119 (= res!568846 (and (= lt!380359 lt!380356) (not (= to!390 (size!22887 a!4227)))))))

(assert (=> b!836119 (= lt!380356 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836119 (= lt!380359 (arrayCountValidKeys!0 lt!380360 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836119 (= lt!380360 (array!46865 (store (arr!22466 a!4227) i!1466 k!2968) (size!22887 a!4227)))))

(declare-fun b!836120 () Bool)

(declare-fun lt!380358 () Unit!28777)

(assert (=> b!836120 (= e!466439 lt!380358)))

(declare-fun lt!380357 () Unit!28777)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!46864 (_ BitVec 32) (_ BitVec 32)) Unit!28777)

(assert (=> b!836120 (= lt!380357 (lemmaValidKeyIncreasesNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836120 (= call!36811 (bvadd #b00000000000000000000000000000001 lt!380356))))

(assert (=> b!836120 (= lt!380358 (lemmaValidKeyIncreasesNumOfKeys!0 lt!380360 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun call!36812 () (_ BitVec 32))

(assert (=> b!836120 (= call!36812 (bvadd #b00000000000000000000000000000001 lt!380359))))

(declare-fun b!836121 () Bool)

(declare-fun res!568849 () Bool)

(assert (=> b!836121 (=> (not res!568849) (not e!466436))))

(assert (=> b!836121 (= res!568849 (validKeyInArray!0 k!2968))))

(declare-fun b!836122 () Bool)

(declare-fun res!568847 () Bool)

(assert (=> b!836122 (=> (not res!568847) (not e!466436))))

(assert (=> b!836122 (= res!568847 (not (validKeyInArray!0 (select (arr!22466 a!4227) i!1466))))))

(declare-fun b!836123 () Bool)

(declare-fun lt!380362 () Unit!28777)

(assert (=> b!836123 (= e!466439 lt!380362)))

(declare-fun lt!380361 () Unit!28777)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!46864 (_ BitVec 32) (_ BitVec 32)) Unit!28777)

(assert (=> b!836123 (= lt!380361 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836123 (= call!36811 lt!380356)))

(assert (=> b!836123 (= lt!380362 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!380360 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(assert (=> b!836123 (= call!36812 lt!380359)))

(declare-fun bm!36809 () Bool)

(assert (=> bm!36809 (= call!36812 (arrayCountValidKeys!0 lt!380360 (bvadd #b00000000000000000000000000000001 i!1466) (bvadd #b00000000000000000000000000000001 to!390)))))

(assert (= (and start!71954 res!568844) b!836122))

(assert (= (and b!836122 res!568847) b!836121))

(assert (= (and b!836121 res!568849) b!836117))

(assert (= (and b!836117 res!568848) b!836119))

(assert (= (and b!836119 res!568846) b!836116))

(assert (= (and b!836116 c!91031) b!836120))

(assert (= (and b!836116 (not c!91031)) b!836123))

(assert (= (or b!836120 b!836123) bm!36809))

(assert (= (or b!836120 b!836123) bm!36808))

(assert (= (and b!836116 res!568850) b!836118))

(assert (= (and b!836118 res!568845) b!836115))

(declare-fun m!781489 () Bool)

(assert (=> b!836116 m!781489))

(assert (=> b!836116 m!781489))

(declare-fun m!781491 () Bool)

(assert (=> b!836116 m!781491))

(declare-fun m!781493 () Bool)

(assert (=> b!836122 m!781493))

(assert (=> b!836122 m!781493))

(declare-fun m!781495 () Bool)

(assert (=> b!836122 m!781495))

(declare-fun m!781497 () Bool)

(assert (=> bm!36808 m!781497))

(declare-fun m!781499 () Bool)

(assert (=> b!836121 m!781499))

(declare-fun m!781501 () Bool)

(assert (=> start!71954 m!781501))

(declare-fun m!781503 () Bool)

(assert (=> b!836119 m!781503))

(declare-fun m!781505 () Bool)

(assert (=> b!836119 m!781505))

(declare-fun m!781507 () Bool)

(assert (=> b!836119 m!781507))

(declare-fun m!781509 () Bool)

(assert (=> b!836115 m!781509))

(declare-fun m!781511 () Bool)

(assert (=> b!836115 m!781511))

(declare-fun m!781513 () Bool)

(assert (=> b!836115 m!781513))

(declare-fun m!781515 () Bool)

(assert (=> b!836120 m!781515))

(declare-fun m!781517 () Bool)

(assert (=> b!836120 m!781517))

(declare-fun m!781519 () Bool)

(assert (=> bm!36809 m!781519))

(declare-fun m!781521 () Bool)

(assert (=> b!836123 m!781521))

(declare-fun m!781523 () Bool)

(assert (=> b!836123 m!781523))

(assert (=> b!836118 m!781519))

(assert (=> b!836118 m!781497))

(push 1)

