; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136670 () Bool)

(assert start!136670)

(declare-fun b!1578341 () Bool)

(declare-fun res!1078389 () Bool)

(declare-fun e!880357 () Bool)

(assert (=> b!1578341 (=> (not res!1078389) (not e!880357))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun k!772 () (_ BitVec 64))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105732 0))(
  ( (array!105733 (arr!50979 (Array (_ BitVec 32) (_ BitVec 64))) (size!51529 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105732)

(assert (=> b!1578341 (= res!1078389 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50979 _keys!614) ee!18) k!772)) (not (= (select (arr!50979 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578340 () Bool)

(declare-fun res!1078388 () Bool)

(assert (=> b!1578340 (=> (not res!1078388) (not e!880357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578340 (= res!1078388 (validKeyInArray!0 k!772))))

(declare-fun b!1578339 () Bool)

(declare-fun res!1078386 () Bool)

(assert (=> b!1578339 (=> (not res!1078386) (not e!880357))))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(assert (=> b!1578339 (= res!1078386 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51529 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50979 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578342 () Bool)

(declare-datatypes ((SeekEntryResult!13766 0))(
  ( (MissingZero!13766 (index!57462 (_ BitVec 32))) (Found!13766 (index!57463 (_ BitVec 32))) (Intermediate!13766 (undefined!14578 Bool) (index!57464 (_ BitVec 32)) (x!142718 (_ BitVec 32))) (Undefined!13766) (MissingVacant!13766 (index!57465 (_ BitVec 32))) )
))
(declare-fun lt!676225 () SeekEntryResult!13766)

(assert (=> b!1578342 (= e!880357 (and (not (is-Undefined!13766 lt!676225)) (is-Found!13766 lt!676225) (or (bvslt (index!57463 lt!676225) #b00000000000000000000000000000000) (bvsge (index!57463 lt!676225) (size!51529 _keys!614)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105732 (_ BitVec 32)) SeekEntryResult!13766)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578342 (= lt!676225 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918))))

(declare-fun res!1078387 () Bool)

(assert (=> start!136670 (=> (not res!1078387) (not e!880357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136670 (= res!1078387 (validMask!0 mask!918))))

(assert (=> start!136670 e!880357))

(assert (=> start!136670 true))

(declare-fun array_inv!39706 (array!105732) Bool)

(assert (=> start!136670 (array_inv!39706 _keys!614)))

(assert (= (and start!136670 res!1078387) b!1578339))

(assert (= (and b!1578339 res!1078386) b!1578340))

(assert (= (and b!1578340 res!1078388) b!1578341))

(assert (= (and b!1578341 res!1078389) b!1578342))

(declare-fun m!1450445 () Bool)

(assert (=> b!1578342 m!1450445))

(assert (=> b!1578342 m!1450445))

(declare-fun m!1450447 () Bool)

(assert (=> b!1578342 m!1450447))

(declare-fun m!1450449 () Bool)

(assert (=> start!136670 m!1450449))

(declare-fun m!1450451 () Bool)

(assert (=> start!136670 m!1450451))

(declare-fun m!1450453 () Bool)

(assert (=> b!1578340 m!1450453))

(declare-fun m!1450455 () Bool)

(assert (=> b!1578339 m!1450455))

(declare-fun m!1450457 () Bool)

(assert (=> b!1578341 m!1450457))

(push 1)

(assert (not start!136670))

(assert (not b!1578342))

(assert (not b!1578340))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166051 () Bool)

(assert (=> d!166051 (= (validMask!0 mask!918) (and (or (= mask!918 #b00000000000000000000000000000111) (= mask!918 #b00000000000000000000000000001111) (= mask!918 #b00000000000000000000000000011111) (= mask!918 #b00000000000000000000000000111111) (= mask!918 #b00000000000000000000000001111111) (= mask!918 #b00000000000000000000000011111111) (= mask!918 #b00000000000000000000000111111111) (= mask!918 #b00000000000000000000001111111111) (= mask!918 #b00000000000000000000011111111111) (= mask!918 #b00000000000000000000111111111111) (= mask!918 #b00000000000000000001111111111111) (= mask!918 #b00000000000000000011111111111111) (= mask!918 #b00000000000000000111111111111111) (= mask!918 #b00000000000000001111111111111111) (= mask!918 #b00000000000000011111111111111111) (= mask!918 #b00000000000000111111111111111111) (= mask!918 #b00000000000001111111111111111111) (= mask!918 #b00000000000011111111111111111111) (= mask!918 #b00000000000111111111111111111111) (= mask!918 #b00000000001111111111111111111111) (= mask!918 #b00000000011111111111111111111111) (= mask!918 #b00000000111111111111111111111111) (= mask!918 #b00000001111111111111111111111111) (= mask!918 #b00000011111111111111111111111111) (= mask!918 #b00000111111111111111111111111111) (= mask!918 #b00001111111111111111111111111111) (= mask!918 #b00011111111111111111111111111111) (= mask!918 #b00111111111111111111111111111111)) (bvsle mask!918 #b00111111111111111111111111111111)))))

(assert (=> start!136670 d!166051))

(declare-fun d!166059 () Bool)

(assert (=> d!166059 (= (array_inv!39706 _keys!614) (bvsge (size!51529 _keys!614) #b00000000000000000000000000000000))))

(assert (=> start!136670 d!166059))

(declare-fun b!1578385 () Bool)

(declare-fun e!880380 () SeekEntryResult!13766)

(assert (=> b!1578385 (= e!880380 Undefined!13766)))

(declare-fun b!1578387 () Bool)

(declare-fun e!880384 () SeekEntryResult!13766)

(assert (=> b!1578387 (= e!880384 (MissingVacant!13766 vacantSpotIndex!10))))

(declare-fun e!880385 () SeekEntryResult!13766)

(declare-fun b!1578389 () Bool)

(assert (=> b!1578389 (= e!880385 (Found!13766 (nextIndex!0 ee!18 x!466 mask!918)))))

(declare-fun b!1578391 () Bool)

(assert (=> b!1578391 (= e!880380 e!880385)))

(declare-fun c!146282 () Bool)

(declare-fun lt!676246 () (_ BitVec 64))

(assert (=> b!1578391 (= c!146282 (= lt!676246 k!772))))

(declare-fun b!1578393 () Bool)

(assert (=> b!1578393 (= e!880384 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!18 x!466 mask!918) (bvadd #b00000000000000000000000000000001 x!466) mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918))))

(declare-fun b!1578395 () Bool)

(declare-fun c!146285 () Bool)

(assert (=> b!1578395 (= c!146285 (= lt!676246 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1578395 (= e!880385 e!880384)))

(declare-fun lt!676244 () SeekEntryResult!13766)

(declare-fun d!166061 () Bool)

(assert (=> d!166061 (and (or (is-Undefined!13766 lt!676244) (not (is-Found!13766 lt!676244)) (and (bvsge (index!57463 lt!676244) #b00000000000000000000000000000000) (bvslt (index!57463 lt!676244) (size!51529 _keys!614)))) (or (is-Undefined!13766 lt!676244) (is-Found!13766 lt!676244) (not (is-MissingVacant!13766 lt!676244)) (not (= (index!57465 lt!676244) vacantSpotIndex!10)) (and (bvsge (index!57465 lt!676244) #b00000000000000000000000000000000) (bvslt (index!57465 lt!676244) (size!51529 _keys!614)))) (or (is-Undefined!13766 lt!676244) (ite (is-Found!13766 lt!676244) (= (select (arr!50979 _keys!614) (index!57463 lt!676244)) k!772) (and (is-MissingVacant!13766 lt!676244) (= (index!57465 lt!676244) vacantSpotIndex!10) (= (select (arr!50979 _keys!614) (index!57465 lt!676244)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!166061 (= lt!676244 e!880380)))

(declare-fun c!146283 () Bool)

(assert (=> d!166061 (= c!146283 (bvsge (bvadd #b00000000000000000000000000000001 x!466) #b01111111111111111111111111111110))))

(assert (=> d!166061 (= lt!676246 (select (arr!50979 _keys!614) (nextIndex!0 ee!18 x!466 mask!918)))))

(assert (=> d!166061 (validMask!0 mask!918)))

(assert (=> d!166061 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k!772 _keys!614 mask!918) lt!676244)))

(assert (= (and d!166061 c!146283) b!1578385))

(assert (= (and d!166061 (not c!146283)) b!1578391))

(assert (= (and b!1578391 c!146282) b!1578389))

(assert (= (and b!1578391 (not c!146282)) b!1578395))

