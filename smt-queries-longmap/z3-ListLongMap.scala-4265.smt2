; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59388 () Bool)

(assert start!59388)

(declare-fun res!424614 () Bool)

(declare-fun e!375962 () Bool)

(assert (=> start!59388 (=> (not res!424614) (not e!375962))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59388 (= res!424614 (validMask!0 mask!3053))))

(assert (=> start!59388 e!375962))

(assert (=> start!59388 true))

(declare-datatypes ((array!38646 0))(
  ( (array!38647 (arr!18520 (Array (_ BitVec 32) (_ BitVec 64))) (size!18884 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38646)

(declare-fun array_inv!14379 (array!38646) Bool)

(assert (=> start!59388 (array_inv!14379 a!2986)))

(declare-fun b!654677 () Bool)

(declare-fun res!424608 () Bool)

(declare-fun e!375970 () Bool)

(assert (=> b!654677 (=> (not res!424608) (not e!375970))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!654677 (= res!424608 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18520 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654678 () Bool)

(declare-datatypes ((Unit!22395 0))(
  ( (Unit!22396) )
))
(declare-fun e!375967 () Unit!22395)

(declare-fun Unit!22397 () Unit!22395)

(assert (=> b!654678 (= e!375967 Unit!22397)))

(declare-fun b!654679 () Bool)

(declare-fun e!375971 () Unit!22395)

(declare-fun Unit!22398 () Unit!22395)

(assert (=> b!654679 (= e!375971 Unit!22398)))

(declare-fun b!654680 () Bool)

(declare-fun res!424600 () Bool)

(assert (=> b!654680 (=> (not res!424600) (not e!375962))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654680 (= res!424600 (validKeyInArray!0 k0!1786))))

(declare-fun b!654681 () Bool)

(declare-fun res!424601 () Bool)

(assert (=> b!654681 (=> (not res!424601) (not e!375970))))

(declare-datatypes ((List!12468 0))(
  ( (Nil!12465) (Cons!12464 (h!13512 (_ BitVec 64)) (t!18688 List!12468)) )
))
(declare-fun arrayNoDuplicates!0 (array!38646 (_ BitVec 32) List!12468) Bool)

(assert (=> b!654681 (= res!424601 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12465))))

(declare-fun b!654682 () Bool)

(declare-fun res!424612 () Bool)

(assert (=> b!654682 (=> (not res!424612) (not e!375962))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!654682 (= res!424612 (validKeyInArray!0 (select (arr!18520 a!2986) j!136)))))

(declare-fun b!654683 () Bool)

(declare-fun e!375963 () Bool)

(assert (=> b!654683 (= e!375963 false)))

(declare-fun lt!304976 () Unit!22395)

(declare-fun e!375965 () Unit!22395)

(assert (=> b!654683 (= lt!304976 e!375965)))

(declare-fun c!75409 () Bool)

(assert (=> b!654683 (= c!75409 (bvslt index!984 j!136))))

(declare-fun lt!304983 () Unit!22395)

(assert (=> b!654683 (= lt!304983 e!375971)))

(declare-fun c!75410 () Bool)

(assert (=> b!654683 (= c!75410 (bvslt j!136 index!984))))

(declare-fun b!654684 () Bool)

(declare-fun Unit!22399 () Unit!22395)

(assert (=> b!654684 (= e!375965 Unit!22399)))

(declare-fun b!654685 () Bool)

(declare-fun e!375966 () Bool)

(declare-datatypes ((SeekEntryResult!6916 0))(
  ( (MissingZero!6916 (index!30023 (_ BitVec 32))) (Found!6916 (index!30024 (_ BitVec 32))) (Intermediate!6916 (undefined!7728 Bool) (index!30025 (_ BitVec 32)) (x!58968 (_ BitVec 32))) (Undefined!6916) (MissingVacant!6916 (index!30026 (_ BitVec 32))) )
))
(declare-fun lt!304984 () SeekEntryResult!6916)

(declare-fun lt!304974 () SeekEntryResult!6916)

(assert (=> b!654685 (= e!375966 (= lt!304984 lt!304974))))

(declare-fun b!654686 () Bool)

(declare-fun res!424602 () Bool)

(assert (=> b!654686 (=> (not res!424602) (not e!375970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38646 (_ BitVec 32)) Bool)

(assert (=> b!654686 (= res!424602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654687 () Bool)

(declare-fun res!424613 () Bool)

(assert (=> b!654687 (=> (not res!424613) (not e!375962))))

(declare-fun arrayContainsKey!0 (array!38646 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654687 (= res!424613 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!654688 () Bool)

(declare-fun e!375964 () Bool)

(declare-fun e!375961 () Bool)

(assert (=> b!654688 (= e!375964 (not e!375961))))

(declare-fun res!424603 () Bool)

(assert (=> b!654688 (=> res!424603 e!375961)))

(declare-fun lt!304977 () SeekEntryResult!6916)

(assert (=> b!654688 (= res!424603 (not (= lt!304977 (Found!6916 index!984))))))

(declare-fun lt!304982 () Unit!22395)

(assert (=> b!654688 (= lt!304982 e!375967)))

(declare-fun c!75408 () Bool)

(assert (=> b!654688 (= c!75408 (= lt!304977 Undefined!6916))))

(declare-fun lt!304971 () (_ BitVec 64))

(declare-fun lt!304966 () array!38646)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38646 (_ BitVec 32)) SeekEntryResult!6916)

(assert (=> b!654688 (= lt!304977 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304971 lt!304966 mask!3053))))

(assert (=> b!654688 e!375966))

(declare-fun res!424610 () Bool)

(assert (=> b!654688 (=> (not res!424610) (not e!375966))))

(declare-fun lt!304979 () (_ BitVec 32))

(assert (=> b!654688 (= res!424610 (= lt!304974 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304979 vacantSpotIndex!68 lt!304971 lt!304966 mask!3053)))))

(assert (=> b!654688 (= lt!304974 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304979 vacantSpotIndex!68 (select (arr!18520 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!654688 (= lt!304971 (select (store (arr!18520 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!304972 () Unit!22395)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38646 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22395)

(assert (=> b!654688 (= lt!304972 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304979 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654688 (= lt!304979 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!654689 () Bool)

(declare-fun Unit!22400 () Unit!22395)

(assert (=> b!654689 (= e!375967 Unit!22400)))

(assert (=> b!654689 false))

(declare-fun b!654690 () Bool)

(assert (=> b!654690 (= e!375962 e!375970)))

(declare-fun res!424598 () Bool)

(assert (=> b!654690 (=> (not res!424598) (not e!375970))))

(declare-fun lt!304978 () SeekEntryResult!6916)

(assert (=> b!654690 (= res!424598 (or (= lt!304978 (MissingZero!6916 i!1108)) (= lt!304978 (MissingVacant!6916 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38646 (_ BitVec 32)) SeekEntryResult!6916)

(assert (=> b!654690 (= lt!304978 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!654691 () Bool)

(declare-fun Unit!22401 () Unit!22395)

(assert (=> b!654691 (= e!375971 Unit!22401)))

(declare-fun lt!304973 () Unit!22395)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38646 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22395)

(assert (=> b!654691 (= lt!304973 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304966 (select (arr!18520 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!654691 (arrayContainsKey!0 lt!304966 (select (arr!18520 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304968 () Unit!22395)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38646 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12468) Unit!22395)

(assert (=> b!654691 (= lt!304968 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12465))))

(assert (=> b!654691 (arrayNoDuplicates!0 lt!304966 #b00000000000000000000000000000000 Nil!12465)))

(declare-fun lt!304967 () Unit!22395)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38646 (_ BitVec 32) (_ BitVec 32)) Unit!22395)

(assert (=> b!654691 (= lt!304967 (lemmaNoDuplicateFromThenFromBigger!0 lt!304966 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654691 (arrayNoDuplicates!0 lt!304966 j!136 Nil!12465)))

(declare-fun lt!304981 () Unit!22395)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38646 (_ BitVec 64) (_ BitVec 32) List!12468) Unit!22395)

(assert (=> b!654691 (= lt!304981 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304966 (select (arr!18520 a!2986) j!136) j!136 Nil!12465))))

(assert (=> b!654691 false))

(declare-fun b!654692 () Bool)

(declare-fun e!375969 () Bool)

(declare-fun e!375968 () Bool)

(assert (=> b!654692 (= e!375969 e!375968)))

(declare-fun res!424606 () Bool)

(assert (=> b!654692 (=> res!424606 e!375968)))

(declare-fun lt!304965 () (_ BitVec 64))

(assert (=> b!654692 (= res!424606 (or (not (= (select (arr!18520 a!2986) j!136) lt!304971)) (not (= (select (arr!18520 a!2986) j!136) lt!304965)) (bvsge j!136 index!984)))))

(declare-fun b!654693 () Bool)

(declare-fun res!424607 () Bool)

(assert (=> b!654693 (=> (not res!424607) (not e!375962))))

(assert (=> b!654693 (= res!424607 (and (= (size!18884 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18884 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18884 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654694 () Bool)

(assert (=> b!654694 (= e!375961 e!375963)))

(declare-fun res!424615 () Bool)

(assert (=> b!654694 (=> res!424615 e!375963)))

(assert (=> b!654694 (= res!424615 (or (not (= (select (arr!18520 a!2986) j!136) lt!304971)) (not (= (select (arr!18520 a!2986) j!136) lt!304965))))))

(assert (=> b!654694 e!375969))

(declare-fun res!424604 () Bool)

(assert (=> b!654694 (=> (not res!424604) (not e!375969))))

(assert (=> b!654694 (= res!424604 (= lt!304965 (select (arr!18520 a!2986) j!136)))))

(assert (=> b!654694 (= lt!304965 (select (store (arr!18520 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!654695 () Bool)

(declare-fun e!375958 () Bool)

(assert (=> b!654695 (= e!375958 (arrayContainsKey!0 lt!304966 (select (arr!18520 a!2986) j!136) index!984))))

(declare-fun b!654696 () Bool)

(declare-fun e!375960 () Bool)

(assert (=> b!654696 (= e!375968 e!375960)))

(declare-fun res!424609 () Bool)

(assert (=> b!654696 (=> (not res!424609) (not e!375960))))

(assert (=> b!654696 (= res!424609 (arrayContainsKey!0 lt!304966 (select (arr!18520 a!2986) j!136) j!136))))

(declare-fun b!654697 () Bool)

(declare-fun e!375959 () Bool)

(assert (=> b!654697 (= e!375970 e!375959)))

(declare-fun res!424605 () Bool)

(assert (=> b!654697 (=> (not res!424605) (not e!375959))))

(assert (=> b!654697 (= res!424605 (= (select (store (arr!18520 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!654697 (= lt!304966 (array!38647 (store (arr!18520 a!2986) i!1108 k0!1786) (size!18884 a!2986)))))

(declare-fun b!654698 () Bool)

(assert (=> b!654698 (= e!375960 (arrayContainsKey!0 lt!304966 (select (arr!18520 a!2986) j!136) index!984))))

(declare-fun b!654699 () Bool)

(declare-fun Unit!22402 () Unit!22395)

(assert (=> b!654699 (= e!375965 Unit!22402)))

(declare-fun res!424599 () Bool)

(assert (=> b!654699 (= res!424599 (arrayContainsKey!0 lt!304966 (select (arr!18520 a!2986) j!136) j!136))))

(assert (=> b!654699 (=> (not res!424599) (not e!375958))))

(assert (=> b!654699 e!375958))

(declare-fun lt!304970 () Unit!22395)

(assert (=> b!654699 (= lt!304970 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304966 (select (arr!18520 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654699 (arrayContainsKey!0 lt!304966 (select (arr!18520 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304975 () Unit!22395)

(assert (=> b!654699 (= lt!304975 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12465))))

(assert (=> b!654699 (arrayNoDuplicates!0 lt!304966 #b00000000000000000000000000000000 Nil!12465)))

(declare-fun lt!304980 () Unit!22395)

(assert (=> b!654699 (= lt!304980 (lemmaNoDuplicateFromThenFromBigger!0 lt!304966 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654699 (arrayNoDuplicates!0 lt!304966 index!984 Nil!12465)))

(declare-fun lt!304969 () Unit!22395)

(assert (=> b!654699 (= lt!304969 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304966 (select (arr!18520 a!2986) j!136) index!984 Nil!12465))))

(assert (=> b!654699 false))

(declare-fun b!654700 () Bool)

(assert (=> b!654700 (= e!375959 e!375964)))

(declare-fun res!424611 () Bool)

(assert (=> b!654700 (=> (not res!424611) (not e!375964))))

(assert (=> b!654700 (= res!424611 (and (= lt!304984 (Found!6916 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18520 a!2986) index!984) (select (arr!18520 a!2986) j!136))) (not (= (select (arr!18520 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!654700 (= lt!304984 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18520 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!59388 res!424614) b!654693))

(assert (= (and b!654693 res!424607) b!654682))

(assert (= (and b!654682 res!424612) b!654680))

(assert (= (and b!654680 res!424600) b!654687))

(assert (= (and b!654687 res!424613) b!654690))

(assert (= (and b!654690 res!424598) b!654686))

(assert (= (and b!654686 res!424602) b!654681))

(assert (= (and b!654681 res!424601) b!654677))

(assert (= (and b!654677 res!424608) b!654697))

(assert (= (and b!654697 res!424605) b!654700))

(assert (= (and b!654700 res!424611) b!654688))

(assert (= (and b!654688 res!424610) b!654685))

(assert (= (and b!654688 c!75408) b!654689))

(assert (= (and b!654688 (not c!75408)) b!654678))

(assert (= (and b!654688 (not res!424603)) b!654694))

(assert (= (and b!654694 res!424604) b!654692))

(assert (= (and b!654692 (not res!424606)) b!654696))

(assert (= (and b!654696 res!424609) b!654698))

(assert (= (and b!654694 (not res!424615)) b!654683))

(assert (= (and b!654683 c!75410) b!654691))

(assert (= (and b!654683 (not c!75410)) b!654679))

(assert (= (and b!654683 c!75409) b!654699))

(assert (= (and b!654683 (not c!75409)) b!654684))

(assert (= (and b!654699 res!424599) b!654695))

(declare-fun m!628237 () Bool)

(assert (=> b!654691 m!628237))

(declare-fun m!628239 () Bool)

(assert (=> b!654691 m!628239))

(assert (=> b!654691 m!628237))

(declare-fun m!628241 () Bool)

(assert (=> b!654691 m!628241))

(declare-fun m!628243 () Bool)

(assert (=> b!654691 m!628243))

(declare-fun m!628245 () Bool)

(assert (=> b!654691 m!628245))

(declare-fun m!628247 () Bool)

(assert (=> b!654691 m!628247))

(declare-fun m!628249 () Bool)

(assert (=> b!654691 m!628249))

(assert (=> b!654691 m!628237))

(assert (=> b!654691 m!628237))

(declare-fun m!628251 () Bool)

(assert (=> b!654691 m!628251))

(declare-fun m!628253 () Bool)

(assert (=> b!654700 m!628253))

(assert (=> b!654700 m!628237))

(assert (=> b!654700 m!628237))

(declare-fun m!628255 () Bool)

(assert (=> b!654700 m!628255))

(declare-fun m!628257 () Bool)

(assert (=> b!654697 m!628257))

(declare-fun m!628259 () Bool)

(assert (=> b!654697 m!628259))

(assert (=> b!654694 m!628237))

(assert (=> b!654694 m!628257))

(declare-fun m!628261 () Bool)

(assert (=> b!654694 m!628261))

(assert (=> b!654682 m!628237))

(assert (=> b!654682 m!628237))

(declare-fun m!628263 () Bool)

(assert (=> b!654682 m!628263))

(assert (=> b!654695 m!628237))

(assert (=> b!654695 m!628237))

(declare-fun m!628265 () Bool)

(assert (=> b!654695 m!628265))

(declare-fun m!628267 () Bool)

(assert (=> b!654690 m!628267))

(declare-fun m!628269 () Bool)

(assert (=> b!654686 m!628269))

(declare-fun m!628271 () Bool)

(assert (=> start!59388 m!628271))

(declare-fun m!628273 () Bool)

(assert (=> start!59388 m!628273))

(assert (=> b!654692 m!628237))

(declare-fun m!628275 () Bool)

(assert (=> b!654688 m!628275))

(declare-fun m!628277 () Bool)

(assert (=> b!654688 m!628277))

(assert (=> b!654688 m!628237))

(declare-fun m!628279 () Bool)

(assert (=> b!654688 m!628279))

(assert (=> b!654688 m!628257))

(declare-fun m!628281 () Bool)

(assert (=> b!654688 m!628281))

(declare-fun m!628283 () Bool)

(assert (=> b!654688 m!628283))

(assert (=> b!654688 m!628237))

(declare-fun m!628285 () Bool)

(assert (=> b!654688 m!628285))

(assert (=> b!654696 m!628237))

(assert (=> b!654696 m!628237))

(declare-fun m!628287 () Bool)

(assert (=> b!654696 m!628287))

(assert (=> b!654698 m!628237))

(assert (=> b!654698 m!628237))

(assert (=> b!654698 m!628265))

(declare-fun m!628289 () Bool)

(assert (=> b!654680 m!628289))

(declare-fun m!628291 () Bool)

(assert (=> b!654681 m!628291))

(declare-fun m!628293 () Bool)

(assert (=> b!654677 m!628293))

(assert (=> b!654699 m!628237))

(declare-fun m!628295 () Bool)

(assert (=> b!654699 m!628295))

(assert (=> b!654699 m!628237))

(assert (=> b!654699 m!628237))

(declare-fun m!628297 () Bool)

(assert (=> b!654699 m!628297))

(assert (=> b!654699 m!628237))

(assert (=> b!654699 m!628287))

(declare-fun m!628299 () Bool)

(assert (=> b!654699 m!628299))

(assert (=> b!654699 m!628243))

(assert (=> b!654699 m!628249))

(assert (=> b!654699 m!628237))

(declare-fun m!628301 () Bool)

(assert (=> b!654699 m!628301))

(declare-fun m!628303 () Bool)

(assert (=> b!654699 m!628303))

(declare-fun m!628305 () Bool)

(assert (=> b!654687 m!628305))

(check-sat (not b!654687) (not b!654688) (not b!654699) (not b!654700) (not b!654682) (not b!654696) (not b!654686) (not b!654690) (not b!654691) (not start!59388) (not b!654680) (not b!654681) (not b!654698) (not b!654695))
(check-sat)
