; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54188 () Bool)

(assert start!54188)

(declare-fun b!592484 () Bool)

(declare-fun e!338354 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!36918 0))(
  ( (array!36919 (arr!17729 (Array (_ BitVec 32) (_ BitVec 64))) (size!18093 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36918)

(assert (=> b!592484 (= e!338354 (or (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18093 a!2986)) (bvslt (size!18093 a!2986) #b01111111111111111111111111111111)))))

(declare-fun lt!268969 () array!36918)

(declare-fun arrayContainsKey!0 (array!36918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592484 (arrayContainsKey!0 lt!268969 (select (arr!17729 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!18594 0))(
  ( (Unit!18595) )
))
(declare-fun lt!268963 () Unit!18594)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36918 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18594)

(assert (=> b!592484 (= lt!268963 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268969 (select (arr!17729 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592485 () Bool)

(declare-fun e!338357 () Unit!18594)

(declare-fun Unit!18596 () Unit!18594)

(assert (=> b!592485 (= e!338357 Unit!18596)))

(declare-fun b!592486 () Bool)

(declare-fun res!379327 () Bool)

(declare-fun e!338355 () Bool)

(assert (=> b!592486 (=> (not res!379327) (not e!338355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592486 (= res!379327 (validKeyInArray!0 (select (arr!17729 a!2986) j!136)))))

(declare-fun b!592487 () Bool)

(declare-fun e!338350 () Bool)

(declare-fun e!338358 () Bool)

(assert (=> b!592487 (= e!338350 e!338358)))

(declare-fun res!379322 () Bool)

(assert (=> b!592487 (=> (not res!379322) (not e!338358))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6169 0))(
  ( (MissingZero!6169 (index!26912 (_ BitVec 32))) (Found!6169 (index!26913 (_ BitVec 32))) (Intermediate!6169 (undefined!6981 Bool) (index!26914 (_ BitVec 32)) (x!55697 (_ BitVec 32))) (Undefined!6169) (MissingVacant!6169 (index!26915 (_ BitVec 32))) )
))
(declare-fun lt!268960 () SeekEntryResult!6169)

(assert (=> b!592487 (= res!379322 (and (= lt!268960 (Found!6169 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17729 a!2986) index!984) (select (arr!17729 a!2986) j!136))) (not (= (select (arr!17729 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36918 (_ BitVec 32)) SeekEntryResult!6169)

(assert (=> b!592487 (= lt!268960 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17729 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592488 () Bool)

(declare-fun res!379323 () Bool)

(assert (=> b!592488 (=> (not res!379323) (not e!338355))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!592488 (= res!379323 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun e!338352 () Bool)

(declare-fun b!592489 () Bool)

(assert (=> b!592489 (= e!338352 (arrayContainsKey!0 lt!268969 (select (arr!17729 a!2986) j!136) index!984))))

(declare-fun b!592490 () Bool)

(declare-fun e!338353 () Bool)

(declare-fun e!338356 () Bool)

(assert (=> b!592490 (= e!338353 e!338356)))

(declare-fun res!379320 () Bool)

(assert (=> b!592490 (=> res!379320 e!338356)))

(declare-fun lt!268961 () (_ BitVec 64))

(declare-fun lt!268965 () (_ BitVec 64))

(assert (=> b!592490 (= res!379320 (or (not (= (select (arr!17729 a!2986) j!136) lt!268961)) (not (= (select (arr!17729 a!2986) j!136) lt!268965)) (bvsge j!136 index!984)))))

(declare-fun b!592491 () Bool)

(declare-fun e!338348 () Bool)

(assert (=> b!592491 (= e!338348 e!338350)))

(declare-fun res!379317 () Bool)

(assert (=> b!592491 (=> (not res!379317) (not e!338350))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!592491 (= res!379317 (= (select (store (arr!17729 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592491 (= lt!268969 (array!36919 (store (arr!17729 a!2986) i!1108 k!1786) (size!18093 a!2986)))))

(declare-fun res!379316 () Bool)

(assert (=> start!54188 (=> (not res!379316) (not e!338355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54188 (= res!379316 (validMask!0 mask!3053))))

(assert (=> start!54188 e!338355))

(assert (=> start!54188 true))

(declare-fun array_inv!13525 (array!36918) Bool)

(assert (=> start!54188 (array_inv!13525 a!2986)))

(declare-fun b!592492 () Bool)

(assert (=> b!592492 (= e!338355 e!338348)))

(declare-fun res!379321 () Bool)

(assert (=> b!592492 (=> (not res!379321) (not e!338348))))

(declare-fun lt!268967 () SeekEntryResult!6169)

(assert (=> b!592492 (= res!379321 (or (= lt!268967 (MissingZero!6169 i!1108)) (= lt!268967 (MissingVacant!6169 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36918 (_ BitVec 32)) SeekEntryResult!6169)

(assert (=> b!592492 (= lt!268967 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!592493 () Bool)

(declare-fun e!338351 () Bool)

(declare-fun lt!268962 () SeekEntryResult!6169)

(assert (=> b!592493 (= e!338351 (= lt!268960 lt!268962))))

(declare-fun b!592494 () Bool)

(declare-fun res!379325 () Bool)

(assert (=> b!592494 (=> (not res!379325) (not e!338355))))

(assert (=> b!592494 (= res!379325 (validKeyInArray!0 k!1786))))

(declare-fun b!592495 () Bool)

(declare-fun e!338349 () Bool)

(assert (=> b!592495 (= e!338349 e!338354)))

(declare-fun res!379312 () Bool)

(assert (=> b!592495 (=> res!379312 e!338354)))

(assert (=> b!592495 (= res!379312 (or (not (= (select (arr!17729 a!2986) j!136) lt!268961)) (not (= (select (arr!17729 a!2986) j!136) lt!268965)) (bvsge j!136 index!984)))))

(assert (=> b!592495 e!338353))

(declare-fun res!379315 () Bool)

(assert (=> b!592495 (=> (not res!379315) (not e!338353))))

(assert (=> b!592495 (= res!379315 (= lt!268965 (select (arr!17729 a!2986) j!136)))))

(assert (=> b!592495 (= lt!268965 (select (store (arr!17729 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!592496 () Bool)

(assert (=> b!592496 (= e!338356 e!338352)))

(declare-fun res!379326 () Bool)

(assert (=> b!592496 (=> (not res!379326) (not e!338352))))

(assert (=> b!592496 (= res!379326 (arrayContainsKey!0 lt!268969 (select (arr!17729 a!2986) j!136) j!136))))

(declare-fun b!592497 () Bool)

(declare-fun res!379313 () Bool)

(assert (=> b!592497 (=> (not res!379313) (not e!338348))))

(assert (=> b!592497 (= res!379313 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17729 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592498 () Bool)

(declare-fun Unit!18597 () Unit!18594)

(assert (=> b!592498 (= e!338357 Unit!18597)))

(assert (=> b!592498 false))

(declare-fun b!592499 () Bool)

(assert (=> b!592499 (= e!338358 (not e!338349))))

(declare-fun res!379314 () Bool)

(assert (=> b!592499 (=> res!379314 e!338349)))

(declare-fun lt!268959 () SeekEntryResult!6169)

(assert (=> b!592499 (= res!379314 (not (= lt!268959 (Found!6169 index!984))))))

(declare-fun lt!268966 () Unit!18594)

(assert (=> b!592499 (= lt!268966 e!338357)))

(declare-fun c!66953 () Bool)

(assert (=> b!592499 (= c!66953 (= lt!268959 Undefined!6169))))

(assert (=> b!592499 (= lt!268959 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268961 lt!268969 mask!3053))))

(assert (=> b!592499 e!338351))

(declare-fun res!379328 () Bool)

(assert (=> b!592499 (=> (not res!379328) (not e!338351))))

(declare-fun lt!268964 () (_ BitVec 32))

(assert (=> b!592499 (= res!379328 (= lt!268962 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268964 vacantSpotIndex!68 lt!268961 lt!268969 mask!3053)))))

(assert (=> b!592499 (= lt!268962 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268964 vacantSpotIndex!68 (select (arr!17729 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!592499 (= lt!268961 (select (store (arr!17729 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268968 () Unit!18594)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36918 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18594)

(assert (=> b!592499 (= lt!268968 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268964 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592499 (= lt!268964 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!592500 () Bool)

(declare-fun res!379319 () Bool)

(assert (=> b!592500 (=> (not res!379319) (not e!338355))))

(assert (=> b!592500 (= res!379319 (and (= (size!18093 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18093 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18093 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!592501 () Bool)

(declare-fun res!379318 () Bool)

(assert (=> b!592501 (=> (not res!379318) (not e!338348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36918 (_ BitVec 32)) Bool)

(assert (=> b!592501 (= res!379318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592502 () Bool)

(declare-fun res!379324 () Bool)

(assert (=> b!592502 (=> (not res!379324) (not e!338348))))

(declare-datatypes ((List!11770 0))(
  ( (Nil!11767) (Cons!11766 (h!12811 (_ BitVec 64)) (t!17998 List!11770)) )
))
(declare-fun arrayNoDuplicates!0 (array!36918 (_ BitVec 32) List!11770) Bool)

(assert (=> b!592502 (= res!379324 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11767))))

(assert (= (and start!54188 res!379316) b!592500))

(assert (= (and b!592500 res!379319) b!592486))

(assert (= (and b!592486 res!379327) b!592494))

(assert (= (and b!592494 res!379325) b!592488))

(assert (= (and b!592488 res!379323) b!592492))

(assert (= (and b!592492 res!379321) b!592501))

(assert (= (and b!592501 res!379318) b!592502))

(assert (= (and b!592502 res!379324) b!592497))

(assert (= (and b!592497 res!379313) b!592491))

(assert (= (and b!592491 res!379317) b!592487))

(assert (= (and b!592487 res!379322) b!592499))

(assert (= (and b!592499 res!379328) b!592493))

(assert (= (and b!592499 c!66953) b!592498))

(assert (= (and b!592499 (not c!66953)) b!592485))

(assert (= (and b!592499 (not res!379314)) b!592495))

(assert (= (and b!592495 res!379315) b!592490))

(assert (= (and b!592490 (not res!379320)) b!592496))

(assert (= (and b!592496 res!379326) b!592489))

(assert (= (and b!592495 (not res!379312)) b!592484))

(declare-fun m!570587 () Bool)

(assert (=> b!592484 m!570587))

(assert (=> b!592484 m!570587))

(declare-fun m!570589 () Bool)

(assert (=> b!592484 m!570589))

(assert (=> b!592484 m!570587))

(declare-fun m!570591 () Bool)

(assert (=> b!592484 m!570591))

(declare-fun m!570593 () Bool)

(assert (=> b!592502 m!570593))

(declare-fun m!570595 () Bool)

(assert (=> b!592501 m!570595))

(declare-fun m!570597 () Bool)

(assert (=> start!54188 m!570597))

(declare-fun m!570599 () Bool)

(assert (=> start!54188 m!570599))

(declare-fun m!570601 () Bool)

(assert (=> b!592492 m!570601))

(declare-fun m!570603 () Bool)

(assert (=> b!592497 m!570603))

(declare-fun m!570605 () Bool)

(assert (=> b!592499 m!570605))

(declare-fun m!570607 () Bool)

(assert (=> b!592499 m!570607))

(assert (=> b!592499 m!570587))

(declare-fun m!570609 () Bool)

(assert (=> b!592499 m!570609))

(declare-fun m!570611 () Bool)

(assert (=> b!592499 m!570611))

(assert (=> b!592499 m!570587))

(declare-fun m!570613 () Bool)

(assert (=> b!592499 m!570613))

(declare-fun m!570615 () Bool)

(assert (=> b!592499 m!570615))

(declare-fun m!570617 () Bool)

(assert (=> b!592499 m!570617))

(declare-fun m!570619 () Bool)

(assert (=> b!592488 m!570619))

(assert (=> b!592496 m!570587))

(assert (=> b!592496 m!570587))

(declare-fun m!570621 () Bool)

(assert (=> b!592496 m!570621))

(assert (=> b!592489 m!570587))

(assert (=> b!592489 m!570587))

(declare-fun m!570623 () Bool)

(assert (=> b!592489 m!570623))

(assert (=> b!592491 m!570617))

(declare-fun m!570625 () Bool)

(assert (=> b!592491 m!570625))

(declare-fun m!570627 () Bool)

(assert (=> b!592487 m!570627))

(assert (=> b!592487 m!570587))

(assert (=> b!592487 m!570587))

(declare-fun m!570629 () Bool)

(assert (=> b!592487 m!570629))

(assert (=> b!592486 m!570587))

(assert (=> b!592486 m!570587))

(declare-fun m!570631 () Bool)

(assert (=> b!592486 m!570631))

(declare-fun m!570633 () Bool)

(assert (=> b!592494 m!570633))

(assert (=> b!592495 m!570587))

(assert (=> b!592495 m!570617))

(declare-fun m!570635 () Bool)

(assert (=> b!592495 m!570635))

(assert (=> b!592490 m!570587))

(push 1)

(assert (not b!592486))

(assert (not start!54188))

(assert (not b!592496))

(assert (not b!592487))

(assert (not b!592484))

(assert (not b!592492))

(assert (not b!592501))

(assert (not b!592489))

(assert (not b!592499))

(assert (not b!592502))

(assert (not b!592488))

(assert (not b!592494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86249 () Bool)

(assert (=> d!86249 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!592494 d!86249))

(declare-fun d!86251 () Bool)

(declare-fun res!379348 () Bool)

(declare-fun e!338399 () Bool)

(assert (=> d!86251 (=> res!379348 e!338399)))

(assert (=> d!86251 (= res!379348 (= (select (arr!17729 lt!268969) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17729 a!2986) j!136)))))

(assert (=> d!86251 (= (arrayContainsKey!0 lt!268969 (select (arr!17729 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!338399)))

(declare-fun b!592564 () Bool)

(declare-fun e!338400 () Bool)

(assert (=> b!592564 (= e!338399 e!338400)))

(declare-fun res!379349 () Bool)

(assert (=> b!592564 (=> (not res!379349) (not e!338400))))

(assert (=> b!592564 (= res!379349 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18093 lt!268969)))))

(declare-fun b!592565 () Bool)

(assert (=> b!592565 (= e!338400 (arrayContainsKey!0 lt!268969 (select (arr!17729 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86251 (not res!379348)) b!592564))

(assert (= (and b!592564 res!379349) b!592565))

(declare-fun m!570689 () Bool)

(assert (=> d!86251 m!570689))

(assert (=> b!592565 m!570587))

(declare-fun m!570691 () Bool)

(assert (=> b!592565 m!570691))

(assert (=> b!592484 d!86251))

(declare-fun d!86253 () Bool)

(assert (=> d!86253 (arrayContainsKey!0 lt!268969 (select (arr!17729 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269011 () Unit!18594)

(declare-fun choose!114 (array!36918 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18594)

(assert (=> d!86253 (= lt!269011 (choose!114 lt!268969 (select (arr!17729 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86253 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86253 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268969 (select (arr!17729 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!269011)))

(declare-fun bs!18290 () Bool)

(assert (= bs!18290 d!86253))

(assert (=> bs!18290 m!570587))

(assert (=> bs!18290 m!570589))

(assert (=> bs!18290 m!570587))

(declare-fun m!570693 () Bool)

(assert (=> bs!18290 m!570693))

(assert (=> b!592484 d!86253))

(declare-fun d!86255 () Bool)

(assert (=> d!86255 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54188 d!86255))

(declare-fun d!86269 () Bool)

(assert (=> d!86269 (= (array_inv!13525 a!2986) (bvsge (size!18093 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54188 d!86269))

(declare-fun d!86271 () Bool)

(assert (=> d!86271 (= (validKeyInArray!0 (select (arr!17729 a!2986) j!136)) (and (not (= (select (arr!17729 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17729 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!592486 d!86271))

(declare-fun d!86273 () Bool)

(declare-fun res!379358 () Bool)

(declare-fun e!338427 () Bool)

(assert (=> d!86273 (=> res!379358 e!338427)))

(assert (=> d!86273 (= res!379358 (= (select (arr!17729 lt!268969) j!136) (select (arr!17729 a!2986) j!136)))))

(assert (=> d!86273 (= (arrayContainsKey!0 lt!268969 (select (arr!17729 a!2986) j!136) j!136) e!338427)))

(declare-fun b!592608 () Bool)

(declare-fun e!338428 () Bool)

(assert (=> b!592608 (= e!338427 e!338428)))

(declare-fun res!379359 () Bool)

(assert (=> b!592608 (=> (not res!379359) (not e!338428))))

(assert (=> b!592608 (= res!379359 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18093 lt!268969)))))

(declare-fun b!592609 () Bool)

(assert (=> b!592609 (= e!338428 (arrayContainsKey!0 lt!268969 (select (arr!17729 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86273 (not res!379358)) b!592608))

(assert (= (and b!592608 res!379359) b!592609))

(declare-fun m!570735 () Bool)

(assert (=> d!86273 m!570735))

(assert (=> b!592609 m!570587))

(declare-fun m!570737 () Bool)

(assert (=> b!592609 m!570737))

(assert (=> b!592496 d!86273))

(declare-fun d!86275 () Bool)

(declare-fun e!338464 () Bool)

(assert (=> d!86275 e!338464))

(declare-fun res!379387 () Bool)

(assert (=> d!86275 (=> (not res!379387) (not e!338464))))

(assert (=> d!86275 (= res!379387 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18093 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18093 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18093 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18093 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18093 a!2986))))))

(declare-fun lt!269032 () Unit!18594)

(declare-fun choose!9 (array!36918 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18594)

(assert (=> d!86275 (= lt!269032 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268964 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86275 (validMask!0 mask!3053)))

