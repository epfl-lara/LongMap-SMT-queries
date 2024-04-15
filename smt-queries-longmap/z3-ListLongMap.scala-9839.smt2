; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116716 () Bool)

(assert start!116716)

(declare-fun res!918616 () Bool)

(declare-fun e!779258 () Bool)

(assert (=> start!116716 (=> (not res!918616) (not e!779258))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93339 0))(
  ( (array!93340 (arr!45073 (Array (_ BitVec 32) (_ BitVec 64))) (size!45625 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93339)

(assert (=> start!116716 (= res!918616 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45625 a!4032))))))

(assert (=> start!116716 e!779258))

(assert (=> start!116716 true))

(declare-fun array_inv!34306 (array!93339) Bool)

(assert (=> start!116716 (array_inv!34306 a!4032)))

(declare-fun b!1375556 () Bool)

(declare-fun res!918620 () Bool)

(assert (=> b!1375556 (=> (not res!918620) (not e!779258))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375556 (= res!918620 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1375557 () Bool)

(declare-fun res!918618 () Bool)

(assert (=> b!1375557 (=> (not res!918618) (not e!779258))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1375557 (= res!918618 (and (bvslt (size!45625 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45625 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375558 () Bool)

(declare-fun res!918617 () Bool)

(assert (=> b!1375558 (=> (not res!918617) (not e!779258))))

(assert (=> b!1375558 (= res!918617 (validKeyInArray!0 (select (arr!45073 a!4032) i!1445)))))

(declare-fun b!1375559 () Bool)

(declare-datatypes ((Unit!45402 0))(
  ( (Unit!45403) )
))
(declare-fun e!779260 () Unit!45402)

(declare-fun lt!604411 () Unit!45402)

(assert (=> b!1375559 (= e!779260 lt!604411)))

(declare-fun lt!604405 () Unit!45402)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93339 (_ BitVec 32) (_ BitVec 32)) Unit!45402)

(assert (=> b!1375559 (= lt!604405 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65697 () (_ BitVec 32))

(declare-fun lt!604404 () (_ BitVec 32))

(assert (=> b!1375559 (= call!65697 (bvadd #b00000000000000000000000000000001 lt!604404))))

(declare-fun lt!604410 () array!93339)

(assert (=> b!1375559 (= lt!604411 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604410 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65696 () (_ BitVec 32))

(declare-fun lt!604409 () (_ BitVec 32))

(assert (=> b!1375559 (= call!65696 (bvadd #b00000000000000000000000000000001 lt!604409))))

(declare-fun b!1375560 () Bool)

(declare-fun e!779259 () Bool)

(assert (=> b!1375560 (= e!779259 false)))

(declare-fun lt!604406 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93339 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375560 (= lt!604406 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604407 () (_ BitVec 32))

(assert (=> b!1375560 (= lt!604407 (arrayCountValidKeys!0 lt!604410 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375561 () Bool)

(declare-fun e!779256 () Bool)

(assert (=> b!1375561 (= e!779258 e!779256)))

(declare-fun res!918619 () Bool)

(assert (=> b!1375561 (=> (not res!918619) (not e!779256))))

(assert (=> b!1375561 (= res!918619 (and (= lt!604409 lt!604404) (not (= to!206 (size!45625 a!4032)))))))

(assert (=> b!1375561 (= lt!604404 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375561 (= lt!604409 (arrayCountValidKeys!0 lt!604410 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375561 (= lt!604410 (array!93340 (store (arr!45073 a!4032) i!1445 k0!2947) (size!45625 a!4032)))))

(declare-fun b!1375562 () Bool)

(assert (=> b!1375562 (= e!779256 e!779259)))

(declare-fun res!918615 () Bool)

(assert (=> b!1375562 (=> (not res!918615) (not e!779259))))

(assert (=> b!1375562 (= res!918615 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45625 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604408 () Unit!45402)

(assert (=> b!1375562 (= lt!604408 e!779260)))

(declare-fun c!127913 () Bool)

(assert (=> b!1375562 (= c!127913 (validKeyInArray!0 (select (arr!45073 a!4032) to!206)))))

(declare-fun bm!65693 () Bool)

(assert (=> bm!65693 (= call!65696 (arrayCountValidKeys!0 lt!604410 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375563 () Bool)

(declare-fun lt!604412 () Unit!45402)

(assert (=> b!1375563 (= e!779260 lt!604412)))

(declare-fun lt!604403 () Unit!45402)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93339 (_ BitVec 32) (_ BitVec 32)) Unit!45402)

(assert (=> b!1375563 (= lt!604403 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375563 (= call!65697 lt!604404)))

(assert (=> b!1375563 (= lt!604412 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604410 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375563 (= call!65696 lt!604409)))

(declare-fun bm!65694 () Bool)

(assert (=> bm!65694 (= call!65697 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116716 res!918616) b!1375558))

(assert (= (and b!1375558 res!918617) b!1375556))

(assert (= (and b!1375556 res!918620) b!1375557))

(assert (= (and b!1375557 res!918618) b!1375561))

(assert (= (and b!1375561 res!918619) b!1375562))

(assert (= (and b!1375562 c!127913) b!1375559))

(assert (= (and b!1375562 (not c!127913)) b!1375563))

(assert (= (or b!1375559 b!1375563) bm!65694))

(assert (= (or b!1375559 b!1375563) bm!65693))

(assert (= (and b!1375562 res!918615) b!1375560))

(declare-fun m!1258989 () Bool)

(assert (=> b!1375556 m!1258989))

(declare-fun m!1258991 () Bool)

(assert (=> bm!65694 m!1258991))

(declare-fun m!1258993 () Bool)

(assert (=> start!116716 m!1258993))

(declare-fun m!1258995 () Bool)

(assert (=> bm!65693 m!1258995))

(declare-fun m!1258997 () Bool)

(assert (=> b!1375559 m!1258997))

(declare-fun m!1258999 () Bool)

(assert (=> b!1375559 m!1258999))

(declare-fun m!1259001 () Bool)

(assert (=> b!1375563 m!1259001))

(declare-fun m!1259003 () Bool)

(assert (=> b!1375563 m!1259003))

(assert (=> b!1375560 m!1258991))

(assert (=> b!1375560 m!1258995))

(declare-fun m!1259005 () Bool)

(assert (=> b!1375562 m!1259005))

(assert (=> b!1375562 m!1259005))

(declare-fun m!1259007 () Bool)

(assert (=> b!1375562 m!1259007))

(declare-fun m!1259009 () Bool)

(assert (=> b!1375561 m!1259009))

(declare-fun m!1259011 () Bool)

(assert (=> b!1375561 m!1259011))

(declare-fun m!1259013 () Bool)

(assert (=> b!1375561 m!1259013))

(declare-fun m!1259015 () Bool)

(assert (=> b!1375558 m!1259015))

(assert (=> b!1375558 m!1259015))

(declare-fun m!1259017 () Bool)

(assert (=> b!1375558 m!1259017))

(check-sat (not b!1375559) (not bm!65694) (not b!1375560) (not start!116716) (not b!1375558) (not b!1375561) (not bm!65693) (not b!1375563) (not b!1375562) (not b!1375556))
(check-sat)
