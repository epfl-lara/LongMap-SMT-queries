; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116848 () Bool)

(assert start!116848)

(declare-fun bm!65873 () Bool)

(declare-datatypes ((array!93471 0))(
  ( (array!93472 (arr!45139 (Array (_ BitVec 32) (_ BitVec 64))) (size!45691 (_ BitVec 32))) )
))
(declare-fun lt!605376 () array!93471)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun call!65876 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93471 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65873 (= call!65876 (arrayCountValidKeys!0 lt!605376 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376904 () Bool)

(declare-fun res!919786 () Bool)

(declare-fun e!779957 () Bool)

(assert (=> b!1376904 (=> (not res!919786) (not e!779957))))

(declare-fun a!4032 () array!93471)

(assert (=> b!1376904 (= res!919786 (and (bvslt (size!45691 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45691 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!919787 () Bool)

(assert (=> start!116848 (=> (not res!919787) (not e!779957))))

(assert (=> start!116848 (= res!919787 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45691 a!4032))))))

(assert (=> start!116848 e!779957))

(assert (=> start!116848 true))

(declare-fun array_inv!34372 (array!93471) Bool)

(assert (=> start!116848 (array_inv!34372 a!4032)))

(declare-fun b!1376905 () Bool)

(declare-fun e!779958 () Bool)

(assert (=> b!1376905 (= e!779958 false)))

(declare-datatypes ((Unit!45486 0))(
  ( (Unit!45487) )
))
(declare-fun lt!605373 () Unit!45486)

(declare-fun e!779959 () Unit!45486)

(assert (=> b!1376905 (= lt!605373 e!779959)))

(declare-fun c!128003 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376905 (= c!128003 (validKeyInArray!0 (select (arr!45139 a!4032) to!206)))))

(declare-fun b!1376906 () Bool)

(declare-fun res!919784 () Bool)

(assert (=> b!1376906 (=> (not res!919784) (not e!779957))))

(assert (=> b!1376906 (= res!919784 (validKeyInArray!0 (select (arr!45139 a!4032) i!1445)))))

(declare-fun b!1376907 () Bool)

(assert (=> b!1376907 (= e!779957 e!779958)))

(declare-fun res!919785 () Bool)

(assert (=> b!1376907 (=> (not res!919785) (not e!779958))))

(declare-fun lt!605374 () (_ BitVec 32))

(declare-fun lt!605378 () (_ BitVec 32))

(assert (=> b!1376907 (= res!919785 (and (= lt!605374 lt!605378) (not (= to!206 (size!45691 a!4032)))))))

(assert (=> b!1376907 (= lt!605378 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376907 (= lt!605374 (arrayCountValidKeys!0 lt!605376 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376907 (= lt!605376 (array!93472 (store (arr!45139 a!4032) i!1445 k0!2947) (size!45691 a!4032)))))

(declare-fun bm!65874 () Bool)

(declare-fun call!65877 () (_ BitVec 32))

(assert (=> bm!65874 (= call!65877 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376908 () Bool)

(declare-fun res!919783 () Bool)

(assert (=> b!1376908 (=> (not res!919783) (not e!779957))))

(assert (=> b!1376908 (= res!919783 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376909 () Bool)

(declare-fun lt!605372 () Unit!45486)

(assert (=> b!1376909 (= e!779959 lt!605372)))

(declare-fun lt!605377 () Unit!45486)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93471 (_ BitVec 32) (_ BitVec 32)) Unit!45486)

(assert (=> b!1376909 (= lt!605377 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376909 (= call!65877 lt!605378)))

(assert (=> b!1376909 (= lt!605372 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605376 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376909 (= call!65876 lt!605374)))

(declare-fun b!1376910 () Bool)

(declare-fun lt!605371 () Unit!45486)

(assert (=> b!1376910 (= e!779959 lt!605371)))

(declare-fun lt!605375 () Unit!45486)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93471 (_ BitVec 32) (_ BitVec 32)) Unit!45486)

(assert (=> b!1376910 (= lt!605375 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376910 (= call!65877 (bvadd #b00000000000000000000000000000001 lt!605378))))

(assert (=> b!1376910 (= lt!605371 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605376 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376910 (= call!65876 (bvadd #b00000000000000000000000000000001 lt!605374))))

(assert (= (and start!116848 res!919787) b!1376906))

(assert (= (and b!1376906 res!919784) b!1376908))

(assert (= (and b!1376908 res!919783) b!1376904))

(assert (= (and b!1376904 res!919786) b!1376907))

(assert (= (and b!1376907 res!919785) b!1376905))

(assert (= (and b!1376905 c!128003) b!1376910))

(assert (= (and b!1376905 (not c!128003)) b!1376909))

(assert (= (or b!1376910 b!1376909) bm!65873))

(assert (= (or b!1376910 b!1376909) bm!65874))

(declare-fun m!1260617 () Bool)

(assert (=> bm!65874 m!1260617))

(declare-fun m!1260619 () Bool)

(assert (=> b!1376907 m!1260619))

(declare-fun m!1260621 () Bool)

(assert (=> b!1376907 m!1260621))

(declare-fun m!1260623 () Bool)

(assert (=> b!1376907 m!1260623))

(declare-fun m!1260625 () Bool)

(assert (=> bm!65873 m!1260625))

(declare-fun m!1260627 () Bool)

(assert (=> b!1376910 m!1260627))

(declare-fun m!1260629 () Bool)

(assert (=> b!1376910 m!1260629))

(declare-fun m!1260631 () Bool)

(assert (=> b!1376908 m!1260631))

(declare-fun m!1260633 () Bool)

(assert (=> b!1376909 m!1260633))

(declare-fun m!1260635 () Bool)

(assert (=> b!1376909 m!1260635))

(declare-fun m!1260637 () Bool)

(assert (=> b!1376906 m!1260637))

(assert (=> b!1376906 m!1260637))

(declare-fun m!1260639 () Bool)

(assert (=> b!1376906 m!1260639))

(declare-fun m!1260641 () Bool)

(assert (=> start!116848 m!1260641))

(declare-fun m!1260643 () Bool)

(assert (=> b!1376905 m!1260643))

(assert (=> b!1376905 m!1260643))

(declare-fun m!1260645 () Bool)

(assert (=> b!1376905 m!1260645))

(check-sat (not bm!65874) (not b!1376908) (not b!1376905) (not bm!65873) (not b!1376910) (not b!1376907) (not b!1376906) (not start!116848) (not b!1376909))
(check-sat)
