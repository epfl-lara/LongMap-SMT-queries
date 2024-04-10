; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116712 () Bool)

(assert start!116712)

(declare-fun b!1375521 () Bool)

(declare-datatypes ((Unit!45553 0))(
  ( (Unit!45554) )
))
(declare-fun e!779224 () Unit!45553)

(declare-fun lt!604470 () Unit!45553)

(assert (=> b!1375521 (= e!779224 lt!604470)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93381 0))(
  ( (array!93382 (arr!45094 (Array (_ BitVec 32) (_ BitVec 64))) (size!45644 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93381)

(declare-fun lt!604468 () Unit!45553)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93381 (_ BitVec 32) (_ BitVec 32)) Unit!45553)

(assert (=> b!1375521 (= lt!604468 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65689 () (_ BitVec 32))

(declare-fun lt!604472 () (_ BitVec 32))

(assert (=> b!1375521 (= call!65689 lt!604472)))

(declare-fun lt!604469 () array!93381)

(assert (=> b!1375521 (= lt!604470 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604469 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65690 () (_ BitVec 32))

(declare-fun lt!604473 () (_ BitVec 32))

(assert (=> b!1375521 (= call!65690 lt!604473)))

(declare-fun b!1375522 () Bool)

(declare-fun e!779227 () Bool)

(declare-fun e!779223 () Bool)

(assert (=> b!1375522 (= e!779227 e!779223)))

(declare-fun res!918573 () Bool)

(assert (=> b!1375522 (=> (not res!918573) (not e!779223))))

(assert (=> b!1375522 (= res!918573 (and (= lt!604473 lt!604472) (not (= to!206 (size!45644 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93381 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375522 (= lt!604472 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375522 (= lt!604473 (arrayCountValidKeys!0 lt!604469 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375522 (= lt!604469 (array!93382 (store (arr!45094 a!4032) i!1445 k!2947) (size!45644 a!4032)))))

(declare-fun b!1375523 () Bool)

(declare-fun lt!604467 () Unit!45553)

(assert (=> b!1375523 (= e!779224 lt!604467)))

(declare-fun lt!604465 () Unit!45553)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93381 (_ BitVec 32) (_ BitVec 32)) Unit!45553)

(assert (=> b!1375523 (= lt!604465 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375523 (= call!65689 (bvadd #b00000000000000000000000000000001 lt!604472))))

(assert (=> b!1375523 (= lt!604467 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604469 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375523 (= call!65690 (bvadd #b00000000000000000000000000000001 lt!604473))))

(declare-fun b!1375524 () Bool)

(declare-fun e!779225 () Bool)

(assert (=> b!1375524 (= e!779223 e!779225)))

(declare-fun res!918572 () Bool)

(assert (=> b!1375524 (=> (not res!918572) (not e!779225))))

(assert (=> b!1375524 (= res!918572 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45644 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604471 () Unit!45553)

(assert (=> b!1375524 (= lt!604471 e!779224)))

(declare-fun c!127916 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375524 (= c!127916 (validKeyInArray!0 (select (arr!45094 a!4032) to!206)))))

(declare-fun b!1375525 () Bool)

(declare-fun res!918570 () Bool)

(assert (=> b!1375525 (=> (not res!918570) (not e!779227))))

(assert (=> b!1375525 (= res!918570 (and (bvslt (size!45644 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45644 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375527 () Bool)

(declare-fun res!918571 () Bool)

(assert (=> b!1375527 (=> (not res!918571) (not e!779227))))

(assert (=> b!1375527 (= res!918571 (not (validKeyInArray!0 k!2947)))))

(declare-fun bm!65686 () Bool)

(assert (=> bm!65686 (= call!65690 (arrayCountValidKeys!0 lt!604469 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65687 () Bool)

(assert (=> bm!65687 (= call!65689 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375528 () Bool)

(declare-fun res!918574 () Bool)

(assert (=> b!1375528 (=> (not res!918574) (not e!779227))))

(assert (=> b!1375528 (= res!918574 (validKeyInArray!0 (select (arr!45094 a!4032) i!1445)))))

(declare-fun b!1375526 () Bool)

(assert (=> b!1375526 (= e!779225 false)))

(declare-fun lt!604466 () (_ BitVec 32))

(assert (=> b!1375526 (= lt!604466 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604474 () (_ BitVec 32))

(assert (=> b!1375526 (= lt!604474 (arrayCountValidKeys!0 lt!604469 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!918569 () Bool)

(assert (=> start!116712 (=> (not res!918569) (not e!779227))))

(assert (=> start!116712 (= res!918569 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45644 a!4032))))))

(assert (=> start!116712 e!779227))

(assert (=> start!116712 true))

(declare-fun array_inv!34122 (array!93381) Bool)

(assert (=> start!116712 (array_inv!34122 a!4032)))

(assert (= (and start!116712 res!918569) b!1375528))

(assert (= (and b!1375528 res!918574) b!1375527))

(assert (= (and b!1375527 res!918571) b!1375525))

(assert (= (and b!1375525 res!918570) b!1375522))

(assert (= (and b!1375522 res!918573) b!1375524))

(assert (= (and b!1375524 c!127916) b!1375523))

(assert (= (and b!1375524 (not c!127916)) b!1375521))

(assert (= (or b!1375523 b!1375521) bm!65687))

(assert (= (or b!1375523 b!1375521) bm!65686))

(assert (= (and b!1375524 res!918572) b!1375526))

(declare-fun m!1259371 () Bool)

(assert (=> b!1375524 m!1259371))

(assert (=> b!1375524 m!1259371))

(declare-fun m!1259373 () Bool)

(assert (=> b!1375524 m!1259373))

(declare-fun m!1259375 () Bool)

(assert (=> b!1375523 m!1259375))

(declare-fun m!1259377 () Bool)

(assert (=> b!1375523 m!1259377))

(declare-fun m!1259379 () Bool)

(assert (=> bm!65687 m!1259379))

(declare-fun m!1259381 () Bool)

(assert (=> bm!65686 m!1259381))

(declare-fun m!1259383 () Bool)

(assert (=> b!1375528 m!1259383))

(assert (=> b!1375528 m!1259383))

(declare-fun m!1259385 () Bool)

(assert (=> b!1375528 m!1259385))

(assert (=> b!1375526 m!1259379))

(assert (=> b!1375526 m!1259381))

(declare-fun m!1259387 () Bool)

(assert (=> b!1375527 m!1259387))

(declare-fun m!1259389 () Bool)

(assert (=> b!1375522 m!1259389))

(declare-fun m!1259391 () Bool)

(assert (=> b!1375522 m!1259391))

(declare-fun m!1259393 () Bool)

(assert (=> b!1375522 m!1259393))

(declare-fun m!1259395 () Bool)

(assert (=> start!116712 m!1259395))

(declare-fun m!1259397 () Bool)

(assert (=> b!1375521 m!1259397))

(declare-fun m!1259399 () Bool)

(assert (=> b!1375521 m!1259399))

(push 1)

