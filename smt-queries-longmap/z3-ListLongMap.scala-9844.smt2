; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116980 () Bool)

(assert start!116980)

(declare-fun b!1377302 () Bool)

(declare-fun e!780361 () Bool)

(declare-fun e!780363 () Bool)

(assert (=> b!1377302 (= e!780361 e!780363)))

(declare-fun res!919446 () Bool)

(assert (=> b!1377302 (=> (not res!919446) (not e!780363))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605514 () (_ BitVec 32))

(declare-datatypes ((array!93535 0))(
  ( (array!93536 (arr!45166 (Array (_ BitVec 32) (_ BitVec 64))) (size!45717 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93535)

(declare-fun lt!605506 () (_ BitVec 32))

(assert (=> b!1377302 (= res!919446 (and (= lt!605514 lt!605506) (not (= to!206 (size!45717 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93535 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377302 (= lt!605506 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605509 () array!93535)

(assert (=> b!1377302 (= lt!605514 (arrayCountValidKeys!0 lt!605509 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1377302 (= lt!605509 (array!93536 (store (arr!45166 a!4032) i!1445 k0!2947) (size!45717 a!4032)))))

(declare-fun b!1377303 () Bool)

(declare-datatypes ((Unit!45530 0))(
  ( (Unit!45531) )
))
(declare-fun e!780364 () Unit!45530)

(declare-fun lt!605510 () Unit!45530)

(assert (=> b!1377303 (= e!780364 lt!605510)))

(declare-fun lt!605507 () Unit!45530)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93535 (_ BitVec 32) (_ BitVec 32)) Unit!45530)

(assert (=> b!1377303 (= lt!605507 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65871 () (_ BitVec 32))

(assert (=> b!1377303 (= call!65871 lt!605506)))

(assert (=> b!1377303 (= lt!605510 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605509 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65872 () (_ BitVec 32))

(assert (=> b!1377303 (= call!65872 lt!605514)))

(declare-fun b!1377304 () Bool)

(declare-fun e!780362 () Bool)

(assert (=> b!1377304 (= e!780363 e!780362)))

(declare-fun res!919448 () Bool)

(assert (=> b!1377304 (=> (not res!919448) (not e!780362))))

(assert (=> b!1377304 (= res!919448 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45717 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605513 () Unit!45530)

(assert (=> b!1377304 (= lt!605513 e!780364)))

(declare-fun c!128377 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377304 (= c!128377 (validKeyInArray!0 (select (arr!45166 a!4032) to!206)))))

(declare-fun bm!65868 () Bool)

(assert (=> bm!65868 (= call!65872 (arrayCountValidKeys!0 lt!605509 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377305 () Bool)

(declare-fun res!919447 () Bool)

(assert (=> b!1377305 (=> (not res!919447) (not e!780361))))

(assert (=> b!1377305 (= res!919447 (and (bvslt (size!45717 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45717 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377306 () Bool)

(declare-fun res!919443 () Bool)

(assert (=> b!1377306 (=> (not res!919443) (not e!780361))))

(assert (=> b!1377306 (= res!919443 (validKeyInArray!0 (select (arr!45166 a!4032) i!1445)))))

(declare-fun b!1377307 () Bool)

(declare-fun res!919444 () Bool)

(assert (=> b!1377307 (=> (not res!919444) (not e!780361))))

(assert (=> b!1377307 (= res!919444 (not (validKeyInArray!0 k0!2947)))))

(declare-fun bm!65869 () Bool)

(assert (=> bm!65869 (= call!65871 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!919445 () Bool)

(assert (=> start!116980 (=> (not res!919445) (not e!780361))))

(assert (=> start!116980 (= res!919445 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45717 a!4032))))))

(assert (=> start!116980 e!780361))

(assert (=> start!116980 true))

(declare-fun array_inv!34447 (array!93535) Bool)

(assert (=> start!116980 (array_inv!34447 a!4032)))

(declare-fun b!1377308 () Bool)

(declare-fun res!919449 () Bool)

(assert (=> b!1377308 (=> (not res!919449) (not e!780362))))

(assert (=> b!1377308 (= res!919449 (= (arrayCountValidKeys!0 lt!605509 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1377309 () Bool)

(declare-fun lt!605508 () Unit!45530)

(assert (=> b!1377309 (= e!780364 lt!605508)))

(declare-fun lt!605511 () Unit!45530)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93535 (_ BitVec 32) (_ BitVec 32)) Unit!45530)

(assert (=> b!1377309 (= lt!605511 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377309 (= call!65871 (bvadd #b00000000000000000000000000000001 lt!605506))))

(assert (=> b!1377309 (= lt!605508 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605509 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377309 (= call!65872 (bvadd #b00000000000000000000000000000001 lt!605514))))

(declare-fun b!1377310 () Bool)

(assert (=> b!1377310 (= e!780362 (not true))))

(assert (=> b!1377310 (= (arrayCountValidKeys!0 lt!605509 (bvadd #b00000000000000000000000000000001 i!1445) (size!45717 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45717 a!4032)))))

(declare-fun lt!605512 () Unit!45530)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93535 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45530)

(assert (=> b!1377310 (= lt!605512 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116980 res!919445) b!1377306))

(assert (= (and b!1377306 res!919443) b!1377307))

(assert (= (and b!1377307 res!919444) b!1377305))

(assert (= (and b!1377305 res!919447) b!1377302))

(assert (= (and b!1377302 res!919446) b!1377304))

(assert (= (and b!1377304 c!128377) b!1377309))

(assert (= (and b!1377304 (not c!128377)) b!1377303))

(assert (= (or b!1377309 b!1377303) bm!65868))

(assert (= (or b!1377309 b!1377303) bm!65869))

(assert (= (and b!1377304 res!919448) b!1377308))

(assert (= (and b!1377308 res!919449) b!1377310))

(declare-fun m!1261595 () Bool)

(assert (=> b!1377309 m!1261595))

(declare-fun m!1261597 () Bool)

(assert (=> b!1377309 m!1261597))

(declare-fun m!1261599 () Bool)

(assert (=> b!1377303 m!1261599))

(declare-fun m!1261601 () Bool)

(assert (=> b!1377303 m!1261601))

(declare-fun m!1261603 () Bool)

(assert (=> b!1377310 m!1261603))

(declare-fun m!1261605 () Bool)

(assert (=> b!1377310 m!1261605))

(declare-fun m!1261607 () Bool)

(assert (=> b!1377310 m!1261607))

(declare-fun m!1261609 () Bool)

(assert (=> b!1377307 m!1261609))

(declare-fun m!1261611 () Bool)

(assert (=> b!1377304 m!1261611))

(assert (=> b!1377304 m!1261611))

(declare-fun m!1261613 () Bool)

(assert (=> b!1377304 m!1261613))

(declare-fun m!1261615 () Bool)

(assert (=> bm!65868 m!1261615))

(declare-fun m!1261617 () Bool)

(assert (=> start!116980 m!1261617))

(assert (=> b!1377308 m!1261615))

(declare-fun m!1261619 () Bool)

(assert (=> b!1377308 m!1261619))

(assert (=> bm!65869 m!1261619))

(declare-fun m!1261621 () Bool)

(assert (=> b!1377302 m!1261621))

(declare-fun m!1261623 () Bool)

(assert (=> b!1377302 m!1261623))

(declare-fun m!1261625 () Bool)

(assert (=> b!1377302 m!1261625))

(declare-fun m!1261627 () Bool)

(assert (=> b!1377306 m!1261627))

(assert (=> b!1377306 m!1261627))

(declare-fun m!1261629 () Bool)

(assert (=> b!1377306 m!1261629))

(check-sat (not b!1377302) (not b!1377306) (not b!1377303) (not b!1377308) (not bm!65868) (not b!1377310) (not bm!65869) (not start!116980) (not b!1377307) (not b!1377309) (not b!1377304))
(check-sat)
