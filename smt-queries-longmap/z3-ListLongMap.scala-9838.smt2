; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116710 () Bool)

(assert start!116710)

(declare-fun res!918561 () Bool)

(declare-fun e!779215 () Bool)

(assert (=> start!116710 (=> (not res!918561) (not e!779215))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93333 0))(
  ( (array!93334 (arr!45070 (Array (_ BitVec 32) (_ BitVec 64))) (size!45622 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93333)

(assert (=> start!116710 (= res!918561 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45622 a!4032))))))

(assert (=> start!116710 e!779215))

(assert (=> start!116710 true))

(declare-fun array_inv!34303 (array!93333) Bool)

(assert (=> start!116710 (array_inv!34303 a!4032)))

(declare-fun b!1375484 () Bool)

(declare-datatypes ((Unit!45396 0))(
  ( (Unit!45397) )
))
(declare-fun e!779214 () Unit!45396)

(declare-fun lt!604319 () Unit!45396)

(assert (=> b!1375484 (= e!779214 lt!604319)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!604322 () Unit!45396)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93333 (_ BitVec 32) (_ BitVec 32)) Unit!45396)

(assert (=> b!1375484 (= lt!604322 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65679 () (_ BitVec 32))

(declare-fun lt!604316 () (_ BitVec 32))

(assert (=> b!1375484 (= call!65679 lt!604316)))

(declare-fun lt!604313 () array!93333)

(assert (=> b!1375484 (= lt!604319 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604313 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65678 () (_ BitVec 32))

(declare-fun lt!604321 () (_ BitVec 32))

(assert (=> b!1375484 (= call!65678 lt!604321)))

(declare-fun bm!65675 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93333 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65675 (= call!65679 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375485 () Bool)

(declare-fun res!918565 () Bool)

(assert (=> b!1375485 (=> (not res!918565) (not e!779215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375485 (= res!918565 (validKeyInArray!0 (select (arr!45070 a!4032) i!1445)))))

(declare-fun b!1375486 () Bool)

(declare-fun e!779212 () Bool)

(declare-fun e!779213 () Bool)

(assert (=> b!1375486 (= e!779212 e!779213)))

(declare-fun res!918564 () Bool)

(assert (=> b!1375486 (=> (not res!918564) (not e!779213))))

(assert (=> b!1375486 (= res!918564 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45622 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604320 () Unit!45396)

(assert (=> b!1375486 (= lt!604320 e!779214)))

(declare-fun c!127904 () Bool)

(assert (=> b!1375486 (= c!127904 (validKeyInArray!0 (select (arr!45070 a!4032) to!206)))))

(declare-fun b!1375487 () Bool)

(assert (=> b!1375487 (= e!779215 e!779212)))

(declare-fun res!918563 () Bool)

(assert (=> b!1375487 (=> (not res!918563) (not e!779212))))

(assert (=> b!1375487 (= res!918563 (and (= lt!604321 lt!604316) (not (= to!206 (size!45622 a!4032)))))))

(assert (=> b!1375487 (= lt!604316 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375487 (= lt!604321 (arrayCountValidKeys!0 lt!604313 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375487 (= lt!604313 (array!93334 (store (arr!45070 a!4032) i!1445 k0!2947) (size!45622 a!4032)))))

(declare-fun bm!65676 () Bool)

(assert (=> bm!65676 (= call!65678 (arrayCountValidKeys!0 lt!604313 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375488 () Bool)

(declare-fun res!918566 () Bool)

(assert (=> b!1375488 (=> (not res!918566) (not e!779215))))

(assert (=> b!1375488 (= res!918566 (and (bvslt (size!45622 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45622 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375489 () Bool)

(declare-fun lt!604317 () Unit!45396)

(assert (=> b!1375489 (= e!779214 lt!604317)))

(declare-fun lt!604315 () Unit!45396)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93333 (_ BitVec 32) (_ BitVec 32)) Unit!45396)

(assert (=> b!1375489 (= lt!604315 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375489 (= call!65679 (bvadd #b00000000000000000000000000000001 lt!604316))))

(assert (=> b!1375489 (= lt!604317 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604313 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375489 (= call!65678 (bvadd #b00000000000000000000000000000001 lt!604321))))

(declare-fun b!1375490 () Bool)

(declare-fun res!918562 () Bool)

(assert (=> b!1375490 (=> (not res!918562) (not e!779215))))

(assert (=> b!1375490 (= res!918562 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1375491 () Bool)

(assert (=> b!1375491 (= e!779213 false)))

(declare-fun lt!604314 () (_ BitVec 32))

(assert (=> b!1375491 (= lt!604314 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604318 () (_ BitVec 32))

(assert (=> b!1375491 (= lt!604318 (arrayCountValidKeys!0 lt!604313 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116710 res!918561) b!1375485))

(assert (= (and b!1375485 res!918565) b!1375490))

(assert (= (and b!1375490 res!918562) b!1375488))

(assert (= (and b!1375488 res!918566) b!1375487))

(assert (= (and b!1375487 res!918563) b!1375486))

(assert (= (and b!1375486 c!127904) b!1375489))

(assert (= (and b!1375486 (not c!127904)) b!1375484))

(assert (= (or b!1375489 b!1375484) bm!65675))

(assert (= (or b!1375489 b!1375484) bm!65676))

(assert (= (and b!1375486 res!918564) b!1375491))

(declare-fun m!1258899 () Bool)

(assert (=> b!1375487 m!1258899))

(declare-fun m!1258901 () Bool)

(assert (=> b!1375487 m!1258901))

(declare-fun m!1258903 () Bool)

(assert (=> b!1375487 m!1258903))

(declare-fun m!1258905 () Bool)

(assert (=> b!1375484 m!1258905))

(declare-fun m!1258907 () Bool)

(assert (=> b!1375484 m!1258907))

(declare-fun m!1258909 () Bool)

(assert (=> b!1375485 m!1258909))

(assert (=> b!1375485 m!1258909))

(declare-fun m!1258911 () Bool)

(assert (=> b!1375485 m!1258911))

(declare-fun m!1258913 () Bool)

(assert (=> bm!65675 m!1258913))

(declare-fun m!1258915 () Bool)

(assert (=> bm!65676 m!1258915))

(assert (=> b!1375491 m!1258913))

(assert (=> b!1375491 m!1258915))

(declare-fun m!1258917 () Bool)

(assert (=> b!1375486 m!1258917))

(assert (=> b!1375486 m!1258917))

(declare-fun m!1258919 () Bool)

(assert (=> b!1375486 m!1258919))

(declare-fun m!1258921 () Bool)

(assert (=> b!1375489 m!1258921))

(declare-fun m!1258923 () Bool)

(assert (=> b!1375489 m!1258923))

(declare-fun m!1258925 () Bool)

(assert (=> b!1375490 m!1258925))

(declare-fun m!1258927 () Bool)

(assert (=> start!116710 m!1258927))

(check-sat (not b!1375490) (not b!1375489) (not start!116710) (not b!1375485) (not b!1375484) (not b!1375486) (not bm!65676) (not b!1375487) (not b!1375491) (not bm!65675))
(check-sat)
