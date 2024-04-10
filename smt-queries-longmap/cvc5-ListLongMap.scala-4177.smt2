; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56918 () Bool)

(assert start!56918)

(declare-fun b!630231 () Bool)

(declare-fun res!407446 () Bool)

(declare-fun e!360375 () Bool)

(assert (=> b!630231 (=> (not res!407446) (not e!360375))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38051 0))(
  ( (array!38052 (arr!18261 (Array (_ BitVec 32) (_ BitVec 64))) (size!18625 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38051)

(assert (=> b!630231 (= res!407446 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18261 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!630232 () Bool)

(declare-fun res!407450 () Bool)

(assert (=> b!630232 (=> (not res!407450) (not e!360375))))

(declare-datatypes ((List!12302 0))(
  ( (Nil!12299) (Cons!12298 (h!13343 (_ BitVec 64)) (t!18530 List!12302)) )
))
(declare-fun arrayNoDuplicates!0 (array!38051 (_ BitVec 32) List!12302) Bool)

(assert (=> b!630232 (= res!407450 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12299))))

(declare-fun b!630233 () Bool)

(declare-fun res!407454 () Bool)

(declare-fun e!360371 () Bool)

(assert (=> b!630233 (=> (not res!407454) (not e!360371))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630233 (= res!407454 (validKeyInArray!0 (select (arr!18261 a!2986) j!136)))))

(declare-fun res!407451 () Bool)

(assert (=> start!56918 (=> (not res!407451) (not e!360371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56918 (= res!407451 (validMask!0 mask!3053))))

(assert (=> start!56918 e!360371))

(assert (=> start!56918 true))

(declare-fun array_inv!14057 (array!38051) Bool)

(assert (=> start!56918 (array_inv!14057 a!2986)))

(declare-fun b!630234 () Bool)

(declare-fun res!407456 () Bool)

(assert (=> b!630234 (=> (not res!407456) (not e!360371))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630234 (= res!407456 (and (= (size!18625 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18625 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18625 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630235 () Bool)

(declare-fun e!360370 () Bool)

(assert (=> b!630235 (= e!360375 e!360370)))

(declare-fun res!407452 () Bool)

(assert (=> b!630235 (=> (not res!407452) (not e!360370))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!630235 (= res!407452 (= (select (store (arr!18261 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291085 () array!38051)

(assert (=> b!630235 (= lt!291085 (array!38052 (store (arr!18261 a!2986) i!1108 k!1786) (size!18625 a!2986)))))

(declare-fun b!630236 () Bool)

(declare-fun res!407453 () Bool)

(assert (=> b!630236 (=> (not res!407453) (not e!360371))))

(assert (=> b!630236 (= res!407453 (validKeyInArray!0 k!1786))))

(declare-fun b!630237 () Bool)

(declare-fun res!407447 () Bool)

(assert (=> b!630237 (=> (not res!407447) (not e!360375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38051 (_ BitVec 32)) Bool)

(assert (=> b!630237 (= res!407447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun lt!291088 () (_ BitVec 64))

(declare-fun b!630238 () Bool)

(declare-fun e!360372 () Bool)

(declare-datatypes ((SeekEntryResult!6701 0))(
  ( (MissingZero!6701 (index!29091 (_ BitVec 32))) (Found!6701 (index!29092 (_ BitVec 32))) (Intermediate!6701 (undefined!7513 Bool) (index!29093 (_ BitVec 32)) (x!57830 (_ BitVec 32))) (Undefined!6701) (MissingVacant!6701 (index!29094 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38051 (_ BitVec 32)) SeekEntryResult!6701)

(assert (=> b!630238 (= e!360372 (not (not (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291088 lt!291085 mask!3053) Undefined!6701))))))

(declare-fun e!360374 () Bool)

(assert (=> b!630238 e!360374))

(declare-fun res!407448 () Bool)

(assert (=> b!630238 (=> (not res!407448) (not e!360374))))

(declare-fun lt!291084 () (_ BitVec 32))

(declare-fun lt!291082 () SeekEntryResult!6701)

(assert (=> b!630238 (= res!407448 (= lt!291082 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291084 vacantSpotIndex!68 lt!291088 lt!291085 mask!3053)))))

(assert (=> b!630238 (= lt!291082 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291084 vacantSpotIndex!68 (select (arr!18261 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!630238 (= lt!291088 (select (store (arr!18261 a!2986) i!1108 k!1786) j!136))))

(declare-datatypes ((Unit!21144 0))(
  ( (Unit!21145) )
))
(declare-fun lt!291087 () Unit!21144)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38051 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21144)

(assert (=> b!630238 (= lt!291087 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291084 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630238 (= lt!291084 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630239 () Bool)

(assert (=> b!630239 (= e!360371 e!360375)))

(declare-fun res!407449 () Bool)

(assert (=> b!630239 (=> (not res!407449) (not e!360375))))

(declare-fun lt!291086 () SeekEntryResult!6701)

(assert (=> b!630239 (= res!407449 (or (= lt!291086 (MissingZero!6701 i!1108)) (= lt!291086 (MissingVacant!6701 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38051 (_ BitVec 32)) SeekEntryResult!6701)

(assert (=> b!630239 (= lt!291086 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!630240 () Bool)

(assert (=> b!630240 (= e!360370 e!360372)))

(declare-fun res!407445 () Bool)

(assert (=> b!630240 (=> (not res!407445) (not e!360372))))

(declare-fun lt!291083 () SeekEntryResult!6701)

(assert (=> b!630240 (= res!407445 (and (= lt!291083 (Found!6701 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18261 a!2986) index!984) (select (arr!18261 a!2986) j!136))) (not (= (select (arr!18261 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!630240 (= lt!291083 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18261 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630241 () Bool)

(assert (=> b!630241 (= e!360374 (= lt!291083 lt!291082))))

(declare-fun b!630242 () Bool)

(declare-fun res!407455 () Bool)

(assert (=> b!630242 (=> (not res!407455) (not e!360371))))

(declare-fun arrayContainsKey!0 (array!38051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630242 (= res!407455 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56918 res!407451) b!630234))

(assert (= (and b!630234 res!407456) b!630233))

(assert (= (and b!630233 res!407454) b!630236))

(assert (= (and b!630236 res!407453) b!630242))

(assert (= (and b!630242 res!407455) b!630239))

(assert (= (and b!630239 res!407449) b!630237))

(assert (= (and b!630237 res!407447) b!630232))

(assert (= (and b!630232 res!407450) b!630231))

(assert (= (and b!630231 res!407446) b!630235))

(assert (= (and b!630235 res!407452) b!630240))

(assert (= (and b!630240 res!407445) b!630238))

(assert (= (and b!630238 res!407448) b!630241))

(declare-fun m!605253 () Bool)

(assert (=> b!630232 m!605253))

(declare-fun m!605255 () Bool)

(assert (=> b!630231 m!605255))

(declare-fun m!605257 () Bool)

(assert (=> b!630237 m!605257))

(declare-fun m!605259 () Bool)

(assert (=> b!630239 m!605259))

(declare-fun m!605261 () Bool)

(assert (=> b!630240 m!605261))

(declare-fun m!605263 () Bool)

(assert (=> b!630240 m!605263))

(assert (=> b!630240 m!605263))

(declare-fun m!605265 () Bool)

(assert (=> b!630240 m!605265))

(declare-fun m!605267 () Bool)

(assert (=> b!630236 m!605267))

(declare-fun m!605269 () Bool)

(assert (=> b!630242 m!605269))

(assert (=> b!630233 m!605263))

(assert (=> b!630233 m!605263))

(declare-fun m!605271 () Bool)

(assert (=> b!630233 m!605271))

(declare-fun m!605273 () Bool)

(assert (=> b!630238 m!605273))

(declare-fun m!605275 () Bool)

(assert (=> b!630238 m!605275))

(assert (=> b!630238 m!605263))

(declare-fun m!605277 () Bool)

(assert (=> b!630238 m!605277))

(assert (=> b!630238 m!605263))

(declare-fun m!605279 () Bool)

(assert (=> b!630238 m!605279))

(declare-fun m!605281 () Bool)

(assert (=> b!630238 m!605281))

(declare-fun m!605283 () Bool)

(assert (=> b!630238 m!605283))

(declare-fun m!605285 () Bool)

(assert (=> b!630238 m!605285))

(assert (=> b!630235 m!605277))

(declare-fun m!605287 () Bool)

(assert (=> b!630235 m!605287))

(declare-fun m!605289 () Bool)

(assert (=> start!56918 m!605289))

(declare-fun m!605291 () Bool)

(assert (=> start!56918 m!605291))

(push 1)

(assert (not b!630240))

(assert (not b!630232))

(assert (not b!630236))

(assert (not b!630242))

(assert (not b!630238))

(assert (not b!630233))

(assert (not b!630237))

(assert (not start!56918))

(assert (not b!630239))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89225 () Bool)

(declare-fun res!407539 () Bool)

(declare-fun e!360440 () Bool)

(assert (=> d!89225 (=> res!407539 e!360440)))

(assert (=> d!89225 (= res!407539 (= (select (arr!18261 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!89225 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!360440)))

(declare-fun b!630361 () Bool)

(declare-fun e!360441 () Bool)

(assert (=> b!630361 (= e!360440 e!360441)))

(declare-fun res!407540 () Bool)

(assert (=> b!630361 (=> (not res!407540) (not e!360441))))

(assert (=> b!630361 (= res!407540 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18625 a!2986)))))

(declare-fun b!630362 () Bool)

(assert (=> b!630362 (= e!360441 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89225 (not res!407539)) b!630361))

(assert (= (and b!630361 res!407540) b!630362))

(declare-fun m!605397 () Bool)

(assert (=> d!89225 m!605397))

(declare-fun m!605399 () Bool)

(assert (=> b!630362 m!605399))

(assert (=> b!630242 d!89225))

(declare-fun bm!33308 () Bool)

(declare-fun call!33311 () Bool)

(assert (=> bm!33308 (= call!33311 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!630386 () Bool)

(declare-fun e!360457 () Bool)

(declare-fun e!360459 () Bool)

(assert (=> b!630386 (= e!360457 e!360459)))

(declare-fun lt!291160 () (_ BitVec 64))

(assert (=> b!630386 (= lt!291160 (select (arr!18261 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!291159 () Unit!21144)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38051 (_ BitVec 64) (_ BitVec 32)) Unit!21144)

(assert (=> b!630386 (= lt!291159 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!291160 #b00000000000000000000000000000000))))

(assert (=> b!630386 (arrayContainsKey!0 a!2986 lt!291160 #b00000000000000000000000000000000)))

(declare-fun lt!291161 () Unit!21144)

(assert (=> b!630386 (= lt!291161 lt!291159)))

(declare-fun res!407548 () Bool)

(assert (=> b!630386 (= res!407548 (= (seekEntryOrOpen!0 (select (arr!18261 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6701 #b00000000000000000000000000000000)))))

(assert (=> b!630386 (=> (not res!407548) (not e!360459))))

(declare-fun b!630387 () Bool)

(declare-fun e!360458 () Bool)

(assert (=> b!630387 (= e!360458 e!360457)))

(declare-fun c!71786 () Bool)

(assert (=> b!630387 (= c!71786 (validKeyInArray!0 (select (arr!18261 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89233 () Bool)

(declare-fun res!407549 () Bool)

(assert (=> d!89233 (=> res!407549 e!360458)))

(assert (=> d!89233 (= res!407549 (bvsge #b00000000000000000000000000000000 (size!18625 a!2986)))))

(assert (=> d!89233 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!360458)))

(declare-fun b!630388 () Bool)

(assert (=> b!630388 (= e!360457 call!33311)))

(declare-fun b!630389 () Bool)

(assert (=> b!630389 (= e!360459 call!33311)))

(assert (= (and d!89233 (not res!407549)) b!630387))

(assert (= (and b!630387 c!71786) b!630386))

(assert (= (and b!630387 (not c!71786)) b!630388))

(assert (= (and b!630386 res!407548) b!630389))

(assert (= (or b!630389 b!630388) bm!33308))

(declare-fun m!605423 () Bool)

(assert (=> bm!33308 m!605423))

(assert (=> b!630386 m!605397))

(declare-fun m!605425 () Bool)

(assert (=> b!630386 m!605425))

(declare-fun m!605427 () Bool)

(assert (=> b!630386 m!605427))

(assert (=> b!630386 m!605397))

(declare-fun m!605429 () Bool)

(assert (=> b!630386 m!605429))

(assert (=> b!630387 m!605397))

(assert (=> b!630387 m!605397))

(declare-fun m!605431 () Bool)

(assert (=> b!630387 m!605431))

(assert (=> b!630237 d!89233))

(declare-fun d!89241 () Bool)

(assert (=> d!89241 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!630236 d!89241))

(declare-fun b!630453 () Bool)

(declare-fun c!71813 () Bool)

(declare-fun lt!291190 () (_ BitVec 64))

(assert (=> b!630453 (= c!71813 (= lt!291190 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360499 () SeekEntryResult!6701)

(declare-fun e!360500 () SeekEntryResult!6701)

(assert (=> b!630453 (= e!360499 e!360500)))

(declare-fun b!630454 () Bool)

(declare-fun e!360501 () SeekEntryResult!6701)

(assert (=> b!630454 (= e!360501 Undefined!6701)))

(declare-fun b!630455 () Bool)

(assert (=> b!630455 (= e!360500 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291084 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!291088 lt!291085 mask!3053))))

(declare-fun b!630456 () Bool)

(assert (=> b!630456 (= e!360499 (Found!6701 lt!291084))))

(declare-fun d!89245 () Bool)

(declare-fun lt!291189 () SeekEntryResult!6701)

(assert (=> d!89245 (and (or (is-Undefined!6701 lt!291189) (not (is-Found!6701 lt!291189)) (and (bvsge (index!29092 lt!291189) #b00000000000000000000000000000000) (bvslt (index!29092 lt!291189) (size!18625 lt!291085)))) (or (is-Undefined!6701 lt!291189) (is-Found!6701 lt!291189) (not (is-MissingVacant!6701 lt!291189)) (not (= (index!29094 lt!291189) vacantSpotIndex!68)) (and (bvsge (index!29094 lt!291189) #b00000000000000000000000000000000) (bvslt (index!29094 lt!291189) (size!18625 lt!291085)))) (or (is-Undefined!6701 lt!291189) (ite (is-Found!6701 lt!291189) (= (select (arr!18261 lt!291085) (index!29092 lt!291189)) lt!291088) (and (is-MissingVacant!6701 lt!291189) (= (index!29094 lt!291189) vacantSpotIndex!68) (= (select (arr!18261 lt!291085) (index!29094 lt!291189)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89245 (= lt!291189 e!360501)))

(declare-fun c!71812 () Bool)

(assert (=> d!89245 (= c!71812 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89245 (= lt!291190 (select (arr!18261 lt!291085) lt!291084))))

(assert (=> d!89245 (validMask!0 mask!3053)))

(assert (=> d!89245 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291084 vacantSpotIndex!68 lt!291088 lt!291085 mask!3053) lt!291189)))

(declare-fun b!630457 () Bool)

(assert (=> b!630457 (= e!360500 (MissingVacant!6701 vacantSpotIndex!68))))

(declare-fun b!630458 () Bool)

(assert (=> b!630458 (= e!360501 e!360499)))

(declare-fun c!71811 () Bool)

(assert (=> b!630458 (= c!71811 (= lt!291190 lt!291088))))

(assert (= (and d!89245 c!71812) b!630454))

(assert (= (and d!89245 (not c!71812)) b!630458))

(assert (= (and b!630458 c!71811) b!630456))

(assert (= (and b!630458 (not c!71811)) b!630453))

(assert (= (and b!630453 c!71813) b!630457))

(assert (= (and b!630453 (not c!71813)) b!630455))

(declare-fun m!605475 () Bool)

(assert (=> b!630455 m!605475))

(assert (=> b!630455 m!605475))

(declare-fun m!605477 () Bool)

(assert (=> b!630455 m!605477))

(declare-fun m!605479 () Bool)

(assert (=> d!89245 m!605479))

(declare-fun m!605481 () Bool)

(assert (=> d!89245 m!605481))

(declare-fun m!605483 () Bool)

(assert (=> d!89245 m!605483))

(assert (=> d!89245 m!605289))

(assert (=> b!630238 d!89245))

(declare-fun b!630459 () Bool)

(declare-fun c!71816 () Bool)

(declare-fun lt!291192 () (_ BitVec 64))

(assert (=> b!630459 (= c!71816 (= lt!291192 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360502 () SeekEntryResult!6701)

(declare-fun e!360503 () SeekEntryResult!6701)

(assert (=> b!630459 (= e!360502 e!360503)))

(declare-fun b!630460 () Bool)

(declare-fun e!360504 () SeekEntryResult!6701)

(assert (=> b!630460 (= e!360504 Undefined!6701)))

(declare-fun b!630461 () Bool)

(assert (=> b!630461 (= e!360503 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!291088 lt!291085 mask!3053))))

(declare-fun b!630462 () Bool)

(assert (=> b!630462 (= e!360502 (Found!6701 index!984))))

(declare-fun d!89261 () Bool)

(declare-fun lt!291191 () SeekEntryResult!6701)

(assert (=> d!89261 (and (or (is-Undefined!6701 lt!291191) (not (is-Found!6701 lt!291191)) (and (bvsge (index!29092 lt!291191) #b00000000000000000000000000000000) (bvslt (index!29092 lt!291191) (size!18625 lt!291085)))) (or (is-Undefined!6701 lt!291191) (is-Found!6701 lt!291191) (not (is-MissingVacant!6701 lt!291191)) (not (= (index!29094 lt!291191) vacantSpotIndex!68)) (and (bvsge (index!29094 lt!291191) #b00000000000000000000000000000000) (bvslt (index!29094 lt!291191) (size!18625 lt!291085)))) (or (is-Undefined!6701 lt!291191) (ite (is-Found!6701 lt!291191) (= (select (arr!18261 lt!291085) (index!29092 lt!291191)) lt!291088) (and (is-MissingVacant!6701 lt!291191) (= (index!29094 lt!291191) vacantSpotIndex!68) (= (select (arr!18261 lt!291085) (index!29094 lt!291191)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89261 (= lt!291191 e!360504)))

(declare-fun c!71815 () Bool)

(assert (=> d!89261 (= c!71815 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89261 (= lt!291192 (select (arr!18261 lt!291085) index!984))))

(assert (=> d!89261 (validMask!0 mask!3053)))

(assert (=> d!89261 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291088 lt!291085 mask!3053) lt!291191)))

(declare-fun b!630463 () Bool)

(assert (=> b!630463 (= e!360503 (MissingVacant!6701 vacantSpotIndex!68))))

(declare-fun b!630464 () Bool)

(assert (=> b!630464 (= e!360504 e!360502)))

(declare-fun c!71814 () Bool)

(assert (=> b!630464 (= c!71814 (= lt!291192 lt!291088))))

(assert (= (and d!89261 c!71815) b!630460))

(assert (= (and d!89261 (not c!71815)) b!630464))

(assert (= (and b!630464 c!71814) b!630462))

(assert (= (and b!630464 (not c!71814)) b!630459))

(assert (= (and b!630459 c!71816) b!630463))

(assert (= (and b!630459 (not c!71816)) b!630461))

(assert (=> b!630461 m!605285))

(assert (=> b!630461 m!605285))

(declare-fun m!605485 () Bool)

(assert (=> b!630461 m!605485))

(declare-fun m!605487 () Bool)

(assert (=> d!89261 m!605487))

(declare-fun m!605489 () Bool)

(assert (=> d!89261 m!605489))

(declare-fun m!605491 () Bool)

(assert (=> d!89261 m!605491))

(assert (=> d!89261 m!605289))

(assert (=> b!630238 d!89261))

(declare-fun d!89263 () Bool)

(declare-fun e!360528 () Bool)

(assert (=> d!89263 e!360528))

(declare-fun res!407573 () Bool)

(assert (=> d!89263 (=> (not res!407573) (not e!360528))))

(assert (=> d!89263 (= res!407573 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18625 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18625 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18625 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18625 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18625 a!2986))))))

(declare-fun lt!291215 () Unit!21144)

(declare-fun choose!9 (array!38051 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21144)

(assert (=> d!89263 (= lt!291215 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291084 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89263 (validMask!0 mask!3053)))

(assert (=> d!89263 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291084 vacantSpotIndex!68 mask!3053) lt!291215)))

(declare-fun b!630503 () Bool)

(assert (=> b!630503 (= e!360528 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291084 vacantSpotIndex!68 (select (arr!18261 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291084 vacantSpotIndex!68 (select (store (arr!18261 a!2986) i!1108 k!1786) j!136) (array!38052 (store (arr!18261 a!2986) i!1108 k!1786) (size!18625 a!2986)) mask!3053)))))

(assert (= (and d!89263 res!407573) b!630503))

(declare-fun m!605521 () Bool)

(assert (=> d!89263 m!605521))

(assert (=> d!89263 m!605289))

(assert (=> b!630503 m!605263))

(assert (=> b!630503 m!605279))

(assert (=> b!630503 m!605263))

(assert (=> b!630503 m!605273))

(declare-fun m!605523 () Bool)

(assert (=> b!630503 m!605523))

(assert (=> b!630503 m!605277))

(assert (=> b!630503 m!605273))

(assert (=> b!630238 d!89263))

(declare-fun d!89273 () Bool)

(declare-fun lt!291218 () (_ BitVec 32))

(assert (=> d!89273 (and (bvsge lt!291218 #b00000000000000000000000000000000) (bvslt lt!291218 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89273 (= lt!291218 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89273 (validMask!0 mask!3053)))

(assert (=> d!89273 (= (nextIndex!0 index!984 x!910 mask!3053) lt!291218)))

(declare-fun bs!19005 () Bool)

(assert (= bs!19005 d!89273))

(declare-fun m!605525 () Bool)

(assert (=> bs!19005 m!605525))

(assert (=> bs!19005 m!605289))

(assert (=> b!630238 d!89273))

(declare-fun b!630504 () Bool)

(declare-fun c!71834 () Bool)

(declare-fun lt!291220 () (_ BitVec 64))

(assert (=> b!630504 (= c!71834 (= lt!291220 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360529 () SeekEntryResult!6701)

(declare-fun e!360530 () SeekEntryResult!6701)

(assert (=> b!630504 (= e!360529 e!360530)))

(declare-fun b!630505 () Bool)

(declare-fun e!360531 () SeekEntryResult!6701)

(assert (=> b!630505 (= e!360531 Undefined!6701)))

(declare-fun b!630506 () Bool)

(assert (=> b!630506 (= e!360530 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291084 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18261 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630507 () Bool)

(assert (=> b!630507 (= e!360529 (Found!6701 lt!291084))))

(declare-fun d!89275 () Bool)

(declare-fun lt!291219 () SeekEntryResult!6701)

(assert (=> d!89275 (and (or (is-Undefined!6701 lt!291219) (not (is-Found!6701 lt!291219)) (and (bvsge (index!29092 lt!291219) #b00000000000000000000000000000000) (bvslt (index!29092 lt!291219) (size!18625 a!2986)))) (or (is-Undefined!6701 lt!291219) (is-Found!6701 lt!291219) (not (is-MissingVacant!6701 lt!291219)) (not (= (index!29094 lt!291219) vacantSpotIndex!68)) (and (bvsge (index!29094 lt!291219) #b00000000000000000000000000000000) (bvslt (index!29094 lt!291219) (size!18625 a!2986)))) (or (is-Undefined!6701 lt!291219) (ite (is-Found!6701 lt!291219) (= (select (arr!18261 a!2986) (index!29092 lt!291219)) (select (arr!18261 a!2986) j!136)) (and (is-MissingVacant!6701 lt!291219) (= (index!29094 lt!291219) vacantSpotIndex!68) (= (select (arr!18261 a!2986) (index!29094 lt!291219)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89275 (= lt!291219 e!360531)))

(declare-fun c!71833 () Bool)

(assert (=> d!89275 (= c!71833 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89275 (= lt!291220 (select (arr!18261 a!2986) lt!291084))))

(assert (=> d!89275 (validMask!0 mask!3053)))

(assert (=> d!89275 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291084 vacantSpotIndex!68 (select (arr!18261 a!2986) j!136) a!2986 mask!3053) lt!291219)))

(declare-fun b!630508 () Bool)

(assert (=> b!630508 (= e!360530 (MissingVacant!6701 vacantSpotIndex!68))))

(declare-fun b!630509 () Bool)

(assert (=> b!630509 (= e!360531 e!360529)))

(declare-fun c!71832 () Bool)

(assert (=> b!630509 (= c!71832 (= lt!291220 (select (arr!18261 a!2986) j!136)))))

(assert (= (and d!89275 c!71833) b!630505))

(assert (= (and d!89275 (not c!71833)) b!630509))

(assert (= (and b!630509 c!71832) b!630507))

(assert (= (and b!630509 (not c!71832)) b!630504))

(assert (= (and b!630504 c!71834) b!630508))

(assert (= (and b!630504 (not c!71834)) b!630506))

(assert (=> b!630506 m!605475))

(assert (=> b!630506 m!605475))

(assert (=> b!630506 m!605263))

(declare-fun m!605527 () Bool)

(assert (=> b!630506 m!605527))

(declare-fun m!605529 () Bool)

(assert (=> d!89275 m!605529))

(declare-fun m!605531 () Bool)

(assert (=> d!89275 m!605531))

(declare-fun m!605533 () Bool)

(assert (=> d!89275 m!605533))

(assert (=> d!89275 m!605289))

(assert (=> b!630238 d!89275))

(declare-fun d!89277 () Bool)

(assert (=> d!89277 (= (validKeyInArray!0 (select (arr!18261 a!2986) j!136)) (and (not (= (select (arr!18261 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18261 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!630233 d!89277))

(declare-fun bm!33320 () Bool)

(declare-fun call!33323 () Bool)

(declare-fun c!71840 () Bool)

(assert (=> bm!33320 (= call!33323 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71840 (Cons!12298 (select (arr!18261 a!2986) #b00000000000000000000000000000000) Nil!12299) Nil!12299)))))

(declare-fun b!630529 () Bool)

(declare-fun e!360546 () Bool)

(declare-fun e!360547 () Bool)

(assert (=> b!630529 (= e!360546 e!360547)))

(declare-fun res!407585 () Bool)

(assert (=> b!630529 (=> (not res!407585) (not e!360547))))

(declare-fun e!360548 () Bool)

(assert (=> b!630529 (= res!407585 (not e!360548))))

(declare-fun res!407584 () Bool)

(assert (=> b!630529 (=> (not res!407584) (not e!360548))))

(assert (=> b!630529 (= res!407584 (validKeyInArray!0 (select (arr!18261 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!630530 () Bool)

(declare-fun contains!3086 (List!12302 (_ BitVec 64)) Bool)

(assert (=> b!630530 (= e!360548 (contains!3086 Nil!12299 (select (arr!18261 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!630531 () Bool)

(declare-fun e!360549 () Bool)

(assert (=> b!630531 (= e!360547 e!360549)))

(assert (=> b!630531 (= c!71840 (validKeyInArray!0 (select (arr!18261 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!630532 () Bool)

(assert (=> b!630532 (= e!360549 call!33323)))

(declare-fun b!630533 () Bool)

(assert (=> b!630533 (= e!360549 call!33323)))

(declare-fun d!89279 () Bool)

(declare-fun res!407583 () Bool)

(assert (=> d!89279 (=> res!407583 e!360546)))

(assert (=> d!89279 (= res!407583 (bvsge #b00000000000000000000000000000000 (size!18625 a!2986)))))

(assert (=> d!89279 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12299) e!360546)))

(assert (= (and d!89279 (not res!407583)) b!630529))

(assert (= (and b!630529 res!407584) b!630530))

(assert (= (and b!630529 res!407585) b!630531))

(assert (= (and b!630531 c!71840) b!630533))

(assert (= (and b!630531 (not c!71840)) b!630532))

(assert (= (or b!630533 b!630532) bm!33320))

(assert (=> bm!33320 m!605397))

(declare-fun m!605547 () Bool)

(assert (=> bm!33320 m!605547))

(assert (=> b!630529 m!605397))

(assert (=> b!630529 m!605397))

(assert (=> b!630529 m!605431))

(assert (=> b!630530 m!605397))

(assert (=> b!630530 m!605397))

(declare-fun m!605549 () Bool)

(assert (=> b!630530 m!605549))

(assert (=> b!630531 m!605397))

(assert (=> b!630531 m!605397))

(assert (=> b!630531 m!605431))

(assert (=> b!630232 d!89279))

(declare-fun d!89285 () Bool)

(assert (=> d!89285 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56918 d!89285))

(declare-fun d!89291 () Bool)

(assert (=> d!89291 (= (array_inv!14057 a!2986) (bvsge (size!18625 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56918 d!89291))

(declare-fun lt!291234 () SeekEntryResult!6701)

(declare-fun e!360578 () SeekEntryResult!6701)

(declare-fun b!630573 () Bool)

(assert (=> b!630573 (= e!360578 (seekKeyOrZeroReturnVacant!0 (x!57830 lt!291234) (index!29093 lt!291234) (index!29093 lt!291234) k!1786 a!2986 mask!3053))))

(declare-fun b!630574 () Bool)

(declare-fun c!71854 () Bool)

(declare-fun lt!291236 () (_ BitVec 64))

(assert (=> b!630574 (= c!71854 (= lt!291236 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360577 () SeekEntryResult!6701)

(assert (=> b!630574 (= e!360577 e!360578)))

(declare-fun d!89293 () Bool)

(declare-fun lt!291235 () SeekEntryResult!6701)

(assert (=> d!89293 (and (or (is-Undefined!6701 lt!291235) (not (is-Found!6701 lt!291235)) (and (bvsge (index!29092 lt!291235) #b00000000000000000000000000000000) (bvslt (index!29092 lt!291235) (size!18625 a!2986)))) (or (is-Undefined!6701 lt!291235) (is-Found!6701 lt!291235) (not (is-MissingZero!6701 lt!291235)) (and (bvsge (index!29091 lt!291235) #b00000000000000000000000000000000) (bvslt (index!29091 lt!291235) (size!18625 a!2986)))) (or (is-Undefined!6701 lt!291235) (is-Found!6701 lt!291235) (is-MissingZero!6701 lt!291235) (not (is-MissingVacant!6701 lt!291235)) (and (bvsge (index!29094 lt!291235) #b00000000000000000000000000000000) (bvslt (index!29094 lt!291235) (size!18625 a!2986)))) (or (is-Undefined!6701 lt!291235) (ite (is-Found!6701 lt!291235) (= (select (arr!18261 a!2986) (index!29092 lt!291235)) k!1786) (ite (is-MissingZero!6701 lt!291235) (= (select (arr!18261 a!2986) (index!29091 lt!291235)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6701 lt!291235) (= (select (arr!18261 a!2986) (index!29094 lt!291235)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!360579 () SeekEntryResult!6701)

(assert (=> d!89293 (= lt!291235 e!360579)))

(declare-fun c!71855 () Bool)

(assert (=> d!89293 (= c!71855 (and (is-Intermediate!6701 lt!291234) (undefined!7513 lt!291234)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38051 (_ BitVec 32)) SeekEntryResult!6701)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89293 (= lt!291234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!89293 (validMask!0 mask!3053)))

(assert (=> d!89293 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!291235)))

(declare-fun b!630575 () Bool)

(assert (=> b!630575 (= e!360578 (MissingZero!6701 (index!29093 lt!291234)))))

(declare-fun b!630576 () Bool)

(assert (=> b!630576 (= e!360579 Undefined!6701)))

(declare-fun b!630577 () Bool)

(assert (=> b!630577 (= e!360577 (Found!6701 (index!29093 lt!291234)))))

(declare-fun b!630578 () Bool)

(assert (=> b!630578 (= e!360579 e!360577)))

(assert (=> b!630578 (= lt!291236 (select (arr!18261 a!2986) (index!29093 lt!291234)))))

(declare-fun c!71853 () Bool)

(assert (=> b!630578 (= c!71853 (= lt!291236 k!1786))))

(assert (= (and d!89293 c!71855) b!630576))

(assert (= (and d!89293 (not c!71855)) b!630578))

(assert (= (and b!630578 c!71853) b!630577))

(assert (= (and b!630578 (not c!71853)) b!630574))

(assert (= (and b!630574 c!71854) b!630575))

(assert (= (and b!630574 (not c!71854)) b!630573))

(declare-fun m!605563 () Bool)

(assert (=> b!630573 m!605563))

(assert (=> d!89293 m!605289))

(declare-fun m!605565 () Bool)

(assert (=> d!89293 m!605565))

(declare-fun m!605567 () Bool)

(assert (=> d!89293 m!605567))

(declare-fun m!605569 () Bool)

(assert (=> d!89293 m!605569))

(declare-fun m!605571 () Bool)

(assert (=> d!89293 m!605571))

(declare-fun m!605573 () Bool)

(assert (=> d!89293 m!605573))

(assert (=> d!89293 m!605569))

(declare-fun m!605575 () Bool)

(assert (=> b!630578 m!605575))

(assert (=> b!630239 d!89293))

(declare-fun b!630579 () Bool)

(declare-fun c!71858 () Bool)

(declare-fun lt!291238 () (_ BitVec 64))

(assert (=> b!630579 (= c!71858 (= lt!291238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!360580 () SeekEntryResult!6701)

(declare-fun e!360581 () SeekEntryResult!6701)

(assert (=> b!630579 (= e!360580 e!360581)))

(declare-fun b!630580 () Bool)

(declare-fun e!360582 () SeekEntryResult!6701)

(assert (=> b!630580 (= e!360582 Undefined!6701)))

(declare-fun b!630581 () Bool)

(assert (=> b!630581 (= e!360581 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18261 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630582 () Bool)

(assert (=> b!630582 (= e!360580 (Found!6701 index!984))))

(declare-fun d!89299 () Bool)

(declare-fun lt!291237 () SeekEntryResult!6701)

(assert (=> d!89299 (and (or (is-Undefined!6701 lt!291237) (not (is-Found!6701 lt!291237)) (and (bvsge (index!29092 lt!291237) #b00000000000000000000000000000000) (bvslt (index!29092 lt!291237) (size!18625 a!2986)))) (or (is-Undefined!6701 lt!291237) (is-Found!6701 lt!291237) (not (is-MissingVacant!6701 lt!291237)) (not (= (index!29094 lt!291237) vacantSpotIndex!68)) (and (bvsge (index!29094 lt!291237) #b00000000000000000000000000000000) (bvslt (index!29094 lt!291237) (size!18625 a!2986)))) (or (is-Undefined!6701 lt!291237) (ite (is-Found!6701 lt!291237) (= (select (arr!18261 a!2986) (index!29092 lt!291237)) (select (arr!18261 a!2986) j!136)) (and (is-MissingVacant!6701 lt!291237) (= (index!29094 lt!291237) vacantSpotIndex!68) (= (select (arr!18261 a!2986) (index!29094 lt!291237)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89299 (= lt!291237 e!360582)))

(declare-fun c!71857 () Bool)

(assert (=> d!89299 (= c!71857 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89299 (= lt!291238 (select (arr!18261 a!2986) index!984))))

(assert (=> d!89299 (validMask!0 mask!3053)))

(assert (=> d!89299 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18261 a!2986) j!136) a!2986 mask!3053) lt!291237)))

(declare-fun b!630583 () Bool)

(assert (=> b!630583 (= e!360581 (MissingVacant!6701 vacantSpotIndex!68))))

(declare-fun b!630584 () Bool)

(assert (=> b!630584 (= e!360582 e!360580)))

(declare-fun c!71856 () Bool)

(assert (=> b!630584 (= c!71856 (= lt!291238 (select (arr!18261 a!2986) j!136)))))

(assert (= (and d!89299 c!71857) b!630580))

(assert (= (and d!89299 (not c!71857)) b!630584))

(assert (= (and b!630584 c!71856) b!630582))

(assert (= (and b!630584 (not c!71856)) b!630579))

(assert (= (and b!630579 c!71858) b!630583))

(assert (= (and b!630579 (not c!71858)) b!630581))

(assert (=> b!630581 m!605285))

(assert (=> b!630581 m!605285))

(assert (=> b!630581 m!605263))

(declare-fun m!605577 () Bool)

(assert (=> b!630581 m!605577))

(declare-fun m!605579 () Bool)

(assert (=> d!89299 m!605579))

(declare-fun m!605581 () Bool)

(assert (=> d!89299 m!605581))

(assert (=> d!89299 m!605261))

(assert (=> d!89299 m!605289))

(assert (=> b!630240 d!89299))

(push 1)

(assert (not b!630573))

(assert (not d!89263))

(assert (not b!630386))

(assert (not b!630461))

(assert (not b!630362))

(assert (not b!630531))

(assert (not b!630503))

(assert (not b!630506))

(assert (not b!630530))

(assert (not bm!33308))

(assert (not b!630529))

(assert (not d!89299))

(assert (not b!630387))

(assert (not d!89293))

(assert (not bm!33320))

(assert (not d!89245))

(assert (not b!630581))

(assert (not d!89273))

(assert (not d!89275))

(assert (not d!89261))

(assert (not b!630455))

(check-sat)

(pop 1)

(push 1)

(check-sat)

