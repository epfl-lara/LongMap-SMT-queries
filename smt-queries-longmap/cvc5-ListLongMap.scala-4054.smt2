; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55552 () Bool)

(assert start!55552)

(declare-fun b!607539 () Bool)

(declare-fun res!390354 () Bool)

(declare-fun e!347913 () Bool)

(assert (=> b!607539 (=> (not res!390354) (not e!347913))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37283 0))(
  ( (array!37284 (arr!17892 (Array (_ BitVec 32) (_ BitVec 64))) (size!18256 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37283)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!607539 (= res!390354 (and (= (size!18256 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18256 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18256 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607540 () Bool)

(declare-fun e!347911 () Bool)

(declare-fun e!347919 () Bool)

(assert (=> b!607540 (= e!347911 e!347919)))

(declare-fun res!390364 () Bool)

(assert (=> b!607540 (=> (not res!390364) (not e!347919))))

(declare-fun lt!277387 () array!37283)

(declare-fun arrayContainsKey!0 (array!37283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607540 (= res!390364 (arrayContainsKey!0 lt!277387 (select (arr!17892 a!2986) j!136) j!136))))

(declare-fun b!607541 () Bool)

(declare-datatypes ((Unit!19372 0))(
  ( (Unit!19373) )
))
(declare-fun e!347910 () Unit!19372)

(declare-fun Unit!19374 () Unit!19372)

(assert (=> b!607541 (= e!347910 Unit!19374)))

(declare-fun lt!277393 () Unit!19372)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37283 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19372)

(assert (=> b!607541 (= lt!277393 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277387 (select (arr!17892 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607541 (arrayContainsKey!0 lt!277387 (select (arr!17892 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277396 () Unit!19372)

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((List!11933 0))(
  ( (Nil!11930) (Cons!11929 (h!12974 (_ BitVec 64)) (t!18161 List!11933)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37283 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11933) Unit!19372)

(assert (=> b!607541 (= lt!277396 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11930))))

(declare-fun arrayNoDuplicates!0 (array!37283 (_ BitVec 32) List!11933) Bool)

(assert (=> b!607541 (arrayNoDuplicates!0 lt!277387 #b00000000000000000000000000000000 Nil!11930)))

(declare-fun lt!277388 () Unit!19372)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37283 (_ BitVec 32) (_ BitVec 32)) Unit!19372)

(assert (=> b!607541 (= lt!277388 (lemmaNoDuplicateFromThenFromBigger!0 lt!277387 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607541 (arrayNoDuplicates!0 lt!277387 j!136 Nil!11930)))

(declare-fun lt!277401 () Unit!19372)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37283 (_ BitVec 64) (_ BitVec 32) List!11933) Unit!19372)

(assert (=> b!607541 (= lt!277401 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277387 (select (arr!17892 a!2986) j!136) j!136 Nil!11930))))

(assert (=> b!607541 false))

(declare-fun b!607542 () Bool)

(declare-fun e!347912 () Bool)

(declare-datatypes ((SeekEntryResult!6332 0))(
  ( (MissingZero!6332 (index!27603 (_ BitVec 32))) (Found!6332 (index!27604 (_ BitVec 32))) (Intermediate!6332 (undefined!7144 Bool) (index!27605 (_ BitVec 32)) (x!56417 (_ BitVec 32))) (Undefined!6332) (MissingVacant!6332 (index!27606 (_ BitVec 32))) )
))
(declare-fun lt!277386 () SeekEntryResult!6332)

(declare-fun lt!277397 () SeekEntryResult!6332)

(assert (=> b!607542 (= e!347912 (= lt!277386 lt!277397))))

(declare-fun res!390356 () Bool)

(assert (=> start!55552 (=> (not res!390356) (not e!347913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55552 (= res!390356 (validMask!0 mask!3053))))

(assert (=> start!55552 e!347913))

(assert (=> start!55552 true))

(declare-fun array_inv!13688 (array!37283) Bool)

(assert (=> start!55552 (array_inv!13688 a!2986)))

(declare-fun b!607543 () Bool)

(declare-fun e!347924 () Bool)

(assert (=> b!607543 (= e!347924 e!347911)))

(declare-fun res!390353 () Bool)

(assert (=> b!607543 (=> res!390353 e!347911)))

(declare-fun lt!277394 () (_ BitVec 64))

(declare-fun lt!277402 () (_ BitVec 64))

(assert (=> b!607543 (= res!390353 (or (not (= (select (arr!17892 a!2986) j!136) lt!277394)) (not (= (select (arr!17892 a!2986) j!136) lt!277402)) (bvsge j!136 index!984)))))

(declare-fun b!607544 () Bool)

(assert (=> b!607544 (= e!347919 (arrayContainsKey!0 lt!277387 (select (arr!17892 a!2986) j!136) index!984))))

(declare-fun b!607545 () Bool)

(declare-fun e!347917 () Bool)

(declare-fun e!347916 () Bool)

(assert (=> b!607545 (= e!347917 (not e!347916))))

(declare-fun res!390360 () Bool)

(assert (=> b!607545 (=> res!390360 e!347916)))

(declare-fun lt!277391 () SeekEntryResult!6332)

(assert (=> b!607545 (= res!390360 (not (= lt!277391 (Found!6332 index!984))))))

(declare-fun lt!277389 () Unit!19372)

(declare-fun e!347925 () Unit!19372)

(assert (=> b!607545 (= lt!277389 e!347925)))

(declare-fun c!68966 () Bool)

(assert (=> b!607545 (= c!68966 (= lt!277391 Undefined!6332))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37283 (_ BitVec 32)) SeekEntryResult!6332)

(assert (=> b!607545 (= lt!277391 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277394 lt!277387 mask!3053))))

(assert (=> b!607545 e!347912))

(declare-fun res!390347 () Bool)

(assert (=> b!607545 (=> (not res!390347) (not e!347912))))

(declare-fun lt!277398 () (_ BitVec 32))

(assert (=> b!607545 (= res!390347 (= lt!277397 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277398 vacantSpotIndex!68 lt!277394 lt!277387 mask!3053)))))

(assert (=> b!607545 (= lt!277397 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277398 vacantSpotIndex!68 (select (arr!17892 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!607545 (= lt!277394 (select (store (arr!17892 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!277392 () Unit!19372)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37283 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19372)

(assert (=> b!607545 (= lt!277392 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277398 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607545 (= lt!277398 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!607546 () Bool)

(declare-fun e!347914 () Bool)

(declare-fun e!347920 () Bool)

(assert (=> b!607546 (= e!347914 e!347920)))

(declare-fun res!390362 () Bool)

(assert (=> b!607546 (=> res!390362 e!347920)))

(assert (=> b!607546 (= res!390362 (bvsge index!984 j!136))))

(declare-fun lt!277400 () Unit!19372)

(assert (=> b!607546 (= lt!277400 e!347910)))

(declare-fun c!68965 () Bool)

(assert (=> b!607546 (= c!68965 (bvslt j!136 index!984))))

(declare-fun b!607547 () Bool)

(declare-fun res!390355 () Bool)

(assert (=> b!607547 (=> (not res!390355) (not e!347913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607547 (= res!390355 (validKeyInArray!0 (select (arr!17892 a!2986) j!136)))))

(declare-fun b!607548 () Bool)

(declare-fun res!390363 () Bool)

(assert (=> b!607548 (=> (not res!390363) (not e!347913))))

(assert (=> b!607548 (= res!390363 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607549 () Bool)

(declare-fun res!390357 () Bool)

(declare-fun e!347923 () Bool)

(assert (=> b!607549 (=> res!390357 e!347923)))

(declare-fun contains!3009 (List!11933 (_ BitVec 64)) Bool)

(assert (=> b!607549 (= res!390357 (contains!3009 Nil!11930 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607550 () Bool)

(assert (=> b!607550 (= e!347923 true)))

(declare-fun lt!277395 () Bool)

(assert (=> b!607550 (= lt!277395 (contains!3009 Nil!11930 k!1786))))

(declare-fun b!607551 () Bool)

(declare-fun e!347918 () Bool)

(declare-fun e!347922 () Bool)

(assert (=> b!607551 (= e!347918 e!347922)))

(declare-fun res!390352 () Bool)

(assert (=> b!607551 (=> (not res!390352) (not e!347922))))

(assert (=> b!607551 (= res!390352 (= (select (store (arr!17892 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607551 (= lt!277387 (array!37284 (store (arr!17892 a!2986) i!1108 k!1786) (size!18256 a!2986)))))

(declare-fun b!607552 () Bool)

(declare-fun e!347915 () Bool)

(assert (=> b!607552 (= e!347915 (arrayContainsKey!0 lt!277387 (select (arr!17892 a!2986) j!136) index!984))))

(declare-fun b!607553 () Bool)

(declare-fun res!390346 () Bool)

(assert (=> b!607553 (=> res!390346 e!347923)))

(assert (=> b!607553 (= res!390346 (contains!3009 Nil!11930 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607554 () Bool)

(assert (=> b!607554 (= e!347916 e!347914)))

(declare-fun res!390349 () Bool)

(assert (=> b!607554 (=> res!390349 e!347914)))

(assert (=> b!607554 (= res!390349 (or (not (= (select (arr!17892 a!2986) j!136) lt!277394)) (not (= (select (arr!17892 a!2986) j!136) lt!277402))))))

(assert (=> b!607554 e!347924))

(declare-fun res!390343 () Bool)

(assert (=> b!607554 (=> (not res!390343) (not e!347924))))

(assert (=> b!607554 (= res!390343 (= lt!277402 (select (arr!17892 a!2986) j!136)))))

(assert (=> b!607554 (= lt!277402 (select (store (arr!17892 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!607555 () Bool)

(assert (=> b!607555 (= e!347913 e!347918)))

(declare-fun res!390350 () Bool)

(assert (=> b!607555 (=> (not res!390350) (not e!347918))))

(declare-fun lt!277399 () SeekEntryResult!6332)

(assert (=> b!607555 (= res!390350 (or (= lt!277399 (MissingZero!6332 i!1108)) (= lt!277399 (MissingVacant!6332 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37283 (_ BitVec 32)) SeekEntryResult!6332)

(assert (=> b!607555 (= lt!277399 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!607556 () Bool)

(declare-fun res!390361 () Bool)

(assert (=> b!607556 (=> res!390361 e!347923)))

(declare-fun noDuplicate!315 (List!11933) Bool)

(assert (=> b!607556 (= res!390361 (not (noDuplicate!315 Nil!11930)))))

(declare-fun b!607557 () Bool)

(declare-fun Unit!19375 () Unit!19372)

(assert (=> b!607557 (= e!347910 Unit!19375)))

(declare-fun b!607558 () Bool)

(declare-fun res!390359 () Bool)

(assert (=> b!607558 (=> (not res!390359) (not e!347918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37283 (_ BitVec 32)) Bool)

(assert (=> b!607558 (= res!390359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607559 () Bool)

(declare-fun Unit!19376 () Unit!19372)

(assert (=> b!607559 (= e!347925 Unit!19376)))

(assert (=> b!607559 false))

(declare-fun b!607560 () Bool)

(declare-fun res!390344 () Bool)

(assert (=> b!607560 (=> (not res!390344) (not e!347913))))

(assert (=> b!607560 (= res!390344 (validKeyInArray!0 k!1786))))

(declare-fun b!607561 () Bool)

(declare-fun Unit!19377 () Unit!19372)

(assert (=> b!607561 (= e!347925 Unit!19377)))

(declare-fun b!607562 () Bool)

(declare-fun res!390351 () Bool)

(assert (=> b!607562 (=> (not res!390351) (not e!347918))))

(assert (=> b!607562 (= res!390351 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17892 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607563 () Bool)

(assert (=> b!607563 (= e!347920 e!347923)))

(declare-fun res!390358 () Bool)

(assert (=> b!607563 (=> res!390358 e!347923)))

(assert (=> b!607563 (= res!390358 (or (bvsge (size!18256 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18256 a!2986))))))

(assert (=> b!607563 (arrayContainsKey!0 lt!277387 (select (arr!17892 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277390 () Unit!19372)

(assert (=> b!607563 (= lt!277390 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277387 (select (arr!17892 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!607563 e!347915))

(declare-fun res!390348 () Bool)

(assert (=> b!607563 (=> (not res!390348) (not e!347915))))

(assert (=> b!607563 (= res!390348 (arrayContainsKey!0 lt!277387 (select (arr!17892 a!2986) j!136) j!136))))

(declare-fun b!607564 () Bool)

(declare-fun res!390365 () Bool)

(assert (=> b!607564 (=> (not res!390365) (not e!347918))))

(assert (=> b!607564 (= res!390365 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11930))))

(declare-fun b!607565 () Bool)

(assert (=> b!607565 (= e!347922 e!347917)))

(declare-fun res!390345 () Bool)

(assert (=> b!607565 (=> (not res!390345) (not e!347917))))

(assert (=> b!607565 (= res!390345 (and (= lt!277386 (Found!6332 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17892 a!2986) index!984) (select (arr!17892 a!2986) j!136))) (not (= (select (arr!17892 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!607565 (= lt!277386 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17892 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!55552 res!390356) b!607539))

(assert (= (and b!607539 res!390354) b!607547))

(assert (= (and b!607547 res!390355) b!607560))

(assert (= (and b!607560 res!390344) b!607548))

(assert (= (and b!607548 res!390363) b!607555))

(assert (= (and b!607555 res!390350) b!607558))

(assert (= (and b!607558 res!390359) b!607564))

(assert (= (and b!607564 res!390365) b!607562))

(assert (= (and b!607562 res!390351) b!607551))

(assert (= (and b!607551 res!390352) b!607565))

(assert (= (and b!607565 res!390345) b!607545))

(assert (= (and b!607545 res!390347) b!607542))

(assert (= (and b!607545 c!68966) b!607559))

(assert (= (and b!607545 (not c!68966)) b!607561))

(assert (= (and b!607545 (not res!390360)) b!607554))

(assert (= (and b!607554 res!390343) b!607543))

(assert (= (and b!607543 (not res!390353)) b!607540))

(assert (= (and b!607540 res!390364) b!607544))

(assert (= (and b!607554 (not res!390349)) b!607546))

(assert (= (and b!607546 c!68965) b!607541))

(assert (= (and b!607546 (not c!68965)) b!607557))

(assert (= (and b!607546 (not res!390362)) b!607563))

(assert (= (and b!607563 res!390348) b!607552))

(assert (= (and b!607563 (not res!390358)) b!607556))

(assert (= (and b!607556 (not res!390361)) b!607549))

(assert (= (and b!607549 (not res!390357)) b!607553))

(assert (= (and b!607553 (not res!390346)) b!607550))

(declare-fun m!584267 () Bool)

(assert (=> start!55552 m!584267))

(declare-fun m!584269 () Bool)

(assert (=> start!55552 m!584269))

(declare-fun m!584271 () Bool)

(assert (=> b!607562 m!584271))

(declare-fun m!584273 () Bool)

(assert (=> b!607541 m!584273))

(declare-fun m!584275 () Bool)

(assert (=> b!607541 m!584275))

(assert (=> b!607541 m!584275))

(declare-fun m!584277 () Bool)

(assert (=> b!607541 m!584277))

(declare-fun m!584279 () Bool)

(assert (=> b!607541 m!584279))

(assert (=> b!607541 m!584275))

(declare-fun m!584281 () Bool)

(assert (=> b!607541 m!584281))

(assert (=> b!607541 m!584275))

(declare-fun m!584283 () Bool)

(assert (=> b!607541 m!584283))

(declare-fun m!584285 () Bool)

(assert (=> b!607541 m!584285))

(declare-fun m!584287 () Bool)

(assert (=> b!607541 m!584287))

(declare-fun m!584289 () Bool)

(assert (=> b!607545 m!584289))

(declare-fun m!584291 () Bool)

(assert (=> b!607545 m!584291))

(assert (=> b!607545 m!584275))

(declare-fun m!584293 () Bool)

(assert (=> b!607545 m!584293))

(assert (=> b!607545 m!584275))

(declare-fun m!584295 () Bool)

(assert (=> b!607545 m!584295))

(declare-fun m!584297 () Bool)

(assert (=> b!607545 m!584297))

(declare-fun m!584299 () Bool)

(assert (=> b!607545 m!584299))

(declare-fun m!584301 () Bool)

(assert (=> b!607545 m!584301))

(assert (=> b!607551 m!584293))

(declare-fun m!584303 () Bool)

(assert (=> b!607551 m!584303))

(assert (=> b!607547 m!584275))

(assert (=> b!607547 m!584275))

(declare-fun m!584305 () Bool)

(assert (=> b!607547 m!584305))

(declare-fun m!584307 () Bool)

(assert (=> b!607550 m!584307))

(assert (=> b!607563 m!584275))

(assert (=> b!607563 m!584275))

(declare-fun m!584309 () Bool)

(assert (=> b!607563 m!584309))

(assert (=> b!607563 m!584275))

(declare-fun m!584311 () Bool)

(assert (=> b!607563 m!584311))

(assert (=> b!607563 m!584275))

(declare-fun m!584313 () Bool)

(assert (=> b!607563 m!584313))

(declare-fun m!584315 () Bool)

(assert (=> b!607548 m!584315))

(declare-fun m!584317 () Bool)

(assert (=> b!607553 m!584317))

(assert (=> b!607540 m!584275))

(assert (=> b!607540 m!584275))

(assert (=> b!607540 m!584313))

(declare-fun m!584319 () Bool)

(assert (=> b!607564 m!584319))

(assert (=> b!607543 m!584275))

(assert (=> b!607552 m!584275))

(assert (=> b!607552 m!584275))

(declare-fun m!584321 () Bool)

(assert (=> b!607552 m!584321))

(declare-fun m!584323 () Bool)

(assert (=> b!607556 m!584323))

(declare-fun m!584325 () Bool)

(assert (=> b!607555 m!584325))

(declare-fun m!584327 () Bool)

(assert (=> b!607549 m!584327))

(declare-fun m!584329 () Bool)

(assert (=> b!607560 m!584329))

(assert (=> b!607544 m!584275))

(assert (=> b!607544 m!584275))

(assert (=> b!607544 m!584321))

(declare-fun m!584331 () Bool)

(assert (=> b!607565 m!584331))

(assert (=> b!607565 m!584275))

(assert (=> b!607565 m!584275))

(declare-fun m!584333 () Bool)

(assert (=> b!607565 m!584333))

(declare-fun m!584335 () Bool)

(assert (=> b!607558 m!584335))

(assert (=> b!607554 m!584275))

(assert (=> b!607554 m!584293))

(declare-fun m!584337 () Bool)

(assert (=> b!607554 m!584337))

(push 1)

