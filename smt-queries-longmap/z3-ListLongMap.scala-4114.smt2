; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56184 () Bool)

(assert start!56184)

(declare-fun b!622137 () Bool)

(declare-fun res!400943 () Bool)

(declare-fun e!356850 () Bool)

(assert (=> b!622137 (=> (not res!400943) (not e!356850))))

(declare-datatypes ((array!37654 0))(
  ( (array!37655 (arr!18073 (Array (_ BitVec 32) (_ BitVec 64))) (size!18437 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37654)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37654 (_ BitVec 32)) Bool)

(assert (=> b!622137 (= res!400943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622138 () Bool)

(declare-fun e!356840 () Bool)

(assert (=> b!622138 (= e!356840 e!356850)))

(declare-fun res!400939 () Bool)

(assert (=> b!622138 (=> (not res!400939) (not e!356850))))

(declare-datatypes ((SeekEntryResult!6513 0))(
  ( (MissingZero!6513 (index!28336 (_ BitVec 32))) (Found!6513 (index!28337 (_ BitVec 32))) (Intermediate!6513 (undefined!7325 Bool) (index!28338 (_ BitVec 32)) (x!57105 (_ BitVec 32))) (Undefined!6513) (MissingVacant!6513 (index!28339 (_ BitVec 32))) )
))
(declare-fun lt!288156 () SeekEntryResult!6513)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!622138 (= res!400939 (or (= lt!288156 (MissingZero!6513 i!1108)) (= lt!288156 (MissingVacant!6513 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37654 (_ BitVec 32)) SeekEntryResult!6513)

(assert (=> b!622138 (= lt!288156 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!622139 () Bool)

(declare-fun res!400944 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!622139 (= res!400944 (bvsge j!136 index!984))))

(declare-fun e!356849 () Bool)

(assert (=> b!622139 (=> res!400944 e!356849)))

(declare-fun e!356844 () Bool)

(assert (=> b!622139 (= e!356844 e!356849)))

(declare-fun b!622140 () Bool)

(declare-datatypes ((Unit!20858 0))(
  ( (Unit!20859) )
))
(declare-fun e!356838 () Unit!20858)

(declare-fun Unit!20860 () Unit!20858)

(assert (=> b!622140 (= e!356838 Unit!20860)))

(declare-fun res!400942 () Bool)

(assert (=> b!622140 (= res!400942 (= (select (store (arr!18073 a!2986) i!1108 k0!1786) index!984) (select (arr!18073 a!2986) j!136)))))

(assert (=> b!622140 (=> (not res!400942) (not e!356844))))

(assert (=> b!622140 e!356844))

(declare-fun c!70971 () Bool)

(assert (=> b!622140 (= c!70971 (bvslt j!136 index!984))))

(declare-fun lt!288153 () Unit!20858)

(declare-fun e!356842 () Unit!20858)

(assert (=> b!622140 (= lt!288153 e!356842)))

(declare-fun c!70973 () Bool)

(assert (=> b!622140 (= c!70973 (bvslt index!984 j!136))))

(declare-fun lt!288145 () Unit!20858)

(declare-fun e!356837 () Unit!20858)

(assert (=> b!622140 (= lt!288145 e!356837)))

(assert (=> b!622140 false))

(declare-fun b!622141 () Bool)

(declare-fun res!400936 () Bool)

(assert (=> b!622141 (=> (not res!400936) (not e!356840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622141 (= res!400936 (validKeyInArray!0 (select (arr!18073 a!2986) j!136)))))

(declare-fun res!400931 () Bool)

(assert (=> start!56184 (=> (not res!400931) (not e!356840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56184 (= res!400931 (validMask!0 mask!3053))))

(assert (=> start!56184 e!356840))

(assert (=> start!56184 true))

(declare-fun array_inv!13869 (array!37654) Bool)

(assert (=> start!56184 (array_inv!13869 a!2986)))

(declare-fun b!622142 () Bool)

(assert (=> b!622142 false))

(declare-fun lt!288154 () array!37654)

(declare-fun lt!288151 () Unit!20858)

(declare-datatypes ((List!12114 0))(
  ( (Nil!12111) (Cons!12110 (h!13155 (_ BitVec 64)) (t!18342 List!12114)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37654 (_ BitVec 64) (_ BitVec 32) List!12114) Unit!20858)

(assert (=> b!622142 (= lt!288151 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288154 (select (arr!18073 a!2986) j!136) j!136 Nil!12111))))

(declare-fun arrayNoDuplicates!0 (array!37654 (_ BitVec 32) List!12114) Bool)

(assert (=> b!622142 (arrayNoDuplicates!0 lt!288154 j!136 Nil!12111)))

(declare-fun lt!288150 () Unit!20858)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37654 (_ BitVec 32) (_ BitVec 32)) Unit!20858)

(assert (=> b!622142 (= lt!288150 (lemmaNoDuplicateFromThenFromBigger!0 lt!288154 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622142 (arrayNoDuplicates!0 lt!288154 #b00000000000000000000000000000000 Nil!12111)))

(declare-fun lt!288140 () Unit!20858)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37654 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12114) Unit!20858)

(assert (=> b!622142 (= lt!288140 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12111))))

(declare-fun arrayContainsKey!0 (array!37654 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622142 (arrayContainsKey!0 lt!288154 (select (arr!18073 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288147 () Unit!20858)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37654 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20858)

(assert (=> b!622142 (= lt!288147 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288154 (select (arr!18073 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20861 () Unit!20858)

(assert (=> b!622142 (= e!356842 Unit!20861)))

(declare-fun b!622143 () Bool)

(declare-fun e!356845 () Bool)

(assert (=> b!622143 (= e!356845 (arrayContainsKey!0 lt!288154 (select (arr!18073 a!2986) j!136) index!984))))

(declare-fun b!622144 () Bool)

(declare-fun e!356841 () Bool)

(assert (=> b!622144 (= e!356850 e!356841)))

(declare-fun res!400945 () Bool)

(assert (=> b!622144 (=> (not res!400945) (not e!356841))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!622144 (= res!400945 (= (select (store (arr!18073 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622144 (= lt!288154 (array!37655 (store (arr!18073 a!2986) i!1108 k0!1786) (size!18437 a!2986)))))

(declare-fun b!622145 () Bool)

(declare-fun e!356839 () Unit!20858)

(declare-fun Unit!20862 () Unit!20858)

(assert (=> b!622145 (= e!356839 Unit!20862)))

(assert (=> b!622145 false))

(declare-fun b!622146 () Bool)

(declare-fun Unit!20863 () Unit!20858)

(assert (=> b!622146 (= e!356837 Unit!20863)))

(declare-fun b!622147 () Bool)

(declare-fun res!400938 () Bool)

(assert (=> b!622147 (=> (not res!400938) (not e!356850))))

(assert (=> b!622147 (= res!400938 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12111))))

(declare-fun b!622148 () Bool)

(declare-fun e!356846 () Bool)

(declare-fun lt!288146 () SeekEntryResult!6513)

(declare-fun lt!288144 () SeekEntryResult!6513)

(assert (=> b!622148 (= e!356846 (= lt!288146 lt!288144))))

(declare-fun b!622149 () Bool)

(declare-fun res!400937 () Bool)

(assert (=> b!622149 (=> (not res!400937) (not e!356850))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!622149 (= res!400937 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18073 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!288152 () SeekEntryResult!6513)

(declare-fun e!356848 () Bool)

(declare-fun b!622150 () Bool)

(assert (=> b!622150 (= e!356848 (not (or (= lt!288152 (MissingVacant!6513 vacantSpotIndex!68)) (bvsge mask!3053 #b00000000000000000000000000000000))))))

(declare-fun lt!288138 () Unit!20858)

(assert (=> b!622150 (= lt!288138 e!356838)))

(declare-fun c!70972 () Bool)

(assert (=> b!622150 (= c!70972 (= lt!288152 (Found!6513 index!984)))))

(declare-fun lt!288155 () Unit!20858)

(assert (=> b!622150 (= lt!288155 e!356839)))

(declare-fun c!70970 () Bool)

(assert (=> b!622150 (= c!70970 (= lt!288152 Undefined!6513))))

(declare-fun lt!288142 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37654 (_ BitVec 32)) SeekEntryResult!6513)

(assert (=> b!622150 (= lt!288152 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288142 lt!288154 mask!3053))))

(assert (=> b!622150 e!356846))

(declare-fun res!400940 () Bool)

(assert (=> b!622150 (=> (not res!400940) (not e!356846))))

(declare-fun lt!288149 () (_ BitVec 32))

(assert (=> b!622150 (= res!400940 (= lt!288144 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288149 vacantSpotIndex!68 lt!288142 lt!288154 mask!3053)))))

(assert (=> b!622150 (= lt!288144 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288149 vacantSpotIndex!68 (select (arr!18073 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622150 (= lt!288142 (select (store (arr!18073 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288157 () Unit!20858)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37654 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20858)

(assert (=> b!622150 (= lt!288157 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288149 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622150 (= lt!288149 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!622151 () Bool)

(assert (=> b!622151 false))

(declare-fun lt!288148 () Unit!20858)

(assert (=> b!622151 (= lt!288148 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288154 (select (arr!18073 a!2986) j!136) index!984 Nil!12111))))

(assert (=> b!622151 (arrayNoDuplicates!0 lt!288154 index!984 Nil!12111)))

(declare-fun lt!288141 () Unit!20858)

(assert (=> b!622151 (= lt!288141 (lemmaNoDuplicateFromThenFromBigger!0 lt!288154 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622151 (arrayNoDuplicates!0 lt!288154 #b00000000000000000000000000000000 Nil!12111)))

(declare-fun lt!288139 () Unit!20858)

(assert (=> b!622151 (= lt!288139 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12111))))

(assert (=> b!622151 (arrayContainsKey!0 lt!288154 (select (arr!18073 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288143 () Unit!20858)

(assert (=> b!622151 (= lt!288143 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288154 (select (arr!18073 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622151 e!356845))

(declare-fun res!400933 () Bool)

(assert (=> b!622151 (=> (not res!400933) (not e!356845))))

(assert (=> b!622151 (= res!400933 (arrayContainsKey!0 lt!288154 (select (arr!18073 a!2986) j!136) j!136))))

(declare-fun Unit!20864 () Unit!20858)

(assert (=> b!622151 (= e!356837 Unit!20864)))

(declare-fun b!622152 () Bool)

(declare-fun res!400934 () Bool)

(assert (=> b!622152 (= res!400934 (arrayContainsKey!0 lt!288154 (select (arr!18073 a!2986) j!136) j!136))))

(declare-fun e!356843 () Bool)

(assert (=> b!622152 (=> (not res!400934) (not e!356843))))

(assert (=> b!622152 (= e!356849 e!356843)))

(declare-fun b!622153 () Bool)

(declare-fun Unit!20865 () Unit!20858)

(assert (=> b!622153 (= e!356842 Unit!20865)))

(declare-fun b!622154 () Bool)

(assert (=> b!622154 (= e!356841 e!356848)))

(declare-fun res!400941 () Bool)

(assert (=> b!622154 (=> (not res!400941) (not e!356848))))

(assert (=> b!622154 (= res!400941 (and (= lt!288146 (Found!6513 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18073 a!2986) index!984) (select (arr!18073 a!2986) j!136))) (not (= (select (arr!18073 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!622154 (= lt!288146 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18073 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622155 () Bool)

(declare-fun res!400946 () Bool)

(assert (=> b!622155 (=> (not res!400946) (not e!356840))))

(assert (=> b!622155 (= res!400946 (and (= (size!18437 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18437 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18437 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622156 () Bool)

(declare-fun res!400935 () Bool)

(assert (=> b!622156 (=> (not res!400935) (not e!356840))))

(assert (=> b!622156 (= res!400935 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622157 () Bool)

(declare-fun Unit!20866 () Unit!20858)

(assert (=> b!622157 (= e!356838 Unit!20866)))

(declare-fun b!622158 () Bool)

(declare-fun Unit!20867 () Unit!20858)

(assert (=> b!622158 (= e!356839 Unit!20867)))

(declare-fun b!622159 () Bool)

(assert (=> b!622159 (= e!356843 (arrayContainsKey!0 lt!288154 (select (arr!18073 a!2986) j!136) index!984))))

(declare-fun b!622160 () Bool)

(declare-fun res!400932 () Bool)

(assert (=> b!622160 (=> (not res!400932) (not e!356840))))

(assert (=> b!622160 (= res!400932 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56184 res!400931) b!622155))

(assert (= (and b!622155 res!400946) b!622141))

(assert (= (and b!622141 res!400936) b!622160))

(assert (= (and b!622160 res!400932) b!622156))

(assert (= (and b!622156 res!400935) b!622138))

(assert (= (and b!622138 res!400939) b!622137))

(assert (= (and b!622137 res!400943) b!622147))

(assert (= (and b!622147 res!400938) b!622149))

(assert (= (and b!622149 res!400937) b!622144))

(assert (= (and b!622144 res!400945) b!622154))

(assert (= (and b!622154 res!400941) b!622150))

(assert (= (and b!622150 res!400940) b!622148))

(assert (= (and b!622150 c!70970) b!622145))

(assert (= (and b!622150 (not c!70970)) b!622158))

(assert (= (and b!622150 c!70972) b!622140))

(assert (= (and b!622150 (not c!70972)) b!622157))

(assert (= (and b!622140 res!400942) b!622139))

(assert (= (and b!622139 (not res!400944)) b!622152))

(assert (= (and b!622152 res!400934) b!622159))

(assert (= (and b!622140 c!70971) b!622142))

(assert (= (and b!622140 (not c!70971)) b!622153))

(assert (= (and b!622140 c!70973) b!622151))

(assert (= (and b!622140 (not c!70973)) b!622146))

(assert (= (and b!622151 res!400933) b!622143))

(declare-fun m!598011 () Bool)

(assert (=> b!622150 m!598011))

(declare-fun m!598013 () Bool)

(assert (=> b!622150 m!598013))

(declare-fun m!598015 () Bool)

(assert (=> b!622150 m!598015))

(declare-fun m!598017 () Bool)

(assert (=> b!622150 m!598017))

(declare-fun m!598019 () Bool)

(assert (=> b!622150 m!598019))

(declare-fun m!598021 () Bool)

(assert (=> b!622150 m!598021))

(assert (=> b!622150 m!598015))

(declare-fun m!598023 () Bool)

(assert (=> b!622150 m!598023))

(declare-fun m!598025 () Bool)

(assert (=> b!622150 m!598025))

(declare-fun m!598027 () Bool)

(assert (=> b!622156 m!598027))

(assert (=> b!622152 m!598015))

(assert (=> b!622152 m!598015))

(declare-fun m!598029 () Bool)

(assert (=> b!622152 m!598029))

(assert (=> b!622159 m!598015))

(assert (=> b!622159 m!598015))

(declare-fun m!598031 () Bool)

(assert (=> b!622159 m!598031))

(declare-fun m!598033 () Bool)

(assert (=> b!622154 m!598033))

(assert (=> b!622154 m!598015))

(assert (=> b!622154 m!598015))

(declare-fun m!598035 () Bool)

(assert (=> b!622154 m!598035))

(declare-fun m!598037 () Bool)

(assert (=> b!622137 m!598037))

(declare-fun m!598039 () Bool)

(assert (=> b!622149 m!598039))

(assert (=> b!622144 m!598017))

(declare-fun m!598041 () Bool)

(assert (=> b!622144 m!598041))

(assert (=> b!622140 m!598017))

(declare-fun m!598043 () Bool)

(assert (=> b!622140 m!598043))

(assert (=> b!622140 m!598015))

(declare-fun m!598045 () Bool)

(assert (=> start!56184 m!598045))

(declare-fun m!598047 () Bool)

(assert (=> start!56184 m!598047))

(declare-fun m!598049 () Bool)

(assert (=> b!622160 m!598049))

(assert (=> b!622141 m!598015))

(assert (=> b!622141 m!598015))

(declare-fun m!598051 () Bool)

(assert (=> b!622141 m!598051))

(assert (=> b!622151 m!598015))

(assert (=> b!622151 m!598029))

(declare-fun m!598053 () Bool)

(assert (=> b!622151 m!598053))

(declare-fun m!598055 () Bool)

(assert (=> b!622151 m!598055))

(assert (=> b!622151 m!598015))

(assert (=> b!622151 m!598015))

(declare-fun m!598057 () Bool)

(assert (=> b!622151 m!598057))

(assert (=> b!622151 m!598015))

(declare-fun m!598059 () Bool)

(assert (=> b!622151 m!598059))

(assert (=> b!622151 m!598015))

(declare-fun m!598061 () Bool)

(assert (=> b!622151 m!598061))

(declare-fun m!598063 () Bool)

(assert (=> b!622151 m!598063))

(declare-fun m!598065 () Bool)

(assert (=> b!622151 m!598065))

(assert (=> b!622142 m!598015))

(assert (=> b!622142 m!598015))

(declare-fun m!598067 () Bool)

(assert (=> b!622142 m!598067))

(assert (=> b!622142 m!598015))

(declare-fun m!598069 () Bool)

(assert (=> b!622142 m!598069))

(assert (=> b!622142 m!598015))

(declare-fun m!598071 () Bool)

(assert (=> b!622142 m!598071))

(assert (=> b!622142 m!598063))

(assert (=> b!622142 m!598065))

(declare-fun m!598073 () Bool)

(assert (=> b!622142 m!598073))

(declare-fun m!598075 () Bool)

(assert (=> b!622142 m!598075))

(assert (=> b!622143 m!598015))

(assert (=> b!622143 m!598015))

(assert (=> b!622143 m!598031))

(declare-fun m!598077 () Bool)

(assert (=> b!622147 m!598077))

(declare-fun m!598079 () Bool)

(assert (=> b!622138 m!598079))

(check-sat (not b!622159) (not b!622160) (not start!56184) (not b!622147) (not b!622142) (not b!622150) (not b!622137) (not b!622156) (not b!622141) (not b!622143) (not b!622151) (not b!622152) (not b!622154) (not b!622138))
(check-sat)
