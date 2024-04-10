; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116864 () Bool)

(assert start!116864)

(declare-fun call!65930 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93533 0))(
  ( (array!93534 (arr!45170 (Array (_ BitVec 32) (_ BitVec 64))) (size!45720 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93533)

(declare-fun bm!65926 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93533 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65926 (= call!65930 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377091 () Bool)

(declare-fun e!780055 () Bool)

(declare-fun e!780057 () Bool)

(assert (=> b!1377091 (= e!780055 e!780057)))

(declare-fun res!919900 () Bool)

(assert (=> b!1377091 (=> (not res!919900) (not e!780057))))

(declare-fun lt!605703 () (_ BitVec 32))

(declare-fun lt!605698 () (_ BitVec 32))

(assert (=> b!1377091 (= res!919900 (and (= lt!605703 lt!605698) (not (= to!206 (size!45720 a!4032)))))))

(assert (=> b!1377091 (= lt!605698 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605702 () array!93533)

(assert (=> b!1377091 (= lt!605703 (arrayCountValidKeys!0 lt!605702 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1377091 (= lt!605702 (array!93534 (store (arr!45170 a!4032) i!1445 k!2947) (size!45720 a!4032)))))

(declare-fun b!1377092 () Bool)

(declare-datatypes ((Unit!45657 0))(
  ( (Unit!45658) )
))
(declare-fun e!780056 () Unit!45657)

(declare-fun lt!605704 () Unit!45657)

(assert (=> b!1377092 (= e!780056 lt!605704)))

(declare-fun lt!605699 () Unit!45657)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93533 (_ BitVec 32) (_ BitVec 32)) Unit!45657)

(assert (=> b!1377092 (= lt!605699 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377092 (= call!65930 lt!605698)))

(assert (=> b!1377092 (= lt!605704 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605702 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65929 () (_ BitVec 32))

(assert (=> b!1377092 (= call!65929 lt!605703)))

(declare-fun b!1377093 () Bool)

(declare-fun res!919899 () Bool)

(assert (=> b!1377093 (=> (not res!919899) (not e!780055))))

(assert (=> b!1377093 (= res!919899 (and (bvslt (size!45720 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45720 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377094 () Bool)

(declare-fun res!919901 () Bool)

(assert (=> b!1377094 (=> (not res!919901) (not e!780055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377094 (= res!919901 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377095 () Bool)

(declare-fun res!919903 () Bool)

(assert (=> b!1377095 (=> (not res!919903) (not e!780055))))

(assert (=> b!1377095 (= res!919903 (validKeyInArray!0 (select (arr!45170 a!4032) i!1445)))))

(declare-fun b!1377096 () Bool)

(declare-fun lt!605701 () Unit!45657)

(assert (=> b!1377096 (= e!780056 lt!605701)))

(declare-fun lt!605697 () Unit!45657)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93533 (_ BitVec 32) (_ BitVec 32)) Unit!45657)

(assert (=> b!1377096 (= lt!605697 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377096 (= call!65930 (bvadd #b00000000000000000000000000000001 lt!605698))))

(assert (=> b!1377096 (= lt!605701 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605702 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377096 (= call!65929 (bvadd #b00000000000000000000000000000001 lt!605703))))

(declare-fun bm!65927 () Bool)

(assert (=> bm!65927 (= call!65929 (arrayCountValidKeys!0 lt!605702 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!919902 () Bool)

(assert (=> start!116864 (=> (not res!919902) (not e!780055))))

(assert (=> start!116864 (= res!919902 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45720 a!4032))))))

(assert (=> start!116864 e!780055))

(assert (=> start!116864 true))

(declare-fun array_inv!34198 (array!93533) Bool)

(assert (=> start!116864 (array_inv!34198 a!4032)))

(declare-fun b!1377097 () Bool)

(assert (=> b!1377097 (= e!780057 (or (bvslt (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) (size!45720 a!4032)) (bvsle (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605700 () Unit!45657)

(assert (=> b!1377097 (= lt!605700 e!780056)))

(declare-fun c!128036 () Bool)

(assert (=> b!1377097 (= c!128036 (validKeyInArray!0 (select (arr!45170 a!4032) to!206)))))

(assert (= (and start!116864 res!919902) b!1377095))

(assert (= (and b!1377095 res!919903) b!1377094))

(assert (= (and b!1377094 res!919901) b!1377093))

(assert (= (and b!1377093 res!919899) b!1377091))

(assert (= (and b!1377091 res!919900) b!1377097))

(assert (= (and b!1377097 c!128036) b!1377096))

(assert (= (and b!1377097 (not c!128036)) b!1377092))

(assert (= (or b!1377096 b!1377092) bm!65927))

(assert (= (or b!1377096 b!1377092) bm!65926))

(declare-fun m!1261291 () Bool)

(assert (=> b!1377092 m!1261291))

(declare-fun m!1261293 () Bool)

(assert (=> b!1377092 m!1261293))

(declare-fun m!1261295 () Bool)

(assert (=> b!1377091 m!1261295))

(declare-fun m!1261297 () Bool)

(assert (=> b!1377091 m!1261297))

(declare-fun m!1261299 () Bool)

(assert (=> b!1377091 m!1261299))

(declare-fun m!1261301 () Bool)

(assert (=> b!1377094 m!1261301))

(declare-fun m!1261303 () Bool)

(assert (=> bm!65926 m!1261303))

(declare-fun m!1261305 () Bool)

(assert (=> b!1377097 m!1261305))

(assert (=> b!1377097 m!1261305))

(declare-fun m!1261307 () Bool)

(assert (=> b!1377097 m!1261307))

(declare-fun m!1261309 () Bool)

(assert (=> start!116864 m!1261309))

(declare-fun m!1261311 () Bool)

(assert (=> bm!65927 m!1261311))

(declare-fun m!1261313 () Bool)

(assert (=> b!1377095 m!1261313))

(assert (=> b!1377095 m!1261313))

(declare-fun m!1261315 () Bool)

(assert (=> b!1377095 m!1261315))

(declare-fun m!1261317 () Bool)

(assert (=> b!1377096 m!1261317))

(declare-fun m!1261319 () Bool)

(assert (=> b!1377096 m!1261319))

(push 1)

(assert (not b!1377096))

(assert (not b!1377097))

(assert (not b!1377091))

(assert (not b!1377094))

(assert (not start!116864))

(assert (not b!1377095))

(assert (not b!1377092))

(assert (not bm!65927))

(assert (not bm!65926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

