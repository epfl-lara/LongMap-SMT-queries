; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116704 () Bool)

(assert start!116704)

(declare-fun b!1375412 () Bool)

(declare-datatypes ((Unit!45390 0))(
  ( (Unit!45391) )
))
(declare-fun e!779169 () Unit!45390)

(declare-fun lt!604230 () Unit!45390)

(assert (=> b!1375412 (= e!779169 lt!604230)))

(declare-fun lt!604223 () Unit!45390)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93327 0))(
  ( (array!93328 (arr!45067 (Array (_ BitVec 32) (_ BitVec 64))) (size!45619 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93327)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93327 (_ BitVec 32) (_ BitVec 32)) Unit!45390)

(assert (=> b!1375412 (= lt!604223 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65660 () (_ BitVec 32))

(declare-fun lt!604229 () (_ BitVec 32))

(assert (=> b!1375412 (= call!65660 lt!604229)))

(declare-fun lt!604224 () array!93327)

(assert (=> b!1375412 (= lt!604230 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604224 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65661 () (_ BitVec 32))

(declare-fun lt!604225 () (_ BitVec 32))

(assert (=> b!1375412 (= call!65661 lt!604225)))

(declare-fun b!1375413 () Bool)

(declare-fun e!779167 () Bool)

(declare-fun e!779166 () Bool)

(assert (=> b!1375413 (= e!779167 e!779166)))

(declare-fun res!918509 () Bool)

(assert (=> b!1375413 (=> (not res!918509) (not e!779166))))

(assert (=> b!1375413 (= res!918509 (and (= lt!604225 lt!604229) (not (= to!206 (size!45619 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93327 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375413 (= lt!604229 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375413 (= lt!604225 (arrayCountValidKeys!0 lt!604224 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375413 (= lt!604224 (array!93328 (store (arr!45067 a!4032) i!1445 k0!2947) (size!45619 a!4032)))))

(declare-fun b!1375414 () Bool)

(declare-fun res!918510 () Bool)

(assert (=> b!1375414 (=> (not res!918510) (not e!779167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375414 (= res!918510 (validKeyInArray!0 (select (arr!45067 a!4032) i!1445)))))

(declare-fun res!918511 () Bool)

(assert (=> start!116704 (=> (not res!918511) (not e!779167))))

(assert (=> start!116704 (= res!918511 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45619 a!4032))))))

(assert (=> start!116704 e!779167))

(assert (=> start!116704 true))

(declare-fun array_inv!34300 (array!93327) Bool)

(assert (=> start!116704 (array_inv!34300 a!4032)))

(declare-fun bm!65657 () Bool)

(assert (=> bm!65657 (= call!65661 (arrayCountValidKeys!0 lt!604224 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375415 () Bool)

(declare-fun e!779168 () Bool)

(assert (=> b!1375415 (= e!779168 false)))

(declare-fun lt!604231 () (_ BitVec 32))

(assert (=> b!1375415 (= lt!604231 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604226 () (_ BitVec 32))

(assert (=> b!1375415 (= lt!604226 (arrayCountValidKeys!0 lt!604224 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375416 () Bool)

(assert (=> b!1375416 (= e!779166 e!779168)))

(declare-fun res!918507 () Bool)

(assert (=> b!1375416 (=> (not res!918507) (not e!779168))))

(assert (=> b!1375416 (= res!918507 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45619 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604227 () Unit!45390)

(assert (=> b!1375416 (= lt!604227 e!779169)))

(declare-fun c!127895 () Bool)

(assert (=> b!1375416 (= c!127895 (validKeyInArray!0 (select (arr!45067 a!4032) to!206)))))

(declare-fun bm!65658 () Bool)

(assert (=> bm!65658 (= call!65660 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375417 () Bool)

(declare-fun res!918512 () Bool)

(assert (=> b!1375417 (=> (not res!918512) (not e!779167))))

(assert (=> b!1375417 (= res!918512 (and (bvslt (size!45619 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45619 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375418 () Bool)

(declare-fun lt!604232 () Unit!45390)

(assert (=> b!1375418 (= e!779169 lt!604232)))

(declare-fun lt!604228 () Unit!45390)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93327 (_ BitVec 32) (_ BitVec 32)) Unit!45390)

(assert (=> b!1375418 (= lt!604228 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375418 (= call!65660 (bvadd #b00000000000000000000000000000001 lt!604229))))

(assert (=> b!1375418 (= lt!604232 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604224 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375418 (= call!65661 (bvadd #b00000000000000000000000000000001 lt!604225))))

(declare-fun b!1375419 () Bool)

(declare-fun res!918508 () Bool)

(assert (=> b!1375419 (=> (not res!918508) (not e!779167))))

(assert (=> b!1375419 (= res!918508 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!116704 res!918511) b!1375414))

(assert (= (and b!1375414 res!918510) b!1375419))

(assert (= (and b!1375419 res!918508) b!1375417))

(assert (= (and b!1375417 res!918512) b!1375413))

(assert (= (and b!1375413 res!918509) b!1375416))

(assert (= (and b!1375416 c!127895) b!1375418))

(assert (= (and b!1375416 (not c!127895)) b!1375412))

(assert (= (or b!1375418 b!1375412) bm!65657))

(assert (= (or b!1375418 b!1375412) bm!65658))

(assert (= (and b!1375416 res!918507) b!1375415))

(declare-fun m!1258809 () Bool)

(assert (=> b!1375413 m!1258809))

(declare-fun m!1258811 () Bool)

(assert (=> b!1375413 m!1258811))

(declare-fun m!1258813 () Bool)

(assert (=> b!1375413 m!1258813))

(declare-fun m!1258815 () Bool)

(assert (=> b!1375414 m!1258815))

(assert (=> b!1375414 m!1258815))

(declare-fun m!1258817 () Bool)

(assert (=> b!1375414 m!1258817))

(declare-fun m!1258819 () Bool)

(assert (=> b!1375412 m!1258819))

(declare-fun m!1258821 () Bool)

(assert (=> b!1375412 m!1258821))

(declare-fun m!1258823 () Bool)

(assert (=> bm!65657 m!1258823))

(declare-fun m!1258825 () Bool)

(assert (=> start!116704 m!1258825))

(declare-fun m!1258827 () Bool)

(assert (=> b!1375419 m!1258827))

(declare-fun m!1258829 () Bool)

(assert (=> bm!65658 m!1258829))

(declare-fun m!1258831 () Bool)

(assert (=> b!1375416 m!1258831))

(assert (=> b!1375416 m!1258831))

(declare-fun m!1258833 () Bool)

(assert (=> b!1375416 m!1258833))

(declare-fun m!1258835 () Bool)

(assert (=> b!1375418 m!1258835))

(declare-fun m!1258837 () Bool)

(assert (=> b!1375418 m!1258837))

(assert (=> b!1375415 m!1258829))

(assert (=> b!1375415 m!1258823))

(check-sat (not b!1375418) (not bm!65657) (not b!1375414) (not bm!65658) (not b!1375412) (not start!116704) (not b!1375419) (not b!1375413) (not b!1375416) (not b!1375415))
(check-sat)
