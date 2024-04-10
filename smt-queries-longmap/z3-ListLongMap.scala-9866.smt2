; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116884 () Bool)

(assert start!116884)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun bm!65986 () Bool)

(declare-fun call!65989 () (_ BitVec 32))

(declare-datatypes ((array!93553 0))(
  ( (array!93554 (arr!45180 (Array (_ BitVec 32) (_ BitVec 64))) (size!45730 (_ BitVec 32))) )
))
(declare-fun lt!605945 () array!93553)

(declare-fun arrayCountValidKeys!0 (array!93553 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65986 (= call!65989 (arrayCountValidKeys!0 lt!605945 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377338 () Bool)

(declare-fun res!920092 () Bool)

(declare-fun e!780198 () Bool)

(assert (=> b!1377338 (=> (not res!920092) (not e!780198))))

(declare-fun a!4032 () array!93553)

(assert (=> b!1377338 (= res!920092 (and (bvslt (size!45730 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45730 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377339 () Bool)

(declare-fun e!780199 () Bool)

(assert (=> b!1377339 (= e!780199 (not true))))

(assert (=> b!1377339 (= (arrayCountValidKeys!0 lt!605945 (bvadd #b00000000000000000000000000000001 i!1445) (size!45730 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45730 a!4032)))))

(declare-datatypes ((Unit!45677 0))(
  ( (Unit!45678) )
))
(declare-fun lt!605946 () Unit!45677)

(declare-fun k0!2947 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93553 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45677)

(assert (=> b!1377339 (= lt!605946 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377341 () Bool)

(declare-fun res!920091 () Bool)

(assert (=> b!1377341 (=> (not res!920091) (not e!780198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377341 (= res!920091 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377342 () Bool)

(declare-fun res!920086 () Bool)

(assert (=> b!1377342 (=> (not res!920086) (not e!780199))))

(assert (=> b!1377342 (= res!920086 (= (arrayCountValidKeys!0 lt!605945 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1377343 () Bool)

(declare-fun e!780201 () Bool)

(assert (=> b!1377343 (= e!780201 e!780199)))

(declare-fun res!920089 () Bool)

(assert (=> b!1377343 (=> (not res!920089) (not e!780199))))

(assert (=> b!1377343 (= res!920089 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45730 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605944 () Unit!45677)

(declare-fun e!780200 () Unit!45677)

(assert (=> b!1377343 (= lt!605944 e!780200)))

(declare-fun c!128066 () Bool)

(assert (=> b!1377343 (= c!128066 (validKeyInArray!0 (select (arr!45180 a!4032) to!206)))))

(declare-fun b!1377344 () Bool)

(declare-fun lt!605942 () Unit!45677)

(assert (=> b!1377344 (= e!780200 lt!605942)))

(declare-fun lt!605943 () Unit!45677)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93553 (_ BitVec 32) (_ BitVec 32)) Unit!45677)

(assert (=> b!1377344 (= lt!605943 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65990 () (_ BitVec 32))

(declare-fun lt!605949 () (_ BitVec 32))

(assert (=> b!1377344 (= call!65990 lt!605949)))

(assert (=> b!1377344 (= lt!605942 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605945 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605948 () (_ BitVec 32))

(assert (=> b!1377344 (= call!65989 lt!605948)))

(declare-fun b!1377345 () Bool)

(declare-fun res!920090 () Bool)

(assert (=> b!1377345 (=> (not res!920090) (not e!780198))))

(assert (=> b!1377345 (= res!920090 (validKeyInArray!0 (select (arr!45180 a!4032) i!1445)))))

(declare-fun res!920088 () Bool)

(assert (=> start!116884 (=> (not res!920088) (not e!780198))))

(assert (=> start!116884 (= res!920088 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45730 a!4032))))))

(assert (=> start!116884 e!780198))

(assert (=> start!116884 true))

(declare-fun array_inv!34208 (array!93553) Bool)

(assert (=> start!116884 (array_inv!34208 a!4032)))

(declare-fun b!1377340 () Bool)

(assert (=> b!1377340 (= e!780198 e!780201)))

(declare-fun res!920087 () Bool)

(assert (=> b!1377340 (=> (not res!920087) (not e!780201))))

(assert (=> b!1377340 (= res!920087 (and (= lt!605948 lt!605949) (not (= to!206 (size!45730 a!4032)))))))

(assert (=> b!1377340 (= lt!605949 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377340 (= lt!605948 (arrayCountValidKeys!0 lt!605945 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377340 (= lt!605945 (array!93554 (store (arr!45180 a!4032) i!1445 k0!2947) (size!45730 a!4032)))))

(declare-fun b!1377346 () Bool)

(declare-fun lt!605950 () Unit!45677)

(assert (=> b!1377346 (= e!780200 lt!605950)))

(declare-fun lt!605947 () Unit!45677)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93553 (_ BitVec 32) (_ BitVec 32)) Unit!45677)

(assert (=> b!1377346 (= lt!605947 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377346 (= call!65990 (bvadd #b00000000000000000000000000000001 lt!605949))))

(assert (=> b!1377346 (= lt!605950 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605945 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377346 (= call!65989 (bvadd #b00000000000000000000000000000001 lt!605948))))

(declare-fun bm!65987 () Bool)

(assert (=> bm!65987 (= call!65990 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116884 res!920088) b!1377345))

(assert (= (and b!1377345 res!920090) b!1377341))

(assert (= (and b!1377341 res!920091) b!1377338))

(assert (= (and b!1377338 res!920092) b!1377340))

(assert (= (and b!1377340 res!920087) b!1377343))

(assert (= (and b!1377343 c!128066) b!1377346))

(assert (= (and b!1377343 (not c!128066)) b!1377344))

(assert (= (or b!1377346 b!1377344) bm!65986))

(assert (= (or b!1377346 b!1377344) bm!65987))

(assert (= (and b!1377343 res!920089) b!1377342))

(assert (= (and b!1377342 res!920086) b!1377339))

(declare-fun m!1261601 () Bool)

(assert (=> b!1377341 m!1261601))

(declare-fun m!1261603 () Bool)

(assert (=> b!1377345 m!1261603))

(assert (=> b!1377345 m!1261603))

(declare-fun m!1261605 () Bool)

(assert (=> b!1377345 m!1261605))

(declare-fun m!1261607 () Bool)

(assert (=> b!1377343 m!1261607))

(assert (=> b!1377343 m!1261607))

(declare-fun m!1261609 () Bool)

(assert (=> b!1377343 m!1261609))

(declare-fun m!1261611 () Bool)

(assert (=> b!1377342 m!1261611))

(declare-fun m!1261613 () Bool)

(assert (=> b!1377342 m!1261613))

(declare-fun m!1261615 () Bool)

(assert (=> b!1377339 m!1261615))

(declare-fun m!1261617 () Bool)

(assert (=> b!1377339 m!1261617))

(declare-fun m!1261619 () Bool)

(assert (=> b!1377339 m!1261619))

(declare-fun m!1261621 () Bool)

(assert (=> b!1377344 m!1261621))

(declare-fun m!1261623 () Bool)

(assert (=> b!1377344 m!1261623))

(declare-fun m!1261625 () Bool)

(assert (=> start!116884 m!1261625))

(declare-fun m!1261627 () Bool)

(assert (=> b!1377340 m!1261627))

(declare-fun m!1261629 () Bool)

(assert (=> b!1377340 m!1261629))

(declare-fun m!1261631 () Bool)

(assert (=> b!1377340 m!1261631))

(declare-fun m!1261633 () Bool)

(assert (=> b!1377346 m!1261633))

(declare-fun m!1261635 () Bool)

(assert (=> b!1377346 m!1261635))

(assert (=> bm!65986 m!1261611))

(assert (=> bm!65987 m!1261613))

(check-sat (not bm!65987) (not bm!65986) (not start!116884) (not b!1377342) (not b!1377344) (not b!1377340) (not b!1377341) (not b!1377339) (not b!1377346) (not b!1377343) (not b!1377345))
(check-sat)
