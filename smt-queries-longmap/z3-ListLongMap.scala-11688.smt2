; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136710 () Bool)

(assert start!136710)

(declare-fun b!1578455 () Bool)

(declare-fun res!1078449 () Bool)

(declare-fun e!880414 () Bool)

(assert (=> b!1578455 (=> (not res!1078449) (not e!880414))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105745 0))(
  ( (array!105746 (arr!50984 (Array (_ BitVec 32) (_ BitVec 64))) (size!51534 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105745)

(assert (=> b!1578455 (= res!1078449 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50984 _keys!614) ee!18) k0!772)) (not (= (select (arr!50984 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1078448 () Bool)

(assert (=> start!136710 (=> (not res!1078448) (not e!880414))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136710 (= res!1078448 (validMask!0 mask!918))))

(assert (=> start!136710 e!880414))

(assert (=> start!136710 true))

(declare-fun array_inv!39711 (array!105745) Bool)

(assert (=> start!136710 (array_inv!39711 _keys!614)))

(declare-fun b!1578453 () Bool)

(declare-fun res!1078447 () Bool)

(assert (=> b!1578453 (=> (not res!1078447) (not e!880414))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(assert (=> b!1578453 (= res!1078447 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51534 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50984 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578454 () Bool)

(declare-fun res!1078446 () Bool)

(assert (=> b!1578454 (=> (not res!1078446) (not e!880414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578454 (= res!1078446 (validKeyInArray!0 k0!772))))

(declare-datatypes ((SeekEntryResult!13771 0))(
  ( (MissingZero!13771 (index!57482 (_ BitVec 32))) (Found!13771 (index!57483 (_ BitVec 32))) (Intermediate!13771 (undefined!14583 Bool) (index!57484 (_ BitVec 32)) (x!142745 (_ BitVec 32))) (Undefined!13771) (MissingVacant!13771 (index!57485 (_ BitVec 32))) )
))
(declare-fun lt!676267 () SeekEntryResult!13771)

(declare-fun b!1578456 () Bool)

(get-info :version)

(assert (=> b!1578456 (= e!880414 (and (not ((_ is Undefined!13771) lt!676267)) (ite ((_ is Found!13771) lt!676267) (not (= (select (arr!50984 _keys!614) (index!57483 lt!676267)) k0!772)) (or (not ((_ is MissingVacant!13771) lt!676267)) (not (= (index!57485 lt!676267) vacantSpotIndex!10)) (not (= (select (arr!50984 _keys!614) (index!57485 lt!676267)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105745 (_ BitVec 32)) SeekEntryResult!13771)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578456 (= lt!676267 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918))))

(assert (= (and start!136710 res!1078448) b!1578453))

(assert (= (and b!1578453 res!1078447) b!1578454))

(assert (= (and b!1578454 res!1078446) b!1578455))

(assert (= (and b!1578455 res!1078449) b!1578456))

(declare-fun m!1450555 () Bool)

(assert (=> start!136710 m!1450555))

(declare-fun m!1450557 () Bool)

(assert (=> start!136710 m!1450557))

(declare-fun m!1450559 () Bool)

(assert (=> b!1578454 m!1450559))

(declare-fun m!1450561 () Bool)

(assert (=> b!1578456 m!1450561))

(declare-fun m!1450563 () Bool)

(assert (=> b!1578456 m!1450563))

(declare-fun m!1450565 () Bool)

(assert (=> b!1578456 m!1450565))

(assert (=> b!1578456 m!1450565))

(declare-fun m!1450567 () Bool)

(assert (=> b!1578456 m!1450567))

(declare-fun m!1450569 () Bool)

(assert (=> b!1578453 m!1450569))

(declare-fun m!1450571 () Bool)

(assert (=> b!1578455 m!1450571))

(check-sat (not b!1578456) (not start!136710) (not b!1578454))
(check-sat)
(get-model)

(declare-fun b!1578481 () Bool)

(declare-fun e!880428 () SeekEntryResult!13771)

(declare-fun e!880430 () SeekEntryResult!13771)

(assert (=> b!1578481 (= e!880428 e!880430)))

(declare-fun c!146294 () Bool)

(declare-fun lt!676276 () (_ BitVec 64))

(assert (=> b!1578481 (= c!146294 (= lt!676276 k0!772))))

(declare-fun d!166077 () Bool)

(declare-fun lt!676275 () SeekEntryResult!13771)

(assert (=> d!166077 (and (or ((_ is Undefined!13771) lt!676275) (not ((_ is Found!13771) lt!676275)) (and (bvsge (index!57483 lt!676275) #b00000000000000000000000000000000) (bvslt (index!57483 lt!676275) (size!51534 _keys!614)))) (or ((_ is Undefined!13771) lt!676275) ((_ is Found!13771) lt!676275) (not ((_ is MissingVacant!13771) lt!676275)) (not (= (index!57485 lt!676275) vacantSpotIndex!10)) (and (bvsge (index!57485 lt!676275) #b00000000000000000000000000000000) (bvslt (index!57485 lt!676275) (size!51534 _keys!614)))) (or ((_ is Undefined!13771) lt!676275) (ite ((_ is Found!13771) lt!676275) (= (select (arr!50984 _keys!614) (index!57483 lt!676275)) k0!772) (and ((_ is MissingVacant!13771) lt!676275) (= (index!57485 lt!676275) vacantSpotIndex!10) (= (select (arr!50984 _keys!614) (index!57485 lt!676275)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!166077 (= lt!676275 e!880428)))

(declare-fun c!146293 () Bool)

(assert (=> d!166077 (= c!146293 (bvsge (bvadd #b00000000000000000000000000000001 x!466) #b01111111111111111111111111111110))))

(assert (=> d!166077 (= lt!676276 (select (arr!50984 _keys!614) (nextIndex!0 ee!18 x!466 mask!918)))))

(assert (=> d!166077 (validMask!0 mask!918)))

(assert (=> d!166077 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918) lt!676275)))

(declare-fun e!880429 () SeekEntryResult!13771)

(declare-fun b!1578482 () Bool)

(assert (=> b!1578482 (= e!880429 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!18 x!466 mask!918) (bvadd #b00000000000000000000000000000001 x!466) mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918))))

(declare-fun b!1578483 () Bool)

(assert (=> b!1578483 (= e!880430 (Found!13771 (nextIndex!0 ee!18 x!466 mask!918)))))

(declare-fun b!1578484 () Bool)

(assert (=> b!1578484 (= e!880429 (MissingVacant!13771 vacantSpotIndex!10))))

(declare-fun b!1578485 () Bool)

(assert (=> b!1578485 (= e!880428 Undefined!13771)))

(declare-fun b!1578486 () Bool)

(declare-fun c!146295 () Bool)

(assert (=> b!1578486 (= c!146295 (= lt!676276 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1578486 (= e!880430 e!880429)))

(assert (= (and d!166077 c!146293) b!1578485))

(assert (= (and d!166077 (not c!146293)) b!1578481))

(assert (= (and b!1578481 c!146294) b!1578483))

(assert (= (and b!1578481 (not c!146294)) b!1578486))

(assert (= (and b!1578486 c!146295) b!1578484))

(assert (= (and b!1578486 (not c!146295)) b!1578482))

(declare-fun m!1450591 () Bool)

(assert (=> d!166077 m!1450591))

(declare-fun m!1450593 () Bool)

(assert (=> d!166077 m!1450593))

(assert (=> d!166077 m!1450565))

(declare-fun m!1450595 () Bool)

(assert (=> d!166077 m!1450595))

(assert (=> d!166077 m!1450555))

(assert (=> b!1578482 m!1450565))

(declare-fun m!1450597 () Bool)

(assert (=> b!1578482 m!1450597))

(assert (=> b!1578482 m!1450597))

(declare-fun m!1450599 () Bool)

(assert (=> b!1578482 m!1450599))

(assert (=> b!1578456 d!166077))

(declare-fun d!166081 () Bool)

(declare-fun lt!676279 () (_ BitVec 32))

(assert (=> d!166081 (and (bvsge lt!676279 #b00000000000000000000000000000000) (bvslt lt!676279 (bvadd mask!918 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!166081 (= lt!676279 (choose!52 ee!18 x!466 mask!918))))

(assert (=> d!166081 (validMask!0 mask!918)))

(assert (=> d!166081 (= (nextIndex!0 ee!18 x!466 mask!918) lt!676279)))

(declare-fun bs!45661 () Bool)

(assert (= bs!45661 d!166081))

(declare-fun m!1450601 () Bool)

(assert (=> bs!45661 m!1450601))

(assert (=> bs!45661 m!1450555))

(assert (=> b!1578456 d!166081))

(declare-fun d!166083 () Bool)

(assert (=> d!166083 (= (validMask!0 mask!918) (and (or (= mask!918 #b00000000000000000000000000000111) (= mask!918 #b00000000000000000000000000001111) (= mask!918 #b00000000000000000000000000011111) (= mask!918 #b00000000000000000000000000111111) (= mask!918 #b00000000000000000000000001111111) (= mask!918 #b00000000000000000000000011111111) (= mask!918 #b00000000000000000000000111111111) (= mask!918 #b00000000000000000000001111111111) (= mask!918 #b00000000000000000000011111111111) (= mask!918 #b00000000000000000000111111111111) (= mask!918 #b00000000000000000001111111111111) (= mask!918 #b00000000000000000011111111111111) (= mask!918 #b00000000000000000111111111111111) (= mask!918 #b00000000000000001111111111111111) (= mask!918 #b00000000000000011111111111111111) (= mask!918 #b00000000000000111111111111111111) (= mask!918 #b00000000000001111111111111111111) (= mask!918 #b00000000000011111111111111111111) (= mask!918 #b00000000000111111111111111111111) (= mask!918 #b00000000001111111111111111111111) (= mask!918 #b00000000011111111111111111111111) (= mask!918 #b00000000111111111111111111111111) (= mask!918 #b00000001111111111111111111111111) (= mask!918 #b00000011111111111111111111111111) (= mask!918 #b00000111111111111111111111111111) (= mask!918 #b00001111111111111111111111111111) (= mask!918 #b00011111111111111111111111111111) (= mask!918 #b00111111111111111111111111111111)) (bvsle mask!918 #b00111111111111111111111111111111)))))

(assert (=> start!136710 d!166083))

(declare-fun d!166091 () Bool)

(assert (=> d!166091 (= (array_inv!39711 _keys!614) (bvsge (size!51534 _keys!614) #b00000000000000000000000000000000))))

(assert (=> start!136710 d!166091))

(declare-fun d!166093 () Bool)

(assert (=> d!166093 (= (validKeyInArray!0 k0!772) (and (not (= k0!772 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!772 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1578454 d!166093))

(check-sat (not d!166081) (not b!1578482) (not d!166077))
(check-sat)
