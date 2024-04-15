; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116854 () Bool)

(assert start!116854)

(declare-fun res!919828 () Bool)

(declare-fun e!779992 () Bool)

(assert (=> start!116854 (=> (not res!919828) (not e!779992))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93477 0))(
  ( (array!93478 (arr!45142 (Array (_ BitVec 32) (_ BitVec 64))) (size!45694 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93477)

(assert (=> start!116854 (= res!919828 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45694 a!4032))))))

(assert (=> start!116854 e!779992))

(assert (=> start!116854 true))

(declare-fun array_inv!34375 (array!93477) Bool)

(assert (=> start!116854 (array_inv!34375 a!4032)))

(declare-fun b!1376967 () Bool)

(declare-fun e!779995 () Bool)

(assert (=> b!1376967 (= e!779995 false)))

(declare-datatypes ((Unit!45492 0))(
  ( (Unit!45493) )
))
(declare-fun lt!605447 () Unit!45492)

(declare-fun e!779993 () Unit!45492)

(assert (=> b!1376967 (= lt!605447 e!779993)))

(declare-fun c!128012 () Bool)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376967 (= c!128012 (validKeyInArray!0 (select (arr!45142 a!4032) to!206)))))

(declare-fun b!1376968 () Bool)

(assert (=> b!1376968 (= e!779992 e!779995)))

(declare-fun res!919831 () Bool)

(assert (=> b!1376968 (=> (not res!919831) (not e!779995))))

(declare-fun lt!605446 () (_ BitVec 32))

(declare-fun lt!605443 () (_ BitVec 32))

(assert (=> b!1376968 (= res!919831 (and (= lt!605443 lt!605446) (not (= to!206 (size!45694 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93477 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376968 (= lt!605446 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605444 () array!93477)

(assert (=> b!1376968 (= lt!605443 (arrayCountValidKeys!0 lt!605444 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376968 (= lt!605444 (array!93478 (store (arr!45142 a!4032) i!1445 k0!2947) (size!45694 a!4032)))))

(declare-fun call!65895 () (_ BitVec 32))

(declare-fun bm!65891 () Bool)

(assert (=> bm!65891 (= call!65895 (arrayCountValidKeys!0 lt!605444 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65892 () Bool)

(declare-fun call!65894 () (_ BitVec 32))

(assert (=> bm!65892 (= call!65894 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376969 () Bool)

(declare-fun res!919832 () Bool)

(assert (=> b!1376969 (=> (not res!919832) (not e!779992))))

(assert (=> b!1376969 (= res!919832 (and (bvslt (size!45694 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45694 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376970 () Bool)

(declare-fun lt!605449 () Unit!45492)

(assert (=> b!1376970 (= e!779993 lt!605449)))

(declare-fun lt!605448 () Unit!45492)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93477 (_ BitVec 32) (_ BitVec 32)) Unit!45492)

(assert (=> b!1376970 (= lt!605448 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376970 (= call!65894 lt!605446)))

(assert (=> b!1376970 (= lt!605449 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605444 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376970 (= call!65895 lt!605443)))

(declare-fun b!1376971 () Bool)

(declare-fun res!919829 () Bool)

(assert (=> b!1376971 (=> (not res!919829) (not e!779992))))

(assert (=> b!1376971 (= res!919829 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376972 () Bool)

(declare-fun lt!605450 () Unit!45492)

(assert (=> b!1376972 (= e!779993 lt!605450)))

(declare-fun lt!605445 () Unit!45492)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93477 (_ BitVec 32) (_ BitVec 32)) Unit!45492)

(assert (=> b!1376972 (= lt!605445 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376972 (= call!65894 (bvadd #b00000000000000000000000000000001 lt!605446))))

(assert (=> b!1376972 (= lt!605450 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605444 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376972 (= call!65895 (bvadd #b00000000000000000000000000000001 lt!605443))))

(declare-fun b!1376973 () Bool)

(declare-fun res!919830 () Bool)

(assert (=> b!1376973 (=> (not res!919830) (not e!779992))))

(assert (=> b!1376973 (= res!919830 (validKeyInArray!0 (select (arr!45142 a!4032) i!1445)))))

(assert (= (and start!116854 res!919828) b!1376973))

(assert (= (and b!1376973 res!919830) b!1376971))

(assert (= (and b!1376971 res!919829) b!1376969))

(assert (= (and b!1376969 res!919832) b!1376968))

(assert (= (and b!1376968 res!919831) b!1376967))

(assert (= (and b!1376967 c!128012) b!1376972))

(assert (= (and b!1376967 (not c!128012)) b!1376970))

(assert (= (or b!1376972 b!1376970) bm!65891))

(assert (= (or b!1376972 b!1376970) bm!65892))

(declare-fun m!1260707 () Bool)

(assert (=> b!1376967 m!1260707))

(assert (=> b!1376967 m!1260707))

(declare-fun m!1260709 () Bool)

(assert (=> b!1376967 m!1260709))

(declare-fun m!1260711 () Bool)

(assert (=> b!1376973 m!1260711))

(assert (=> b!1376973 m!1260711))

(declare-fun m!1260713 () Bool)

(assert (=> b!1376973 m!1260713))

(declare-fun m!1260715 () Bool)

(assert (=> start!116854 m!1260715))

(declare-fun m!1260717 () Bool)

(assert (=> b!1376971 m!1260717))

(declare-fun m!1260719 () Bool)

(assert (=> bm!65891 m!1260719))

(declare-fun m!1260721 () Bool)

(assert (=> b!1376972 m!1260721))

(declare-fun m!1260723 () Bool)

(assert (=> b!1376972 m!1260723))

(declare-fun m!1260725 () Bool)

(assert (=> b!1376968 m!1260725))

(declare-fun m!1260727 () Bool)

(assert (=> b!1376968 m!1260727))

(declare-fun m!1260729 () Bool)

(assert (=> b!1376968 m!1260729))

(declare-fun m!1260731 () Bool)

(assert (=> b!1376970 m!1260731))

(declare-fun m!1260733 () Bool)

(assert (=> b!1376970 m!1260733))

(declare-fun m!1260735 () Bool)

(assert (=> bm!65892 m!1260735))

(check-sat (not b!1376967) (not b!1376972) (not start!116854) (not b!1376973) (not bm!65891) (not b!1376971) (not b!1376968) (not bm!65892) (not b!1376970))
(check-sat)
