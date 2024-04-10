; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57926 () Bool)

(assert start!57926)

(declare-fun b!640772 () Bool)

(declare-fun e!366817 () Bool)

(declare-fun e!366822 () Bool)

(assert (=> b!640772 (= e!366817 (not e!366822))))

(declare-fun res!415000 () Bool)

(assert (=> b!640772 (=> res!415000 e!366822)))

(declare-datatypes ((SeekEntryResult!6836 0))(
  ( (MissingZero!6836 (index!29664 (_ BitVec 32))) (Found!6836 (index!29665 (_ BitVec 32))) (Intermediate!6836 (undefined!7648 Bool) (index!29666 (_ BitVec 32)) (x!58424 (_ BitVec 32))) (Undefined!6836) (MissingVacant!6836 (index!29667 (_ BitVec 32))) )
))
(declare-fun lt!296632 () SeekEntryResult!6836)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!640772 (= res!415000 (not (= lt!296632 (Found!6836 index!984))))))

(declare-datatypes ((Unit!21678 0))(
  ( (Unit!21679) )
))
(declare-fun lt!296630 () Unit!21678)

(declare-fun e!366820 () Unit!21678)

(assert (=> b!640772 (= lt!296630 e!366820)))

(declare-fun c!73253 () Bool)

(assert (=> b!640772 (= c!73253 (= lt!296632 Undefined!6836))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!38353 0))(
  ( (array!38354 (arr!18396 (Array (_ BitVec 32) (_ BitVec 64))) (size!18760 (_ BitVec 32))) )
))
(declare-fun lt!296624 () array!38353)

(declare-fun lt!296620 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38353 (_ BitVec 32)) SeekEntryResult!6836)

(assert (=> b!640772 (= lt!296632 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296620 lt!296624 mask!3053))))

(declare-fun e!366823 () Bool)

(assert (=> b!640772 e!366823))

(declare-fun res!415014 () Bool)

(assert (=> b!640772 (=> (not res!415014) (not e!366823))))

(declare-fun lt!296626 () SeekEntryResult!6836)

(declare-fun lt!296622 () (_ BitVec 32))

(assert (=> b!640772 (= res!415014 (= lt!296626 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296622 vacantSpotIndex!68 lt!296620 lt!296624 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38353)

(assert (=> b!640772 (= lt!296626 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296622 vacantSpotIndex!68 (select (arr!18396 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!640772 (= lt!296620 (select (store (arr!18396 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!296631 () Unit!21678)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38353 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21678)

(assert (=> b!640772 (= lt!296631 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296622 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640772 (= lt!296622 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640773 () Bool)

(declare-fun e!366818 () Bool)

(declare-fun arrayContainsKey!0 (array!38353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640773 (= e!366818 (arrayContainsKey!0 lt!296624 (select (arr!18396 a!2986) j!136) index!984))))

(declare-fun b!640774 () Bool)

(declare-fun e!366827 () Bool)

(declare-fun e!366828 () Bool)

(assert (=> b!640774 (= e!366827 e!366828)))

(declare-fun res!415010 () Bool)

(assert (=> b!640774 (=> (not res!415010) (not e!366828))))

(declare-fun lt!296625 () SeekEntryResult!6836)

(assert (=> b!640774 (= res!415010 (or (= lt!296625 (MissingZero!6836 i!1108)) (= lt!296625 (MissingVacant!6836 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38353 (_ BitVec 32)) SeekEntryResult!6836)

(assert (=> b!640774 (= lt!296625 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!640775 () Bool)

(declare-fun Unit!21680 () Unit!21678)

(assert (=> b!640775 (= e!366820 Unit!21680)))

(declare-fun b!640776 () Bool)

(declare-fun res!415011 () Bool)

(assert (=> b!640776 (=> (not res!415011) (not e!366828))))

(declare-datatypes ((List!12437 0))(
  ( (Nil!12434) (Cons!12433 (h!13478 (_ BitVec 64)) (t!18665 List!12437)) )
))
(declare-fun arrayNoDuplicates!0 (array!38353 (_ BitVec 32) List!12437) Bool)

(assert (=> b!640776 (= res!415011 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12434))))

(declare-fun b!640777 () Bool)

(declare-fun e!366824 () Bool)

(assert (=> b!640777 (= e!366822 e!366824)))

(declare-fun res!415009 () Bool)

(assert (=> b!640777 (=> res!415009 e!366824)))

(declare-fun lt!296623 () (_ BitVec 64))

(assert (=> b!640777 (= res!415009 (or (not (= (select (arr!18396 a!2986) j!136) lt!296620)) (not (= (select (arr!18396 a!2986) j!136) lt!296623)) (bvsge j!136 index!984)))))

(declare-fun e!366825 () Bool)

(assert (=> b!640777 e!366825))

(declare-fun res!415015 () Bool)

(assert (=> b!640777 (=> (not res!415015) (not e!366825))))

(assert (=> b!640777 (= res!415015 (= lt!296623 (select (arr!18396 a!2986) j!136)))))

(assert (=> b!640777 (= lt!296623 (select (store (arr!18396 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!640778 () Bool)

(declare-fun e!366819 () Bool)

(assert (=> b!640778 (= e!366825 e!366819)))

(declare-fun res!415005 () Bool)

(assert (=> b!640778 (=> res!415005 e!366819)))

(assert (=> b!640778 (= res!415005 (or (not (= (select (arr!18396 a!2986) j!136) lt!296620)) (not (= (select (arr!18396 a!2986) j!136) lt!296623)) (bvsge j!136 index!984)))))

(declare-fun b!640779 () Bool)

(assert (=> b!640779 (= e!366819 e!366818)))

(declare-fun res!415007 () Bool)

(assert (=> b!640779 (=> (not res!415007) (not e!366818))))

(assert (=> b!640779 (= res!415007 (arrayContainsKey!0 lt!296624 (select (arr!18396 a!2986) j!136) j!136))))

(declare-fun b!640780 () Bool)

(declare-fun Unit!21681 () Unit!21678)

(assert (=> b!640780 (= e!366820 Unit!21681)))

(assert (=> b!640780 false))

(declare-fun b!640781 () Bool)

(declare-fun res!415003 () Bool)

(assert (=> b!640781 (=> (not res!415003) (not e!366827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640781 (= res!415003 (validKeyInArray!0 (select (arr!18396 a!2986) j!136)))))

(declare-fun b!640782 () Bool)

(assert (=> b!640782 (= e!366824 true)))

(assert (=> b!640782 (arrayNoDuplicates!0 lt!296624 j!136 Nil!12434)))

(declare-fun lt!296621 () Unit!21678)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38353 (_ BitVec 32) (_ BitVec 32)) Unit!21678)

(assert (=> b!640782 (= lt!296621 (lemmaNoDuplicateFromThenFromBigger!0 lt!296624 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640782 (arrayNoDuplicates!0 lt!296624 #b00000000000000000000000000000000 Nil!12434)))

(declare-fun lt!296627 () Unit!21678)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38353 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12437) Unit!21678)

(assert (=> b!640782 (= lt!296627 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12434))))

(assert (=> b!640782 (arrayContainsKey!0 lt!296624 (select (arr!18396 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296629 () Unit!21678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38353 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21678)

(assert (=> b!640782 (= lt!296629 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296624 (select (arr!18396 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640784 () Bool)

(declare-fun res!415001 () Bool)

(assert (=> b!640784 (=> (not res!415001) (not e!366828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38353 (_ BitVec 32)) Bool)

(assert (=> b!640784 (= res!415001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640785 () Bool)

(declare-fun e!366826 () Bool)

(assert (=> b!640785 (= e!366828 e!366826)))

(declare-fun res!415013 () Bool)

(assert (=> b!640785 (=> (not res!415013) (not e!366826))))

(assert (=> b!640785 (= res!415013 (= (select (store (arr!18396 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640785 (= lt!296624 (array!38354 (store (arr!18396 a!2986) i!1108 k!1786) (size!18760 a!2986)))))

(declare-fun b!640786 () Bool)

(assert (=> b!640786 (= e!366826 e!366817)))

(declare-fun res!415004 () Bool)

(assert (=> b!640786 (=> (not res!415004) (not e!366817))))

(declare-fun lt!296628 () SeekEntryResult!6836)

(assert (=> b!640786 (= res!415004 (and (= lt!296628 (Found!6836 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18396 a!2986) index!984) (select (arr!18396 a!2986) j!136))) (not (= (select (arr!18396 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!640786 (= lt!296628 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18396 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640787 () Bool)

(declare-fun res!415002 () Bool)

(assert (=> b!640787 (=> (not res!415002) (not e!366827))))

(assert (=> b!640787 (= res!415002 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640788 () Bool)

(declare-fun res!415016 () Bool)

(assert (=> b!640788 (=> (not res!415016) (not e!366827))))

(assert (=> b!640788 (= res!415016 (validKeyInArray!0 k!1786))))

(declare-fun b!640789 () Bool)

(declare-fun res!415012 () Bool)

(assert (=> b!640789 (=> (not res!415012) (not e!366828))))

(assert (=> b!640789 (= res!415012 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18396 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640790 () Bool)

(declare-fun res!415008 () Bool)

(assert (=> b!640790 (=> (not res!415008) (not e!366827))))

(assert (=> b!640790 (= res!415008 (and (= (size!18760 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18760 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18760 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!415006 () Bool)

(assert (=> start!57926 (=> (not res!415006) (not e!366827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57926 (= res!415006 (validMask!0 mask!3053))))

(assert (=> start!57926 e!366827))

(assert (=> start!57926 true))

(declare-fun array_inv!14192 (array!38353) Bool)

(assert (=> start!57926 (array_inv!14192 a!2986)))

(declare-fun b!640783 () Bool)

(assert (=> b!640783 (= e!366823 (= lt!296628 lt!296626))))

(assert (= (and start!57926 res!415006) b!640790))

(assert (= (and b!640790 res!415008) b!640781))

(assert (= (and b!640781 res!415003) b!640788))

(assert (= (and b!640788 res!415016) b!640787))

(assert (= (and b!640787 res!415002) b!640774))

(assert (= (and b!640774 res!415010) b!640784))

(assert (= (and b!640784 res!415001) b!640776))

(assert (= (and b!640776 res!415011) b!640789))

(assert (= (and b!640789 res!415012) b!640785))

(assert (= (and b!640785 res!415013) b!640786))

(assert (= (and b!640786 res!415004) b!640772))

(assert (= (and b!640772 res!415014) b!640783))

(assert (= (and b!640772 c!73253) b!640780))

(assert (= (and b!640772 (not c!73253)) b!640775))

(assert (= (and b!640772 (not res!415000)) b!640777))

(assert (= (and b!640777 res!415015) b!640778))

(assert (= (and b!640778 (not res!415005)) b!640779))

(assert (= (and b!640779 res!415007) b!640773))

(assert (= (and b!640777 (not res!415009)) b!640782))

(declare-fun m!614609 () Bool)

(assert (=> b!640779 m!614609))

(assert (=> b!640779 m!614609))

(declare-fun m!614611 () Bool)

(assert (=> b!640779 m!614611))

(declare-fun m!614613 () Bool)

(assert (=> b!640774 m!614613))

(assert (=> b!640781 m!614609))

(assert (=> b!640781 m!614609))

(declare-fun m!614615 () Bool)

(assert (=> b!640781 m!614615))

(assert (=> b!640773 m!614609))

(assert (=> b!640773 m!614609))

(declare-fun m!614617 () Bool)

(assert (=> b!640773 m!614617))

(declare-fun m!614619 () Bool)

(assert (=> b!640786 m!614619))

(assert (=> b!640786 m!614609))

(assert (=> b!640786 m!614609))

(declare-fun m!614621 () Bool)

(assert (=> b!640786 m!614621))

(declare-fun m!614623 () Bool)

(assert (=> b!640785 m!614623))

(declare-fun m!614625 () Bool)

(assert (=> b!640785 m!614625))

(assert (=> b!640777 m!614609))

(assert (=> b!640777 m!614623))

(declare-fun m!614627 () Bool)

(assert (=> b!640777 m!614627))

(assert (=> b!640782 m!614609))

(declare-fun m!614629 () Bool)

(assert (=> b!640782 m!614629))

(assert (=> b!640782 m!614609))

(assert (=> b!640782 m!614609))

(declare-fun m!614631 () Bool)

(assert (=> b!640782 m!614631))

(declare-fun m!614633 () Bool)

(assert (=> b!640782 m!614633))

(declare-fun m!614635 () Bool)

(assert (=> b!640782 m!614635))

(declare-fun m!614637 () Bool)

(assert (=> b!640782 m!614637))

(declare-fun m!614639 () Bool)

(assert (=> b!640782 m!614639))

(declare-fun m!614641 () Bool)

(assert (=> start!57926 m!614641))

(declare-fun m!614643 () Bool)

(assert (=> start!57926 m!614643))

(declare-fun m!614645 () Bool)

(assert (=> b!640787 m!614645))

(declare-fun m!614647 () Bool)

(assert (=> b!640784 m!614647))

(assert (=> b!640772 m!614623))

(declare-fun m!614649 () Bool)

(assert (=> b!640772 m!614649))

(declare-fun m!614651 () Bool)

(assert (=> b!640772 m!614651))

(declare-fun m!614653 () Bool)

(assert (=> b!640772 m!614653))

(assert (=> b!640772 m!614609))

(declare-fun m!614655 () Bool)

(assert (=> b!640772 m!614655))

(declare-fun m!614657 () Bool)

(assert (=> b!640772 m!614657))

(declare-fun m!614659 () Bool)

(assert (=> b!640772 m!614659))

(assert (=> b!640772 m!614609))

(declare-fun m!614661 () Bool)

(assert (=> b!640776 m!614661))

(declare-fun m!614663 () Bool)

(assert (=> b!640789 m!614663))

(assert (=> b!640778 m!614609))

(declare-fun m!614665 () Bool)

(assert (=> b!640788 m!614665))

(push 1)

