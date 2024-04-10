; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59362 () Bool)

(assert start!59362)

(declare-fun b!655605 () Bool)

(declare-datatypes ((Unit!22564 0))(
  ( (Unit!22565) )
))
(declare-fun e!376513 () Unit!22564)

(declare-fun Unit!22566 () Unit!22564)

(assert (=> b!655605 (= e!376513 Unit!22566)))

(declare-fun b!655606 () Bool)

(assert (=> b!655606 false))

(declare-datatypes ((array!38682 0))(
  ( (array!38683 (arr!18541 (Array (_ BitVec 32) (_ BitVec 64))) (size!18905 (_ BitVec 32))) )
))
(declare-fun lt!305826 () array!38682)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!305823 () Unit!22564)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38682)

(declare-datatypes ((List!12582 0))(
  ( (Nil!12579) (Cons!12578 (h!13623 (_ BitVec 64)) (t!18810 List!12582)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38682 (_ BitVec 64) (_ BitVec 32) List!12582) Unit!22564)

(assert (=> b!655606 (= lt!305823 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305826 (select (arr!18541 a!2986) j!136) index!984 Nil!12579))))

(declare-fun arrayNoDuplicates!0 (array!38682 (_ BitVec 32) List!12582) Bool)

(assert (=> b!655606 (arrayNoDuplicates!0 lt!305826 index!984 Nil!12579)))

(declare-fun lt!305832 () Unit!22564)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38682 (_ BitVec 32) (_ BitVec 32)) Unit!22564)

(assert (=> b!655606 (= lt!305832 (lemmaNoDuplicateFromThenFromBigger!0 lt!305826 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655606 (arrayNoDuplicates!0 lt!305826 #b00000000000000000000000000000000 Nil!12579)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!305840 () Unit!22564)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38682 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12582) Unit!22564)

(assert (=> b!655606 (= lt!305840 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12579))))

(declare-fun arrayContainsKey!0 (array!38682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655606 (arrayContainsKey!0 lt!305826 (select (arr!18541 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305829 () Unit!22564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38682 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22564)

(assert (=> b!655606 (= lt!305829 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305826 (select (arr!18541 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376509 () Bool)

(assert (=> b!655606 e!376509))

(declare-fun res!425287 () Bool)

(assert (=> b!655606 (=> (not res!425287) (not e!376509))))

(assert (=> b!655606 (= res!425287 (arrayContainsKey!0 lt!305826 (select (arr!18541 a!2986) j!136) j!136))))

(declare-fun Unit!22567 () Unit!22564)

(assert (=> b!655606 (= e!376513 Unit!22567)))

(declare-fun res!425298 () Bool)

(declare-fun e!376507 () Bool)

(assert (=> start!59362 (=> (not res!425298) (not e!376507))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59362 (= res!425298 (validMask!0 mask!3053))))

(assert (=> start!59362 e!376507))

(assert (=> start!59362 true))

(declare-fun array_inv!14337 (array!38682) Bool)

(assert (=> start!59362 (array_inv!14337 a!2986)))

(declare-fun b!655607 () Bool)

(declare-fun e!376516 () Unit!22564)

(declare-fun Unit!22568 () Unit!22564)

(assert (=> b!655607 (= e!376516 Unit!22568)))

(declare-fun res!425296 () Bool)

(assert (=> b!655607 (= res!425296 (= (select (store (arr!18541 a!2986) i!1108 k0!1786) index!984) (select (arr!18541 a!2986) j!136)))))

(declare-fun e!376514 () Bool)

(assert (=> b!655607 (=> (not res!425296) (not e!376514))))

(assert (=> b!655607 e!376514))

(declare-fun c!75530 () Bool)

(assert (=> b!655607 (= c!75530 (bvslt j!136 index!984))))

(declare-fun lt!305836 () Unit!22564)

(declare-fun e!376511 () Unit!22564)

(assert (=> b!655607 (= lt!305836 e!376511)))

(declare-fun c!75528 () Bool)

(assert (=> b!655607 (= c!75528 (bvslt index!984 j!136))))

(declare-fun lt!305839 () Unit!22564)

(assert (=> b!655607 (= lt!305839 e!376513)))

(assert (=> b!655607 false))

(declare-fun b!655608 () Bool)

(declare-fun e!376512 () Unit!22564)

(declare-fun Unit!22569 () Unit!22564)

(assert (=> b!655608 (= e!376512 Unit!22569)))

(declare-fun b!655609 () Bool)

(declare-fun res!425290 () Bool)

(declare-fun e!376505 () Bool)

(assert (=> b!655609 (=> (not res!425290) (not e!376505))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!655609 (= res!425290 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18541 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655610 () Bool)

(declare-fun res!425300 () Bool)

(assert (=> b!655610 (=> (not res!425300) (not e!376505))))

(assert (=> b!655610 (= res!425300 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12579))))

(declare-fun b!655611 () Bool)

(declare-fun res!425292 () Bool)

(assert (=> b!655611 (=> (not res!425292) (not e!376507))))

(assert (=> b!655611 (= res!425292 (and (= (size!18905 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18905 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18905 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655612 () Bool)

(assert (=> b!655612 (= e!376509 (arrayContainsKey!0 lt!305826 (select (arr!18541 a!2986) j!136) index!984))))

(declare-fun b!655613 () Bool)

(declare-fun e!376515 () Bool)

(assert (=> b!655613 (= e!376505 e!376515)))

(declare-fun res!425288 () Bool)

(assert (=> b!655613 (=> (not res!425288) (not e!376515))))

(assert (=> b!655613 (= res!425288 (= (select (store (arr!18541 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655613 (= lt!305826 (array!38683 (store (arr!18541 a!2986) i!1108 k0!1786) (size!18905 a!2986)))))

(declare-fun b!655614 () Bool)

(declare-fun e!376508 () Bool)

(declare-datatypes ((SeekEntryResult!6981 0))(
  ( (MissingZero!6981 (index!30283 (_ BitVec 32))) (Found!6981 (index!30284 (_ BitVec 32))) (Intermediate!6981 (undefined!7793 Bool) (index!30285 (_ BitVec 32)) (x!59070 (_ BitVec 32))) (Undefined!6981) (MissingVacant!6981 (index!30286 (_ BitVec 32))) )
))
(declare-fun lt!305834 () SeekEntryResult!6981)

(declare-fun lt!305827 () SeekEntryResult!6981)

(assert (=> b!655614 (= e!376508 (= lt!305834 lt!305827))))

(declare-fun b!655615 () Bool)

(declare-fun Unit!22570 () Unit!22564)

(assert (=> b!655615 (= e!376512 Unit!22570)))

(assert (=> b!655615 false))

(declare-fun b!655616 () Bool)

(declare-fun res!425297 () Bool)

(assert (=> b!655616 (=> (not res!425297) (not e!376507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655616 (= res!425297 (validKeyInArray!0 k0!1786))))

(declare-fun b!655617 () Bool)

(declare-fun res!425291 () Bool)

(assert (=> b!655617 (= res!425291 (bvsge j!136 index!984))))

(declare-fun e!376506 () Bool)

(assert (=> b!655617 (=> res!425291 e!376506)))

(assert (=> b!655617 (= e!376514 e!376506)))

(declare-fun b!655618 () Bool)

(declare-fun e!376510 () Bool)

(assert (=> b!655618 (= e!376515 e!376510)))

(declare-fun res!425285 () Bool)

(assert (=> b!655618 (=> (not res!425285) (not e!376510))))

(assert (=> b!655618 (= res!425285 (and (= lt!305834 (Found!6981 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18541 a!2986) index!984) (select (arr!18541 a!2986) j!136))) (not (= (select (arr!18541 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38682 (_ BitVec 32)) SeekEntryResult!6981)

(assert (=> b!655618 (= lt!305834 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18541 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655619 () Bool)

(declare-fun res!425293 () Bool)

(assert (=> b!655619 (= res!425293 (arrayContainsKey!0 lt!305826 (select (arr!18541 a!2986) j!136) j!136))))

(declare-fun e!376518 () Bool)

(assert (=> b!655619 (=> (not res!425293) (not e!376518))))

(assert (=> b!655619 (= e!376506 e!376518)))

(declare-fun b!655620 () Bool)

(declare-fun res!425289 () Bool)

(assert (=> b!655620 (=> (not res!425289) (not e!376507))))

(assert (=> b!655620 (= res!425289 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655621 () Bool)

(assert (=> b!655621 (= e!376510 (not true))))

(declare-fun lt!305825 () Unit!22564)

(assert (=> b!655621 (= lt!305825 e!376516)))

(declare-fun c!75529 () Bool)

(declare-fun lt!305828 () SeekEntryResult!6981)

(assert (=> b!655621 (= c!75529 (= lt!305828 (Found!6981 index!984)))))

(declare-fun lt!305833 () Unit!22564)

(assert (=> b!655621 (= lt!305833 e!376512)))

(declare-fun c!75527 () Bool)

(assert (=> b!655621 (= c!75527 (= lt!305828 Undefined!6981))))

(declare-fun lt!305830 () (_ BitVec 64))

(assert (=> b!655621 (= lt!305828 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305830 lt!305826 mask!3053))))

(assert (=> b!655621 e!376508))

(declare-fun res!425299 () Bool)

(assert (=> b!655621 (=> (not res!425299) (not e!376508))))

(declare-fun lt!305837 () (_ BitVec 32))

(assert (=> b!655621 (= res!425299 (= lt!305827 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305837 vacantSpotIndex!68 lt!305830 lt!305826 mask!3053)))))

(assert (=> b!655621 (= lt!305827 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305837 vacantSpotIndex!68 (select (arr!18541 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655621 (= lt!305830 (select (store (arr!18541 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305838 () Unit!22564)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38682 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22564)

(assert (=> b!655621 (= lt!305838 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305837 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655621 (= lt!305837 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655622 () Bool)

(assert (=> b!655622 (= e!376518 (arrayContainsKey!0 lt!305826 (select (arr!18541 a!2986) j!136) index!984))))

(declare-fun b!655623 () Bool)

(declare-fun res!425294 () Bool)

(assert (=> b!655623 (=> (not res!425294) (not e!376505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38682 (_ BitVec 32)) Bool)

(assert (=> b!655623 (= res!425294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655624 () Bool)

(declare-fun Unit!22571 () Unit!22564)

(assert (=> b!655624 (= e!376511 Unit!22571)))

(declare-fun b!655625 () Bool)

(declare-fun Unit!22572 () Unit!22564)

(assert (=> b!655625 (= e!376516 Unit!22572)))

(declare-fun b!655626 () Bool)

(assert (=> b!655626 false))

(declare-fun lt!305835 () Unit!22564)

(assert (=> b!655626 (= lt!305835 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305826 (select (arr!18541 a!2986) j!136) j!136 Nil!12579))))

(assert (=> b!655626 (arrayNoDuplicates!0 lt!305826 j!136 Nil!12579)))

(declare-fun lt!305842 () Unit!22564)

(assert (=> b!655626 (= lt!305842 (lemmaNoDuplicateFromThenFromBigger!0 lt!305826 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655626 (arrayNoDuplicates!0 lt!305826 #b00000000000000000000000000000000 Nil!12579)))

(declare-fun lt!305831 () Unit!22564)

(assert (=> b!655626 (= lt!305831 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12579))))

(assert (=> b!655626 (arrayContainsKey!0 lt!305826 (select (arr!18541 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305841 () Unit!22564)

(assert (=> b!655626 (= lt!305841 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305826 (select (arr!18541 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22573 () Unit!22564)

(assert (=> b!655626 (= e!376511 Unit!22573)))

(declare-fun b!655627 () Bool)

(assert (=> b!655627 (= e!376507 e!376505)))

(declare-fun res!425286 () Bool)

(assert (=> b!655627 (=> (not res!425286) (not e!376505))))

(declare-fun lt!305824 () SeekEntryResult!6981)

(assert (=> b!655627 (= res!425286 (or (= lt!305824 (MissingZero!6981 i!1108)) (= lt!305824 (MissingVacant!6981 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38682 (_ BitVec 32)) SeekEntryResult!6981)

(assert (=> b!655627 (= lt!305824 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!655628 () Bool)

(declare-fun res!425295 () Bool)

(assert (=> b!655628 (=> (not res!425295) (not e!376507))))

(assert (=> b!655628 (= res!425295 (validKeyInArray!0 (select (arr!18541 a!2986) j!136)))))

(assert (= (and start!59362 res!425298) b!655611))

(assert (= (and b!655611 res!425292) b!655628))

(assert (= (and b!655628 res!425295) b!655616))

(assert (= (and b!655616 res!425297) b!655620))

(assert (= (and b!655620 res!425289) b!655627))

(assert (= (and b!655627 res!425286) b!655623))

(assert (= (and b!655623 res!425294) b!655610))

(assert (= (and b!655610 res!425300) b!655609))

(assert (= (and b!655609 res!425290) b!655613))

(assert (= (and b!655613 res!425288) b!655618))

(assert (= (and b!655618 res!425285) b!655621))

(assert (= (and b!655621 res!425299) b!655614))

(assert (= (and b!655621 c!75527) b!655615))

(assert (= (and b!655621 (not c!75527)) b!655608))

(assert (= (and b!655621 c!75529) b!655607))

(assert (= (and b!655621 (not c!75529)) b!655625))

(assert (= (and b!655607 res!425296) b!655617))

(assert (= (and b!655617 (not res!425291)) b!655619))

(assert (= (and b!655619 res!425293) b!655622))

(assert (= (and b!655607 c!75530) b!655626))

(assert (= (and b!655607 (not c!75530)) b!655624))

(assert (= (and b!655607 c!75528) b!655606))

(assert (= (and b!655607 (not c!75528)) b!655605))

(assert (= (and b!655606 res!425287) b!655612))

(declare-fun m!628677 () Bool)

(assert (=> b!655619 m!628677))

(assert (=> b!655619 m!628677))

(declare-fun m!628679 () Bool)

(assert (=> b!655619 m!628679))

(declare-fun m!628681 () Bool)

(assert (=> b!655609 m!628681))

(assert (=> b!655612 m!628677))

(assert (=> b!655612 m!628677))

(declare-fun m!628683 () Bool)

(assert (=> b!655612 m!628683))

(declare-fun m!628685 () Bool)

(assert (=> b!655616 m!628685))

(declare-fun m!628687 () Bool)

(assert (=> b!655613 m!628687))

(declare-fun m!628689 () Bool)

(assert (=> b!655613 m!628689))

(assert (=> b!655622 m!628677))

(assert (=> b!655622 m!628677))

(assert (=> b!655622 m!628683))

(declare-fun m!628691 () Bool)

(assert (=> b!655610 m!628691))

(declare-fun m!628693 () Bool)

(assert (=> b!655626 m!628693))

(assert (=> b!655626 m!628677))

(assert (=> b!655626 m!628677))

(declare-fun m!628695 () Bool)

(assert (=> b!655626 m!628695))

(assert (=> b!655626 m!628677))

(declare-fun m!628697 () Bool)

(assert (=> b!655626 m!628697))

(assert (=> b!655626 m!628677))

(declare-fun m!628699 () Bool)

(assert (=> b!655626 m!628699))

(declare-fun m!628701 () Bool)

(assert (=> b!655626 m!628701))

(declare-fun m!628703 () Bool)

(assert (=> b!655626 m!628703))

(declare-fun m!628705 () Bool)

(assert (=> b!655626 m!628705))

(assert (=> b!655606 m!628677))

(assert (=> b!655606 m!628677))

(declare-fun m!628707 () Bool)

(assert (=> b!655606 m!628707))

(declare-fun m!628709 () Bool)

(assert (=> b!655606 m!628709))

(assert (=> b!655606 m!628701))

(assert (=> b!655606 m!628677))

(assert (=> b!655606 m!628679))

(declare-fun m!628711 () Bool)

(assert (=> b!655606 m!628711))

(assert (=> b!655606 m!628677))

(declare-fun m!628713 () Bool)

(assert (=> b!655606 m!628713))

(assert (=> b!655606 m!628677))

(declare-fun m!628715 () Bool)

(assert (=> b!655606 m!628715))

(assert (=> b!655606 m!628705))

(declare-fun m!628717 () Bool)

(assert (=> b!655627 m!628717))

(declare-fun m!628719 () Bool)

(assert (=> start!59362 m!628719))

(declare-fun m!628721 () Bool)

(assert (=> start!59362 m!628721))

(declare-fun m!628723 () Bool)

(assert (=> b!655620 m!628723))

(declare-fun m!628725 () Bool)

(assert (=> b!655618 m!628725))

(assert (=> b!655618 m!628677))

(assert (=> b!655618 m!628677))

(declare-fun m!628727 () Bool)

(assert (=> b!655618 m!628727))

(declare-fun m!628729 () Bool)

(assert (=> b!655621 m!628729))

(assert (=> b!655621 m!628677))

(assert (=> b!655621 m!628687))

(assert (=> b!655621 m!628677))

(declare-fun m!628731 () Bool)

(assert (=> b!655621 m!628731))

(declare-fun m!628733 () Bool)

(assert (=> b!655621 m!628733))

(declare-fun m!628735 () Bool)

(assert (=> b!655621 m!628735))

(declare-fun m!628737 () Bool)

(assert (=> b!655621 m!628737))

(declare-fun m!628739 () Bool)

(assert (=> b!655621 m!628739))

(assert (=> b!655607 m!628687))

(declare-fun m!628741 () Bool)

(assert (=> b!655607 m!628741))

(assert (=> b!655607 m!628677))

(assert (=> b!655628 m!628677))

(assert (=> b!655628 m!628677))

(declare-fun m!628743 () Bool)

(assert (=> b!655628 m!628743))

(declare-fun m!628745 () Bool)

(assert (=> b!655623 m!628745))

(check-sat (not b!655619) (not b!655623) (not b!655628) (not b!655612) (not b!655616) (not b!655622) (not start!59362) (not b!655606) (not b!655627) (not b!655620) (not b!655621) (not b!655610) (not b!655626) (not b!655618))
(check-sat)
