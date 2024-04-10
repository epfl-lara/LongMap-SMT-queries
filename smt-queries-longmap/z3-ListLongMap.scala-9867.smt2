; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116890 () Bool)

(assert start!116890)

(declare-fun call!66007 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93559 0))(
  ( (array!93560 (arr!45183 (Array (_ BitVec 32) (_ BitVec 64))) (size!45733 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93559)

(declare-fun bm!66004 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93559 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66004 (= call!66007 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377419 () Bool)

(declare-fun res!920155 () Bool)

(declare-fun e!780245 () Bool)

(assert (=> b!1377419 (=> (not res!920155) (not e!780245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377419 (= res!920155 (validKeyInArray!0 (select (arr!45183 a!4032) i!1445)))))

(declare-fun bm!66005 () Bool)

(declare-fun lt!606025 () array!93559)

(declare-fun call!66008 () (_ BitVec 32))

(assert (=> bm!66005 (= call!66008 (arrayCountValidKeys!0 lt!606025 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!920150 () Bool)

(assert (=> start!116890 (=> (not res!920150) (not e!780245))))

(assert (=> start!116890 (= res!920150 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45733 a!4032))))))

(assert (=> start!116890 e!780245))

(assert (=> start!116890 true))

(declare-fun array_inv!34211 (array!93559) Bool)

(assert (=> start!116890 (array_inv!34211 a!4032)))

(declare-fun b!1377420 () Bool)

(declare-fun res!920149 () Bool)

(declare-fun e!780244 () Bool)

(assert (=> b!1377420 (=> (not res!920149) (not e!780244))))

(assert (=> b!1377420 (= res!920149 (= (arrayCountValidKeys!0 lt!606025 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1377421 () Bool)

(declare-fun res!920154 () Bool)

(assert (=> b!1377421 (=> (not res!920154) (not e!780245))))

(assert (=> b!1377421 (= res!920154 (and (bvslt (size!45733 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45733 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377422 () Bool)

(declare-datatypes ((Unit!45683 0))(
  ( (Unit!45684) )
))
(declare-fun e!780247 () Unit!45683)

(declare-fun lt!606030 () Unit!45683)

(assert (=> b!1377422 (= e!780247 lt!606030)))

(declare-fun lt!606024 () Unit!45683)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93559 (_ BitVec 32) (_ BitVec 32)) Unit!45683)

(assert (=> b!1377422 (= lt!606024 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!606031 () (_ BitVec 32))

(assert (=> b!1377422 (= call!66007 (bvadd #b00000000000000000000000000000001 lt!606031))))

(assert (=> b!1377422 (= lt!606030 (lemmaValidKeyIncreasesNumOfKeys!0 lt!606025 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!606029 () (_ BitVec 32))

(assert (=> b!1377422 (= call!66008 (bvadd #b00000000000000000000000000000001 lt!606029))))

(declare-fun b!1377423 () Bool)

(declare-fun e!780246 () Bool)

(assert (=> b!1377423 (= e!780245 e!780246)))

(declare-fun res!920153 () Bool)

(assert (=> b!1377423 (=> (not res!920153) (not e!780246))))

(assert (=> b!1377423 (= res!920153 (and (= lt!606029 lt!606031) (not (= to!206 (size!45733 a!4032)))))))

(assert (=> b!1377423 (= lt!606031 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377423 (= lt!606029 (arrayCountValidKeys!0 lt!606025 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1377423 (= lt!606025 (array!93560 (store (arr!45183 a!4032) i!1445 k0!2947) (size!45733 a!4032)))))

(declare-fun b!1377424 () Bool)

(assert (=> b!1377424 (= e!780246 e!780244)))

(declare-fun res!920151 () Bool)

(assert (=> b!1377424 (=> (not res!920151) (not e!780244))))

(assert (=> b!1377424 (= res!920151 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45733 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!606028 () Unit!45683)

(assert (=> b!1377424 (= lt!606028 e!780247)))

(declare-fun c!128075 () Bool)

(assert (=> b!1377424 (= c!128075 (validKeyInArray!0 (select (arr!45183 a!4032) to!206)))))

(declare-fun b!1377425 () Bool)

(declare-fun lt!606026 () Unit!45683)

(assert (=> b!1377425 (= e!780247 lt!606026)))

(declare-fun lt!606023 () Unit!45683)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93559 (_ BitVec 32) (_ BitVec 32)) Unit!45683)

(assert (=> b!1377425 (= lt!606023 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377425 (= call!66007 lt!606031)))

(assert (=> b!1377425 (= lt!606026 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!606025 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377425 (= call!66008 lt!606029)))

(declare-fun b!1377426 () Bool)

(declare-fun res!920152 () Bool)

(assert (=> b!1377426 (=> (not res!920152) (not e!780245))))

(assert (=> b!1377426 (= res!920152 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377427 () Bool)

(assert (=> b!1377427 (= e!780244 (not true))))

(assert (=> b!1377427 (= (arrayCountValidKeys!0 lt!606025 (bvadd #b00000000000000000000000000000001 i!1445) (size!45733 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45733 a!4032)))))

(declare-fun lt!606027 () Unit!45683)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93559 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45683)

(assert (=> b!1377427 (= lt!606027 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116890 res!920150) b!1377419))

(assert (= (and b!1377419 res!920155) b!1377426))

(assert (= (and b!1377426 res!920152) b!1377421))

(assert (= (and b!1377421 res!920154) b!1377423))

(assert (= (and b!1377423 res!920153) b!1377424))

(assert (= (and b!1377424 c!128075) b!1377422))

(assert (= (and b!1377424 (not c!128075)) b!1377425))

(assert (= (or b!1377422 b!1377425) bm!66004))

(assert (= (or b!1377422 b!1377425) bm!66005))

(assert (= (and b!1377424 res!920151) b!1377420))

(assert (= (and b!1377420 res!920149) b!1377427))

(declare-fun m!1261709 () Bool)

(assert (=> b!1377423 m!1261709))

(declare-fun m!1261711 () Bool)

(assert (=> b!1377423 m!1261711))

(declare-fun m!1261713 () Bool)

(assert (=> b!1377423 m!1261713))

(declare-fun m!1261715 () Bool)

(assert (=> b!1377424 m!1261715))

(assert (=> b!1377424 m!1261715))

(declare-fun m!1261717 () Bool)

(assert (=> b!1377424 m!1261717))

(declare-fun m!1261719 () Bool)

(assert (=> b!1377420 m!1261719))

(declare-fun m!1261721 () Bool)

(assert (=> b!1377420 m!1261721))

(declare-fun m!1261723 () Bool)

(assert (=> b!1377425 m!1261723))

(declare-fun m!1261725 () Bool)

(assert (=> b!1377425 m!1261725))

(declare-fun m!1261727 () Bool)

(assert (=> start!116890 m!1261727))

(declare-fun m!1261729 () Bool)

(assert (=> b!1377426 m!1261729))

(declare-fun m!1261731 () Bool)

(assert (=> b!1377427 m!1261731))

(declare-fun m!1261733 () Bool)

(assert (=> b!1377427 m!1261733))

(declare-fun m!1261735 () Bool)

(assert (=> b!1377427 m!1261735))

(declare-fun m!1261737 () Bool)

(assert (=> b!1377422 m!1261737))

(declare-fun m!1261739 () Bool)

(assert (=> b!1377422 m!1261739))

(declare-fun m!1261741 () Bool)

(assert (=> b!1377419 m!1261741))

(assert (=> b!1377419 m!1261741))

(declare-fun m!1261743 () Bool)

(assert (=> b!1377419 m!1261743))

(assert (=> bm!66004 m!1261721))

(assert (=> bm!66005 m!1261719))

(check-sat (not bm!66004) (not b!1377419) (not b!1377422) (not b!1377420) (not start!116890) (not b!1377425) (not b!1377427) (not b!1377423) (not bm!66005) (not b!1377426) (not b!1377424))
(check-sat)
