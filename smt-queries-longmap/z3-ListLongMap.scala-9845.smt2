; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116986 () Bool)

(assert start!116986)

(declare-fun b!1377383 () Bool)

(declare-fun e!780409 () Bool)

(declare-fun e!780405 () Bool)

(assert (=> b!1377383 (= e!780409 e!780405)))

(declare-fun res!919512 () Bool)

(assert (=> b!1377383 (=> (not res!919512) (not e!780405))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93541 0))(
  ( (array!93542 (arr!45169 (Array (_ BitVec 32) (_ BitVec 64))) (size!45720 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93541)

(assert (=> b!1377383 (= res!919512 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45720 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45536 0))(
  ( (Unit!45537) )
))
(declare-fun lt!605591 () Unit!45536)

(declare-fun e!780407 () Unit!45536)

(assert (=> b!1377383 (= lt!605591 e!780407)))

(declare-fun c!128386 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377383 (= c!128386 (validKeyInArray!0 (select (arr!45169 a!4032) to!206)))))

(declare-fun b!1377384 () Bool)

(declare-fun res!919510 () Bool)

(declare-fun e!780406 () Bool)

(assert (=> b!1377384 (=> (not res!919510) (not e!780406))))

(assert (=> b!1377384 (= res!919510 (and (bvslt (size!45720 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45720 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377385 () Bool)

(declare-fun lt!605590 () Unit!45536)

(assert (=> b!1377385 (= e!780407 lt!605590)))

(declare-fun lt!605588 () Unit!45536)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93541 (_ BitVec 32) (_ BitVec 32)) Unit!45536)

(assert (=> b!1377385 (= lt!605588 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65889 () (_ BitVec 32))

(declare-fun lt!605594 () (_ BitVec 32))

(assert (=> b!1377385 (= call!65889 (bvadd #b00000000000000000000000000000001 lt!605594))))

(declare-fun lt!605592 () array!93541)

(assert (=> b!1377385 (= lt!605590 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605592 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65890 () (_ BitVec 32))

(declare-fun lt!605595 () (_ BitVec 32))

(assert (=> b!1377385 (= call!65890 (bvadd #b00000000000000000000000000000001 lt!605595))))

(declare-fun res!919507 () Bool)

(assert (=> start!116986 (=> (not res!919507) (not e!780406))))

(assert (=> start!116986 (= res!919507 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45720 a!4032))))))

(assert (=> start!116986 e!780406))

(assert (=> start!116986 true))

(declare-fun array_inv!34450 (array!93541) Bool)

(assert (=> start!116986 (array_inv!34450 a!4032)))

(declare-fun b!1377386 () Bool)

(declare-fun lt!605589 () Unit!45536)

(assert (=> b!1377386 (= e!780407 lt!605589)))

(declare-fun lt!605593 () Unit!45536)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93541 (_ BitVec 32) (_ BitVec 32)) Unit!45536)

(assert (=> b!1377386 (= lt!605593 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377386 (= call!65889 lt!605594)))

(assert (=> b!1377386 (= lt!605589 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605592 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377386 (= call!65890 lt!605595)))

(declare-fun bm!65886 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93541 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65886 (= call!65890 (arrayCountValidKeys!0 lt!605592 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377387 () Bool)

(declare-fun res!919508 () Bool)

(assert (=> b!1377387 (=> (not res!919508) (not e!780406))))

(assert (=> b!1377387 (= res!919508 (validKeyInArray!0 (select (arr!45169 a!4032) i!1445)))))

(declare-fun bm!65887 () Bool)

(assert (=> bm!65887 (= call!65889 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377388 () Bool)

(assert (=> b!1377388 (= e!780405 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (=> b!1377388 (= (arrayCountValidKeys!0 lt!605592 (bvadd #b00000000000000000000000000000001 i!1445) (size!45720 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45720 a!4032)))))

(declare-fun lt!605587 () Unit!45536)

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93541 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45536)

(assert (=> b!1377388 (= lt!605587 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377389 () Bool)

(declare-fun res!919506 () Bool)

(assert (=> b!1377389 (=> (not res!919506) (not e!780406))))

(assert (=> b!1377389 (= res!919506 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377390 () Bool)

(declare-fun res!919511 () Bool)

(assert (=> b!1377390 (=> (not res!919511) (not e!780405))))

(assert (=> b!1377390 (= res!919511 (= (arrayCountValidKeys!0 lt!605592 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1377391 () Bool)

(assert (=> b!1377391 (= e!780406 e!780409)))

(declare-fun res!919509 () Bool)

(assert (=> b!1377391 (=> (not res!919509) (not e!780409))))

(assert (=> b!1377391 (= res!919509 (and (= lt!605595 lt!605594) (not (= to!206 (size!45720 a!4032)))))))

(assert (=> b!1377391 (= lt!605594 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377391 (= lt!605595 (arrayCountValidKeys!0 lt!605592 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377391 (= lt!605592 (array!93542 (store (arr!45169 a!4032) i!1445 k0!2947) (size!45720 a!4032)))))

(assert (= (and start!116986 res!919507) b!1377387))

(assert (= (and b!1377387 res!919508) b!1377389))

(assert (= (and b!1377389 res!919506) b!1377384))

(assert (= (and b!1377384 res!919510) b!1377391))

(assert (= (and b!1377391 res!919509) b!1377383))

(assert (= (and b!1377383 c!128386) b!1377385))

(assert (= (and b!1377383 (not c!128386)) b!1377386))

(assert (= (or b!1377385 b!1377386) bm!65887))

(assert (= (or b!1377385 b!1377386) bm!65886))

(assert (= (and b!1377383 res!919512) b!1377390))

(assert (= (and b!1377390 res!919511) b!1377388))

(declare-fun m!1261703 () Bool)

(assert (=> b!1377386 m!1261703))

(declare-fun m!1261705 () Bool)

(assert (=> b!1377386 m!1261705))

(declare-fun m!1261707 () Bool)

(assert (=> b!1377391 m!1261707))

(declare-fun m!1261709 () Bool)

(assert (=> b!1377391 m!1261709))

(declare-fun m!1261711 () Bool)

(assert (=> b!1377391 m!1261711))

(declare-fun m!1261713 () Bool)

(assert (=> bm!65887 m!1261713))

(declare-fun m!1261715 () Bool)

(assert (=> b!1377383 m!1261715))

(assert (=> b!1377383 m!1261715))

(declare-fun m!1261717 () Bool)

(assert (=> b!1377383 m!1261717))

(declare-fun m!1261719 () Bool)

(assert (=> b!1377389 m!1261719))

(declare-fun m!1261721 () Bool)

(assert (=> b!1377390 m!1261721))

(assert (=> b!1377390 m!1261713))

(assert (=> bm!65886 m!1261721))

(declare-fun m!1261723 () Bool)

(assert (=> b!1377387 m!1261723))

(assert (=> b!1377387 m!1261723))

(declare-fun m!1261725 () Bool)

(assert (=> b!1377387 m!1261725))

(declare-fun m!1261727 () Bool)

(assert (=> b!1377388 m!1261727))

(declare-fun m!1261729 () Bool)

(assert (=> b!1377388 m!1261729))

(declare-fun m!1261731 () Bool)

(assert (=> b!1377388 m!1261731))

(declare-fun m!1261733 () Bool)

(assert (=> start!116986 m!1261733))

(declare-fun m!1261735 () Bool)

(assert (=> b!1377385 m!1261735))

(declare-fun m!1261737 () Bool)

(assert (=> b!1377385 m!1261737))

(check-sat (not start!116986) (not b!1377389) (not bm!65887) (not b!1377385) (not b!1377391) (not bm!65886) (not b!1377383) (not b!1377387) (not b!1377388) (not b!1377390) (not b!1377386))
(check-sat)
