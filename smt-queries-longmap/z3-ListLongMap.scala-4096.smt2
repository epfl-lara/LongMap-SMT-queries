; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56124 () Bool)

(assert start!56124)

(declare-fun b!618307 () Bool)

(declare-datatypes ((Unit!20287 0))(
  ( (Unit!20288) )
))
(declare-fun e!354577 () Unit!20287)

(declare-fun Unit!20289 () Unit!20287)

(assert (=> b!618307 (= e!354577 Unit!20289)))

(declare-fun b!618308 () Bool)

(declare-fun res!398316 () Bool)

(declare-fun e!354584 () Bool)

(assert (=> b!618308 (=> (not res!398316) (not e!354584))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37539 0))(
  ( (array!37540 (arr!18013 (Array (_ BitVec 32) (_ BitVec 64))) (size!18377 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37539)

(assert (=> b!618308 (= res!398316 (and (= (size!18377 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18377 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18377 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!618309 () Bool)

(assert (=> b!618309 false))

(declare-fun lt!284955 () array!37539)

(declare-fun lt!284940 () Unit!20287)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((List!11961 0))(
  ( (Nil!11958) (Cons!11957 (h!13005 (_ BitVec 64)) (t!18181 List!11961)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37539 (_ BitVec 64) (_ BitVec 32) List!11961) Unit!20287)

(assert (=> b!618309 (= lt!284940 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284955 (select (arr!18013 a!2986) j!136) index!984 Nil!11958))))

(declare-fun arrayNoDuplicates!0 (array!37539 (_ BitVec 32) List!11961) Bool)

(assert (=> b!618309 (arrayNoDuplicates!0 lt!284955 index!984 Nil!11958)))

(declare-fun lt!284946 () Unit!20287)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37539 (_ BitVec 32) (_ BitVec 32)) Unit!20287)

(assert (=> b!618309 (= lt!284946 (lemmaNoDuplicateFromThenFromBigger!0 lt!284955 #b00000000000000000000000000000000 index!984))))

(assert (=> b!618309 (arrayNoDuplicates!0 lt!284955 #b00000000000000000000000000000000 Nil!11958)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!284948 () Unit!20287)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37539 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11961) Unit!20287)

(assert (=> b!618309 (= lt!284948 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11958))))

(declare-fun arrayContainsKey!0 (array!37539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618309 (arrayContainsKey!0 lt!284955 (select (arr!18013 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!284954 () Unit!20287)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37539 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20287)

(assert (=> b!618309 (= lt!284954 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284955 (select (arr!18013 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!354582 () Bool)

(assert (=> b!618309 e!354582))

(declare-fun res!398332 () Bool)

(assert (=> b!618309 (=> (not res!398332) (not e!354582))))

(assert (=> b!618309 (= res!398332 (arrayContainsKey!0 lt!284955 (select (arr!18013 a!2986) j!136) j!136))))

(declare-fun e!354578 () Unit!20287)

(declare-fun Unit!20290 () Unit!20287)

(assert (=> b!618309 (= e!354578 Unit!20290)))

(declare-fun b!618310 () Bool)

(declare-fun e!354586 () Unit!20287)

(declare-fun Unit!20291 () Unit!20287)

(assert (=> b!618310 (= e!354586 Unit!20291)))

(declare-fun b!618311 () Bool)

(declare-fun e!354587 () Unit!20287)

(declare-fun Unit!20292 () Unit!20287)

(assert (=> b!618311 (= e!354587 Unit!20292)))

(declare-fun res!398319 () Bool)

(assert (=> b!618311 (= res!398319 (= (select (store (arr!18013 a!2986) i!1108 k0!1786) index!984) (select (arr!18013 a!2986) j!136)))))

(declare-fun e!354583 () Bool)

(assert (=> b!618311 (=> (not res!398319) (not e!354583))))

(assert (=> b!618311 e!354583))

(declare-fun c!70365 () Bool)

(assert (=> b!618311 (= c!70365 (bvslt j!136 index!984))))

(declare-fun lt!284949 () Unit!20287)

(assert (=> b!618311 (= lt!284949 e!354577)))

(declare-fun c!70366 () Bool)

(assert (=> b!618311 (= c!70366 (bvslt index!984 j!136))))

(declare-fun lt!284957 () Unit!20287)

(assert (=> b!618311 (= lt!284957 e!354578)))

(assert (=> b!618311 false))

(declare-fun b!618312 () Bool)

(declare-fun Unit!20293 () Unit!20287)

(assert (=> b!618312 (= e!354587 Unit!20293)))

(declare-fun b!618313 () Bool)

(declare-fun res!398330 () Bool)

(assert (=> b!618313 (=> (not res!398330) (not e!354584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!618313 (= res!398330 (validKeyInArray!0 k0!1786))))

(declare-fun b!618314 () Bool)

(declare-fun e!354590 () Bool)

(assert (=> b!618314 (= e!354584 e!354590)))

(declare-fun res!398328 () Bool)

(assert (=> b!618314 (=> (not res!398328) (not e!354590))))

(declare-datatypes ((SeekEntryResult!6409 0))(
  ( (MissingZero!6409 (index!27920 (_ BitVec 32))) (Found!6409 (index!27921 (_ BitVec 32))) (Intermediate!6409 (undefined!7221 Bool) (index!27922 (_ BitVec 32)) (x!56860 (_ BitVec 32))) (Undefined!6409) (MissingVacant!6409 (index!27923 (_ BitVec 32))) )
))
(declare-fun lt!284951 () SeekEntryResult!6409)

(assert (=> b!618314 (= res!398328 (or (= lt!284951 (MissingZero!6409 i!1108)) (= lt!284951 (MissingVacant!6409 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37539 (_ BitVec 32)) SeekEntryResult!6409)

(assert (=> b!618314 (= lt!284951 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!618315 () Bool)

(declare-fun e!354585 () Bool)

(declare-fun e!354581 () Bool)

(assert (=> b!618315 (= e!354585 (not e!354581))))

(declare-fun res!398317 () Bool)

(assert (=> b!618315 (=> res!398317 e!354581)))

(declare-fun lt!284947 () SeekEntryResult!6409)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!618315 (= res!398317 (not (= lt!284947 (MissingVacant!6409 vacantSpotIndex!68))))))

(declare-fun lt!284953 () Unit!20287)

(assert (=> b!618315 (= lt!284953 e!354587)))

(declare-fun c!70364 () Bool)

(assert (=> b!618315 (= c!70364 (= lt!284947 (Found!6409 index!984)))))

(declare-fun lt!284941 () Unit!20287)

(assert (=> b!618315 (= lt!284941 e!354586)))

(declare-fun c!70367 () Bool)

(assert (=> b!618315 (= c!70367 (= lt!284947 Undefined!6409))))

(declare-fun lt!284945 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37539 (_ BitVec 32)) SeekEntryResult!6409)

(assert (=> b!618315 (= lt!284947 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!284945 lt!284955 mask!3053))))

(declare-fun e!354580 () Bool)

(assert (=> b!618315 e!354580))

(declare-fun res!398322 () Bool)

(assert (=> b!618315 (=> (not res!398322) (not e!354580))))

(declare-fun lt!284944 () (_ BitVec 32))

(declare-fun lt!284950 () SeekEntryResult!6409)

(assert (=> b!618315 (= res!398322 (= lt!284950 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284944 vacantSpotIndex!68 lt!284945 lt!284955 mask!3053)))))

(assert (=> b!618315 (= lt!284950 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!284944 vacantSpotIndex!68 (select (arr!18013 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!618315 (= lt!284945 (select (store (arr!18013 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!284942 () Unit!20287)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37539 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20287)

(assert (=> b!618315 (= lt!284942 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!284944 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618315 (= lt!284944 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!618316 () Bool)

(declare-fun Unit!20294 () Unit!20287)

(assert (=> b!618316 (= e!354578 Unit!20294)))

(declare-fun res!398321 () Bool)

(assert (=> start!56124 (=> (not res!398321) (not e!354584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56124 (= res!398321 (validMask!0 mask!3053))))

(assert (=> start!56124 e!354584))

(assert (=> start!56124 true))

(declare-fun array_inv!13872 (array!37539) Bool)

(assert (=> start!56124 (array_inv!13872 a!2986)))

(declare-fun b!618317 () Bool)

(declare-fun e!354591 () Bool)

(assert (=> b!618317 (= e!354591 e!354585)))

(declare-fun res!398329 () Bool)

(assert (=> b!618317 (=> (not res!398329) (not e!354585))))

(declare-fun lt!284959 () SeekEntryResult!6409)

(assert (=> b!618317 (= res!398329 (and (= lt!284959 (Found!6409 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18013 a!2986) index!984) (select (arr!18013 a!2986) j!136))) (not (= (select (arr!18013 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!618317 (= lt!284959 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18013 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!618318 () Bool)

(declare-fun res!398320 () Bool)

(assert (=> b!618318 (=> (not res!398320) (not e!354590))))

(assert (=> b!618318 (= res!398320 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18013 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!618319 () Bool)

(declare-fun res!398324 () Bool)

(assert (=> b!618319 (= res!398324 (arrayContainsKey!0 lt!284955 (select (arr!18013 a!2986) j!136) j!136))))

(declare-fun e!354579 () Bool)

(assert (=> b!618319 (=> (not res!398324) (not e!354579))))

(declare-fun e!354589 () Bool)

(assert (=> b!618319 (= e!354589 e!354579)))

(declare-fun b!618320 () Bool)

(assert (=> b!618320 (= e!354590 e!354591)))

(declare-fun res!398327 () Bool)

(assert (=> b!618320 (=> (not res!398327) (not e!354591))))

(assert (=> b!618320 (= res!398327 (= (select (store (arr!18013 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!618320 (= lt!284955 (array!37540 (store (arr!18013 a!2986) i!1108 k0!1786) (size!18377 a!2986)))))

(declare-fun b!618321 () Bool)

(declare-fun Unit!20295 () Unit!20287)

(assert (=> b!618321 (= e!354586 Unit!20295)))

(assert (=> b!618321 false))

(declare-fun b!618322 () Bool)

(assert (=> b!618322 (= e!354581 true)))

(assert (=> b!618322 (= (select (store (arr!18013 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!618323 () Bool)

(declare-fun res!398318 () Bool)

(assert (=> b!618323 (=> (not res!398318) (not e!354590))))

(assert (=> b!618323 (= res!398318 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11958))))

(declare-fun b!618324 () Bool)

(assert (=> b!618324 (= e!354582 (arrayContainsKey!0 lt!284955 (select (arr!18013 a!2986) j!136) index!984))))

(declare-fun b!618325 () Bool)

(assert (=> b!618325 (= e!354580 (= lt!284959 lt!284950))))

(declare-fun b!618326 () Bool)

(declare-fun res!398323 () Bool)

(assert (=> b!618326 (=> (not res!398323) (not e!354584))))

(assert (=> b!618326 (= res!398323 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!618327 () Bool)

(assert (=> b!618327 false))

(declare-fun lt!284956 () Unit!20287)

(assert (=> b!618327 (= lt!284956 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!284955 (select (arr!18013 a!2986) j!136) j!136 Nil!11958))))

(assert (=> b!618327 (arrayNoDuplicates!0 lt!284955 j!136 Nil!11958)))

(declare-fun lt!284943 () Unit!20287)

(assert (=> b!618327 (= lt!284943 (lemmaNoDuplicateFromThenFromBigger!0 lt!284955 #b00000000000000000000000000000000 j!136))))

(assert (=> b!618327 (arrayNoDuplicates!0 lt!284955 #b00000000000000000000000000000000 Nil!11958)))

(declare-fun lt!284952 () Unit!20287)

(assert (=> b!618327 (= lt!284952 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11958))))

(assert (=> b!618327 (arrayContainsKey!0 lt!284955 (select (arr!18013 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!284958 () Unit!20287)

(assert (=> b!618327 (= lt!284958 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!284955 (select (arr!18013 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20296 () Unit!20287)

(assert (=> b!618327 (= e!354577 Unit!20296)))

(declare-fun b!618328 () Bool)

(declare-fun res!398325 () Bool)

(assert (=> b!618328 (= res!398325 (bvsge j!136 index!984))))

(assert (=> b!618328 (=> res!398325 e!354589)))

(assert (=> b!618328 (= e!354583 e!354589)))

(declare-fun b!618329 () Bool)

(assert (=> b!618329 (= e!354579 (arrayContainsKey!0 lt!284955 (select (arr!18013 a!2986) j!136) index!984))))

(declare-fun b!618330 () Bool)

(declare-fun res!398326 () Bool)

(assert (=> b!618330 (=> (not res!398326) (not e!354590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37539 (_ BitVec 32)) Bool)

(assert (=> b!618330 (= res!398326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!618331 () Bool)

(declare-fun res!398331 () Bool)

(assert (=> b!618331 (=> (not res!398331) (not e!354584))))

(assert (=> b!618331 (= res!398331 (validKeyInArray!0 (select (arr!18013 a!2986) j!136)))))

(assert (= (and start!56124 res!398321) b!618308))

(assert (= (and b!618308 res!398316) b!618331))

(assert (= (and b!618331 res!398331) b!618313))

(assert (= (and b!618313 res!398330) b!618326))

(assert (= (and b!618326 res!398323) b!618314))

(assert (= (and b!618314 res!398328) b!618330))

(assert (= (and b!618330 res!398326) b!618323))

(assert (= (and b!618323 res!398318) b!618318))

(assert (= (and b!618318 res!398320) b!618320))

(assert (= (and b!618320 res!398327) b!618317))

(assert (= (and b!618317 res!398329) b!618315))

(assert (= (and b!618315 res!398322) b!618325))

(assert (= (and b!618315 c!70367) b!618321))

(assert (= (and b!618315 (not c!70367)) b!618310))

(assert (= (and b!618315 c!70364) b!618311))

(assert (= (and b!618315 (not c!70364)) b!618312))

(assert (= (and b!618311 res!398319) b!618328))

(assert (= (and b!618328 (not res!398325)) b!618319))

(assert (= (and b!618319 res!398324) b!618329))

(assert (= (and b!618311 c!70365) b!618327))

(assert (= (and b!618311 (not c!70365)) b!618307))

(assert (= (and b!618311 c!70366) b!618309))

(assert (= (and b!618311 (not c!70366)) b!618316))

(assert (= (and b!618309 res!398332) b!618324))

(assert (= (and b!618315 (not res!398317)) b!618322))

(declare-fun m!594647 () Bool)

(assert (=> b!618318 m!594647))

(declare-fun m!594649 () Bool)

(assert (=> b!618314 m!594649))

(declare-fun m!594651 () Bool)

(assert (=> b!618320 m!594651))

(declare-fun m!594653 () Bool)

(assert (=> b!618320 m!594653))

(declare-fun m!594655 () Bool)

(assert (=> b!618317 m!594655))

(declare-fun m!594657 () Bool)

(assert (=> b!618317 m!594657))

(assert (=> b!618317 m!594657))

(declare-fun m!594659 () Bool)

(assert (=> b!618317 m!594659))

(assert (=> b!618329 m!594657))

(assert (=> b!618329 m!594657))

(declare-fun m!594661 () Bool)

(assert (=> b!618329 m!594661))

(assert (=> b!618319 m!594657))

(assert (=> b!618319 m!594657))

(declare-fun m!594663 () Bool)

(assert (=> b!618319 m!594663))

(declare-fun m!594665 () Bool)

(assert (=> b!618315 m!594665))

(declare-fun m!594667 () Bool)

(assert (=> b!618315 m!594667))

(declare-fun m!594669 () Bool)

(assert (=> b!618315 m!594669))

(assert (=> b!618315 m!594657))

(assert (=> b!618315 m!594657))

(declare-fun m!594671 () Bool)

(assert (=> b!618315 m!594671))

(assert (=> b!618315 m!594651))

(declare-fun m!594673 () Bool)

(assert (=> b!618315 m!594673))

(declare-fun m!594675 () Bool)

(assert (=> b!618315 m!594675))

(assert (=> b!618324 m!594657))

(assert (=> b!618324 m!594657))

(assert (=> b!618324 m!594661))

(assert (=> b!618311 m!594651))

(declare-fun m!594677 () Bool)

(assert (=> b!618311 m!594677))

(assert (=> b!618311 m!594657))

(declare-fun m!594679 () Bool)

(assert (=> b!618309 m!594679))

(declare-fun m!594681 () Bool)

(assert (=> b!618309 m!594681))

(assert (=> b!618309 m!594657))

(assert (=> b!618309 m!594657))

(assert (=> b!618309 m!594663))

(assert (=> b!618309 m!594657))

(declare-fun m!594683 () Bool)

(assert (=> b!618309 m!594683))

(declare-fun m!594685 () Bool)

(assert (=> b!618309 m!594685))

(declare-fun m!594687 () Bool)

(assert (=> b!618309 m!594687))

(assert (=> b!618309 m!594657))

(declare-fun m!594689 () Bool)

(assert (=> b!618309 m!594689))

(assert (=> b!618309 m!594657))

(declare-fun m!594691 () Bool)

(assert (=> b!618309 m!594691))

(declare-fun m!594693 () Bool)

(assert (=> b!618326 m!594693))

(assert (=> b!618327 m!594657))

(declare-fun m!594695 () Bool)

(assert (=> b!618327 m!594695))

(assert (=> b!618327 m!594657))

(declare-fun m!594697 () Bool)

(assert (=> b!618327 m!594697))

(assert (=> b!618327 m!594657))

(assert (=> b!618327 m!594657))

(declare-fun m!594699 () Bool)

(assert (=> b!618327 m!594699))

(assert (=> b!618327 m!594685))

(declare-fun m!594701 () Bool)

(assert (=> b!618327 m!594701))

(declare-fun m!594703 () Bool)

(assert (=> b!618327 m!594703))

(assert (=> b!618327 m!594687))

(declare-fun m!594705 () Bool)

(assert (=> b!618323 m!594705))

(declare-fun m!594707 () Bool)

(assert (=> b!618313 m!594707))

(declare-fun m!594709 () Bool)

(assert (=> b!618330 m!594709))

(assert (=> b!618322 m!594651))

(assert (=> b!618322 m!594677))

(assert (=> b!618331 m!594657))

(assert (=> b!618331 m!594657))

(declare-fun m!594711 () Bool)

(assert (=> b!618331 m!594711))

(declare-fun m!594713 () Bool)

(assert (=> start!56124 m!594713))

(declare-fun m!594715 () Bool)

(assert (=> start!56124 m!594715))

(check-sat (not b!618315) (not start!56124) (not b!618319) (not b!618326) (not b!618329) (not b!618327) (not b!618323) (not b!618330) (not b!618317) (not b!618314) (not b!618331) (not b!618313) (not b!618309) (not b!618324))
(check-sat)
