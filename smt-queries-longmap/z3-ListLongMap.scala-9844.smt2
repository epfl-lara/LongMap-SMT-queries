; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116752 () Bool)

(assert start!116752)

(declare-fun b!1376015 () Bool)

(declare-fun res!918949 () Bool)

(declare-fun e!779525 () Bool)

(assert (=> b!1376015 (=> (not res!918949) (not e!779525))))

(declare-datatypes ((array!93421 0))(
  ( (array!93422 (arr!45114 (Array (_ BitVec 32) (_ BitVec 64))) (size!45664 (_ BitVec 32))) )
))
(declare-fun lt!605054 () array!93421)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun a!4032 () array!93421)

(declare-fun arrayCountValidKeys!0 (array!93421 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376015 (= res!918949 (= (arrayCountValidKeys!0 lt!605054 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1376016 () Bool)

(assert (=> b!1376016 (= e!779525 (not true))))

(assert (=> b!1376016 (= (arrayCountValidKeys!0 lt!605054 (bvadd #b00000000000000000000000000000001 i!1445) (size!45664 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45664 a!4032)))))

(declare-datatypes ((Unit!45593 0))(
  ( (Unit!45594) )
))
(declare-fun lt!605053 () Unit!45593)

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93421 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45593)

(assert (=> b!1376016 (= lt!605053 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376017 () Bool)

(declare-fun e!779527 () Bool)

(assert (=> b!1376017 (= e!779527 e!779525)))

(declare-fun res!918947 () Bool)

(assert (=> b!1376017 (=> (not res!918947) (not e!779525))))

(assert (=> b!1376017 (= res!918947 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45664 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605057 () Unit!45593)

(declare-fun e!779523 () Unit!45593)

(assert (=> b!1376017 (= lt!605057 e!779523)))

(declare-fun c!127976 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376017 (= c!127976 (validKeyInArray!0 (select (arr!45114 a!4032) to!206)))))

(declare-fun b!1376018 () Bool)

(declare-fun res!918948 () Bool)

(declare-fun e!779524 () Bool)

(assert (=> b!1376018 (=> (not res!918948) (not e!779524))))

(assert (=> b!1376018 (= res!918948 (and (bvslt (size!45664 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45664 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun bm!65806 () Bool)

(declare-fun call!65810 () (_ BitVec 32))

(assert (=> bm!65806 (= call!65810 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun call!65809 () (_ BitVec 32))

(declare-fun bm!65807 () Bool)

(assert (=> bm!65807 (= call!65809 (arrayCountValidKeys!0 lt!605054 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376020 () Bool)

(declare-fun lt!605055 () Unit!45593)

(assert (=> b!1376020 (= e!779523 lt!605055)))

(declare-fun lt!605059 () Unit!45593)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93421 (_ BitVec 32) (_ BitVec 32)) Unit!45593)

(assert (=> b!1376020 (= lt!605059 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605051 () (_ BitVec 32))

(assert (=> b!1376020 (= call!65810 (bvadd #b00000000000000000000000000000001 lt!605051))))

(assert (=> b!1376020 (= lt!605055 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605054 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605058 () (_ BitVec 32))

(assert (=> b!1376020 (= call!65809 (bvadd #b00000000000000000000000000000001 lt!605058))))

(declare-fun b!1376021 () Bool)

(declare-fun res!918946 () Bool)

(assert (=> b!1376021 (=> (not res!918946) (not e!779524))))

(assert (=> b!1376021 (= res!918946 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1376022 () Bool)

(assert (=> b!1376022 (= e!779524 e!779527)))

(declare-fun res!918944 () Bool)

(assert (=> b!1376022 (=> (not res!918944) (not e!779527))))

(assert (=> b!1376022 (= res!918944 (and (= lt!605058 lt!605051) (not (= to!206 (size!45664 a!4032)))))))

(assert (=> b!1376022 (= lt!605051 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376022 (= lt!605058 (arrayCountValidKeys!0 lt!605054 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376022 (= lt!605054 (array!93422 (store (arr!45114 a!4032) i!1445 k0!2947) (size!45664 a!4032)))))

(declare-fun b!1376023 () Bool)

(declare-fun res!918945 () Bool)

(assert (=> b!1376023 (=> (not res!918945) (not e!779524))))

(assert (=> b!1376023 (= res!918945 (validKeyInArray!0 (select (arr!45114 a!4032) i!1445)))))

(declare-fun res!918943 () Bool)

(assert (=> start!116752 (=> (not res!918943) (not e!779524))))

(assert (=> start!116752 (= res!918943 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45664 a!4032))))))

(assert (=> start!116752 e!779524))

(assert (=> start!116752 true))

(declare-fun array_inv!34142 (array!93421) Bool)

(assert (=> start!116752 (array_inv!34142 a!4032)))

(declare-fun b!1376019 () Bool)

(declare-fun lt!605056 () Unit!45593)

(assert (=> b!1376019 (= e!779523 lt!605056)))

(declare-fun lt!605052 () Unit!45593)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93421 (_ BitVec 32) (_ BitVec 32)) Unit!45593)

(assert (=> b!1376019 (= lt!605052 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376019 (= call!65810 lt!605051)))

(assert (=> b!1376019 (= lt!605056 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605054 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376019 (= call!65809 lt!605058)))

(assert (= (and start!116752 res!918943) b!1376023))

(assert (= (and b!1376023 res!918945) b!1376021))

(assert (= (and b!1376021 res!918946) b!1376018))

(assert (= (and b!1376018 res!918948) b!1376022))

(assert (= (and b!1376022 res!918944) b!1376017))

(assert (= (and b!1376017 c!127976) b!1376020))

(assert (= (and b!1376017 (not c!127976)) b!1376019))

(assert (= (or b!1376020 b!1376019) bm!65807))

(assert (= (or b!1376020 b!1376019) bm!65806))

(assert (= (and b!1376017 res!918947) b!1376015))

(assert (= (and b!1376015 res!918949) b!1376016))

(declare-fun m!1259995 () Bool)

(assert (=> bm!65807 m!1259995))

(declare-fun m!1259997 () Bool)

(assert (=> start!116752 m!1259997))

(declare-fun m!1259999 () Bool)

(assert (=> b!1376019 m!1259999))

(declare-fun m!1260001 () Bool)

(assert (=> b!1376019 m!1260001))

(declare-fun m!1260003 () Bool)

(assert (=> b!1376017 m!1260003))

(assert (=> b!1376017 m!1260003))

(declare-fun m!1260005 () Bool)

(assert (=> b!1376017 m!1260005))

(assert (=> b!1376015 m!1259995))

(declare-fun m!1260007 () Bool)

(assert (=> b!1376015 m!1260007))

(declare-fun m!1260009 () Bool)

(assert (=> b!1376021 m!1260009))

(declare-fun m!1260011 () Bool)

(assert (=> b!1376016 m!1260011))

(declare-fun m!1260013 () Bool)

(assert (=> b!1376016 m!1260013))

(declare-fun m!1260015 () Bool)

(assert (=> b!1376016 m!1260015))

(assert (=> bm!65806 m!1260007))

(declare-fun m!1260017 () Bool)

(assert (=> b!1376022 m!1260017))

(declare-fun m!1260019 () Bool)

(assert (=> b!1376022 m!1260019))

(declare-fun m!1260021 () Bool)

(assert (=> b!1376022 m!1260021))

(declare-fun m!1260023 () Bool)

(assert (=> b!1376020 m!1260023))

(declare-fun m!1260025 () Bool)

(assert (=> b!1376020 m!1260025))

(declare-fun m!1260027 () Bool)

(assert (=> b!1376023 m!1260027))

(assert (=> b!1376023 m!1260027))

(declare-fun m!1260029 () Bool)

(assert (=> b!1376023 m!1260029))

(check-sat (not b!1376023) (not b!1376015) (not bm!65807) (not start!116752) (not b!1376017) (not b!1376022) (not bm!65806) (not b!1376020) (not b!1376021) (not b!1376016) (not b!1376019))
(check-sat)
