; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56166 () Bool)

(assert start!56166)

(declare-fun b!621794 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!356631 () Bool)

(declare-datatypes ((array!37650 0))(
  ( (array!37651 (arr!18071 (Array (_ BitVec 32) (_ BitVec 64))) (size!18436 (_ BitVec 32))) )
))
(declare-fun lt!287847 () array!37650)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37650)

(declare-fun arrayContainsKey!0 (array!37650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!621794 (= e!356631 (arrayContainsKey!0 lt!287847 (select (arr!18071 a!2986) j!136) index!984))))

(declare-fun e!356634 () Bool)

(declare-fun b!621796 () Bool)

(assert (=> b!621796 (= e!356634 (arrayContainsKey!0 lt!287847 (select (arr!18071 a!2986) j!136) index!984))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun e!356632 () Bool)

(declare-datatypes ((SeekEntryResult!6508 0))(
  ( (MissingZero!6508 (index!28316 (_ BitVec 32))) (Found!6508 (index!28317 (_ BitVec 32))) (Intermediate!6508 (undefined!7320 Bool) (index!28318 (_ BitVec 32)) (x!57095 (_ BitVec 32))) (Undefined!6508) (MissingVacant!6508 (index!28319 (_ BitVec 32))) )
))
(declare-fun lt!287863 () SeekEntryResult!6508)

(declare-fun b!621797 () Bool)

(assert (=> b!621797 (= e!356632 (not (or (= lt!287863 (MissingVacant!6508 vacantSpotIndex!68)) (bvsge mask!3053 #b00000000000000000000000000000000))))))

(declare-datatypes ((Unit!20826 0))(
  ( (Unit!20827) )
))
(declare-fun lt!287852 () Unit!20826)

(declare-fun e!356630 () Unit!20826)

(assert (=> b!621797 (= lt!287852 e!356630)))

(declare-fun c!70889 () Bool)

(assert (=> b!621797 (= c!70889 (= lt!287863 (Found!6508 index!984)))))

(declare-fun lt!287860 () Unit!20826)

(declare-fun e!356622 () Unit!20826)

(assert (=> b!621797 (= lt!287860 e!356622)))

(declare-fun c!70888 () Bool)

(assert (=> b!621797 (= c!70888 (= lt!287863 Undefined!6508))))

(declare-fun lt!287857 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37650 (_ BitVec 32)) SeekEntryResult!6508)

(assert (=> b!621797 (= lt!287863 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287857 lt!287847 mask!3053))))

(declare-fun e!356629 () Bool)

(assert (=> b!621797 e!356629))

(declare-fun res!400761 () Bool)

(assert (=> b!621797 (=> (not res!400761) (not e!356629))))

(declare-fun lt!287849 () (_ BitVec 32))

(declare-fun lt!287854 () SeekEntryResult!6508)

(assert (=> b!621797 (= res!400761 (= lt!287854 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287849 vacantSpotIndex!68 lt!287857 lt!287847 mask!3053)))))

(assert (=> b!621797 (= lt!287854 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287849 vacantSpotIndex!68 (select (arr!18071 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!621797 (= lt!287857 (select (store (arr!18071 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287846 () Unit!20826)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37650 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20826)

(assert (=> b!621797 (= lt!287846 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287849 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!621797 (= lt!287849 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!621798 () Bool)

(declare-fun res!400766 () Bool)

(declare-fun e!356623 () Bool)

(assert (=> b!621798 (=> (not res!400766) (not e!356623))))

(assert (=> b!621798 (= res!400766 (and (= (size!18436 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18436 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18436 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!621799 () Bool)

(declare-fun e!356625 () Bool)

(declare-fun e!356621 () Bool)

(assert (=> b!621799 (= e!356625 e!356621)))

(declare-fun res!400760 () Bool)

(assert (=> b!621799 (=> (not res!400760) (not e!356621))))

(assert (=> b!621799 (= res!400760 (= (select (store (arr!18071 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!621799 (= lt!287847 (array!37651 (store (arr!18071 a!2986) i!1108 k0!1786) (size!18436 a!2986)))))

(declare-fun b!621800 () Bool)

(declare-fun Unit!20828 () Unit!20826)

(assert (=> b!621800 (= e!356622 Unit!20828)))

(declare-fun b!621801 () Bool)

(declare-fun Unit!20829 () Unit!20826)

(assert (=> b!621801 (= e!356630 Unit!20829)))

(declare-fun b!621802 () Bool)

(declare-fun lt!287859 () SeekEntryResult!6508)

(assert (=> b!621802 (= e!356629 (= lt!287859 lt!287854))))

(declare-fun b!621803 () Bool)

(assert (=> b!621803 false))

(declare-fun lt!287853 () Unit!20826)

(declare-datatypes ((List!12151 0))(
  ( (Nil!12148) (Cons!12147 (h!13192 (_ BitVec 64)) (t!18370 List!12151)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37650 (_ BitVec 64) (_ BitVec 32) List!12151) Unit!20826)

(assert (=> b!621803 (= lt!287853 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287847 (select (arr!18071 a!2986) j!136) index!984 Nil!12148))))

(declare-fun arrayNoDuplicates!0 (array!37650 (_ BitVec 32) List!12151) Bool)

(assert (=> b!621803 (arrayNoDuplicates!0 lt!287847 index!984 Nil!12148)))

(declare-fun lt!287856 () Unit!20826)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37650 (_ BitVec 32) (_ BitVec 32)) Unit!20826)

(assert (=> b!621803 (= lt!287856 (lemmaNoDuplicateFromThenFromBigger!0 lt!287847 #b00000000000000000000000000000000 index!984))))

(assert (=> b!621803 (arrayNoDuplicates!0 lt!287847 #b00000000000000000000000000000000 Nil!12148)))

(declare-fun lt!287851 () Unit!20826)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12151) Unit!20826)

(assert (=> b!621803 (= lt!287851 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12148))))

(assert (=> b!621803 (arrayContainsKey!0 lt!287847 (select (arr!18071 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287845 () Unit!20826)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37650 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20826)

(assert (=> b!621803 (= lt!287845 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287847 (select (arr!18071 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!621803 e!356634))

(declare-fun res!400759 () Bool)

(assert (=> b!621803 (=> (not res!400759) (not e!356634))))

(assert (=> b!621803 (= res!400759 (arrayContainsKey!0 lt!287847 (select (arr!18071 a!2986) j!136) j!136))))

(declare-fun e!356626 () Unit!20826)

(declare-fun Unit!20830 () Unit!20826)

(assert (=> b!621803 (= e!356626 Unit!20830)))

(declare-fun b!621795 () Bool)

(declare-fun res!400767 () Bool)

(assert (=> b!621795 (= res!400767 (arrayContainsKey!0 lt!287847 (select (arr!18071 a!2986) j!136) j!136))))

(assert (=> b!621795 (=> (not res!400767) (not e!356631))))

(declare-fun e!356627 () Bool)

(assert (=> b!621795 (= e!356627 e!356631)))

(declare-fun res!400757 () Bool)

(assert (=> start!56166 (=> (not res!400757) (not e!356623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56166 (= res!400757 (validMask!0 mask!3053))))

(assert (=> start!56166 e!356623))

(assert (=> start!56166 true))

(declare-fun array_inv!13954 (array!37650) Bool)

(assert (=> start!56166 (array_inv!13954 a!2986)))

(declare-fun b!621804 () Bool)

(declare-fun res!400754 () Bool)

(assert (=> b!621804 (=> (not res!400754) (not e!356625))))

(assert (=> b!621804 (= res!400754 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18071 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!621805 () Bool)

(declare-fun Unit!20831 () Unit!20826)

(assert (=> b!621805 (= e!356630 Unit!20831)))

(declare-fun res!400768 () Bool)

(assert (=> b!621805 (= res!400768 (= (select (store (arr!18071 a!2986) i!1108 k0!1786) index!984) (select (arr!18071 a!2986) j!136)))))

(declare-fun e!356633 () Bool)

(assert (=> b!621805 (=> (not res!400768) (not e!356633))))

(assert (=> b!621805 e!356633))

(declare-fun c!70890 () Bool)

(assert (=> b!621805 (= c!70890 (bvslt j!136 index!984))))

(declare-fun lt!287850 () Unit!20826)

(declare-fun e!356628 () Unit!20826)

(assert (=> b!621805 (= lt!287850 e!356628)))

(declare-fun c!70887 () Bool)

(assert (=> b!621805 (= c!70887 (bvslt index!984 j!136))))

(declare-fun lt!287844 () Unit!20826)

(assert (=> b!621805 (= lt!287844 e!356626)))

(assert (=> b!621805 false))

(declare-fun b!621806 () Bool)

(declare-fun res!400763 () Bool)

(assert (=> b!621806 (=> (not res!400763) (not e!356623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!621806 (= res!400763 (validKeyInArray!0 k0!1786))))

(declare-fun b!621807 () Bool)

(assert (=> b!621807 (= e!356621 e!356632)))

(declare-fun res!400764 () Bool)

(assert (=> b!621807 (=> (not res!400764) (not e!356632))))

(assert (=> b!621807 (= res!400764 (and (= lt!287859 (Found!6508 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18071 a!2986) index!984) (select (arr!18071 a!2986) j!136))) (not (= (select (arr!18071 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!621807 (= lt!287859 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18071 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!621808 () Bool)

(declare-fun Unit!20832 () Unit!20826)

(assert (=> b!621808 (= e!356626 Unit!20832)))

(declare-fun b!621809 () Bool)

(assert (=> b!621809 false))

(declare-fun lt!287855 () Unit!20826)

(assert (=> b!621809 (= lt!287855 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287847 (select (arr!18071 a!2986) j!136) j!136 Nil!12148))))

(assert (=> b!621809 (arrayNoDuplicates!0 lt!287847 j!136 Nil!12148)))

(declare-fun lt!287862 () Unit!20826)

(assert (=> b!621809 (= lt!287862 (lemmaNoDuplicateFromThenFromBigger!0 lt!287847 #b00000000000000000000000000000000 j!136))))

(assert (=> b!621809 (arrayNoDuplicates!0 lt!287847 #b00000000000000000000000000000000 Nil!12148)))

(declare-fun lt!287858 () Unit!20826)

(assert (=> b!621809 (= lt!287858 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12148))))

(assert (=> b!621809 (arrayContainsKey!0 lt!287847 (select (arr!18071 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287848 () Unit!20826)

(assert (=> b!621809 (= lt!287848 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287847 (select (arr!18071 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20833 () Unit!20826)

(assert (=> b!621809 (= e!356628 Unit!20833)))

(declare-fun b!621810 () Bool)

(declare-fun Unit!20834 () Unit!20826)

(assert (=> b!621810 (= e!356622 Unit!20834)))

(assert (=> b!621810 false))

(declare-fun b!621811 () Bool)

(declare-fun res!400756 () Bool)

(assert (=> b!621811 (= res!400756 (bvsge j!136 index!984))))

(assert (=> b!621811 (=> res!400756 e!356627)))

(assert (=> b!621811 (= e!356633 e!356627)))

(declare-fun b!621812 () Bool)

(declare-fun res!400769 () Bool)

(assert (=> b!621812 (=> (not res!400769) (not e!356625))))

(assert (=> b!621812 (= res!400769 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12148))))

(declare-fun b!621813 () Bool)

(declare-fun res!400758 () Bool)

(assert (=> b!621813 (=> (not res!400758) (not e!356623))))

(assert (=> b!621813 (= res!400758 (validKeyInArray!0 (select (arr!18071 a!2986) j!136)))))

(declare-fun b!621814 () Bool)

(declare-fun res!400762 () Bool)

(assert (=> b!621814 (=> (not res!400762) (not e!356625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37650 (_ BitVec 32)) Bool)

(assert (=> b!621814 (= res!400762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!621815 () Bool)

(declare-fun res!400765 () Bool)

(assert (=> b!621815 (=> (not res!400765) (not e!356623))))

(assert (=> b!621815 (= res!400765 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!621816 () Bool)

(assert (=> b!621816 (= e!356623 e!356625)))

(declare-fun res!400755 () Bool)

(assert (=> b!621816 (=> (not res!400755) (not e!356625))))

(declare-fun lt!287861 () SeekEntryResult!6508)

(assert (=> b!621816 (= res!400755 (or (= lt!287861 (MissingZero!6508 i!1108)) (= lt!287861 (MissingVacant!6508 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37650 (_ BitVec 32)) SeekEntryResult!6508)

(assert (=> b!621816 (= lt!287861 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!621817 () Bool)

(declare-fun Unit!20835 () Unit!20826)

(assert (=> b!621817 (= e!356628 Unit!20835)))

(assert (= (and start!56166 res!400757) b!621798))

(assert (= (and b!621798 res!400766) b!621813))

(assert (= (and b!621813 res!400758) b!621806))

(assert (= (and b!621806 res!400763) b!621815))

(assert (= (and b!621815 res!400765) b!621816))

(assert (= (and b!621816 res!400755) b!621814))

(assert (= (and b!621814 res!400762) b!621812))

(assert (= (and b!621812 res!400769) b!621804))

(assert (= (and b!621804 res!400754) b!621799))

(assert (= (and b!621799 res!400760) b!621807))

(assert (= (and b!621807 res!400764) b!621797))

(assert (= (and b!621797 res!400761) b!621802))

(assert (= (and b!621797 c!70888) b!621810))

(assert (= (and b!621797 (not c!70888)) b!621800))

(assert (= (and b!621797 c!70889) b!621805))

(assert (= (and b!621797 (not c!70889)) b!621801))

(assert (= (and b!621805 res!400768) b!621811))

(assert (= (and b!621811 (not res!400756)) b!621795))

(assert (= (and b!621795 res!400767) b!621794))

(assert (= (and b!621805 c!70890) b!621809))

(assert (= (and b!621805 (not c!70890)) b!621817))

(assert (= (and b!621805 c!70887) b!621803))

(assert (= (and b!621805 (not c!70887)) b!621808))

(assert (= (and b!621803 res!400759) b!621796))

(declare-fun m!597169 () Bool)

(assert (=> b!621799 m!597169))

(declare-fun m!597171 () Bool)

(assert (=> b!621799 m!597171))

(declare-fun m!597173 () Bool)

(assert (=> b!621812 m!597173))

(declare-fun m!597175 () Bool)

(assert (=> b!621816 m!597175))

(declare-fun m!597177 () Bool)

(assert (=> start!56166 m!597177))

(declare-fun m!597179 () Bool)

(assert (=> start!56166 m!597179))

(declare-fun m!597181 () Bool)

(assert (=> b!621813 m!597181))

(assert (=> b!621813 m!597181))

(declare-fun m!597183 () Bool)

(assert (=> b!621813 m!597183))

(assert (=> b!621795 m!597181))

(assert (=> b!621795 m!597181))

(declare-fun m!597185 () Bool)

(assert (=> b!621795 m!597185))

(declare-fun m!597187 () Bool)

(assert (=> b!621814 m!597187))

(declare-fun m!597189 () Bool)

(assert (=> b!621815 m!597189))

(declare-fun m!597191 () Bool)

(assert (=> b!621806 m!597191))

(assert (=> b!621805 m!597169))

(declare-fun m!597193 () Bool)

(assert (=> b!621805 m!597193))

(assert (=> b!621805 m!597181))

(assert (=> b!621796 m!597181))

(assert (=> b!621796 m!597181))

(declare-fun m!597195 () Bool)

(assert (=> b!621796 m!597195))

(assert (=> b!621809 m!597181))

(declare-fun m!597197 () Bool)

(assert (=> b!621809 m!597197))

(assert (=> b!621809 m!597181))

(assert (=> b!621809 m!597181))

(declare-fun m!597199 () Bool)

(assert (=> b!621809 m!597199))

(assert (=> b!621809 m!597181))

(declare-fun m!597201 () Bool)

(assert (=> b!621809 m!597201))

(declare-fun m!597203 () Bool)

(assert (=> b!621809 m!597203))

(declare-fun m!597205 () Bool)

(assert (=> b!621809 m!597205))

(declare-fun m!597207 () Bool)

(assert (=> b!621809 m!597207))

(declare-fun m!597209 () Bool)

(assert (=> b!621809 m!597209))

(declare-fun m!597211 () Bool)

(assert (=> b!621797 m!597211))

(declare-fun m!597213 () Bool)

(assert (=> b!621797 m!597213))

(assert (=> b!621797 m!597169))

(declare-fun m!597215 () Bool)

(assert (=> b!621797 m!597215))

(declare-fun m!597217 () Bool)

(assert (=> b!621797 m!597217))

(declare-fun m!597219 () Bool)

(assert (=> b!621797 m!597219))

(assert (=> b!621797 m!597181))

(assert (=> b!621797 m!597181))

(declare-fun m!597221 () Bool)

(assert (=> b!621797 m!597221))

(assert (=> b!621794 m!597181))

(assert (=> b!621794 m!597181))

(assert (=> b!621794 m!597195))

(declare-fun m!597223 () Bool)

(assert (=> b!621807 m!597223))

(assert (=> b!621807 m!597181))

(assert (=> b!621807 m!597181))

(declare-fun m!597225 () Bool)

(assert (=> b!621807 m!597225))

(declare-fun m!597227 () Bool)

(assert (=> b!621804 m!597227))

(declare-fun m!597229 () Bool)

(assert (=> b!621803 m!597229))

(assert (=> b!621803 m!597181))

(assert (=> b!621803 m!597181))

(declare-fun m!597231 () Bool)

(assert (=> b!621803 m!597231))

(assert (=> b!621803 m!597181))

(declare-fun m!597233 () Bool)

(assert (=> b!621803 m!597233))

(assert (=> b!621803 m!597207))

(assert (=> b!621803 m!597181))

(declare-fun m!597235 () Bool)

(assert (=> b!621803 m!597235))

(assert (=> b!621803 m!597209))

(declare-fun m!597237 () Bool)

(assert (=> b!621803 m!597237))

(assert (=> b!621803 m!597181))

(assert (=> b!621803 m!597185))

(check-sat (not b!621815) (not b!621795) (not b!621813) (not b!621807) (not b!621816) (not b!621794) (not b!621809) (not b!621797) (not b!621814) (not b!621806) (not b!621803) (not b!621812) (not b!621796) (not start!56166))
(check-sat)
