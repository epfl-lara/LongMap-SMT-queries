; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116720 () Bool)

(assert start!116720)

(declare-fun call!65713 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93389 0))(
  ( (array!93390 (arr!45098 (Array (_ BitVec 32) (_ BitVec 64))) (size!45648 (_ BitVec 32))) )
))
(declare-fun lt!604594 () array!93389)

(declare-fun bm!65710 () Bool)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93389 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65710 (= call!65713 (arrayCountValidKeys!0 lt!604594 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!918641 () Bool)

(declare-fun e!779284 () Bool)

(assert (=> start!116720 (=> (not res!918641) (not e!779284))))

(declare-fun a!4032 () array!93389)

(assert (=> start!116720 (= res!918641 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45648 a!4032))))))

(assert (=> start!116720 e!779284))

(assert (=> start!116720 true))

(declare-fun array_inv!34126 (array!93389) Bool)

(assert (=> start!116720 (array_inv!34126 a!4032)))

(declare-fun b!1375617 () Bool)

(declare-fun res!918642 () Bool)

(assert (=> b!1375617 (=> (not res!918642) (not e!779284))))

(assert (=> b!1375617 (= res!918642 (and (bvslt (size!45648 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45648 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375618 () Bool)

(declare-fun e!779285 () Bool)

(declare-fun e!779287 () Bool)

(assert (=> b!1375618 (= e!779285 e!779287)))

(declare-fun res!918646 () Bool)

(assert (=> b!1375618 (=> (not res!918646) (not e!779287))))

(assert (=> b!1375618 (= res!918646 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45648 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45561 0))(
  ( (Unit!45562) )
))
(declare-fun lt!604590 () Unit!45561)

(declare-fun e!779283 () Unit!45561)

(assert (=> b!1375618 (= lt!604590 e!779283)))

(declare-fun c!127928 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375618 (= c!127928 (validKeyInArray!0 (select (arr!45098 a!4032) to!206)))))

(declare-fun b!1375619 () Bool)

(declare-fun lt!604586 () Unit!45561)

(assert (=> b!1375619 (= e!779283 lt!604586)))

(declare-fun lt!604587 () Unit!45561)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93389 (_ BitVec 32) (_ BitVec 32)) Unit!45561)

(assert (=> b!1375619 (= lt!604587 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65714 () (_ BitVec 32))

(declare-fun lt!604592 () (_ BitVec 32))

(assert (=> b!1375619 (= call!65714 (bvadd #b00000000000000000000000000000001 lt!604592))))

(assert (=> b!1375619 (= lt!604586 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604594 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604585 () (_ BitVec 32))

(assert (=> b!1375619 (= call!65713 (bvadd #b00000000000000000000000000000001 lt!604585))))

(declare-fun b!1375620 () Bool)

(assert (=> b!1375620 (= e!779284 e!779285)))

(declare-fun res!918644 () Bool)

(assert (=> b!1375620 (=> (not res!918644) (not e!779285))))

(assert (=> b!1375620 (= res!918644 (and (= lt!604585 lt!604592) (not (= to!206 (size!45648 a!4032)))))))

(assert (=> b!1375620 (= lt!604592 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375620 (= lt!604585 (arrayCountValidKeys!0 lt!604594 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1375620 (= lt!604594 (array!93390 (store (arr!45098 a!4032) i!1445 k!2947) (size!45648 a!4032)))))

(declare-fun bm!65711 () Bool)

(assert (=> bm!65711 (= call!65714 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375621 () Bool)

(assert (=> b!1375621 (= e!779287 false)))

(declare-fun lt!604589 () (_ BitVec 32))

(assert (=> b!1375621 (= lt!604589 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604588 () (_ BitVec 32))

(assert (=> b!1375621 (= lt!604588 (arrayCountValidKeys!0 lt!604594 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375622 () Bool)

(declare-fun res!918643 () Bool)

(assert (=> b!1375622 (=> (not res!918643) (not e!779284))))

(assert (=> b!1375622 (= res!918643 (validKeyInArray!0 (select (arr!45098 a!4032) i!1445)))))

(declare-fun b!1375623 () Bool)

(declare-fun lt!604591 () Unit!45561)

(assert (=> b!1375623 (= e!779283 lt!604591)))

(declare-fun lt!604593 () Unit!45561)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93389 (_ BitVec 32) (_ BitVec 32)) Unit!45561)

(assert (=> b!1375623 (= lt!604593 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375623 (= call!65714 lt!604592)))

(assert (=> b!1375623 (= lt!604591 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604594 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375623 (= call!65713 lt!604585)))

(declare-fun b!1375624 () Bool)

(declare-fun res!918645 () Bool)

(assert (=> b!1375624 (=> (not res!918645) (not e!779284))))

(assert (=> b!1375624 (= res!918645 (not (validKeyInArray!0 k!2947)))))

(assert (= (and start!116720 res!918641) b!1375622))

(assert (= (and b!1375622 res!918643) b!1375624))

(assert (= (and b!1375624 res!918645) b!1375617))

(assert (= (and b!1375617 res!918642) b!1375620))

(assert (= (and b!1375620 res!918644) b!1375618))

(assert (= (and b!1375618 c!127928) b!1375619))

(assert (= (and b!1375618 (not c!127928)) b!1375623))

(assert (= (or b!1375619 b!1375623) bm!65711))

(assert (= (or b!1375619 b!1375623) bm!65710))

(assert (= (and b!1375618 res!918646) b!1375621))

(declare-fun m!1259491 () Bool)

(assert (=> bm!65711 m!1259491))

(declare-fun m!1259493 () Bool)

(assert (=> start!116720 m!1259493))

(assert (=> b!1375621 m!1259491))

(declare-fun m!1259495 () Bool)

(assert (=> b!1375621 m!1259495))

(declare-fun m!1259497 () Bool)

(assert (=> b!1375622 m!1259497))

(assert (=> b!1375622 m!1259497))

(declare-fun m!1259499 () Bool)

(assert (=> b!1375622 m!1259499))

(declare-fun m!1259501 () Bool)

(assert (=> b!1375624 m!1259501))

(assert (=> bm!65710 m!1259495))

(declare-fun m!1259503 () Bool)

(assert (=> b!1375620 m!1259503))

(declare-fun m!1259505 () Bool)

(assert (=> b!1375620 m!1259505))

(declare-fun m!1259507 () Bool)

(assert (=> b!1375620 m!1259507))

(declare-fun m!1259509 () Bool)

(assert (=> b!1375619 m!1259509))

(declare-fun m!1259511 () Bool)

(assert (=> b!1375619 m!1259511))

(declare-fun m!1259513 () Bool)

(assert (=> b!1375623 m!1259513))

(declare-fun m!1259515 () Bool)

(assert (=> b!1375623 m!1259515))

(declare-fun m!1259517 () Bool)

(assert (=> b!1375618 m!1259517))

(assert (=> b!1375618 m!1259517))

(declare-fun m!1259519 () Bool)

(assert (=> b!1375618 m!1259519))

(push 1)

(assert (not bm!65711))

(assert (not b!1375622))

(assert (not b!1375620))

(assert (not b!1375618))

(assert (not b!1375623))

(assert (not start!116720))

(assert (not b!1375624))

(assert (not bm!65710))

(assert (not b!1375619))

(assert (not b!1375621))

