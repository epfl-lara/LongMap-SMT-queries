; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117118 () Bool)

(assert start!117118)

(declare-fun b!1378706 () Bool)

(declare-fun e!781082 () Bool)

(declare-fun e!781080 () Bool)

(assert (=> b!1378706 (= e!781082 e!781080)))

(declare-fun res!920655 () Bool)

(assert (=> b!1378706 (=> (not res!920655) (not e!781080))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun i!1445 () (_ BitVec 32))

(declare-datatypes ((array!93673 0))(
  ( (array!93674 (arr!45235 (Array (_ BitVec 32) (_ BitVec 64))) (size!45786 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93673)

(assert (=> b!1378706 (= res!920655 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45786 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-datatypes ((Unit!45620 0))(
  ( (Unit!45621) )
))
(declare-fun lt!606480 () Unit!45620)

(declare-fun e!781084 () Unit!45620)

(assert (=> b!1378706 (= lt!606480 e!781084)))

(declare-fun c!128476 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378706 (= c!128476 (validKeyInArray!0 (select (arr!45235 a!4032) to!206)))))

(declare-fun b!1378707 () Bool)

(declare-fun res!920654 () Bool)

(declare-fun e!781083 () Bool)

(assert (=> b!1378707 (=> (not res!920654) (not e!781083))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1378707 (= res!920654 (not (validKeyInArray!0 k0!2947)))))

(declare-fun lt!606478 () array!93673)

(declare-fun bm!66066 () Bool)

(declare-fun call!66070 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93673 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66066 (= call!66070 (arrayCountValidKeys!0 lt!606478 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1378708 () Bool)

(declare-fun res!920652 () Bool)

(assert (=> b!1378708 (=> (not res!920652) (not e!781080))))

(assert (=> b!1378708 (= res!920652 (= (arrayCountValidKeys!0 lt!606478 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1378709 () Bool)

(declare-fun lt!606485 () Unit!45620)

(assert (=> b!1378709 (= e!781084 lt!606485)))

(declare-fun lt!606483 () Unit!45620)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93673 (_ BitVec 32) (_ BitVec 32)) Unit!45620)

(assert (=> b!1378709 (= lt!606483 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!66069 () (_ BitVec 32))

(declare-fun lt!606482 () (_ BitVec 32))

(assert (=> b!1378709 (= call!66069 lt!606482)))

(assert (=> b!1378709 (= lt!606485 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!606478 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!606486 () (_ BitVec 32))

(assert (=> b!1378709 (= call!66070 lt!606486)))

(declare-fun bm!66067 () Bool)

(assert (=> bm!66067 (= call!66069 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1378710 () Bool)

(declare-fun lt!606484 () Unit!45620)

(assert (=> b!1378710 (= e!781084 lt!606484)))

(declare-fun lt!606479 () Unit!45620)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93673 (_ BitVec 32) (_ BitVec 32)) Unit!45620)

(assert (=> b!1378710 (= lt!606479 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378710 (= call!66069 (bvadd #b00000000000000000000000000000001 lt!606482))))

(assert (=> b!1378710 (= lt!606484 (lemmaValidKeyIncreasesNumOfKeys!0 lt!606478 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378710 (= call!66070 (bvadd #b00000000000000000000000000000001 lt!606486))))

(declare-fun b!1378711 () Bool)

(declare-fun res!920653 () Bool)

(assert (=> b!1378711 (=> (not res!920653) (not e!781083))))

(assert (=> b!1378711 (= res!920653 (validKeyInArray!0 (select (arr!45235 a!4032) i!1445)))))

(declare-fun b!1378712 () Bool)

(assert (=> b!1378712 (= e!781080 (not true))))

(assert (=> b!1378712 (= (arrayCountValidKeys!0 lt!606478 (bvadd #b00000000000000000000000000000001 i!1445) (size!45786 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45786 a!4032)))))

(declare-fun lt!606481 () Unit!45620)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45620)

(assert (=> b!1378712 (= lt!606481 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k0!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1378713 () Bool)

(declare-fun res!920650 () Bool)

(assert (=> b!1378713 (=> (not res!920650) (not e!781083))))

(assert (=> b!1378713 (= res!920650 (and (bvslt (size!45786 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45786 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1378714 () Bool)

(assert (=> b!1378714 (= e!781083 e!781082)))

(declare-fun res!920649 () Bool)

(assert (=> b!1378714 (=> (not res!920649) (not e!781082))))

(assert (=> b!1378714 (= res!920649 (and (= lt!606486 lt!606482) (not (= to!206 (size!45786 a!4032)))))))

(assert (=> b!1378714 (= lt!606482 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378714 (= lt!606486 (arrayCountValidKeys!0 lt!606478 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378714 (= lt!606478 (array!93674 (store (arr!45235 a!4032) i!1445 k0!2947) (size!45786 a!4032)))))

(declare-fun res!920651 () Bool)

(assert (=> start!117118 (=> (not res!920651) (not e!781083))))

(assert (=> start!117118 (= res!920651 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45786 a!4032))))))

(assert (=> start!117118 e!781083))

(assert (=> start!117118 true))

(declare-fun array_inv!34516 (array!93673) Bool)

(assert (=> start!117118 (array_inv!34516 a!4032)))

(assert (= (and start!117118 res!920651) b!1378711))

(assert (= (and b!1378711 res!920653) b!1378707))

(assert (= (and b!1378707 res!920654) b!1378713))

(assert (= (and b!1378713 res!920650) b!1378714))

(assert (= (and b!1378714 res!920649) b!1378706))

(assert (= (and b!1378706 c!128476) b!1378710))

(assert (= (and b!1378706 (not c!128476)) b!1378709))

(assert (= (or b!1378710 b!1378709) bm!66067))

(assert (= (or b!1378710 b!1378709) bm!66066))

(assert (= (and b!1378706 res!920655) b!1378708))

(assert (= (and b!1378708 res!920652) b!1378712))

(declare-fun m!1263309 () Bool)

(assert (=> b!1378706 m!1263309))

(assert (=> b!1378706 m!1263309))

(declare-fun m!1263311 () Bool)

(assert (=> b!1378706 m!1263311))

(declare-fun m!1263313 () Bool)

(assert (=> b!1378712 m!1263313))

(declare-fun m!1263315 () Bool)

(assert (=> b!1378712 m!1263315))

(declare-fun m!1263317 () Bool)

(assert (=> b!1378712 m!1263317))

(declare-fun m!1263319 () Bool)

(assert (=> b!1378707 m!1263319))

(declare-fun m!1263321 () Bool)

(assert (=> b!1378709 m!1263321))

(declare-fun m!1263323 () Bool)

(assert (=> b!1378709 m!1263323))

(declare-fun m!1263325 () Bool)

(assert (=> b!1378711 m!1263325))

(assert (=> b!1378711 m!1263325))

(declare-fun m!1263327 () Bool)

(assert (=> b!1378711 m!1263327))

(declare-fun m!1263329 () Bool)

(assert (=> b!1378708 m!1263329))

(declare-fun m!1263331 () Bool)

(assert (=> b!1378708 m!1263331))

(declare-fun m!1263333 () Bool)

(assert (=> b!1378714 m!1263333))

(declare-fun m!1263335 () Bool)

(assert (=> b!1378714 m!1263335))

(declare-fun m!1263337 () Bool)

(assert (=> b!1378714 m!1263337))

(assert (=> bm!66067 m!1263331))

(declare-fun m!1263339 () Bool)

(assert (=> start!117118 m!1263339))

(assert (=> bm!66066 m!1263329))

(declare-fun m!1263341 () Bool)

(assert (=> b!1378710 m!1263341))

(declare-fun m!1263343 () Bool)

(assert (=> b!1378710 m!1263343))

(check-sat (not b!1378712) (not b!1378708) (not bm!66066) (not b!1378714) (not start!117118) (not b!1378707) (not b!1378709) (not b!1378710) (not b!1378711) (not bm!66067) (not b!1378706))
(check-sat)
