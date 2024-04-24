; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117082 () Bool)

(assert start!117082)

(declare-fun b!1378279 () Bool)

(declare-fun e!780836 () Bool)

(declare-fun e!780838 () Bool)

(assert (=> b!1378279 (= e!780836 e!780838)))

(declare-fun res!920333 () Bool)

(assert (=> b!1378279 (=> (not res!920333) (not e!780838))))

(declare-fun lt!606040 () (_ BitVec 32))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!606038 () (_ BitVec 32))

(declare-datatypes ((array!93637 0))(
  ( (array!93638 (arr!45217 (Array (_ BitVec 32) (_ BitVec 64))) (size!45768 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93637)

(assert (=> b!1378279 (= res!920333 (and (= lt!606038 lt!606040) (not (= to!206 (size!45768 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93637 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378279 (= lt!606040 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!606039 () array!93637)

(assert (=> b!1378279 (= lt!606038 (arrayCountValidKeys!0 lt!606039 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1378279 (= lt!606039 (array!93638 (store (arr!45217 a!4032) i!1445 k0!2947) (size!45768 a!4032)))))

(declare-fun b!1378280 () Bool)

(declare-fun res!920330 () Bool)

(assert (=> b!1378280 (=> (not res!920330) (not e!780836))))

(assert (=> b!1378280 (= res!920330 (and (bvslt (size!45768 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45768 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun bm!65958 () Bool)

(declare-fun call!65962 () (_ BitVec 32))

(declare-fun c!128422 () Bool)

(assert (=> bm!65958 (= call!65962 (arrayCountValidKeys!0 (ite c!128422 lt!606039 a!4032) (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun bm!65959 () Bool)

(declare-fun call!65961 () (_ BitVec 32))

(assert (=> bm!65959 (= call!65961 (arrayCountValidKeys!0 (ite c!128422 a!4032 lt!606039) (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1378281 () Bool)

(declare-fun res!920332 () Bool)

(assert (=> b!1378281 (=> (not res!920332) (not e!780836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378281 (= res!920332 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1378282 () Bool)

(declare-datatypes ((Unit!45584 0))(
  ( (Unit!45585) )
))
(declare-fun e!780837 () Unit!45584)

(declare-fun lt!606036 () Unit!45584)

(assert (=> b!1378282 (= e!780837 lt!606036)))

(declare-fun lt!606041 () Unit!45584)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93637 (_ BitVec 32) (_ BitVec 32)) Unit!45584)

(assert (=> b!1378282 (= lt!606041 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378282 (= call!65961 (bvadd #b00000000000000000000000000000001 lt!606040))))

(assert (=> b!1378282 (= lt!606036 (lemmaValidKeyIncreasesNumOfKeys!0 lt!606039 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378282 (= call!65962 (bvadd #b00000000000000000000000000000001 lt!606038))))

(declare-fun b!1378283 () Bool)

(declare-fun lt!606035 () Unit!45584)

(assert (=> b!1378283 (= e!780837 lt!606035)))

(declare-fun lt!606037 () Unit!45584)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93637 (_ BitVec 32) (_ BitVec 32)) Unit!45584)

(assert (=> b!1378283 (= lt!606037 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378283 (= call!65962 lt!606040)))

(assert (=> b!1378283 (= lt!606035 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!606039 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378283 (= call!65961 lt!606038)))

(declare-fun res!920331 () Bool)

(assert (=> start!117082 (=> (not res!920331) (not e!780836))))

(assert (=> start!117082 (= res!920331 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45768 a!4032))))))

(assert (=> start!117082 e!780836))

(assert (=> start!117082 true))

(declare-fun array_inv!34498 (array!93637) Bool)

(assert (=> start!117082 (array_inv!34498 a!4032)))

(declare-fun b!1378284 () Bool)

(declare-fun res!920334 () Bool)

(assert (=> b!1378284 (=> (not res!920334) (not e!780836))))

(assert (=> b!1378284 (= res!920334 (validKeyInArray!0 (select (arr!45217 a!4032) i!1445)))))

(declare-fun b!1378285 () Bool)

(assert (=> b!1378285 (= e!780838 false)))

(declare-fun lt!606042 () Unit!45584)

(assert (=> b!1378285 (= lt!606042 e!780837)))

(assert (=> b!1378285 (= c!128422 (validKeyInArray!0 (select (arr!45217 a!4032) to!206)))))

(assert (= (and start!117082 res!920331) b!1378284))

(assert (= (and b!1378284 res!920334) b!1378281))

(assert (= (and b!1378281 res!920332) b!1378280))

(assert (= (and b!1378280 res!920330) b!1378279))

(assert (= (and b!1378279 res!920333) b!1378285))

(assert (= (and b!1378285 c!128422) b!1378282))

(assert (= (and b!1378285 (not c!128422)) b!1378283))

(assert (= (or b!1378282 b!1378283) bm!65958))

(assert (= (or b!1378282 b!1378283) bm!65959))

(declare-fun m!1262751 () Bool)

(assert (=> b!1378285 m!1262751))

(assert (=> b!1378285 m!1262751))

(declare-fun m!1262753 () Bool)

(assert (=> b!1378285 m!1262753))

(declare-fun m!1262755 () Bool)

(assert (=> start!117082 m!1262755))

(declare-fun m!1262757 () Bool)

(assert (=> bm!65959 m!1262757))

(declare-fun m!1262759 () Bool)

(assert (=> b!1378281 m!1262759))

(declare-fun m!1262761 () Bool)

(assert (=> b!1378282 m!1262761))

(declare-fun m!1262763 () Bool)

(assert (=> b!1378282 m!1262763))

(declare-fun m!1262765 () Bool)

(assert (=> b!1378283 m!1262765))

(declare-fun m!1262767 () Bool)

(assert (=> b!1378283 m!1262767))

(declare-fun m!1262769 () Bool)

(assert (=> b!1378279 m!1262769))

(declare-fun m!1262771 () Bool)

(assert (=> b!1378279 m!1262771))

(declare-fun m!1262773 () Bool)

(assert (=> b!1378279 m!1262773))

(declare-fun m!1262775 () Bool)

(assert (=> b!1378284 m!1262775))

(assert (=> b!1378284 m!1262775))

(declare-fun m!1262777 () Bool)

(assert (=> b!1378284 m!1262777))

(declare-fun m!1262779 () Bool)

(assert (=> bm!65958 m!1262779))

(check-sat (not b!1378282) (not start!117082) (not bm!65959) (not b!1378285) (not b!1378279) (not b!1378281) (not bm!65958) (not b!1378284) (not b!1378283))
(check-sat)
