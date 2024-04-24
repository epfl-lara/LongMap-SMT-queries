; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116944 () Bool)

(assert start!116944)

(declare-fun b!1376859 () Bool)

(declare-datatypes ((Unit!45494 0))(
  ( (Unit!45495) )
))
(declare-fun e!780094 () Unit!45494)

(declare-fun lt!604978 () Unit!45494)

(assert (=> b!1376859 (= e!780094 lt!604978)))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93499 0))(
  ( (array!93500 (arr!45148 (Array (_ BitVec 32) (_ BitVec 64))) (size!45699 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93499)

(declare-fun lt!604979 () Unit!45494)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93499 (_ BitVec 32) (_ BitVec 32)) Unit!45494)

(assert (=> b!1376859 (= lt!604979 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65763 () (_ BitVec 32))

(declare-fun lt!604984 () (_ BitVec 32))

(assert (=> b!1376859 (= call!65763 lt!604984)))

(declare-fun lt!604982 () array!93499)

(assert (=> b!1376859 (= lt!604978 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604982 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65764 () (_ BitVec 32))

(declare-fun lt!604981 () (_ BitVec 32))

(assert (=> b!1376859 (= call!65764 lt!604981)))

(declare-fun b!1376860 () Bool)

(declare-fun e!780091 () Bool)

(assert (=> b!1376860 (= e!780091 false)))

(declare-fun lt!604986 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93499 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376860 (= lt!604986 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604985 () (_ BitVec 32))

(assert (=> b!1376860 (= lt!604985 (arrayCountValidKeys!0 lt!604982 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65760 () Bool)

(assert (=> bm!65760 (= call!65764 (arrayCountValidKeys!0 lt!604982 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65761 () Bool)

(assert (=> bm!65761 (= call!65763 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1376861 () Bool)

(declare-fun e!780093 () Bool)

(assert (=> b!1376861 (= e!780093 e!780091)))

(declare-fun res!919112 () Bool)

(assert (=> b!1376861 (=> (not res!919112) (not e!780091))))

(assert (=> b!1376861 (= res!919112 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45699 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604977 () Unit!45494)

(assert (=> b!1376861 (= lt!604977 e!780094)))

(declare-fun c!128323 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376861 (= c!128323 (validKeyInArray!0 (select (arr!45148 a!4032) to!206)))))

(declare-fun b!1376862 () Bool)

(declare-fun lt!604983 () Unit!45494)

(assert (=> b!1376862 (= e!780094 lt!604983)))

(declare-fun lt!604980 () Unit!45494)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93499 (_ BitVec 32) (_ BitVec 32)) Unit!45494)

(assert (=> b!1376862 (= lt!604980 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376862 (= call!65763 (bvadd #b00000000000000000000000000000001 lt!604984))))

(assert (=> b!1376862 (= lt!604983 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604982 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376862 (= call!65764 (bvadd #b00000000000000000000000000000001 lt!604981))))

(declare-fun b!1376864 () Bool)

(declare-fun res!919111 () Bool)

(declare-fun e!780092 () Bool)

(assert (=> b!1376864 (=> (not res!919111) (not e!780092))))

(assert (=> b!1376864 (= res!919111 (and (bvslt (size!45699 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45699 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1376865 () Bool)

(assert (=> b!1376865 (= e!780092 e!780093)))

(declare-fun res!919108 () Bool)

(assert (=> b!1376865 (=> (not res!919108) (not e!780093))))

(assert (=> b!1376865 (= res!919108 (and (= lt!604981 lt!604984) (not (= to!206 (size!45699 a!4032)))))))

(assert (=> b!1376865 (= lt!604984 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1376865 (= lt!604981 (arrayCountValidKeys!0 lt!604982 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1376865 (= lt!604982 (array!93500 (store (arr!45148 a!4032) i!1445 k0!2947) (size!45699 a!4032)))))

(declare-fun b!1376866 () Bool)

(declare-fun res!919113 () Bool)

(assert (=> b!1376866 (=> (not res!919113) (not e!780092))))

(assert (=> b!1376866 (= res!919113 (validKeyInArray!0 (select (arr!45148 a!4032) i!1445)))))

(declare-fun b!1376863 () Bool)

(declare-fun res!919110 () Bool)

(assert (=> b!1376863 (=> (not res!919110) (not e!780092))))

(assert (=> b!1376863 (= res!919110 (not (validKeyInArray!0 k0!2947)))))

(declare-fun res!919109 () Bool)

(assert (=> start!116944 (=> (not res!919109) (not e!780092))))

(assert (=> start!116944 (= res!919109 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45699 a!4032))))))

(assert (=> start!116944 e!780092))

(assert (=> start!116944 true))

(declare-fun array_inv!34429 (array!93499) Bool)

(assert (=> start!116944 (array_inv!34429 a!4032)))

(assert (= (and start!116944 res!919109) b!1376866))

(assert (= (and b!1376866 res!919113) b!1376863))

(assert (= (and b!1376863 res!919110) b!1376864))

(assert (= (and b!1376864 res!919111) b!1376865))

(assert (= (and b!1376865 res!919108) b!1376861))

(assert (= (and b!1376861 c!128323) b!1376862))

(assert (= (and b!1376861 (not c!128323)) b!1376859))

(assert (= (or b!1376862 b!1376859) bm!65760))

(assert (= (or b!1376862 b!1376859) bm!65761))

(assert (= (and b!1376861 res!919112) b!1376860))

(declare-fun m!1261029 () Bool)

(assert (=> b!1376865 m!1261029))

(declare-fun m!1261031 () Bool)

(assert (=> b!1376865 m!1261031))

(declare-fun m!1261033 () Bool)

(assert (=> b!1376865 m!1261033))

(declare-fun m!1261035 () Bool)

(assert (=> b!1376863 m!1261035))

(declare-fun m!1261037 () Bool)

(assert (=> b!1376861 m!1261037))

(assert (=> b!1376861 m!1261037))

(declare-fun m!1261039 () Bool)

(assert (=> b!1376861 m!1261039))

(declare-fun m!1261041 () Bool)

(assert (=> bm!65760 m!1261041))

(declare-fun m!1261043 () Bool)

(assert (=> b!1376862 m!1261043))

(declare-fun m!1261045 () Bool)

(assert (=> b!1376862 m!1261045))

(declare-fun m!1261047 () Bool)

(assert (=> bm!65761 m!1261047))

(declare-fun m!1261049 () Bool)

(assert (=> b!1376859 m!1261049))

(declare-fun m!1261051 () Bool)

(assert (=> b!1376859 m!1261051))

(declare-fun m!1261053 () Bool)

(assert (=> b!1376866 m!1261053))

(assert (=> b!1376866 m!1261053))

(declare-fun m!1261055 () Bool)

(assert (=> b!1376866 m!1261055))

(declare-fun m!1261057 () Bool)

(assert (=> start!116944 m!1261057))

(assert (=> b!1376860 m!1261047))

(assert (=> b!1376860 m!1261041))

(check-sat (not b!1376862) (not bm!65761) (not b!1376866) (not bm!65760) (not b!1376863) (not start!116944) (not b!1376861) (not b!1376859) (not b!1376865) (not b!1376860))
(check-sat)
