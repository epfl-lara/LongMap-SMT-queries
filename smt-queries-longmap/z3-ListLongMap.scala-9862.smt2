; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116860 () Bool)

(assert start!116860)

(declare-fun b!1377049 () Bool)

(declare-fun e!780033 () Bool)

(declare-fun e!780031 () Bool)

(assert (=> b!1377049 (= e!780033 e!780031)))

(declare-fun res!919870 () Bool)

(assert (=> b!1377049 (=> (not res!919870) (not e!780031))))

(declare-fun to!206 () (_ BitVec 32))

(declare-datatypes ((array!93529 0))(
  ( (array!93530 (arr!45168 (Array (_ BitVec 32) (_ BitVec 64))) (size!45718 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93529)

(declare-fun lt!605651 () (_ BitVec 32))

(declare-fun lt!605656 () (_ BitVec 32))

(assert (=> b!1377049 (= res!919870 (and (= lt!605651 lt!605656) (not (= to!206 (size!45718 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93529 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377049 (= lt!605656 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605650 () array!93529)

(assert (=> b!1377049 (= lt!605651 (arrayCountValidKeys!0 lt!605650 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1377049 (= lt!605650 (array!93530 (store (arr!45168 a!4032) i!1445 k0!2947) (size!45718 a!4032)))))

(declare-fun res!919873 () Bool)

(assert (=> start!116860 (=> (not res!919873) (not e!780033))))

(assert (=> start!116860 (= res!919873 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45718 a!4032))))))

(assert (=> start!116860 e!780033))

(assert (=> start!116860 true))

(declare-fun array_inv!34196 (array!93529) Bool)

(assert (=> start!116860 (array_inv!34196 a!4032)))

(declare-fun bm!65914 () Bool)

(declare-fun call!65918 () (_ BitVec 32))

(assert (=> bm!65914 (= call!65918 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377050 () Bool)

(declare-fun res!919869 () Bool)

(assert (=> b!1377050 (=> (not res!919869) (not e!780033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377050 (= res!919869 (validKeyInArray!0 (select (arr!45168 a!4032) i!1445)))))

(declare-fun b!1377051 () Bool)

(declare-fun res!919871 () Bool)

(assert (=> b!1377051 (=> (not res!919871) (not e!780033))))

(assert (=> b!1377051 (= res!919871 (and (bvslt (size!45718 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45718 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377052 () Bool)

(assert (=> b!1377052 (= e!780031 false)))

(declare-datatypes ((Unit!45653 0))(
  ( (Unit!45654) )
))
(declare-fun lt!605655 () Unit!45653)

(declare-fun e!780034 () Unit!45653)

(assert (=> b!1377052 (= lt!605655 e!780034)))

(declare-fun c!128030 () Bool)

(assert (=> b!1377052 (= c!128030 (validKeyInArray!0 (select (arr!45168 a!4032) to!206)))))

(declare-fun bm!65915 () Bool)

(declare-fun call!65917 () (_ BitVec 32))

(assert (=> bm!65915 (= call!65917 (arrayCountValidKeys!0 lt!605650 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377053 () Bool)

(declare-fun lt!605652 () Unit!45653)

(assert (=> b!1377053 (= e!780034 lt!605652)))

(declare-fun lt!605653 () Unit!45653)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93529 (_ BitVec 32) (_ BitVec 32)) Unit!45653)

(assert (=> b!1377053 (= lt!605653 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377053 (= call!65918 lt!605656)))

(assert (=> b!1377053 (= lt!605652 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605650 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377053 (= call!65917 lt!605651)))

(declare-fun b!1377054 () Bool)

(declare-fun lt!605649 () Unit!45653)

(assert (=> b!1377054 (= e!780034 lt!605649)))

(declare-fun lt!605654 () Unit!45653)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93529 (_ BitVec 32) (_ BitVec 32)) Unit!45653)

(assert (=> b!1377054 (= lt!605654 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377054 (= call!65918 (bvadd #b00000000000000000000000000000001 lt!605656))))

(assert (=> b!1377054 (= lt!605649 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605650 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377054 (= call!65917 (bvadd #b00000000000000000000000000000001 lt!605651))))

(declare-fun b!1377055 () Bool)

(declare-fun res!919872 () Bool)

(assert (=> b!1377055 (=> (not res!919872) (not e!780033))))

(assert (=> b!1377055 (= res!919872 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!116860 res!919873) b!1377050))

(assert (= (and b!1377050 res!919869) b!1377055))

(assert (= (and b!1377055 res!919872) b!1377051))

(assert (= (and b!1377051 res!919871) b!1377049))

(assert (= (and b!1377049 res!919870) b!1377052))

(assert (= (and b!1377052 c!128030) b!1377054))

(assert (= (and b!1377052 (not c!128030)) b!1377053))

(assert (= (or b!1377054 b!1377053) bm!65914))

(assert (= (or b!1377054 b!1377053) bm!65915))

(declare-fun m!1261231 () Bool)

(assert (=> b!1377052 m!1261231))

(assert (=> b!1377052 m!1261231))

(declare-fun m!1261233 () Bool)

(assert (=> b!1377052 m!1261233))

(declare-fun m!1261235 () Bool)

(assert (=> bm!65914 m!1261235))

(declare-fun m!1261237 () Bool)

(assert (=> b!1377049 m!1261237))

(declare-fun m!1261239 () Bool)

(assert (=> b!1377049 m!1261239))

(declare-fun m!1261241 () Bool)

(assert (=> b!1377049 m!1261241))

(declare-fun m!1261243 () Bool)

(assert (=> b!1377050 m!1261243))

(assert (=> b!1377050 m!1261243))

(declare-fun m!1261245 () Bool)

(assert (=> b!1377050 m!1261245))

(declare-fun m!1261247 () Bool)

(assert (=> b!1377054 m!1261247))

(declare-fun m!1261249 () Bool)

(assert (=> b!1377054 m!1261249))

(declare-fun m!1261251 () Bool)

(assert (=> b!1377055 m!1261251))

(declare-fun m!1261253 () Bool)

(assert (=> b!1377053 m!1261253))

(declare-fun m!1261255 () Bool)

(assert (=> b!1377053 m!1261255))

(declare-fun m!1261257 () Bool)

(assert (=> bm!65915 m!1261257))

(declare-fun m!1261259 () Bool)

(assert (=> start!116860 m!1261259))

(check-sat (not b!1377049) (not b!1377054) (not b!1377053) (not bm!65914) (not bm!65915) (not b!1377055) (not b!1377050) (not b!1377052) (not start!116860))
