; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117076 () Bool)

(assert start!117076)

(declare-fun b!1378216 () Bool)

(declare-fun e!780799 () Bool)

(declare-fun e!780800 () Bool)

(assert (=> b!1378216 (= e!780799 e!780800)))

(declare-fun res!920286 () Bool)

(assert (=> b!1378216 (=> (not res!920286) (not e!780800))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun lt!605970 () (_ BitVec 32))

(declare-datatypes ((array!93631 0))(
  ( (array!93632 (arr!45214 (Array (_ BitVec 32) (_ BitVec 64))) (size!45765 (_ BitVec 32))) )
))
(declare-fun a!4032 () array!93631)

(declare-fun lt!605964 () (_ BitVec 32))

(assert (=> b!1378216 (= res!920286 (and (= lt!605970 lt!605964) (not (= to!206 (size!45765 a!4032)))))))

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93631 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378216 (= lt!605964 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun lt!605967 () array!93631)

(assert (=> b!1378216 (= lt!605970 (arrayCountValidKeys!0 lt!605967 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun k0!2947 () (_ BitVec 64))

(assert (=> b!1378216 (= lt!605967 (array!93632 (store (arr!45214 a!4032) i!1445 k0!2947) (size!45765 a!4032)))))

(declare-fun b!1378217 () Bool)

(declare-datatypes ((Unit!45578 0))(
  ( (Unit!45579) )
))
(declare-fun e!780801 () Unit!45578)

(declare-fun lt!605969 () Unit!45578)

(assert (=> b!1378217 (= e!780801 lt!605969)))

(declare-fun lt!605966 () Unit!45578)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93631 (_ BitVec 32) (_ BitVec 32)) Unit!45578)

(assert (=> b!1378217 (= lt!605966 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65943 () (_ BitVec 32))

(assert (=> b!1378217 (= call!65943 lt!605964)))

(assert (=> b!1378217 (= lt!605969 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605967 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65944 () (_ BitVec 32))

(assert (=> b!1378217 (= call!65944 lt!605970)))

(declare-fun bm!65940 () Bool)

(assert (=> bm!65940 (= call!65943 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1378218 () Bool)

(assert (=> b!1378218 (= e!780800 false)))

(declare-fun lt!605965 () Unit!45578)

(assert (=> b!1378218 (= lt!605965 e!780801)))

(declare-fun c!128413 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378218 (= c!128413 (validKeyInArray!0 (select (arr!45214 a!4032) to!206)))))

(declare-fun b!1378219 () Bool)

(declare-fun res!920285 () Bool)

(assert (=> b!1378219 (=> (not res!920285) (not e!780799))))

(assert (=> b!1378219 (= res!920285 (and (bvslt (size!45765 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45765 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun res!920288 () Bool)

(assert (=> start!117076 (=> (not res!920288) (not e!780799))))

(assert (=> start!117076 (= res!920288 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45765 a!4032))))))

(assert (=> start!117076 e!780799))

(assert (=> start!117076 true))

(declare-fun array_inv!34495 (array!93631) Bool)

(assert (=> start!117076 (array_inv!34495 a!4032)))

(declare-fun b!1378220 () Bool)

(declare-fun res!920289 () Bool)

(assert (=> b!1378220 (=> (not res!920289) (not e!780799))))

(assert (=> b!1378220 (= res!920289 (validKeyInArray!0 (select (arr!45214 a!4032) i!1445)))))

(declare-fun b!1378221 () Bool)

(declare-fun res!920287 () Bool)

(assert (=> b!1378221 (=> (not res!920287) (not e!780799))))

(assert (=> b!1378221 (= res!920287 (not (validKeyInArray!0 k0!2947)))))

(declare-fun b!1378222 () Bool)

(declare-fun lt!605968 () Unit!45578)

(assert (=> b!1378222 (= e!780801 lt!605968)))

(declare-fun lt!605963 () Unit!45578)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93631 (_ BitVec 32) (_ BitVec 32)) Unit!45578)

(assert (=> b!1378222 (= lt!605963 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378222 (= call!65943 (bvadd #b00000000000000000000000000000001 lt!605964))))

(assert (=> b!1378222 (= lt!605968 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605967 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1378222 (= call!65944 (bvadd #b00000000000000000000000000000001 lt!605970))))

(declare-fun bm!65941 () Bool)

(assert (=> bm!65941 (= call!65944 (arrayCountValidKeys!0 lt!605967 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(assert (= (and start!117076 res!920288) b!1378220))

(assert (= (and b!1378220 res!920289) b!1378221))

(assert (= (and b!1378221 res!920287) b!1378219))

(assert (= (and b!1378219 res!920285) b!1378216))

(assert (= (and b!1378216 res!920286) b!1378218))

(assert (= (and b!1378218 c!128413) b!1378222))

(assert (= (and b!1378218 (not c!128413)) b!1378217))

(assert (= (or b!1378222 b!1378217) bm!65940))

(assert (= (or b!1378222 b!1378217) bm!65941))

(declare-fun m!1262661 () Bool)

(assert (=> bm!65941 m!1262661))

(declare-fun m!1262663 () Bool)

(assert (=> bm!65940 m!1262663))

(declare-fun m!1262665 () Bool)

(assert (=> b!1378221 m!1262665))

(declare-fun m!1262667 () Bool)

(assert (=> start!117076 m!1262667))

(declare-fun m!1262669 () Bool)

(assert (=> b!1378218 m!1262669))

(assert (=> b!1378218 m!1262669))

(declare-fun m!1262671 () Bool)

(assert (=> b!1378218 m!1262671))

(declare-fun m!1262673 () Bool)

(assert (=> b!1378216 m!1262673))

(declare-fun m!1262675 () Bool)

(assert (=> b!1378216 m!1262675))

(declare-fun m!1262677 () Bool)

(assert (=> b!1378216 m!1262677))

(declare-fun m!1262679 () Bool)

(assert (=> b!1378217 m!1262679))

(declare-fun m!1262681 () Bool)

(assert (=> b!1378217 m!1262681))

(declare-fun m!1262683 () Bool)

(assert (=> b!1378222 m!1262683))

(declare-fun m!1262685 () Bool)

(assert (=> b!1378222 m!1262685))

(declare-fun m!1262687 () Bool)

(assert (=> b!1378220 m!1262687))

(assert (=> b!1378220 m!1262687))

(declare-fun m!1262689 () Bool)

(assert (=> b!1378220 m!1262689))

(check-sat (not b!1378217) (not bm!65940) (not bm!65941) (not b!1378222) (not b!1378218) (not b!1378220) (not b!1378221) (not b!1378216) (not start!117076))
(check-sat)
