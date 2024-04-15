; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58316 () Bool)

(assert start!58316)

(declare-fun b!643778 () Bool)

(declare-fun res!417078 () Bool)

(declare-fun e!368804 () Bool)

(assert (=> b!643778 (=> (not res!417078) (not e!368804))))

(declare-datatypes ((array!38424 0))(
  ( (array!38425 (arr!18425 (Array (_ BitVec 32) (_ BitVec 64))) (size!18790 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38424)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!643778 (= res!417078 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!643779 () Bool)

(declare-fun e!368809 () Bool)

(assert (=> b!643779 (= e!368804 e!368809)))

(declare-fun res!417070 () Bool)

(assert (=> b!643779 (=> (not res!417070) (not e!368809))))

(declare-datatypes ((SeekEntryResult!6862 0))(
  ( (MissingZero!6862 (index!29780 (_ BitVec 32))) (Found!6862 (index!29781 (_ BitVec 32))) (Intermediate!6862 (undefined!7674 Bool) (index!29782 (_ BitVec 32)) (x!58561 (_ BitVec 32))) (Undefined!6862) (MissingVacant!6862 (index!29783 (_ BitVec 32))) )
))
(declare-fun lt!298212 () SeekEntryResult!6862)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!643779 (= res!417070 (or (= lt!298212 (MissingZero!6862 i!1108)) (= lt!298212 (MissingVacant!6862 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38424 (_ BitVec 32)) SeekEntryResult!6862)

(assert (=> b!643779 (= lt!298212 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!643780 () Bool)

(declare-fun res!417087 () Bool)

(assert (=> b!643780 (=> (not res!417087) (not e!368809))))

(declare-datatypes ((List!12505 0))(
  ( (Nil!12502) (Cons!12501 (h!13546 (_ BitVec 64)) (t!18724 List!12505)) )
))
(declare-fun arrayNoDuplicates!0 (array!38424 (_ BitVec 32) List!12505) Bool)

(assert (=> b!643780 (= res!417087 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12502))))

(declare-fun b!643781 () Bool)

(declare-datatypes ((Unit!21800 0))(
  ( (Unit!21801) )
))
(declare-fun e!368800 () Unit!21800)

(declare-fun Unit!21802 () Unit!21800)

(assert (=> b!643781 (= e!368800 Unit!21802)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!298209 () array!38424)

(declare-fun lt!298208 () Unit!21800)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38424 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21800)

(assert (=> b!643781 (= lt!298208 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!298209 (select (arr!18425 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!643781 (arrayContainsKey!0 lt!298209 (select (arr!18425 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298220 () Unit!21800)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38424 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12505) Unit!21800)

(assert (=> b!643781 (= lt!298220 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12502))))

(assert (=> b!643781 (arrayNoDuplicates!0 lt!298209 #b00000000000000000000000000000000 Nil!12502)))

(declare-fun lt!298221 () Unit!21800)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38424 (_ BitVec 32) (_ BitVec 32)) Unit!21800)

(assert (=> b!643781 (= lt!298221 (lemmaNoDuplicateFromThenFromBigger!0 lt!298209 #b00000000000000000000000000000000 j!136))))

(assert (=> b!643781 (arrayNoDuplicates!0 lt!298209 j!136 Nil!12502)))

(declare-fun lt!298218 () Unit!21800)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38424 (_ BitVec 64) (_ BitVec 32) List!12505) Unit!21800)

(assert (=> b!643781 (= lt!298218 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!298209 (select (arr!18425 a!2986) j!136) j!136 Nil!12502))))

(assert (=> b!643781 false))

(declare-fun b!643782 () Bool)

(declare-fun e!368802 () Bool)

(declare-fun e!368799 () Bool)

(assert (=> b!643782 (= e!368802 e!368799)))

(declare-fun res!417081 () Bool)

(assert (=> b!643782 (=> (not res!417081) (not e!368799))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!298215 () SeekEntryResult!6862)

(assert (=> b!643782 (= res!417081 (and (= lt!298215 (Found!6862 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18425 a!2986) index!984) (select (arr!18425 a!2986) j!136))) (not (= (select (arr!18425 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38424 (_ BitVec 32)) SeekEntryResult!6862)

(assert (=> b!643782 (= lt!298215 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18425 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643783 () Bool)

(declare-fun e!368797 () Unit!21800)

(declare-fun Unit!21803 () Unit!21800)

(assert (=> b!643783 (= e!368797 Unit!21803)))

(declare-fun b!643784 () Bool)

(declare-fun e!368798 () Bool)

(declare-fun e!368806 () Bool)

(assert (=> b!643784 (= e!368798 e!368806)))

(declare-fun res!417073 () Bool)

(assert (=> b!643784 (=> res!417073 e!368806)))

(declare-fun lt!298213 () (_ BitVec 64))

(declare-fun lt!298207 () (_ BitVec 64))

(assert (=> b!643784 (= res!417073 (or (not (= (select (arr!18425 a!2986) j!136) lt!298207)) (not (= (select (arr!18425 a!2986) j!136) lt!298213))))))

(declare-fun e!368805 () Bool)

(assert (=> b!643784 e!368805))

(declare-fun res!417088 () Bool)

(assert (=> b!643784 (=> (not res!417088) (not e!368805))))

(assert (=> b!643784 (= res!417088 (= lt!298213 (select (arr!18425 a!2986) j!136)))))

(assert (=> b!643784 (= lt!298213 (select (store (arr!18425 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!417076 () Bool)

(assert (=> start!58316 (=> (not res!417076) (not e!368804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58316 (= res!417076 (validMask!0 mask!3053))))

(assert (=> start!58316 e!368804))

(assert (=> start!58316 true))

(declare-fun array_inv!14308 (array!38424) Bool)

(assert (=> start!58316 (array_inv!14308 a!2986)))

(declare-fun b!643785 () Bool)

(declare-fun res!417079 () Bool)

(assert (=> b!643785 (=> (not res!417079) (not e!368804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!643785 (= res!417079 (validKeyInArray!0 k0!1786))))

(declare-fun b!643786 () Bool)

(declare-fun res!417072 () Bool)

(assert (=> b!643786 (=> (not res!417072) (not e!368804))))

(assert (=> b!643786 (= res!417072 (validKeyInArray!0 (select (arr!18425 a!2986) j!136)))))

(declare-fun b!643787 () Bool)

(declare-fun e!368803 () Bool)

(assert (=> b!643787 (= e!368803 (arrayContainsKey!0 lt!298209 (select (arr!18425 a!2986) j!136) index!984))))

(declare-fun b!643788 () Bool)

(declare-fun Unit!21804 () Unit!21800)

(assert (=> b!643788 (= e!368797 Unit!21804)))

(assert (=> b!643788 false))

(declare-fun e!368810 () Bool)

(declare-fun b!643789 () Bool)

(assert (=> b!643789 (= e!368810 (arrayContainsKey!0 lt!298209 (select (arr!18425 a!2986) j!136) index!984))))

(declare-fun b!643790 () Bool)

(declare-fun Unit!21805 () Unit!21800)

(assert (=> b!643790 (= e!368800 Unit!21805)))

(declare-fun b!643791 () Bool)

(declare-fun res!417086 () Bool)

(assert (=> b!643791 (=> (not res!417086) (not e!368804))))

(assert (=> b!643791 (= res!417086 (and (= (size!18790 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18790 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18790 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!643792 () Bool)

(declare-fun res!417075 () Bool)

(assert (=> b!643792 (=> (not res!417075) (not e!368809))))

(assert (=> b!643792 (= res!417075 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18425 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!643793 () Bool)

(declare-fun e!368796 () Bool)

(assert (=> b!643793 (= e!368796 e!368803)))

(declare-fun res!417071 () Bool)

(assert (=> b!643793 (=> (not res!417071) (not e!368803))))

(assert (=> b!643793 (= res!417071 (arrayContainsKey!0 lt!298209 (select (arr!18425 a!2986) j!136) j!136))))

(declare-fun b!643794 () Bool)

(declare-fun res!417077 () Bool)

(assert (=> b!643794 (=> (not res!417077) (not e!368809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38424 (_ BitVec 32)) Bool)

(assert (=> b!643794 (= res!417077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!643795 () Bool)

(assert (=> b!643795 (= e!368809 e!368802)))

(declare-fun res!417074 () Bool)

(assert (=> b!643795 (=> (not res!417074) (not e!368802))))

(assert (=> b!643795 (= res!417074 (= (select (store (arr!18425 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643795 (= lt!298209 (array!38425 (store (arr!18425 a!2986) i!1108 k0!1786) (size!18790 a!2986)))))

(declare-fun b!643796 () Bool)

(declare-fun e!368807 () Bool)

(assert (=> b!643796 (= e!368806 e!368807)))

(declare-fun res!417085 () Bool)

(assert (=> b!643796 (=> res!417085 e!368807)))

(assert (=> b!643796 (= res!417085 (bvsge index!984 j!136))))

(declare-fun lt!298211 () Unit!21800)

(assert (=> b!643796 (= lt!298211 e!368800)))

(declare-fun c!73722 () Bool)

(assert (=> b!643796 (= c!73722 (bvslt j!136 index!984))))

(declare-fun b!643797 () Bool)

(declare-fun e!368808 () Bool)

(declare-fun lt!298217 () SeekEntryResult!6862)

(assert (=> b!643797 (= e!368808 (= lt!298215 lt!298217))))

(declare-fun b!643798 () Bool)

(assert (=> b!643798 (= e!368805 e!368796)))

(declare-fun res!417084 () Bool)

(assert (=> b!643798 (=> res!417084 e!368796)))

(assert (=> b!643798 (= res!417084 (or (not (= (select (arr!18425 a!2986) j!136) lt!298207)) (not (= (select (arr!18425 a!2986) j!136) lt!298213)) (bvsge j!136 index!984)))))

(declare-fun b!643799 () Bool)

(assert (=> b!643799 (= e!368807 (bvsge (bvadd #b00000000000000000000000000000001 index!984) #b00000000000000000000000000000000))))

(assert (=> b!643799 e!368810))

(declare-fun res!417082 () Bool)

(assert (=> b!643799 (=> (not res!417082) (not e!368810))))

(assert (=> b!643799 (= res!417082 (arrayContainsKey!0 lt!298209 (select (arr!18425 a!2986) j!136) j!136))))

(declare-fun b!643800 () Bool)

(assert (=> b!643800 (= e!368799 (not e!368798))))

(declare-fun res!417080 () Bool)

(assert (=> b!643800 (=> res!417080 e!368798)))

(declare-fun lt!298214 () SeekEntryResult!6862)

(assert (=> b!643800 (= res!417080 (not (= lt!298214 (Found!6862 index!984))))))

(declare-fun lt!298216 () Unit!21800)

(assert (=> b!643800 (= lt!298216 e!368797)))

(declare-fun c!73721 () Bool)

(assert (=> b!643800 (= c!73721 (= lt!298214 Undefined!6862))))

(assert (=> b!643800 (= lt!298214 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!298207 lt!298209 mask!3053))))

(assert (=> b!643800 e!368808))

(declare-fun res!417083 () Bool)

(assert (=> b!643800 (=> (not res!417083) (not e!368808))))

(declare-fun lt!298210 () (_ BitVec 32))

(assert (=> b!643800 (= res!417083 (= lt!298217 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298210 vacantSpotIndex!68 lt!298207 lt!298209 mask!3053)))))

(assert (=> b!643800 (= lt!298217 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!298210 vacantSpotIndex!68 (select (arr!18425 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!643800 (= lt!298207 (select (store (arr!18425 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!298219 () Unit!21800)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38424 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21800)

(assert (=> b!643800 (= lt!298219 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!298210 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!643800 (= lt!298210 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!58316 res!417076) b!643791))

(assert (= (and b!643791 res!417086) b!643786))

(assert (= (and b!643786 res!417072) b!643785))

(assert (= (and b!643785 res!417079) b!643778))

(assert (= (and b!643778 res!417078) b!643779))

(assert (= (and b!643779 res!417070) b!643794))

(assert (= (and b!643794 res!417077) b!643780))

(assert (= (and b!643780 res!417087) b!643792))

(assert (= (and b!643792 res!417075) b!643795))

(assert (= (and b!643795 res!417074) b!643782))

(assert (= (and b!643782 res!417081) b!643800))

(assert (= (and b!643800 res!417083) b!643797))

(assert (= (and b!643800 c!73721) b!643788))

(assert (= (and b!643800 (not c!73721)) b!643783))

(assert (= (and b!643800 (not res!417080)) b!643784))

(assert (= (and b!643784 res!417088) b!643798))

(assert (= (and b!643798 (not res!417084)) b!643793))

(assert (= (and b!643793 res!417071) b!643787))

(assert (= (and b!643784 (not res!417073)) b!643796))

(assert (= (and b!643796 c!73722) b!643781))

(assert (= (and b!643796 (not c!73722)) b!643790))

(assert (= (and b!643796 (not res!417085)) b!643799))

(assert (= (and b!643799 res!417082) b!643789))

(declare-fun m!616947 () Bool)

(assert (=> b!643778 m!616947))

(declare-fun m!616949 () Bool)

(assert (=> b!643784 m!616949))

(declare-fun m!616951 () Bool)

(assert (=> b!643784 m!616951))

(declare-fun m!616953 () Bool)

(assert (=> b!643784 m!616953))

(declare-fun m!616955 () Bool)

(assert (=> b!643779 m!616955))

(assert (=> b!643793 m!616949))

(assert (=> b!643793 m!616949))

(declare-fun m!616957 () Bool)

(assert (=> b!643793 m!616957))

(assert (=> b!643789 m!616949))

(assert (=> b!643789 m!616949))

(declare-fun m!616959 () Bool)

(assert (=> b!643789 m!616959))

(assert (=> b!643798 m!616949))

(declare-fun m!616961 () Bool)

(assert (=> b!643785 m!616961))

(assert (=> b!643799 m!616949))

(assert (=> b!643799 m!616949))

(assert (=> b!643799 m!616957))

(declare-fun m!616963 () Bool)

(assert (=> b!643800 m!616963))

(declare-fun m!616965 () Bool)

(assert (=> b!643800 m!616965))

(assert (=> b!643800 m!616949))

(assert (=> b!643800 m!616951))

(assert (=> b!643800 m!616949))

(declare-fun m!616967 () Bool)

(assert (=> b!643800 m!616967))

(declare-fun m!616969 () Bool)

(assert (=> b!643800 m!616969))

(declare-fun m!616971 () Bool)

(assert (=> b!643800 m!616971))

(declare-fun m!616973 () Bool)

(assert (=> b!643800 m!616973))

(assert (=> b!643787 m!616949))

(assert (=> b!643787 m!616949))

(assert (=> b!643787 m!616959))

(declare-fun m!616975 () Bool)

(assert (=> b!643782 m!616975))

(assert (=> b!643782 m!616949))

(assert (=> b!643782 m!616949))

(declare-fun m!616977 () Bool)

(assert (=> b!643782 m!616977))

(assert (=> b!643795 m!616951))

(declare-fun m!616979 () Bool)

(assert (=> b!643795 m!616979))

(assert (=> b!643786 m!616949))

(assert (=> b!643786 m!616949))

(declare-fun m!616981 () Bool)

(assert (=> b!643786 m!616981))

(declare-fun m!616983 () Bool)

(assert (=> b!643794 m!616983))

(declare-fun m!616985 () Bool)

(assert (=> b!643780 m!616985))

(declare-fun m!616987 () Bool)

(assert (=> b!643781 m!616987))

(assert (=> b!643781 m!616949))

(assert (=> b!643781 m!616949))

(declare-fun m!616989 () Bool)

(assert (=> b!643781 m!616989))

(declare-fun m!616991 () Bool)

(assert (=> b!643781 m!616991))

(assert (=> b!643781 m!616949))

(declare-fun m!616993 () Bool)

(assert (=> b!643781 m!616993))

(declare-fun m!616995 () Bool)

(assert (=> b!643781 m!616995))

(assert (=> b!643781 m!616949))

(declare-fun m!616997 () Bool)

(assert (=> b!643781 m!616997))

(declare-fun m!616999 () Bool)

(assert (=> b!643781 m!616999))

(declare-fun m!617001 () Bool)

(assert (=> b!643792 m!617001))

(declare-fun m!617003 () Bool)

(assert (=> start!58316 m!617003))

(declare-fun m!617005 () Bool)

(assert (=> start!58316 m!617005))

(check-sat (not b!643800) (not b!643785) (not b!643781) (not b!643786) (not b!643787) (not b!643794) (not b!643782) (not b!643799) (not b!643779) (not b!643789) (not b!643793) (not b!643780) (not b!643778) (not start!58316))
(check-sat)
