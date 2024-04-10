; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55914 () Bool)

(assert start!55914)

(declare-fun b!612124 () Bool)

(declare-fun e!350835 () Bool)

(declare-fun e!350830 () Bool)

(assert (=> b!612124 (= e!350835 e!350830)))

(declare-fun res!393750 () Bool)

(assert (=> b!612124 (=> res!393750 e!350830)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37384 0))(
  ( (array!37385 (arr!17938 (Array (_ BitVec 32) (_ BitVec 64))) (size!18302 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37384)

(declare-fun lt!280199 () (_ BitVec 64))

(declare-fun lt!280201 () (_ BitVec 64))

(assert (=> b!612124 (= res!393750 (or (not (= (select (arr!17938 a!2986) j!136) lt!280199)) (not (= (select (arr!17938 a!2986) j!136) lt!280201))))))

(declare-fun e!350833 () Bool)

(assert (=> b!612124 e!350833))

(declare-fun res!393761 () Bool)

(assert (=> b!612124 (=> (not res!393761) (not e!350833))))

(assert (=> b!612124 (= res!393761 (= lt!280201 (select (arr!17938 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!612124 (= lt!280201 (select (store (arr!17938 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!612125 () Bool)

(declare-fun e!350839 () Bool)

(assert (=> b!612125 (= e!350833 e!350839)))

(declare-fun res!393752 () Bool)

(assert (=> b!612125 (=> res!393752 e!350839)))

(assert (=> b!612125 (= res!393752 (or (not (= (select (arr!17938 a!2986) j!136) lt!280199)) (not (= (select (arr!17938 a!2986) j!136) lt!280201)) (bvsge j!136 index!984)))))

(declare-fun b!612126 () Bool)

(declare-fun e!350832 () Bool)

(declare-fun e!350842 () Bool)

(assert (=> b!612126 (= e!350832 e!350842)))

(declare-fun res!393753 () Bool)

(assert (=> b!612126 (=> (not res!393753) (not e!350842))))

(declare-datatypes ((SeekEntryResult!6378 0))(
  ( (MissingZero!6378 (index!27796 (_ BitVec 32))) (Found!6378 (index!27797 (_ BitVec 32))) (Intermediate!6378 (undefined!7190 Bool) (index!27798 (_ BitVec 32)) (x!56610 (_ BitVec 32))) (Undefined!6378) (MissingVacant!6378 (index!27799 (_ BitVec 32))) )
))
(declare-fun lt!280193 () SeekEntryResult!6378)

(assert (=> b!612126 (= res!393753 (or (= lt!280193 (MissingZero!6378 i!1108)) (= lt!280193 (MissingVacant!6378 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37384 (_ BitVec 32)) SeekEntryResult!6378)

(assert (=> b!612126 (= lt!280193 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!612127 () Bool)

(declare-fun e!350836 () Bool)

(assert (=> b!612127 (= e!350836 true)))

(declare-fun lt!280195 () array!37384)

(declare-datatypes ((List!11979 0))(
  ( (Nil!11976) (Cons!11975 (h!13020 (_ BitVec 64)) (t!18207 List!11979)) )
))
(declare-fun arrayNoDuplicates!0 (array!37384 (_ BitVec 32) List!11979) Bool)

(assert (=> b!612127 (arrayNoDuplicates!0 lt!280195 #b00000000000000000000000000000000 Nil!11976)))

(declare-datatypes ((Unit!19648 0))(
  ( (Unit!19649) )
))
(declare-fun lt!280187 () Unit!19648)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37384 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11979) Unit!19648)

(assert (=> b!612127 (= lt!280187 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11976))))

(declare-fun arrayContainsKey!0 (array!37384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612127 (arrayContainsKey!0 lt!280195 (select (arr!17938 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280200 () Unit!19648)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37384 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19648)

(assert (=> b!612127 (= lt!280200 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280195 (select (arr!17938 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!350831 () Bool)

(assert (=> b!612127 e!350831))

(declare-fun res!393763 () Bool)

(assert (=> b!612127 (=> (not res!393763) (not e!350831))))

(assert (=> b!612127 (= res!393763 (arrayContainsKey!0 lt!280195 (select (arr!17938 a!2986) j!136) j!136))))

(declare-fun b!612128 () Bool)

(declare-fun e!350834 () Unit!19648)

(declare-fun Unit!19650 () Unit!19648)

(assert (=> b!612128 (= e!350834 Unit!19650)))

(declare-fun b!612129 () Bool)

(declare-fun e!350837 () Bool)

(assert (=> b!612129 (= e!350839 e!350837)))

(declare-fun res!393758 () Bool)

(assert (=> b!612129 (=> (not res!393758) (not e!350837))))

(assert (=> b!612129 (= res!393758 (arrayContainsKey!0 lt!280195 (select (arr!17938 a!2986) j!136) j!136))))

(declare-fun b!612130 () Bool)

(assert (=> b!612130 (= e!350837 (arrayContainsKey!0 lt!280195 (select (arr!17938 a!2986) j!136) index!984))))

(declare-fun b!612131 () Bool)

(declare-fun e!350843 () Unit!19648)

(declare-fun Unit!19651 () Unit!19648)

(assert (=> b!612131 (= e!350843 Unit!19651)))

(declare-fun b!612132 () Bool)

(declare-fun Unit!19652 () Unit!19648)

(assert (=> b!612132 (= e!350834 Unit!19652)))

(declare-fun lt!280186 () Unit!19648)

(assert (=> b!612132 (= lt!280186 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280195 (select (arr!17938 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612132 (arrayContainsKey!0 lt!280195 (select (arr!17938 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280188 () Unit!19648)

(assert (=> b!612132 (= lt!280188 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11976))))

(assert (=> b!612132 (arrayNoDuplicates!0 lt!280195 #b00000000000000000000000000000000 Nil!11976)))

(declare-fun lt!280194 () Unit!19648)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37384 (_ BitVec 32) (_ BitVec 32)) Unit!19648)

(assert (=> b!612132 (= lt!280194 (lemmaNoDuplicateFromThenFromBigger!0 lt!280195 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612132 (arrayNoDuplicates!0 lt!280195 j!136 Nil!11976)))

(declare-fun lt!280189 () Unit!19648)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37384 (_ BitVec 64) (_ BitVec 32) List!11979) Unit!19648)

(assert (=> b!612132 (= lt!280189 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280195 (select (arr!17938 a!2986) j!136) j!136 Nil!11976))))

(assert (=> b!612132 false))

(declare-fun b!612133 () Bool)

(declare-fun res!393749 () Bool)

(assert (=> b!612133 (=> (not res!393749) (not e!350832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612133 (= res!393749 (validKeyInArray!0 k0!1786))))

(declare-fun b!612134 () Bool)

(declare-fun res!393762 () Bool)

(assert (=> b!612134 (=> (not res!393762) (not e!350832))))

(assert (=> b!612134 (= res!393762 (and (= (size!18302 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18302 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18302 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612135 () Bool)

(declare-fun res!393751 () Bool)

(assert (=> b!612135 (=> (not res!393751) (not e!350842))))

(assert (=> b!612135 (= res!393751 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11976))))

(declare-fun b!612136 () Bool)

(declare-fun res!393757 () Bool)

(assert (=> b!612136 (=> (not res!393757) (not e!350832))))

(assert (=> b!612136 (= res!393757 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612137 () Bool)

(declare-fun e!350840 () Bool)

(declare-fun e!350844 () Bool)

(assert (=> b!612137 (= e!350840 e!350844)))

(declare-fun res!393755 () Bool)

(assert (=> b!612137 (=> (not res!393755) (not e!350844))))

(declare-fun lt!280196 () SeekEntryResult!6378)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!612137 (= res!393755 (and (= lt!280196 (Found!6378 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17938 a!2986) index!984) (select (arr!17938 a!2986) j!136))) (not (= (select (arr!17938 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37384 (_ BitVec 32)) SeekEntryResult!6378)

(assert (=> b!612137 (= lt!280196 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17938 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!393759 () Bool)

(assert (=> start!55914 (=> (not res!393759) (not e!350832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55914 (= res!393759 (validMask!0 mask!3053))))

(assert (=> start!55914 e!350832))

(assert (=> start!55914 true))

(declare-fun array_inv!13734 (array!37384) Bool)

(assert (=> start!55914 (array_inv!13734 a!2986)))

(declare-fun b!612138 () Bool)

(assert (=> b!612138 (= e!350842 e!350840)))

(declare-fun res!393764 () Bool)

(assert (=> b!612138 (=> (not res!393764) (not e!350840))))

(assert (=> b!612138 (= res!393764 (= (select (store (arr!17938 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612138 (= lt!280195 (array!37385 (store (arr!17938 a!2986) i!1108 k0!1786) (size!18302 a!2986)))))

(declare-fun b!612139 () Bool)

(assert (=> b!612139 (= e!350830 e!350836)))

(declare-fun res!393746 () Bool)

(assert (=> b!612139 (=> res!393746 e!350836)))

(assert (=> b!612139 (= res!393746 (bvsge index!984 j!136))))

(declare-fun lt!280197 () Unit!19648)

(assert (=> b!612139 (= lt!280197 e!350834)))

(declare-fun c!69556 () Bool)

(assert (=> b!612139 (= c!69556 (bvslt j!136 index!984))))

(declare-fun b!612140 () Bool)

(declare-fun e!350841 () Bool)

(declare-fun lt!280185 () SeekEntryResult!6378)

(assert (=> b!612140 (= e!350841 (= lt!280196 lt!280185))))

(declare-fun b!612141 () Bool)

(declare-fun res!393756 () Bool)

(assert (=> b!612141 (=> (not res!393756) (not e!350842))))

(assert (=> b!612141 (= res!393756 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17938 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612142 () Bool)

(declare-fun res!393748 () Bool)

(assert (=> b!612142 (=> (not res!393748) (not e!350842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37384 (_ BitVec 32)) Bool)

(assert (=> b!612142 (= res!393748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612143 () Bool)

(declare-fun Unit!19653 () Unit!19648)

(assert (=> b!612143 (= e!350843 Unit!19653)))

(assert (=> b!612143 false))

(declare-fun b!612144 () Bool)

(assert (=> b!612144 (= e!350831 (arrayContainsKey!0 lt!280195 (select (arr!17938 a!2986) j!136) index!984))))

(declare-fun b!612145 () Bool)

(declare-fun res!393747 () Bool)

(assert (=> b!612145 (=> (not res!393747) (not e!350832))))

(assert (=> b!612145 (= res!393747 (validKeyInArray!0 (select (arr!17938 a!2986) j!136)))))

(declare-fun b!612146 () Bool)

(assert (=> b!612146 (= e!350844 (not e!350835))))

(declare-fun res!393760 () Bool)

(assert (=> b!612146 (=> res!393760 e!350835)))

(declare-fun lt!280198 () SeekEntryResult!6378)

(assert (=> b!612146 (= res!393760 (not (= lt!280198 (Found!6378 index!984))))))

(declare-fun lt!280191 () Unit!19648)

(assert (=> b!612146 (= lt!280191 e!350843)))

(declare-fun c!69557 () Bool)

(assert (=> b!612146 (= c!69557 (= lt!280198 Undefined!6378))))

(assert (=> b!612146 (= lt!280198 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280199 lt!280195 mask!3053))))

(assert (=> b!612146 e!350841))

(declare-fun res!393754 () Bool)

(assert (=> b!612146 (=> (not res!393754) (not e!350841))))

(declare-fun lt!280190 () (_ BitVec 32))

(assert (=> b!612146 (= res!393754 (= lt!280185 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280190 vacantSpotIndex!68 lt!280199 lt!280195 mask!3053)))))

(assert (=> b!612146 (= lt!280185 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280190 vacantSpotIndex!68 (select (arr!17938 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612146 (= lt!280199 (select (store (arr!17938 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!280192 () Unit!19648)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37384 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19648)

(assert (=> b!612146 (= lt!280192 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280190 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612146 (= lt!280190 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!55914 res!393759) b!612134))

(assert (= (and b!612134 res!393762) b!612145))

(assert (= (and b!612145 res!393747) b!612133))

(assert (= (and b!612133 res!393749) b!612136))

(assert (= (and b!612136 res!393757) b!612126))

(assert (= (and b!612126 res!393753) b!612142))

(assert (= (and b!612142 res!393748) b!612135))

(assert (= (and b!612135 res!393751) b!612141))

(assert (= (and b!612141 res!393756) b!612138))

(assert (= (and b!612138 res!393764) b!612137))

(assert (= (and b!612137 res!393755) b!612146))

(assert (= (and b!612146 res!393754) b!612140))

(assert (= (and b!612146 c!69557) b!612143))

(assert (= (and b!612146 (not c!69557)) b!612131))

(assert (= (and b!612146 (not res!393760)) b!612124))

(assert (= (and b!612124 res!393761) b!612125))

(assert (= (and b!612125 (not res!393752)) b!612129))

(assert (= (and b!612129 res!393758) b!612130))

(assert (= (and b!612124 (not res!393750)) b!612139))

(assert (= (and b!612139 c!69556) b!612132))

(assert (= (and b!612139 (not c!69556)) b!612128))

(assert (= (and b!612139 (not res!393746)) b!612127))

(assert (= (and b!612127 res!393763) b!612144))

(declare-fun m!588495 () Bool)

(assert (=> b!612138 m!588495))

(declare-fun m!588497 () Bool)

(assert (=> b!612138 m!588497))

(declare-fun m!588499 () Bool)

(assert (=> b!612141 m!588499))

(declare-fun m!588501 () Bool)

(assert (=> b!612145 m!588501))

(assert (=> b!612145 m!588501))

(declare-fun m!588503 () Bool)

(assert (=> b!612145 m!588503))

(assert (=> b!612125 m!588501))

(assert (=> b!612124 m!588501))

(assert (=> b!612124 m!588495))

(declare-fun m!588505 () Bool)

(assert (=> b!612124 m!588505))

(declare-fun m!588507 () Bool)

(assert (=> b!612146 m!588507))

(declare-fun m!588509 () Bool)

(assert (=> b!612146 m!588509))

(assert (=> b!612146 m!588501))

(declare-fun m!588511 () Bool)

(assert (=> b!612146 m!588511))

(declare-fun m!588513 () Bool)

(assert (=> b!612146 m!588513))

(assert (=> b!612146 m!588501))

(assert (=> b!612146 m!588495))

(declare-fun m!588515 () Bool)

(assert (=> b!612146 m!588515))

(declare-fun m!588517 () Bool)

(assert (=> b!612146 m!588517))

(declare-fun m!588519 () Bool)

(assert (=> b!612126 m!588519))

(declare-fun m!588521 () Bool)

(assert (=> b!612136 m!588521))

(declare-fun m!588523 () Bool)

(assert (=> b!612137 m!588523))

(assert (=> b!612137 m!588501))

(assert (=> b!612137 m!588501))

(declare-fun m!588525 () Bool)

(assert (=> b!612137 m!588525))

(declare-fun m!588527 () Bool)

(assert (=> start!55914 m!588527))

(declare-fun m!588529 () Bool)

(assert (=> start!55914 m!588529))

(assert (=> b!612132 m!588501))

(declare-fun m!588531 () Bool)

(assert (=> b!612132 m!588531))

(assert (=> b!612132 m!588501))

(declare-fun m!588533 () Bool)

(assert (=> b!612132 m!588533))

(assert (=> b!612132 m!588501))

(declare-fun m!588535 () Bool)

(assert (=> b!612132 m!588535))

(declare-fun m!588537 () Bool)

(assert (=> b!612132 m!588537))

(declare-fun m!588539 () Bool)

(assert (=> b!612132 m!588539))

(assert (=> b!612132 m!588501))

(declare-fun m!588541 () Bool)

(assert (=> b!612132 m!588541))

(declare-fun m!588543 () Bool)

(assert (=> b!612132 m!588543))

(declare-fun m!588545 () Bool)

(assert (=> b!612133 m!588545))

(declare-fun m!588547 () Bool)

(assert (=> b!612142 m!588547))

(declare-fun m!588549 () Bool)

(assert (=> b!612135 m!588549))

(assert (=> b!612144 m!588501))

(assert (=> b!612144 m!588501))

(declare-fun m!588551 () Bool)

(assert (=> b!612144 m!588551))

(assert (=> b!612130 m!588501))

(assert (=> b!612130 m!588501))

(assert (=> b!612130 m!588551))

(assert (=> b!612127 m!588501))

(assert (=> b!612127 m!588501))

(declare-fun m!588553 () Bool)

(assert (=> b!612127 m!588553))

(assert (=> b!612127 m!588501))

(declare-fun m!588555 () Bool)

(assert (=> b!612127 m!588555))

(assert (=> b!612127 m!588543))

(assert (=> b!612127 m!588539))

(assert (=> b!612127 m!588501))

(declare-fun m!588557 () Bool)

(assert (=> b!612127 m!588557))

(assert (=> b!612129 m!588501))

(assert (=> b!612129 m!588501))

(assert (=> b!612129 m!588555))

(check-sat (not b!612146) (not b!612137) (not b!612126) (not b!612127) (not b!612136) (not b!612144) (not b!612129) (not b!612135) (not b!612145) (not b!612130) (not start!55914) (not b!612142) (not b!612133) (not b!612132))
(check-sat)
