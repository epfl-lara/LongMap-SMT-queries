; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116962 () Bool)

(assert start!116962)

(declare-fun b!1377075 () Bool)

(declare-datatypes ((Unit!45512 0))(
  ( (Unit!45513) )
))
(declare-fun e!780228 () Unit!45512)

(declare-fun lt!605253 () Unit!45512)

(assert (=> b!1377075 (= e!780228 lt!605253)))

(declare-fun lt!605247 () Unit!45512)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93517 0))(
  ( (array!93518 (arr!45157 (Array (_ BitVec 32) (_ BitVec 64))) (size!45708 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93517)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93517 (_ BitVec 32) (_ BitVec 32)) Unit!45512)

(assert (=> b!1377075 (= lt!605247 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65817 () (_ BitVec 32))

(declare-fun lt!605248 () (_ BitVec 32))

(assert (=> b!1377075 (= call!65817 (bvadd #b00000000000000000000000000000001 lt!605248))))

(declare-fun lt!605249 () array!93517)

(assert (=> b!1377075 (= lt!605253 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605249 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65818 () (_ BitVec 32))

(declare-fun lt!605251 () (_ BitVec 32))

(assert (=> b!1377075 (= call!65818 (bvadd #b00000000000000000000000000000001 lt!605251))))

(declare-fun b!1377076 () Bool)

(declare-fun e!780225 () Bool)

(declare-fun e!780229 () Bool)

(assert (=> b!1377076 (= e!780225 e!780229)))

(declare-fun res!919273 () Bool)

(assert (=> b!1377076 (=> (not res!919273) (not e!780229))))

(assert (=> b!1377076 (= res!919273 (and (= lt!605251 lt!605248) (not (= to!206 (size!45708 a!4032)))))))

(declare-fun arrayCountValidKeys!0 (array!93517 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377076 (= lt!605248 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377076 (= lt!605251 (arrayCountValidKeys!0 lt!605249 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1377076 (= lt!605249 (array!93518 (store (arr!45157 a!4032) i!1445 k0!2947) (size!45708 a!4032)))))

(declare-fun b!1377077 () Bool)

(declare-fun res!919274 () Bool)

(assert (=> b!1377077 (=> (not res!919274) (not e!780225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377077 (= res!919274 (validKeyInArray!0 (select (arr!45157 a!4032) i!1445)))))

(declare-fun b!1377078 () Bool)

(declare-fun lt!605252 () Unit!45512)

(assert (=> b!1377078 (= e!780228 lt!605252)))

(declare-fun lt!605256 () Unit!45512)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93517 (_ BitVec 32) (_ BitVec 32)) Unit!45512)

(assert (=> b!1377078 (= lt!605256 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377078 (= call!65817 lt!605248)))

(assert (=> b!1377078 (= lt!605252 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605249 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377078 (= call!65818 lt!605251)))

(declare-fun bm!65814 () Bool)

(assert (=> bm!65814 (= call!65818 (arrayCountValidKeys!0 lt!605249 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65815 () Bool)

(assert (=> bm!65815 (= call!65817 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun res!919271 () Bool)

(assert (=> start!116962 (=> (not res!919271) (not e!780225))))

(assert (=> start!116962 (= res!919271 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45708 a!4032))))))

(assert (=> start!116962 e!780225))

(assert (=> start!116962 true))

(declare-fun array_inv!34438 (array!93517) Bool)

(assert (=> start!116962 (array_inv!34438 a!4032)))

(declare-fun b!1377079 () Bool)

(declare-fun res!919270 () Bool)

(assert (=> b!1377079 (=> (not res!919270) (not e!780225))))

(assert (=> b!1377079 (= res!919270 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377080 () Bool)

(declare-fun e!780227 () Bool)

(assert (=> b!1377080 (= e!780229 e!780227)))

(declare-fun res!919272 () Bool)

(assert (=> b!1377080 (=> (not res!919272) (not e!780227))))

(assert (=> b!1377080 (= res!919272 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45708 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605254 () Unit!45512)

(assert (=> b!1377080 (= lt!605254 e!780228)))

(declare-fun c!128350 () Bool)

(assert (=> b!1377080 (= c!128350 (validKeyInArray!0 (select (arr!45157 a!4032) to!206)))))

(declare-fun b!1377081 () Bool)

(declare-fun res!919275 () Bool)

(assert (=> b!1377081 (=> (not res!919275) (not e!780225))))

(assert (=> b!1377081 (= res!919275 (and (bvslt (size!45708 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45708 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377082 () Bool)

(assert (=> b!1377082 (= e!780227 false)))

(declare-fun lt!605250 () (_ BitVec 32))

(assert (=> b!1377082 (= lt!605250 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun lt!605255 () (_ BitVec 32))

(assert (=> b!1377082 (= lt!605255 (arrayCountValidKeys!0 lt!605249 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!116962 res!919271) b!1377077))

(assert (= (and b!1377077 res!919274) b!1377079))

(assert (= (and b!1377079 res!919270) b!1377081))

(assert (= (and b!1377081 res!919275) b!1377076))

(assert (= (and b!1377076 res!919273) b!1377080))

(assert (= (and b!1377080 c!128350) b!1377075))

(assert (= (and b!1377080 (not c!128350)) b!1377078))

(assert (= (or b!1377075 b!1377078) bm!65814))

(assert (= (or b!1377075 b!1377078) bm!65815))

(assert (= (and b!1377080 res!919272) b!1377082))

(declare-fun m!1261299 () Bool)

(assert (=> b!1377080 m!1261299))

(assert (=> b!1377080 m!1261299))

(declare-fun m!1261301 () Bool)

(assert (=> b!1377080 m!1261301))

(declare-fun m!1261303 () Bool)

(assert (=> b!1377079 m!1261303))

(declare-fun m!1261305 () Bool)

(assert (=> bm!65815 m!1261305))

(declare-fun m!1261307 () Bool)

(assert (=> b!1377077 m!1261307))

(assert (=> b!1377077 m!1261307))

(declare-fun m!1261309 () Bool)

(assert (=> b!1377077 m!1261309))

(declare-fun m!1261311 () Bool)

(assert (=> b!1377076 m!1261311))

(declare-fun m!1261313 () Bool)

(assert (=> b!1377076 m!1261313))

(declare-fun m!1261315 () Bool)

(assert (=> b!1377076 m!1261315))

(assert (=> b!1377082 m!1261305))

(declare-fun m!1261317 () Bool)

(assert (=> b!1377082 m!1261317))

(declare-fun m!1261319 () Bool)

(assert (=> b!1377075 m!1261319))

(declare-fun m!1261321 () Bool)

(assert (=> b!1377075 m!1261321))

(declare-fun m!1261323 () Bool)

(assert (=> b!1377078 m!1261323))

(declare-fun m!1261325 () Bool)

(assert (=> b!1377078 m!1261325))

(assert (=> bm!65814 m!1261317))

(declare-fun m!1261327 () Bool)

(assert (=> start!116962 m!1261327))

(check-sat (not b!1377080) (not b!1377077) (not bm!65814) (not b!1377082) (not b!1377076) (not start!116962) (not bm!65815) (not b!1377078) (not b!1377075) (not b!1377079))
(check-sat)
