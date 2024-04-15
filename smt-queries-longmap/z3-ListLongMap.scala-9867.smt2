; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116884 () Bool)

(assert start!116884)

(declare-fun res!920104 () Bool)

(declare-fun e!780201 () Bool)

(assert (=> start!116884 (=> (not res!920104) (not e!780201))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93507 0))(
  ( (array!93508 (arr!45157 (Array (_ BitVec 32) (_ BitVec 64))) (size!45709 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93507)

(assert (=> start!116884 (= res!920104 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45709 a!4032))))))

(assert (=> start!116884 e!780201))

(assert (=> start!116884 true))

(declare-fun array_inv!34390 (array!93507) Bool)

(assert (=> start!116884 (array_inv!34390 a!4032)))

(declare-fun b!1377331 () Bool)

(declare-fun res!920102 () Bool)

(assert (=> b!1377331 (=> (not res!920102) (not e!780201))))

(declare-fun to!206 () (_ BitVec 32))

(assert (=> b!1377331 (= res!920102 (and (bvslt (size!45709 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45709 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun call!65985 () (_ BitVec 32))

(declare-fun bm!65981 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93507 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!65981 (= call!65985 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun call!65984 () (_ BitVec 32))

(declare-fun lt!605815 () array!93507)

(declare-fun bm!65982 () Bool)

(assert (=> bm!65982 (= call!65984 (arrayCountValidKeys!0 lt!605815 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377332 () Bool)

(declare-fun e!780204 () Bool)

(declare-fun e!780205 () Bool)

(assert (=> b!1377332 (= e!780204 e!780205)))

(declare-fun res!920106 () Bool)

(assert (=> b!1377332 (=> (not res!920106) (not e!780205))))

(assert (=> b!1377332 (= res!920106 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45709 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45522 0))(
  ( (Unit!45523) )
))
(declare-fun lt!605819 () Unit!45522)

(declare-fun e!780203 () Unit!45522)

(assert (=> b!1377332 (= lt!605819 e!780203)))

(declare-fun c!128057 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377332 (= c!128057 (validKeyInArray!0 (select (arr!45157 a!4032) to!206)))))

(declare-fun b!1377333 () Bool)

(declare-fun res!920108 () Bool)

(assert (=> b!1377333 (=> (not res!920108) (not e!780201))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1377333 (= res!920108 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1377334 () Bool)

(assert (=> b!1377334 (= e!780205 (not true))))

(assert (=> b!1377334 (= (arrayCountValidKeys!0 lt!605815 (bvadd #b00000000000000000000000000000001 i!1445) (size!45709 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45709 a!4032)))))

(declare-fun lt!605817 () Unit!45522)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93507 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45522)

(assert (=> b!1377334 (= lt!605817 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377335 () Bool)

(declare-fun res!920105 () Bool)

(assert (=> b!1377335 (=> (not res!920105) (not e!780201))))

(assert (=> b!1377335 (= res!920105 (validKeyInArray!0 (select (arr!45157 a!4032) i!1445)))))

(declare-fun b!1377336 () Bool)

(declare-fun lt!605820 () Unit!45522)

(assert (=> b!1377336 (= e!780203 lt!605820)))

(declare-fun lt!605818 () Unit!45522)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93507 (_ BitVec 32) (_ BitVec 32)) Unit!45522)

(assert (=> b!1377336 (= lt!605818 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605821 () (_ BitVec 32))

(assert (=> b!1377336 (= call!65985 lt!605821)))

(assert (=> b!1377336 (= lt!605820 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605815 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605822 () (_ BitVec 32))

(assert (=> b!1377336 (= call!65984 lt!605822)))

(declare-fun b!1377337 () Bool)

(declare-fun lt!605816 () Unit!45522)

(assert (=> b!1377337 (= e!780203 lt!605816)))

(declare-fun lt!605814 () Unit!45522)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93507 (_ BitVec 32) (_ BitVec 32)) Unit!45522)

(assert (=> b!1377337 (= lt!605814 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377337 (= call!65985 (bvadd #b00000000000000000000000000000001 lt!605821))))

(assert (=> b!1377337 (= lt!605816 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605815 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377337 (= call!65984 (bvadd #b00000000000000000000000000000001 lt!605822))))

(declare-fun b!1377338 () Bool)

(declare-fun res!920107 () Bool)

(assert (=> b!1377338 (=> (not res!920107) (not e!780205))))

(assert (=> b!1377338 (= res!920107 (= (arrayCountValidKeys!0 lt!605815 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1377339 () Bool)

(assert (=> b!1377339 (= e!780201 e!780204)))

(declare-fun res!920103 () Bool)

(assert (=> b!1377339 (=> (not res!920103) (not e!780204))))

(assert (=> b!1377339 (= res!920103 (and (= lt!605822 lt!605821) (not (= to!206 (size!45709 a!4032)))))))

(assert (=> b!1377339 (= lt!605821 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377339 (= lt!605822 (arrayCountValidKeys!0 lt!605815 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377339 (= lt!605815 (array!93508 (store (arr!45157 a!4032) i!1445 k0!2947) (size!45709 a!4032)))))

(assert (= (and start!116884 res!920104) b!1377335))

(assert (= (and b!1377335 res!920105) b!1377333))

(assert (= (and b!1377333 res!920108) b!1377331))

(assert (= (and b!1377331 res!920102) b!1377339))

(assert (= (and b!1377339 res!920103) b!1377332))

(assert (= (and b!1377332 c!128057) b!1377337))

(assert (= (and b!1377332 (not c!128057)) b!1377336))

(assert (= (or b!1377337 b!1377336) bm!65981))

(assert (= (or b!1377337 b!1377336) bm!65982))

(assert (= (and b!1377332 res!920106) b!1377338))

(assert (= (and b!1377338 res!920107) b!1377334))

(declare-fun m!1261175 () Bool)

(assert (=> start!116884 m!1261175))

(declare-fun m!1261177 () Bool)

(assert (=> b!1377334 m!1261177))

(declare-fun m!1261179 () Bool)

(assert (=> b!1377334 m!1261179))

(declare-fun m!1261181 () Bool)

(assert (=> b!1377334 m!1261181))

(declare-fun m!1261183 () Bool)

(assert (=> b!1377338 m!1261183))

(declare-fun m!1261185 () Bool)

(assert (=> b!1377338 m!1261185))

(assert (=> bm!65981 m!1261185))

(declare-fun m!1261187 () Bool)

(assert (=> b!1377337 m!1261187))

(declare-fun m!1261189 () Bool)

(assert (=> b!1377337 m!1261189))

(declare-fun m!1261191 () Bool)

(assert (=> b!1377332 m!1261191))

(assert (=> b!1377332 m!1261191))

(declare-fun m!1261193 () Bool)

(assert (=> b!1377332 m!1261193))

(declare-fun m!1261195 () Bool)

(assert (=> b!1377339 m!1261195))

(declare-fun m!1261197 () Bool)

(assert (=> b!1377339 m!1261197))

(declare-fun m!1261199 () Bool)

(assert (=> b!1377339 m!1261199))

(assert (=> bm!65982 m!1261183))

(declare-fun m!1261201 () Bool)

(assert (=> b!1377333 m!1261201))

(declare-fun m!1261203 () Bool)

(assert (=> b!1377336 m!1261203))

(declare-fun m!1261205 () Bool)

(assert (=> b!1377336 m!1261205))

(declare-fun m!1261207 () Bool)

(assert (=> b!1377335 m!1261207))

(assert (=> b!1377335 m!1261207))

(declare-fun m!1261209 () Bool)

(assert (=> b!1377335 m!1261209))

(check-sat (not b!1377337) (not b!1377334) (not bm!65982) (not bm!65981) (not b!1377338) (not b!1377333) (not b!1377335) (not start!116884) (not b!1377332) (not b!1377339) (not b!1377336))
(check-sat)
