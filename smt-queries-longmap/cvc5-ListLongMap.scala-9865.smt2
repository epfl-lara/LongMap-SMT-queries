; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116876 () Bool)

(assert start!116876)

(declare-fun b!1377230 () Bool)

(declare-fun e!780138 () Bool)

(declare-fun e!780139 () Bool)

(assert (=> b!1377230 (= e!780138 e!780139)))

(declare-fun res!920003 () Bool)

(assert (=> b!1377230 (=> (not res!920003) (not e!780139))))

(declare-fun lt!605847 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605841 () (_ BitVec 32))

(declare-datatypes ((array!93545 0))(
  ( (array!93546 (arr!45176 (Array (_ BitVec 32) (_ BitVec 64))) (size!45726 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93545)

(assert (=> b!1377230 (= res!920003 (and (= lt!605841 lt!605847) (not (= to!206 (size!45726 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93545 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377230 (= lt!605847 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605848 () array!93545)

(assert (=> b!1377230 (= lt!605841 (arrayCountValidKeys!0 lt!605848 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k!2947 () (_ BitVec 64))

(assert (=> b!1377230 (= lt!605848 (array!93546 (store (arr!45176 a!4032) i!1445 k!2947) (size!45726 a!4032)))))

(declare-fun call!65966 () (_ BitVec 32))

(declare-fun bm!65962 () Bool)

(assert (=> bm!65962 (= call!65966 (arrayCountValidKeys!0 lt!605848 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377231 () Bool)

(declare-fun e!780141 () Bool)

(assert (=> b!1377231 (= e!780139 e!780141)))

(declare-fun res!920005 () Bool)

(assert (=> b!1377231 (=> (not res!920005) (not e!780141))))

(assert (=> b!1377231 (= res!920005 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45726 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45669 0))(
  ( (Unit!45670) )
))
(declare-fun lt!605845 () Unit!45669)

(declare-fun e!780140 () Unit!45669)

(assert (=> b!1377231 (= lt!605845 e!780140)))

(declare-fun c!128054 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377231 (= c!128054 (validKeyInArray!0 (select (arr!45176 a!4032) to!206)))))

(declare-fun b!1377232 () Bool)

(declare-fun res!920007 () Bool)

(assert (=> b!1377232 (=> (not res!920007) (not e!780141))))

(assert (=> b!1377232 (= res!920007 (= (arrayCountValidKeys!0 lt!605848 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1377233 () Bool)

(declare-fun res!920002 () Bool)

(assert (=> b!1377233 (=> (not res!920002) (not e!780138))))

(assert (=> b!1377233 (= res!920002 (and (bvslt (size!45726 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45726 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377234 () Bool)

(assert (=> b!1377234 (= e!780141 (bvsge (bvsub (size!45726 a!4032) to!206) (bvsub (bvadd #b00000000000000000000000000000001 (size!45726 a!4032)) to!206)))))

(declare-fun b!1377236 () Bool)

(declare-fun lt!605843 () Unit!45669)

(assert (=> b!1377236 (= e!780140 lt!605843)))

(declare-fun lt!605842 () Unit!45669)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93545 (_ BitVec 32) (_ BitVec 32)) Unit!45669)

(assert (=> b!1377236 (= lt!605842 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65965 () (_ BitVec 32))

(assert (=> b!1377236 (= call!65965 lt!605847)))

(assert (=> b!1377236 (= lt!605843 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605848 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377236 (= call!65966 lt!605841)))

(declare-fun b!1377237 () Bool)

(declare-fun lt!605844 () Unit!45669)

(assert (=> b!1377237 (= e!780140 lt!605844)))

(declare-fun lt!605846 () Unit!45669)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93545 (_ BitVec 32) (_ BitVec 32)) Unit!45669)

(assert (=> b!1377237 (= lt!605846 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377237 (= call!65965 (bvadd #b00000000000000000000000000000001 lt!605847))))

(assert (=> b!1377237 (= lt!605844 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605848 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377237 (= call!65966 (bvadd #b00000000000000000000000000000001 lt!605841))))

(declare-fun b!1377235 () Bool)

(declare-fun res!920008 () Bool)

(assert (=> b!1377235 (=> (not res!920008) (not e!780138))))

(assert (=> b!1377235 (= res!920008 (not (validKeyInArray!0 k!2947)))))

(declare-fun res!920004 () Bool)

(assert (=> start!116876 (=> (not res!920004) (not e!780138))))

(assert (=> start!116876 (= res!920004 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45726 a!4032))))))

(assert (=> start!116876 e!780138))

(assert (=> start!116876 true))

(declare-fun array_inv!34204 (array!93545) Bool)

(assert (=> start!116876 (array_inv!34204 a!4032)))

(declare-fun bm!65963 () Bool)

(assert (=> bm!65963 (= call!65965 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377238 () Bool)

(declare-fun res!920006 () Bool)

(assert (=> b!1377238 (=> (not res!920006) (not e!780138))))

(assert (=> b!1377238 (= res!920006 (validKeyInArray!0 (select (arr!45176 a!4032) i!1445)))))

(assert (= (and start!116876 res!920004) b!1377238))

(assert (= (and b!1377238 res!920006) b!1377235))

(assert (= (and b!1377235 res!920008) b!1377233))

(assert (= (and b!1377233 res!920002) b!1377230))

(assert (= (and b!1377230 res!920003) b!1377231))

(assert (= (and b!1377231 c!128054) b!1377237))

(assert (= (and b!1377231 (not c!128054)) b!1377236))

(assert (= (or b!1377237 b!1377236) bm!65963))

(assert (= (or b!1377237 b!1377236) bm!65962))

(assert (= (and b!1377231 res!920005) b!1377232))

(assert (= (and b!1377232 res!920007) b!1377234))

(declare-fun m!1261471 () Bool)

(assert (=> start!116876 m!1261471))

(declare-fun m!1261473 () Bool)

(assert (=> b!1377235 m!1261473))

(declare-fun m!1261475 () Bool)

(assert (=> b!1377238 m!1261475))

(assert (=> b!1377238 m!1261475))

(declare-fun m!1261477 () Bool)

(assert (=> b!1377238 m!1261477))

(declare-fun m!1261479 () Bool)

(assert (=> b!1377236 m!1261479))

(declare-fun m!1261481 () Bool)

(assert (=> b!1377236 m!1261481))

(declare-fun m!1261483 () Bool)

(assert (=> bm!65963 m!1261483))

(declare-fun m!1261485 () Bool)

(assert (=> b!1377232 m!1261485))

(assert (=> b!1377232 m!1261483))

(declare-fun m!1261487 () Bool)

(assert (=> b!1377230 m!1261487))

(declare-fun m!1261489 () Bool)

(assert (=> b!1377230 m!1261489))

(declare-fun m!1261491 () Bool)

(assert (=> b!1377230 m!1261491))

(assert (=> bm!65962 m!1261485))

(declare-fun m!1261493 () Bool)

(assert (=> b!1377231 m!1261493))

(assert (=> b!1377231 m!1261493))

(declare-fun m!1261495 () Bool)

(assert (=> b!1377231 m!1261495))

(declare-fun m!1261497 () Bool)

(assert (=> b!1377237 m!1261497))

(declare-fun m!1261499 () Bool)

(assert (=> b!1377237 m!1261499))

(push 1)

(assert (not bm!65963))

(assert (not bm!65962))

(assert (not b!1377238))

(assert (not b!1377231))

(assert (not b!1377235))

(assert (not b!1377232))

(assert (not b!1377236))

(assert (not start!116876))

(assert (not b!1377237))

(assert (not b!1377230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

