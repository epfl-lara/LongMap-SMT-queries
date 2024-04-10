; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136666 () Bool)

(assert start!136666)

(declare-fun res!1078365 () Bool)

(declare-fun e!880345 () Bool)

(assert (=> start!136666 (=> (not res!1078365) (not e!880345))))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136666 (= res!1078365 (validMask!0 mask!918))))

(assert (=> start!136666 e!880345))

(assert (=> start!136666 true))

(declare-datatypes ((array!105728 0))(
  ( (array!105729 (arr!50977 (Array (_ BitVec 32) (_ BitVec 64))) (size!51527 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105728)

(declare-fun array_inv!39704 (array!105728) Bool)

(assert (=> start!136666 (array_inv!39704 _keys!614)))

(declare-fun b!1578316 () Bool)

(declare-fun res!1078362 () Bool)

(assert (=> b!1578316 (=> (not res!1078362) (not e!880345))))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578316 (= res!1078362 (validKeyInArray!0 k!772))))

(declare-fun b!1578318 () Bool)

(declare-datatypes ((SeekEntryResult!13764 0))(
  ( (MissingZero!13764 (index!57454 (_ BitVec 32))) (Found!13764 (index!57455 (_ BitVec 32))) (Intermediate!13764 (undefined!14576 Bool) (index!57456 (_ BitVec 32)) (x!142716 (_ BitVec 32))) (Undefined!13764) (MissingVacant!13764 (index!57457 (_ BitVec 32))) )
))
(declare-fun lt!676219 () SeekEntryResult!13764)

(assert (=> b!1578318 (= e!880345 (and (not (is-Undefined!13764 lt!676219)) (is-Found!13764 lt!676219) (or (bvslt (index!57455 lt!676219) #b00000000000000000000000000000000) (bvsge (index!57455 lt!676219) (size!51527 _keys!614)))))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105728 (_ BitVec 32)) SeekEntryResult!13764)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578318 (= lt!676219 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918))))

(declare-fun b!1578317 () Bool)

(declare-fun res!1078363 () Bool)

(assert (=> b!1578317 (=> (not res!1078363) (not e!880345))))

(assert (=> b!1578317 (= res!1078363 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50977 _keys!614) ee!18) k!772)) (not (= (select (arr!50977 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578315 () Bool)

(declare-fun res!1078364 () Bool)

(assert (=> b!1578315 (=> (not res!1078364) (not e!880345))))

(assert (=> b!1578315 (= res!1078364 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51527 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50977 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!136666 res!1078365) b!1578315))

(assert (= (and b!1578315 res!1078364) b!1578316))

(assert (= (and b!1578316 res!1078362) b!1578317))

(assert (= (and b!1578317 res!1078363) b!1578318))

(declare-fun m!1450417 () Bool)

(assert (=> b!1578318 m!1450417))

(assert (=> b!1578318 m!1450417))

(declare-fun m!1450419 () Bool)

(assert (=> b!1578318 m!1450419))

(declare-fun m!1450421 () Bool)

(assert (=> b!1578317 m!1450421))

(declare-fun m!1450423 () Bool)

(assert (=> start!136666 m!1450423))

(declare-fun m!1450425 () Bool)

(assert (=> start!136666 m!1450425))

(declare-fun m!1450427 () Bool)

(assert (=> b!1578315 m!1450427))

(declare-fun m!1450429 () Bool)

(assert (=> b!1578316 m!1450429))

(push 1)

(assert (not start!136666))

(assert (not b!1578318))

(assert (not b!1578316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166049 () Bool)

(assert (=> d!166049 (= (validMask!0 mask!918) (and (or (= mask!918 #b00000000000000000000000000000111) (= mask!918 #b00000000000000000000000000001111) (= mask!918 #b00000000000000000000000000011111) (= mask!918 #b00000000000000000000000000111111) (= mask!918 #b00000000000000000000000001111111) (= mask!918 #b00000000000000000000000011111111) (= mask!918 #b00000000000000000000000111111111) (= mask!918 #b00000000000000000000001111111111) (= mask!918 #b00000000000000000000011111111111) (= mask!918 #b00000000000000000000111111111111) (= mask!918 #b00000000000000000001111111111111) (= mask!918 #b00000000000000000011111111111111) (= mask!918 #b00000000000000000111111111111111) (= mask!918 #b00000000000000001111111111111111) (= mask!918 #b00000000000000011111111111111111) (= mask!918 #b00000000000000111111111111111111) (= mask!918 #b00000000000001111111111111111111) (= mask!918 #b00000000000011111111111111111111) (= mask!918 #b00000000000111111111111111111111) (= mask!918 #b00000000001111111111111111111111) (= mask!918 #b00000000011111111111111111111111) (= mask!918 #b00000000111111111111111111111111) (= mask!918 #b00000001111111111111111111111111) (= mask!918 #b00000011111111111111111111111111) (= mask!918 #b00000111111111111111111111111111) (= mask!918 #b00001111111111111111111111111111) (= mask!918 #b00011111111111111111111111111111) (= mask!918 #b00111111111111111111111111111111)) (bvsle mask!918 #b00111111111111111111111111111111)))))

(assert (=> start!136666 d!166049))

(declare-fun d!166055 () Bool)

(assert (=> d!166055 (= (array_inv!39704 _keys!614) (bvsge (size!51527 _keys!614) #b00000000000000000000000000000000))))

(assert (=> start!136666 d!166055))

(declare-fun e!880382 () SeekEntryResult!13764)

(declare-fun b!1578386 () Bool)

(assert (=> b!1578386 (= e!880382 (Found!13764 (nextIndex!0 ee!18 x!466 mask!918)))))

(declare-fun d!166057 () Bool)

(declare-fun lt!676245 () SeekEntryResult!13764)

(assert (=> d!166057 (and (or (is-Undefined!13764 lt!676245) (not (is-Found!13764 lt!676245)) (and (bvsge (index!57455 lt!676245) #b00000000000000000000000000000000) (bvslt (index!57455 lt!676245) (size!51527 _keys!614)))) (or (is-Undefined!13764 lt!676245) (is-Found!13764 lt!676245) (not (is-MissingVacant!13764 lt!676245)) (not (= (index!57457 lt!676245) vacantSpotIndex!10)) (and (bvsge (index!57457 lt!676245) #b00000000000000000000000000000000) (bvslt (index!57457 lt!676245) (size!51527 _keys!614)))) (or (is-Undefined!13764 lt!676245) (ite (is-Found!13764 lt!676245) (= (select (arr!50977 _keys!614) (index!57455 lt!676245)) k!772) (and (is-MissingVacant!13764 lt!676245) (= (index!57457 lt!676245) vacantSpotIndex!10) (= (select (arr!50977 _keys!614) (index!57457 lt!676245)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!880381 () SeekEntryResult!13764)

(assert (=> d!166057 (= lt!676245 e!880381)))

(declare-fun c!146281 () Bool)

(assert (=> d!166057 (= c!146281 (bvsge (bvadd #b00000000000000000000000000000001 x!466) #b01111111111111111111111111111110))))

(declare-fun lt!676243 () (_ BitVec 64))

(assert (=> d!166057 (= lt!676243 (select (arr!50977 _keys!614) (nextIndex!0 ee!18 x!466 mask!918)))))

(assert (=> d!166057 (validMask!0 mask!918)))

(assert (=> d!166057 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918) lt!676245)))

(declare-fun b!1578388 () Bool)

(declare-fun c!146286 () Bool)

(assert (=> b!1578388 (= c!146286 (= lt!676243 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!880383 () SeekEntryResult!13764)

(assert (=> b!1578388 (= e!880382 e!880383)))

(declare-fun b!1578390 () Bool)

(assert (=> b!1578390 (= e!880381 e!880382)))

(declare-fun c!146284 () Bool)

(assert (=> b!1578390 (= c!146284 (= lt!676243 k!772))))

(declare-fun b!1578392 () Bool)

(assert (=> b!1578392 (= e!880383 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!18 x!466 mask!918) (bvadd #b00000000000000000000000000000001 x!466) mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918))))

(declare-fun b!1578394 () Bool)

(assert (=> b!1578394 (= e!880383 (MissingVacant!13764 vacantSpotIndex!10))))

(declare-fun b!1578396 () Bool)

(assert (=> b!1578396 (= e!880381 Undefined!13764)))

(assert (= (and d!166057 c!146281) b!1578396))

(assert (= (and d!166057 (not c!146281)) b!1578390))

(assert (= (and b!1578390 c!146284) b!1578386))

(assert (= (and b!1578390 (not c!146284)) b!1578388))

(assert (= (and b!1578388 c!146286) b!1578394))

(assert (= (and b!1578388 (not c!146286)) b!1578392))

(declare-fun m!1450471 () Bool)

(assert (=> d!166057 m!1450471))

(declare-fun m!1450475 () Bool)

(assert (=> d!166057 m!1450475))

(assert (=> d!166057 m!1450417))

(declare-fun m!1450477 () Bool)

(assert (=> d!166057 m!1450477))

(assert (=> d!166057 m!1450423))

(assert (=> b!1578392 m!1450417))

(declare-fun m!1450483 () Bool)

(assert (=> b!1578392 m!1450483))

(assert (=> b!1578392 m!1450483))

(declare-fun m!1450489 () Bool)

(assert (=> b!1578392 m!1450489))

(assert (=> b!1578318 d!166057))

(declare-fun d!166066 () Bool)

(declare-fun lt!676252 () (_ BitVec 32))

(assert (=> d!166066 (and (bvsge lt!676252 #b00000000000000000000000000000000) (bvslt lt!676252 (bvadd mask!918 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!166066 (= lt!676252 (choose!52 ee!18 x!466 mask!918))))

(assert (=> d!166066 (validMask!0 mask!918)))

(assert (=> d!166066 (= (nextIndex!0 ee!18 x!466 mask!918) lt!676252)))

