; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116968 () Bool)

(assert start!116968)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93523 0))(
  ( (array!93524 (arr!45160 (Array (_ BitVec 32) (_ BitVec 64))) (size!45711 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93523)

(declare-fun bm!65832 () Bool)

(declare-fun call!65836 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93523 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65832 (= call!65836 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377147 () Bool)

(declare-datatypes ((Unit!45518 0))(
  ( (Unit!45519) )
))
(declare-fun e!780273 () Unit!45518)

(declare-fun lt!605342 () Unit!45518)

(assert (=> b!1377147 (= e!780273 lt!605342)))

(declare-fun lt!605344 () Unit!45518)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93523 (_ BitVec 32) (_ BitVec 32)) Unit!45518)

(assert (=> b!1377147 (= lt!605344 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605337 () (_ BitVec 32))

(assert (=> b!1377147 (= call!65836 lt!605337)))

(declare-fun lt!605339 () array!93523)

(assert (=> b!1377147 (= lt!605342 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605339 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65835 () (_ BitVec 32))

(declare-fun lt!605343 () (_ BitVec 32))

(assert (=> b!1377147 (= call!65835 lt!605343)))

(declare-fun b!1377148 () Bool)

(declare-fun res!919324 () Bool)

(declare-fun e!780271 () Bool)

(assert (=> b!1377148 (=> (not res!919324) (not e!780271))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377148 (= res!919324 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377149 () Bool)

(declare-fun res!919325 () Bool)

(assert (=> b!1377149 (=> (not res!919325) (not e!780271))))

(assert (=> b!1377149 (= res!919325 (validKeyInArray!0 (select (arr!45160 a!4032) i!1445)))))

(declare-fun b!1377150 () Bool)

(declare-fun e!780272 () Bool)

(assert (=> b!1377150 (= e!780271 e!780272)))

(declare-fun res!919327 () Bool)

(assert (=> b!1377150 (=> (not res!919327) (not e!780272))))

(assert (=> b!1377150 (= res!919327 (and (= lt!605343 lt!605337) (not (= to!206 (size!45711 a!4032)))))))

(assert (=> b!1377150 (= lt!605337 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377150 (= lt!605343 (arrayCountValidKeys!0 lt!605339 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377150 (= lt!605339 (array!93524 (store (arr!45160 a!4032) i!1445 k0!2947) (size!45711 a!4032)))))

(declare-fun b!1377151 () Bool)

(declare-fun e!780274 () Bool)

(assert (=> b!1377151 (= e!780272 e!780274)))

(declare-fun res!919328 () Bool)

(assert (=> b!1377151 (=> (not res!919328) (not e!780274))))

(assert (=> b!1377151 (= res!919328 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45711 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605346 () Unit!45518)

(assert (=> b!1377151 (= lt!605346 e!780273)))

(declare-fun c!128359 () Bool)

(assert (=> b!1377151 (= c!128359 (validKeyInArray!0 (select (arr!45160 a!4032) to!206)))))

(declare-fun b!1377152 () Bool)

(declare-fun lt!605341 () Unit!45518)

(assert (=> b!1377152 (= e!780273 lt!605341)))

(declare-fun lt!605340 () Unit!45518)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93523 (_ BitVec 32) (_ BitVec 32)) Unit!45518)

(assert (=> b!1377152 (= lt!605340 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377152 (= call!65836 (bvadd #b00000000000000000000000000000001 lt!605337))))

(assert (=> b!1377152 (= lt!605341 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605339 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377152 (= call!65835 (bvadd #b00000000000000000000000000000001 lt!605343))))

(declare-fun b!1377153 () Bool)

(assert (=> b!1377153 (= e!780274 false)))

(declare-fun lt!605338 () (_ BitVec 32))

(assert (=> b!1377153 (= lt!605338 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!605345 () (_ BitVec 32))

(assert (=> b!1377153 (= lt!605345 (arrayCountValidKeys!0 lt!605339 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!919329 () Bool)

(assert (=> start!116968 (=> (not res!919329) (not e!780271))))

(assert (=> start!116968 (= res!919329 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45711 a!4032))))))

(assert (=> start!116968 e!780271))

(assert (=> start!116968 true))

(declare-fun array_inv!34441 (array!93523) Bool)

(assert (=> start!116968 (array_inv!34441 a!4032)))

(declare-fun bm!65833 () Bool)

(assert (=> bm!65833 (= call!65835 (arrayCountValidKeys!0 lt!605339 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377154 () Bool)

(declare-fun res!919326 () Bool)

(assert (=> b!1377154 (=> (not res!919326) (not e!780271))))

(assert (=> b!1377154 (= res!919326 (and (bvslt (size!45711 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45711 a!4032)) (bvsgt to!206 i!1445)))))

(assert (= (and start!116968 res!919329) b!1377149))

(assert (= (and b!1377149 res!919325) b!1377148))

(assert (= (and b!1377148 res!919324) b!1377154))

(assert (= (and b!1377154 res!919326) b!1377150))

(assert (= (and b!1377150 res!919327) b!1377151))

(assert (= (and b!1377151 c!128359) b!1377152))

(assert (= (and b!1377151 (not c!128359)) b!1377147))

(assert (= (or b!1377152 b!1377147) bm!65833))

(assert (= (or b!1377152 b!1377147) bm!65832))

(assert (= (and b!1377151 res!919328) b!1377153))

(declare-fun m!1261389 () Bool)

(assert (=> b!1377149 m!1261389))

(assert (=> b!1377149 m!1261389))

(declare-fun m!1261391 () Bool)

(assert (=> b!1377149 m!1261391))

(declare-fun m!1261393 () Bool)

(assert (=> bm!65833 m!1261393))

(declare-fun m!1261395 () Bool)

(assert (=> start!116968 m!1261395))

(declare-fun m!1261397 () Bool)

(assert (=> bm!65832 m!1261397))

(declare-fun m!1261399 () Bool)

(assert (=> b!1377150 m!1261399))

(declare-fun m!1261401 () Bool)

(assert (=> b!1377150 m!1261401))

(declare-fun m!1261403 () Bool)

(assert (=> b!1377150 m!1261403))

(declare-fun m!1261405 () Bool)

(assert (=> b!1377148 m!1261405))

(declare-fun m!1261407 () Bool)

(assert (=> b!1377151 m!1261407))

(assert (=> b!1377151 m!1261407))

(declare-fun m!1261409 () Bool)

(assert (=> b!1377151 m!1261409))

(declare-fun m!1261411 () Bool)

(assert (=> b!1377147 m!1261411))

(declare-fun m!1261413 () Bool)

(assert (=> b!1377147 m!1261413))

(declare-fun m!1261415 () Bool)

(assert (=> b!1377152 m!1261415))

(declare-fun m!1261417 () Bool)

(assert (=> b!1377152 m!1261417))

(assert (=> b!1377153 m!1261397))

(assert (=> b!1377153 m!1261393))

(check-sat (not b!1377148) (not b!1377151) (not start!116968) (not b!1377152) (not bm!65832) (not b!1377153) (not bm!65833) (not b!1377150) (not b!1377147) (not b!1377149))
(check-sat)
