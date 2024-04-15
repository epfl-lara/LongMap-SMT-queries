; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116860 () Bool)

(assert start!116860)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun bm!65909 () Bool)

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93483 0))(
  ( (array!93484 (arr!45145 (Array (_ BitVec 32) (_ BitVec 64))) (size!45697 (_ BitVec 32))) )
))
(declare-fun lt!605520 () array!93483)

(declare-fun call!65912 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93483 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65909 (= call!65912 (arrayCountValidKeys!0 lt!605520 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377030 () Bool)

(declare-datatypes ((Unit!45498 0))(
  ( (Unit!45499) )
))
(declare-fun e!780030 () Unit!45498)

(declare-fun lt!605516 () Unit!45498)

(assert (=> b!1377030 (= e!780030 lt!605516)))

(declare-fun lt!605519 () Unit!45498)

(declare-fun a!4032 () array!93483)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93483 (_ BitVec 32) (_ BitVec 32)) Unit!45498)

(assert (=> b!1377030 (= lt!605519 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65913 () (_ BitVec 32))

(declare-fun lt!605522 () (_ BitVec 32))

(assert (=> b!1377030 (= call!65913 (bvadd #b00000000000000000000000000000001 lt!605522))))

(assert (=> b!1377030 (= lt!605516 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605520 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605521 () (_ BitVec 32))

(assert (=> b!1377030 (= call!65912 (bvadd #b00000000000000000000000000000001 lt!605521))))

(declare-fun b!1377031 () Bool)

(declare-fun res!919875 () Bool)

(declare-fun e!780028 () Bool)

(assert (=> b!1377031 (=> (not res!919875) (not e!780028))))

(assert (=> b!1377031 (= res!919875 (and (bvslt (size!45697 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45697 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377032 () Bool)

(declare-fun lt!605518 () Unit!45498)

(assert (=> b!1377032 (= e!780030 lt!605518)))

(declare-fun lt!605517 () Unit!45498)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93483 (_ BitVec 32) (_ BitVec 32)) Unit!45498)

(assert (=> b!1377032 (= lt!605517 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377032 (= call!65913 lt!605522)))

(assert (=> b!1377032 (= lt!605518 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605520 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377032 (= call!65912 lt!605521)))

(declare-fun bm!65910 () Bool)

(assert (=> bm!65910 (= call!65913 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377034 () Bool)

(declare-fun res!919874 () Bool)

(assert (=> b!1377034 (=> (not res!919874) (not e!780028))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377034 (= res!919874 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377033 () Bool)

(declare-fun e!780031 () Bool)

(assert (=> b!1377033 (= e!780031 (or (bvslt (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) (size!45697 a!4032)) (bvsle (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605515 () Unit!45498)

(assert (=> b!1377033 (= lt!605515 e!780030)))

(declare-fun c!128021 () Bool)

(assert (=> b!1377033 (= c!128021 (validKeyInArray!0 (select (arr!45145 a!4032) to!206)))))

(declare-fun res!919876 () Bool)

(assert (=> start!116860 (=> (not res!919876) (not e!780028))))

(assert (=> start!116860 (= res!919876 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45697 a!4032))))))

(assert (=> start!116860 e!780028))

(assert (=> start!116860 true))

(declare-fun array_inv!34378 (array!93483) Bool)

(assert (=> start!116860 (array_inv!34378 a!4032)))

(declare-fun b!1377035 () Bool)

(assert (=> b!1377035 (= e!780028 e!780031)))

(declare-fun res!919877 () Bool)

(assert (=> b!1377035 (=> (not res!919877) (not e!780031))))

(assert (=> b!1377035 (= res!919877 (and (= lt!605521 lt!605522) (not (= to!206 (size!45697 a!4032)))))))

(assert (=> b!1377035 (= lt!605522 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377035 (= lt!605521 (arrayCountValidKeys!0 lt!605520 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377035 (= lt!605520 (array!93484 (store (arr!45145 a!4032) i!1445 k0!2947) (size!45697 a!4032)))))

(declare-fun b!1377036 () Bool)

(declare-fun res!919873 () Bool)

(assert (=> b!1377036 (=> (not res!919873) (not e!780028))))

(assert (=> b!1377036 (= res!919873 (validKeyInArray!0 (select (arr!45145 a!4032) i!1445)))))

(assert (= (and start!116860 res!919876) b!1377036))

(assert (= (and b!1377036 res!919873) b!1377034))

(assert (= (and b!1377034 res!919874) b!1377031))

(assert (= (and b!1377031 res!919875) b!1377035))

(assert (= (and b!1377035 res!919877) b!1377033))

(assert (= (and b!1377033 c!128021) b!1377030))

(assert (= (and b!1377033 (not c!128021)) b!1377032))

(assert (= (or b!1377030 b!1377032) bm!65910))

(assert (= (or b!1377030 b!1377032) bm!65909))

(declare-fun m!1260797 () Bool)

(assert (=> b!1377030 m!1260797))

(declare-fun m!1260799 () Bool)

(assert (=> b!1377030 m!1260799))

(declare-fun m!1260801 () Bool)

(assert (=> b!1377034 m!1260801))

(declare-fun m!1260803 () Bool)

(assert (=> bm!65909 m!1260803))

(declare-fun m!1260805 () Bool)

(assert (=> bm!65910 m!1260805))

(declare-fun m!1260807 () Bool)

(assert (=> b!1377036 m!1260807))

(assert (=> b!1377036 m!1260807))

(declare-fun m!1260809 () Bool)

(assert (=> b!1377036 m!1260809))

(declare-fun m!1260811 () Bool)

(assert (=> b!1377033 m!1260811))

(assert (=> b!1377033 m!1260811))

(declare-fun m!1260813 () Bool)

(assert (=> b!1377033 m!1260813))

(declare-fun m!1260815 () Bool)

(assert (=> b!1377035 m!1260815))

(declare-fun m!1260817 () Bool)

(assert (=> b!1377035 m!1260817))

(declare-fun m!1260819 () Bool)

(assert (=> b!1377035 m!1260819))

(declare-fun m!1260821 () Bool)

(assert (=> b!1377032 m!1260821))

(declare-fun m!1260823 () Bool)

(assert (=> b!1377032 m!1260823))

(declare-fun m!1260825 () Bool)

(assert (=> start!116860 m!1260825))

(check-sat (not b!1377033) (not b!1377034) (not b!1377036) (not b!1377032) (not b!1377030) (not bm!65909) (not b!1377035) (not start!116860) (not bm!65910))
(check-sat)
