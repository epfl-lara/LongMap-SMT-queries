; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58124 () Bool)

(assert start!58124)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!367829 () Bool)

(declare-datatypes ((array!38394 0))(
  ( (array!38395 (arr!18413 (Array (_ BitVec 32) (_ BitVec 64))) (size!18778 (_ BitVec 32))) )
))
(declare-fun lt!297391 () array!38394)

(declare-fun b!642312 () Bool)

(declare-fun a!2986 () array!38394)

(declare-fun arrayContainsKey!0 (array!38394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642312 (= e!367829 (arrayContainsKey!0 lt!297391 (select (arr!18413 a!2986) j!136) j!136))))

(declare-fun b!642314 () Bool)

(declare-fun res!416179 () Bool)

(declare-fun e!367832 () Bool)

(assert (=> b!642314 (=> (not res!416179) (not e!367832))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!642314 (= res!416179 (and (= (size!18778 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18778 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18778 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642315 () Bool)

(declare-fun res!416171 () Bool)

(declare-fun e!367830 () Bool)

(assert (=> b!642315 (=> (not res!416171) (not e!367830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38394 (_ BitVec 32)) Bool)

(assert (=> b!642315 (= res!416171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642316 () Bool)

(declare-datatypes ((Unit!21728 0))(
  ( (Unit!21729) )
))
(declare-fun e!367841 () Unit!21728)

(declare-fun Unit!21730 () Unit!21728)

(assert (=> b!642316 (= e!367841 Unit!21730)))

(declare-fun b!642317 () Bool)

(declare-fun e!367840 () Unit!21728)

(declare-fun Unit!21731 () Unit!21728)

(assert (=> b!642317 (= e!367840 Unit!21731)))

(declare-fun b!642318 () Bool)

(declare-fun res!416183 () Bool)

(assert (=> b!642318 (=> (not res!416183) (not e!367830))))

(declare-datatypes ((List!12493 0))(
  ( (Nil!12490) (Cons!12489 (h!13534 (_ BitVec 64)) (t!18712 List!12493)) )
))
(declare-fun arrayNoDuplicates!0 (array!38394 (_ BitVec 32) List!12493) Bool)

(assert (=> b!642318 (= res!416183 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12490))))

(declare-fun b!642319 () Bool)

(declare-fun e!367835 () Bool)

(declare-fun e!367839 () Bool)

(assert (=> b!642319 (= e!367835 e!367839)))

(declare-fun res!416185 () Bool)

(assert (=> b!642319 (=> (not res!416185) (not e!367839))))

(assert (=> b!642319 (= res!416185 (arrayContainsKey!0 lt!297391 (select (arr!18413 a!2986) j!136) j!136))))

(declare-fun b!642320 () Bool)

(declare-fun e!367828 () Bool)

(assert (=> b!642320 (= e!367830 e!367828)))

(declare-fun res!416174 () Bool)

(assert (=> b!642320 (=> (not res!416174) (not e!367828))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!642320 (= res!416174 (= (select (store (arr!18413 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642320 (= lt!297391 (array!38395 (store (arr!18413 a!2986) i!1108 k0!1786) (size!18778 a!2986)))))

(declare-fun b!642321 () Bool)

(declare-fun e!367838 () Bool)

(assert (=> b!642321 (= e!367838 e!367835)))

(declare-fun res!416176 () Bool)

(assert (=> b!642321 (=> res!416176 e!367835)))

(declare-fun lt!297379 () (_ BitVec 64))

(declare-fun lt!297386 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!642321 (= res!416176 (or (not (= (select (arr!18413 a!2986) j!136) lt!297379)) (not (= (select (arr!18413 a!2986) j!136) lt!297386)) (bvsge j!136 index!984)))))

(declare-fun b!642322 () Bool)

(declare-fun Unit!21732 () Unit!21728)

(assert (=> b!642322 (= e!367841 Unit!21732)))

(declare-fun lt!297382 () Unit!21728)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38394 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21728)

(assert (=> b!642322 (= lt!297382 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297391 (select (arr!18413 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!642322 (arrayContainsKey!0 lt!297391 (select (arr!18413 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297383 () Unit!21728)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38394 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12493) Unit!21728)

(assert (=> b!642322 (= lt!297383 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12490))))

(assert (=> b!642322 (arrayNoDuplicates!0 lt!297391 #b00000000000000000000000000000000 Nil!12490)))

(declare-fun lt!297392 () Unit!21728)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38394 (_ BitVec 32) (_ BitVec 32)) Unit!21728)

(assert (=> b!642322 (= lt!297392 (lemmaNoDuplicateFromThenFromBigger!0 lt!297391 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642322 (arrayNoDuplicates!0 lt!297391 j!136 Nil!12490)))

(declare-fun lt!297381 () Unit!21728)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38394 (_ BitVec 64) (_ BitVec 32) List!12493) Unit!21728)

(assert (=> b!642322 (= lt!297381 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297391 (select (arr!18413 a!2986) j!136) j!136 Nil!12490))))

(assert (=> b!642322 false))

(declare-fun b!642323 () Bool)

(declare-fun e!367831 () Bool)

(declare-datatypes ((SeekEntryResult!6850 0))(
  ( (MissingZero!6850 (index!29726 (_ BitVec 32))) (Found!6850 (index!29727 (_ BitVec 32))) (Intermediate!6850 (undefined!7662 Bool) (index!29728 (_ BitVec 32)) (x!58499 (_ BitVec 32))) (Undefined!6850) (MissingVacant!6850 (index!29729 (_ BitVec 32))) )
))
(declare-fun lt!297390 () SeekEntryResult!6850)

(declare-fun lt!297393 () SeekEntryResult!6850)

(assert (=> b!642323 (= e!367831 (= lt!297390 lt!297393))))

(declare-fun b!642324 () Bool)

(assert (=> b!642324 (= e!367832 e!367830)))

(declare-fun res!416178 () Bool)

(assert (=> b!642324 (=> (not res!416178) (not e!367830))))

(declare-fun lt!297384 () SeekEntryResult!6850)

(assert (=> b!642324 (= res!416178 (or (= lt!297384 (MissingZero!6850 i!1108)) (= lt!297384 (MissingVacant!6850 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38394 (_ BitVec 32)) SeekEntryResult!6850)

(assert (=> b!642324 (= lt!297384 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!642325 () Bool)

(declare-fun res!416168 () Bool)

(assert (=> b!642325 (=> (not res!416168) (not e!367832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642325 (= res!416168 (validKeyInArray!0 (select (arr!18413 a!2986) j!136)))))

(declare-fun b!642326 () Bool)

(declare-fun e!367836 () Bool)

(declare-fun e!367834 () Bool)

(assert (=> b!642326 (= e!367836 (not e!367834))))

(declare-fun res!416177 () Bool)

(assert (=> b!642326 (=> res!416177 e!367834)))

(declare-fun lt!297389 () SeekEntryResult!6850)

(assert (=> b!642326 (= res!416177 (not (= lt!297389 (Found!6850 index!984))))))

(declare-fun lt!297388 () Unit!21728)

(assert (=> b!642326 (= lt!297388 e!367840)))

(declare-fun c!73440 () Bool)

(assert (=> b!642326 (= c!73440 (= lt!297389 Undefined!6850))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38394 (_ BitVec 32)) SeekEntryResult!6850)

(assert (=> b!642326 (= lt!297389 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297379 lt!297391 mask!3053))))

(assert (=> b!642326 e!367831))

(declare-fun res!416172 () Bool)

(assert (=> b!642326 (=> (not res!416172) (not e!367831))))

(declare-fun lt!297380 () (_ BitVec 32))

(assert (=> b!642326 (= res!416172 (= lt!297393 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297380 vacantSpotIndex!68 lt!297379 lt!297391 mask!3053)))))

(assert (=> b!642326 (= lt!297393 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297380 vacantSpotIndex!68 (select (arr!18413 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!642326 (= lt!297379 (select (store (arr!18413 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297387 () Unit!21728)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38394 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21728)

(assert (=> b!642326 (= lt!297387 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297380 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642326 (= lt!297380 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642327 () Bool)

(declare-fun res!416175 () Bool)

(assert (=> b!642327 (=> (not res!416175) (not e!367832))))

(assert (=> b!642327 (= res!416175 (validKeyInArray!0 k0!1786))))

(declare-fun res!416182 () Bool)

(assert (=> start!58124 (=> (not res!416182) (not e!367832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58124 (= res!416182 (validMask!0 mask!3053))))

(assert (=> start!58124 e!367832))

(assert (=> start!58124 true))

(declare-fun array_inv!14296 (array!38394) Bool)

(assert (=> start!58124 (array_inv!14296 a!2986)))

(declare-fun b!642313 () Bool)

(declare-fun e!367837 () Bool)

(assert (=> b!642313 (= e!367834 e!367837)))

(declare-fun res!416184 () Bool)

(assert (=> b!642313 (=> res!416184 e!367837)))

(assert (=> b!642313 (= res!416184 (or (not (= (select (arr!18413 a!2986) j!136) lt!297379)) (not (= (select (arr!18413 a!2986) j!136) lt!297386))))))

(assert (=> b!642313 e!367838))

(declare-fun res!416170 () Bool)

(assert (=> b!642313 (=> (not res!416170) (not e!367838))))

(assert (=> b!642313 (= res!416170 (= lt!297386 (select (arr!18413 a!2986) j!136)))))

(assert (=> b!642313 (= lt!297386 (select (store (arr!18413 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!642328 () Bool)

(assert (=> b!642328 (= e!367837 e!367829)))

(declare-fun res!416181 () Bool)

(assert (=> b!642328 (=> res!416181 e!367829)))

(assert (=> b!642328 (= res!416181 (bvsge index!984 j!136))))

(declare-fun lt!297385 () Unit!21728)

(assert (=> b!642328 (= lt!297385 e!367841)))

(declare-fun c!73439 () Bool)

(assert (=> b!642328 (= c!73439 (bvslt j!136 index!984))))

(declare-fun b!642329 () Bool)

(declare-fun res!416169 () Bool)

(assert (=> b!642329 (=> (not res!416169) (not e!367830))))

(assert (=> b!642329 (= res!416169 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18413 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642330 () Bool)

(declare-fun Unit!21733 () Unit!21728)

(assert (=> b!642330 (= e!367840 Unit!21733)))

(assert (=> b!642330 false))

(declare-fun b!642331 () Bool)

(assert (=> b!642331 (= e!367828 e!367836)))

(declare-fun res!416173 () Bool)

(assert (=> b!642331 (=> (not res!416173) (not e!367836))))

(assert (=> b!642331 (= res!416173 (and (= lt!297390 (Found!6850 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18413 a!2986) index!984) (select (arr!18413 a!2986) j!136))) (not (= (select (arr!18413 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!642331 (= lt!297390 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18413 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642332 () Bool)

(assert (=> b!642332 (= e!367839 (arrayContainsKey!0 lt!297391 (select (arr!18413 a!2986) j!136) index!984))))

(declare-fun b!642333 () Bool)

(declare-fun res!416180 () Bool)

(assert (=> b!642333 (=> (not res!416180) (not e!367832))))

(assert (=> b!642333 (= res!416180 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!58124 res!416182) b!642314))

(assert (= (and b!642314 res!416179) b!642325))

(assert (= (and b!642325 res!416168) b!642327))

(assert (= (and b!642327 res!416175) b!642333))

(assert (= (and b!642333 res!416180) b!642324))

(assert (= (and b!642324 res!416178) b!642315))

(assert (= (and b!642315 res!416171) b!642318))

(assert (= (and b!642318 res!416183) b!642329))

(assert (= (and b!642329 res!416169) b!642320))

(assert (= (and b!642320 res!416174) b!642331))

(assert (= (and b!642331 res!416173) b!642326))

(assert (= (and b!642326 res!416172) b!642323))

(assert (= (and b!642326 c!73440) b!642330))

(assert (= (and b!642326 (not c!73440)) b!642317))

(assert (= (and b!642326 (not res!416177)) b!642313))

(assert (= (and b!642313 res!416170) b!642321))

(assert (= (and b!642321 (not res!416176)) b!642319))

(assert (= (and b!642319 res!416185) b!642332))

(assert (= (and b!642313 (not res!416184)) b!642328))

(assert (= (and b!642328 c!73439) b!642322))

(assert (= (and b!642328 (not c!73439)) b!642316))

(assert (= (and b!642328 (not res!416181)) b!642312))

(declare-fun m!615603 () Bool)

(assert (=> b!642319 m!615603))

(assert (=> b!642319 m!615603))

(declare-fun m!615605 () Bool)

(assert (=> b!642319 m!615605))

(declare-fun m!615607 () Bool)

(assert (=> b!642333 m!615607))

(assert (=> b!642322 m!615603))

(declare-fun m!615609 () Bool)

(assert (=> b!642322 m!615609))

(declare-fun m!615611 () Bool)

(assert (=> b!642322 m!615611))

(assert (=> b!642322 m!615603))

(declare-fun m!615613 () Bool)

(assert (=> b!642322 m!615613))

(assert (=> b!642322 m!615603))

(declare-fun m!615615 () Bool)

(assert (=> b!642322 m!615615))

(assert (=> b!642322 m!615603))

(declare-fun m!615617 () Bool)

(assert (=> b!642322 m!615617))

(declare-fun m!615619 () Bool)

(assert (=> b!642322 m!615619))

(declare-fun m!615621 () Bool)

(assert (=> b!642322 m!615621))

(declare-fun m!615623 () Bool)

(assert (=> b!642324 m!615623))

(assert (=> b!642325 m!615603))

(assert (=> b!642325 m!615603))

(declare-fun m!615625 () Bool)

(assert (=> b!642325 m!615625))

(declare-fun m!615627 () Bool)

(assert (=> b!642329 m!615627))

(assert (=> b!642312 m!615603))

(assert (=> b!642312 m!615603))

(assert (=> b!642312 m!615605))

(assert (=> b!642332 m!615603))

(assert (=> b!642332 m!615603))

(declare-fun m!615629 () Bool)

(assert (=> b!642332 m!615629))

(declare-fun m!615631 () Bool)

(assert (=> b!642331 m!615631))

(assert (=> b!642331 m!615603))

(assert (=> b!642331 m!615603))

(declare-fun m!615633 () Bool)

(assert (=> b!642331 m!615633))

(declare-fun m!615635 () Bool)

(assert (=> b!642326 m!615635))

(declare-fun m!615637 () Bool)

(assert (=> b!642326 m!615637))

(assert (=> b!642326 m!615603))

(assert (=> b!642326 m!615603))

(declare-fun m!615639 () Bool)

(assert (=> b!642326 m!615639))

(declare-fun m!615641 () Bool)

(assert (=> b!642326 m!615641))

(declare-fun m!615643 () Bool)

(assert (=> b!642326 m!615643))

(declare-fun m!615645 () Bool)

(assert (=> b!642326 m!615645))

(declare-fun m!615647 () Bool)

(assert (=> b!642326 m!615647))

(assert (=> b!642321 m!615603))

(assert (=> b!642320 m!615641))

(declare-fun m!615649 () Bool)

(assert (=> b!642320 m!615649))

(assert (=> b!642313 m!615603))

(assert (=> b!642313 m!615641))

(declare-fun m!615651 () Bool)

(assert (=> b!642313 m!615651))

(declare-fun m!615653 () Bool)

(assert (=> b!642315 m!615653))

(declare-fun m!615655 () Bool)

(assert (=> b!642327 m!615655))

(declare-fun m!615657 () Bool)

(assert (=> start!58124 m!615657))

(declare-fun m!615659 () Bool)

(assert (=> start!58124 m!615659))

(declare-fun m!615661 () Bool)

(assert (=> b!642318 m!615661))

(check-sat (not start!58124) (not b!642322) (not b!642312) (not b!642319) (not b!642324) (not b!642331) (not b!642333) (not b!642315) (not b!642318) (not b!642327) (not b!642326) (not b!642325) (not b!642332))
(check-sat)
(get-model)

(declare-fun b!642478 () Bool)

(declare-fun e!367934 () SeekEntryResult!6850)

(assert (=> b!642478 (= e!367934 (Found!6850 index!984))))

(declare-fun b!642479 () Bool)

(declare-fun e!367932 () SeekEntryResult!6850)

(assert (=> b!642479 (= e!367932 Undefined!6850)))

(declare-fun b!642480 () Bool)

(assert (=> b!642480 (= e!367932 e!367934)))

(declare-fun lt!297488 () (_ BitVec 64))

(declare-fun c!73460 () Bool)

(assert (=> b!642480 (= c!73460 (= lt!297488 (select (arr!18413 a!2986) j!136)))))

(declare-fun d!90567 () Bool)

(declare-fun lt!297489 () SeekEntryResult!6850)

(get-info :version)

(assert (=> d!90567 (and (or ((_ is Undefined!6850) lt!297489) (not ((_ is Found!6850) lt!297489)) (and (bvsge (index!29727 lt!297489) #b00000000000000000000000000000000) (bvslt (index!29727 lt!297489) (size!18778 a!2986)))) (or ((_ is Undefined!6850) lt!297489) ((_ is Found!6850) lt!297489) (not ((_ is MissingVacant!6850) lt!297489)) (not (= (index!29729 lt!297489) vacantSpotIndex!68)) (and (bvsge (index!29729 lt!297489) #b00000000000000000000000000000000) (bvslt (index!29729 lt!297489) (size!18778 a!2986)))) (or ((_ is Undefined!6850) lt!297489) (ite ((_ is Found!6850) lt!297489) (= (select (arr!18413 a!2986) (index!29727 lt!297489)) (select (arr!18413 a!2986) j!136)) (and ((_ is MissingVacant!6850) lt!297489) (= (index!29729 lt!297489) vacantSpotIndex!68) (= (select (arr!18413 a!2986) (index!29729 lt!297489)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90567 (= lt!297489 e!367932)))

(declare-fun c!73459 () Bool)

(assert (=> d!90567 (= c!73459 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90567 (= lt!297488 (select (arr!18413 a!2986) index!984))))

(assert (=> d!90567 (validMask!0 mask!3053)))

(assert (=> d!90567 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18413 a!2986) j!136) a!2986 mask!3053) lt!297489)))

(declare-fun b!642481 () Bool)

(declare-fun e!367933 () SeekEntryResult!6850)

(assert (=> b!642481 (= e!367933 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18413 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642482 () Bool)

(declare-fun c!73461 () Bool)

(assert (=> b!642482 (= c!73461 (= lt!297488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642482 (= e!367934 e!367933)))

(declare-fun b!642483 () Bool)

(assert (=> b!642483 (= e!367933 (MissingVacant!6850 vacantSpotIndex!68))))

(assert (= (and d!90567 c!73459) b!642479))

(assert (= (and d!90567 (not c!73459)) b!642480))

(assert (= (and b!642480 c!73460) b!642478))

(assert (= (and b!642480 (not c!73460)) b!642482))

(assert (= (and b!642482 c!73461) b!642483))

(assert (= (and b!642482 (not c!73461)) b!642481))

(declare-fun m!615783 () Bool)

(assert (=> d!90567 m!615783))

(declare-fun m!615785 () Bool)

(assert (=> d!90567 m!615785))

(assert (=> d!90567 m!615631))

(assert (=> d!90567 m!615657))

(assert (=> b!642481 m!615635))

(assert (=> b!642481 m!615635))

(assert (=> b!642481 m!615603))

(declare-fun m!615787 () Bool)

(assert (=> b!642481 m!615787))

(assert (=> b!642331 d!90567))

(declare-fun d!90569 () Bool)

(declare-fun res!416298 () Bool)

(declare-fun e!367939 () Bool)

(assert (=> d!90569 (=> res!416298 e!367939)))

(assert (=> d!90569 (= res!416298 (= (select (arr!18413 lt!297391) j!136) (select (arr!18413 a!2986) j!136)))))

(assert (=> d!90569 (= (arrayContainsKey!0 lt!297391 (select (arr!18413 a!2986) j!136) j!136) e!367939)))

(declare-fun b!642488 () Bool)

(declare-fun e!367940 () Bool)

(assert (=> b!642488 (= e!367939 e!367940)))

(declare-fun res!416299 () Bool)

(assert (=> b!642488 (=> (not res!416299) (not e!367940))))

(assert (=> b!642488 (= res!416299 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18778 lt!297391)))))

(declare-fun b!642489 () Bool)

(assert (=> b!642489 (= e!367940 (arrayContainsKey!0 lt!297391 (select (arr!18413 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90569 (not res!416298)) b!642488))

(assert (= (and b!642488 res!416299) b!642489))

(declare-fun m!615789 () Bool)

(assert (=> d!90569 m!615789))

(assert (=> b!642489 m!615603))

(declare-fun m!615791 () Bool)

(assert (=> b!642489 m!615791))

(assert (=> b!642319 d!90569))

(declare-fun d!90571 () Bool)

(assert (=> d!90571 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58124 d!90571))

(declare-fun d!90573 () Bool)

(assert (=> d!90573 (= (array_inv!14296 a!2986) (bvsge (size!18778 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58124 d!90573))

(declare-fun b!642500 () Bool)

(declare-fun e!367950 () Bool)

(declare-fun call!33535 () Bool)

(assert (=> b!642500 (= e!367950 call!33535)))

(declare-fun d!90575 () Bool)

(declare-fun res!416306 () Bool)

(declare-fun e!367952 () Bool)

(assert (=> d!90575 (=> res!416306 e!367952)))

(assert (=> d!90575 (= res!416306 (bvsge #b00000000000000000000000000000000 (size!18778 a!2986)))))

(assert (=> d!90575 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12490) e!367952)))

(declare-fun b!642501 () Bool)

(declare-fun e!367951 () Bool)

(assert (=> b!642501 (= e!367951 e!367950)))

(declare-fun c!73464 () Bool)

(assert (=> b!642501 (= c!73464 (validKeyInArray!0 (select (arr!18413 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!642502 () Bool)

(declare-fun e!367949 () Bool)

(declare-fun contains!3123 (List!12493 (_ BitVec 64)) Bool)

(assert (=> b!642502 (= e!367949 (contains!3123 Nil!12490 (select (arr!18413 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33532 () Bool)

(assert (=> bm!33532 (= call!33535 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73464 (Cons!12489 (select (arr!18413 a!2986) #b00000000000000000000000000000000) Nil!12490) Nil!12490)))))

(declare-fun b!642503 () Bool)

(assert (=> b!642503 (= e!367950 call!33535)))

(declare-fun b!642504 () Bool)

(assert (=> b!642504 (= e!367952 e!367951)))

(declare-fun res!416307 () Bool)

(assert (=> b!642504 (=> (not res!416307) (not e!367951))))

(assert (=> b!642504 (= res!416307 (not e!367949))))

(declare-fun res!416308 () Bool)

(assert (=> b!642504 (=> (not res!416308) (not e!367949))))

(assert (=> b!642504 (= res!416308 (validKeyInArray!0 (select (arr!18413 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90575 (not res!416306)) b!642504))

(assert (= (and b!642504 res!416308) b!642502))

(assert (= (and b!642504 res!416307) b!642501))

(assert (= (and b!642501 c!73464) b!642503))

(assert (= (and b!642501 (not c!73464)) b!642500))

(assert (= (or b!642503 b!642500) bm!33532))

(declare-fun m!615793 () Bool)

(assert (=> b!642501 m!615793))

(assert (=> b!642501 m!615793))

(declare-fun m!615795 () Bool)

(assert (=> b!642501 m!615795))

(assert (=> b!642502 m!615793))

(assert (=> b!642502 m!615793))

(declare-fun m!615797 () Bool)

(assert (=> b!642502 m!615797))

(assert (=> bm!33532 m!615793))

(declare-fun m!615799 () Bool)

(assert (=> bm!33532 m!615799))

(assert (=> b!642504 m!615793))

(assert (=> b!642504 m!615793))

(assert (=> b!642504 m!615795))

(assert (=> b!642318 d!90575))

(declare-fun d!90577 () Bool)

(assert (=> d!90577 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!642327 d!90577))

(declare-fun b!642505 () Bool)

(declare-fun e!367955 () SeekEntryResult!6850)

(assert (=> b!642505 (= e!367955 (Found!6850 index!984))))

(declare-fun b!642506 () Bool)

(declare-fun e!367953 () SeekEntryResult!6850)

(assert (=> b!642506 (= e!367953 Undefined!6850)))

(declare-fun b!642507 () Bool)

(assert (=> b!642507 (= e!367953 e!367955)))

(declare-fun c!73466 () Bool)

(declare-fun lt!297490 () (_ BitVec 64))

(assert (=> b!642507 (= c!73466 (= lt!297490 lt!297379))))

(declare-fun d!90579 () Bool)

(declare-fun lt!297491 () SeekEntryResult!6850)

(assert (=> d!90579 (and (or ((_ is Undefined!6850) lt!297491) (not ((_ is Found!6850) lt!297491)) (and (bvsge (index!29727 lt!297491) #b00000000000000000000000000000000) (bvslt (index!29727 lt!297491) (size!18778 lt!297391)))) (or ((_ is Undefined!6850) lt!297491) ((_ is Found!6850) lt!297491) (not ((_ is MissingVacant!6850) lt!297491)) (not (= (index!29729 lt!297491) vacantSpotIndex!68)) (and (bvsge (index!29729 lt!297491) #b00000000000000000000000000000000) (bvslt (index!29729 lt!297491) (size!18778 lt!297391)))) (or ((_ is Undefined!6850) lt!297491) (ite ((_ is Found!6850) lt!297491) (= (select (arr!18413 lt!297391) (index!29727 lt!297491)) lt!297379) (and ((_ is MissingVacant!6850) lt!297491) (= (index!29729 lt!297491) vacantSpotIndex!68) (= (select (arr!18413 lt!297391) (index!29729 lt!297491)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90579 (= lt!297491 e!367953)))

(declare-fun c!73465 () Bool)

(assert (=> d!90579 (= c!73465 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90579 (= lt!297490 (select (arr!18413 lt!297391) index!984))))

(assert (=> d!90579 (validMask!0 mask!3053)))

(assert (=> d!90579 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297379 lt!297391 mask!3053) lt!297491)))

(declare-fun b!642508 () Bool)

(declare-fun e!367954 () SeekEntryResult!6850)

(assert (=> b!642508 (= e!367954 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!297379 lt!297391 mask!3053))))

(declare-fun b!642509 () Bool)

(declare-fun c!73467 () Bool)

(assert (=> b!642509 (= c!73467 (= lt!297490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642509 (= e!367955 e!367954)))

(declare-fun b!642510 () Bool)

(assert (=> b!642510 (= e!367954 (MissingVacant!6850 vacantSpotIndex!68))))

(assert (= (and d!90579 c!73465) b!642506))

(assert (= (and d!90579 (not c!73465)) b!642507))

(assert (= (and b!642507 c!73466) b!642505))

(assert (= (and b!642507 (not c!73466)) b!642509))

(assert (= (and b!642509 c!73467) b!642510))

(assert (= (and b!642509 (not c!73467)) b!642508))

(declare-fun m!615801 () Bool)

(assert (=> d!90579 m!615801))

(declare-fun m!615803 () Bool)

(assert (=> d!90579 m!615803))

(declare-fun m!615805 () Bool)

(assert (=> d!90579 m!615805))

(assert (=> d!90579 m!615657))

(assert (=> b!642508 m!615635))

(assert (=> b!642508 m!615635))

(declare-fun m!615807 () Bool)

(assert (=> b!642508 m!615807))

(assert (=> b!642326 d!90579))

(declare-fun b!642511 () Bool)

(declare-fun e!367958 () SeekEntryResult!6850)

(assert (=> b!642511 (= e!367958 (Found!6850 lt!297380))))

(declare-fun b!642512 () Bool)

(declare-fun e!367956 () SeekEntryResult!6850)

(assert (=> b!642512 (= e!367956 Undefined!6850)))

(declare-fun b!642513 () Bool)

(assert (=> b!642513 (= e!367956 e!367958)))

(declare-fun c!73469 () Bool)

(declare-fun lt!297492 () (_ BitVec 64))

(assert (=> b!642513 (= c!73469 (= lt!297492 lt!297379))))

(declare-fun d!90581 () Bool)

(declare-fun lt!297493 () SeekEntryResult!6850)

(assert (=> d!90581 (and (or ((_ is Undefined!6850) lt!297493) (not ((_ is Found!6850) lt!297493)) (and (bvsge (index!29727 lt!297493) #b00000000000000000000000000000000) (bvslt (index!29727 lt!297493) (size!18778 lt!297391)))) (or ((_ is Undefined!6850) lt!297493) ((_ is Found!6850) lt!297493) (not ((_ is MissingVacant!6850) lt!297493)) (not (= (index!29729 lt!297493) vacantSpotIndex!68)) (and (bvsge (index!29729 lt!297493) #b00000000000000000000000000000000) (bvslt (index!29729 lt!297493) (size!18778 lt!297391)))) (or ((_ is Undefined!6850) lt!297493) (ite ((_ is Found!6850) lt!297493) (= (select (arr!18413 lt!297391) (index!29727 lt!297493)) lt!297379) (and ((_ is MissingVacant!6850) lt!297493) (= (index!29729 lt!297493) vacantSpotIndex!68) (= (select (arr!18413 lt!297391) (index!29729 lt!297493)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90581 (= lt!297493 e!367956)))

(declare-fun c!73468 () Bool)

(assert (=> d!90581 (= c!73468 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90581 (= lt!297492 (select (arr!18413 lt!297391) lt!297380))))

(assert (=> d!90581 (validMask!0 mask!3053)))

(assert (=> d!90581 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297380 vacantSpotIndex!68 lt!297379 lt!297391 mask!3053) lt!297493)))

(declare-fun b!642514 () Bool)

(declare-fun e!367957 () SeekEntryResult!6850)

(assert (=> b!642514 (= e!367957 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297380 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!297379 lt!297391 mask!3053))))

(declare-fun b!642515 () Bool)

(declare-fun c!73470 () Bool)

(assert (=> b!642515 (= c!73470 (= lt!297492 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642515 (= e!367958 e!367957)))

(declare-fun b!642516 () Bool)

(assert (=> b!642516 (= e!367957 (MissingVacant!6850 vacantSpotIndex!68))))

(assert (= (and d!90581 c!73468) b!642512))

(assert (= (and d!90581 (not c!73468)) b!642513))

(assert (= (and b!642513 c!73469) b!642511))

(assert (= (and b!642513 (not c!73469)) b!642515))

(assert (= (and b!642515 c!73470) b!642516))

(assert (= (and b!642515 (not c!73470)) b!642514))

(declare-fun m!615809 () Bool)

(assert (=> d!90581 m!615809))

(declare-fun m!615811 () Bool)

(assert (=> d!90581 m!615811))

(declare-fun m!615813 () Bool)

(assert (=> d!90581 m!615813))

(assert (=> d!90581 m!615657))

(declare-fun m!615815 () Bool)

(assert (=> b!642514 m!615815))

(assert (=> b!642514 m!615815))

(declare-fun m!615817 () Bool)

(assert (=> b!642514 m!615817))

(assert (=> b!642326 d!90581))

(declare-fun d!90583 () Bool)

(declare-fun e!367969 () Bool)

(assert (=> d!90583 e!367969))

(declare-fun res!416319 () Bool)

(assert (=> d!90583 (=> (not res!416319) (not e!367969))))

(assert (=> d!90583 (= res!416319 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18778 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18778 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18778 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18778 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18778 a!2986))))))

(declare-fun lt!297496 () Unit!21728)

(declare-fun choose!9 (array!38394 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21728)

(assert (=> d!90583 (= lt!297496 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297380 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90583 (validMask!0 mask!3053)))

(assert (=> d!90583 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297380 vacantSpotIndex!68 mask!3053) lt!297496)))

(declare-fun b!642527 () Bool)

(assert (=> b!642527 (= e!367969 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297380 vacantSpotIndex!68 (select (arr!18413 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297380 vacantSpotIndex!68 (select (store (arr!18413 a!2986) i!1108 k0!1786) j!136) (array!38395 (store (arr!18413 a!2986) i!1108 k0!1786) (size!18778 a!2986)) mask!3053)))))

(assert (= (and d!90583 res!416319) b!642527))

(declare-fun m!615827 () Bool)

(assert (=> d!90583 m!615827))

(assert (=> d!90583 m!615657))

(assert (=> b!642527 m!615603))

(assert (=> b!642527 m!615637))

(assert (=> b!642527 m!615641))

(assert (=> b!642527 m!615637))

(declare-fun m!615829 () Bool)

(assert (=> b!642527 m!615829))

(assert (=> b!642527 m!615603))

(assert (=> b!642527 m!615639))

(assert (=> b!642326 d!90583))

(declare-fun b!642528 () Bool)

(declare-fun e!367972 () SeekEntryResult!6850)

(assert (=> b!642528 (= e!367972 (Found!6850 lt!297380))))

(declare-fun b!642529 () Bool)

(declare-fun e!367970 () SeekEntryResult!6850)

(assert (=> b!642529 (= e!367970 Undefined!6850)))

(declare-fun b!642530 () Bool)

(assert (=> b!642530 (= e!367970 e!367972)))

(declare-fun c!73472 () Bool)

(declare-fun lt!297497 () (_ BitVec 64))

(assert (=> b!642530 (= c!73472 (= lt!297497 (select (arr!18413 a!2986) j!136)))))

(declare-fun d!90591 () Bool)

(declare-fun lt!297498 () SeekEntryResult!6850)

(assert (=> d!90591 (and (or ((_ is Undefined!6850) lt!297498) (not ((_ is Found!6850) lt!297498)) (and (bvsge (index!29727 lt!297498) #b00000000000000000000000000000000) (bvslt (index!29727 lt!297498) (size!18778 a!2986)))) (or ((_ is Undefined!6850) lt!297498) ((_ is Found!6850) lt!297498) (not ((_ is MissingVacant!6850) lt!297498)) (not (= (index!29729 lt!297498) vacantSpotIndex!68)) (and (bvsge (index!29729 lt!297498) #b00000000000000000000000000000000) (bvslt (index!29729 lt!297498) (size!18778 a!2986)))) (or ((_ is Undefined!6850) lt!297498) (ite ((_ is Found!6850) lt!297498) (= (select (arr!18413 a!2986) (index!29727 lt!297498)) (select (arr!18413 a!2986) j!136)) (and ((_ is MissingVacant!6850) lt!297498) (= (index!29729 lt!297498) vacantSpotIndex!68) (= (select (arr!18413 a!2986) (index!29729 lt!297498)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90591 (= lt!297498 e!367970)))

(declare-fun c!73471 () Bool)

(assert (=> d!90591 (= c!73471 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90591 (= lt!297497 (select (arr!18413 a!2986) lt!297380))))

(assert (=> d!90591 (validMask!0 mask!3053)))

(assert (=> d!90591 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297380 vacantSpotIndex!68 (select (arr!18413 a!2986) j!136) a!2986 mask!3053) lt!297498)))

(declare-fun b!642531 () Bool)

(declare-fun e!367971 () SeekEntryResult!6850)

(assert (=> b!642531 (= e!367971 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297380 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18413 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642532 () Bool)

(declare-fun c!73473 () Bool)

(assert (=> b!642532 (= c!73473 (= lt!297497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642532 (= e!367972 e!367971)))

(declare-fun b!642533 () Bool)

(assert (=> b!642533 (= e!367971 (MissingVacant!6850 vacantSpotIndex!68))))

(assert (= (and d!90591 c!73471) b!642529))

(assert (= (and d!90591 (not c!73471)) b!642530))

(assert (= (and b!642530 c!73472) b!642528))

(assert (= (and b!642530 (not c!73472)) b!642532))

(assert (= (and b!642532 c!73473) b!642533))

(assert (= (and b!642532 (not c!73473)) b!642531))

(declare-fun m!615831 () Bool)

(assert (=> d!90591 m!615831))

(declare-fun m!615833 () Bool)

(assert (=> d!90591 m!615833))

(declare-fun m!615835 () Bool)

(assert (=> d!90591 m!615835))

(assert (=> d!90591 m!615657))

(assert (=> b!642531 m!615815))

(assert (=> b!642531 m!615815))

(assert (=> b!642531 m!615603))

(declare-fun m!615837 () Bool)

(assert (=> b!642531 m!615837))

(assert (=> b!642326 d!90591))

(declare-fun d!90593 () Bool)

(declare-fun lt!297501 () (_ BitVec 32))

(assert (=> d!90593 (and (bvsge lt!297501 #b00000000000000000000000000000000) (bvslt lt!297501 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90593 (= lt!297501 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90593 (validMask!0 mask!3053)))

(assert (=> d!90593 (= (nextIndex!0 index!984 x!910 mask!3053) lt!297501)))

(declare-fun bs!19197 () Bool)

(assert (= bs!19197 d!90593))

(declare-fun m!615839 () Bool)

(assert (=> bs!19197 m!615839))

(assert (=> bs!19197 m!615657))

(assert (=> b!642326 d!90593))

(declare-fun bm!33535 () Bool)

(declare-fun call!33538 () Bool)

(assert (=> bm!33535 (= call!33538 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!642554 () Bool)

(declare-fun e!367987 () Bool)

(declare-fun e!367985 () Bool)

(assert (=> b!642554 (= e!367987 e!367985)))

(declare-fun lt!297512 () (_ BitVec 64))

(assert (=> b!642554 (= lt!297512 (select (arr!18413 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!297513 () Unit!21728)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38394 (_ BitVec 64) (_ BitVec 32)) Unit!21728)

(assert (=> b!642554 (= lt!297513 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!297512 #b00000000000000000000000000000000))))

(assert (=> b!642554 (arrayContainsKey!0 a!2986 lt!297512 #b00000000000000000000000000000000)))

(declare-fun lt!297514 () Unit!21728)

(assert (=> b!642554 (= lt!297514 lt!297513)))

(declare-fun res!416324 () Bool)

(assert (=> b!642554 (= res!416324 (= (seekEntryOrOpen!0 (select (arr!18413 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6850 #b00000000000000000000000000000000)))))

(assert (=> b!642554 (=> (not res!416324) (not e!367985))))

(declare-fun b!642555 () Bool)

(declare-fun e!367986 () Bool)

(assert (=> b!642555 (= e!367986 e!367987)))

(declare-fun c!73482 () Bool)

(assert (=> b!642555 (= c!73482 (validKeyInArray!0 (select (arr!18413 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90595 () Bool)

(declare-fun res!416325 () Bool)

(assert (=> d!90595 (=> res!416325 e!367986)))

(assert (=> d!90595 (= res!416325 (bvsge #b00000000000000000000000000000000 (size!18778 a!2986)))))

(assert (=> d!90595 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!367986)))

(declare-fun b!642556 () Bool)

(assert (=> b!642556 (= e!367987 call!33538)))

(declare-fun b!642557 () Bool)

(assert (=> b!642557 (= e!367985 call!33538)))

(assert (= (and d!90595 (not res!416325)) b!642555))

(assert (= (and b!642555 c!73482) b!642554))

(assert (= (and b!642555 (not c!73482)) b!642556))

(assert (= (and b!642554 res!416324) b!642557))

(assert (= (or b!642557 b!642556) bm!33535))

(declare-fun m!615841 () Bool)

(assert (=> bm!33535 m!615841))

(assert (=> b!642554 m!615793))

(declare-fun m!615843 () Bool)

(assert (=> b!642554 m!615843))

(declare-fun m!615845 () Bool)

(assert (=> b!642554 m!615845))

(assert (=> b!642554 m!615793))

(declare-fun m!615847 () Bool)

(assert (=> b!642554 m!615847))

(assert (=> b!642555 m!615793))

(assert (=> b!642555 m!615793))

(assert (=> b!642555 m!615795))

(assert (=> b!642315 d!90595))

(declare-fun d!90597 () Bool)

(assert (=> d!90597 (= (validKeyInArray!0 (select (arr!18413 a!2986) j!136)) (and (not (= (select (arr!18413 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18413 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!642325 d!90597))

(declare-fun b!642599 () Bool)

(declare-fun e!368011 () SeekEntryResult!6850)

(declare-fun e!368010 () SeekEntryResult!6850)

(assert (=> b!642599 (= e!368011 e!368010)))

(declare-fun lt!297539 () (_ BitVec 64))

(declare-fun lt!297537 () SeekEntryResult!6850)

(assert (=> b!642599 (= lt!297539 (select (arr!18413 a!2986) (index!29728 lt!297537)))))

(declare-fun c!73502 () Bool)

(assert (=> b!642599 (= c!73502 (= lt!297539 k0!1786))))

(declare-fun d!90599 () Bool)

(declare-fun lt!297538 () SeekEntryResult!6850)

(assert (=> d!90599 (and (or ((_ is Undefined!6850) lt!297538) (not ((_ is Found!6850) lt!297538)) (and (bvsge (index!29727 lt!297538) #b00000000000000000000000000000000) (bvslt (index!29727 lt!297538) (size!18778 a!2986)))) (or ((_ is Undefined!6850) lt!297538) ((_ is Found!6850) lt!297538) (not ((_ is MissingZero!6850) lt!297538)) (and (bvsge (index!29726 lt!297538) #b00000000000000000000000000000000) (bvslt (index!29726 lt!297538) (size!18778 a!2986)))) (or ((_ is Undefined!6850) lt!297538) ((_ is Found!6850) lt!297538) ((_ is MissingZero!6850) lt!297538) (not ((_ is MissingVacant!6850) lt!297538)) (and (bvsge (index!29729 lt!297538) #b00000000000000000000000000000000) (bvslt (index!29729 lt!297538) (size!18778 a!2986)))) (or ((_ is Undefined!6850) lt!297538) (ite ((_ is Found!6850) lt!297538) (= (select (arr!18413 a!2986) (index!29727 lt!297538)) k0!1786) (ite ((_ is MissingZero!6850) lt!297538) (= (select (arr!18413 a!2986) (index!29726 lt!297538)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6850) lt!297538) (= (select (arr!18413 a!2986) (index!29729 lt!297538)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90599 (= lt!297538 e!368011)))

(declare-fun c!73504 () Bool)

(assert (=> d!90599 (= c!73504 (and ((_ is Intermediate!6850) lt!297537) (undefined!7662 lt!297537)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38394 (_ BitVec 32)) SeekEntryResult!6850)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90599 (= lt!297537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90599 (validMask!0 mask!3053)))

(assert (=> d!90599 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!297538)))

(declare-fun b!642600 () Bool)

(declare-fun e!368012 () SeekEntryResult!6850)

(assert (=> b!642600 (= e!368012 (MissingZero!6850 (index!29728 lt!297537)))))

(declare-fun b!642601 () Bool)

(assert (=> b!642601 (= e!368012 (seekKeyOrZeroReturnVacant!0 (x!58499 lt!297537) (index!29728 lt!297537) (index!29728 lt!297537) k0!1786 a!2986 mask!3053))))

(declare-fun b!642602 () Bool)

(declare-fun c!73503 () Bool)

(assert (=> b!642602 (= c!73503 (= lt!297539 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642602 (= e!368010 e!368012)))

(declare-fun b!642603 () Bool)

(assert (=> b!642603 (= e!368010 (Found!6850 (index!29728 lt!297537)))))

(declare-fun b!642604 () Bool)

(assert (=> b!642604 (= e!368011 Undefined!6850)))

(assert (= (and d!90599 c!73504) b!642604))

(assert (= (and d!90599 (not c!73504)) b!642599))

(assert (= (and b!642599 c!73502) b!642603))

(assert (= (and b!642599 (not c!73502)) b!642602))

(assert (= (and b!642602 c!73503) b!642600))

(assert (= (and b!642602 (not c!73503)) b!642601))

(declare-fun m!615881 () Bool)

(assert (=> b!642599 m!615881))

(declare-fun m!615883 () Bool)

(assert (=> d!90599 m!615883))

(declare-fun m!615885 () Bool)

(assert (=> d!90599 m!615885))

(assert (=> d!90599 m!615885))

(declare-fun m!615887 () Bool)

(assert (=> d!90599 m!615887))

(assert (=> d!90599 m!615657))

(declare-fun m!615889 () Bool)

(assert (=> d!90599 m!615889))

(declare-fun m!615891 () Bool)

(assert (=> d!90599 m!615891))

(declare-fun m!615893 () Bool)

(assert (=> b!642601 m!615893))

(assert (=> b!642324 d!90599))

(assert (=> b!642312 d!90569))

(declare-fun d!90613 () Bool)

(declare-fun res!416329 () Bool)

(declare-fun e!368015 () Bool)

(assert (=> d!90613 (=> res!416329 e!368015)))

(assert (=> d!90613 (= res!416329 (= (select (arr!18413 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90613 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!368015)))

(declare-fun b!642609 () Bool)

(declare-fun e!368016 () Bool)

(assert (=> b!642609 (= e!368015 e!368016)))

(declare-fun res!416330 () Bool)

(assert (=> b!642609 (=> (not res!416330) (not e!368016))))

(assert (=> b!642609 (= res!416330 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18778 a!2986)))))

(declare-fun b!642610 () Bool)

(assert (=> b!642610 (= e!368016 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90613 (not res!416329)) b!642609))

(assert (= (and b!642609 res!416330) b!642610))

(assert (=> d!90613 m!615793))

(declare-fun m!615895 () Bool)

(assert (=> b!642610 m!615895))

(assert (=> b!642333 d!90613))

(declare-fun d!90615 () Bool)

(declare-fun res!416331 () Bool)

(declare-fun e!368017 () Bool)

(assert (=> d!90615 (=> res!416331 e!368017)))

(assert (=> d!90615 (= res!416331 (= (select (arr!18413 lt!297391) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18413 a!2986) j!136)))))

(assert (=> d!90615 (= (arrayContainsKey!0 lt!297391 (select (arr!18413 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!368017)))

(declare-fun b!642611 () Bool)

(declare-fun e!368018 () Bool)

(assert (=> b!642611 (= e!368017 e!368018)))

(declare-fun res!416332 () Bool)

(assert (=> b!642611 (=> (not res!416332) (not e!368018))))

(assert (=> b!642611 (= res!416332 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18778 lt!297391)))))

(declare-fun b!642612 () Bool)

(assert (=> b!642612 (= e!368018 (arrayContainsKey!0 lt!297391 (select (arr!18413 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90615 (not res!416331)) b!642611))

(assert (= (and b!642611 res!416332) b!642612))

(declare-fun m!615897 () Bool)

(assert (=> d!90615 m!615897))

(assert (=> b!642612 m!615603))

(declare-fun m!615899 () Bool)

(assert (=> b!642612 m!615899))

(assert (=> b!642322 d!90615))

(declare-fun d!90617 () Bool)

(assert (=> d!90617 (arrayNoDuplicates!0 lt!297391 j!136 Nil!12490)))

(declare-fun lt!297542 () Unit!21728)

(declare-fun choose!39 (array!38394 (_ BitVec 32) (_ BitVec 32)) Unit!21728)

(assert (=> d!90617 (= lt!297542 (choose!39 lt!297391 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90617 (bvslt (size!18778 lt!297391) #b01111111111111111111111111111111)))

(assert (=> d!90617 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!297391 #b00000000000000000000000000000000 j!136) lt!297542)))

(declare-fun bs!19199 () Bool)

(assert (= bs!19199 d!90617))

(assert (=> bs!19199 m!615619))

(declare-fun m!615901 () Bool)

(assert (=> bs!19199 m!615901))

(assert (=> b!642322 d!90617))

(declare-fun b!642619 () Bool)

(declare-fun e!368023 () Bool)

(declare-fun call!33539 () Bool)

(assert (=> b!642619 (= e!368023 call!33539)))

(declare-fun d!90619 () Bool)

(declare-fun res!416333 () Bool)

(declare-fun e!368025 () Bool)

(assert (=> d!90619 (=> res!416333 e!368025)))

(assert (=> d!90619 (= res!416333 (bvsge #b00000000000000000000000000000000 (size!18778 lt!297391)))))

(assert (=> d!90619 (= (arrayNoDuplicates!0 lt!297391 #b00000000000000000000000000000000 Nil!12490) e!368025)))

(declare-fun b!642620 () Bool)

(declare-fun e!368024 () Bool)

(assert (=> b!642620 (= e!368024 e!368023)))

(declare-fun c!73510 () Bool)

(assert (=> b!642620 (= c!73510 (validKeyInArray!0 (select (arr!18413 lt!297391) #b00000000000000000000000000000000)))))

(declare-fun b!642621 () Bool)

(declare-fun e!368022 () Bool)

(assert (=> b!642621 (= e!368022 (contains!3123 Nil!12490 (select (arr!18413 lt!297391) #b00000000000000000000000000000000)))))

(declare-fun bm!33536 () Bool)

(assert (=> bm!33536 (= call!33539 (arrayNoDuplicates!0 lt!297391 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73510 (Cons!12489 (select (arr!18413 lt!297391) #b00000000000000000000000000000000) Nil!12490) Nil!12490)))))

(declare-fun b!642622 () Bool)

(assert (=> b!642622 (= e!368023 call!33539)))

(declare-fun b!642623 () Bool)

(assert (=> b!642623 (= e!368025 e!368024)))

(declare-fun res!416334 () Bool)

(assert (=> b!642623 (=> (not res!416334) (not e!368024))))

(assert (=> b!642623 (= res!416334 (not e!368022))))

(declare-fun res!416335 () Bool)

(assert (=> b!642623 (=> (not res!416335) (not e!368022))))

(assert (=> b!642623 (= res!416335 (validKeyInArray!0 (select (arr!18413 lt!297391) #b00000000000000000000000000000000)))))

(assert (= (and d!90619 (not res!416333)) b!642623))

(assert (= (and b!642623 res!416335) b!642621))

(assert (= (and b!642623 res!416334) b!642620))

(assert (= (and b!642620 c!73510) b!642622))

(assert (= (and b!642620 (not c!73510)) b!642619))

(assert (= (or b!642622 b!642619) bm!33536))

(declare-fun m!615903 () Bool)

(assert (=> b!642620 m!615903))

(assert (=> b!642620 m!615903))

(declare-fun m!615905 () Bool)

(assert (=> b!642620 m!615905))

(assert (=> b!642621 m!615903))

(assert (=> b!642621 m!615903))

(declare-fun m!615909 () Bool)

(assert (=> b!642621 m!615909))

(assert (=> bm!33536 m!615903))

(declare-fun m!615913 () Bool)

(assert (=> bm!33536 m!615913))

(assert (=> b!642623 m!615903))

(assert (=> b!642623 m!615903))

(assert (=> b!642623 m!615905))

(assert (=> b!642322 d!90619))

(declare-fun d!90621 () Bool)

(declare-fun e!368043 () Bool)

(assert (=> d!90621 e!368043))

(declare-fun res!416350 () Bool)

(assert (=> d!90621 (=> (not res!416350) (not e!368043))))

(assert (=> d!90621 (= res!416350 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18778 a!2986))))))

(declare-fun lt!297556 () Unit!21728)

(declare-fun choose!41 (array!38394 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12493) Unit!21728)

(assert (=> d!90621 (= lt!297556 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12490))))

(assert (=> d!90621 (bvslt (size!18778 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90621 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12490) lt!297556)))

(declare-fun b!642644 () Bool)

(assert (=> b!642644 (= e!368043 (arrayNoDuplicates!0 (array!38395 (store (arr!18413 a!2986) i!1108 k0!1786) (size!18778 a!2986)) #b00000000000000000000000000000000 Nil!12490))))

(assert (= (and d!90621 res!416350) b!642644))

(declare-fun m!615931 () Bool)

(assert (=> d!90621 m!615931))

(assert (=> b!642644 m!615641))

(declare-fun m!615933 () Bool)

(assert (=> b!642644 m!615933))

(assert (=> b!642322 d!90621))

(declare-fun b!642645 () Bool)

(declare-fun e!368045 () Bool)

(declare-fun call!33543 () Bool)

(assert (=> b!642645 (= e!368045 call!33543)))

(declare-fun d!90633 () Bool)

(declare-fun res!416351 () Bool)

(declare-fun e!368047 () Bool)

(assert (=> d!90633 (=> res!416351 e!368047)))

(assert (=> d!90633 (= res!416351 (bvsge j!136 (size!18778 lt!297391)))))

(assert (=> d!90633 (= (arrayNoDuplicates!0 lt!297391 j!136 Nil!12490) e!368047)))

(declare-fun b!642646 () Bool)

(declare-fun e!368046 () Bool)

(assert (=> b!642646 (= e!368046 e!368045)))

(declare-fun c!73514 () Bool)

(assert (=> b!642646 (= c!73514 (validKeyInArray!0 (select (arr!18413 lt!297391) j!136)))))

(declare-fun b!642647 () Bool)

(declare-fun e!368044 () Bool)

(assert (=> b!642647 (= e!368044 (contains!3123 Nil!12490 (select (arr!18413 lt!297391) j!136)))))

(declare-fun bm!33540 () Bool)

(assert (=> bm!33540 (= call!33543 (arrayNoDuplicates!0 lt!297391 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73514 (Cons!12489 (select (arr!18413 lt!297391) j!136) Nil!12490) Nil!12490)))))

(declare-fun b!642648 () Bool)

(assert (=> b!642648 (= e!368045 call!33543)))

(declare-fun b!642649 () Bool)

(assert (=> b!642649 (= e!368047 e!368046)))

(declare-fun res!416352 () Bool)

(assert (=> b!642649 (=> (not res!416352) (not e!368046))))

(assert (=> b!642649 (= res!416352 (not e!368044))))

(declare-fun res!416353 () Bool)

(assert (=> b!642649 (=> (not res!416353) (not e!368044))))

(assert (=> b!642649 (= res!416353 (validKeyInArray!0 (select (arr!18413 lt!297391) j!136)))))

(assert (= (and d!90633 (not res!416351)) b!642649))

(assert (= (and b!642649 res!416353) b!642647))

(assert (= (and b!642649 res!416352) b!642646))

(assert (= (and b!642646 c!73514) b!642648))

(assert (= (and b!642646 (not c!73514)) b!642645))

(assert (= (or b!642648 b!642645) bm!33540))

(assert (=> b!642646 m!615789))

(assert (=> b!642646 m!615789))

(declare-fun m!615935 () Bool)

(assert (=> b!642646 m!615935))

(assert (=> b!642647 m!615789))

(assert (=> b!642647 m!615789))

(declare-fun m!615937 () Bool)

(assert (=> b!642647 m!615937))

(assert (=> bm!33540 m!615789))

(declare-fun m!615939 () Bool)

(assert (=> bm!33540 m!615939))

(assert (=> b!642649 m!615789))

(assert (=> b!642649 m!615789))

(assert (=> b!642649 m!615935))

(assert (=> b!642322 d!90633))

(declare-fun d!90635 () Bool)

(assert (=> d!90635 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18778 lt!297391)) (not (= (select (arr!18413 lt!297391) j!136) (select (arr!18413 a!2986) j!136))))))

(declare-fun lt!297559 () Unit!21728)

(declare-fun choose!21 (array!38394 (_ BitVec 64) (_ BitVec 32) List!12493) Unit!21728)

(assert (=> d!90635 (= lt!297559 (choose!21 lt!297391 (select (arr!18413 a!2986) j!136) j!136 Nil!12490))))

(assert (=> d!90635 (bvslt (size!18778 lt!297391) #b01111111111111111111111111111111)))

(assert (=> d!90635 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297391 (select (arr!18413 a!2986) j!136) j!136 Nil!12490) lt!297559)))

(declare-fun bs!19200 () Bool)

(assert (= bs!19200 d!90635))

(assert (=> bs!19200 m!615789))

(assert (=> bs!19200 m!615603))

(declare-fun m!615941 () Bool)

(assert (=> bs!19200 m!615941))

(assert (=> b!642322 d!90635))

(declare-fun d!90637 () Bool)

(assert (=> d!90637 (arrayContainsKey!0 lt!297391 (select (arr!18413 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297562 () Unit!21728)

(declare-fun choose!114 (array!38394 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21728)

(assert (=> d!90637 (= lt!297562 (choose!114 lt!297391 (select (arr!18413 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90637 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90637 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297391 (select (arr!18413 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!297562)))

(declare-fun bs!19201 () Bool)

(assert (= bs!19201 d!90637))

(assert (=> bs!19201 m!615603))

(assert (=> bs!19201 m!615617))

(assert (=> bs!19201 m!615603))

(declare-fun m!615943 () Bool)

(assert (=> bs!19201 m!615943))

(assert (=> b!642322 d!90637))

(declare-fun d!90639 () Bool)

(declare-fun res!416360 () Bool)

(declare-fun e!368056 () Bool)

(assert (=> d!90639 (=> res!416360 e!368056)))

(assert (=> d!90639 (= res!416360 (= (select (arr!18413 lt!297391) index!984) (select (arr!18413 a!2986) j!136)))))

(assert (=> d!90639 (= (arrayContainsKey!0 lt!297391 (select (arr!18413 a!2986) j!136) index!984) e!368056)))

(declare-fun b!642660 () Bool)

(declare-fun e!368057 () Bool)

(assert (=> b!642660 (= e!368056 e!368057)))

(declare-fun res!416361 () Bool)

(assert (=> b!642660 (=> (not res!416361) (not e!368057))))

(assert (=> b!642660 (= res!416361 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18778 lt!297391)))))

(declare-fun b!642661 () Bool)

(assert (=> b!642661 (= e!368057 (arrayContainsKey!0 lt!297391 (select (arr!18413 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90639 (not res!416360)) b!642660))

(assert (= (and b!642660 res!416361) b!642661))

(assert (=> d!90639 m!615805))

(assert (=> b!642661 m!615603))

(declare-fun m!615945 () Bool)

(assert (=> b!642661 m!615945))

(assert (=> b!642332 d!90639))

(check-sat (not b!642610) (not b!642508) (not bm!33535) (not bm!33536) (not b!642481) (not b!642489) (not b!642527) (not d!90599) (not b!642554) (not d!90593) (not b!642514) (not d!90637) (not b!642661) (not b!642644) (not bm!33532) (not b!642504) (not d!90581) (not b!642649) (not b!642623) (not b!642621) (not b!642646) (not b!642647) (not bm!33540) (not d!90567) (not d!90621) (not b!642555) (not b!642601) (not d!90617) (not d!90635) (not b!642501) (not d!90579) (not b!642612) (not b!642620) (not d!90583) (not b!642502) (not b!642531) (not d!90591))
(check-sat)
