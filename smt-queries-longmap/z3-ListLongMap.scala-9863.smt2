; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116866 () Bool)

(assert start!116866)

(declare-fun b!1377112 () Bool)

(declare-fun res!919917 () Bool)

(declare-fun e!780070 () Bool)

(assert (=> b!1377112 (=> (not res!919917) (not e!780070))))

(declare-datatypes ((array!93535 0))(
  ( (array!93536 (arr!45171 (Array (_ BitVec 32) (_ BitVec 64))) (size!45721 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93535)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377112 (= res!919917 (validKeyInArray!0 (select (arr!45171 a!4032) i!1445)))))

(declare-fun b!1377113 () Bool)

(declare-datatypes ((Unit!45659 0))(
  ( (Unit!45660) )
))
(declare-fun e!780068 () Unit!45659)

(declare-fun lt!605723 () Unit!45659)

(assert (=> b!1377113 (= e!780068 lt!605723)))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605726 () Unit!45659)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93535 (_ BitVec 32) (_ BitVec 32)) Unit!45659)

(assert (=> b!1377113 (= lt!605726 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65936 () (_ BitVec 32))

(declare-fun lt!605725 () (_ BitVec 32))

(assert (=> b!1377113 (= call!65936 lt!605725)))

(declare-fun lt!605721 () array!93535)

(assert (=> b!1377113 (= lt!605723 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605721 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65935 () (_ BitVec 32))

(declare-fun lt!605724 () (_ BitVec 32))

(assert (=> b!1377113 (= call!65935 lt!605724)))

(declare-fun res!919914 () Bool)

(assert (=> start!116866 (=> (not res!919914) (not e!780070))))

(assert (=> start!116866 (= res!919914 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45721 a!4032))))))

(assert (=> start!116866 e!780070))

(assert (=> start!116866 true))

(declare-fun array_inv!34199 (array!93535) Bool)

(assert (=> start!116866 (array_inv!34199 a!4032)))

(declare-fun b!1377114 () Bool)

(declare-fun e!780067 () Bool)

(assert (=> b!1377114 (= e!780070 e!780067)))

(declare-fun res!919918 () Bool)

(assert (=> b!1377114 (=> (not res!919918) (not e!780067))))

(assert (=> b!1377114 (= res!919918 (and (= lt!605724 lt!605725) (not (= to!206 (size!45721 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93535 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377114 (= lt!605725 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377114 (= lt!605724 (arrayCountValidKeys!0 lt!605721 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1377114 (= lt!605721 (array!93536 (store (arr!45171 a!4032) i!1445 k0!2947) (size!45721 a!4032)))))

(declare-fun b!1377115 () Bool)

(declare-fun res!919916 () Bool)

(assert (=> b!1377115 (=> (not res!919916) (not e!780070))))

(assert (=> b!1377115 (= res!919916 (not (validKeyInArray!0 k0!2947)))))

(declare-fun bm!65932 () Bool)

(assert (=> bm!65932 (= call!65935 (arrayCountValidKeys!0 lt!605721 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65933 () Bool)

(assert (=> bm!65933 (= call!65936 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377116 () Bool)

(assert (=> b!1377116 (= e!780067 (or (bvslt (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) (size!45721 a!4032)) (bvsle (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605728 () Unit!45659)

(assert (=> b!1377116 (= lt!605728 e!780068)))

(declare-fun c!128039 () Bool)

(assert (=> b!1377116 (= c!128039 (validKeyInArray!0 (select (arr!45171 a!4032) to!206)))))

(declare-fun b!1377117 () Bool)

(declare-fun res!919915 () Bool)

(assert (=> b!1377117 (=> (not res!919915) (not e!780070))))

(assert (=> b!1377117 (= res!919915 (and (bvslt (size!45721 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45721 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377118 () Bool)

(declare-fun lt!605727 () Unit!45659)

(assert (=> b!1377118 (= e!780068 lt!605727)))

(declare-fun lt!605722 () Unit!45659)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93535 (_ BitVec 32) (_ BitVec 32)) Unit!45659)

(assert (=> b!1377118 (= lt!605722 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377118 (= call!65936 (bvadd #b00000000000000000000000000000001 lt!605725))))

(assert (=> b!1377118 (= lt!605727 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605721 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377118 (= call!65935 (bvadd #b00000000000000000000000000000001 lt!605724))))

(assert (= (and start!116866 res!919914) b!1377112))

(assert (= (and b!1377112 res!919917) b!1377115))

(assert (= (and b!1377115 res!919916) b!1377117))

(assert (= (and b!1377117 res!919915) b!1377114))

(assert (= (and b!1377114 res!919918) b!1377116))

(assert (= (and b!1377116 c!128039) b!1377118))

(assert (= (and b!1377116 (not c!128039)) b!1377113))

(assert (= (or b!1377118 b!1377113) bm!65933))

(assert (= (or b!1377118 b!1377113) bm!65932))

(declare-fun m!1261321 () Bool)

(assert (=> b!1377113 m!1261321))

(declare-fun m!1261323 () Bool)

(assert (=> b!1377113 m!1261323))

(declare-fun m!1261325 () Bool)

(assert (=> start!116866 m!1261325))

(declare-fun m!1261327 () Bool)

(assert (=> b!1377115 m!1261327))

(declare-fun m!1261329 () Bool)

(assert (=> b!1377116 m!1261329))

(assert (=> b!1377116 m!1261329))

(declare-fun m!1261331 () Bool)

(assert (=> b!1377116 m!1261331))

(declare-fun m!1261333 () Bool)

(assert (=> b!1377112 m!1261333))

(assert (=> b!1377112 m!1261333))

(declare-fun m!1261335 () Bool)

(assert (=> b!1377112 m!1261335))

(declare-fun m!1261337 () Bool)

(assert (=> b!1377118 m!1261337))

(declare-fun m!1261339 () Bool)

(assert (=> b!1377118 m!1261339))

(declare-fun m!1261341 () Bool)

(assert (=> bm!65932 m!1261341))

(declare-fun m!1261343 () Bool)

(assert (=> b!1377114 m!1261343))

(declare-fun m!1261345 () Bool)

(assert (=> b!1377114 m!1261345))

(declare-fun m!1261347 () Bool)

(assert (=> b!1377114 m!1261347))

(declare-fun m!1261349 () Bool)

(assert (=> bm!65933 m!1261349))

(check-sat (not bm!65932) (not bm!65933) (not b!1377113) (not b!1377115) (not b!1377118) (not b!1377112) (not b!1377114) (not b!1377116) (not start!116866))
(check-sat)
