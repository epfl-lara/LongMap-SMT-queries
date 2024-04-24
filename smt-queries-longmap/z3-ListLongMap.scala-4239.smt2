; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58596 () Bool)

(assert start!58596)

(declare-fun b!646407 () Bool)

(declare-datatypes ((Unit!21927 0))(
  ( (Unit!21928) )
))
(declare-fun e!370529 () Unit!21927)

(declare-fun Unit!21929 () Unit!21927)

(assert (=> b!646407 (= e!370529 Unit!21929)))

(declare-fun b!646408 () Bool)

(declare-fun res!418767 () Bool)

(declare-fun e!370531 () Bool)

(assert (=> b!646408 (=> (not res!418767) (not e!370531))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!646408 (= res!418767 (validKeyInArray!0 k0!1786))))

(declare-fun b!646409 () Bool)

(declare-fun res!418774 () Bool)

(assert (=> b!646409 (=> (not res!418774) (not e!370531))))

(declare-datatypes ((array!38469 0))(
  ( (array!38470 (arr!18442 (Array (_ BitVec 32) (_ BitVec 64))) (size!18806 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38469)

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!646409 (= res!418774 (validKeyInArray!0 (select (arr!18442 a!2986) j!136)))))

(declare-fun b!646411 () Bool)

(declare-fun res!418760 () Bool)

(declare-fun e!370526 () Bool)

(assert (=> b!646411 (=> (not res!418760) (not e!370526))))

(declare-datatypes ((List!12390 0))(
  ( (Nil!12387) (Cons!12386 (h!13434 (_ BitVec 64)) (t!18610 List!12390)) )
))
(declare-fun arrayNoDuplicates!0 (array!38469 (_ BitVec 32) List!12390) Bool)

(assert (=> b!646411 (= res!418760 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12387))))

(declare-fun e!370527 () Bool)

(declare-fun b!646412 () Bool)

(declare-fun lt!299841 () array!38469)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!646412 (= e!370527 (arrayContainsKey!0 lt!299841 (select (arr!18442 a!2986) j!136) index!984))))

(declare-fun b!646413 () Bool)

(declare-fun e!370522 () Bool)

(declare-fun e!370534 () Bool)

(assert (=> b!646413 (= e!370522 e!370534)))

(declare-fun res!418764 () Bool)

(assert (=> b!646413 (=> res!418764 e!370534)))

(assert (=> b!646413 (= res!418764 (bvsge index!984 j!136))))

(declare-fun lt!299842 () Unit!21927)

(assert (=> b!646413 (= lt!299842 e!370529)))

(declare-fun c!74195 () Bool)

(assert (=> b!646413 (= c!74195 (bvslt j!136 index!984))))

(declare-fun b!646414 () Bool)

(assert (=> b!646414 (= e!370534 true)))

(assert (=> b!646414 (arrayContainsKey!0 lt!299841 (select (arr!18442 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!299832 () Unit!21927)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38469 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21927)

(assert (=> b!646414 (= lt!299832 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299841 (select (arr!18442 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!646414 e!370527))

(declare-fun res!418773 () Bool)

(assert (=> b!646414 (=> (not res!418773) (not e!370527))))

(assert (=> b!646414 (= res!418773 (arrayContainsKey!0 lt!299841 (select (arr!18442 a!2986) j!136) j!136))))

(declare-fun b!646415 () Bool)

(declare-fun res!418756 () Bool)

(assert (=> b!646415 (=> (not res!418756) (not e!370526))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38469 (_ BitVec 32)) Bool)

(assert (=> b!646415 (= res!418756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!646416 () Bool)

(declare-fun e!370523 () Bool)

(declare-fun e!370536 () Bool)

(assert (=> b!646416 (= e!370523 (not e!370536))))

(declare-fun res!418759 () Bool)

(assert (=> b!646416 (=> res!418759 e!370536)))

(declare-datatypes ((SeekEntryResult!6838 0))(
  ( (MissingZero!6838 (index!29690 (_ BitVec 32))) (Found!6838 (index!29691 (_ BitVec 32))) (Intermediate!6838 (undefined!7650 Bool) (index!29692 (_ BitVec 32)) (x!58619 (_ BitVec 32))) (Undefined!6838) (MissingVacant!6838 (index!29693 (_ BitVec 32))) )
))
(declare-fun lt!299843 () SeekEntryResult!6838)

(assert (=> b!646416 (= res!418759 (not (= lt!299843 (Found!6838 index!984))))))

(declare-fun lt!299844 () Unit!21927)

(declare-fun e!370528 () Unit!21927)

(assert (=> b!646416 (= lt!299844 e!370528)))

(declare-fun c!74194 () Bool)

(assert (=> b!646416 (= c!74194 (= lt!299843 Undefined!6838))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!299840 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38469 (_ BitVec 32)) SeekEntryResult!6838)

(assert (=> b!646416 (= lt!299843 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!299840 lt!299841 mask!3053))))

(declare-fun e!370532 () Bool)

(assert (=> b!646416 e!370532))

(declare-fun res!418758 () Bool)

(assert (=> b!646416 (=> (not res!418758) (not e!370532))))

(declare-fun lt!299830 () SeekEntryResult!6838)

(declare-fun lt!299834 () (_ BitVec 32))

(assert (=> b!646416 (= res!418758 (= lt!299830 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299834 vacantSpotIndex!68 lt!299840 lt!299841 mask!3053)))))

(assert (=> b!646416 (= lt!299830 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!299834 vacantSpotIndex!68 (select (arr!18442 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!646416 (= lt!299840 (select (store (arr!18442 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!299838 () Unit!21927)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38469 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21927)

(assert (=> b!646416 (= lt!299838 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!299834 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!646416 (= lt!299834 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!646417 () Bool)

(declare-fun Unit!21930 () Unit!21927)

(assert (=> b!646417 (= e!370529 Unit!21930)))

(declare-fun lt!299831 () Unit!21927)

(assert (=> b!646417 (= lt!299831 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!299841 (select (arr!18442 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!646417 (arrayContainsKey!0 lt!299841 (select (arr!18442 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!299833 () Unit!21927)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38469 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12390) Unit!21927)

(assert (=> b!646417 (= lt!299833 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12387))))

(assert (=> b!646417 (arrayNoDuplicates!0 lt!299841 #b00000000000000000000000000000000 Nil!12387)))

(declare-fun lt!299836 () Unit!21927)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38469 (_ BitVec 32) (_ BitVec 32)) Unit!21927)

(assert (=> b!646417 (= lt!299836 (lemmaNoDuplicateFromThenFromBigger!0 lt!299841 #b00000000000000000000000000000000 j!136))))

(assert (=> b!646417 (arrayNoDuplicates!0 lt!299841 j!136 Nil!12387)))

(declare-fun lt!299837 () Unit!21927)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38469 (_ BitVec 64) (_ BitVec 32) List!12390) Unit!21927)

(assert (=> b!646417 (= lt!299837 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!299841 (select (arr!18442 a!2986) j!136) j!136 Nil!12387))))

(assert (=> b!646417 false))

(declare-fun b!646418 () Bool)

(assert (=> b!646418 (= e!370536 e!370522)))

(declare-fun res!418770 () Bool)

(assert (=> b!646418 (=> res!418770 e!370522)))

(declare-fun lt!299835 () (_ BitVec 64))

(assert (=> b!646418 (= res!418770 (or (not (= (select (arr!18442 a!2986) j!136) lt!299840)) (not (= (select (arr!18442 a!2986) j!136) lt!299835))))))

(declare-fun e!370524 () Bool)

(assert (=> b!646418 e!370524))

(declare-fun res!418763 () Bool)

(assert (=> b!646418 (=> (not res!418763) (not e!370524))))

(assert (=> b!646418 (= res!418763 (= lt!299835 (select (arr!18442 a!2986) j!136)))))

(assert (=> b!646418 (= lt!299835 (select (store (arr!18442 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!646410 () Bool)

(declare-fun e!370535 () Bool)

(assert (=> b!646410 (= e!370526 e!370535)))

(declare-fun res!418771 () Bool)

(assert (=> b!646410 (=> (not res!418771) (not e!370535))))

(assert (=> b!646410 (= res!418771 (= (select (store (arr!18442 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!646410 (= lt!299841 (array!38470 (store (arr!18442 a!2986) i!1108 k0!1786) (size!18806 a!2986)))))

(declare-fun res!418757 () Bool)

(assert (=> start!58596 (=> (not res!418757) (not e!370531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58596 (= res!418757 (validMask!0 mask!3053))))

(assert (=> start!58596 e!370531))

(assert (=> start!58596 true))

(declare-fun array_inv!14301 (array!38469) Bool)

(assert (=> start!58596 (array_inv!14301 a!2986)))

(declare-fun b!646419 () Bool)

(assert (=> b!646419 (= e!370535 e!370523)))

(declare-fun res!418762 () Bool)

(assert (=> b!646419 (=> (not res!418762) (not e!370523))))

(declare-fun lt!299845 () SeekEntryResult!6838)

(assert (=> b!646419 (= res!418762 (and (= lt!299845 (Found!6838 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18442 a!2986) index!984) (select (arr!18442 a!2986) j!136))) (not (= (select (arr!18442 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!646419 (= lt!299845 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18442 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!646420 () Bool)

(assert (=> b!646420 (= e!370531 e!370526)))

(declare-fun res!418761 () Bool)

(assert (=> b!646420 (=> (not res!418761) (not e!370526))))

(declare-fun lt!299839 () SeekEntryResult!6838)

(assert (=> b!646420 (= res!418761 (or (= lt!299839 (MissingZero!6838 i!1108)) (= lt!299839 (MissingVacant!6838 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38469 (_ BitVec 32)) SeekEntryResult!6838)

(assert (=> b!646420 (= lt!299839 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!646421 () Bool)

(declare-fun e!370525 () Bool)

(assert (=> b!646421 (= e!370524 e!370525)))

(declare-fun res!418768 () Bool)

(assert (=> b!646421 (=> res!418768 e!370525)))

(assert (=> b!646421 (= res!418768 (or (not (= (select (arr!18442 a!2986) j!136) lt!299840)) (not (= (select (arr!18442 a!2986) j!136) lt!299835)) (bvsge j!136 index!984)))))

(declare-fun b!646422 () Bool)

(declare-fun res!418766 () Bool)

(assert (=> b!646422 (=> (not res!418766) (not e!370531))))

(assert (=> b!646422 (= res!418766 (and (= (size!18806 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18806 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18806 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!646423 () Bool)

(declare-fun res!418772 () Bool)

(assert (=> b!646423 (=> (not res!418772) (not e!370526))))

(assert (=> b!646423 (= res!418772 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18442 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!646424 () Bool)

(declare-fun res!418769 () Bool)

(assert (=> b!646424 (=> (not res!418769) (not e!370531))))

(assert (=> b!646424 (= res!418769 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!646425 () Bool)

(assert (=> b!646425 (= e!370532 (= lt!299845 lt!299830))))

(declare-fun b!646426 () Bool)

(declare-fun e!370533 () Bool)

(assert (=> b!646426 (= e!370525 e!370533)))

(declare-fun res!418765 () Bool)

(assert (=> b!646426 (=> (not res!418765) (not e!370533))))

(assert (=> b!646426 (= res!418765 (arrayContainsKey!0 lt!299841 (select (arr!18442 a!2986) j!136) j!136))))

(declare-fun b!646427 () Bool)

(declare-fun Unit!21931 () Unit!21927)

(assert (=> b!646427 (= e!370528 Unit!21931)))

(assert (=> b!646427 false))

(declare-fun b!646428 () Bool)

(declare-fun Unit!21932 () Unit!21927)

(assert (=> b!646428 (= e!370528 Unit!21932)))

(declare-fun b!646429 () Bool)

(assert (=> b!646429 (= e!370533 (arrayContainsKey!0 lt!299841 (select (arr!18442 a!2986) j!136) index!984))))

(assert (= (and start!58596 res!418757) b!646422))

(assert (= (and b!646422 res!418766) b!646409))

(assert (= (and b!646409 res!418774) b!646408))

(assert (= (and b!646408 res!418767) b!646424))

(assert (= (and b!646424 res!418769) b!646420))

(assert (= (and b!646420 res!418761) b!646415))

(assert (= (and b!646415 res!418756) b!646411))

(assert (= (and b!646411 res!418760) b!646423))

(assert (= (and b!646423 res!418772) b!646410))

(assert (= (and b!646410 res!418771) b!646419))

(assert (= (and b!646419 res!418762) b!646416))

(assert (= (and b!646416 res!418758) b!646425))

(assert (= (and b!646416 c!74194) b!646427))

(assert (= (and b!646416 (not c!74194)) b!646428))

(assert (= (and b!646416 (not res!418759)) b!646418))

(assert (= (and b!646418 res!418763) b!646421))

(assert (= (and b!646421 (not res!418768)) b!646426))

(assert (= (and b!646426 res!418765) b!646429))

(assert (= (and b!646418 (not res!418770)) b!646413))

(assert (= (and b!646413 c!74195) b!646417))

(assert (= (and b!646413 (not c!74195)) b!646407))

(assert (= (and b!646413 (not res!418764)) b!646414))

(assert (= (and b!646414 res!418773) b!646412))

(declare-fun m!620305 () Bool)

(assert (=> b!646410 m!620305))

(declare-fun m!620307 () Bool)

(assert (=> b!646410 m!620307))

(declare-fun m!620309 () Bool)

(assert (=> b!646414 m!620309))

(assert (=> b!646414 m!620309))

(declare-fun m!620311 () Bool)

(assert (=> b!646414 m!620311))

(assert (=> b!646414 m!620309))

(declare-fun m!620313 () Bool)

(assert (=> b!646414 m!620313))

(assert (=> b!646414 m!620309))

(declare-fun m!620315 () Bool)

(assert (=> b!646414 m!620315))

(declare-fun m!620317 () Bool)

(assert (=> b!646416 m!620317))

(declare-fun m!620319 () Bool)

(assert (=> b!646416 m!620319))

(assert (=> b!646416 m!620309))

(assert (=> b!646416 m!620305))

(declare-fun m!620321 () Bool)

(assert (=> b!646416 m!620321))

(declare-fun m!620323 () Bool)

(assert (=> b!646416 m!620323))

(declare-fun m!620325 () Bool)

(assert (=> b!646416 m!620325))

(assert (=> b!646416 m!620309))

(declare-fun m!620327 () Bool)

(assert (=> b!646416 m!620327))

(declare-fun m!620329 () Bool)

(assert (=> b!646408 m!620329))

(assert (=> b!646429 m!620309))

(assert (=> b!646429 m!620309))

(declare-fun m!620331 () Bool)

(assert (=> b!646429 m!620331))

(assert (=> b!646421 m!620309))

(assert (=> b!646418 m!620309))

(assert (=> b!646418 m!620305))

(declare-fun m!620333 () Bool)

(assert (=> b!646418 m!620333))

(declare-fun m!620335 () Bool)

(assert (=> b!646423 m!620335))

(declare-fun m!620337 () Bool)

(assert (=> b!646411 m!620337))

(declare-fun m!620339 () Bool)

(assert (=> b!646415 m!620339))

(declare-fun m!620341 () Bool)

(assert (=> start!58596 m!620341))

(declare-fun m!620343 () Bool)

(assert (=> start!58596 m!620343))

(declare-fun m!620345 () Bool)

(assert (=> b!646424 m!620345))

(assert (=> b!646417 m!620309))

(declare-fun m!620347 () Bool)

(assert (=> b!646417 m!620347))

(assert (=> b!646417 m!620309))

(declare-fun m!620349 () Bool)

(assert (=> b!646417 m!620349))

(assert (=> b!646417 m!620309))

(declare-fun m!620351 () Bool)

(assert (=> b!646417 m!620351))

(declare-fun m!620353 () Bool)

(assert (=> b!646417 m!620353))

(assert (=> b!646417 m!620309))

(declare-fun m!620355 () Bool)

(assert (=> b!646417 m!620355))

(declare-fun m!620357 () Bool)

(assert (=> b!646417 m!620357))

(declare-fun m!620359 () Bool)

(assert (=> b!646417 m!620359))

(declare-fun m!620361 () Bool)

(assert (=> b!646419 m!620361))

(assert (=> b!646419 m!620309))

(assert (=> b!646419 m!620309))

(declare-fun m!620363 () Bool)

(assert (=> b!646419 m!620363))

(assert (=> b!646426 m!620309))

(assert (=> b!646426 m!620309))

(assert (=> b!646426 m!620315))

(assert (=> b!646412 m!620309))

(assert (=> b!646412 m!620309))

(assert (=> b!646412 m!620331))

(assert (=> b!646409 m!620309))

(assert (=> b!646409 m!620309))

(declare-fun m!620365 () Bool)

(assert (=> b!646409 m!620365))

(declare-fun m!620367 () Bool)

(assert (=> b!646420 m!620367))

(check-sat (not b!646408) (not b!646420) (not b!646424) (not b!646412) (not b!646414) (not b!646416) (not b!646411) (not b!646409) (not b!646426) (not b!646417) (not b!646415) (not start!58596) (not b!646419) (not b!646429))
(check-sat)
