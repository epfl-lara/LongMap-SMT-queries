; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117112 () Bool)

(assert start!117112)

(declare-fun res!920589 () Bool)

(declare-fun e!781037 () Bool)

(assert (=> start!117112 (=> (not res!920589) (not e!781037))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93667 0))(
  ( (array!93668 (arr!45232 (Array (_ BitVec 32) (_ BitVec 64))) (size!45783 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93667)

(assert (=> start!117112 (= res!920589 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45783 a!4032))))))

(assert (=> start!117112 e!781037))

(assert (=> start!117112 true))

(declare-fun array_inv!34513 (array!93667) Bool)

(assert (=> start!117112 (array_inv!34513 a!4032)))

(declare-fun bm!66048 () Bool)

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!606400 () array!93667)

(declare-fun call!66052 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93667 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66048 (= call!66052 (arrayCountValidKeys!0 lt!606400 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1378625 () Bool)

(declare-fun res!920592 () Bool)

(declare-fun e!781036 () Bool)

(assert (=> b!1378625 (=> (not res!920592) (not e!781036))))

(assert (=> b!1378625 (= res!920592 (= (arrayCountValidKeys!0 lt!606400 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1378626 () Bool)

(declare-fun res!920586 () Bool)

(assert (=> b!1378626 (=> (not res!920586) (not e!781037))))

(assert (=> b!1378626 (= res!920586 (and (bvslt (size!45783 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45783 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1378627 () Bool)

(declare-fun e!781038 () Bool)

(assert (=> b!1378627 (= e!781037 e!781038)))

(declare-fun res!920591 () Bool)

(assert (=> b!1378627 (=> (not res!920591) (not e!781038))))

(declare-fun lt!606398 () (_ BitVec 32))

(declare-fun lt!606403 () (_ BitVec 32))

(assert (=> b!1378627 (= res!920591 (and (= lt!606403 lt!606398) (not (= to!206 (size!45783 a!4032)))))))

(assert (=> b!1378627 (= lt!606398 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378627 (= lt!606403 (arrayCountValidKeys!0 lt!606400 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1378627 (= lt!606400 (array!93668 (store (arr!45232 a!4032) i!1445 k0!2947) (size!45783 a!4032)))))

(declare-fun b!1378628 () Bool)

(declare-datatypes ((Unit!45614 0))(
  ( (Unit!45615) )
))
(declare-fun e!781039 () Unit!45614)

(declare-fun lt!606401 () Unit!45614)

(assert (=> b!1378628 (= e!781039 lt!606401)))

(declare-fun lt!606397 () Unit!45614)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93667 (_ BitVec 32) (_ BitVec 32)) Unit!45614)

(assert (=> b!1378628 (= lt!606397 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!66051 () (_ BitVec 32))

(assert (=> b!1378628 (= call!66051 (bvadd #b00000000000000000000000000000001 lt!606398))))

(assert (=> b!1378628 (= lt!606401 (lemmaValidKeyIncreasesNumOfKeys!0 lt!606400 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378628 (= call!66052 (bvadd #b00000000000000000000000000000001 lt!606403))))

(declare-fun b!1378629 () Bool)

(declare-fun lt!606404 () Unit!45614)

(assert (=> b!1378629 (= e!781039 lt!606404)))

(declare-fun lt!606405 () Unit!45614)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93667 (_ BitVec 32) (_ BitVec 32)) Unit!45614)

(assert (=> b!1378629 (= lt!606405 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378629 (= call!66051 lt!606398)))

(assert (=> b!1378629 (= lt!606404 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!606400 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378629 (= call!66052 lt!606403)))

(declare-fun b!1378630 () Bool)

(assert (=> b!1378630 (= e!781036 (not true))))

(assert (=> b!1378630 (= (arrayCountValidKeys!0 lt!606400 (bvadd #b00000000000000000000000000000001 i!1445) (size!45783 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45783 a!4032)))))

(declare-fun lt!606399 () Unit!45614)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93667 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45614)

(assert (=> b!1378630 (= lt!606399 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!66049 () Bool)

(assert (=> bm!66049 (= call!66051 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1378631 () Bool)

(declare-fun res!920590 () Bool)

(assert (=> b!1378631 (=> (not res!920590) (not e!781037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378631 (= res!920590 (validKeyInArray!0 (select (arr!45232 a!4032) i!1445)))))

(declare-fun b!1378632 () Bool)

(declare-fun res!920588 () Bool)

(assert (=> b!1378632 (=> (not res!920588) (not e!781037))))

(assert (=> b!1378632 (= res!920588 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1378633 () Bool)

(assert (=> b!1378633 (= e!781038 e!781036)))

(declare-fun res!920587 () Bool)

(assert (=> b!1378633 (=> (not res!920587) (not e!781036))))

(assert (=> b!1378633 (= res!920587 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45783 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!606402 () Unit!45614)

(assert (=> b!1378633 (= lt!606402 e!781039)))

(declare-fun c!128467 () Bool)

(assert (=> b!1378633 (= c!128467 (validKeyInArray!0 (select (arr!45232 a!4032) to!206)))))

(assert (= (and start!117112 res!920589) b!1378631))

(assert (= (and b!1378631 res!920590) b!1378632))

(assert (= (and b!1378632 res!920588) b!1378626))

(assert (= (and b!1378626 res!920586) b!1378627))

(assert (= (and b!1378627 res!920591) b!1378633))

(assert (= (and b!1378633 c!128467) b!1378628))

(assert (= (and b!1378633 (not c!128467)) b!1378629))

(assert (= (or b!1378628 b!1378629) bm!66048))

(assert (= (or b!1378628 b!1378629) bm!66049))

(assert (= (and b!1378633 res!920587) b!1378625))

(assert (= (and b!1378625 res!920592) b!1378630))

(declare-fun m!1263201 () Bool)

(assert (=> b!1378630 m!1263201))

(declare-fun m!1263203 () Bool)

(assert (=> b!1378630 m!1263203))

(declare-fun m!1263205 () Bool)

(assert (=> b!1378630 m!1263205))

(declare-fun m!1263207 () Bool)

(assert (=> b!1378627 m!1263207))

(declare-fun m!1263209 () Bool)

(assert (=> b!1378627 m!1263209))

(declare-fun m!1263211 () Bool)

(assert (=> b!1378627 m!1263211))

(declare-fun m!1263213 () Bool)

(assert (=> b!1378631 m!1263213))

(assert (=> b!1378631 m!1263213))

(declare-fun m!1263215 () Bool)

(assert (=> b!1378631 m!1263215))

(declare-fun m!1263217 () Bool)

(assert (=> start!117112 m!1263217))

(declare-fun m!1263219 () Bool)

(assert (=> b!1378628 m!1263219))

(declare-fun m!1263221 () Bool)

(assert (=> b!1378628 m!1263221))

(declare-fun m!1263223 () Bool)

(assert (=> b!1378625 m!1263223))

(declare-fun m!1263225 () Bool)

(assert (=> b!1378625 m!1263225))

(declare-fun m!1263227 () Bool)

(assert (=> b!1378629 m!1263227))

(declare-fun m!1263229 () Bool)

(assert (=> b!1378629 m!1263229))

(assert (=> bm!66048 m!1263223))

(assert (=> bm!66049 m!1263225))

(declare-fun m!1263231 () Bool)

(assert (=> b!1378633 m!1263231))

(assert (=> b!1378633 m!1263231))

(declare-fun m!1263233 () Bool)

(assert (=> b!1378633 m!1263233))

(declare-fun m!1263235 () Bool)

(assert (=> b!1378632 m!1263235))

(check-sat (not start!117112) (not bm!66049) (not b!1378633) (not b!1378632) (not b!1378630) (not b!1378625) (not bm!66048) (not b!1378627) (not b!1378629) (not b!1378631) (not b!1378628))
(check-sat)
