; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59364 () Bool)

(assert start!59364)

(declare-fun b!655677 () Bool)

(assert (=> b!655677 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((Unit!22574 0))(
  ( (Unit!22575) )
))
(declare-fun lt!305890 () Unit!22574)

(declare-datatypes ((array!38684 0))(
  ( (array!38685 (arr!18542 (Array (_ BitVec 32) (_ BitVec 64))) (size!18906 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38684)

(declare-fun lt!305895 () array!38684)

(declare-datatypes ((List!12583 0))(
  ( (Nil!12580) (Cons!12579 (h!13624 (_ BitVec 64)) (t!18811 List!12583)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38684 (_ BitVec 64) (_ BitVec 32) List!12583) Unit!22574)

(assert (=> b!655677 (= lt!305890 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305895 (select (arr!18542 a!2986) j!136) j!136 Nil!12580))))

(declare-fun arrayNoDuplicates!0 (array!38684 (_ BitVec 32) List!12583) Bool)

(assert (=> b!655677 (arrayNoDuplicates!0 lt!305895 j!136 Nil!12580)))

(declare-fun lt!305898 () Unit!22574)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38684 (_ BitVec 32) (_ BitVec 32)) Unit!22574)

(assert (=> b!655677 (= lt!305898 (lemmaNoDuplicateFromThenFromBigger!0 lt!305895 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655677 (arrayNoDuplicates!0 lt!305895 #b00000000000000000000000000000000 Nil!12580)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!305897 () Unit!22574)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38684 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12583) Unit!22574)

(assert (=> b!655677 (= lt!305897 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12580))))

(declare-fun arrayContainsKey!0 (array!38684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655677 (arrayContainsKey!0 lt!305895 (select (arr!18542 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305883 () Unit!22574)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38684 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22574)

(assert (=> b!655677 (= lt!305883 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305895 (select (arr!18542 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!376548 () Unit!22574)

(declare-fun Unit!22576 () Unit!22574)

(assert (=> b!655677 (= e!376548 Unit!22576)))

(declare-fun b!655678 () Bool)

(declare-fun res!425340 () Bool)

(declare-fun e!376560 () Bool)

(assert (=> b!655678 (=> (not res!425340) (not e!376560))))

(assert (=> b!655678 (= res!425340 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655679 () Bool)

(declare-fun res!425335 () Bool)

(assert (=> b!655679 (=> (not res!425335) (not e!376560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655679 (= res!425335 (validKeyInArray!0 k!1786))))

(declare-fun b!655680 () Bool)

(declare-fun res!425336 () Bool)

(assert (=> b!655680 (=> (not res!425336) (not e!376560))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!655680 (= res!425336 (and (= (size!18906 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18906 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18906 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!376547 () Bool)

(declare-fun b!655681 () Bool)

(assert (=> b!655681 (= e!376547 (arrayContainsKey!0 lt!305895 (select (arr!18542 a!2986) j!136) index!984))))

(declare-fun b!655682 () Bool)

(declare-fun res!425341 () Bool)

(assert (=> b!655682 (= res!425341 (arrayContainsKey!0 lt!305895 (select (arr!18542 a!2986) j!136) j!136))))

(assert (=> b!655682 (=> (not res!425341) (not e!376547))))

(declare-fun e!376557 () Bool)

(assert (=> b!655682 (= e!376557 e!376547)))

(declare-fun b!655683 () Bool)

(assert (=> b!655683 false))

(declare-fun lt!305902 () Unit!22574)

(assert (=> b!655683 (= lt!305902 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305895 (select (arr!18542 a!2986) j!136) index!984 Nil!12580))))

(assert (=> b!655683 (arrayNoDuplicates!0 lt!305895 index!984 Nil!12580)))

(declare-fun lt!305896 () Unit!22574)

(assert (=> b!655683 (= lt!305896 (lemmaNoDuplicateFromThenFromBigger!0 lt!305895 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655683 (arrayNoDuplicates!0 lt!305895 #b00000000000000000000000000000000 Nil!12580)))

(declare-fun lt!305888 () Unit!22574)

(assert (=> b!655683 (= lt!305888 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12580))))

(assert (=> b!655683 (arrayContainsKey!0 lt!305895 (select (arr!18542 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305893 () Unit!22574)

(assert (=> b!655683 (= lt!305893 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305895 (select (arr!18542 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376552 () Bool)

(assert (=> b!655683 e!376552))

(declare-fun res!425347 () Bool)

(assert (=> b!655683 (=> (not res!425347) (not e!376552))))

(assert (=> b!655683 (= res!425347 (arrayContainsKey!0 lt!305895 (select (arr!18542 a!2986) j!136) j!136))))

(declare-fun e!376553 () Unit!22574)

(declare-fun Unit!22577 () Unit!22574)

(assert (=> b!655683 (= e!376553 Unit!22577)))

(declare-fun b!655684 () Bool)

(assert (=> b!655684 (= e!376552 (arrayContainsKey!0 lt!305895 (select (arr!18542 a!2986) j!136) index!984))))

(declare-fun b!655685 () Bool)

(declare-fun e!376555 () Bool)

(declare-datatypes ((SeekEntryResult!6982 0))(
  ( (MissingZero!6982 (index!30287 (_ BitVec 32))) (Found!6982 (index!30288 (_ BitVec 32))) (Intermediate!6982 (undefined!7794 Bool) (index!30289 (_ BitVec 32)) (x!59071 (_ BitVec 32))) (Undefined!6982) (MissingVacant!6982 (index!30290 (_ BitVec 32))) )
))
(declare-fun lt!305884 () SeekEntryResult!6982)

(declare-fun lt!305889 () SeekEntryResult!6982)

(assert (=> b!655685 (= e!376555 (= lt!305884 lt!305889))))

(declare-fun b!655686 () Bool)

(declare-fun e!376549 () Unit!22574)

(declare-fun Unit!22578 () Unit!22574)

(assert (=> b!655686 (= e!376549 Unit!22578)))

(declare-fun res!425338 () Bool)

(assert (=> b!655686 (= res!425338 (= (select (store (arr!18542 a!2986) i!1108 k!1786) index!984) (select (arr!18542 a!2986) j!136)))))

(declare-fun e!376559 () Bool)

(assert (=> b!655686 (=> (not res!425338) (not e!376559))))

(assert (=> b!655686 e!376559))

(declare-fun c!75540 () Bool)

(assert (=> b!655686 (= c!75540 (bvslt j!136 index!984))))

(declare-fun lt!305899 () Unit!22574)

(assert (=> b!655686 (= lt!305899 e!376548)))

(declare-fun c!75541 () Bool)

(assert (=> b!655686 (= c!75541 (bvslt index!984 j!136))))

(declare-fun lt!305887 () Unit!22574)

(assert (=> b!655686 (= lt!305887 e!376553)))

(assert (=> b!655686 false))

(declare-fun b!655687 () Bool)

(declare-fun res!425348 () Bool)

(declare-fun e!376550 () Bool)

(assert (=> b!655687 (=> (not res!425348) (not e!376550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38684 (_ BitVec 32)) Bool)

(assert (=> b!655687 (= res!425348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655688 () Bool)

(declare-fun e!376558 () Bool)

(declare-fun e!376554 () Bool)

(assert (=> b!655688 (= e!376558 e!376554)))

(declare-fun res!425346 () Bool)

(assert (=> b!655688 (=> (not res!425346) (not e!376554))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!655688 (= res!425346 (and (= lt!305884 (Found!6982 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18542 a!2986) index!984) (select (arr!18542 a!2986) j!136))) (not (= (select (arr!18542 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38684 (_ BitVec 32)) SeekEntryResult!6982)

(assert (=> b!655688 (= lt!305884 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18542 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655689 () Bool)

(declare-fun Unit!22579 () Unit!22574)

(assert (=> b!655689 (= e!376549 Unit!22579)))

(declare-fun b!655690 () Bool)

(declare-fun res!425334 () Bool)

(assert (=> b!655690 (=> (not res!425334) (not e!376560))))

(assert (=> b!655690 (= res!425334 (validKeyInArray!0 (select (arr!18542 a!2986) j!136)))))

(declare-fun b!655691 () Bool)

(assert (=> b!655691 (= e!376560 e!376550)))

(declare-fun res!425345 () Bool)

(assert (=> b!655691 (=> (not res!425345) (not e!376550))))

(declare-fun lt!305886 () SeekEntryResult!6982)

(assert (=> b!655691 (= res!425345 (or (= lt!305886 (MissingZero!6982 i!1108)) (= lt!305886 (MissingVacant!6982 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38684 (_ BitVec 32)) SeekEntryResult!6982)

(assert (=> b!655691 (= lt!305886 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!655692 () Bool)

(assert (=> b!655692 (= e!376554 (not true))))

(declare-fun lt!305901 () Unit!22574)

(assert (=> b!655692 (= lt!305901 e!376549)))

(declare-fun c!75539 () Bool)

(declare-fun lt!305894 () SeekEntryResult!6982)

(assert (=> b!655692 (= c!75539 (= lt!305894 (Found!6982 index!984)))))

(declare-fun lt!305885 () Unit!22574)

(declare-fun e!376551 () Unit!22574)

(assert (=> b!655692 (= lt!305885 e!376551)))

(declare-fun c!75542 () Bool)

(assert (=> b!655692 (= c!75542 (= lt!305894 Undefined!6982))))

(declare-fun lt!305892 () (_ BitVec 64))

(assert (=> b!655692 (= lt!305894 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305892 lt!305895 mask!3053))))

(assert (=> b!655692 e!376555))

(declare-fun res!425339 () Bool)

(assert (=> b!655692 (=> (not res!425339) (not e!376555))))

(declare-fun lt!305891 () (_ BitVec 32))

(assert (=> b!655692 (= res!425339 (= lt!305889 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305891 vacantSpotIndex!68 lt!305892 lt!305895 mask!3053)))))

(assert (=> b!655692 (= lt!305889 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305891 vacantSpotIndex!68 (select (arr!18542 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655692 (= lt!305892 (select (store (arr!18542 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!305900 () Unit!22574)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38684 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22574)

(assert (=> b!655692 (= lt!305900 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305891 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655692 (= lt!305891 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655693 () Bool)

(declare-fun Unit!22580 () Unit!22574)

(assert (=> b!655693 (= e!376548 Unit!22580)))

(declare-fun b!655694 () Bool)

(declare-fun res!425344 () Bool)

(assert (=> b!655694 (=> (not res!425344) (not e!376550))))

(assert (=> b!655694 (= res!425344 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12580))))

(declare-fun b!655695 () Bool)

(declare-fun Unit!22581 () Unit!22574)

(assert (=> b!655695 (= e!376551 Unit!22581)))

(assert (=> b!655695 false))

(declare-fun b!655696 () Bool)

(declare-fun res!425337 () Bool)

(assert (=> b!655696 (=> (not res!425337) (not e!376550))))

(assert (=> b!655696 (= res!425337 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18542 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655697 () Bool)

(declare-fun res!425333 () Bool)

(assert (=> b!655697 (= res!425333 (bvsge j!136 index!984))))

(assert (=> b!655697 (=> res!425333 e!376557)))

(assert (=> b!655697 (= e!376559 e!376557)))

(declare-fun b!655698 () Bool)

(assert (=> b!655698 (= e!376550 e!376558)))

(declare-fun res!425342 () Bool)

(assert (=> b!655698 (=> (not res!425342) (not e!376558))))

(assert (=> b!655698 (= res!425342 (= (select (store (arr!18542 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655698 (= lt!305895 (array!38685 (store (arr!18542 a!2986) i!1108 k!1786) (size!18906 a!2986)))))

(declare-fun res!425343 () Bool)

(assert (=> start!59364 (=> (not res!425343) (not e!376560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59364 (= res!425343 (validMask!0 mask!3053))))

(assert (=> start!59364 e!376560))

(assert (=> start!59364 true))

(declare-fun array_inv!14338 (array!38684) Bool)

(assert (=> start!59364 (array_inv!14338 a!2986)))

(declare-fun b!655699 () Bool)

(declare-fun Unit!22582 () Unit!22574)

(assert (=> b!655699 (= e!376553 Unit!22582)))

(declare-fun b!655700 () Bool)

(declare-fun Unit!22583 () Unit!22574)

(assert (=> b!655700 (= e!376551 Unit!22583)))

(assert (= (and start!59364 res!425343) b!655680))

(assert (= (and b!655680 res!425336) b!655690))

(assert (= (and b!655690 res!425334) b!655679))

(assert (= (and b!655679 res!425335) b!655678))

(assert (= (and b!655678 res!425340) b!655691))

(assert (= (and b!655691 res!425345) b!655687))

(assert (= (and b!655687 res!425348) b!655694))

(assert (= (and b!655694 res!425344) b!655696))

(assert (= (and b!655696 res!425337) b!655698))

(assert (= (and b!655698 res!425342) b!655688))

(assert (= (and b!655688 res!425346) b!655692))

(assert (= (and b!655692 res!425339) b!655685))

(assert (= (and b!655692 c!75542) b!655695))

(assert (= (and b!655692 (not c!75542)) b!655700))

(assert (= (and b!655692 c!75539) b!655686))

(assert (= (and b!655692 (not c!75539)) b!655689))

(assert (= (and b!655686 res!425338) b!655697))

(assert (= (and b!655697 (not res!425333)) b!655682))

(assert (= (and b!655682 res!425341) b!655681))

(assert (= (and b!655686 c!75540) b!655677))

(assert (= (and b!655686 (not c!75540)) b!655693))

(assert (= (and b!655686 c!75541) b!655683))

(assert (= (and b!655686 (not c!75541)) b!655699))

(assert (= (and b!655683 res!425347) b!655684))

(declare-fun m!628747 () Bool)

(assert (=> b!655684 m!628747))

(assert (=> b!655684 m!628747))

(declare-fun m!628749 () Bool)

(assert (=> b!655684 m!628749))

(declare-fun m!628751 () Bool)

(assert (=> b!655683 m!628751))

(assert (=> b!655683 m!628747))

(declare-fun m!628753 () Bool)

(assert (=> b!655683 m!628753))

(assert (=> b!655683 m!628747))

(assert (=> b!655683 m!628747))

(declare-fun m!628755 () Bool)

(assert (=> b!655683 m!628755))

(declare-fun m!628757 () Bool)

(assert (=> b!655683 m!628757))

(assert (=> b!655683 m!628747))

(declare-fun m!628759 () Bool)

(assert (=> b!655683 m!628759))

(assert (=> b!655683 m!628747))

(declare-fun m!628761 () Bool)

(assert (=> b!655683 m!628761))

(declare-fun m!628763 () Bool)

(assert (=> b!655683 m!628763))

(declare-fun m!628765 () Bool)

(assert (=> b!655683 m!628765))

(assert (=> b!655682 m!628747))

(assert (=> b!655682 m!628747))

(assert (=> b!655682 m!628753))

(declare-fun m!628767 () Bool)

(assert (=> b!655679 m!628767))

(declare-fun m!628769 () Bool)

(assert (=> start!59364 m!628769))

(declare-fun m!628771 () Bool)

(assert (=> start!59364 m!628771))

(declare-fun m!628773 () Bool)

(assert (=> b!655698 m!628773))

(declare-fun m!628775 () Bool)

(assert (=> b!655698 m!628775))

(declare-fun m!628777 () Bool)

(assert (=> b!655696 m!628777))

(declare-fun m!628779 () Bool)

(assert (=> b!655692 m!628779))

(assert (=> b!655692 m!628747))

(declare-fun m!628781 () Bool)

(assert (=> b!655692 m!628781))

(declare-fun m!628783 () Bool)

(assert (=> b!655692 m!628783))

(assert (=> b!655692 m!628747))

(declare-fun m!628785 () Bool)

(assert (=> b!655692 m!628785))

(declare-fun m!628787 () Bool)

(assert (=> b!655692 m!628787))

(assert (=> b!655692 m!628773))

(declare-fun m!628789 () Bool)

(assert (=> b!655692 m!628789))

(declare-fun m!628791 () Bool)

(assert (=> b!655687 m!628791))

(declare-fun m!628793 () Bool)

(assert (=> b!655678 m!628793))

(assert (=> b!655681 m!628747))

(assert (=> b!655681 m!628747))

(assert (=> b!655681 m!628749))

(assert (=> b!655690 m!628747))

(assert (=> b!655690 m!628747))

(declare-fun m!628795 () Bool)

(assert (=> b!655690 m!628795))

(declare-fun m!628797 () Bool)

(assert (=> b!655691 m!628797))

(assert (=> b!655686 m!628773))

(declare-fun m!628799 () Bool)

(assert (=> b!655686 m!628799))

(assert (=> b!655686 m!628747))

(declare-fun m!628801 () Bool)

(assert (=> b!655677 m!628801))

(assert (=> b!655677 m!628747))

(assert (=> b!655677 m!628747))

(declare-fun m!628803 () Bool)

(assert (=> b!655677 m!628803))

(declare-fun m!628805 () Bool)

(assert (=> b!655677 m!628805))

(assert (=> b!655677 m!628763))

(assert (=> b!655677 m!628747))

(declare-fun m!628807 () Bool)

(assert (=> b!655677 m!628807))

(assert (=> b!655677 m!628747))

(declare-fun m!628809 () Bool)

(assert (=> b!655677 m!628809))

(assert (=> b!655677 m!628757))

(declare-fun m!628811 () Bool)

(assert (=> b!655694 m!628811))

(declare-fun m!628813 () Bool)

(assert (=> b!655688 m!628813))

(assert (=> b!655688 m!628747))

(assert (=> b!655688 m!628747))

(declare-fun m!628815 () Bool)

(assert (=> b!655688 m!628815))

(push 1)

