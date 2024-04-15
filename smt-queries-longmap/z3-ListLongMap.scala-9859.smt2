; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116836 () Bool)

(assert start!116836)

(declare-fun b!1376778 () Bool)

(declare-fun e!779887 () Bool)

(assert (=> b!1376778 (= e!779887 false)))

(declare-datatypes ((Unit!45474 0))(
  ( (Unit!45475) )
))
(declare-fun lt!605230 () Unit!45474)

(declare-fun e!779886 () Unit!45474)

(assert (=> b!1376778 (= lt!605230 e!779886)))

(declare-fun c!127985 () Bool)

(declare-datatypes ((array!93459 0))(
  ( (array!93460 (arr!45133 (Array (_ BitVec 32) (_ BitVec 64))) (size!45685 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93459)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376778 (= c!127985 (validKeyInArray!0 (select (arr!45133 a!4032) to!206)))))

(declare-fun b!1376779 () Bool)

(declare-fun res!919695 () Bool)

(declare-fun e!779885 () Bool)

(assert (=> b!1376779 (=> (not res!919695) (not e!779885))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376779 (= res!919695 (not (validKeyInArray!0 k0!2947)))))

(declare-fun call!65841 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun bm!65837 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93459 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65837 (= call!65841 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!605228 () array!93459)

(declare-fun bm!65838 () Bool)

(declare-fun call!65840 () (_ BitVec 32))

(assert (=> bm!65838 (= call!65840 (arrayCountValidKeys!0 lt!605228 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376781 () Bool)

(declare-fun lt!605233 () Unit!45474)

(assert (=> b!1376781 (= e!779886 lt!605233)))

(declare-fun lt!605229 () Unit!45474)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93459 (_ BitVec 32) (_ BitVec 32)) Unit!45474)

(assert (=> b!1376781 (= lt!605229 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605234 () (_ BitVec 32))

(assert (=> b!1376781 (= call!65841 lt!605234)))

(assert (=> b!1376781 (= lt!605233 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605228 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605231 () (_ BitVec 32))

(assert (=> b!1376781 (= call!65840 lt!605231)))

(declare-fun b!1376782 () Bool)

(declare-fun res!919696 () Bool)

(assert (=> b!1376782 (=> (not res!919696) (not e!779885))))

(assert (=> b!1376782 (= res!919696 (and (bvslt (size!45685 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45685 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376783 () Bool)

(declare-fun res!919697 () Bool)

(assert (=> b!1376783 (=> (not res!919697) (not e!779885))))

(assert (=> b!1376783 (= res!919697 (validKeyInArray!0 (select (arr!45133 a!4032) i!1445)))))

(declare-fun b!1376784 () Bool)

(assert (=> b!1376784 (= e!779885 e!779887)))

(declare-fun res!919693 () Bool)

(assert (=> b!1376784 (=> (not res!919693) (not e!779887))))

(assert (=> b!1376784 (= res!919693 (and (= lt!605231 lt!605234) (not (= to!206 (size!45685 a!4032)))))))

(assert (=> b!1376784 (= lt!605234 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376784 (= lt!605231 (arrayCountValidKeys!0 lt!605228 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376784 (= lt!605228 (array!93460 (store (arr!45133 a!4032) i!1445 k0!2947) (size!45685 a!4032)))))

(declare-fun res!919694 () Bool)

(assert (=> start!116836 (=> (not res!919694) (not e!779885))))

(assert (=> start!116836 (= res!919694 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45685 a!4032))))))

(assert (=> start!116836 e!779885))

(assert (=> start!116836 true))

(declare-fun array_inv!34366 (array!93459) Bool)

(assert (=> start!116836 (array_inv!34366 a!4032)))

(declare-fun b!1376780 () Bool)

(declare-fun lt!605232 () Unit!45474)

(assert (=> b!1376780 (= e!779886 lt!605232)))

(declare-fun lt!605227 () Unit!45474)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93459 (_ BitVec 32) (_ BitVec 32)) Unit!45474)

(assert (=> b!1376780 (= lt!605227 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376780 (= call!65841 (bvadd #b00000000000000000000000000000001 lt!605234))))

(assert (=> b!1376780 (= lt!605232 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605228 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376780 (= call!65840 (bvadd #b00000000000000000000000000000001 lt!605231))))

(assert (= (and start!116836 res!919694) b!1376783))

(assert (= (and b!1376783 res!919697) b!1376779))

(assert (= (and b!1376779 res!919695) b!1376782))

(assert (= (and b!1376782 res!919696) b!1376784))

(assert (= (and b!1376784 res!919693) b!1376778))

(assert (= (and b!1376778 c!127985) b!1376780))

(assert (= (and b!1376778 (not c!127985)) b!1376781))

(assert (= (or b!1376780 b!1376781) bm!65838))

(assert (= (or b!1376780 b!1376781) bm!65837))

(declare-fun m!1260437 () Bool)

(assert (=> start!116836 m!1260437))

(declare-fun m!1260439 () Bool)

(assert (=> b!1376784 m!1260439))

(declare-fun m!1260441 () Bool)

(assert (=> b!1376784 m!1260441))

(declare-fun m!1260443 () Bool)

(assert (=> b!1376784 m!1260443))

(declare-fun m!1260445 () Bool)

(assert (=> b!1376779 m!1260445))

(declare-fun m!1260447 () Bool)

(assert (=> bm!65837 m!1260447))

(declare-fun m!1260449 () Bool)

(assert (=> b!1376781 m!1260449))

(declare-fun m!1260451 () Bool)

(assert (=> b!1376781 m!1260451))

(declare-fun m!1260453 () Bool)

(assert (=> b!1376783 m!1260453))

(assert (=> b!1376783 m!1260453))

(declare-fun m!1260455 () Bool)

(assert (=> b!1376783 m!1260455))

(declare-fun m!1260457 () Bool)

(assert (=> bm!65838 m!1260457))

(declare-fun m!1260459 () Bool)

(assert (=> b!1376780 m!1260459))

(declare-fun m!1260461 () Bool)

(assert (=> b!1376780 m!1260461))

(declare-fun m!1260463 () Bool)

(assert (=> b!1376778 m!1260463))

(assert (=> b!1376778 m!1260463))

(declare-fun m!1260465 () Bool)

(assert (=> b!1376778 m!1260465))

(check-sat (not b!1376781) (not start!116836) (not b!1376784) (not b!1376779) (not bm!65838) (not b!1376780) (not bm!65837) (not b!1376778) (not b!1376783))
(check-sat)
