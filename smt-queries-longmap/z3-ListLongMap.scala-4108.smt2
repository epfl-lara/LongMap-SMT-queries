; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56148 () Bool)

(assert start!56148)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!620841 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37618 0))(
  ( (array!37619 (arr!18055 (Array (_ BitVec 32) (_ BitVec 64))) (size!18419 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37618)

(declare-fun lt!287063 () array!37618)

(declare-fun e!356082 () Bool)

(declare-fun arrayContainsKey!0 (array!37618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620841 (= e!356082 (arrayContainsKey!0 lt!287063 (select (arr!18055 a!2986) j!136) index!984))))

(declare-fun res!400076 () Bool)

(declare-fun e!356092 () Bool)

(assert (=> start!56148 (=> (not res!400076) (not e!356092))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56148 (= res!400076 (validMask!0 mask!3053))))

(assert (=> start!56148 e!356092))

(assert (=> start!56148 true))

(declare-fun array_inv!13851 (array!37618) Bool)

(assert (=> start!56148 (array_inv!13851 a!2986)))

(declare-fun b!620842 () Bool)

(declare-fun res!400077 () Bool)

(declare-fun e!356084 () Bool)

(assert (=> b!620842 (=> (not res!400077) (not e!356084))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!620842 (= res!400077 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18055 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620843 () Bool)

(declare-fun res!400075 () Bool)

(assert (=> b!620843 (=> (not res!400075) (not e!356092))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!620843 (= res!400075 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!620844 () Bool)

(declare-datatypes ((Unit!20678 0))(
  ( (Unit!20679) )
))
(declare-fun e!356089 () Unit!20678)

(declare-fun Unit!20680 () Unit!20678)

(assert (=> b!620844 (= e!356089 Unit!20680)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun res!400079 () Bool)

(assert (=> b!620844 (= res!400079 (= (select (store (arr!18055 a!2986) i!1108 k0!1786) index!984) (select (arr!18055 a!2986) j!136)))))

(declare-fun e!356093 () Bool)

(assert (=> b!620844 (=> (not res!400079) (not e!356093))))

(assert (=> b!620844 e!356093))

(declare-fun c!70754 () Bool)

(assert (=> b!620844 (= c!70754 (bvslt j!136 index!984))))

(declare-fun lt!287059 () Unit!20678)

(declare-fun e!356094 () Unit!20678)

(assert (=> b!620844 (= lt!287059 e!356094)))

(declare-fun c!70756 () Bool)

(assert (=> b!620844 (= c!70756 (bvslt index!984 j!136))))

(declare-fun lt!287069 () Unit!20678)

(declare-fun e!356086 () Unit!20678)

(assert (=> b!620844 (= lt!287069 e!356086)))

(assert (=> b!620844 false))

(declare-fun b!620845 () Bool)

(declare-fun res!400067 () Bool)

(assert (=> b!620845 (=> (not res!400067) (not e!356092))))

(assert (=> b!620845 (= res!400067 (and (= (size!18419 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18419 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18419 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620846 () Bool)

(declare-fun res!400072 () Bool)

(assert (=> b!620846 (=> (not res!400072) (not e!356092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620846 (= res!400072 (validKeyInArray!0 (select (arr!18055 a!2986) j!136)))))

(declare-fun b!620847 () Bool)

(declare-fun res!400069 () Bool)

(assert (=> b!620847 (=> (not res!400069) (not e!356084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37618 (_ BitVec 32)) Bool)

(assert (=> b!620847 (= res!400069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!620848 () Bool)

(declare-fun e!356083 () Unit!20678)

(declare-fun Unit!20681 () Unit!20678)

(assert (=> b!620848 (= e!356083 Unit!20681)))

(assert (=> b!620848 false))

(declare-fun b!620849 () Bool)

(declare-fun Unit!20682 () Unit!20678)

(assert (=> b!620849 (= e!356086 Unit!20682)))

(declare-fun b!620850 () Bool)

(assert (=> b!620850 (= e!356092 e!356084)))

(declare-fun res!400073 () Bool)

(assert (=> b!620850 (=> (not res!400073) (not e!356084))))

(declare-datatypes ((SeekEntryResult!6495 0))(
  ( (MissingZero!6495 (index!28264 (_ BitVec 32))) (Found!6495 (index!28265 (_ BitVec 32))) (Intermediate!6495 (undefined!7307 Bool) (index!28266 (_ BitVec 32)) (x!57039 (_ BitVec 32))) (Undefined!6495) (MissingVacant!6495 (index!28267 (_ BitVec 32))) )
))
(declare-fun lt!287068 () SeekEntryResult!6495)

(assert (=> b!620850 (= res!400073 (or (= lt!287068 (MissingZero!6495 i!1108)) (= lt!287068 (MissingVacant!6495 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37618 (_ BitVec 32)) SeekEntryResult!6495)

(assert (=> b!620850 (= lt!287068 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!620851 () Bool)

(declare-fun e!356088 () Bool)

(assert (=> b!620851 (= e!356088 (not true))))

(declare-fun lt!287073 () Unit!20678)

(assert (=> b!620851 (= lt!287073 e!356089)))

(declare-fun c!70755 () Bool)

(declare-fun lt!287074 () SeekEntryResult!6495)

(assert (=> b!620851 (= c!70755 (= lt!287074 (Found!6495 index!984)))))

(declare-fun lt!287065 () Unit!20678)

(assert (=> b!620851 (= lt!287065 e!356083)))

(declare-fun c!70757 () Bool)

(assert (=> b!620851 (= c!70757 (= lt!287074 Undefined!6495))))

(declare-fun lt!287062 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37618 (_ BitVec 32)) SeekEntryResult!6495)

(assert (=> b!620851 (= lt!287074 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!287062 lt!287063 mask!3053))))

(declare-fun e!356085 () Bool)

(assert (=> b!620851 e!356085))

(declare-fun res!400081 () Bool)

(assert (=> b!620851 (=> (not res!400081) (not e!356085))))

(declare-fun lt!287072 () SeekEntryResult!6495)

(declare-fun lt!287075 () (_ BitVec 32))

(assert (=> b!620851 (= res!400081 (= lt!287072 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287075 vacantSpotIndex!68 lt!287062 lt!287063 mask!3053)))))

(assert (=> b!620851 (= lt!287072 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!287075 vacantSpotIndex!68 (select (arr!18055 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620851 (= lt!287062 (select (store (arr!18055 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!287064 () Unit!20678)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37618 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20678)

(assert (=> b!620851 (= lt!287064 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!287075 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620851 (= lt!287075 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620852 () Bool)

(declare-fun lt!287066 () SeekEntryResult!6495)

(assert (=> b!620852 (= e!356085 (= lt!287066 lt!287072))))

(declare-fun b!620853 () Bool)

(declare-fun res!400071 () Bool)

(assert (=> b!620853 (= res!400071 (arrayContainsKey!0 lt!287063 (select (arr!18055 a!2986) j!136) j!136))))

(declare-fun e!356091 () Bool)

(assert (=> b!620853 (=> (not res!400071) (not e!356091))))

(declare-fun e!356087 () Bool)

(assert (=> b!620853 (= e!356087 e!356091)))

(declare-fun b!620854 () Bool)

(declare-fun Unit!20683 () Unit!20678)

(assert (=> b!620854 (= e!356083 Unit!20683)))

(declare-fun b!620855 () Bool)

(declare-fun res!400068 () Bool)

(assert (=> b!620855 (=> (not res!400068) (not e!356092))))

(assert (=> b!620855 (= res!400068 (validKeyInArray!0 k0!1786))))

(declare-fun b!620856 () Bool)

(declare-fun e!356081 () Bool)

(assert (=> b!620856 (= e!356084 e!356081)))

(declare-fun res!400074 () Bool)

(assert (=> b!620856 (=> (not res!400074) (not e!356081))))

(assert (=> b!620856 (= res!400074 (= (select (store (arr!18055 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620856 (= lt!287063 (array!37619 (store (arr!18055 a!2986) i!1108 k0!1786) (size!18419 a!2986)))))

(declare-fun b!620857 () Bool)

(assert (=> b!620857 false))

(declare-fun lt!287071 () Unit!20678)

(declare-datatypes ((List!12096 0))(
  ( (Nil!12093) (Cons!12092 (h!13137 (_ BitVec 64)) (t!18324 List!12096)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37618 (_ BitVec 64) (_ BitVec 32) List!12096) Unit!20678)

(assert (=> b!620857 (= lt!287071 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287063 (select (arr!18055 a!2986) j!136) index!984 Nil!12093))))

(declare-fun arrayNoDuplicates!0 (array!37618 (_ BitVec 32) List!12096) Bool)

(assert (=> b!620857 (arrayNoDuplicates!0 lt!287063 index!984 Nil!12093)))

(declare-fun lt!287058 () Unit!20678)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37618 (_ BitVec 32) (_ BitVec 32)) Unit!20678)

(assert (=> b!620857 (= lt!287058 (lemmaNoDuplicateFromThenFromBigger!0 lt!287063 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620857 (arrayNoDuplicates!0 lt!287063 #b00000000000000000000000000000000 Nil!12093)))

(declare-fun lt!287067 () Unit!20678)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37618 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12096) Unit!20678)

(assert (=> b!620857 (= lt!287067 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12093))))

(assert (=> b!620857 (arrayContainsKey!0 lt!287063 (select (arr!18055 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!287070 () Unit!20678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37618 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20678)

(assert (=> b!620857 (= lt!287070 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287063 (select (arr!18055 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!620857 e!356082))

(declare-fun res!400078 () Bool)

(assert (=> b!620857 (=> (not res!400078) (not e!356082))))

(assert (=> b!620857 (= res!400078 (arrayContainsKey!0 lt!287063 (select (arr!18055 a!2986) j!136) j!136))))

(declare-fun Unit!20684 () Unit!20678)

(assert (=> b!620857 (= e!356086 Unit!20684)))

(declare-fun b!620858 () Bool)

(assert (=> b!620858 (= e!356091 (arrayContainsKey!0 lt!287063 (select (arr!18055 a!2986) j!136) index!984))))

(declare-fun b!620859 () Bool)

(declare-fun res!400082 () Bool)

(assert (=> b!620859 (= res!400082 (bvsge j!136 index!984))))

(assert (=> b!620859 (=> res!400082 e!356087)))

(assert (=> b!620859 (= e!356093 e!356087)))

(declare-fun b!620860 () Bool)

(assert (=> b!620860 false))

(declare-fun lt!287060 () Unit!20678)

(assert (=> b!620860 (= lt!287060 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!287063 (select (arr!18055 a!2986) j!136) j!136 Nil!12093))))

(assert (=> b!620860 (arrayNoDuplicates!0 lt!287063 j!136 Nil!12093)))

(declare-fun lt!287077 () Unit!20678)

(assert (=> b!620860 (= lt!287077 (lemmaNoDuplicateFromThenFromBigger!0 lt!287063 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620860 (arrayNoDuplicates!0 lt!287063 #b00000000000000000000000000000000 Nil!12093)))

(declare-fun lt!287076 () Unit!20678)

(assert (=> b!620860 (= lt!287076 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12093))))

(assert (=> b!620860 (arrayContainsKey!0 lt!287063 (select (arr!18055 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!287061 () Unit!20678)

(assert (=> b!620860 (= lt!287061 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!287063 (select (arr!18055 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20685 () Unit!20678)

(assert (=> b!620860 (= e!356094 Unit!20685)))

(declare-fun b!620861 () Bool)

(assert (=> b!620861 (= e!356081 e!356088)))

(declare-fun res!400070 () Bool)

(assert (=> b!620861 (=> (not res!400070) (not e!356088))))

(assert (=> b!620861 (= res!400070 (and (= lt!287066 (Found!6495 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18055 a!2986) index!984) (select (arr!18055 a!2986) j!136))) (not (= (select (arr!18055 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!620861 (= lt!287066 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18055 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620862 () Bool)

(declare-fun res!400080 () Bool)

(assert (=> b!620862 (=> (not res!400080) (not e!356084))))

(assert (=> b!620862 (= res!400080 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12093))))

(declare-fun b!620863 () Bool)

(declare-fun Unit!20686 () Unit!20678)

(assert (=> b!620863 (= e!356094 Unit!20686)))

(declare-fun b!620864 () Bool)

(declare-fun Unit!20687 () Unit!20678)

(assert (=> b!620864 (= e!356089 Unit!20687)))

(assert (= (and start!56148 res!400076) b!620845))

(assert (= (and b!620845 res!400067) b!620846))

(assert (= (and b!620846 res!400072) b!620855))

(assert (= (and b!620855 res!400068) b!620843))

(assert (= (and b!620843 res!400075) b!620850))

(assert (= (and b!620850 res!400073) b!620847))

(assert (= (and b!620847 res!400069) b!620862))

(assert (= (and b!620862 res!400080) b!620842))

(assert (= (and b!620842 res!400077) b!620856))

(assert (= (and b!620856 res!400074) b!620861))

(assert (= (and b!620861 res!400070) b!620851))

(assert (= (and b!620851 res!400081) b!620852))

(assert (= (and b!620851 c!70757) b!620848))

(assert (= (and b!620851 (not c!70757)) b!620854))

(assert (= (and b!620851 c!70755) b!620844))

(assert (= (and b!620851 (not c!70755)) b!620864))

(assert (= (and b!620844 res!400079) b!620859))

(assert (= (and b!620859 (not res!400082)) b!620853))

(assert (= (and b!620853 res!400071) b!620858))

(assert (= (and b!620844 c!70754) b!620860))

(assert (= (and b!620844 (not c!70754)) b!620863))

(assert (= (and b!620844 c!70756) b!620857))

(assert (= (and b!620844 (not c!70756)) b!620849))

(assert (= (and b!620857 res!400078) b!620841))

(declare-fun m!596751 () Bool)

(assert (=> b!620850 m!596751))

(declare-fun m!596753 () Bool)

(assert (=> b!620842 m!596753))

(declare-fun m!596755 () Bool)

(assert (=> b!620858 m!596755))

(assert (=> b!620858 m!596755))

(declare-fun m!596757 () Bool)

(assert (=> b!620858 m!596757))

(assert (=> b!620857 m!596755))

(declare-fun m!596759 () Bool)

(assert (=> b!620857 m!596759))

(declare-fun m!596761 () Bool)

(assert (=> b!620857 m!596761))

(assert (=> b!620857 m!596755))

(declare-fun m!596763 () Bool)

(assert (=> b!620857 m!596763))

(assert (=> b!620857 m!596755))

(declare-fun m!596765 () Bool)

(assert (=> b!620857 m!596765))

(declare-fun m!596767 () Bool)

(assert (=> b!620857 m!596767))

(assert (=> b!620857 m!596755))

(declare-fun m!596769 () Bool)

(assert (=> b!620857 m!596769))

(assert (=> b!620857 m!596755))

(declare-fun m!596771 () Bool)

(assert (=> b!620857 m!596771))

(declare-fun m!596773 () Bool)

(assert (=> b!620857 m!596773))

(declare-fun m!596775 () Bool)

(assert (=> b!620861 m!596775))

(assert (=> b!620861 m!596755))

(assert (=> b!620861 m!596755))

(declare-fun m!596777 () Bool)

(assert (=> b!620861 m!596777))

(declare-fun m!596779 () Bool)

(assert (=> b!620847 m!596779))

(declare-fun m!596781 () Bool)

(assert (=> b!620856 m!596781))

(declare-fun m!596783 () Bool)

(assert (=> b!620856 m!596783))

(declare-fun m!596785 () Bool)

(assert (=> b!620843 m!596785))

(assert (=> b!620841 m!596755))

(assert (=> b!620841 m!596755))

(assert (=> b!620841 m!596757))

(declare-fun m!596787 () Bool)

(assert (=> b!620862 m!596787))

(declare-fun m!596789 () Bool)

(assert (=> b!620855 m!596789))

(declare-fun m!596791 () Bool)

(assert (=> b!620851 m!596791))

(declare-fun m!596793 () Bool)

(assert (=> b!620851 m!596793))

(assert (=> b!620851 m!596755))

(declare-fun m!596795 () Bool)

(assert (=> b!620851 m!596795))

(assert (=> b!620851 m!596781))

(declare-fun m!596797 () Bool)

(assert (=> b!620851 m!596797))

(declare-fun m!596799 () Bool)

(assert (=> b!620851 m!596799))

(declare-fun m!596801 () Bool)

(assert (=> b!620851 m!596801))

(assert (=> b!620851 m!596755))

(declare-fun m!596803 () Bool)

(assert (=> start!56148 m!596803))

(declare-fun m!596805 () Bool)

(assert (=> start!56148 m!596805))

(assert (=> b!620846 m!596755))

(assert (=> b!620846 m!596755))

(declare-fun m!596807 () Bool)

(assert (=> b!620846 m!596807))

(assert (=> b!620853 m!596755))

(assert (=> b!620853 m!596755))

(assert (=> b!620853 m!596763))

(assert (=> b!620860 m!596755))

(assert (=> b!620860 m!596755))

(declare-fun m!596809 () Bool)

(assert (=> b!620860 m!596809))

(declare-fun m!596811 () Bool)

(assert (=> b!620860 m!596811))

(assert (=> b!620860 m!596761))

(declare-fun m!596813 () Bool)

(assert (=> b!620860 m!596813))

(assert (=> b!620860 m!596755))

(declare-fun m!596815 () Bool)

(assert (=> b!620860 m!596815))

(assert (=> b!620860 m!596755))

(declare-fun m!596817 () Bool)

(assert (=> b!620860 m!596817))

(assert (=> b!620860 m!596773))

(assert (=> b!620844 m!596781))

(declare-fun m!596819 () Bool)

(assert (=> b!620844 m!596819))

(assert (=> b!620844 m!596755))

(check-sat (not b!620847) (not b!620858) (not b!620862) (not b!620850) (not b!620857) (not b!620851) (not b!620861) (not b!620846) (not b!620860) (not b!620843) (not start!56148) (not b!620853) (not b!620855) (not b!620841))
(check-sat)
