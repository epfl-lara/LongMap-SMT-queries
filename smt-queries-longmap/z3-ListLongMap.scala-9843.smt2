; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116974 () Bool)

(assert start!116974)

(declare-fun res!919385 () Bool)

(declare-fun e!780319 () Bool)

(assert (=> start!116974 (=> (not res!919385) (not e!780319))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93529 0))(
  ( (array!93530 (arr!45163 (Array (_ BitVec 32) (_ BitVec 64))) (size!45714 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93529)

(assert (=> start!116974 (= res!919385 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45714 a!4032))))))

(assert (=> start!116974 e!780319))

(assert (=> start!116974 true))

(declare-fun array_inv!34444 (array!93529) Bool)

(assert (=> start!116974 (array_inv!34444 a!4032)))

(declare-fun b!1377221 () Bool)

(declare-fun res!919381 () Bool)

(declare-fun e!780316 () Bool)

(assert (=> b!1377221 (=> (not res!919381) (not e!780316))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605427 () array!93529)

(declare-fun arrayCountValidKeys!0 (array!93529 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377221 (= res!919381 (= (arrayCountValidKeys!0 lt!605427 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1377222 () Bool)

(declare-datatypes ((Unit!45524 0))(
  ( (Unit!45525) )
))
(declare-fun e!780318 () Unit!45524)

(declare-fun lt!605425 () Unit!45524)

(assert (=> b!1377222 (= e!780318 lt!605425)))

(declare-fun lt!605430 () Unit!45524)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93529 (_ BitVec 32) (_ BitVec 32)) Unit!45524)

(assert (=> b!1377222 (= lt!605430 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65853 () (_ BitVec 32))

(declare-fun lt!605426 () (_ BitVec 32))

(assert (=> b!1377222 (= call!65853 (bvadd #b00000000000000000000000000000001 lt!605426))))

(assert (=> b!1377222 (= lt!605425 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605427 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65854 () (_ BitVec 32))

(declare-fun lt!605433 () (_ BitVec 32))

(assert (=> b!1377222 (= call!65854 (bvadd #b00000000000000000000000000000001 lt!605433))))

(declare-fun b!1377223 () Bool)

(assert (=> b!1377223 (= e!780316 (not (bvsge (bvadd #b00000000000000000000000000000001 i!1445) #b00000000000000000000000000000000)))))

(assert (=> b!1377223 (= (arrayCountValidKeys!0 lt!605427 (bvadd #b00000000000000000000000000000001 i!1445) (size!45714 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45714 a!4032)))))

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun lt!605428 () Unit!45524)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93529 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45524)

(assert (=> b!1377223 (= lt!605428 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377224 () Bool)

(declare-fun lt!605431 () Unit!45524)

(assert (=> b!1377224 (= e!780318 lt!605431)))

(declare-fun lt!605432 () Unit!45524)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93529 (_ BitVec 32) (_ BitVec 32)) Unit!45524)

(assert (=> b!1377224 (= lt!605432 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377224 (= call!65854 lt!605426)))

(assert (=> b!1377224 (= lt!605431 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605427 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377224 (= call!65853 lt!605433)))

(declare-fun b!1377225 () Bool)

(declare-fun e!780317 () Bool)

(assert (=> b!1377225 (= e!780319 e!780317)))

(declare-fun res!919382 () Bool)

(assert (=> b!1377225 (=> (not res!919382) (not e!780317))))

(assert (=> b!1377225 (= res!919382 (and (= lt!605433 lt!605426) (not (= to!206 (size!45714 a!4032)))))))

(assert (=> b!1377225 (= lt!605426 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377225 (= lt!605433 (arrayCountValidKeys!0 lt!605427 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377225 (= lt!605427 (array!93530 (store (arr!45163 a!4032) i!1445 k0!2947) (size!45714 a!4032)))))

(declare-fun b!1377226 () Bool)

(declare-fun res!919386 () Bool)

(assert (=> b!1377226 (=> (not res!919386) (not e!780319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377226 (= res!919386 (validKeyInArray!0 (select (arr!45163 a!4032) i!1445)))))

(declare-fun b!1377227 () Bool)

(assert (=> b!1377227 (= e!780317 e!780316)))

(declare-fun res!919384 () Bool)

(assert (=> b!1377227 (=> (not res!919384) (not e!780316))))

(assert (=> b!1377227 (= res!919384 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45714 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605429 () Unit!45524)

(assert (=> b!1377227 (= lt!605429 e!780318)))

(declare-fun c!128368 () Bool)

(assert (=> b!1377227 (= c!128368 (validKeyInArray!0 (select (arr!45163 a!4032) to!206)))))

(declare-fun bm!65850 () Bool)

(assert (=> bm!65850 (= call!65853 (arrayCountValidKeys!0 (ite c!128368 a!4032 lt!605427) (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377228 () Bool)

(declare-fun res!919380 () Bool)

(assert (=> b!1377228 (=> (not res!919380) (not e!780319))))

(assert (=> b!1377228 (= res!919380 (and (bvslt (size!45714 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45714 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun bm!65851 () Bool)

(assert (=> bm!65851 (= call!65854 (arrayCountValidKeys!0 (ite c!128368 lt!605427 a!4032) (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377229 () Bool)

(declare-fun res!919383 () Bool)

(assert (=> b!1377229 (=> (not res!919383) (not e!780319))))

(assert (=> b!1377229 (= res!919383 (not (validKeyInArray!0 k0!2947)))))

(assert (= (and start!116974 res!919385) b!1377226))

(assert (= (and b!1377226 res!919386) b!1377229))

(assert (= (and b!1377229 res!919383) b!1377228))

(assert (= (and b!1377228 res!919380) b!1377225))

(assert (= (and b!1377225 res!919382) b!1377227))

(assert (= (and b!1377227 c!128368) b!1377222))

(assert (= (and b!1377227 (not c!128368)) b!1377224))

(assert (= (or b!1377222 b!1377224) bm!65850))

(assert (= (or b!1377222 b!1377224) bm!65851))

(assert (= (and b!1377227 res!919384) b!1377221))

(assert (= (and b!1377221 res!919381) b!1377223))

(declare-fun m!1261479 () Bool)

(assert (=> b!1377229 m!1261479))

(declare-fun m!1261481 () Bool)

(assert (=> start!116974 m!1261481))

(declare-fun m!1261483 () Bool)

(assert (=> b!1377224 m!1261483))

(declare-fun m!1261485 () Bool)

(assert (=> b!1377224 m!1261485))

(declare-fun m!1261487 () Bool)

(assert (=> b!1377226 m!1261487))

(assert (=> b!1377226 m!1261487))

(declare-fun m!1261489 () Bool)

(assert (=> b!1377226 m!1261489))

(declare-fun m!1261491 () Bool)

(assert (=> b!1377221 m!1261491))

(declare-fun m!1261493 () Bool)

(assert (=> b!1377221 m!1261493))

(declare-fun m!1261495 () Bool)

(assert (=> b!1377227 m!1261495))

(assert (=> b!1377227 m!1261495))

(declare-fun m!1261497 () Bool)

(assert (=> b!1377227 m!1261497))

(declare-fun m!1261499 () Bool)

(assert (=> b!1377222 m!1261499))

(declare-fun m!1261501 () Bool)

(assert (=> b!1377222 m!1261501))

(declare-fun m!1261503 () Bool)

(assert (=> bm!65851 m!1261503))

(declare-fun m!1261505 () Bool)

(assert (=> b!1377225 m!1261505))

(declare-fun m!1261507 () Bool)

(assert (=> b!1377225 m!1261507))

(declare-fun m!1261509 () Bool)

(assert (=> b!1377225 m!1261509))

(declare-fun m!1261511 () Bool)

(assert (=> bm!65850 m!1261511))

(declare-fun m!1261513 () Bool)

(assert (=> b!1377223 m!1261513))

(declare-fun m!1261515 () Bool)

(assert (=> b!1377223 m!1261515))

(declare-fun m!1261517 () Bool)

(assert (=> b!1377223 m!1261517))

(check-sat (not b!1377225) (not b!1377227) (not b!1377221) (not b!1377226) (not b!1377222) (not bm!65851) (not b!1377223) (not b!1377224) (not bm!65850) (not start!116974) (not b!1377229))
(check-sat)
