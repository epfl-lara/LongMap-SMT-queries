; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116722 () Bool)

(assert start!116722)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun call!65719 () (_ BitVec 32))

(declare-datatypes ((array!93391 0))(
  ( (array!93392 (arr!45099 (Array (_ BitVec 32) (_ BitVec 64))) (size!45649 (_ BitVec 32))) )
))
(declare-fun lt!604624 () array!93391)

(declare-fun bm!65716 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93391 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65716 (= call!65719 (arrayCountValidKeys!0 lt!604624 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375641 () Bool)

(declare-datatypes ((Unit!45563 0))(
  ( (Unit!45564) )
))
(declare-fun e!779301 () Unit!45563)

(declare-fun lt!604619 () Unit!45563)

(assert (=> b!1375641 (= e!779301 lt!604619)))

(declare-fun a!4032 () array!93391)

(declare-fun lt!604620 () Unit!45563)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93391 (_ BitVec 32) (_ BitVec 32)) Unit!45563)

(assert (=> b!1375641 (= lt!604620 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65720 () (_ BitVec 32))

(declare-fun lt!604621 () (_ BitVec 32))

(assert (=> b!1375641 (= call!65720 lt!604621)))

(assert (=> b!1375641 (= lt!604619 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604624 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604618 () (_ BitVec 32))

(assert (=> b!1375641 (= call!65719 lt!604618)))

(declare-fun b!1375642 () Bool)

(declare-fun res!918662 () Bool)

(declare-fun e!779299 () Bool)

(assert (=> b!1375642 (=> (not res!918662) (not e!779299))))

(assert (=> b!1375642 (= res!918662 (and (bvslt (size!45649 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45649 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!918660 () Bool)

(assert (=> start!116722 (=> (not res!918660) (not e!779299))))

(assert (=> start!116722 (= res!918660 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45649 a!4032))))))

(assert (=> start!116722 e!779299))

(assert (=> start!116722 true))

(declare-fun array_inv!34127 (array!93391) Bool)

(assert (=> start!116722 (array_inv!34127 a!4032)))

(declare-fun bm!65717 () Bool)

(assert (=> bm!65717 (= call!65720 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375643 () Bool)

(declare-fun e!779302 () Bool)

(assert (=> b!1375643 (= e!779302 false)))

(declare-fun lt!604617 () (_ BitVec 32))

(assert (=> b!1375643 (= lt!604617 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604622 () (_ BitVec 32))

(assert (=> b!1375643 (= lt!604622 (arrayCountValidKeys!0 lt!604624 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375644 () Bool)

(declare-fun e!779300 () Bool)

(assert (=> b!1375644 (= e!779300 e!779302)))

(declare-fun res!918659 () Bool)

(assert (=> b!1375644 (=> (not res!918659) (not e!779302))))

(assert (=> b!1375644 (= res!918659 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45649 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604623 () Unit!45563)

(assert (=> b!1375644 (= lt!604623 e!779301)))

(declare-fun c!127931 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375644 (= c!127931 (validKeyInArray!0 (select (arr!45099 a!4032) to!206)))))

(declare-fun b!1375645 () Bool)

(declare-fun lt!604615 () Unit!45563)

(assert (=> b!1375645 (= e!779301 lt!604615)))

(declare-fun lt!604616 () Unit!45563)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93391 (_ BitVec 32) (_ BitVec 32)) Unit!45563)

(assert (=> b!1375645 (= lt!604616 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375645 (= call!65720 (bvadd #b00000000000000000000000000000001 lt!604621))))

(assert (=> b!1375645 (= lt!604615 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604624 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375645 (= call!65719 (bvadd #b00000000000000000000000000000001 lt!604618))))

(declare-fun b!1375646 () Bool)

(declare-fun res!918663 () Bool)

(assert (=> b!1375646 (=> (not res!918663) (not e!779299))))

(assert (=> b!1375646 (= res!918663 (validKeyInArray!0 (select (arr!45099 a!4032) i!1445)))))

(declare-fun b!1375647 () Bool)

(assert (=> b!1375647 (= e!779299 e!779300)))

(declare-fun res!918661 () Bool)

(assert (=> b!1375647 (=> (not res!918661) (not e!779300))))

(assert (=> b!1375647 (= res!918661 (and (= lt!604618 lt!604621) (not (= to!206 (size!45649 a!4032)))))))

(assert (=> b!1375647 (= lt!604621 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375647 (= lt!604618 (arrayCountValidKeys!0 lt!604624 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375647 (= lt!604624 (array!93392 (store (arr!45099 a!4032) i!1445 k0!2947) (size!45649 a!4032)))))

(declare-fun b!1375648 () Bool)

(declare-fun res!918664 () Bool)

(assert (=> b!1375648 (=> (not res!918664) (not e!779299))))

(assert (=> b!1375648 (= res!918664 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!116722 res!918660) b!1375646))

(assert (= (and b!1375646 res!918663) b!1375648))

(assert (= (and b!1375648 res!918664) b!1375642))

(assert (= (and b!1375642 res!918662) b!1375647))

(assert (= (and b!1375647 res!918661) b!1375644))

(assert (= (and b!1375644 c!127931) b!1375645))

(assert (= (and b!1375644 (not c!127931)) b!1375641))

(assert (= (or b!1375645 b!1375641) bm!65716))

(assert (= (or b!1375645 b!1375641) bm!65717))

(assert (= (and b!1375644 res!918659) b!1375643))

(declare-fun m!1259521 () Bool)

(assert (=> b!1375646 m!1259521))

(assert (=> b!1375646 m!1259521))

(declare-fun m!1259523 () Bool)

(assert (=> b!1375646 m!1259523))

(declare-fun m!1259525 () Bool)

(assert (=> b!1375645 m!1259525))

(declare-fun m!1259527 () Bool)

(assert (=> b!1375645 m!1259527))

(declare-fun m!1259529 () Bool)

(assert (=> b!1375641 m!1259529))

(declare-fun m!1259531 () Bool)

(assert (=> b!1375641 m!1259531))

(declare-fun m!1259533 () Bool)

(assert (=> b!1375643 m!1259533))

(declare-fun m!1259535 () Bool)

(assert (=> b!1375643 m!1259535))

(declare-fun m!1259537 () Bool)

(assert (=> start!116722 m!1259537))

(declare-fun m!1259539 () Bool)

(assert (=> b!1375644 m!1259539))

(assert (=> b!1375644 m!1259539))

(declare-fun m!1259541 () Bool)

(assert (=> b!1375644 m!1259541))

(declare-fun m!1259543 () Bool)

(assert (=> b!1375647 m!1259543))

(declare-fun m!1259545 () Bool)

(assert (=> b!1375647 m!1259545))

(declare-fun m!1259547 () Bool)

(assert (=> b!1375647 m!1259547))

(assert (=> bm!65716 m!1259535))

(assert (=> bm!65717 m!1259533))

(declare-fun m!1259549 () Bool)

(assert (=> b!1375648 m!1259549))

(check-sat (not b!1375641) (not b!1375648) (not b!1375646) (not b!1375645) (not bm!65716) (not bm!65717) (not b!1375647) (not b!1375644) (not start!116722) (not b!1375643))
