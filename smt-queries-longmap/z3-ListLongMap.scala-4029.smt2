; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54882 () Bool)

(assert start!54882)

(declare-fun b!600383 () Bool)

(declare-fun e!343260 () Bool)

(declare-fun e!343268 () Bool)

(assert (=> b!600383 (= e!343260 e!343268)))

(declare-fun res!385277 () Bool)

(assert (=> b!600383 (=> (not res!385277) (not e!343268))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37117 0))(
  ( (array!37118 (arr!17818 (Array (_ BitVec 32) (_ BitVec 64))) (size!18182 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37117)

(declare-datatypes ((SeekEntryResult!6258 0))(
  ( (MissingZero!6258 (index!27289 (_ BitVec 32))) (Found!6258 (index!27290 (_ BitVec 32))) (Intermediate!6258 (undefined!7070 Bool) (index!27291 (_ BitVec 32)) (x!56089 (_ BitVec 32))) (Undefined!6258) (MissingVacant!6258 (index!27292 (_ BitVec 32))) )
))
(declare-fun lt!273101 () SeekEntryResult!6258)

(assert (=> b!600383 (= res!385277 (and (= lt!273101 (Found!6258 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17818 a!2986) index!984) (select (arr!17818 a!2986) j!136))) (not (= (select (arr!17818 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37117 (_ BitVec 32)) SeekEntryResult!6258)

(assert (=> b!600383 (= lt!273101 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17818 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600384 () Bool)

(declare-fun e!343263 () Bool)

(declare-fun e!343266 () Bool)

(assert (=> b!600384 (= e!343263 e!343266)))

(declare-fun res!385291 () Bool)

(assert (=> b!600384 (=> res!385291 e!343266)))

(declare-fun lt!273097 () (_ BitVec 64))

(declare-fun lt!273109 () (_ BitVec 64))

(assert (=> b!600384 (= res!385291 (or (not (= (select (arr!17818 a!2986) j!136) lt!273097)) (not (= (select (arr!17818 a!2986) j!136) lt!273109)) (bvsge j!136 index!984)))))

(declare-fun b!600385 () Bool)

(declare-datatypes ((Unit!18950 0))(
  ( (Unit!18951) )
))
(declare-fun e!343264 () Unit!18950)

(declare-fun Unit!18952 () Unit!18950)

(assert (=> b!600385 (= e!343264 Unit!18952)))

(assert (=> b!600385 false))

(declare-fun b!600386 () Bool)

(declare-fun res!385273 () Bool)

(declare-fun e!343269 () Bool)

(assert (=> b!600386 (=> (not res!385273) (not e!343269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37117 (_ BitVec 32)) Bool)

(assert (=> b!600386 (= res!385273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600387 () Bool)

(declare-fun Unit!18953 () Unit!18950)

(assert (=> b!600387 (= e!343264 Unit!18953)))

(declare-fun b!600388 () Bool)

(declare-fun res!385274 () Bool)

(declare-fun e!343265 () Bool)

(assert (=> b!600388 (=> res!385274 e!343265)))

(declare-datatypes ((List!11859 0))(
  ( (Nil!11856) (Cons!11855 (h!12900 (_ BitVec 64)) (t!18087 List!11859)) )
))
(declare-fun noDuplicate!292 (List!11859) Bool)

(assert (=> b!600388 (= res!385274 (not (noDuplicate!292 Nil!11856)))))

(declare-fun b!600389 () Bool)

(declare-fun e!343271 () Bool)

(assert (=> b!600389 (= e!343266 e!343271)))

(declare-fun res!385286 () Bool)

(assert (=> b!600389 (=> (not res!385286) (not e!343271))))

(declare-fun lt!273102 () array!37117)

(declare-fun arrayContainsKey!0 (array!37117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600389 (= res!385286 (arrayContainsKey!0 lt!273102 (select (arr!17818 a!2986) j!136) j!136))))

(declare-fun b!600390 () Bool)

(assert (=> b!600390 (= e!343269 e!343260)))

(declare-fun res!385287 () Bool)

(assert (=> b!600390 (=> (not res!385287) (not e!343260))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!600390 (= res!385287 (= (select (store (arr!17818 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600390 (= lt!273102 (array!37118 (store (arr!17818 a!2986) i!1108 k0!1786) (size!18182 a!2986)))))

(declare-fun b!600391 () Bool)

(declare-fun e!343272 () Bool)

(declare-fun e!343270 () Bool)

(assert (=> b!600391 (= e!343272 e!343270)))

(declare-fun res!385278 () Bool)

(assert (=> b!600391 (=> res!385278 e!343270)))

(assert (=> b!600391 (= res!385278 (or (not (= (select (arr!17818 a!2986) j!136) lt!273097)) (not (= (select (arr!17818 a!2986) j!136) lt!273109)) (bvsge j!136 index!984)))))

(assert (=> b!600391 e!343263))

(declare-fun res!385275 () Bool)

(assert (=> b!600391 (=> (not res!385275) (not e!343263))))

(assert (=> b!600391 (= res!385275 (= lt!273109 (select (arr!17818 a!2986) j!136)))))

(assert (=> b!600391 (= lt!273109 (select (store (arr!17818 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!600392 () Bool)

(declare-fun res!385282 () Bool)

(assert (=> b!600392 (=> (not res!385282) (not e!343269))))

(declare-fun arrayNoDuplicates!0 (array!37117 (_ BitVec 32) List!11859) Bool)

(assert (=> b!600392 (= res!385282 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11856))))

(declare-fun b!600393 () Bool)

(assert (=> b!600393 (= e!343271 (arrayContainsKey!0 lt!273102 (select (arr!17818 a!2986) j!136) index!984))))

(declare-fun b!600395 () Bool)

(declare-fun res!385288 () Bool)

(declare-fun e!343261 () Bool)

(assert (=> b!600395 (=> (not res!385288) (not e!343261))))

(assert (=> b!600395 (= res!385288 (and (= (size!18182 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18182 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18182 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600396 () Bool)

(assert (=> b!600396 (= e!343265 true)))

(declare-fun lt!273103 () Bool)

(declare-fun contains!2975 (List!11859 (_ BitVec 64)) Bool)

(assert (=> b!600396 (= lt!273103 (contains!2975 Nil!11856 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600397 () Bool)

(declare-fun res!385276 () Bool)

(assert (=> b!600397 (=> (not res!385276) (not e!343261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600397 (= res!385276 (validKeyInArray!0 (select (arr!17818 a!2986) j!136)))))

(declare-fun b!600398 () Bool)

(declare-fun res!385279 () Bool)

(assert (=> b!600398 (=> res!385279 e!343265)))

(assert (=> b!600398 (= res!385279 (contains!2975 Nil!11856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600399 () Bool)

(assert (=> b!600399 (= e!343261 e!343269)))

(declare-fun res!385284 () Bool)

(assert (=> b!600399 (=> (not res!385284) (not e!343269))))

(declare-fun lt!273096 () SeekEntryResult!6258)

(assert (=> b!600399 (= res!385284 (or (= lt!273096 (MissingZero!6258 i!1108)) (= lt!273096 (MissingVacant!6258 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37117 (_ BitVec 32)) SeekEntryResult!6258)

(assert (=> b!600399 (= lt!273096 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!600400 () Bool)

(declare-fun res!385292 () Bool)

(assert (=> b!600400 (=> (not res!385292) (not e!343261))))

(assert (=> b!600400 (= res!385292 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600401 () Bool)

(assert (=> b!600401 (= e!343270 e!343265)))

(declare-fun res!385281 () Bool)

(assert (=> b!600401 (=> res!385281 e!343265)))

(assert (=> b!600401 (= res!385281 (or (bvsge (size!18182 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18182 a!2986))))))

(assert (=> b!600401 (arrayNoDuplicates!0 lt!273102 j!136 Nil!11856)))

(declare-fun lt!273099 () Unit!18950)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37117 (_ BitVec 32) (_ BitVec 32)) Unit!18950)

(assert (=> b!600401 (= lt!273099 (lemmaNoDuplicateFromThenFromBigger!0 lt!273102 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600401 (arrayNoDuplicates!0 lt!273102 #b00000000000000000000000000000000 Nil!11856)))

(declare-fun lt!273098 () Unit!18950)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37117 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11859) Unit!18950)

(assert (=> b!600401 (= lt!273098 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11856))))

(assert (=> b!600401 (arrayContainsKey!0 lt!273102 (select (arr!17818 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273104 () Unit!18950)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37117 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18950)

(assert (=> b!600401 (= lt!273104 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273102 (select (arr!17818 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600402 () Bool)

(assert (=> b!600402 (= e!343268 (not e!343272))))

(declare-fun res!385285 () Bool)

(assert (=> b!600402 (=> res!385285 e!343272)))

(declare-fun lt!273100 () SeekEntryResult!6258)

(assert (=> b!600402 (= res!385285 (not (= lt!273100 (Found!6258 index!984))))))

(declare-fun lt!273108 () Unit!18950)

(assert (=> b!600402 (= lt!273108 e!343264)))

(declare-fun c!67922 () Bool)

(assert (=> b!600402 (= c!67922 (= lt!273100 Undefined!6258))))

(assert (=> b!600402 (= lt!273100 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273097 lt!273102 mask!3053))))

(declare-fun e!343267 () Bool)

(assert (=> b!600402 e!343267))

(declare-fun res!385283 () Bool)

(assert (=> b!600402 (=> (not res!385283) (not e!343267))))

(declare-fun lt!273107 () SeekEntryResult!6258)

(declare-fun lt!273106 () (_ BitVec 32))

(assert (=> b!600402 (= res!385283 (= lt!273107 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273106 vacantSpotIndex!68 lt!273097 lt!273102 mask!3053)))))

(assert (=> b!600402 (= lt!273107 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273106 vacantSpotIndex!68 (select (arr!17818 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600402 (= lt!273097 (select (store (arr!17818 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!273105 () Unit!18950)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37117 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18950)

(assert (=> b!600402 (= lt!273105 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273106 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600402 (= lt!273106 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!600403 () Bool)

(declare-fun res!385280 () Bool)

(assert (=> b!600403 (=> (not res!385280) (not e!343261))))

(assert (=> b!600403 (= res!385280 (validKeyInArray!0 k0!1786))))

(declare-fun b!600404 () Bool)

(declare-fun res!385290 () Bool)

(assert (=> b!600404 (=> (not res!385290) (not e!343269))))

(assert (=> b!600404 (= res!385290 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17818 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!385289 () Bool)

(assert (=> start!54882 (=> (not res!385289) (not e!343261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54882 (= res!385289 (validMask!0 mask!3053))))

(assert (=> start!54882 e!343261))

(assert (=> start!54882 true))

(declare-fun array_inv!13614 (array!37117) Bool)

(assert (=> start!54882 (array_inv!13614 a!2986)))

(declare-fun b!600394 () Bool)

(assert (=> b!600394 (= e!343267 (= lt!273101 lt!273107))))

(assert (= (and start!54882 res!385289) b!600395))

(assert (= (and b!600395 res!385288) b!600397))

(assert (= (and b!600397 res!385276) b!600403))

(assert (= (and b!600403 res!385280) b!600400))

(assert (= (and b!600400 res!385292) b!600399))

(assert (= (and b!600399 res!385284) b!600386))

(assert (= (and b!600386 res!385273) b!600392))

(assert (= (and b!600392 res!385282) b!600404))

(assert (= (and b!600404 res!385290) b!600390))

(assert (= (and b!600390 res!385287) b!600383))

(assert (= (and b!600383 res!385277) b!600402))

(assert (= (and b!600402 res!385283) b!600394))

(assert (= (and b!600402 c!67922) b!600385))

(assert (= (and b!600402 (not c!67922)) b!600387))

(assert (= (and b!600402 (not res!385285)) b!600391))

(assert (= (and b!600391 res!385275) b!600384))

(assert (= (and b!600384 (not res!385291)) b!600389))

(assert (= (and b!600389 res!385286) b!600393))

(assert (= (and b!600391 (not res!385278)) b!600401))

(assert (= (and b!600401 (not res!385281)) b!600388))

(assert (= (and b!600388 (not res!385274)) b!600398))

(assert (= (and b!600398 (not res!385279)) b!600396))

(declare-fun m!577605 () Bool)

(assert (=> b!600400 m!577605))

(declare-fun m!577607 () Bool)

(assert (=> b!600384 m!577607))

(declare-fun m!577609 () Bool)

(assert (=> b!600383 m!577609))

(assert (=> b!600383 m!577607))

(assert (=> b!600383 m!577607))

(declare-fun m!577611 () Bool)

(assert (=> b!600383 m!577611))

(declare-fun m!577613 () Bool)

(assert (=> b!600398 m!577613))

(declare-fun m!577615 () Bool)

(assert (=> b!600388 m!577615))

(declare-fun m!577617 () Bool)

(assert (=> b!600396 m!577617))

(assert (=> b!600397 m!577607))

(assert (=> b!600397 m!577607))

(declare-fun m!577619 () Bool)

(assert (=> b!600397 m!577619))

(declare-fun m!577621 () Bool)

(assert (=> b!600386 m!577621))

(declare-fun m!577623 () Bool)

(assert (=> b!600404 m!577623))

(assert (=> b!600389 m!577607))

(assert (=> b!600389 m!577607))

(declare-fun m!577625 () Bool)

(assert (=> b!600389 m!577625))

(declare-fun m!577627 () Bool)

(assert (=> b!600402 m!577627))

(declare-fun m!577629 () Bool)

(assert (=> b!600402 m!577629))

(assert (=> b!600402 m!577607))

(declare-fun m!577631 () Bool)

(assert (=> b!600402 m!577631))

(declare-fun m!577633 () Bool)

(assert (=> b!600402 m!577633))

(declare-fun m!577635 () Bool)

(assert (=> b!600402 m!577635))

(assert (=> b!600402 m!577607))

(declare-fun m!577637 () Bool)

(assert (=> b!600402 m!577637))

(declare-fun m!577639 () Bool)

(assert (=> b!600402 m!577639))

(assert (=> b!600393 m!577607))

(assert (=> b!600393 m!577607))

(declare-fun m!577641 () Bool)

(assert (=> b!600393 m!577641))

(declare-fun m!577643 () Bool)

(assert (=> b!600403 m!577643))

(assert (=> b!600390 m!577631))

(declare-fun m!577645 () Bool)

(assert (=> b!600390 m!577645))

(declare-fun m!577647 () Bool)

(assert (=> b!600392 m!577647))

(declare-fun m!577649 () Bool)

(assert (=> b!600401 m!577649))

(assert (=> b!600401 m!577607))

(declare-fun m!577651 () Bool)

(assert (=> b!600401 m!577651))

(assert (=> b!600401 m!577607))

(declare-fun m!577653 () Bool)

(assert (=> b!600401 m!577653))

(declare-fun m!577655 () Bool)

(assert (=> b!600401 m!577655))

(assert (=> b!600401 m!577607))

(declare-fun m!577657 () Bool)

(assert (=> b!600401 m!577657))

(declare-fun m!577659 () Bool)

(assert (=> b!600401 m!577659))

(declare-fun m!577661 () Bool)

(assert (=> b!600399 m!577661))

(assert (=> b!600391 m!577607))

(assert (=> b!600391 m!577631))

(declare-fun m!577663 () Bool)

(assert (=> b!600391 m!577663))

(declare-fun m!577665 () Bool)

(assert (=> start!54882 m!577665))

(declare-fun m!577667 () Bool)

(assert (=> start!54882 m!577667))

(check-sat (not b!600402) (not b!600388) (not b!600386) (not b!600399) (not b!600397) (not b!600396) (not b!600398) (not b!600392) (not b!600403) (not b!600401) (not start!54882) (not b!600383) (not b!600389) (not b!600400) (not b!600393))
(check-sat)
