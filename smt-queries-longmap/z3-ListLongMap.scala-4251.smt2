; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58964 () Bool)

(assert start!58964)

(declare-fun b!650063 () Bool)

(declare-fun res!421418 () Bool)

(declare-fun e!372921 () Bool)

(assert (=> b!650063 (=> (not res!421418) (not e!372921))))

(declare-datatypes ((array!38556 0))(
  ( (array!38557 (arr!18482 (Array (_ BitVec 32) (_ BitVec 64))) (size!18847 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38556)

(declare-datatypes ((List!12562 0))(
  ( (Nil!12559) (Cons!12558 (h!13603 (_ BitVec 64)) (t!18781 List!12562)) )
))
(declare-fun arrayNoDuplicates!0 (array!38556 (_ BitVec 32) List!12562) Bool)

(assert (=> b!650063 (= res!421418 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12559))))

(declare-fun b!650064 () Bool)

(declare-fun res!421425 () Bool)

(declare-fun e!372918 () Bool)

(assert (=> b!650064 (=> (not res!421425) (not e!372918))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!650064 (= res!421425 (validKeyInArray!0 (select (arr!18482 a!2986) j!136)))))

(declare-fun b!650065 () Bool)

(assert (=> b!650065 (= e!372918 e!372921)))

(declare-fun res!421412 () Bool)

(assert (=> b!650065 (=> (not res!421412) (not e!372921))))

(declare-datatypes ((SeekEntryResult!6919 0))(
  ( (MissingZero!6919 (index!30026 (_ BitVec 32))) (Found!6919 (index!30027 (_ BitVec 32))) (Intermediate!6919 (undefined!7731 Bool) (index!30028 (_ BitVec 32)) (x!58824 (_ BitVec 32))) (Undefined!6919) (MissingVacant!6919 (index!30029 (_ BitVec 32))) )
))
(declare-fun lt!301882 () SeekEntryResult!6919)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!650065 (= res!421412 (or (= lt!301882 (MissingZero!6919 i!1108)) (= lt!301882 (MissingVacant!6919 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38556 (_ BitVec 32)) SeekEntryResult!6919)

(assert (=> b!650065 (= lt!301882 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!650066 () Bool)

(declare-fun res!421422 () Bool)

(assert (=> b!650066 (=> (not res!421422) (not e!372918))))

(declare-fun arrayContainsKey!0 (array!38556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!650066 (= res!421422 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!650067 () Bool)

(declare-datatypes ((Unit!22142 0))(
  ( (Unit!22143) )
))
(declare-fun e!372913 () Unit!22142)

(declare-fun Unit!22144 () Unit!22142)

(assert (=> b!650067 (= e!372913 Unit!22144)))

(declare-fun b!650068 () Bool)

(declare-fun e!372923 () Bool)

(declare-fun e!372922 () Bool)

(assert (=> b!650068 (= e!372923 e!372922)))

(declare-fun res!421427 () Bool)

(assert (=> b!650068 (=> (not res!421427) (not e!372922))))

(declare-fun lt!301886 () SeekEntryResult!6919)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!650068 (= res!421427 (and (= lt!301886 (Found!6919 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18482 a!2986) index!984) (select (arr!18482 a!2986) j!136))) (not (= (select (arr!18482 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38556 (_ BitVec 32)) SeekEntryResult!6919)

(assert (=> b!650068 (= lt!301886 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18482 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650069 () Bool)

(declare-fun res!421429 () Bool)

(assert (=> b!650069 (=> (not res!421429) (not e!372918))))

(assert (=> b!650069 (= res!421429 (validKeyInArray!0 k0!1786))))

(declare-fun res!421420 () Bool)

(assert (=> start!58964 (=> (not res!421420) (not e!372918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58964 (= res!421420 (validMask!0 mask!3053))))

(assert (=> start!58964 e!372918))

(assert (=> start!58964 true))

(declare-fun array_inv!14365 (array!38556) Bool)

(assert (=> start!58964 (array_inv!14365 a!2986)))

(declare-fun b!650070 () Bool)

(declare-fun lt!301887 () array!38556)

(declare-fun e!372920 () Bool)

(assert (=> b!650070 (= e!372920 (arrayContainsKey!0 lt!301887 (select (arr!18482 a!2986) j!136) index!984))))

(declare-fun b!650071 () Bool)

(declare-fun res!421417 () Bool)

(assert (=> b!650071 (=> (not res!421417) (not e!372921))))

(assert (=> b!650071 (= res!421417 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18482 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!372925 () Bool)

(declare-fun b!650072 () Bool)

(assert (=> b!650072 (= e!372925 (arrayContainsKey!0 lt!301887 (select (arr!18482 a!2986) j!136) index!984))))

(declare-fun b!650073 () Bool)

(declare-fun e!372914 () Bool)

(assert (=> b!650073 (= e!372914 true)))

(assert (=> b!650073 (arrayNoDuplicates!0 lt!301887 #b00000000000000000000000000000000 Nil!12559)))

(declare-fun lt!301890 () Unit!22142)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38556 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12562) Unit!22142)

(assert (=> b!650073 (= lt!301890 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12559))))

(assert (=> b!650073 (arrayContainsKey!0 lt!301887 (select (arr!18482 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301881 () Unit!22142)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38556 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22142)

(assert (=> b!650073 (= lt!301881 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301887 (select (arr!18482 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!650073 e!372925))

(declare-fun res!421424 () Bool)

(assert (=> b!650073 (=> (not res!421424) (not e!372925))))

(assert (=> b!650073 (= res!421424 (arrayContainsKey!0 lt!301887 (select (arr!18482 a!2986) j!136) j!136))))

(declare-fun b!650074 () Bool)

(declare-fun res!421415 () Bool)

(assert (=> b!650074 (=> (not res!421415) (not e!372918))))

(assert (=> b!650074 (= res!421415 (and (= (size!18847 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18847 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18847 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!650075 () Bool)

(declare-fun e!372916 () Unit!22142)

(declare-fun Unit!22145 () Unit!22142)

(assert (=> b!650075 (= e!372916 Unit!22145)))

(declare-fun b!650076 () Bool)

(declare-fun e!372924 () Bool)

(declare-fun lt!301892 () SeekEntryResult!6919)

(assert (=> b!650076 (= e!372924 (= lt!301886 lt!301892))))

(declare-fun b!650077 () Bool)

(assert (=> b!650077 (= e!372921 e!372923)))

(declare-fun res!421428 () Bool)

(assert (=> b!650077 (=> (not res!421428) (not e!372923))))

(assert (=> b!650077 (= res!421428 (= (select (store (arr!18482 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650077 (= lt!301887 (array!38557 (store (arr!18482 a!2986) i!1108 k0!1786) (size!18847 a!2986)))))

(declare-fun b!650078 () Bool)

(declare-fun Unit!22146 () Unit!22142)

(assert (=> b!650078 (= e!372916 Unit!22146)))

(assert (=> b!650078 false))

(declare-fun b!650079 () Bool)

(declare-fun e!372926 () Bool)

(assert (=> b!650079 (= e!372922 (not e!372926))))

(declare-fun res!421416 () Bool)

(assert (=> b!650079 (=> res!421416 e!372926)))

(declare-fun lt!301896 () SeekEntryResult!6919)

(assert (=> b!650079 (= res!421416 (not (= lt!301896 (Found!6919 index!984))))))

(declare-fun lt!301888 () Unit!22142)

(assert (=> b!650079 (= lt!301888 e!372916)))

(declare-fun c!74693 () Bool)

(assert (=> b!650079 (= c!74693 (= lt!301896 Undefined!6919))))

(declare-fun lt!301894 () (_ BitVec 64))

(assert (=> b!650079 (= lt!301896 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301894 lt!301887 mask!3053))))

(assert (=> b!650079 e!372924))

(declare-fun res!421411 () Bool)

(assert (=> b!650079 (=> (not res!421411) (not e!372924))))

(declare-fun lt!301880 () (_ BitVec 32))

(assert (=> b!650079 (= res!421411 (= lt!301892 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301880 vacantSpotIndex!68 lt!301894 lt!301887 mask!3053)))))

(assert (=> b!650079 (= lt!301892 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301880 vacantSpotIndex!68 (select (arr!18482 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!650079 (= lt!301894 (select (store (arr!18482 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301889 () Unit!22142)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38556 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22142)

(assert (=> b!650079 (= lt!301889 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301880 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!650079 (= lt!301880 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!650080 () Bool)

(declare-fun e!372917 () Bool)

(assert (=> b!650080 (= e!372926 e!372917)))

(declare-fun res!421421 () Bool)

(assert (=> b!650080 (=> res!421421 e!372917)))

(declare-fun lt!301885 () (_ BitVec 64))

(assert (=> b!650080 (= res!421421 (or (not (= (select (arr!18482 a!2986) j!136) lt!301894)) (not (= (select (arr!18482 a!2986) j!136) lt!301885))))))

(declare-fun e!372915 () Bool)

(assert (=> b!650080 e!372915))

(declare-fun res!421413 () Bool)

(assert (=> b!650080 (=> (not res!421413) (not e!372915))))

(assert (=> b!650080 (= res!421413 (= lt!301885 (select (arr!18482 a!2986) j!136)))))

(assert (=> b!650080 (= lt!301885 (select (store (arr!18482 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!650081 () Bool)

(assert (=> b!650081 (= e!372917 e!372914)))

(declare-fun res!421419 () Bool)

(assert (=> b!650081 (=> res!421419 e!372914)))

(assert (=> b!650081 (= res!421419 (bvsge index!984 j!136))))

(declare-fun lt!301891 () Unit!22142)

(assert (=> b!650081 (= lt!301891 e!372913)))

(declare-fun c!74694 () Bool)

(assert (=> b!650081 (= c!74694 (bvslt j!136 index!984))))

(declare-fun b!650082 () Bool)

(declare-fun res!421423 () Bool)

(assert (=> b!650082 (=> (not res!421423) (not e!372921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38556 (_ BitVec 32)) Bool)

(assert (=> b!650082 (= res!421423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!650083 () Bool)

(declare-fun Unit!22147 () Unit!22142)

(assert (=> b!650083 (= e!372913 Unit!22147)))

(declare-fun lt!301883 () Unit!22142)

(assert (=> b!650083 (= lt!301883 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301887 (select (arr!18482 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!650083 (arrayContainsKey!0 lt!301887 (select (arr!18482 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301893 () Unit!22142)

(assert (=> b!650083 (= lt!301893 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12559))))

(assert (=> b!650083 (arrayNoDuplicates!0 lt!301887 #b00000000000000000000000000000000 Nil!12559)))

(declare-fun lt!301884 () Unit!22142)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38556 (_ BitVec 32) (_ BitVec 32)) Unit!22142)

(assert (=> b!650083 (= lt!301884 (lemmaNoDuplicateFromThenFromBigger!0 lt!301887 #b00000000000000000000000000000000 j!136))))

(assert (=> b!650083 (arrayNoDuplicates!0 lt!301887 j!136 Nil!12559)))

(declare-fun lt!301895 () Unit!22142)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38556 (_ BitVec 64) (_ BitVec 32) List!12562) Unit!22142)

(assert (=> b!650083 (= lt!301895 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301887 (select (arr!18482 a!2986) j!136) j!136 Nil!12559))))

(assert (=> b!650083 false))

(declare-fun b!650084 () Bool)

(declare-fun e!372912 () Bool)

(assert (=> b!650084 (= e!372915 e!372912)))

(declare-fun res!421426 () Bool)

(assert (=> b!650084 (=> res!421426 e!372912)))

(assert (=> b!650084 (= res!421426 (or (not (= (select (arr!18482 a!2986) j!136) lt!301894)) (not (= (select (arr!18482 a!2986) j!136) lt!301885)) (bvsge j!136 index!984)))))

(declare-fun b!650085 () Bool)

(assert (=> b!650085 (= e!372912 e!372920)))

(declare-fun res!421414 () Bool)

(assert (=> b!650085 (=> (not res!421414) (not e!372920))))

(assert (=> b!650085 (= res!421414 (arrayContainsKey!0 lt!301887 (select (arr!18482 a!2986) j!136) j!136))))

(assert (= (and start!58964 res!421420) b!650074))

(assert (= (and b!650074 res!421415) b!650064))

(assert (= (and b!650064 res!421425) b!650069))

(assert (= (and b!650069 res!421429) b!650066))

(assert (= (and b!650066 res!421422) b!650065))

(assert (= (and b!650065 res!421412) b!650082))

(assert (= (and b!650082 res!421423) b!650063))

(assert (= (and b!650063 res!421418) b!650071))

(assert (= (and b!650071 res!421417) b!650077))

(assert (= (and b!650077 res!421428) b!650068))

(assert (= (and b!650068 res!421427) b!650079))

(assert (= (and b!650079 res!421411) b!650076))

(assert (= (and b!650079 c!74693) b!650078))

(assert (= (and b!650079 (not c!74693)) b!650075))

(assert (= (and b!650079 (not res!421416)) b!650080))

(assert (= (and b!650080 res!421413) b!650084))

(assert (= (and b!650084 (not res!421426)) b!650085))

(assert (= (and b!650085 res!421414) b!650070))

(assert (= (and b!650080 (not res!421421)) b!650081))

(assert (= (and b!650081 c!74694) b!650083))

(assert (= (and b!650081 (not c!74694)) b!650067))

(assert (= (and b!650081 (not res!421419)) b!650073))

(assert (= (and b!650073 res!421424) b!650072))

(declare-fun m!622785 () Bool)

(assert (=> b!650072 m!622785))

(assert (=> b!650072 m!622785))

(declare-fun m!622787 () Bool)

(assert (=> b!650072 m!622787))

(assert (=> b!650080 m!622785))

(declare-fun m!622789 () Bool)

(assert (=> b!650080 m!622789))

(declare-fun m!622791 () Bool)

(assert (=> b!650080 m!622791))

(assert (=> b!650073 m!622785))

(declare-fun m!622793 () Bool)

(assert (=> b!650073 m!622793))

(assert (=> b!650073 m!622785))

(declare-fun m!622795 () Bool)

(assert (=> b!650073 m!622795))

(assert (=> b!650073 m!622785))

(assert (=> b!650073 m!622785))

(declare-fun m!622797 () Bool)

(assert (=> b!650073 m!622797))

(declare-fun m!622799 () Bool)

(assert (=> b!650073 m!622799))

(declare-fun m!622801 () Bool)

(assert (=> b!650073 m!622801))

(assert (=> b!650083 m!622785))

(declare-fun m!622803 () Bool)

(assert (=> b!650083 m!622803))

(declare-fun m!622805 () Bool)

(assert (=> b!650083 m!622805))

(assert (=> b!650083 m!622785))

(assert (=> b!650083 m!622785))

(declare-fun m!622807 () Bool)

(assert (=> b!650083 m!622807))

(assert (=> b!650083 m!622799))

(assert (=> b!650083 m!622801))

(assert (=> b!650083 m!622785))

(declare-fun m!622809 () Bool)

(assert (=> b!650083 m!622809))

(declare-fun m!622811 () Bool)

(assert (=> b!650083 m!622811))

(declare-fun m!622813 () Bool)

(assert (=> b!650069 m!622813))

(declare-fun m!622815 () Bool)

(assert (=> start!58964 m!622815))

(declare-fun m!622817 () Bool)

(assert (=> start!58964 m!622817))

(declare-fun m!622819 () Bool)

(assert (=> b!650082 m!622819))

(declare-fun m!622821 () Bool)

(assert (=> b!650068 m!622821))

(assert (=> b!650068 m!622785))

(assert (=> b!650068 m!622785))

(declare-fun m!622823 () Bool)

(assert (=> b!650068 m!622823))

(declare-fun m!622825 () Bool)

(assert (=> b!650079 m!622825))

(declare-fun m!622827 () Bool)

(assert (=> b!650079 m!622827))

(declare-fun m!622829 () Bool)

(assert (=> b!650079 m!622829))

(declare-fun m!622831 () Bool)

(assert (=> b!650079 m!622831))

(assert (=> b!650079 m!622789))

(assert (=> b!650079 m!622785))

(declare-fun m!622833 () Bool)

(assert (=> b!650079 m!622833))

(declare-fun m!622835 () Bool)

(assert (=> b!650079 m!622835))

(assert (=> b!650079 m!622785))

(assert (=> b!650077 m!622789))

(declare-fun m!622837 () Bool)

(assert (=> b!650077 m!622837))

(declare-fun m!622839 () Bool)

(assert (=> b!650066 m!622839))

(declare-fun m!622841 () Bool)

(assert (=> b!650063 m!622841))

(assert (=> b!650070 m!622785))

(assert (=> b!650070 m!622785))

(assert (=> b!650070 m!622787))

(assert (=> b!650085 m!622785))

(assert (=> b!650085 m!622785))

(assert (=> b!650085 m!622793))

(assert (=> b!650064 m!622785))

(assert (=> b!650064 m!622785))

(declare-fun m!622843 () Bool)

(assert (=> b!650064 m!622843))

(declare-fun m!622845 () Bool)

(assert (=> b!650065 m!622845))

(assert (=> b!650084 m!622785))

(declare-fun m!622847 () Bool)

(assert (=> b!650071 m!622847))

(check-sat (not b!650064) (not b!650079) (not b!650085) (not b!650063) (not b!650065) (not b!650070) (not b!650066) (not b!650072) (not b!650068) (not b!650073) (not b!650083) (not b!650069) (not start!58964) (not b!650082))
(check-sat)
