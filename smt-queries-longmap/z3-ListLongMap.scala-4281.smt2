; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59596 () Bool)

(assert start!59596)

(declare-fun b!658731 () Bool)

(declare-fun res!427197 () Bool)

(declare-fun e!378429 () Bool)

(assert (=> b!658731 (=> (not res!427197) (not e!378429))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38754 0))(
  ( (array!38755 (arr!18574 (Array (_ BitVec 32) (_ BitVec 64))) (size!18938 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38754)

(assert (=> b!658731 (= res!427197 (and (= (size!18938 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18938 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18938 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!658732 () Bool)

(declare-fun e!378432 () Bool)

(declare-fun e!378430 () Bool)

(assert (=> b!658732 (= e!378432 e!378430)))

(declare-fun res!427196 () Bool)

(assert (=> b!658732 (=> (not res!427196) (not e!378430))))

(declare-datatypes ((SeekEntryResult!7014 0))(
  ( (MissingZero!7014 (index!30421 (_ BitVec 32))) (Found!7014 (index!30422 (_ BitVec 32))) (Intermediate!7014 (undefined!7826 Bool) (index!30423 (_ BitVec 32)) (x!59209 (_ BitVec 32))) (Undefined!7014) (MissingVacant!7014 (index!30424 (_ BitVec 32))) )
))
(declare-fun lt!308111 () SeekEntryResult!7014)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!658732 (= res!427196 (and (= lt!308111 (Found!7014 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18574 a!2986) index!984) (select (arr!18574 a!2986) j!136))) (not (= (select (arr!18574 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38754 (_ BitVec 32)) SeekEntryResult!7014)

(assert (=> b!658732 (= lt!308111 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18574 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!427190 () Bool)

(declare-fun b!658734 () Bool)

(declare-fun lt!308126 () array!38754)

(declare-fun arrayContainsKey!0 (array!38754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!658734 (= res!427190 (arrayContainsKey!0 lt!308126 (select (arr!18574 a!2986) j!136) j!136))))

(declare-fun e!378435 () Bool)

(assert (=> b!658734 (=> (not res!427190) (not e!378435))))

(declare-fun e!378434 () Bool)

(assert (=> b!658734 (= e!378434 e!378435)))

(declare-fun b!658735 () Bool)

(assert (=> b!658735 false))

(declare-datatypes ((Unit!22894 0))(
  ( (Unit!22895) )
))
(declare-fun lt!308118 () Unit!22894)

(declare-datatypes ((List!12615 0))(
  ( (Nil!12612) (Cons!12611 (h!13656 (_ BitVec 64)) (t!18843 List!12615)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38754 (_ BitVec 64) (_ BitVec 32) List!12615) Unit!22894)

(assert (=> b!658735 (= lt!308118 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308126 (select (arr!18574 a!2986) j!136) index!984 Nil!12612))))

(declare-fun arrayNoDuplicates!0 (array!38754 (_ BitVec 32) List!12615) Bool)

(assert (=> b!658735 (arrayNoDuplicates!0 lt!308126 index!984 Nil!12612)))

(declare-fun lt!308119 () Unit!22894)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38754 (_ BitVec 32) (_ BitVec 32)) Unit!22894)

(assert (=> b!658735 (= lt!308119 (lemmaNoDuplicateFromThenFromBigger!0 lt!308126 #b00000000000000000000000000000000 index!984))))

(assert (=> b!658735 (arrayNoDuplicates!0 lt!308126 #b00000000000000000000000000000000 Nil!12612)))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!308127 () Unit!22894)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38754 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12615) Unit!22894)

(assert (=> b!658735 (= lt!308127 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12612))))

(assert (=> b!658735 (arrayContainsKey!0 lt!308126 (select (arr!18574 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!308124 () Unit!22894)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38754 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22894)

(assert (=> b!658735 (= lt!308124 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308126 (select (arr!18574 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!378425 () Bool)

(assert (=> b!658735 e!378425))

(declare-fun res!427200 () Bool)

(assert (=> b!658735 (=> (not res!427200) (not e!378425))))

(assert (=> b!658735 (= res!427200 (arrayContainsKey!0 lt!308126 (select (arr!18574 a!2986) j!136) j!136))))

(declare-fun e!378426 () Unit!22894)

(declare-fun Unit!22896 () Unit!22894)

(assert (=> b!658735 (= e!378426 Unit!22896)))

(declare-fun b!658736 () Bool)

(declare-fun e!378436 () Unit!22894)

(declare-fun Unit!22897 () Unit!22894)

(assert (=> b!658736 (= e!378436 Unit!22897)))

(declare-fun res!427187 () Bool)

(assert (=> b!658736 (= res!427187 (= (select (store (arr!18574 a!2986) i!1108 k0!1786) index!984) (select (arr!18574 a!2986) j!136)))))

(declare-fun e!378437 () Bool)

(assert (=> b!658736 (=> (not res!427187) (not e!378437))))

(assert (=> b!658736 e!378437))

(declare-fun c!76142 () Bool)

(assert (=> b!658736 (= c!76142 (bvslt j!136 index!984))))

(declare-fun lt!308128 () Unit!22894)

(declare-fun e!378438 () Unit!22894)

(assert (=> b!658736 (= lt!308128 e!378438)))

(declare-fun c!76140 () Bool)

(assert (=> b!658736 (= c!76140 (bvslt index!984 j!136))))

(declare-fun lt!308114 () Unit!22894)

(assert (=> b!658736 (= lt!308114 e!378426)))

(assert (=> b!658736 false))

(declare-fun b!658737 () Bool)

(assert (=> b!658737 (= e!378425 (arrayContainsKey!0 lt!308126 (select (arr!18574 a!2986) j!136) index!984))))

(declare-fun b!658738 () Bool)

(declare-fun res!427194 () Bool)

(declare-fun e!378428 () Bool)

(assert (=> b!658738 (=> (not res!427194) (not e!378428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38754 (_ BitVec 32)) Bool)

(assert (=> b!658738 (= res!427194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!658739 () Bool)

(declare-fun e!378433 () Unit!22894)

(declare-fun Unit!22898 () Unit!22894)

(assert (=> b!658739 (= e!378433 Unit!22898)))

(assert (=> b!658739 false))

(declare-fun b!658740 () Bool)

(declare-fun res!427198 () Bool)

(assert (=> b!658740 (= res!427198 (bvsge j!136 index!984))))

(assert (=> b!658740 (=> res!427198 e!378434)))

(assert (=> b!658740 (= e!378437 e!378434)))

(declare-fun b!658741 () Bool)

(assert (=> b!658741 (= e!378430 (not true))))

(declare-fun lt!308113 () Unit!22894)

(assert (=> b!658741 (= lt!308113 e!378436)))

(declare-fun c!76141 () Bool)

(declare-fun lt!308120 () SeekEntryResult!7014)

(assert (=> b!658741 (= c!76141 (= lt!308120 (Found!7014 index!984)))))

(declare-fun lt!308125 () Unit!22894)

(assert (=> b!658741 (= lt!308125 e!378433)))

(declare-fun c!76139 () Bool)

(assert (=> b!658741 (= c!76139 (= lt!308120 Undefined!7014))))

(declare-fun lt!308117 () (_ BitVec 64))

(assert (=> b!658741 (= lt!308120 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!308117 lt!308126 mask!3053))))

(declare-fun e!378427 () Bool)

(assert (=> b!658741 e!378427))

(declare-fun res!427201 () Bool)

(assert (=> b!658741 (=> (not res!427201) (not e!378427))))

(declare-fun lt!308112 () SeekEntryResult!7014)

(declare-fun lt!308123 () (_ BitVec 32))

(assert (=> b!658741 (= res!427201 (= lt!308112 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308123 vacantSpotIndex!68 lt!308117 lt!308126 mask!3053)))))

(assert (=> b!658741 (= lt!308112 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!308123 vacantSpotIndex!68 (select (arr!18574 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!658741 (= lt!308117 (select (store (arr!18574 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!308110 () Unit!22894)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38754 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22894)

(assert (=> b!658741 (= lt!308110 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!308123 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!658741 (= lt!308123 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!658742 () Bool)

(declare-fun Unit!22899 () Unit!22894)

(assert (=> b!658742 (= e!378433 Unit!22899)))

(declare-fun b!658743 () Bool)

(declare-fun Unit!22900 () Unit!22894)

(assert (=> b!658743 (= e!378426 Unit!22900)))

(declare-fun b!658744 () Bool)

(declare-fun res!427192 () Bool)

(assert (=> b!658744 (=> (not res!427192) (not e!378429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!658744 (= res!427192 (validKeyInArray!0 k0!1786))))

(declare-fun b!658745 () Bool)

(declare-fun res!427191 () Bool)

(assert (=> b!658745 (=> (not res!427191) (not e!378429))))

(assert (=> b!658745 (= res!427191 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!658733 () Bool)

(assert (=> b!658733 (= e!378429 e!378428)))

(declare-fun res!427188 () Bool)

(assert (=> b!658733 (=> (not res!427188) (not e!378428))))

(declare-fun lt!308115 () SeekEntryResult!7014)

(assert (=> b!658733 (= res!427188 (or (= lt!308115 (MissingZero!7014 i!1108)) (= lt!308115 (MissingVacant!7014 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38754 (_ BitVec 32)) SeekEntryResult!7014)

(assert (=> b!658733 (= lt!308115 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!427195 () Bool)

(assert (=> start!59596 (=> (not res!427195) (not e!378429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59596 (= res!427195 (validMask!0 mask!3053))))

(assert (=> start!59596 e!378429))

(assert (=> start!59596 true))

(declare-fun array_inv!14370 (array!38754) Bool)

(assert (=> start!59596 (array_inv!14370 a!2986)))

(declare-fun b!658746 () Bool)

(assert (=> b!658746 (= e!378427 (= lt!308111 lt!308112))))

(declare-fun b!658747 () Bool)

(declare-fun Unit!22901 () Unit!22894)

(assert (=> b!658747 (= e!378438 Unit!22901)))

(declare-fun b!658748 () Bool)

(declare-fun res!427199 () Bool)

(assert (=> b!658748 (=> (not res!427199) (not e!378428))))

(assert (=> b!658748 (= res!427199 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18574 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!658749 () Bool)

(declare-fun res!427202 () Bool)

(assert (=> b!658749 (=> (not res!427202) (not e!378428))))

(assert (=> b!658749 (= res!427202 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12612))))

(declare-fun b!658750 () Bool)

(assert (=> b!658750 (= e!378435 (arrayContainsKey!0 lt!308126 (select (arr!18574 a!2986) j!136) index!984))))

(declare-fun b!658751 () Bool)

(assert (=> b!658751 false))

(declare-fun lt!308109 () Unit!22894)

(assert (=> b!658751 (= lt!308109 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!308126 (select (arr!18574 a!2986) j!136) j!136 Nil!12612))))

(assert (=> b!658751 (arrayNoDuplicates!0 lt!308126 j!136 Nil!12612)))

(declare-fun lt!308116 () Unit!22894)

(assert (=> b!658751 (= lt!308116 (lemmaNoDuplicateFromThenFromBigger!0 lt!308126 #b00000000000000000000000000000000 j!136))))

(assert (=> b!658751 (arrayNoDuplicates!0 lt!308126 #b00000000000000000000000000000000 Nil!12612)))

(declare-fun lt!308122 () Unit!22894)

(assert (=> b!658751 (= lt!308122 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12612))))

(assert (=> b!658751 (arrayContainsKey!0 lt!308126 (select (arr!18574 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!308121 () Unit!22894)

(assert (=> b!658751 (= lt!308121 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!308126 (select (arr!18574 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22902 () Unit!22894)

(assert (=> b!658751 (= e!378438 Unit!22902)))

(declare-fun b!658752 () Bool)

(assert (=> b!658752 (= e!378428 e!378432)))

(declare-fun res!427193 () Bool)

(assert (=> b!658752 (=> (not res!427193) (not e!378432))))

(assert (=> b!658752 (= res!427193 (= (select (store (arr!18574 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!658752 (= lt!308126 (array!38755 (store (arr!18574 a!2986) i!1108 k0!1786) (size!18938 a!2986)))))

(declare-fun b!658753 () Bool)

(declare-fun res!427189 () Bool)

(assert (=> b!658753 (=> (not res!427189) (not e!378429))))

(assert (=> b!658753 (= res!427189 (validKeyInArray!0 (select (arr!18574 a!2986) j!136)))))

(declare-fun b!658754 () Bool)

(declare-fun Unit!22903 () Unit!22894)

(assert (=> b!658754 (= e!378436 Unit!22903)))

(assert (= (and start!59596 res!427195) b!658731))

(assert (= (and b!658731 res!427197) b!658753))

(assert (= (and b!658753 res!427189) b!658744))

(assert (= (and b!658744 res!427192) b!658745))

(assert (= (and b!658745 res!427191) b!658733))

(assert (= (and b!658733 res!427188) b!658738))

(assert (= (and b!658738 res!427194) b!658749))

(assert (= (and b!658749 res!427202) b!658748))

(assert (= (and b!658748 res!427199) b!658752))

(assert (= (and b!658752 res!427193) b!658732))

(assert (= (and b!658732 res!427196) b!658741))

(assert (= (and b!658741 res!427201) b!658746))

(assert (= (and b!658741 c!76139) b!658739))

(assert (= (and b!658741 (not c!76139)) b!658742))

(assert (= (and b!658741 c!76141) b!658736))

(assert (= (and b!658741 (not c!76141)) b!658754))

(assert (= (and b!658736 res!427187) b!658740))

(assert (= (and b!658740 (not res!427198)) b!658734))

(assert (= (and b!658734 res!427190) b!658750))

(assert (= (and b!658736 c!76142) b!658751))

(assert (= (and b!658736 (not c!76142)) b!658747))

(assert (= (and b!658736 c!76140) b!658735))

(assert (= (and b!658736 (not c!76140)) b!658743))

(assert (= (and b!658735 res!427200) b!658737))

(declare-fun m!631707 () Bool)

(assert (=> b!658748 m!631707))

(declare-fun m!631709 () Bool)

(assert (=> b!658749 m!631709))

(declare-fun m!631711 () Bool)

(assert (=> b!658735 m!631711))

(declare-fun m!631713 () Bool)

(assert (=> b!658735 m!631713))

(assert (=> b!658735 m!631711))

(assert (=> b!658735 m!631711))

(declare-fun m!631715 () Bool)

(assert (=> b!658735 m!631715))

(assert (=> b!658735 m!631711))

(declare-fun m!631717 () Bool)

(assert (=> b!658735 m!631717))

(declare-fun m!631719 () Bool)

(assert (=> b!658735 m!631719))

(declare-fun m!631721 () Bool)

(assert (=> b!658735 m!631721))

(declare-fun m!631723 () Bool)

(assert (=> b!658735 m!631723))

(assert (=> b!658735 m!631711))

(declare-fun m!631725 () Bool)

(assert (=> b!658735 m!631725))

(declare-fun m!631727 () Bool)

(assert (=> b!658735 m!631727))

(declare-fun m!631729 () Bool)

(assert (=> b!658733 m!631729))

(declare-fun m!631731 () Bool)

(assert (=> b!658736 m!631731))

(declare-fun m!631733 () Bool)

(assert (=> b!658736 m!631733))

(assert (=> b!658736 m!631711))

(assert (=> b!658734 m!631711))

(assert (=> b!658734 m!631711))

(assert (=> b!658734 m!631725))

(declare-fun m!631735 () Bool)

(assert (=> start!59596 m!631735))

(declare-fun m!631737 () Bool)

(assert (=> start!59596 m!631737))

(assert (=> b!658737 m!631711))

(assert (=> b!658737 m!631711))

(declare-fun m!631739 () Bool)

(assert (=> b!658737 m!631739))

(declare-fun m!631741 () Bool)

(assert (=> b!658732 m!631741))

(assert (=> b!658732 m!631711))

(assert (=> b!658732 m!631711))

(declare-fun m!631743 () Bool)

(assert (=> b!658732 m!631743))

(declare-fun m!631745 () Bool)

(assert (=> b!658744 m!631745))

(assert (=> b!658752 m!631731))

(declare-fun m!631747 () Bool)

(assert (=> b!658752 m!631747))

(assert (=> b!658750 m!631711))

(assert (=> b!658750 m!631711))

(assert (=> b!658750 m!631739))

(declare-fun m!631749 () Bool)

(assert (=> b!658738 m!631749))

(assert (=> b!658753 m!631711))

(assert (=> b!658753 m!631711))

(declare-fun m!631751 () Bool)

(assert (=> b!658753 m!631751))

(declare-fun m!631753 () Bool)

(assert (=> b!658745 m!631753))

(assert (=> b!658751 m!631711))

(declare-fun m!631755 () Bool)

(assert (=> b!658751 m!631755))

(assert (=> b!658751 m!631711))

(assert (=> b!658751 m!631711))

(declare-fun m!631757 () Bool)

(assert (=> b!658751 m!631757))

(declare-fun m!631759 () Bool)

(assert (=> b!658751 m!631759))

(assert (=> b!658751 m!631711))

(declare-fun m!631761 () Bool)

(assert (=> b!658751 m!631761))

(declare-fun m!631763 () Bool)

(assert (=> b!658751 m!631763))

(assert (=> b!658751 m!631721))

(assert (=> b!658751 m!631723))

(declare-fun m!631765 () Bool)

(assert (=> b!658741 m!631765))

(assert (=> b!658741 m!631711))

(declare-fun m!631767 () Bool)

(assert (=> b!658741 m!631767))

(assert (=> b!658741 m!631711))

(assert (=> b!658741 m!631731))

(declare-fun m!631769 () Bool)

(assert (=> b!658741 m!631769))

(declare-fun m!631771 () Bool)

(assert (=> b!658741 m!631771))

(declare-fun m!631773 () Bool)

(assert (=> b!658741 m!631773))

(declare-fun m!631775 () Bool)

(assert (=> b!658741 m!631775))

(check-sat (not b!658744) (not b!658734) (not b!658751) (not b!658735) (not b!658741) (not b!658745) (not b!658732) (not b!658738) (not b!658749) (not b!658733) (not b!658737) (not start!59596) (not b!658753) (not b!658750))
(check-sat)
