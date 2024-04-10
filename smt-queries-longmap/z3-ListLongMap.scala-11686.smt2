; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136668 () Bool)

(assert start!136668)

(declare-fun b!1578328 () Bool)

(declare-fun res!1078377 () Bool)

(declare-fun e!880351 () Bool)

(assert (=> b!1578328 (=> (not res!1078377) (not e!880351))))

(declare-fun k0!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578328 (= res!1078377 (validKeyInArray!0 k0!772))))

(declare-fun b!1578329 () Bool)

(declare-fun res!1078375 () Bool)

(assert (=> b!1578329 (=> (not res!1078375) (not e!880351))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105730 0))(
  ( (array!105731 (arr!50978 (Array (_ BitVec 32) (_ BitVec 64))) (size!51528 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105730)

(assert (=> b!1578329 (= res!1078375 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50978 _keys!614) ee!18) k0!772)) (not (= (select (arr!50978 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1078376 () Bool)

(assert (=> start!136668 (=> (not res!1078376) (not e!880351))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136668 (= res!1078376 (validMask!0 mask!918))))

(assert (=> start!136668 e!880351))

(assert (=> start!136668 true))

(declare-fun array_inv!39705 (array!105730) Bool)

(assert (=> start!136668 (array_inv!39705 _keys!614)))

(declare-fun b!1578330 () Bool)

(declare-datatypes ((SeekEntryResult!13765 0))(
  ( (MissingZero!13765 (index!57458 (_ BitVec 32))) (Found!13765 (index!57459 (_ BitVec 32))) (Intermediate!13765 (undefined!14577 Bool) (index!57460 (_ BitVec 32)) (x!142717 (_ BitVec 32))) (Undefined!13765) (MissingVacant!13765 (index!57461 (_ BitVec 32))) )
))
(declare-fun lt!676222 () SeekEntryResult!13765)

(get-info :version)

(assert (=> b!1578330 (= e!880351 (and (not ((_ is Undefined!13765) lt!676222)) ((_ is Found!13765) lt!676222) (or (bvslt (index!57459 lt!676222) #b00000000000000000000000000000000) (bvsge (index!57459 lt!676222) (size!51528 _keys!614)))))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105730 (_ BitVec 32)) SeekEntryResult!13765)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578330 (= lt!676222 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918))))

(declare-fun b!1578327 () Bool)

(declare-fun res!1078374 () Bool)

(assert (=> b!1578327 (=> (not res!1078374) (not e!880351))))

(assert (=> b!1578327 (= res!1078374 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51528 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50978 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!136668 res!1078376) b!1578327))

(assert (= (and b!1578327 res!1078374) b!1578328))

(assert (= (and b!1578328 res!1078377) b!1578329))

(assert (= (and b!1578329 res!1078375) b!1578330))

(declare-fun m!1450431 () Bool)

(assert (=> b!1578329 m!1450431))

(declare-fun m!1450433 () Bool)

(assert (=> start!136668 m!1450433))

(declare-fun m!1450435 () Bool)

(assert (=> start!136668 m!1450435))

(declare-fun m!1450437 () Bool)

(assert (=> b!1578327 m!1450437))

(declare-fun m!1450439 () Bool)

(assert (=> b!1578330 m!1450439))

(assert (=> b!1578330 m!1450439))

(declare-fun m!1450441 () Bool)

(assert (=> b!1578330 m!1450441))

(declare-fun m!1450443 () Bool)

(assert (=> b!1578328 m!1450443))

(check-sat (not b!1578328) (not b!1578330) (not start!136668))
(check-sat)
(get-model)

(declare-fun d!166043 () Bool)

(assert (=> d!166043 (= (validKeyInArray!0 k0!772) (and (not (= k0!772 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!772 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1578328 d!166043))

(declare-fun e!880367 () SeekEntryResult!13765)

(declare-fun b!1578355 () Bool)

(assert (=> b!1578355 (= e!880367 (Found!13765 (nextIndex!0 ee!18 x!466 mask!918)))))

(declare-fun b!1578356 () Bool)

(declare-fun e!880365 () SeekEntryResult!13765)

(assert (=> b!1578356 (= e!880365 e!880367)))

(declare-fun c!146267 () Bool)

(declare-fun lt!676230 () (_ BitVec 64))

(assert (=> b!1578356 (= c!146267 (= lt!676230 k0!772))))

(declare-fun lt!676231 () SeekEntryResult!13765)

(declare-fun d!166045 () Bool)

(assert (=> d!166045 (and (or ((_ is Undefined!13765) lt!676231) (not ((_ is Found!13765) lt!676231)) (and (bvsge (index!57459 lt!676231) #b00000000000000000000000000000000) (bvslt (index!57459 lt!676231) (size!51528 _keys!614)))) (or ((_ is Undefined!13765) lt!676231) ((_ is Found!13765) lt!676231) (not ((_ is MissingVacant!13765) lt!676231)) (not (= (index!57461 lt!676231) vacantSpotIndex!10)) (and (bvsge (index!57461 lt!676231) #b00000000000000000000000000000000) (bvslt (index!57461 lt!676231) (size!51528 _keys!614)))) (or ((_ is Undefined!13765) lt!676231) (ite ((_ is Found!13765) lt!676231) (= (select (arr!50978 _keys!614) (index!57459 lt!676231)) k0!772) (and ((_ is MissingVacant!13765) lt!676231) (= (index!57461 lt!676231) vacantSpotIndex!10) (= (select (arr!50978 _keys!614) (index!57461 lt!676231)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!166045 (= lt!676231 e!880365)))

(declare-fun c!146266 () Bool)

(assert (=> d!166045 (= c!146266 (bvsge (bvadd #b00000000000000000000000000000001 x!466) #b01111111111111111111111111111110))))

(assert (=> d!166045 (= lt!676230 (select (arr!50978 _keys!614) (nextIndex!0 ee!18 x!466 mask!918)))))

(assert (=> d!166045 (validMask!0 mask!918)))

(assert (=> d!166045 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918) lt!676231)))

(declare-fun b!1578357 () Bool)

(assert (=> b!1578357 (= e!880365 Undefined!13765)))

(declare-fun b!1578358 () Bool)

(declare-fun c!146268 () Bool)

(assert (=> b!1578358 (= c!146268 (= lt!676230 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!880366 () SeekEntryResult!13765)

(assert (=> b!1578358 (= e!880367 e!880366)))

(declare-fun b!1578359 () Bool)

(assert (=> b!1578359 (= e!880366 (MissingVacant!13765 vacantSpotIndex!10))))

(declare-fun b!1578360 () Bool)

(assert (=> b!1578360 (= e!880366 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!18 x!466 mask!918) (bvadd #b00000000000000000000000000000001 x!466) mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918))))

(assert (= (and d!166045 c!146266) b!1578357))

(assert (= (and d!166045 (not c!146266)) b!1578356))

(assert (= (and b!1578356 c!146267) b!1578355))

(assert (= (and b!1578356 (not c!146267)) b!1578358))

(assert (= (and b!1578358 c!146268) b!1578359))

(assert (= (and b!1578358 (not c!146268)) b!1578360))

(declare-fun m!1450459 () Bool)

(assert (=> d!166045 m!1450459))

(declare-fun m!1450461 () Bool)

(assert (=> d!166045 m!1450461))

(assert (=> d!166045 m!1450439))

(declare-fun m!1450463 () Bool)

(assert (=> d!166045 m!1450463))

(assert (=> d!166045 m!1450433))

(assert (=> b!1578360 m!1450439))

(declare-fun m!1450465 () Bool)

(assert (=> b!1578360 m!1450465))

(assert (=> b!1578360 m!1450465))

(declare-fun m!1450467 () Bool)

(assert (=> b!1578360 m!1450467))

(assert (=> b!1578330 d!166045))

(declare-fun d!166047 () Bool)

(declare-fun lt!676234 () (_ BitVec 32))

(assert (=> d!166047 (and (bvsge lt!676234 #b00000000000000000000000000000000) (bvslt lt!676234 (bvadd mask!918 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!166047 (= lt!676234 (choose!52 ee!18 x!466 mask!918))))

(assert (=> d!166047 (validMask!0 mask!918)))

(assert (=> d!166047 (= (nextIndex!0 ee!18 x!466 mask!918) lt!676234)))

(declare-fun bs!45652 () Bool)

(assert (= bs!45652 d!166047))

(declare-fun m!1450469 () Bool)

(assert (=> bs!45652 m!1450469))

(assert (=> bs!45652 m!1450433))

(assert (=> b!1578330 d!166047))

(declare-fun d!166053 () Bool)

(assert (=> d!166053 (= (validMask!0 mask!918) (and (or (= mask!918 #b00000000000000000000000000000111) (= mask!918 #b00000000000000000000000000001111) (= mask!918 #b00000000000000000000000000011111) (= mask!918 #b00000000000000000000000000111111) (= mask!918 #b00000000000000000000000001111111) (= mask!918 #b00000000000000000000000011111111) (= mask!918 #b00000000000000000000000111111111) (= mask!918 #b00000000000000000000001111111111) (= mask!918 #b00000000000000000000011111111111) (= mask!918 #b00000000000000000000111111111111) (= mask!918 #b00000000000000000001111111111111) (= mask!918 #b00000000000000000011111111111111) (= mask!918 #b00000000000000000111111111111111) (= mask!918 #b00000000000000001111111111111111) (= mask!918 #b00000000000000011111111111111111) (= mask!918 #b00000000000000111111111111111111) (= mask!918 #b00000000000001111111111111111111) (= mask!918 #b00000000000011111111111111111111) (= mask!918 #b00000000000111111111111111111111) (= mask!918 #b00000000001111111111111111111111) (= mask!918 #b00000000011111111111111111111111) (= mask!918 #b00000000111111111111111111111111) (= mask!918 #b00000001111111111111111111111111) (= mask!918 #b00000011111111111111111111111111) (= mask!918 #b00000111111111111111111111111111) (= mask!918 #b00001111111111111111111111111111) (= mask!918 #b00011111111111111111111111111111) (= mask!918 #b00111111111111111111111111111111)) (bvsle mask!918 #b00111111111111111111111111111111)))))

(assert (=> start!136668 d!166053))

(declare-fun d!166063 () Bool)

(assert (=> d!166063 (= (array_inv!39705 _keys!614) (bvsge (size!51528 _keys!614) #b00000000000000000000000000000000))))

(assert (=> start!136668 d!166063))

(check-sat (not d!166045) (not d!166047) (not b!1578360))
(check-sat)
