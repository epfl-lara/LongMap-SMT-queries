; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59116 () Bool)

(assert start!59116)

(declare-fun b!652644 () Bool)

(declare-fun e!374613 () Bool)

(declare-fun e!374614 () Bool)

(assert (=> b!652644 (= e!374613 e!374614)))

(declare-fun res!423298 () Bool)

(assert (=> b!652644 (=> res!423298 e!374614)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!303780 () (_ BitVec 64))

(declare-fun lt!303765 () (_ BitVec 64))

(declare-datatypes ((array!38616 0))(
  ( (array!38617 (arr!18511 (Array (_ BitVec 32) (_ BitVec 64))) (size!18875 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38616)

(assert (=> b!652644 (= res!423298 (or (not (= (select (arr!18511 a!2986) j!136) lt!303765)) (not (= (select (arr!18511 a!2986) j!136) lt!303780))))))

(declare-fun e!374620 () Bool)

(assert (=> b!652644 e!374620))

(declare-fun res!423297 () Bool)

(assert (=> b!652644 (=> (not res!423297) (not e!374620))))

(assert (=> b!652644 (= res!423297 (= lt!303780 (select (arr!18511 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!652644 (= lt!303780 (select (store (arr!18511 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!652645 () Bool)

(declare-datatypes ((Unit!22332 0))(
  ( (Unit!22333) )
))
(declare-fun e!374615 () Unit!22332)

(declare-fun Unit!22334 () Unit!22332)

(assert (=> b!652645 (= e!374615 Unit!22334)))

(assert (=> b!652645 false))

(declare-fun res!423282 () Bool)

(declare-fun e!374616 () Bool)

(assert (=> start!59116 (=> (not res!423282) (not e!374616))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59116 (= res!423282 (validMask!0 mask!3053))))

(assert (=> start!59116 e!374616))

(assert (=> start!59116 true))

(declare-fun array_inv!14307 (array!38616) Bool)

(assert (=> start!59116 (array_inv!14307 a!2986)))

(declare-fun b!652646 () Bool)

(declare-fun e!374607 () Bool)

(declare-fun e!374609 () Bool)

(assert (=> b!652646 (= e!374607 e!374609)))

(declare-fun res!423295 () Bool)

(assert (=> b!652646 (=> (not res!423295) (not e!374609))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!652646 (= res!423295 (= (select (store (arr!18511 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!303776 () array!38616)

(assert (=> b!652646 (= lt!303776 (array!38617 (store (arr!18511 a!2986) i!1108 k0!1786) (size!18875 a!2986)))))

(declare-fun b!652647 () Bool)

(declare-fun e!374622 () Bool)

(assert (=> b!652647 (= e!374614 e!374622)))

(declare-fun res!423291 () Bool)

(assert (=> b!652647 (=> res!423291 e!374622)))

(assert (=> b!652647 (= res!423291 (bvsge index!984 j!136))))

(declare-fun lt!303774 () Unit!22332)

(declare-fun e!374611 () Unit!22332)

(assert (=> b!652647 (= lt!303774 e!374611)))

(declare-fun c!75049 () Bool)

(assert (=> b!652647 (= c!75049 (bvslt j!136 index!984))))

(declare-fun b!652648 () Bool)

(declare-fun e!374610 () Bool)

(assert (=> b!652648 (= e!374620 e!374610)))

(declare-fun res!423285 () Bool)

(assert (=> b!652648 (=> res!423285 e!374610)))

(assert (=> b!652648 (= res!423285 (or (not (= (select (arr!18511 a!2986) j!136) lt!303765)) (not (= (select (arr!18511 a!2986) j!136) lt!303780)) (bvsge j!136 index!984)))))

(declare-fun b!652649 () Bool)

(assert (=> b!652649 (= e!374616 e!374607)))

(declare-fun res!423299 () Bool)

(assert (=> b!652649 (=> (not res!423299) (not e!374607))))

(declare-datatypes ((SeekEntryResult!6951 0))(
  ( (MissingZero!6951 (index!30157 (_ BitVec 32))) (Found!6951 (index!30158 (_ BitVec 32))) (Intermediate!6951 (undefined!7763 Bool) (index!30159 (_ BitVec 32)) (x!58942 (_ BitVec 32))) (Undefined!6951) (MissingVacant!6951 (index!30160 (_ BitVec 32))) )
))
(declare-fun lt!303775 () SeekEntryResult!6951)

(assert (=> b!652649 (= res!423299 (or (= lt!303775 (MissingZero!6951 i!1108)) (= lt!303775 (MissingVacant!6951 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38616 (_ BitVec 32)) SeekEntryResult!6951)

(assert (=> b!652649 (= lt!303775 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!652650 () Bool)

(declare-fun res!423283 () Bool)

(assert (=> b!652650 (=> (not res!423283) (not e!374607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38616 (_ BitVec 32)) Bool)

(assert (=> b!652650 (= res!423283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652651 () Bool)

(declare-fun e!374618 () Bool)

(assert (=> b!652651 (= e!374618 (not e!374613))))

(declare-fun res!423288 () Bool)

(assert (=> b!652651 (=> res!423288 e!374613)))

(declare-fun lt!303777 () SeekEntryResult!6951)

(assert (=> b!652651 (= res!423288 (not (= lt!303777 (Found!6951 index!984))))))

(declare-fun lt!303766 () Unit!22332)

(assert (=> b!652651 (= lt!303766 e!374615)))

(declare-fun c!75050 () Bool)

(assert (=> b!652651 (= c!75050 (= lt!303777 Undefined!6951))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38616 (_ BitVec 32)) SeekEntryResult!6951)

(assert (=> b!652651 (= lt!303777 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303765 lt!303776 mask!3053))))

(declare-fun e!374608 () Bool)

(assert (=> b!652651 e!374608))

(declare-fun res!423290 () Bool)

(assert (=> b!652651 (=> (not res!423290) (not e!374608))))

(declare-fun lt!303768 () (_ BitVec 32))

(declare-fun lt!303779 () SeekEntryResult!6951)

(assert (=> b!652651 (= res!423290 (= lt!303779 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303768 vacantSpotIndex!68 lt!303765 lt!303776 mask!3053)))))

(assert (=> b!652651 (= lt!303779 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303768 vacantSpotIndex!68 (select (arr!18511 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652651 (= lt!303765 (select (store (arr!18511 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!303773 () Unit!22332)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38616 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22332)

(assert (=> b!652651 (= lt!303773 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303768 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652651 (= lt!303768 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!652652 () Bool)

(declare-fun res!423284 () Bool)

(assert (=> b!652652 (=> (not res!423284) (not e!374616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652652 (= res!423284 (validKeyInArray!0 k0!1786))))

(declare-fun b!652653 () Bool)

(assert (=> b!652653 (= e!374609 e!374618)))

(declare-fun res!423292 () Bool)

(assert (=> b!652653 (=> (not res!423292) (not e!374618))))

(declare-fun lt!303769 () SeekEntryResult!6951)

(assert (=> b!652653 (= res!423292 (and (= lt!303769 (Found!6951 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18511 a!2986) index!984) (select (arr!18511 a!2986) j!136))) (not (= (select (arr!18511 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!652653 (= lt!303769 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18511 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652654 () Bool)

(declare-fun res!423294 () Bool)

(assert (=> b!652654 (=> (not res!423294) (not e!374607))))

(assert (=> b!652654 (= res!423294 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18511 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!652655 () Bool)

(declare-fun Unit!22335 () Unit!22332)

(assert (=> b!652655 (= e!374611 Unit!22335)))

(declare-fun e!374617 () Bool)

(declare-fun b!652656 () Bool)

(declare-fun arrayContainsKey!0 (array!38616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652656 (= e!374617 (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) index!984))))

(declare-fun b!652657 () Bool)

(declare-fun e!374619 () Bool)

(assert (=> b!652657 (= e!374619 (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) index!984))))

(declare-fun b!652658 () Bool)

(declare-fun res!423286 () Bool)

(assert (=> b!652658 (=> (not res!423286) (not e!374607))))

(declare-datatypes ((List!12552 0))(
  ( (Nil!12549) (Cons!12548 (h!13593 (_ BitVec 64)) (t!18780 List!12552)) )
))
(declare-fun arrayNoDuplicates!0 (array!38616 (_ BitVec 32) List!12552) Bool)

(assert (=> b!652658 (= res!423286 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12549))))

(declare-fun b!652659 () Bool)

(declare-fun e!374621 () Bool)

(declare-fun noDuplicate!436 (List!12552) Bool)

(assert (=> b!652659 (= e!374621 (noDuplicate!436 Nil!12549))))

(declare-fun b!652660 () Bool)

(declare-fun Unit!22336 () Unit!22332)

(assert (=> b!652660 (= e!374615 Unit!22336)))

(declare-fun b!652661 () Bool)

(declare-fun res!423281 () Bool)

(assert (=> b!652661 (=> (not res!423281) (not e!374616))))

(assert (=> b!652661 (= res!423281 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652662 () Bool)

(declare-fun res!423287 () Bool)

(assert (=> b!652662 (=> (not res!423287) (not e!374616))))

(assert (=> b!652662 (= res!423287 (validKeyInArray!0 (select (arr!18511 a!2986) j!136)))))

(declare-fun b!652663 () Bool)

(declare-fun Unit!22337 () Unit!22332)

(assert (=> b!652663 (= e!374611 Unit!22337)))

(declare-fun lt!303764 () Unit!22332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38616 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22332)

(assert (=> b!652663 (= lt!303764 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303776 (select (arr!18511 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652663 (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303767 () Unit!22332)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38616 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12552) Unit!22332)

(assert (=> b!652663 (= lt!303767 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12549))))

(assert (=> b!652663 (arrayNoDuplicates!0 lt!303776 #b00000000000000000000000000000000 Nil!12549)))

(declare-fun lt!303778 () Unit!22332)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38616 (_ BitVec 32) (_ BitVec 32)) Unit!22332)

(assert (=> b!652663 (= lt!303778 (lemmaNoDuplicateFromThenFromBigger!0 lt!303776 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652663 (arrayNoDuplicates!0 lt!303776 j!136 Nil!12549)))

(declare-fun lt!303781 () Unit!22332)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38616 (_ BitVec 64) (_ BitVec 32) List!12552) Unit!22332)

(assert (=> b!652663 (= lt!303781 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303776 (select (arr!18511 a!2986) j!136) j!136 Nil!12549))))

(assert (=> b!652663 false))

(declare-fun b!652664 () Bool)

(assert (=> b!652664 (= e!374608 (= lt!303769 lt!303779))))

(declare-fun b!652665 () Bool)

(assert (=> b!652665 (= e!374610 e!374619)))

(declare-fun res!423296 () Bool)

(assert (=> b!652665 (=> (not res!423296) (not e!374619))))

(assert (=> b!652665 (= res!423296 (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) j!136))))

(declare-fun b!652666 () Bool)

(assert (=> b!652666 (= e!374622 e!374621)))

(declare-fun res!423280 () Bool)

(assert (=> b!652666 (=> res!423280 e!374621)))

(assert (=> b!652666 (= res!423280 (or (bvsge (size!18875 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18875 a!2986)) (bvsge index!984 (size!18875 a!2986))))))

(assert (=> b!652666 (arrayNoDuplicates!0 lt!303776 index!984 Nil!12549)))

(declare-fun lt!303770 () Unit!22332)

(assert (=> b!652666 (= lt!303770 (lemmaNoDuplicateFromThenFromBigger!0 lt!303776 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652666 (arrayNoDuplicates!0 lt!303776 #b00000000000000000000000000000000 Nil!12549)))

(declare-fun lt!303771 () Unit!22332)

(assert (=> b!652666 (= lt!303771 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12549))))

(assert (=> b!652666 (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303772 () Unit!22332)

(assert (=> b!652666 (= lt!303772 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303776 (select (arr!18511 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!652666 e!374617))

(declare-fun res!423289 () Bool)

(assert (=> b!652666 (=> (not res!423289) (not e!374617))))

(assert (=> b!652666 (= res!423289 (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) j!136))))

(declare-fun b!652667 () Bool)

(declare-fun res!423293 () Bool)

(assert (=> b!652667 (=> (not res!423293) (not e!374616))))

(assert (=> b!652667 (= res!423293 (and (= (size!18875 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18875 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18875 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!59116 res!423282) b!652667))

(assert (= (and b!652667 res!423293) b!652662))

(assert (= (and b!652662 res!423287) b!652652))

(assert (= (and b!652652 res!423284) b!652661))

(assert (= (and b!652661 res!423281) b!652649))

(assert (= (and b!652649 res!423299) b!652650))

(assert (= (and b!652650 res!423283) b!652658))

(assert (= (and b!652658 res!423286) b!652654))

(assert (= (and b!652654 res!423294) b!652646))

(assert (= (and b!652646 res!423295) b!652653))

(assert (= (and b!652653 res!423292) b!652651))

(assert (= (and b!652651 res!423290) b!652664))

(assert (= (and b!652651 c!75050) b!652645))

(assert (= (and b!652651 (not c!75050)) b!652660))

(assert (= (and b!652651 (not res!423288)) b!652644))

(assert (= (and b!652644 res!423297) b!652648))

(assert (= (and b!652648 (not res!423285)) b!652665))

(assert (= (and b!652665 res!423296) b!652657))

(assert (= (and b!652644 (not res!423298)) b!652647))

(assert (= (and b!652647 c!75049) b!652663))

(assert (= (and b!652647 (not c!75049)) b!652655))

(assert (= (and b!652647 (not res!423291)) b!652666))

(assert (= (and b!652666 res!423289) b!652656))

(assert (= (and b!652666 (not res!423280)) b!652659))

(declare-fun m!625779 () Bool)

(assert (=> b!652644 m!625779))

(declare-fun m!625781 () Bool)

(assert (=> b!652644 m!625781))

(declare-fun m!625783 () Bool)

(assert (=> b!652644 m!625783))

(assert (=> b!652656 m!625779))

(assert (=> b!652656 m!625779))

(declare-fun m!625785 () Bool)

(assert (=> b!652656 m!625785))

(assert (=> b!652648 m!625779))

(declare-fun m!625787 () Bool)

(assert (=> b!652650 m!625787))

(declare-fun m!625789 () Bool)

(assert (=> b!652651 m!625789))

(assert (=> b!652651 m!625779))

(assert (=> b!652651 m!625781))

(declare-fun m!625791 () Bool)

(assert (=> b!652651 m!625791))

(declare-fun m!625793 () Bool)

(assert (=> b!652651 m!625793))

(assert (=> b!652651 m!625779))

(declare-fun m!625795 () Bool)

(assert (=> b!652651 m!625795))

(declare-fun m!625797 () Bool)

(assert (=> b!652651 m!625797))

(declare-fun m!625799 () Bool)

(assert (=> b!652651 m!625799))

(declare-fun m!625801 () Bool)

(assert (=> b!652661 m!625801))

(assert (=> b!652662 m!625779))

(assert (=> b!652662 m!625779))

(declare-fun m!625803 () Bool)

(assert (=> b!652662 m!625803))

(declare-fun m!625805 () Bool)

(assert (=> b!652658 m!625805))

(assert (=> b!652646 m!625781))

(declare-fun m!625807 () Bool)

(assert (=> b!652646 m!625807))

(declare-fun m!625809 () Bool)

(assert (=> b!652659 m!625809))

(declare-fun m!625811 () Bool)

(assert (=> b!652649 m!625811))

(assert (=> b!652665 m!625779))

(assert (=> b!652665 m!625779))

(declare-fun m!625813 () Bool)

(assert (=> b!652665 m!625813))

(assert (=> b!652657 m!625779))

(assert (=> b!652657 m!625779))

(assert (=> b!652657 m!625785))

(declare-fun m!625815 () Bool)

(assert (=> b!652663 m!625815))

(assert (=> b!652663 m!625779))

(declare-fun m!625817 () Bool)

(assert (=> b!652663 m!625817))

(declare-fun m!625819 () Bool)

(assert (=> b!652663 m!625819))

(assert (=> b!652663 m!625779))

(declare-fun m!625821 () Bool)

(assert (=> b!652663 m!625821))

(declare-fun m!625823 () Bool)

(assert (=> b!652663 m!625823))

(assert (=> b!652663 m!625779))

(declare-fun m!625825 () Bool)

(assert (=> b!652663 m!625825))

(assert (=> b!652663 m!625779))

(declare-fun m!625827 () Bool)

(assert (=> b!652663 m!625827))

(declare-fun m!625829 () Bool)

(assert (=> b!652653 m!625829))

(assert (=> b!652653 m!625779))

(assert (=> b!652653 m!625779))

(declare-fun m!625831 () Bool)

(assert (=> b!652653 m!625831))

(declare-fun m!625833 () Bool)

(assert (=> start!59116 m!625833))

(declare-fun m!625835 () Bool)

(assert (=> start!59116 m!625835))

(declare-fun m!625837 () Bool)

(assert (=> b!652654 m!625837))

(declare-fun m!625839 () Bool)

(assert (=> b!652652 m!625839))

(assert (=> b!652666 m!625779))

(assert (=> b!652666 m!625779))

(declare-fun m!625841 () Bool)

(assert (=> b!652666 m!625841))

(assert (=> b!652666 m!625779))

(declare-fun m!625843 () Bool)

(assert (=> b!652666 m!625843))

(assert (=> b!652666 m!625819))

(declare-fun m!625845 () Bool)

(assert (=> b!652666 m!625845))

(declare-fun m!625847 () Bool)

(assert (=> b!652666 m!625847))

(assert (=> b!652666 m!625779))

(assert (=> b!652666 m!625813))

(assert (=> b!652666 m!625823))

(check-sat (not b!652661) (not b!652656) (not b!652649) (not b!652666) (not b!652658) (not b!652651) (not b!652652) (not b!652662) (not b!652653) (not b!652650) (not b!652659) (not b!652657) (not b!652665) (not start!59116) (not b!652663))
(check-sat)
(get-model)

(declare-fun b!652752 () Bool)

(declare-fun c!75063 () Bool)

(declare-fun lt!303841 () (_ BitVec 64))

(assert (=> b!652752 (= c!75063 (= lt!303841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374678 () SeekEntryResult!6951)

(declare-fun e!374679 () SeekEntryResult!6951)

(assert (=> b!652752 (= e!374678 e!374679)))

(declare-fun b!652753 () Bool)

(assert (=> b!652753 (= e!374679 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18511 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652754 () Bool)

(declare-fun e!374677 () SeekEntryResult!6951)

(assert (=> b!652754 (= e!374677 e!374678)))

(declare-fun c!75065 () Bool)

(assert (=> b!652754 (= c!75065 (= lt!303841 (select (arr!18511 a!2986) j!136)))))

(declare-fun b!652755 () Bool)

(assert (=> b!652755 (= e!374678 (Found!6951 index!984))))

(declare-fun b!652756 () Bool)

(assert (=> b!652756 (= e!374679 (MissingVacant!6951 vacantSpotIndex!68))))

(declare-fun lt!303840 () SeekEntryResult!6951)

(declare-fun d!92221 () Bool)

(get-info :version)

(assert (=> d!92221 (and (or ((_ is Undefined!6951) lt!303840) (not ((_ is Found!6951) lt!303840)) (and (bvsge (index!30158 lt!303840) #b00000000000000000000000000000000) (bvslt (index!30158 lt!303840) (size!18875 a!2986)))) (or ((_ is Undefined!6951) lt!303840) ((_ is Found!6951) lt!303840) (not ((_ is MissingVacant!6951) lt!303840)) (not (= (index!30160 lt!303840) vacantSpotIndex!68)) (and (bvsge (index!30160 lt!303840) #b00000000000000000000000000000000) (bvslt (index!30160 lt!303840) (size!18875 a!2986)))) (or ((_ is Undefined!6951) lt!303840) (ite ((_ is Found!6951) lt!303840) (= (select (arr!18511 a!2986) (index!30158 lt!303840)) (select (arr!18511 a!2986) j!136)) (and ((_ is MissingVacant!6951) lt!303840) (= (index!30160 lt!303840) vacantSpotIndex!68) (= (select (arr!18511 a!2986) (index!30160 lt!303840)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92221 (= lt!303840 e!374677)))

(declare-fun c!75064 () Bool)

(assert (=> d!92221 (= c!75064 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92221 (= lt!303841 (select (arr!18511 a!2986) index!984))))

(assert (=> d!92221 (validMask!0 mask!3053)))

(assert (=> d!92221 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18511 a!2986) j!136) a!2986 mask!3053) lt!303840)))

(declare-fun b!652757 () Bool)

(assert (=> b!652757 (= e!374677 Undefined!6951)))

(assert (= (and d!92221 c!75064) b!652757))

(assert (= (and d!92221 (not c!75064)) b!652754))

(assert (= (and b!652754 c!75065) b!652755))

(assert (= (and b!652754 (not c!75065)) b!652752))

(assert (= (and b!652752 c!75063) b!652756))

(assert (= (and b!652752 (not c!75063)) b!652753))

(assert (=> b!652753 m!625799))

(assert (=> b!652753 m!625799))

(assert (=> b!652753 m!625779))

(declare-fun m!625919 () Bool)

(assert (=> b!652753 m!625919))

(declare-fun m!625921 () Bool)

(assert (=> d!92221 m!625921))

(declare-fun m!625923 () Bool)

(assert (=> d!92221 m!625923))

(assert (=> d!92221 m!625829))

(assert (=> d!92221 m!625833))

(assert (=> b!652653 d!92221))

(declare-fun d!92223 () Bool)

(assert (=> d!92223 (= (validKeyInArray!0 (select (arr!18511 a!2986) j!136)) (and (not (= (select (arr!18511 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18511 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!652662 d!92223))

(declare-fun d!92225 () Bool)

(declare-fun res!423364 () Bool)

(declare-fun e!374684 () Bool)

(assert (=> d!92225 (=> res!423364 e!374684)))

(assert (=> d!92225 (= res!423364 (= (select (arr!18511 lt!303776) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18511 a!2986) j!136)))))

(assert (=> d!92225 (= (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!374684)))

(declare-fun b!652762 () Bool)

(declare-fun e!374685 () Bool)

(assert (=> b!652762 (= e!374684 e!374685)))

(declare-fun res!423365 () Bool)

(assert (=> b!652762 (=> (not res!423365) (not e!374685))))

(assert (=> b!652762 (= res!423365 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18875 lt!303776)))))

(declare-fun b!652763 () Bool)

(assert (=> b!652763 (= e!374685 (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92225 (not res!423364)) b!652762))

(assert (= (and b!652762 res!423365) b!652763))

(declare-fun m!625925 () Bool)

(assert (=> d!92225 m!625925))

(assert (=> b!652763 m!625779))

(declare-fun m!625927 () Bool)

(assert (=> b!652763 m!625927))

(assert (=> b!652663 d!92225))

(declare-fun d!92227 () Bool)

(assert (=> d!92227 (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303844 () Unit!22332)

(declare-fun choose!114 (array!38616 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22332)

(assert (=> d!92227 (= lt!303844 (choose!114 lt!303776 (select (arr!18511 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92227 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92227 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303776 (select (arr!18511 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!303844)))

(declare-fun bs!19453 () Bool)

(assert (= bs!19453 d!92227))

(assert (=> bs!19453 m!625779))

(assert (=> bs!19453 m!625821))

(assert (=> bs!19453 m!625779))

(declare-fun m!625929 () Bool)

(assert (=> bs!19453 m!625929))

(assert (=> b!652663 d!92227))

(declare-fun d!92229 () Bool)

(assert (=> d!92229 (arrayNoDuplicates!0 lt!303776 j!136 Nil!12549)))

(declare-fun lt!303847 () Unit!22332)

(declare-fun choose!39 (array!38616 (_ BitVec 32) (_ BitVec 32)) Unit!22332)

(assert (=> d!92229 (= lt!303847 (choose!39 lt!303776 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92229 (bvslt (size!18875 lt!303776) #b01111111111111111111111111111111)))

(assert (=> d!92229 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!303776 #b00000000000000000000000000000000 j!136) lt!303847)))

(declare-fun bs!19454 () Bool)

(assert (= bs!19454 d!92229))

(assert (=> bs!19454 m!625815))

(declare-fun m!625931 () Bool)

(assert (=> bs!19454 m!625931))

(assert (=> b!652663 d!92229))

(declare-fun b!652780 () Bool)

(declare-fun e!374700 () Bool)

(declare-fun contains!3179 (List!12552 (_ BitVec 64)) Bool)

(assert (=> b!652780 (= e!374700 (contains!3179 Nil!12549 (select (arr!18511 lt!303776) #b00000000000000000000000000000000)))))

(declare-fun d!92235 () Bool)

(declare-fun res!423379 () Bool)

(declare-fun e!374701 () Bool)

(assert (=> d!92235 (=> res!423379 e!374701)))

(assert (=> d!92235 (= res!423379 (bvsge #b00000000000000000000000000000000 (size!18875 lt!303776)))))

(assert (=> d!92235 (= (arrayNoDuplicates!0 lt!303776 #b00000000000000000000000000000000 Nil!12549) e!374701)))

(declare-fun bm!33779 () Bool)

(declare-fun call!33782 () Bool)

(declare-fun c!75068 () Bool)

(assert (=> bm!33779 (= call!33782 (arrayNoDuplicates!0 lt!303776 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75068 (Cons!12548 (select (arr!18511 lt!303776) #b00000000000000000000000000000000) Nil!12549) Nil!12549)))))

(declare-fun b!652781 () Bool)

(declare-fun e!374703 () Bool)

(assert (=> b!652781 (= e!374701 e!374703)))

(declare-fun res!423380 () Bool)

(assert (=> b!652781 (=> (not res!423380) (not e!374703))))

(assert (=> b!652781 (= res!423380 (not e!374700))))

(declare-fun res!423378 () Bool)

(assert (=> b!652781 (=> (not res!423378) (not e!374700))))

(assert (=> b!652781 (= res!423378 (validKeyInArray!0 (select (arr!18511 lt!303776) #b00000000000000000000000000000000)))))

(declare-fun b!652782 () Bool)

(declare-fun e!374702 () Bool)

(assert (=> b!652782 (= e!374702 call!33782)))

(declare-fun b!652783 () Bool)

(assert (=> b!652783 (= e!374702 call!33782)))

(declare-fun b!652784 () Bool)

(assert (=> b!652784 (= e!374703 e!374702)))

(assert (=> b!652784 (= c!75068 (validKeyInArray!0 (select (arr!18511 lt!303776) #b00000000000000000000000000000000)))))

(assert (= (and d!92235 (not res!423379)) b!652781))

(assert (= (and b!652781 res!423378) b!652780))

(assert (= (and b!652781 res!423380) b!652784))

(assert (= (and b!652784 c!75068) b!652783))

(assert (= (and b!652784 (not c!75068)) b!652782))

(assert (= (or b!652783 b!652782) bm!33779))

(declare-fun m!625937 () Bool)

(assert (=> b!652780 m!625937))

(assert (=> b!652780 m!625937))

(declare-fun m!625939 () Bool)

(assert (=> b!652780 m!625939))

(assert (=> bm!33779 m!625937))

(declare-fun m!625941 () Bool)

(assert (=> bm!33779 m!625941))

(assert (=> b!652781 m!625937))

(assert (=> b!652781 m!625937))

(declare-fun m!625943 () Bool)

(assert (=> b!652781 m!625943))

(assert (=> b!652784 m!625937))

(assert (=> b!652784 m!625937))

(assert (=> b!652784 m!625943))

(assert (=> b!652663 d!92235))

(declare-fun b!652785 () Bool)

(declare-fun e!374704 () Bool)

(assert (=> b!652785 (= e!374704 (contains!3179 Nil!12549 (select (arr!18511 lt!303776) j!136)))))

(declare-fun d!92241 () Bool)

(declare-fun res!423382 () Bool)

(declare-fun e!374705 () Bool)

(assert (=> d!92241 (=> res!423382 e!374705)))

(assert (=> d!92241 (= res!423382 (bvsge j!136 (size!18875 lt!303776)))))

(assert (=> d!92241 (= (arrayNoDuplicates!0 lt!303776 j!136 Nil!12549) e!374705)))

(declare-fun bm!33780 () Bool)

(declare-fun c!75069 () Bool)

(declare-fun call!33783 () Bool)

(assert (=> bm!33780 (= call!33783 (arrayNoDuplicates!0 lt!303776 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75069 (Cons!12548 (select (arr!18511 lt!303776) j!136) Nil!12549) Nil!12549)))))

(declare-fun b!652786 () Bool)

(declare-fun e!374707 () Bool)

(assert (=> b!652786 (= e!374705 e!374707)))

(declare-fun res!423383 () Bool)

(assert (=> b!652786 (=> (not res!423383) (not e!374707))))

(assert (=> b!652786 (= res!423383 (not e!374704))))

(declare-fun res!423381 () Bool)

(assert (=> b!652786 (=> (not res!423381) (not e!374704))))

(assert (=> b!652786 (= res!423381 (validKeyInArray!0 (select (arr!18511 lt!303776) j!136)))))

(declare-fun b!652787 () Bool)

(declare-fun e!374706 () Bool)

(assert (=> b!652787 (= e!374706 call!33783)))

(declare-fun b!652788 () Bool)

(assert (=> b!652788 (= e!374706 call!33783)))

(declare-fun b!652789 () Bool)

(assert (=> b!652789 (= e!374707 e!374706)))

(assert (=> b!652789 (= c!75069 (validKeyInArray!0 (select (arr!18511 lt!303776) j!136)))))

(assert (= (and d!92241 (not res!423382)) b!652786))

(assert (= (and b!652786 res!423381) b!652785))

(assert (= (and b!652786 res!423383) b!652789))

(assert (= (and b!652789 c!75069) b!652788))

(assert (= (and b!652789 (not c!75069)) b!652787))

(assert (= (or b!652788 b!652787) bm!33780))

(declare-fun m!625945 () Bool)

(assert (=> b!652785 m!625945))

(assert (=> b!652785 m!625945))

(declare-fun m!625947 () Bool)

(assert (=> b!652785 m!625947))

(assert (=> bm!33780 m!625945))

(declare-fun m!625949 () Bool)

(assert (=> bm!33780 m!625949))

(assert (=> b!652786 m!625945))

(assert (=> b!652786 m!625945))

(declare-fun m!625951 () Bool)

(assert (=> b!652786 m!625951))

(assert (=> b!652789 m!625945))

(assert (=> b!652789 m!625945))

(assert (=> b!652789 m!625951))

(assert (=> b!652663 d!92241))

(declare-fun d!92243 () Bool)

(declare-fun e!374716 () Bool)

(assert (=> d!92243 e!374716))

(declare-fun res!423386 () Bool)

(assert (=> d!92243 (=> (not res!423386) (not e!374716))))

(assert (=> d!92243 (= res!423386 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18875 a!2986))))))

(declare-fun lt!303854 () Unit!22332)

(declare-fun choose!41 (array!38616 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12552) Unit!22332)

(assert (=> d!92243 (= lt!303854 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12549))))

(assert (=> d!92243 (bvslt (size!18875 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92243 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12549) lt!303854)))

(declare-fun b!652804 () Bool)

(assert (=> b!652804 (= e!374716 (arrayNoDuplicates!0 (array!38617 (store (arr!18511 a!2986) i!1108 k0!1786) (size!18875 a!2986)) #b00000000000000000000000000000000 Nil!12549))))

(assert (= (and d!92243 res!423386) b!652804))

(declare-fun m!625953 () Bool)

(assert (=> d!92243 m!625953))

(assert (=> b!652804 m!625781))

(declare-fun m!625955 () Bool)

(assert (=> b!652804 m!625955))

(assert (=> b!652663 d!92243))

(declare-fun d!92245 () Bool)

(assert (=> d!92245 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18875 lt!303776)) (not (= (select (arr!18511 lt!303776) j!136) (select (arr!18511 a!2986) j!136))))))

(declare-fun lt!303863 () Unit!22332)

(declare-fun choose!21 (array!38616 (_ BitVec 64) (_ BitVec 32) List!12552) Unit!22332)

(assert (=> d!92245 (= lt!303863 (choose!21 lt!303776 (select (arr!18511 a!2986) j!136) j!136 Nil!12549))))

(assert (=> d!92245 (bvslt (size!18875 lt!303776) #b01111111111111111111111111111111)))

(assert (=> d!92245 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303776 (select (arr!18511 a!2986) j!136) j!136 Nil!12549) lt!303863)))

(declare-fun bs!19455 () Bool)

(assert (= bs!19455 d!92245))

(assert (=> bs!19455 m!625945))

(assert (=> bs!19455 m!625779))

(declare-fun m!625979 () Bool)

(assert (=> bs!19455 m!625979))

(assert (=> b!652663 d!92245))

(declare-fun d!92257 () Bool)

(assert (=> d!92257 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!652652 d!92257))

(declare-fun d!92259 () Bool)

(declare-fun res!423389 () Bool)

(declare-fun e!374725 () Bool)

(assert (=> d!92259 (=> res!423389 e!374725)))

(assert (=> d!92259 (= res!423389 (= (select (arr!18511 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92259 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!374725)))

(declare-fun b!652819 () Bool)

(declare-fun e!374726 () Bool)

(assert (=> b!652819 (= e!374725 e!374726)))

(declare-fun res!423390 () Bool)

(assert (=> b!652819 (=> (not res!423390) (not e!374726))))

(assert (=> b!652819 (= res!423390 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18875 a!2986)))))

(declare-fun b!652820 () Bool)

(assert (=> b!652820 (= e!374726 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92259 (not res!423389)) b!652819))

(assert (= (and b!652819 res!423390) b!652820))

(declare-fun m!625983 () Bool)

(assert (=> d!92259 m!625983))

(declare-fun m!625985 () Bool)

(assert (=> b!652820 m!625985))

(assert (=> b!652661 d!92259))

(declare-fun bm!33785 () Bool)

(declare-fun call!33788 () Bool)

(assert (=> bm!33785 (= call!33788 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!652845 () Bool)

(declare-fun e!374745 () Bool)

(assert (=> b!652845 (= e!374745 call!33788)))

(declare-fun b!652846 () Bool)

(declare-fun e!374744 () Bool)

(assert (=> b!652846 (= e!374745 e!374744)))

(declare-fun lt!303883 () (_ BitVec 64))

(assert (=> b!652846 (= lt!303883 (select (arr!18511 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!303884 () Unit!22332)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38616 (_ BitVec 64) (_ BitVec 32)) Unit!22332)

(assert (=> b!652846 (= lt!303884 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!303883 #b00000000000000000000000000000000))))

(assert (=> b!652846 (arrayContainsKey!0 a!2986 lt!303883 #b00000000000000000000000000000000)))

(declare-fun lt!303882 () Unit!22332)

(assert (=> b!652846 (= lt!303882 lt!303884)))

(declare-fun res!423401 () Bool)

(assert (=> b!652846 (= res!423401 (= (seekEntryOrOpen!0 (select (arr!18511 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6951 #b00000000000000000000000000000000)))))

(assert (=> b!652846 (=> (not res!423401) (not e!374744))))

(declare-fun b!652847 () Bool)

(declare-fun e!374746 () Bool)

(assert (=> b!652847 (= e!374746 e!374745)))

(declare-fun c!75089 () Bool)

(assert (=> b!652847 (= c!75089 (validKeyInArray!0 (select (arr!18511 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!652848 () Bool)

(assert (=> b!652848 (= e!374744 call!33788)))

(declare-fun d!92263 () Bool)

(declare-fun res!423402 () Bool)

(assert (=> d!92263 (=> res!423402 e!374746)))

(assert (=> d!92263 (= res!423402 (bvsge #b00000000000000000000000000000000 (size!18875 a!2986)))))

(assert (=> d!92263 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!374746)))

(assert (= (and d!92263 (not res!423402)) b!652847))

(assert (= (and b!652847 c!75089) b!652846))

(assert (= (and b!652847 (not c!75089)) b!652845))

(assert (= (and b!652846 res!423401) b!652848))

(assert (= (or b!652848 b!652845) bm!33785))

(declare-fun m!626001 () Bool)

(assert (=> bm!33785 m!626001))

(assert (=> b!652846 m!625983))

(declare-fun m!626003 () Bool)

(assert (=> b!652846 m!626003))

(declare-fun m!626007 () Bool)

(assert (=> b!652846 m!626007))

(assert (=> b!652846 m!625983))

(declare-fun m!626011 () Bool)

(assert (=> b!652846 m!626011))

(assert (=> b!652847 m!625983))

(assert (=> b!652847 m!625983))

(declare-fun m!626015 () Bool)

(assert (=> b!652847 m!626015))

(assert (=> b!652650 d!92263))

(declare-fun d!92273 () Bool)

(declare-fun e!374772 () Bool)

(assert (=> d!92273 e!374772))

(declare-fun res!423423 () Bool)

(assert (=> d!92273 (=> (not res!423423) (not e!374772))))

(assert (=> d!92273 (= res!423423 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18875 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18875 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18875 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18875 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18875 a!2986))))))

(declare-fun lt!303902 () Unit!22332)

(declare-fun choose!9 (array!38616 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22332)

(assert (=> d!92273 (= lt!303902 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303768 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92273 (validMask!0 mask!3053)))

(assert (=> d!92273 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303768 vacantSpotIndex!68 mask!3053) lt!303902)))

(declare-fun b!652879 () Bool)

(assert (=> b!652879 (= e!374772 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303768 vacantSpotIndex!68 (select (arr!18511 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303768 vacantSpotIndex!68 (select (store (arr!18511 a!2986) i!1108 k0!1786) j!136) (array!38617 (store (arr!18511 a!2986) i!1108 k0!1786) (size!18875 a!2986)) mask!3053)))))

(assert (= (and d!92273 res!423423) b!652879))

(declare-fun m!626045 () Bool)

(assert (=> d!92273 m!626045))

(assert (=> d!92273 m!625833))

(assert (=> b!652879 m!625779))

(assert (=> b!652879 m!625795))

(assert (=> b!652879 m!625779))

(assert (=> b!652879 m!625789))

(declare-fun m!626047 () Bool)

(assert (=> b!652879 m!626047))

(assert (=> b!652879 m!625789))

(assert (=> b!652879 m!625781))

(assert (=> b!652651 d!92273))

(declare-fun b!652880 () Bool)

(declare-fun c!75095 () Bool)

(declare-fun lt!303904 () (_ BitVec 64))

(assert (=> b!652880 (= c!75095 (= lt!303904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374774 () SeekEntryResult!6951)

(declare-fun e!374775 () SeekEntryResult!6951)

(assert (=> b!652880 (= e!374774 e!374775)))

(declare-fun b!652881 () Bool)

(assert (=> b!652881 (= e!374775 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!303768 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!303765 lt!303776 mask!3053))))

(declare-fun b!652882 () Bool)

(declare-fun e!374773 () SeekEntryResult!6951)

(assert (=> b!652882 (= e!374773 e!374774)))

(declare-fun c!75097 () Bool)

(assert (=> b!652882 (= c!75097 (= lt!303904 lt!303765))))

(declare-fun b!652883 () Bool)

(assert (=> b!652883 (= e!374774 (Found!6951 lt!303768))))

(declare-fun b!652884 () Bool)

(assert (=> b!652884 (= e!374775 (MissingVacant!6951 vacantSpotIndex!68))))

(declare-fun lt!303903 () SeekEntryResult!6951)

(declare-fun d!92285 () Bool)

(assert (=> d!92285 (and (or ((_ is Undefined!6951) lt!303903) (not ((_ is Found!6951) lt!303903)) (and (bvsge (index!30158 lt!303903) #b00000000000000000000000000000000) (bvslt (index!30158 lt!303903) (size!18875 lt!303776)))) (or ((_ is Undefined!6951) lt!303903) ((_ is Found!6951) lt!303903) (not ((_ is MissingVacant!6951) lt!303903)) (not (= (index!30160 lt!303903) vacantSpotIndex!68)) (and (bvsge (index!30160 lt!303903) #b00000000000000000000000000000000) (bvslt (index!30160 lt!303903) (size!18875 lt!303776)))) (or ((_ is Undefined!6951) lt!303903) (ite ((_ is Found!6951) lt!303903) (= (select (arr!18511 lt!303776) (index!30158 lt!303903)) lt!303765) (and ((_ is MissingVacant!6951) lt!303903) (= (index!30160 lt!303903) vacantSpotIndex!68) (= (select (arr!18511 lt!303776) (index!30160 lt!303903)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92285 (= lt!303903 e!374773)))

(declare-fun c!75096 () Bool)

(assert (=> d!92285 (= c!75096 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92285 (= lt!303904 (select (arr!18511 lt!303776) lt!303768))))

(assert (=> d!92285 (validMask!0 mask!3053)))

(assert (=> d!92285 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303768 vacantSpotIndex!68 lt!303765 lt!303776 mask!3053) lt!303903)))

(declare-fun b!652885 () Bool)

(assert (=> b!652885 (= e!374773 Undefined!6951)))

(assert (= (and d!92285 c!75096) b!652885))

(assert (= (and d!92285 (not c!75096)) b!652882))

(assert (= (and b!652882 c!75097) b!652883))

(assert (= (and b!652882 (not c!75097)) b!652880))

(assert (= (and b!652880 c!75095) b!652884))

(assert (= (and b!652880 (not c!75095)) b!652881))

(declare-fun m!626049 () Bool)

(assert (=> b!652881 m!626049))

(assert (=> b!652881 m!626049))

(declare-fun m!626051 () Bool)

(assert (=> b!652881 m!626051))

(declare-fun m!626053 () Bool)

(assert (=> d!92285 m!626053))

(declare-fun m!626055 () Bool)

(assert (=> d!92285 m!626055))

(declare-fun m!626057 () Bool)

(assert (=> d!92285 m!626057))

(assert (=> d!92285 m!625833))

(assert (=> b!652651 d!92285))

(declare-fun b!652886 () Bool)

(declare-fun c!75098 () Bool)

(declare-fun lt!303906 () (_ BitVec 64))

(assert (=> b!652886 (= c!75098 (= lt!303906 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374777 () SeekEntryResult!6951)

(declare-fun e!374778 () SeekEntryResult!6951)

(assert (=> b!652886 (= e!374777 e!374778)))

(declare-fun b!652887 () Bool)

(assert (=> b!652887 (= e!374778 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!303768 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18511 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652888 () Bool)

(declare-fun e!374776 () SeekEntryResult!6951)

(assert (=> b!652888 (= e!374776 e!374777)))

(declare-fun c!75100 () Bool)

(assert (=> b!652888 (= c!75100 (= lt!303906 (select (arr!18511 a!2986) j!136)))))

(declare-fun b!652889 () Bool)

(assert (=> b!652889 (= e!374777 (Found!6951 lt!303768))))

(declare-fun b!652890 () Bool)

(assert (=> b!652890 (= e!374778 (MissingVacant!6951 vacantSpotIndex!68))))

(declare-fun d!92287 () Bool)

(declare-fun lt!303905 () SeekEntryResult!6951)

(assert (=> d!92287 (and (or ((_ is Undefined!6951) lt!303905) (not ((_ is Found!6951) lt!303905)) (and (bvsge (index!30158 lt!303905) #b00000000000000000000000000000000) (bvslt (index!30158 lt!303905) (size!18875 a!2986)))) (or ((_ is Undefined!6951) lt!303905) ((_ is Found!6951) lt!303905) (not ((_ is MissingVacant!6951) lt!303905)) (not (= (index!30160 lt!303905) vacantSpotIndex!68)) (and (bvsge (index!30160 lt!303905) #b00000000000000000000000000000000) (bvslt (index!30160 lt!303905) (size!18875 a!2986)))) (or ((_ is Undefined!6951) lt!303905) (ite ((_ is Found!6951) lt!303905) (= (select (arr!18511 a!2986) (index!30158 lt!303905)) (select (arr!18511 a!2986) j!136)) (and ((_ is MissingVacant!6951) lt!303905) (= (index!30160 lt!303905) vacantSpotIndex!68) (= (select (arr!18511 a!2986) (index!30160 lt!303905)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92287 (= lt!303905 e!374776)))

(declare-fun c!75099 () Bool)

(assert (=> d!92287 (= c!75099 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92287 (= lt!303906 (select (arr!18511 a!2986) lt!303768))))

(assert (=> d!92287 (validMask!0 mask!3053)))

(assert (=> d!92287 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303768 vacantSpotIndex!68 (select (arr!18511 a!2986) j!136) a!2986 mask!3053) lt!303905)))

(declare-fun b!652891 () Bool)

(assert (=> b!652891 (= e!374776 Undefined!6951)))

(assert (= (and d!92287 c!75099) b!652891))

(assert (= (and d!92287 (not c!75099)) b!652888))

(assert (= (and b!652888 c!75100) b!652889))

(assert (= (and b!652888 (not c!75100)) b!652886))

(assert (= (and b!652886 c!75098) b!652890))

(assert (= (and b!652886 (not c!75098)) b!652887))

(assert (=> b!652887 m!626049))

(assert (=> b!652887 m!626049))

(assert (=> b!652887 m!625779))

(declare-fun m!626059 () Bool)

(assert (=> b!652887 m!626059))

(declare-fun m!626061 () Bool)

(assert (=> d!92287 m!626061))

(declare-fun m!626063 () Bool)

(assert (=> d!92287 m!626063))

(declare-fun m!626065 () Bool)

(assert (=> d!92287 m!626065))

(assert (=> d!92287 m!625833))

(assert (=> b!652651 d!92287))

(declare-fun d!92289 () Bool)

(declare-fun lt!303915 () (_ BitVec 32))

(assert (=> d!92289 (and (bvsge lt!303915 #b00000000000000000000000000000000) (bvslt lt!303915 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92289 (= lt!303915 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92289 (validMask!0 mask!3053)))

(assert (=> d!92289 (= (nextIndex!0 index!984 x!910 mask!3053) lt!303915)))

(declare-fun bs!19460 () Bool)

(assert (= bs!19460 d!92289))

(declare-fun m!626067 () Bool)

(assert (=> bs!19460 m!626067))

(assert (=> bs!19460 m!625833))

(assert (=> b!652651 d!92289))

(declare-fun b!652904 () Bool)

(declare-fun c!75107 () Bool)

(declare-fun lt!303917 () (_ BitVec 64))

(assert (=> b!652904 (= c!75107 (= lt!303917 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!374786 () SeekEntryResult!6951)

(declare-fun e!374787 () SeekEntryResult!6951)

(assert (=> b!652904 (= e!374786 e!374787)))

(declare-fun b!652905 () Bool)

(assert (=> b!652905 (= e!374787 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!303765 lt!303776 mask!3053))))

(declare-fun b!652906 () Bool)

(declare-fun e!374785 () SeekEntryResult!6951)

(assert (=> b!652906 (= e!374785 e!374786)))

(declare-fun c!75109 () Bool)

(assert (=> b!652906 (= c!75109 (= lt!303917 lt!303765))))

(declare-fun b!652907 () Bool)

(assert (=> b!652907 (= e!374786 (Found!6951 index!984))))

(declare-fun b!652908 () Bool)

(assert (=> b!652908 (= e!374787 (MissingVacant!6951 vacantSpotIndex!68))))

(declare-fun d!92291 () Bool)

(declare-fun lt!303916 () SeekEntryResult!6951)

(assert (=> d!92291 (and (or ((_ is Undefined!6951) lt!303916) (not ((_ is Found!6951) lt!303916)) (and (bvsge (index!30158 lt!303916) #b00000000000000000000000000000000) (bvslt (index!30158 lt!303916) (size!18875 lt!303776)))) (or ((_ is Undefined!6951) lt!303916) ((_ is Found!6951) lt!303916) (not ((_ is MissingVacant!6951) lt!303916)) (not (= (index!30160 lt!303916) vacantSpotIndex!68)) (and (bvsge (index!30160 lt!303916) #b00000000000000000000000000000000) (bvslt (index!30160 lt!303916) (size!18875 lt!303776)))) (or ((_ is Undefined!6951) lt!303916) (ite ((_ is Found!6951) lt!303916) (= (select (arr!18511 lt!303776) (index!30158 lt!303916)) lt!303765) (and ((_ is MissingVacant!6951) lt!303916) (= (index!30160 lt!303916) vacantSpotIndex!68) (= (select (arr!18511 lt!303776) (index!30160 lt!303916)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92291 (= lt!303916 e!374785)))

(declare-fun c!75108 () Bool)

(assert (=> d!92291 (= c!75108 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92291 (= lt!303917 (select (arr!18511 lt!303776) index!984))))

(assert (=> d!92291 (validMask!0 mask!3053)))

(assert (=> d!92291 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303765 lt!303776 mask!3053) lt!303916)))

(declare-fun b!652909 () Bool)

(assert (=> b!652909 (= e!374785 Undefined!6951)))

(assert (= (and d!92291 c!75108) b!652909))

(assert (= (and d!92291 (not c!75108)) b!652906))

(assert (= (and b!652906 c!75109) b!652907))

(assert (= (and b!652906 (not c!75109)) b!652904))

(assert (= (and b!652904 c!75107) b!652908))

(assert (= (and b!652904 (not c!75107)) b!652905))

(assert (=> b!652905 m!625799))

(assert (=> b!652905 m!625799))

(declare-fun m!626069 () Bool)

(assert (=> b!652905 m!626069))

(declare-fun m!626071 () Bool)

(assert (=> d!92291 m!626071))

(declare-fun m!626073 () Bool)

(assert (=> d!92291 m!626073))

(declare-fun m!626075 () Bool)

(assert (=> d!92291 m!626075))

(assert (=> d!92291 m!625833))

(assert (=> b!652651 d!92291))

(declare-fun d!92293 () Bool)

(assert (=> d!92293 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59116 d!92293))

(declare-fun d!92299 () Bool)

(assert (=> d!92299 (= (array_inv!14307 a!2986) (bvsge (size!18875 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59116 d!92299))

(declare-fun lt!303954 () SeekEntryResult!6951)

(declare-fun e!374851 () SeekEntryResult!6951)

(declare-fun b!653005 () Bool)

(assert (=> b!653005 (= e!374851 (seekKeyOrZeroReturnVacant!0 (x!58942 lt!303954) (index!30159 lt!303954) (index!30159 lt!303954) k0!1786 a!2986 mask!3053))))

(declare-fun b!653006 () Bool)

(declare-fun e!374850 () SeekEntryResult!6951)

(assert (=> b!653006 (= e!374850 (Found!6951 (index!30159 lt!303954)))))

(declare-fun d!92303 () Bool)

(declare-fun lt!303953 () SeekEntryResult!6951)

(assert (=> d!92303 (and (or ((_ is Undefined!6951) lt!303953) (not ((_ is Found!6951) lt!303953)) (and (bvsge (index!30158 lt!303953) #b00000000000000000000000000000000) (bvslt (index!30158 lt!303953) (size!18875 a!2986)))) (or ((_ is Undefined!6951) lt!303953) ((_ is Found!6951) lt!303953) (not ((_ is MissingZero!6951) lt!303953)) (and (bvsge (index!30157 lt!303953) #b00000000000000000000000000000000) (bvslt (index!30157 lt!303953) (size!18875 a!2986)))) (or ((_ is Undefined!6951) lt!303953) ((_ is Found!6951) lt!303953) ((_ is MissingZero!6951) lt!303953) (not ((_ is MissingVacant!6951) lt!303953)) (and (bvsge (index!30160 lt!303953) #b00000000000000000000000000000000) (bvslt (index!30160 lt!303953) (size!18875 a!2986)))) (or ((_ is Undefined!6951) lt!303953) (ite ((_ is Found!6951) lt!303953) (= (select (arr!18511 a!2986) (index!30158 lt!303953)) k0!1786) (ite ((_ is MissingZero!6951) lt!303953) (= (select (arr!18511 a!2986) (index!30157 lt!303953)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6951) lt!303953) (= (select (arr!18511 a!2986) (index!30160 lt!303953)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!374849 () SeekEntryResult!6951)

(assert (=> d!92303 (= lt!303953 e!374849)))

(declare-fun c!75145 () Bool)

(assert (=> d!92303 (= c!75145 (and ((_ is Intermediate!6951) lt!303954) (undefined!7763 lt!303954)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38616 (_ BitVec 32)) SeekEntryResult!6951)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92303 (= lt!303954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92303 (validMask!0 mask!3053)))

(assert (=> d!92303 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!303953)))

(declare-fun b!653007 () Bool)

(assert (=> b!653007 (= e!374849 e!374850)))

(declare-fun lt!303955 () (_ BitVec 64))

(assert (=> b!653007 (= lt!303955 (select (arr!18511 a!2986) (index!30159 lt!303954)))))

(declare-fun c!75144 () Bool)

(assert (=> b!653007 (= c!75144 (= lt!303955 k0!1786))))

(declare-fun b!653008 () Bool)

(assert (=> b!653008 (= e!374849 Undefined!6951)))

(declare-fun b!653009 () Bool)

(declare-fun c!75146 () Bool)

(assert (=> b!653009 (= c!75146 (= lt!303955 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!653009 (= e!374850 e!374851)))

(declare-fun b!653010 () Bool)

(assert (=> b!653010 (= e!374851 (MissingZero!6951 (index!30159 lt!303954)))))

(assert (= (and d!92303 c!75145) b!653008))

(assert (= (and d!92303 (not c!75145)) b!653007))

(assert (= (and b!653007 c!75144) b!653006))

(assert (= (and b!653007 (not c!75144)) b!653009))

(assert (= (and b!653009 c!75146) b!653010))

(assert (= (and b!653009 (not c!75146)) b!653005))

(declare-fun m!626151 () Bool)

(assert (=> b!653005 m!626151))

(declare-fun m!626153 () Bool)

(assert (=> d!92303 m!626153))

(declare-fun m!626155 () Bool)

(assert (=> d!92303 m!626155))

(declare-fun m!626157 () Bool)

(assert (=> d!92303 m!626157))

(assert (=> d!92303 m!626157))

(declare-fun m!626159 () Bool)

(assert (=> d!92303 m!626159))

(assert (=> d!92303 m!625833))

(declare-fun m!626161 () Bool)

(assert (=> d!92303 m!626161))

(declare-fun m!626163 () Bool)

(assert (=> b!653007 m!626163))

(assert (=> b!652649 d!92303))

(declare-fun b!653011 () Bool)

(declare-fun e!374852 () Bool)

(assert (=> b!653011 (= e!374852 (contains!3179 Nil!12549 (select (arr!18511 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!92325 () Bool)

(declare-fun res!423452 () Bool)

(declare-fun e!374853 () Bool)

(assert (=> d!92325 (=> res!423452 e!374853)))

(assert (=> d!92325 (= res!423452 (bvsge #b00000000000000000000000000000000 (size!18875 a!2986)))))

(assert (=> d!92325 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12549) e!374853)))

(declare-fun bm!33795 () Bool)

(declare-fun call!33798 () Bool)

(declare-fun c!75147 () Bool)

(assert (=> bm!33795 (= call!33798 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75147 (Cons!12548 (select (arr!18511 a!2986) #b00000000000000000000000000000000) Nil!12549) Nil!12549)))))

(declare-fun b!653012 () Bool)

(declare-fun e!374855 () Bool)

(assert (=> b!653012 (= e!374853 e!374855)))

(declare-fun res!423453 () Bool)

(assert (=> b!653012 (=> (not res!423453) (not e!374855))))

(assert (=> b!653012 (= res!423453 (not e!374852))))

(declare-fun res!423451 () Bool)

(assert (=> b!653012 (=> (not res!423451) (not e!374852))))

(assert (=> b!653012 (= res!423451 (validKeyInArray!0 (select (arr!18511 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!653013 () Bool)

(declare-fun e!374854 () Bool)

(assert (=> b!653013 (= e!374854 call!33798)))

(declare-fun b!653014 () Bool)

(assert (=> b!653014 (= e!374854 call!33798)))

(declare-fun b!653015 () Bool)

(assert (=> b!653015 (= e!374855 e!374854)))

(assert (=> b!653015 (= c!75147 (validKeyInArray!0 (select (arr!18511 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92325 (not res!423452)) b!653012))

(assert (= (and b!653012 res!423451) b!653011))

(assert (= (and b!653012 res!423453) b!653015))

(assert (= (and b!653015 c!75147) b!653014))

(assert (= (and b!653015 (not c!75147)) b!653013))

(assert (= (or b!653014 b!653013) bm!33795))

(assert (=> b!653011 m!625983))

(assert (=> b!653011 m!625983))

(declare-fun m!626171 () Bool)

(assert (=> b!653011 m!626171))

(assert (=> bm!33795 m!625983))

(declare-fun m!626175 () Bool)

(assert (=> bm!33795 m!626175))

(assert (=> b!653012 m!625983))

(assert (=> b!653012 m!625983))

(assert (=> b!653012 m!626015))

(assert (=> b!653015 m!625983))

(assert (=> b!653015 m!625983))

(assert (=> b!653015 m!626015))

(assert (=> b!652658 d!92325))

(declare-fun d!92333 () Bool)

(declare-fun res!423471 () Bool)

(declare-fun e!374875 () Bool)

(assert (=> d!92333 (=> res!423471 e!374875)))

(assert (=> d!92333 (= res!423471 ((_ is Nil!12549) Nil!12549))))

(assert (=> d!92333 (= (noDuplicate!436 Nil!12549) e!374875)))

(declare-fun b!653037 () Bool)

(declare-fun e!374876 () Bool)

(assert (=> b!653037 (= e!374875 e!374876)))

(declare-fun res!423472 () Bool)

(assert (=> b!653037 (=> (not res!423472) (not e!374876))))

(assert (=> b!653037 (= res!423472 (not (contains!3179 (t!18780 Nil!12549) (h!13593 Nil!12549))))))

(declare-fun b!653038 () Bool)

(assert (=> b!653038 (= e!374876 (noDuplicate!436 (t!18780 Nil!12549)))))

(assert (= (and d!92333 (not res!423471)) b!653037))

(assert (= (and b!653037 res!423472) b!653038))

(declare-fun m!626199 () Bool)

(assert (=> b!653037 m!626199))

(declare-fun m!626201 () Bool)

(assert (=> b!653038 m!626201))

(assert (=> b!652659 d!92333))

(declare-fun d!92345 () Bool)

(declare-fun res!423473 () Bool)

(declare-fun e!374877 () Bool)

(assert (=> d!92345 (=> res!423473 e!374877)))

(assert (=> d!92345 (= res!423473 (= (select (arr!18511 lt!303776) index!984) (select (arr!18511 a!2986) j!136)))))

(assert (=> d!92345 (= (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) index!984) e!374877)))

(declare-fun b!653039 () Bool)

(declare-fun e!374878 () Bool)

(assert (=> b!653039 (= e!374877 e!374878)))

(declare-fun res!423474 () Bool)

(assert (=> b!653039 (=> (not res!423474) (not e!374878))))

(assert (=> b!653039 (= res!423474 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18875 lt!303776)))))

(declare-fun b!653040 () Bool)

(assert (=> b!653040 (= e!374878 (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92345 (not res!423473)) b!653039))

(assert (= (and b!653039 res!423474) b!653040))

(assert (=> d!92345 m!626075))

(assert (=> b!653040 m!625779))

(declare-fun m!626203 () Bool)

(assert (=> b!653040 m!626203))

(assert (=> b!652657 d!92345))

(declare-fun d!92349 () Bool)

(declare-fun res!423477 () Bool)

(declare-fun e!374881 () Bool)

(assert (=> d!92349 (=> res!423477 e!374881)))

(assert (=> d!92349 (= res!423477 (= (select (arr!18511 lt!303776) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18511 a!2986) j!136)))))

(assert (=> d!92349 (= (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!374881)))

(declare-fun b!653043 () Bool)

(declare-fun e!374882 () Bool)

(assert (=> b!653043 (= e!374881 e!374882)))

(declare-fun res!423478 () Bool)

(assert (=> b!653043 (=> (not res!423478) (not e!374882))))

(assert (=> b!653043 (= res!423478 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18875 lt!303776)))))

(declare-fun b!653044 () Bool)

(assert (=> b!653044 (= e!374882 (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92349 (not res!423477)) b!653043))

(assert (= (and b!653043 res!423478) b!653044))

(declare-fun m!626207 () Bool)

(assert (=> d!92349 m!626207))

(assert (=> b!653044 m!625779))

(declare-fun m!626209 () Bool)

(assert (=> b!653044 m!626209))

(assert (=> b!652666 d!92349))

(declare-fun d!92355 () Bool)

(declare-fun res!423479 () Bool)

(declare-fun e!374883 () Bool)

(assert (=> d!92355 (=> res!423479 e!374883)))

(assert (=> d!92355 (= res!423479 (= (select (arr!18511 lt!303776) j!136) (select (arr!18511 a!2986) j!136)))))

(assert (=> d!92355 (= (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) j!136) e!374883)))

(declare-fun b!653045 () Bool)

(declare-fun e!374884 () Bool)

(assert (=> b!653045 (= e!374883 e!374884)))

(declare-fun res!423480 () Bool)

(assert (=> b!653045 (=> (not res!423480) (not e!374884))))

(assert (=> b!653045 (= res!423480 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18875 lt!303776)))))

(declare-fun b!653046 () Bool)

(assert (=> b!653046 (= e!374884 (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92355 (not res!423479)) b!653045))

(assert (= (and b!653045 res!423480) b!653046))

(assert (=> d!92355 m!625945))

(assert (=> b!653046 m!625779))

(declare-fun m!626211 () Bool)

(assert (=> b!653046 m!626211))

(assert (=> b!652666 d!92355))

(assert (=> b!652666 d!92235))

(declare-fun d!92357 () Bool)

(assert (=> d!92357 (arrayContainsKey!0 lt!303776 (select (arr!18511 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303967 () Unit!22332)

(assert (=> d!92357 (= lt!303967 (choose!114 lt!303776 (select (arr!18511 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92357 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92357 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303776 (select (arr!18511 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!303967)))

(declare-fun bs!19467 () Bool)

(assert (= bs!19467 d!92357))

(assert (=> bs!19467 m!625779))

(assert (=> bs!19467 m!625841))

(assert (=> bs!19467 m!625779))

(declare-fun m!626215 () Bool)

(assert (=> bs!19467 m!626215))

(assert (=> b!652666 d!92357))

(declare-fun d!92361 () Bool)

(assert (=> d!92361 (arrayNoDuplicates!0 lt!303776 index!984 Nil!12549)))

(declare-fun lt!303970 () Unit!22332)

(assert (=> d!92361 (= lt!303970 (choose!39 lt!303776 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92361 (bvslt (size!18875 lt!303776) #b01111111111111111111111111111111)))

(assert (=> d!92361 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!303776 #b00000000000000000000000000000000 index!984) lt!303970)))

(declare-fun bs!19468 () Bool)

(assert (= bs!19468 d!92361))

(assert (=> bs!19468 m!625845))

(declare-fun m!626217 () Bool)

(assert (=> bs!19468 m!626217))

(assert (=> b!652666 d!92361))

(declare-fun b!653053 () Bool)

(declare-fun e!374888 () Bool)

(assert (=> b!653053 (= e!374888 (contains!3179 Nil!12549 (select (arr!18511 lt!303776) index!984)))))

(declare-fun d!92363 () Bool)

(declare-fun res!423482 () Bool)

(declare-fun e!374889 () Bool)

(assert (=> d!92363 (=> res!423482 e!374889)))

(assert (=> d!92363 (= res!423482 (bvsge index!984 (size!18875 lt!303776)))))

(assert (=> d!92363 (= (arrayNoDuplicates!0 lt!303776 index!984 Nil!12549) e!374889)))

(declare-fun call!33801 () Bool)

(declare-fun c!75153 () Bool)

(declare-fun bm!33798 () Bool)

(assert (=> bm!33798 (= call!33801 (arrayNoDuplicates!0 lt!303776 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75153 (Cons!12548 (select (arr!18511 lt!303776) index!984) Nil!12549) Nil!12549)))))

(declare-fun b!653054 () Bool)

(declare-fun e!374891 () Bool)

(assert (=> b!653054 (= e!374889 e!374891)))

(declare-fun res!423483 () Bool)

(assert (=> b!653054 (=> (not res!423483) (not e!374891))))

(assert (=> b!653054 (= res!423483 (not e!374888))))

(declare-fun res!423481 () Bool)

(assert (=> b!653054 (=> (not res!423481) (not e!374888))))

(assert (=> b!653054 (= res!423481 (validKeyInArray!0 (select (arr!18511 lt!303776) index!984)))))

(declare-fun b!653055 () Bool)

(declare-fun e!374890 () Bool)

(assert (=> b!653055 (= e!374890 call!33801)))

(declare-fun b!653056 () Bool)

(assert (=> b!653056 (= e!374890 call!33801)))

(declare-fun b!653057 () Bool)

(assert (=> b!653057 (= e!374891 e!374890)))

(assert (=> b!653057 (= c!75153 (validKeyInArray!0 (select (arr!18511 lt!303776) index!984)))))

(assert (= (and d!92363 (not res!423482)) b!653054))

(assert (= (and b!653054 res!423481) b!653053))

(assert (= (and b!653054 res!423483) b!653057))

(assert (= (and b!653057 c!75153) b!653056))

(assert (= (and b!653057 (not c!75153)) b!653055))

(assert (= (or b!653056 b!653055) bm!33798))

(assert (=> b!653053 m!626075))

(assert (=> b!653053 m!626075))

(declare-fun m!626229 () Bool)

(assert (=> b!653053 m!626229))

(assert (=> bm!33798 m!626075))

(declare-fun m!626231 () Bool)

(assert (=> bm!33798 m!626231))

(assert (=> b!653054 m!626075))

(assert (=> b!653054 m!626075))

(declare-fun m!626233 () Bool)

(assert (=> b!653054 m!626233))

(assert (=> b!653057 m!626075))

(assert (=> b!653057 m!626075))

(assert (=> b!653057 m!626233))

(assert (=> b!652666 d!92363))

(assert (=> b!652666 d!92243))

(assert (=> b!652656 d!92345))

(assert (=> b!652665 d!92355))

(check-sat (not b!652786) (not d!92303) (not d!92287) (not b!653012) (not b!653054) (not d!92245) (not bm!33798) (not bm!33785) (not d!92291) (not d!92273) (not b!652753) (not d!92243) (not d!92357) (not d!92221) (not b!653005) (not d!92229) (not d!92361) (not b!652784) (not b!653015) (not b!652879) (not b!652820) (not b!652780) (not b!652785) (not b!652789) (not d!92285) (not b!652887) (not b!653046) (not bm!33780) (not b!653038) (not bm!33795) (not b!652846) (not b!652763) (not b!653057) (not bm!33779) (not b!652905) (not b!653040) (not d!92289) (not b!652781) (not b!653044) (not d!92227) (not b!653053) (not b!653011) (not b!653037) (not b!652804) (not b!652847) (not b!652881))
(check-sat)
