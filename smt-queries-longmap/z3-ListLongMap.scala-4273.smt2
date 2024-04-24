; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59520 () Bool)

(assert start!59520)

(declare-fun b!656755 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun res!425923 () Bool)

(declare-datatypes ((array!38697 0))(
  ( (array!38698 (arr!18544 (Array (_ BitVec 32) (_ BitVec 64))) (size!18908 (_ BitVec 32))) )
))
(declare-fun lt!306572 () array!38697)

(declare-fun a!2986 () array!38697)

(declare-fun arrayContainsKey!0 (array!38697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!656755 (= res!425923 (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) j!136))))

(declare-fun e!377226 () Bool)

(assert (=> b!656755 (=> (not res!425923) (not e!377226))))

(declare-fun e!377229 () Bool)

(assert (=> b!656755 (= e!377229 e!377226)))

(declare-fun b!656756 () Bool)

(declare-datatypes ((Unit!22623 0))(
  ( (Unit!22624) )
))
(declare-fun e!377236 () Unit!22623)

(declare-fun Unit!22625 () Unit!22623)

(assert (=> b!656756 (= e!377236 Unit!22625)))

(assert (=> b!656756 false))

(declare-fun b!656757 () Bool)

(declare-fun e!377233 () Bool)

(declare-datatypes ((SeekEntryResult!6940 0))(
  ( (MissingZero!6940 (index!30122 (_ BitVec 32))) (Found!6940 (index!30123 (_ BitVec 32))) (Intermediate!6940 (undefined!7752 Bool) (index!30124 (_ BitVec 32)) (x!59065 (_ BitVec 32))) (Undefined!6940) (MissingVacant!6940 (index!30125 (_ BitVec 32))) )
))
(declare-fun lt!306571 () SeekEntryResult!6940)

(declare-fun lt!306567 () SeekEntryResult!6940)

(assert (=> b!656757 (= e!377233 (= lt!306571 lt!306567))))

(declare-fun b!656758 () Bool)

(declare-fun res!425930 () Bool)

(declare-fun e!377238 () Bool)

(assert (=> b!656758 (=> (not res!425930) (not e!377238))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38697 (_ BitVec 32)) Bool)

(assert (=> b!656758 (= res!425930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!656759 () Bool)

(declare-fun res!425922 () Bool)

(declare-fun e!377228 () Bool)

(assert (=> b!656759 (=> (not res!425922) (not e!377228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!656759 (= res!425922 (validKeyInArray!0 (select (arr!18544 a!2986) j!136)))))

(declare-fun b!656760 () Bool)

(assert (=> b!656760 false))

(declare-fun lt!306568 () Unit!22623)

(declare-datatypes ((List!12492 0))(
  ( (Nil!12489) (Cons!12488 (h!13536 (_ BitVec 64)) (t!18712 List!12492)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38697 (_ BitVec 64) (_ BitVec 32) List!12492) Unit!22623)

(assert (=> b!656760 (= lt!306568 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306572 (select (arr!18544 a!2986) j!136) j!136 Nil!12489))))

(declare-fun arrayNoDuplicates!0 (array!38697 (_ BitVec 32) List!12492) Bool)

(assert (=> b!656760 (arrayNoDuplicates!0 lt!306572 j!136 Nil!12489)))

(declare-fun lt!306569 () Unit!22623)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38697 (_ BitVec 32) (_ BitVec 32)) Unit!22623)

(assert (=> b!656760 (= lt!306569 (lemmaNoDuplicateFromThenFromBigger!0 lt!306572 #b00000000000000000000000000000000 j!136))))

(assert (=> b!656760 (arrayNoDuplicates!0 lt!306572 #b00000000000000000000000000000000 Nil!12489)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!306559 () Unit!22623)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38697 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12492) Unit!22623)

(assert (=> b!656760 (= lt!306559 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12489))))

(assert (=> b!656760 (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306577 () Unit!22623)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38697 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22623)

(assert (=> b!656760 (= lt!306577 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306572 (select (arr!18544 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!377224 () Unit!22623)

(declare-fun Unit!22626 () Unit!22623)

(assert (=> b!656760 (= e!377224 Unit!22626)))

(declare-fun b!656761 () Bool)

(declare-fun e!377231 () Bool)

(declare-fun e!377227 () Bool)

(assert (=> b!656761 (= e!377231 (not e!377227))))

(declare-fun res!425932 () Bool)

(assert (=> b!656761 (=> res!425932 e!377227)))

(declare-fun lt!306564 () SeekEntryResult!6940)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!656761 (= res!425932 (not (= lt!306564 (MissingVacant!6940 vacantSpotIndex!68))))))

(declare-fun lt!306558 () Unit!22623)

(declare-fun e!377237 () Unit!22623)

(assert (=> b!656761 (= lt!306558 e!377237)))

(declare-fun c!75789 () Bool)

(assert (=> b!656761 (= c!75789 (= lt!306564 (Found!6940 index!984)))))

(declare-fun lt!306574 () Unit!22623)

(assert (=> b!656761 (= lt!306574 e!377236)))

(declare-fun c!75788 () Bool)

(assert (=> b!656761 (= c!75788 (= lt!306564 Undefined!6940))))

(declare-fun lt!306565 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38697 (_ BitVec 32)) SeekEntryResult!6940)

(assert (=> b!656761 (= lt!306564 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306565 lt!306572 mask!3053))))

(assert (=> b!656761 e!377233))

(declare-fun res!425919 () Bool)

(assert (=> b!656761 (=> (not res!425919) (not e!377233))))

(declare-fun lt!306570 () (_ BitVec 32))

(assert (=> b!656761 (= res!425919 (= lt!306567 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306570 vacantSpotIndex!68 lt!306565 lt!306572 mask!3053)))))

(assert (=> b!656761 (= lt!306567 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306570 vacantSpotIndex!68 (select (arr!18544 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!656761 (= lt!306565 (select (store (arr!18544 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!306575 () Unit!22623)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22623)

(assert (=> b!656761 (= lt!306575 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306570 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!656761 (= lt!306570 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!656762 () Bool)

(declare-fun res!425929 () Bool)

(assert (=> b!656762 (=> (not res!425929) (not e!377228))))

(assert (=> b!656762 (= res!425929 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!656763 () Bool)

(assert (=> b!656763 (= e!377228 e!377238)))

(declare-fun res!425926 () Bool)

(assert (=> b!656763 (=> (not res!425926) (not e!377238))))

(declare-fun lt!306566 () SeekEntryResult!6940)

(assert (=> b!656763 (= res!425926 (or (= lt!306566 (MissingZero!6940 i!1108)) (= lt!306566 (MissingVacant!6940 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38697 (_ BitVec 32)) SeekEntryResult!6940)

(assert (=> b!656763 (= lt!306566 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!656765 () Bool)

(declare-fun res!425916 () Bool)

(assert (=> b!656765 (= res!425916 (bvsge j!136 index!984))))

(assert (=> b!656765 (=> res!425916 e!377229)))

(declare-fun e!377225 () Bool)

(assert (=> b!656765 (= e!377225 e!377229)))

(declare-fun b!656766 () Bool)

(assert (=> b!656766 false))

(declare-fun lt!306561 () Unit!22623)

(assert (=> b!656766 (= lt!306561 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306572 (select (arr!18544 a!2986) j!136) index!984 Nil!12489))))

(assert (=> b!656766 (arrayNoDuplicates!0 lt!306572 index!984 Nil!12489)))

(declare-fun lt!306573 () Unit!22623)

(assert (=> b!656766 (= lt!306573 (lemmaNoDuplicateFromThenFromBigger!0 lt!306572 #b00000000000000000000000000000000 index!984))))

(assert (=> b!656766 (arrayNoDuplicates!0 lt!306572 #b00000000000000000000000000000000 Nil!12489)))

(declare-fun lt!306576 () Unit!22623)

(assert (=> b!656766 (= lt!306576 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12489))))

(assert (=> b!656766 (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306560 () Unit!22623)

(assert (=> b!656766 (= lt!306560 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306572 (select (arr!18544 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!377235 () Bool)

(assert (=> b!656766 e!377235))

(declare-fun res!425918 () Bool)

(assert (=> b!656766 (=> (not res!425918) (not e!377235))))

(assert (=> b!656766 (= res!425918 (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) j!136))))

(declare-fun e!377232 () Unit!22623)

(declare-fun Unit!22627 () Unit!22623)

(assert (=> b!656766 (= e!377232 Unit!22627)))

(declare-fun b!656767 () Bool)

(declare-fun Unit!22628 () Unit!22623)

(assert (=> b!656767 (= e!377224 Unit!22628)))

(declare-fun b!656768 () Bool)

(declare-fun Unit!22629 () Unit!22623)

(assert (=> b!656768 (= e!377236 Unit!22629)))

(declare-fun b!656769 () Bool)

(assert (=> b!656769 (= e!377226 (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) index!984))))

(declare-fun b!656770 () Bool)

(declare-fun Unit!22630 () Unit!22623)

(assert (=> b!656770 (= e!377232 Unit!22630)))

(declare-fun b!656771 () Bool)

(declare-fun res!425924 () Bool)

(assert (=> b!656771 (=> (not res!425924) (not e!377238))))

(assert (=> b!656771 (= res!425924 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12489))))

(declare-fun b!656772 () Bool)

(declare-fun Unit!22631 () Unit!22623)

(assert (=> b!656772 (= e!377237 Unit!22631)))

(declare-fun b!656773 () Bool)

(assert (=> b!656773 (= e!377227 false)))

(assert (=> b!656773 (= (select (store (arr!18544 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!656774 () Bool)

(assert (=> b!656774 (= e!377235 (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) index!984))))

(declare-fun b!656775 () Bool)

(declare-fun res!425925 () Bool)

(assert (=> b!656775 (=> (not res!425925) (not e!377228))))

(assert (=> b!656775 (= res!425925 (and (= (size!18908 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18908 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18908 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!656776 () Bool)

(declare-fun e!377230 () Bool)

(assert (=> b!656776 (= e!377230 e!377231)))

(declare-fun res!425928 () Bool)

(assert (=> b!656776 (=> (not res!425928) (not e!377231))))

(assert (=> b!656776 (= res!425928 (and (= lt!306571 (Found!6940 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18544 a!2986) index!984) (select (arr!18544 a!2986) j!136))) (not (= (select (arr!18544 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!656776 (= lt!306571 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18544 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!656777 () Bool)

(declare-fun Unit!22632 () Unit!22623)

(assert (=> b!656777 (= e!377237 Unit!22632)))

(declare-fun res!425927 () Bool)

(assert (=> b!656777 (= res!425927 (= (select (store (arr!18544 a!2986) i!1108 k0!1786) index!984) (select (arr!18544 a!2986) j!136)))))

(assert (=> b!656777 (=> (not res!425927) (not e!377225))))

(assert (=> b!656777 e!377225))

(declare-fun c!75790 () Bool)

(assert (=> b!656777 (= c!75790 (bvslt j!136 index!984))))

(declare-fun lt!306562 () Unit!22623)

(assert (=> b!656777 (= lt!306562 e!377224)))

(declare-fun c!75791 () Bool)

(assert (=> b!656777 (= c!75791 (bvslt index!984 j!136))))

(declare-fun lt!306563 () Unit!22623)

(assert (=> b!656777 (= lt!306563 e!377232)))

(assert (=> b!656777 false))

(declare-fun b!656764 () Bool)

(declare-fun res!425917 () Bool)

(assert (=> b!656764 (=> (not res!425917) (not e!377238))))

(assert (=> b!656764 (= res!425917 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18544 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!425921 () Bool)

(assert (=> start!59520 (=> (not res!425921) (not e!377228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59520 (= res!425921 (validMask!0 mask!3053))))

(assert (=> start!59520 e!377228))

(assert (=> start!59520 true))

(declare-fun array_inv!14403 (array!38697) Bool)

(assert (=> start!59520 (array_inv!14403 a!2986)))

(declare-fun b!656778 () Bool)

(assert (=> b!656778 (= e!377238 e!377230)))

(declare-fun res!425920 () Bool)

(assert (=> b!656778 (=> (not res!425920) (not e!377230))))

(assert (=> b!656778 (= res!425920 (= (select (store (arr!18544 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!656778 (= lt!306572 (array!38698 (store (arr!18544 a!2986) i!1108 k0!1786) (size!18908 a!2986)))))

(declare-fun b!656779 () Bool)

(declare-fun res!425931 () Bool)

(assert (=> b!656779 (=> (not res!425931) (not e!377228))))

(assert (=> b!656779 (= res!425931 (validKeyInArray!0 k0!1786))))

(assert (= (and start!59520 res!425921) b!656775))

(assert (= (and b!656775 res!425925) b!656759))

(assert (= (and b!656759 res!425922) b!656779))

(assert (= (and b!656779 res!425931) b!656762))

(assert (= (and b!656762 res!425929) b!656763))

(assert (= (and b!656763 res!425926) b!656758))

(assert (= (and b!656758 res!425930) b!656771))

(assert (= (and b!656771 res!425924) b!656764))

(assert (= (and b!656764 res!425917) b!656778))

(assert (= (and b!656778 res!425920) b!656776))

(assert (= (and b!656776 res!425928) b!656761))

(assert (= (and b!656761 res!425919) b!656757))

(assert (= (and b!656761 c!75788) b!656756))

(assert (= (and b!656761 (not c!75788)) b!656768))

(assert (= (and b!656761 c!75789) b!656777))

(assert (= (and b!656761 (not c!75789)) b!656772))

(assert (= (and b!656777 res!425927) b!656765))

(assert (= (and b!656765 (not res!425916)) b!656755))

(assert (= (and b!656755 res!425923) b!656769))

(assert (= (and b!656777 c!75790) b!656760))

(assert (= (and b!656777 (not c!75790)) b!656767))

(assert (= (and b!656777 c!75791) b!656766))

(assert (= (and b!656777 (not c!75791)) b!656770))

(assert (= (and b!656766 res!425918) b!656774))

(assert (= (and b!656761 (not res!425932)) b!656773))

(declare-fun m!630283 () Bool)

(assert (=> b!656778 m!630283))

(declare-fun m!630285 () Bool)

(assert (=> b!656778 m!630285))

(declare-fun m!630287 () Bool)

(assert (=> b!656759 m!630287))

(assert (=> b!656759 m!630287))

(declare-fun m!630289 () Bool)

(assert (=> b!656759 m!630289))

(declare-fun m!630291 () Bool)

(assert (=> b!656779 m!630291))

(assert (=> b!656774 m!630287))

(assert (=> b!656774 m!630287))

(declare-fun m!630293 () Bool)

(assert (=> b!656774 m!630293))

(declare-fun m!630295 () Bool)

(assert (=> b!656764 m!630295))

(assert (=> b!656755 m!630287))

(assert (=> b!656755 m!630287))

(declare-fun m!630297 () Bool)

(assert (=> b!656755 m!630297))

(assert (=> b!656760 m!630287))

(declare-fun m!630299 () Bool)

(assert (=> b!656760 m!630299))

(declare-fun m!630301 () Bool)

(assert (=> b!656760 m!630301))

(assert (=> b!656760 m!630287))

(declare-fun m!630303 () Bool)

(assert (=> b!656760 m!630303))

(assert (=> b!656760 m!630287))

(declare-fun m!630305 () Bool)

(assert (=> b!656760 m!630305))

(declare-fun m!630307 () Bool)

(assert (=> b!656760 m!630307))

(assert (=> b!656760 m!630287))

(declare-fun m!630309 () Bool)

(assert (=> b!656760 m!630309))

(declare-fun m!630311 () Bool)

(assert (=> b!656760 m!630311))

(assert (=> b!656773 m!630283))

(declare-fun m!630313 () Bool)

(assert (=> b!656773 m!630313))

(declare-fun m!630315 () Bool)

(assert (=> b!656762 m!630315))

(declare-fun m!630317 () Bool)

(assert (=> b!656758 m!630317))

(declare-fun m!630319 () Bool)

(assert (=> b!656771 m!630319))

(declare-fun m!630321 () Bool)

(assert (=> b!656761 m!630321))

(declare-fun m!630323 () Bool)

(assert (=> b!656761 m!630323))

(assert (=> b!656761 m!630287))

(declare-fun m!630325 () Bool)

(assert (=> b!656761 m!630325))

(assert (=> b!656761 m!630283))

(assert (=> b!656761 m!630287))

(declare-fun m!630327 () Bool)

(assert (=> b!656761 m!630327))

(declare-fun m!630329 () Bool)

(assert (=> b!656761 m!630329))

(declare-fun m!630331 () Bool)

(assert (=> b!656761 m!630331))

(declare-fun m!630333 () Bool)

(assert (=> b!656776 m!630333))

(assert (=> b!656776 m!630287))

(assert (=> b!656776 m!630287))

(declare-fun m!630335 () Bool)

(assert (=> b!656776 m!630335))

(declare-fun m!630337 () Bool)

(assert (=> b!656763 m!630337))

(declare-fun m!630339 () Bool)

(assert (=> start!59520 m!630339))

(declare-fun m!630341 () Bool)

(assert (=> start!59520 m!630341))

(declare-fun m!630343 () Bool)

(assert (=> b!656766 m!630343))

(assert (=> b!656766 m!630311))

(assert (=> b!656766 m!630287))

(assert (=> b!656766 m!630287))

(declare-fun m!630345 () Bool)

(assert (=> b!656766 m!630345))

(assert (=> b!656766 m!630287))

(declare-fun m!630347 () Bool)

(assert (=> b!656766 m!630347))

(declare-fun m!630349 () Bool)

(assert (=> b!656766 m!630349))

(assert (=> b!656766 m!630287))

(assert (=> b!656766 m!630297))

(assert (=> b!656766 m!630287))

(declare-fun m!630351 () Bool)

(assert (=> b!656766 m!630351))

(assert (=> b!656766 m!630307))

(assert (=> b!656777 m!630283))

(assert (=> b!656777 m!630313))

(assert (=> b!656777 m!630287))

(assert (=> b!656769 m!630287))

(assert (=> b!656769 m!630287))

(assert (=> b!656769 m!630293))

(check-sat (not b!656766) (not b!656771) (not b!656758) (not b!656762) (not b!656755) (not b!656761) (not b!656760) (not b!656776) (not b!656759) (not b!656763) (not b!656769) (not b!656774) (not b!656779) (not start!59520))
(check-sat)
(get-model)

(declare-fun b!656938 () Bool)

(declare-fun e!377337 () Bool)

(declare-fun e!377336 () Bool)

(assert (=> b!656938 (= e!377337 e!377336)))

(declare-fun c!75818 () Bool)

(assert (=> b!656938 (= c!75818 (validKeyInArray!0 (select (arr!18544 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!656939 () Bool)

(declare-fun e!377335 () Bool)

(assert (=> b!656939 (= e!377336 e!377335)))

(declare-fun lt!306706 () (_ BitVec 64))

(assert (=> b!656939 (= lt!306706 (select (arr!18544 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!306704 () Unit!22623)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38697 (_ BitVec 64) (_ BitVec 32)) Unit!22623)

(assert (=> b!656939 (= lt!306704 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!306706 #b00000000000000000000000000000000))))

(assert (=> b!656939 (arrayContainsKey!0 a!2986 lt!306706 #b00000000000000000000000000000000)))

(declare-fun lt!306705 () Unit!22623)

(assert (=> b!656939 (= lt!306705 lt!306704)))

(declare-fun res!426040 () Bool)

(assert (=> b!656939 (= res!426040 (= (seekEntryOrOpen!0 (select (arr!18544 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6940 #b00000000000000000000000000000000)))))

(assert (=> b!656939 (=> (not res!426040) (not e!377335))))

(declare-fun b!656940 () Bool)

(declare-fun call!33870 () Bool)

(assert (=> b!656940 (= e!377336 call!33870)))

(declare-fun bm!33867 () Bool)

(assert (=> bm!33867 (= call!33870 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!92885 () Bool)

(declare-fun res!426039 () Bool)

(assert (=> d!92885 (=> res!426039 e!377337)))

(assert (=> d!92885 (= res!426039 (bvsge #b00000000000000000000000000000000 (size!18908 a!2986)))))

(assert (=> d!92885 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!377337)))

(declare-fun b!656941 () Bool)

(assert (=> b!656941 (= e!377335 call!33870)))

(assert (= (and d!92885 (not res!426039)) b!656938))

(assert (= (and b!656938 c!75818) b!656939))

(assert (= (and b!656938 (not c!75818)) b!656940))

(assert (= (and b!656939 res!426040) b!656941))

(assert (= (or b!656941 b!656940) bm!33867))

(declare-fun m!630493 () Bool)

(assert (=> b!656938 m!630493))

(assert (=> b!656938 m!630493))

(declare-fun m!630495 () Bool)

(assert (=> b!656938 m!630495))

(assert (=> b!656939 m!630493))

(declare-fun m!630497 () Bool)

(assert (=> b!656939 m!630497))

(declare-fun m!630499 () Bool)

(assert (=> b!656939 m!630499))

(assert (=> b!656939 m!630493))

(declare-fun m!630501 () Bool)

(assert (=> b!656939 m!630501))

(declare-fun m!630503 () Bool)

(assert (=> bm!33867 m!630503))

(assert (=> b!656758 d!92885))

(declare-fun d!92887 () Bool)

(assert (=> d!92887 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!656779 d!92887))

(declare-fun d!92889 () Bool)

(declare-fun res!426045 () Bool)

(declare-fun e!377342 () Bool)

(assert (=> d!92889 (=> res!426045 e!377342)))

(assert (=> d!92889 (= res!426045 (= (select (arr!18544 lt!306572) index!984) (select (arr!18544 a!2986) j!136)))))

(assert (=> d!92889 (= (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) index!984) e!377342)))

(declare-fun b!656946 () Bool)

(declare-fun e!377343 () Bool)

(assert (=> b!656946 (= e!377342 e!377343)))

(declare-fun res!426046 () Bool)

(assert (=> b!656946 (=> (not res!426046) (not e!377343))))

(assert (=> b!656946 (= res!426046 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18908 lt!306572)))))

(declare-fun b!656947 () Bool)

(assert (=> b!656947 (= e!377343 (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92889 (not res!426045)) b!656946))

(assert (= (and b!656946 res!426046) b!656947))

(declare-fun m!630505 () Bool)

(assert (=> d!92889 m!630505))

(assert (=> b!656947 m!630287))

(declare-fun m!630507 () Bool)

(assert (=> b!656947 m!630507))

(assert (=> b!656769 d!92889))

(declare-fun d!92891 () Bool)

(assert (=> d!92891 (= (validKeyInArray!0 (select (arr!18544 a!2986) j!136)) (and (not (= (select (arr!18544 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18544 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!656759 d!92891))

(declare-fun d!92893 () Bool)

(assert (=> d!92893 (arrayNoDuplicates!0 lt!306572 j!136 Nil!12489)))

(declare-fun lt!306709 () Unit!22623)

(declare-fun choose!39 (array!38697 (_ BitVec 32) (_ BitVec 32)) Unit!22623)

(assert (=> d!92893 (= lt!306709 (choose!39 lt!306572 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92893 (bvslt (size!18908 lt!306572) #b01111111111111111111111111111111)))

(assert (=> d!92893 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!306572 #b00000000000000000000000000000000 j!136) lt!306709)))

(declare-fun bs!19568 () Bool)

(assert (= bs!19568 d!92893))

(assert (=> bs!19568 m!630301))

(declare-fun m!630509 () Bool)

(assert (=> bs!19568 m!630509))

(assert (=> b!656760 d!92893))

(declare-fun b!656958 () Bool)

(declare-fun e!377354 () Bool)

(declare-fun e!377352 () Bool)

(assert (=> b!656958 (= e!377354 e!377352)))

(declare-fun res!426053 () Bool)

(assert (=> b!656958 (=> (not res!426053) (not e!377352))))

(declare-fun e!377353 () Bool)

(assert (=> b!656958 (= res!426053 (not e!377353))))

(declare-fun res!426054 () Bool)

(assert (=> b!656958 (=> (not res!426054) (not e!377353))))

(assert (=> b!656958 (= res!426054 (validKeyInArray!0 (select (arr!18544 lt!306572) j!136)))))

(declare-fun b!656959 () Bool)

(declare-fun e!377355 () Bool)

(declare-fun call!33873 () Bool)

(assert (=> b!656959 (= e!377355 call!33873)))

(declare-fun c!75821 () Bool)

(declare-fun bm!33870 () Bool)

(assert (=> bm!33870 (= call!33873 (arrayNoDuplicates!0 lt!306572 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75821 (Cons!12488 (select (arr!18544 lt!306572) j!136) Nil!12489) Nil!12489)))))

(declare-fun b!656961 () Bool)

(assert (=> b!656961 (= e!377355 call!33873)))

(declare-fun b!656962 () Bool)

(assert (=> b!656962 (= e!377352 e!377355)))

(assert (=> b!656962 (= c!75821 (validKeyInArray!0 (select (arr!18544 lt!306572) j!136)))))

(declare-fun d!92895 () Bool)

(declare-fun res!426055 () Bool)

(assert (=> d!92895 (=> res!426055 e!377354)))

(assert (=> d!92895 (= res!426055 (bvsge j!136 (size!18908 lt!306572)))))

(assert (=> d!92895 (= (arrayNoDuplicates!0 lt!306572 j!136 Nil!12489) e!377354)))

(declare-fun b!656960 () Bool)

(declare-fun contains!3171 (List!12492 (_ BitVec 64)) Bool)

(assert (=> b!656960 (= e!377353 (contains!3171 Nil!12489 (select (arr!18544 lt!306572) j!136)))))

(assert (= (and d!92895 (not res!426055)) b!656958))

(assert (= (and b!656958 res!426054) b!656960))

(assert (= (and b!656958 res!426053) b!656962))

(assert (= (and b!656962 c!75821) b!656961))

(assert (= (and b!656962 (not c!75821)) b!656959))

(assert (= (or b!656961 b!656959) bm!33870))

(declare-fun m!630511 () Bool)

(assert (=> b!656958 m!630511))

(assert (=> b!656958 m!630511))

(declare-fun m!630513 () Bool)

(assert (=> b!656958 m!630513))

(assert (=> bm!33870 m!630511))

(declare-fun m!630515 () Bool)

(assert (=> bm!33870 m!630515))

(assert (=> b!656962 m!630511))

(assert (=> b!656962 m!630511))

(assert (=> b!656962 m!630513))

(assert (=> b!656960 m!630511))

(assert (=> b!656960 m!630511))

(declare-fun m!630517 () Bool)

(assert (=> b!656960 m!630517))

(assert (=> b!656760 d!92895))

(declare-fun d!92897 () Bool)

(assert (=> d!92897 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18908 lt!306572)) (not (= (select (arr!18544 lt!306572) j!136) (select (arr!18544 a!2986) j!136))))))

(declare-fun lt!306712 () Unit!22623)

(declare-fun choose!21 (array!38697 (_ BitVec 64) (_ BitVec 32) List!12492) Unit!22623)

(assert (=> d!92897 (= lt!306712 (choose!21 lt!306572 (select (arr!18544 a!2986) j!136) j!136 Nil!12489))))

(assert (=> d!92897 (bvslt (size!18908 lt!306572) #b01111111111111111111111111111111)))

(assert (=> d!92897 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306572 (select (arr!18544 a!2986) j!136) j!136 Nil!12489) lt!306712)))

(declare-fun bs!19569 () Bool)

(assert (= bs!19569 d!92897))

(assert (=> bs!19569 m!630511))

(assert (=> bs!19569 m!630287))

(declare-fun m!630519 () Bool)

(assert (=> bs!19569 m!630519))

(assert (=> b!656760 d!92897))

(declare-fun d!92899 () Bool)

(declare-fun res!426056 () Bool)

(declare-fun e!377356 () Bool)

(assert (=> d!92899 (=> res!426056 e!377356)))

(assert (=> d!92899 (= res!426056 (= (select (arr!18544 lt!306572) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18544 a!2986) j!136)))))

(assert (=> d!92899 (= (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!377356)))

(declare-fun b!656963 () Bool)

(declare-fun e!377357 () Bool)

(assert (=> b!656963 (= e!377356 e!377357)))

(declare-fun res!426057 () Bool)

(assert (=> b!656963 (=> (not res!426057) (not e!377357))))

(assert (=> b!656963 (= res!426057 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18908 lt!306572)))))

(declare-fun b!656964 () Bool)

(assert (=> b!656964 (= e!377357 (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92899 (not res!426056)) b!656963))

(assert (= (and b!656963 res!426057) b!656964))

(declare-fun m!630521 () Bool)

(assert (=> d!92899 m!630521))

(assert (=> b!656964 m!630287))

(declare-fun m!630523 () Bool)

(assert (=> b!656964 m!630523))

(assert (=> b!656760 d!92899))

(declare-fun d!92901 () Bool)

(assert (=> d!92901 (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!306715 () Unit!22623)

(declare-fun choose!114 (array!38697 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22623)

(assert (=> d!92901 (= lt!306715 (choose!114 lt!306572 (select (arr!18544 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92901 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92901 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306572 (select (arr!18544 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!306715)))

(declare-fun bs!19570 () Bool)

(assert (= bs!19570 d!92901))

(assert (=> bs!19570 m!630287))

(assert (=> bs!19570 m!630303))

(assert (=> bs!19570 m!630287))

(declare-fun m!630525 () Bool)

(assert (=> bs!19570 m!630525))

(assert (=> b!656760 d!92901))

(declare-fun b!656965 () Bool)

(declare-fun e!377360 () Bool)

(declare-fun e!377358 () Bool)

(assert (=> b!656965 (= e!377360 e!377358)))

(declare-fun res!426058 () Bool)

(assert (=> b!656965 (=> (not res!426058) (not e!377358))))

(declare-fun e!377359 () Bool)

(assert (=> b!656965 (= res!426058 (not e!377359))))

(declare-fun res!426059 () Bool)

(assert (=> b!656965 (=> (not res!426059) (not e!377359))))

(assert (=> b!656965 (= res!426059 (validKeyInArray!0 (select (arr!18544 lt!306572) #b00000000000000000000000000000000)))))

(declare-fun b!656966 () Bool)

(declare-fun e!377361 () Bool)

(declare-fun call!33874 () Bool)

(assert (=> b!656966 (= e!377361 call!33874)))

(declare-fun bm!33871 () Bool)

(declare-fun c!75822 () Bool)

(assert (=> bm!33871 (= call!33874 (arrayNoDuplicates!0 lt!306572 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75822 (Cons!12488 (select (arr!18544 lt!306572) #b00000000000000000000000000000000) Nil!12489) Nil!12489)))))

(declare-fun b!656968 () Bool)

(assert (=> b!656968 (= e!377361 call!33874)))

(declare-fun b!656969 () Bool)

(assert (=> b!656969 (= e!377358 e!377361)))

(assert (=> b!656969 (= c!75822 (validKeyInArray!0 (select (arr!18544 lt!306572) #b00000000000000000000000000000000)))))

(declare-fun d!92903 () Bool)

(declare-fun res!426060 () Bool)

(assert (=> d!92903 (=> res!426060 e!377360)))

(assert (=> d!92903 (= res!426060 (bvsge #b00000000000000000000000000000000 (size!18908 lt!306572)))))

(assert (=> d!92903 (= (arrayNoDuplicates!0 lt!306572 #b00000000000000000000000000000000 Nil!12489) e!377360)))

(declare-fun b!656967 () Bool)

(assert (=> b!656967 (= e!377359 (contains!3171 Nil!12489 (select (arr!18544 lt!306572) #b00000000000000000000000000000000)))))

(assert (= (and d!92903 (not res!426060)) b!656965))

(assert (= (and b!656965 res!426059) b!656967))

(assert (= (and b!656965 res!426058) b!656969))

(assert (= (and b!656969 c!75822) b!656968))

(assert (= (and b!656969 (not c!75822)) b!656966))

(assert (= (or b!656968 b!656966) bm!33871))

(declare-fun m!630527 () Bool)

(assert (=> b!656965 m!630527))

(assert (=> b!656965 m!630527))

(declare-fun m!630529 () Bool)

(assert (=> b!656965 m!630529))

(assert (=> bm!33871 m!630527))

(declare-fun m!630531 () Bool)

(assert (=> bm!33871 m!630531))

(assert (=> b!656969 m!630527))

(assert (=> b!656969 m!630527))

(assert (=> b!656969 m!630529))

(assert (=> b!656967 m!630527))

(assert (=> b!656967 m!630527))

(declare-fun m!630533 () Bool)

(assert (=> b!656967 m!630533))

(assert (=> b!656760 d!92903))

(declare-fun d!92905 () Bool)

(declare-fun e!377364 () Bool)

(assert (=> d!92905 e!377364))

(declare-fun res!426063 () Bool)

(assert (=> d!92905 (=> (not res!426063) (not e!377364))))

(assert (=> d!92905 (= res!426063 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18908 a!2986))))))

(declare-fun lt!306718 () Unit!22623)

(declare-fun choose!41 (array!38697 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12492) Unit!22623)

(assert (=> d!92905 (= lt!306718 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12489))))

(assert (=> d!92905 (bvslt (size!18908 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92905 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12489) lt!306718)))

(declare-fun b!656972 () Bool)

(assert (=> b!656972 (= e!377364 (arrayNoDuplicates!0 (array!38698 (store (arr!18544 a!2986) i!1108 k0!1786) (size!18908 a!2986)) #b00000000000000000000000000000000 Nil!12489))))

(assert (= (and d!92905 res!426063) b!656972))

(declare-fun m!630535 () Bool)

(assert (=> d!92905 m!630535))

(assert (=> b!656972 m!630283))

(declare-fun m!630537 () Bool)

(assert (=> b!656972 m!630537))

(assert (=> b!656760 d!92905))

(declare-fun d!92907 () Bool)

(assert (=> d!92907 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59520 d!92907))

(declare-fun d!92911 () Bool)

(assert (=> d!92911 (= (array_inv!14403 a!2986) (bvsge (size!18908 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59520 d!92911))

(declare-fun d!92913 () Bool)

(declare-fun res!426064 () Bool)

(declare-fun e!377365 () Bool)

(assert (=> d!92913 (=> res!426064 e!377365)))

(assert (=> d!92913 (= res!426064 (= (select (arr!18544 lt!306572) j!136) (select (arr!18544 a!2986) j!136)))))

(assert (=> d!92913 (= (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) j!136) e!377365)))

(declare-fun b!656973 () Bool)

(declare-fun e!377366 () Bool)

(assert (=> b!656973 (= e!377365 e!377366)))

(declare-fun res!426065 () Bool)

(assert (=> b!656973 (=> (not res!426065) (not e!377366))))

(assert (=> b!656973 (= res!426065 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18908 lt!306572)))))

(declare-fun b!656974 () Bool)

(assert (=> b!656974 (= e!377366 (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92913 (not res!426064)) b!656973))

(assert (= (and b!656973 res!426065) b!656974))

(assert (=> d!92913 m!630511))

(assert (=> b!656974 m!630287))

(declare-fun m!630539 () Bool)

(assert (=> b!656974 m!630539))

(assert (=> b!656766 d!92913))

(declare-fun b!656975 () Bool)

(declare-fun e!377369 () Bool)

(declare-fun e!377367 () Bool)

(assert (=> b!656975 (= e!377369 e!377367)))

(declare-fun res!426066 () Bool)

(assert (=> b!656975 (=> (not res!426066) (not e!377367))))

(declare-fun e!377368 () Bool)

(assert (=> b!656975 (= res!426066 (not e!377368))))

(declare-fun res!426067 () Bool)

(assert (=> b!656975 (=> (not res!426067) (not e!377368))))

(assert (=> b!656975 (= res!426067 (validKeyInArray!0 (select (arr!18544 lt!306572) index!984)))))

(declare-fun b!656976 () Bool)

(declare-fun e!377370 () Bool)

(declare-fun call!33875 () Bool)

(assert (=> b!656976 (= e!377370 call!33875)))

(declare-fun bm!33872 () Bool)

(declare-fun c!75823 () Bool)

(assert (=> bm!33872 (= call!33875 (arrayNoDuplicates!0 lt!306572 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75823 (Cons!12488 (select (arr!18544 lt!306572) index!984) Nil!12489) Nil!12489)))))

(declare-fun b!656978 () Bool)

(assert (=> b!656978 (= e!377370 call!33875)))

(declare-fun b!656979 () Bool)

(assert (=> b!656979 (= e!377367 e!377370)))

(assert (=> b!656979 (= c!75823 (validKeyInArray!0 (select (arr!18544 lt!306572) index!984)))))

(declare-fun d!92915 () Bool)

(declare-fun res!426068 () Bool)

(assert (=> d!92915 (=> res!426068 e!377369)))

(assert (=> d!92915 (= res!426068 (bvsge index!984 (size!18908 lt!306572)))))

(assert (=> d!92915 (= (arrayNoDuplicates!0 lt!306572 index!984 Nil!12489) e!377369)))

(declare-fun b!656977 () Bool)

(assert (=> b!656977 (= e!377368 (contains!3171 Nil!12489 (select (arr!18544 lt!306572) index!984)))))

(assert (= (and d!92915 (not res!426068)) b!656975))

(assert (= (and b!656975 res!426067) b!656977))

(assert (= (and b!656975 res!426066) b!656979))

(assert (= (and b!656979 c!75823) b!656978))

(assert (= (and b!656979 (not c!75823)) b!656976))

(assert (= (or b!656978 b!656976) bm!33872))

(assert (=> b!656975 m!630505))

(assert (=> b!656975 m!630505))

(declare-fun m!630541 () Bool)

(assert (=> b!656975 m!630541))

(assert (=> bm!33872 m!630505))

(declare-fun m!630543 () Bool)

(assert (=> bm!33872 m!630543))

(assert (=> b!656979 m!630505))

(assert (=> b!656979 m!630505))

(assert (=> b!656979 m!630541))

(assert (=> b!656977 m!630505))

(assert (=> b!656977 m!630505))

(declare-fun m!630545 () Bool)

(assert (=> b!656977 m!630545))

(assert (=> b!656766 d!92915))

(assert (=> b!656766 d!92903))

(assert (=> b!656766 d!92905))

(declare-fun d!92917 () Bool)

(assert (=> d!92917 (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!306719 () Unit!22623)

(assert (=> d!92917 (= lt!306719 (choose!114 lt!306572 (select (arr!18544 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92917 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92917 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!306572 (select (arr!18544 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!306719)))

(declare-fun bs!19571 () Bool)

(assert (= bs!19571 d!92917))

(assert (=> bs!19571 m!630287))

(assert (=> bs!19571 m!630345))

(assert (=> bs!19571 m!630287))

(declare-fun m!630547 () Bool)

(assert (=> bs!19571 m!630547))

(assert (=> b!656766 d!92917))

(declare-fun d!92919 () Bool)

(declare-fun res!426069 () Bool)

(declare-fun e!377371 () Bool)

(assert (=> d!92919 (=> res!426069 e!377371)))

(assert (=> d!92919 (= res!426069 (= (select (arr!18544 lt!306572) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18544 a!2986) j!136)))))

(assert (=> d!92919 (= (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!377371)))

(declare-fun b!656980 () Bool)

(declare-fun e!377372 () Bool)

(assert (=> b!656980 (= e!377371 e!377372)))

(declare-fun res!426070 () Bool)

(assert (=> b!656980 (=> (not res!426070) (not e!377372))))

(assert (=> b!656980 (= res!426070 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18908 lt!306572)))))

(declare-fun b!656981 () Bool)

(assert (=> b!656981 (= e!377372 (arrayContainsKey!0 lt!306572 (select (arr!18544 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92919 (not res!426069)) b!656980))

(assert (= (and b!656980 res!426070) b!656981))

(declare-fun m!630549 () Bool)

(assert (=> d!92919 m!630549))

(assert (=> b!656981 m!630287))

(declare-fun m!630551 () Bool)

(assert (=> b!656981 m!630551))

(assert (=> b!656766 d!92919))

(declare-fun d!92921 () Bool)

(assert (=> d!92921 (arrayNoDuplicates!0 lt!306572 index!984 Nil!12489)))

(declare-fun lt!306720 () Unit!22623)

(assert (=> d!92921 (= lt!306720 (choose!39 lt!306572 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92921 (bvslt (size!18908 lt!306572) #b01111111111111111111111111111111)))

(assert (=> d!92921 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!306572 #b00000000000000000000000000000000 index!984) lt!306720)))

(declare-fun bs!19572 () Bool)

(assert (= bs!19572 d!92921))

(assert (=> bs!19572 m!630343))

(declare-fun m!630553 () Bool)

(assert (=> bs!19572 m!630553))

(assert (=> b!656766 d!92921))

(declare-fun d!92923 () Bool)

(assert (=> d!92923 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (size!18908 lt!306572)) (not (= (select (arr!18544 lt!306572) index!984) (select (arr!18544 a!2986) j!136))))))

(declare-fun lt!306721 () Unit!22623)

(assert (=> d!92923 (= lt!306721 (choose!21 lt!306572 (select (arr!18544 a!2986) j!136) index!984 Nil!12489))))

(assert (=> d!92923 (bvslt (size!18908 lt!306572) #b01111111111111111111111111111111)))

(assert (=> d!92923 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!306572 (select (arr!18544 a!2986) j!136) index!984 Nil!12489) lt!306721)))

(declare-fun bs!19573 () Bool)

(assert (= bs!19573 d!92923))

(assert (=> bs!19573 m!630505))

(assert (=> bs!19573 m!630287))

(declare-fun m!630555 () Bool)

(assert (=> bs!19573 m!630555))

(assert (=> b!656766 d!92923))

(assert (=> b!656755 d!92913))

(assert (=> b!656774 d!92889))

(declare-fun lt!306735 () SeekEntryResult!6940)

(declare-fun b!657021 () Bool)

(declare-fun e!377401 () SeekEntryResult!6940)

(assert (=> b!657021 (= e!377401 (seekKeyOrZeroReturnVacant!0 (x!59065 lt!306735) (index!30124 lt!306735) (index!30124 lt!306735) k0!1786 a!2986 mask!3053))))

(declare-fun b!657022 () Bool)

(declare-fun c!75836 () Bool)

(declare-fun lt!306736 () (_ BitVec 64))

(assert (=> b!657022 (= c!75836 (= lt!306736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!377402 () SeekEntryResult!6940)

(assert (=> b!657022 (= e!377402 e!377401)))

(declare-fun b!657023 () Bool)

(assert (=> b!657023 (= e!377402 (Found!6940 (index!30124 lt!306735)))))

(declare-fun b!657024 () Bool)

(declare-fun e!377403 () SeekEntryResult!6940)

(assert (=> b!657024 (= e!377403 e!377402)))

(assert (=> b!657024 (= lt!306736 (select (arr!18544 a!2986) (index!30124 lt!306735)))))

(declare-fun c!75837 () Bool)

(assert (=> b!657024 (= c!75837 (= lt!306736 k0!1786))))

(declare-fun b!657025 () Bool)

(assert (=> b!657025 (= e!377401 (MissingZero!6940 (index!30124 lt!306735)))))

(declare-fun b!657026 () Bool)

(assert (=> b!657026 (= e!377403 Undefined!6940)))

(declare-fun d!92925 () Bool)

(declare-fun lt!306734 () SeekEntryResult!6940)

(get-info :version)

(assert (=> d!92925 (and (or ((_ is Undefined!6940) lt!306734) (not ((_ is Found!6940) lt!306734)) (and (bvsge (index!30123 lt!306734) #b00000000000000000000000000000000) (bvslt (index!30123 lt!306734) (size!18908 a!2986)))) (or ((_ is Undefined!6940) lt!306734) ((_ is Found!6940) lt!306734) (not ((_ is MissingZero!6940) lt!306734)) (and (bvsge (index!30122 lt!306734) #b00000000000000000000000000000000) (bvslt (index!30122 lt!306734) (size!18908 a!2986)))) (or ((_ is Undefined!6940) lt!306734) ((_ is Found!6940) lt!306734) ((_ is MissingZero!6940) lt!306734) (not ((_ is MissingVacant!6940) lt!306734)) (and (bvsge (index!30125 lt!306734) #b00000000000000000000000000000000) (bvslt (index!30125 lt!306734) (size!18908 a!2986)))) (or ((_ is Undefined!6940) lt!306734) (ite ((_ is Found!6940) lt!306734) (= (select (arr!18544 a!2986) (index!30123 lt!306734)) k0!1786) (ite ((_ is MissingZero!6940) lt!306734) (= (select (arr!18544 a!2986) (index!30122 lt!306734)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6940) lt!306734) (= (select (arr!18544 a!2986) (index!30125 lt!306734)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!92925 (= lt!306734 e!377403)))

(declare-fun c!75835 () Bool)

(assert (=> d!92925 (= c!75835 (and ((_ is Intermediate!6940) lt!306735) (undefined!7752 lt!306735)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38697 (_ BitVec 32)) SeekEntryResult!6940)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92925 (= lt!306735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92925 (validMask!0 mask!3053)))

(assert (=> d!92925 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!306734)))

(assert (= (and d!92925 c!75835) b!657026))

(assert (= (and d!92925 (not c!75835)) b!657024))

(assert (= (and b!657024 c!75837) b!657023))

(assert (= (and b!657024 (not c!75837)) b!657022))

(assert (= (and b!657022 c!75836) b!657025))

(assert (= (and b!657022 (not c!75836)) b!657021))

(declare-fun m!630569 () Bool)

(assert (=> b!657021 m!630569))

(declare-fun m!630571 () Bool)

(assert (=> b!657024 m!630571))

(declare-fun m!630573 () Bool)

(assert (=> d!92925 m!630573))

(declare-fun m!630575 () Bool)

(assert (=> d!92925 m!630575))

(assert (=> d!92925 m!630339))

(assert (=> d!92925 m!630573))

(declare-fun m!630577 () Bool)

(assert (=> d!92925 m!630577))

(declare-fun m!630579 () Bool)

(assert (=> d!92925 m!630579))

(declare-fun m!630581 () Bool)

(assert (=> d!92925 m!630581))

(assert (=> b!656763 d!92925))

(declare-fun b!657059 () Bool)

(declare-fun e!377426 () SeekEntryResult!6940)

(declare-fun e!377428 () SeekEntryResult!6940)

(assert (=> b!657059 (= e!377426 e!377428)))

(declare-fun c!75849 () Bool)

(declare-fun lt!306755 () (_ BitVec 64))

(assert (=> b!657059 (= c!75849 (= lt!306755 (select (arr!18544 a!2986) j!136)))))

(declare-fun b!657060 () Bool)

(declare-fun e!377427 () SeekEntryResult!6940)

(assert (=> b!657060 (= e!377427 (MissingVacant!6940 vacantSpotIndex!68))))

(declare-fun lt!306756 () SeekEntryResult!6940)

(declare-fun d!92935 () Bool)

(assert (=> d!92935 (and (or ((_ is Undefined!6940) lt!306756) (not ((_ is Found!6940) lt!306756)) (and (bvsge (index!30123 lt!306756) #b00000000000000000000000000000000) (bvslt (index!30123 lt!306756) (size!18908 a!2986)))) (or ((_ is Undefined!6940) lt!306756) ((_ is Found!6940) lt!306756) (not ((_ is MissingVacant!6940) lt!306756)) (not (= (index!30125 lt!306756) vacantSpotIndex!68)) (and (bvsge (index!30125 lt!306756) #b00000000000000000000000000000000) (bvslt (index!30125 lt!306756) (size!18908 a!2986)))) (or ((_ is Undefined!6940) lt!306756) (ite ((_ is Found!6940) lt!306756) (= (select (arr!18544 a!2986) (index!30123 lt!306756)) (select (arr!18544 a!2986) j!136)) (and ((_ is MissingVacant!6940) lt!306756) (= (index!30125 lt!306756) vacantSpotIndex!68) (= (select (arr!18544 a!2986) (index!30125 lt!306756)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92935 (= lt!306756 e!377426)))

(declare-fun c!75848 () Bool)

(assert (=> d!92935 (= c!75848 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92935 (= lt!306755 (select (arr!18544 a!2986) index!984))))

(assert (=> d!92935 (validMask!0 mask!3053)))

(assert (=> d!92935 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18544 a!2986) j!136) a!2986 mask!3053) lt!306756)))

(declare-fun b!657061 () Bool)

(assert (=> b!657061 (= e!377426 Undefined!6940)))

(declare-fun b!657062 () Bool)

(assert (=> b!657062 (= e!377428 (Found!6940 index!984))))

(declare-fun b!657063 () Bool)

(declare-fun c!75850 () Bool)

(assert (=> b!657063 (= c!75850 (= lt!306755 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657063 (= e!377428 e!377427)))

(declare-fun b!657064 () Bool)

(assert (=> b!657064 (= e!377427 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18544 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!92935 c!75848) b!657061))

(assert (= (and d!92935 (not c!75848)) b!657059))

(assert (= (and b!657059 c!75849) b!657062))

(assert (= (and b!657059 (not c!75849)) b!657063))

(assert (= (and b!657063 c!75850) b!657060))

(assert (= (and b!657063 (not c!75850)) b!657064))

(declare-fun m!630605 () Bool)

(assert (=> d!92935 m!630605))

(declare-fun m!630607 () Bool)

(assert (=> d!92935 m!630607))

(assert (=> d!92935 m!630333))

(assert (=> d!92935 m!630339))

(declare-fun m!630611 () Bool)

(assert (=> b!657064 m!630611))

(assert (=> b!657064 m!630611))

(assert (=> b!657064 m!630287))

(declare-fun m!630613 () Bool)

(assert (=> b!657064 m!630613))

(assert (=> b!656776 d!92935))

(declare-fun b!657078 () Bool)

(declare-fun e!377439 () Bool)

(declare-fun e!377437 () Bool)

(assert (=> b!657078 (= e!377439 e!377437)))

(declare-fun res!426103 () Bool)

(assert (=> b!657078 (=> (not res!426103) (not e!377437))))

(declare-fun e!377438 () Bool)

(assert (=> b!657078 (= res!426103 (not e!377438))))

(declare-fun res!426104 () Bool)

(assert (=> b!657078 (=> (not res!426104) (not e!377438))))

(assert (=> b!657078 (= res!426104 (validKeyInArray!0 (select (arr!18544 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!657079 () Bool)

(declare-fun e!377440 () Bool)

(declare-fun call!33886 () Bool)

(assert (=> b!657079 (= e!377440 call!33886)))

(declare-fun bm!33883 () Bool)

(declare-fun c!75856 () Bool)

(assert (=> bm!33883 (= call!33886 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75856 (Cons!12488 (select (arr!18544 a!2986) #b00000000000000000000000000000000) Nil!12489) Nil!12489)))))

(declare-fun b!657081 () Bool)

(assert (=> b!657081 (= e!377440 call!33886)))

(declare-fun b!657082 () Bool)

(assert (=> b!657082 (= e!377437 e!377440)))

(assert (=> b!657082 (= c!75856 (validKeyInArray!0 (select (arr!18544 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92951 () Bool)

(declare-fun res!426105 () Bool)

(assert (=> d!92951 (=> res!426105 e!377439)))

(assert (=> d!92951 (= res!426105 (bvsge #b00000000000000000000000000000000 (size!18908 a!2986)))))

(assert (=> d!92951 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12489) e!377439)))

(declare-fun b!657080 () Bool)

(assert (=> b!657080 (= e!377438 (contains!3171 Nil!12489 (select (arr!18544 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92951 (not res!426105)) b!657078))

(assert (= (and b!657078 res!426104) b!657080))

(assert (= (and b!657078 res!426103) b!657082))

(assert (= (and b!657082 c!75856) b!657081))

(assert (= (and b!657082 (not c!75856)) b!657079))

(assert (= (or b!657081 b!657079) bm!33883))

(assert (=> b!657078 m!630493))

(assert (=> b!657078 m!630493))

(assert (=> b!657078 m!630495))

(assert (=> bm!33883 m!630493))

(declare-fun m!630623 () Bool)

(assert (=> bm!33883 m!630623))

(assert (=> b!657082 m!630493))

(assert (=> b!657082 m!630493))

(assert (=> b!657082 m!630495))

(assert (=> b!657080 m!630493))

(assert (=> b!657080 m!630493))

(declare-fun m!630625 () Bool)

(assert (=> b!657080 m!630625))

(assert (=> b!656771 d!92951))

(declare-fun b!657087 () Bool)

(declare-fun e!377443 () SeekEntryResult!6940)

(declare-fun e!377445 () SeekEntryResult!6940)

(assert (=> b!657087 (= e!377443 e!377445)))

(declare-fun c!75860 () Bool)

(declare-fun lt!306762 () (_ BitVec 64))

(assert (=> b!657087 (= c!75860 (= lt!306762 lt!306565))))

(declare-fun b!657088 () Bool)

(declare-fun e!377444 () SeekEntryResult!6940)

(assert (=> b!657088 (= e!377444 (MissingVacant!6940 vacantSpotIndex!68))))

(declare-fun lt!306763 () SeekEntryResult!6940)

(declare-fun d!92955 () Bool)

(assert (=> d!92955 (and (or ((_ is Undefined!6940) lt!306763) (not ((_ is Found!6940) lt!306763)) (and (bvsge (index!30123 lt!306763) #b00000000000000000000000000000000) (bvslt (index!30123 lt!306763) (size!18908 lt!306572)))) (or ((_ is Undefined!6940) lt!306763) ((_ is Found!6940) lt!306763) (not ((_ is MissingVacant!6940) lt!306763)) (not (= (index!30125 lt!306763) vacantSpotIndex!68)) (and (bvsge (index!30125 lt!306763) #b00000000000000000000000000000000) (bvslt (index!30125 lt!306763) (size!18908 lt!306572)))) (or ((_ is Undefined!6940) lt!306763) (ite ((_ is Found!6940) lt!306763) (= (select (arr!18544 lt!306572) (index!30123 lt!306763)) lt!306565) (and ((_ is MissingVacant!6940) lt!306763) (= (index!30125 lt!306763) vacantSpotIndex!68) (= (select (arr!18544 lt!306572) (index!30125 lt!306763)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92955 (= lt!306763 e!377443)))

(declare-fun c!75859 () Bool)

(assert (=> d!92955 (= c!75859 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92955 (= lt!306762 (select (arr!18544 lt!306572) lt!306570))))

(assert (=> d!92955 (validMask!0 mask!3053)))

(assert (=> d!92955 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306570 vacantSpotIndex!68 lt!306565 lt!306572 mask!3053) lt!306763)))

(declare-fun b!657089 () Bool)

(assert (=> b!657089 (= e!377443 Undefined!6940)))

(declare-fun b!657090 () Bool)

(assert (=> b!657090 (= e!377445 (Found!6940 lt!306570))))

(declare-fun b!657091 () Bool)

(declare-fun c!75861 () Bool)

(assert (=> b!657091 (= c!75861 (= lt!306762 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657091 (= e!377445 e!377444)))

(declare-fun b!657092 () Bool)

(assert (=> b!657092 (= e!377444 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306570 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!306565 lt!306572 mask!3053))))

(assert (= (and d!92955 c!75859) b!657089))

(assert (= (and d!92955 (not c!75859)) b!657087))

(assert (= (and b!657087 c!75860) b!657090))

(assert (= (and b!657087 (not c!75860)) b!657091))

(assert (= (and b!657091 c!75861) b!657088))

(assert (= (and b!657091 (not c!75861)) b!657092))

(declare-fun m!630627 () Bool)

(assert (=> d!92955 m!630627))

(declare-fun m!630629 () Bool)

(assert (=> d!92955 m!630629))

(declare-fun m!630631 () Bool)

(assert (=> d!92955 m!630631))

(assert (=> d!92955 m!630339))

(declare-fun m!630633 () Bool)

(assert (=> b!657092 m!630633))

(assert (=> b!657092 m!630633))

(declare-fun m!630635 () Bool)

(assert (=> b!657092 m!630635))

(assert (=> b!656761 d!92955))

(declare-fun b!657093 () Bool)

(declare-fun e!377446 () SeekEntryResult!6940)

(declare-fun e!377448 () SeekEntryResult!6940)

(assert (=> b!657093 (= e!377446 e!377448)))

(declare-fun c!75863 () Bool)

(declare-fun lt!306764 () (_ BitVec 64))

(assert (=> b!657093 (= c!75863 (= lt!306764 lt!306565))))

(declare-fun b!657094 () Bool)

(declare-fun e!377447 () SeekEntryResult!6940)

(assert (=> b!657094 (= e!377447 (MissingVacant!6940 vacantSpotIndex!68))))

(declare-fun d!92957 () Bool)

(declare-fun lt!306765 () SeekEntryResult!6940)

(assert (=> d!92957 (and (or ((_ is Undefined!6940) lt!306765) (not ((_ is Found!6940) lt!306765)) (and (bvsge (index!30123 lt!306765) #b00000000000000000000000000000000) (bvslt (index!30123 lt!306765) (size!18908 lt!306572)))) (or ((_ is Undefined!6940) lt!306765) ((_ is Found!6940) lt!306765) (not ((_ is MissingVacant!6940) lt!306765)) (not (= (index!30125 lt!306765) vacantSpotIndex!68)) (and (bvsge (index!30125 lt!306765) #b00000000000000000000000000000000) (bvslt (index!30125 lt!306765) (size!18908 lt!306572)))) (or ((_ is Undefined!6940) lt!306765) (ite ((_ is Found!6940) lt!306765) (= (select (arr!18544 lt!306572) (index!30123 lt!306765)) lt!306565) (and ((_ is MissingVacant!6940) lt!306765) (= (index!30125 lt!306765) vacantSpotIndex!68) (= (select (arr!18544 lt!306572) (index!30125 lt!306765)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92957 (= lt!306765 e!377446)))

(declare-fun c!75862 () Bool)

(assert (=> d!92957 (= c!75862 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92957 (= lt!306764 (select (arr!18544 lt!306572) index!984))))

(assert (=> d!92957 (validMask!0 mask!3053)))

(assert (=> d!92957 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!306565 lt!306572 mask!3053) lt!306765)))

(declare-fun b!657095 () Bool)

(assert (=> b!657095 (= e!377446 Undefined!6940)))

(declare-fun b!657096 () Bool)

(assert (=> b!657096 (= e!377448 (Found!6940 index!984))))

(declare-fun b!657097 () Bool)

(declare-fun c!75864 () Bool)

(assert (=> b!657097 (= c!75864 (= lt!306764 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657097 (= e!377448 e!377447)))

(declare-fun b!657098 () Bool)

(assert (=> b!657098 (= e!377447 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!306565 lt!306572 mask!3053))))

(assert (= (and d!92957 c!75862) b!657095))

(assert (= (and d!92957 (not c!75862)) b!657093))

(assert (= (and b!657093 c!75863) b!657096))

(assert (= (and b!657093 (not c!75863)) b!657097))

(assert (= (and b!657097 c!75864) b!657094))

(assert (= (and b!657097 (not c!75864)) b!657098))

(declare-fun m!630637 () Bool)

(assert (=> d!92957 m!630637))

(declare-fun m!630639 () Bool)

(assert (=> d!92957 m!630639))

(assert (=> d!92957 m!630505))

(assert (=> d!92957 m!630339))

(assert (=> b!657098 m!630611))

(assert (=> b!657098 m!630611))

(declare-fun m!630641 () Bool)

(assert (=> b!657098 m!630641))

(assert (=> b!656761 d!92957))

(declare-fun d!92959 () Bool)

(declare-fun e!377485 () Bool)

(assert (=> d!92959 e!377485))

(declare-fun res!426135 () Bool)

(assert (=> d!92959 (=> (not res!426135) (not e!377485))))

(assert (=> d!92959 (= res!426135 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18908 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18908 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18908 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18908 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18908 a!2986))))))

(declare-fun lt!306779 () Unit!22623)

(declare-fun choose!9 (array!38697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22623)

(assert (=> d!92959 (= lt!306779 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306570 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92959 (validMask!0 mask!3053)))

(assert (=> d!92959 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!306570 vacantSpotIndex!68 mask!3053) lt!306779)))

(declare-fun b!657142 () Bool)

(assert (=> b!657142 (= e!377485 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306570 vacantSpotIndex!68 (select (arr!18544 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306570 vacantSpotIndex!68 (select (store (arr!18544 a!2986) i!1108 k0!1786) j!136) (array!38698 (store (arr!18544 a!2986) i!1108 k0!1786) (size!18908 a!2986)) mask!3053)))))

(assert (= (and d!92959 res!426135) b!657142))

(declare-fun m!630689 () Bool)

(assert (=> d!92959 m!630689))

(assert (=> d!92959 m!630339))

(assert (=> b!657142 m!630287))

(assert (=> b!657142 m!630327))

(assert (=> b!657142 m!630287))

(assert (=> b!657142 m!630323))

(assert (=> b!657142 m!630283))

(assert (=> b!657142 m!630323))

(declare-fun m!630691 () Bool)

(assert (=> b!657142 m!630691))

(assert (=> b!656761 d!92959))

(declare-fun b!657143 () Bool)

(declare-fun e!377486 () SeekEntryResult!6940)

(declare-fun e!377488 () SeekEntryResult!6940)

(assert (=> b!657143 (= e!377486 e!377488)))

(declare-fun lt!306780 () (_ BitVec 64))

(declare-fun c!75873 () Bool)

(assert (=> b!657143 (= c!75873 (= lt!306780 (select (arr!18544 a!2986) j!136)))))

(declare-fun b!657144 () Bool)

(declare-fun e!377487 () SeekEntryResult!6940)

(assert (=> b!657144 (= e!377487 (MissingVacant!6940 vacantSpotIndex!68))))

(declare-fun d!92981 () Bool)

(declare-fun lt!306781 () SeekEntryResult!6940)

(assert (=> d!92981 (and (or ((_ is Undefined!6940) lt!306781) (not ((_ is Found!6940) lt!306781)) (and (bvsge (index!30123 lt!306781) #b00000000000000000000000000000000) (bvslt (index!30123 lt!306781) (size!18908 a!2986)))) (or ((_ is Undefined!6940) lt!306781) ((_ is Found!6940) lt!306781) (not ((_ is MissingVacant!6940) lt!306781)) (not (= (index!30125 lt!306781) vacantSpotIndex!68)) (and (bvsge (index!30125 lt!306781) #b00000000000000000000000000000000) (bvslt (index!30125 lt!306781) (size!18908 a!2986)))) (or ((_ is Undefined!6940) lt!306781) (ite ((_ is Found!6940) lt!306781) (= (select (arr!18544 a!2986) (index!30123 lt!306781)) (select (arr!18544 a!2986) j!136)) (and ((_ is MissingVacant!6940) lt!306781) (= (index!30125 lt!306781) vacantSpotIndex!68) (= (select (arr!18544 a!2986) (index!30125 lt!306781)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92981 (= lt!306781 e!377486)))

(declare-fun c!75872 () Bool)

(assert (=> d!92981 (= c!75872 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92981 (= lt!306780 (select (arr!18544 a!2986) lt!306570))))

(assert (=> d!92981 (validMask!0 mask!3053)))

(assert (=> d!92981 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!306570 vacantSpotIndex!68 (select (arr!18544 a!2986) j!136) a!2986 mask!3053) lt!306781)))

(declare-fun b!657145 () Bool)

(assert (=> b!657145 (= e!377486 Undefined!6940)))

(declare-fun b!657146 () Bool)

(assert (=> b!657146 (= e!377488 (Found!6940 lt!306570))))

(declare-fun b!657147 () Bool)

(declare-fun c!75874 () Bool)

(assert (=> b!657147 (= c!75874 (= lt!306780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!657147 (= e!377488 e!377487)))

(declare-fun b!657148 () Bool)

(assert (=> b!657148 (= e!377487 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!306570 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18544 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!92981 c!75872) b!657145))

(assert (= (and d!92981 (not c!75872)) b!657143))

(assert (= (and b!657143 c!75873) b!657146))

(assert (= (and b!657143 (not c!75873)) b!657147))

(assert (= (and b!657147 c!75874) b!657144))

(assert (= (and b!657147 (not c!75874)) b!657148))

(declare-fun m!630693 () Bool)

(assert (=> d!92981 m!630693))

(declare-fun m!630695 () Bool)

(assert (=> d!92981 m!630695))

(declare-fun m!630697 () Bool)

(assert (=> d!92981 m!630697))

(assert (=> d!92981 m!630339))

(assert (=> b!657148 m!630633))

(assert (=> b!657148 m!630633))

(assert (=> b!657148 m!630287))

(declare-fun m!630699 () Bool)

(assert (=> b!657148 m!630699))

(assert (=> b!656761 d!92981))

(declare-fun d!92983 () Bool)

(declare-fun lt!306787 () (_ BitVec 32))

(assert (=> d!92983 (and (bvsge lt!306787 #b00000000000000000000000000000000) (bvslt lt!306787 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92983 (= lt!306787 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!92983 (validMask!0 mask!3053)))

(assert (=> d!92983 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!306787)))

(declare-fun bs!19578 () Bool)

(assert (= bs!19578 d!92983))

(declare-fun m!630711 () Bool)

(assert (=> bs!19578 m!630711))

(assert (=> bs!19578 m!630339))

(assert (=> b!656761 d!92983))

(declare-fun d!92989 () Bool)

(declare-fun res!426139 () Bool)

(declare-fun e!377493 () Bool)

(assert (=> d!92989 (=> res!426139 e!377493)))

(assert (=> d!92989 (= res!426139 (= (select (arr!18544 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92989 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!377493)))

(declare-fun b!657154 () Bool)

(declare-fun e!377494 () Bool)

(assert (=> b!657154 (= e!377493 e!377494)))

(declare-fun res!426140 () Bool)

(assert (=> b!657154 (=> (not res!426140) (not e!377494))))

(assert (=> b!657154 (= res!426140 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18908 a!2986)))))

(declare-fun b!657155 () Bool)

(assert (=> b!657155 (= e!377494 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92989 (not res!426139)) b!657154))

(assert (= (and b!657154 res!426140) b!657155))

(assert (=> d!92989 m!630493))

(declare-fun m!630713 () Bool)

(assert (=> b!657155 m!630713))

(assert (=> b!656762 d!92989))

(check-sat (not d!92921) (not d!92955) (not d!92901) (not b!656974) (not b!657021) (not b!657142) (not b!656967) (not d!92925) (not d!92897) (not bm!33872) (not b!656975) (not b!657098) (not b!657155) (not b!657064) (not b!656965) (not b!656938) (not d!92905) (not b!656981) (not b!657082) (not b!656964) (not d!92935) (not bm!33871) (not b!656960) (not b!656977) (not b!656947) (not b!656972) (not b!656969) (not d!92983) (not d!92923) (not b!656939) (not d!92959) (not d!92893) (not b!656958) (not b!656962) (not bm!33867) (not b!657092) (not b!656979) (not b!657080) (not bm!33870) (not d!92917) (not d!92957) (not b!657148) (not b!657078) (not bm!33883) (not d!92981))
(check-sat)
