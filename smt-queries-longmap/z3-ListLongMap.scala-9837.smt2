; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116710 () Bool)

(assert start!116710)

(declare-fun call!65684 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93379 0))(
  ( (array!93380 (arr!45093 (Array (_ BitVec 32) (_ BitVec 64))) (size!45643 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93379)

(declare-fun bm!65680 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93379 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65680 (= call!65684 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375497 () Bool)

(declare-datatypes ((Unit!45551 0))(
  ( (Unit!45552) )
))
(declare-fun e!779211 () Unit!45551)

(declare-fun lt!604442 () Unit!45551)

(assert (=> b!1375497 (= e!779211 lt!604442)))

(declare-fun lt!604439 () Unit!45551)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93379 (_ BitVec 32) (_ BitVec 32)) Unit!45551)

(assert (=> b!1375497 (= lt!604439 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!604444 () (_ BitVec 32))

(assert (=> b!1375497 (= call!65684 (bvadd #b00000000000000000000000000000001 lt!604444))))

(declare-fun lt!604438 () array!93379)

(assert (=> b!1375497 (= lt!604442 (lemmaValidKeyIncreasesNumOfKeys!0 lt!604438 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65683 () (_ BitVec 32))

(declare-fun lt!604437 () (_ BitVec 32))

(assert (=> b!1375497 (= call!65683 (bvadd #b00000000000000000000000000000001 lt!604437))))

(declare-fun res!918551 () Bool)

(declare-fun e!779210 () Bool)

(assert (=> start!116710 (=> (not res!918551) (not e!779210))))

(assert (=> start!116710 (= res!918551 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45643 a!4032))))))

(assert (=> start!116710 e!779210))

(assert (=> start!116710 true))

(declare-fun array_inv!34121 (array!93379) Bool)

(assert (=> start!116710 (array_inv!34121 a!4032)))

(declare-fun bm!65681 () Bool)

(assert (=> bm!65681 (= call!65683 (arrayCountValidKeys!0 lt!604438 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1375498 () Bool)

(declare-fun res!918553 () Bool)

(assert (=> b!1375498 (=> (not res!918553) (not e!779210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375498 (= res!918553 (validKeyInArray!0 (select (arr!45093 a!4032) i!1445)))))

(declare-fun b!1375499 () Bool)

(declare-fun lt!604435 () Unit!45551)

(assert (=> b!1375499 (= e!779211 lt!604435)))

(declare-fun lt!604443 () Unit!45551)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93379 (_ BitVec 32) (_ BitVec 32)) Unit!45551)

(assert (=> b!1375499 (= lt!604443 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375499 (= call!65684 lt!604444)))

(assert (=> b!1375499 (= lt!604435 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!604438 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375499 (= call!65683 lt!604437)))

(declare-fun b!1375500 () Bool)

(declare-fun res!918552 () Bool)

(assert (=> b!1375500 (=> (not res!918552) (not e!779210))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1375500 (= res!918552 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1375501 () Bool)

(declare-fun e!779209 () Bool)

(declare-fun e!779208 () Bool)

(assert (=> b!1375501 (= e!779209 e!779208)))

(declare-fun res!918554 () Bool)

(assert (=> b!1375501 (=> (not res!918554) (not e!779208))))

(assert (=> b!1375501 (= res!918554 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45643 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!604441 () Unit!45551)

(assert (=> b!1375501 (= lt!604441 e!779211)))

(declare-fun c!127913 () Bool)

(assert (=> b!1375501 (= c!127913 (validKeyInArray!0 (select (arr!45093 a!4032) to!206)))))

(declare-fun b!1375502 () Bool)

(assert (=> b!1375502 (= e!779210 e!779209)))

(declare-fun res!918556 () Bool)

(assert (=> b!1375502 (=> (not res!918556) (not e!779209))))

(assert (=> b!1375502 (= res!918556 (and (= lt!604437 lt!604444) (not (= to!206 (size!45643 a!4032)))))))

(assert (=> b!1375502 (= lt!604444 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375502 (= lt!604437 (arrayCountValidKeys!0 lt!604438 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1375502 (= lt!604438 (array!93380 (store (arr!45093 a!4032) i!1445 k0!2947) (size!45643 a!4032)))))

(declare-fun b!1375503 () Bool)

(declare-fun res!918555 () Bool)

(assert (=> b!1375503 (=> (not res!918555) (not e!779210))))

(assert (=> b!1375503 (= res!918555 (and (bvslt (size!45643 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45643 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1375504 () Bool)

(assert (=> b!1375504 (= e!779208 false)))

(declare-fun lt!604436 () (_ BitVec 32))

(assert (=> b!1375504 (= lt!604436 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!604440 () (_ BitVec 32))

(assert (=> b!1375504 (= lt!604440 (arrayCountValidKeys!0 lt!604438 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116710 res!918551) b!1375498))

(assert (= (and b!1375498 res!918553) b!1375500))

(assert (= (and b!1375500 res!918552) b!1375503))

(assert (= (and b!1375503 res!918555) b!1375502))

(assert (= (and b!1375502 res!918556) b!1375501))

(assert (= (and b!1375501 c!127913) b!1375497))

(assert (= (and b!1375501 (not c!127913)) b!1375499))

(assert (= (or b!1375497 b!1375499) bm!65680))

(assert (= (or b!1375497 b!1375499) bm!65681))

(assert (= (and b!1375501 res!918554) b!1375504))

(declare-fun m!1259341 () Bool)

(assert (=> bm!65680 m!1259341))

(assert (=> b!1375504 m!1259341))

(declare-fun m!1259343 () Bool)

(assert (=> b!1375504 m!1259343))

(declare-fun m!1259345 () Bool)

(assert (=> b!1375502 m!1259345))

(declare-fun m!1259347 () Bool)

(assert (=> b!1375502 m!1259347))

(declare-fun m!1259349 () Bool)

(assert (=> b!1375502 m!1259349))

(declare-fun m!1259351 () Bool)

(assert (=> start!116710 m!1259351))

(declare-fun m!1259353 () Bool)

(assert (=> b!1375498 m!1259353))

(assert (=> b!1375498 m!1259353))

(declare-fun m!1259355 () Bool)

(assert (=> b!1375498 m!1259355))

(declare-fun m!1259357 () Bool)

(assert (=> b!1375499 m!1259357))

(declare-fun m!1259359 () Bool)

(assert (=> b!1375499 m!1259359))

(assert (=> bm!65681 m!1259343))

(declare-fun m!1259361 () Bool)

(assert (=> b!1375497 m!1259361))

(declare-fun m!1259363 () Bool)

(assert (=> b!1375497 m!1259363))

(declare-fun m!1259365 () Bool)

(assert (=> b!1375501 m!1259365))

(assert (=> b!1375501 m!1259365))

(declare-fun m!1259367 () Bool)

(assert (=> b!1375501 m!1259367))

(declare-fun m!1259369 () Bool)

(assert (=> b!1375500 m!1259369))

(check-sat (not b!1375501) (not bm!65681) (not b!1375498) (not b!1375500) (not b!1375504) (not b!1375502) (not b!1375499) (not start!116710) (not bm!65680) (not b!1375497))
(check-sat)
