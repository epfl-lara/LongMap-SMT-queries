; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116886 () Bool)

(assert start!116886)

(declare-fun b!1377365 () Bool)

(declare-fun e!780214 () Bool)

(assert (=> b!1377365 (= e!780214 (not true))))

(declare-datatypes ((array!93555 0))(
  ( (array!93556 (arr!45181 (Array (_ BitVec 32) (_ BitVec 64))) (size!45731 (_ BitVec 32))) )
))
(declare-fun lt!605971 () array!93555)

(declare-fun i!1445 () (_ BitVec 32))

(declare-fun a!4032 () array!93555)

(declare-fun arrayCountValidKeys!0 (array!93555 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377365 (= (arrayCountValidKeys!0 lt!605971 (bvadd #b00000000000000000000000000000001 i!1445) (size!45731 a!4032)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (size!45731 a!4032)))))

(declare-fun to!206 () (_ BitVec 32))

(declare-fun k!2947 () (_ BitVec 64))

(declare-datatypes ((Unit!45679 0))(
  ( (Unit!45680) )
))
(declare-fun lt!605969 () Unit!45679)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93555 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45679)

(assert (=> b!1377365 (= lt!605969 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4032 i!1445 k!2947 (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun call!65996 () (_ BitVec 32))

(declare-fun bm!65992 () Bool)

(assert (=> bm!65992 (= call!65996 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377367 () Bool)

(declare-fun e!780213 () Bool)

(declare-fun e!780216 () Bool)

(assert (=> b!1377367 (= e!780213 e!780216)))

(declare-fun res!920109 () Bool)

(assert (=> b!1377367 (=> (not res!920109) (not e!780216))))

(declare-fun lt!605975 () (_ BitVec 32))

(declare-fun lt!605970 () (_ BitVec 32))

(assert (=> b!1377367 (= res!920109 (and (= lt!605970 lt!605975) (not (= to!206 (size!45731 a!4032)))))))

(assert (=> b!1377367 (= lt!605975 (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377367 (= lt!605970 (arrayCountValidKeys!0 lt!605971 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377367 (= lt!605971 (array!93556 (store (arr!45181 a!4032) i!1445 k!2947) (size!45731 a!4032)))))

(declare-fun b!1377368 () Bool)

(declare-fun res!920111 () Bool)

(assert (=> b!1377368 (=> (not res!920111) (not e!780213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377368 (= res!920111 (not (validKeyInArray!0 k!2947)))))

(declare-fun b!1377369 () Bool)

(declare-fun res!920113 () Bool)

(assert (=> b!1377369 (=> (not res!920113) (not e!780213))))

(assert (=> b!1377369 (= res!920113 (and (bvslt (size!45731 a!4032) #b01111111111111111111111111111111) (bvsge to!206 #b00000000000000000000000000000000) (bvsle to!206 (size!45731 a!4032)) (bvsgt to!206 i!1445)))))

(declare-fun b!1377370 () Bool)

(declare-fun res!920107 () Bool)

(assert (=> b!1377370 (=> (not res!920107) (not e!780214))))

(assert (=> b!1377370 (= res!920107 (= (arrayCountValidKeys!0 lt!605971 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)) (arrayCountValidKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206))))))

(declare-fun b!1377371 () Bool)

(declare-fun res!920112 () Bool)

(assert (=> b!1377371 (=> (not res!920112) (not e!780213))))

(assert (=> b!1377371 (= res!920112 (validKeyInArray!0 (select (arr!45181 a!4032) i!1445)))))

(declare-fun b!1377372 () Bool)

(declare-fun e!780217 () Unit!45679)

(declare-fun lt!605974 () Unit!45679)

(assert (=> b!1377372 (= e!780217 lt!605974)))

(declare-fun lt!605973 () Unit!45679)

(declare-fun lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 (array!93555 (_ BitVec 32) (_ BitVec 32)) Unit!45679)

(assert (=> b!1377372 (= lt!605973 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377372 (= call!65996 lt!605975)))

(assert (=> b!1377372 (= lt!605974 (lemmaNotValidKeyDoesNotIncreaseNumOfKeys!0 lt!605971 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(declare-fun call!65995 () (_ BitVec 32))

(assert (=> b!1377372 (= call!65995 lt!605970)))

(declare-fun b!1377366 () Bool)

(declare-fun lt!605976 () Unit!45679)

(assert (=> b!1377366 (= e!780217 lt!605976)))

(declare-fun lt!605972 () Unit!45679)

(declare-fun lemmaValidKeyIncreasesNumOfKeys!0 (array!93555 (_ BitVec 32) (_ BitVec 32)) Unit!45679)

(assert (=> b!1377366 (= lt!605972 (lemmaValidKeyIncreasesNumOfKeys!0 a!4032 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377366 (= call!65996 (bvadd #b00000000000000000000000000000001 lt!605975))))

(assert (=> b!1377366 (= lt!605976 (lemmaValidKeyIncreasesNumOfKeys!0 lt!605971 (bvadd #b00000000000000000000000000000001 i!1445) to!206))))

(assert (=> b!1377366 (= call!65995 (bvadd #b00000000000000000000000000000001 lt!605970))))

(declare-fun res!920110 () Bool)

(assert (=> start!116886 (=> (not res!920110) (not e!780213))))

(assert (=> start!116886 (= res!920110 (and (bvsge i!1445 #b00000000000000000000000000000000) (bvslt i!1445 (size!45731 a!4032))))))

(assert (=> start!116886 e!780213))

(assert (=> start!116886 true))

(declare-fun array_inv!34209 (array!93555) Bool)

(assert (=> start!116886 (array_inv!34209 a!4032)))

(declare-fun bm!65993 () Bool)

(assert (=> bm!65993 (= call!65995 (arrayCountValidKeys!0 lt!605971 (bvadd #b00000000000000000000000000000001 i!1445) (bvadd #b00000000000000000000000000000001 to!206)))))

(declare-fun b!1377373 () Bool)

(assert (=> b!1377373 (= e!780216 e!780214)))

(declare-fun res!920108 () Bool)

(assert (=> b!1377373 (=> (not res!920108) (not e!780214))))

(assert (=> b!1377373 (= res!920108 (and (bvsge (bvadd #b00000000000000000000000000000001 to!206) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!206) (size!45731 a!4032)) (bvsgt (bvadd #b00000000000000000000000000000001 to!206) i!1445)))))

(declare-fun lt!605977 () Unit!45679)

(assert (=> b!1377373 (= lt!605977 e!780217)))

(declare-fun c!128069 () Bool)

(assert (=> b!1377373 (= c!128069 (validKeyInArray!0 (select (arr!45181 a!4032) to!206)))))

(assert (= (and start!116886 res!920110) b!1377371))

(assert (= (and b!1377371 res!920112) b!1377368))

(assert (= (and b!1377368 res!920111) b!1377369))

(assert (= (and b!1377369 res!920113) b!1377367))

(assert (= (and b!1377367 res!920109) b!1377373))

(assert (= (and b!1377373 c!128069) b!1377366))

(assert (= (and b!1377373 (not c!128069)) b!1377372))

(assert (= (or b!1377366 b!1377372) bm!65992))

(assert (= (or b!1377366 b!1377372) bm!65993))

(assert (= (and b!1377373 res!920108) b!1377370))

(assert (= (and b!1377370 res!920107) b!1377365))

(declare-fun m!1261637 () Bool)

(assert (=> bm!65992 m!1261637))

(declare-fun m!1261639 () Bool)

(assert (=> b!1377373 m!1261639))

(assert (=> b!1377373 m!1261639))

(declare-fun m!1261641 () Bool)

(assert (=> b!1377373 m!1261641))

(declare-fun m!1261643 () Bool)

(assert (=> b!1377368 m!1261643))

(declare-fun m!1261645 () Bool)

(assert (=> b!1377365 m!1261645))

(declare-fun m!1261647 () Bool)

(assert (=> b!1377365 m!1261647))

(declare-fun m!1261649 () Bool)

(assert (=> b!1377365 m!1261649))

(declare-fun m!1261651 () Bool)

(assert (=> b!1377366 m!1261651))

(declare-fun m!1261653 () Bool)

(assert (=> b!1377366 m!1261653))

(declare-fun m!1261655 () Bool)

(assert (=> b!1377370 m!1261655))

(assert (=> b!1377370 m!1261637))

(assert (=> bm!65993 m!1261655))

(declare-fun m!1261657 () Bool)

(assert (=> b!1377372 m!1261657))

(declare-fun m!1261659 () Bool)

(assert (=> b!1377372 m!1261659))

(declare-fun m!1261661 () Bool)

(assert (=> b!1377367 m!1261661))

(declare-fun m!1261663 () Bool)

(assert (=> b!1377367 m!1261663))

(declare-fun m!1261665 () Bool)

(assert (=> b!1377367 m!1261665))

(declare-fun m!1261667 () Bool)

(assert (=> start!116886 m!1261667))

(declare-fun m!1261669 () Bool)

(assert (=> b!1377371 m!1261669))

(assert (=> b!1377371 m!1261669))

(declare-fun m!1261671 () Bool)

(assert (=> b!1377371 m!1261671))

(push 1)

(assert (not start!116886))

