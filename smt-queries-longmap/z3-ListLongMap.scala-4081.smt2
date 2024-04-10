; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55986 () Bool)

(assert start!55986)

(declare-fun b!614856 () Bool)

(declare-fun res!396026 () Bool)

(declare-fun e!352536 () Bool)

(assert (=> b!614856 (=> (not res!396026) (not e!352536))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!614856 (= res!396026 (validKeyInArray!0 k0!1786))))

(declare-fun b!614857 () Bool)

(declare-datatypes ((Unit!19868 0))(
  ( (Unit!19869) )
))
(declare-fun e!352529 () Unit!19868)

(declare-fun Unit!19870 () Unit!19868)

(assert (=> b!614857 (= e!352529 Unit!19870)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun res!396032 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37456 0))(
  ( (array!37457 (arr!17974 (Array (_ BitVec 32) (_ BitVec 64))) (size!18338 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37456)

(assert (=> b!614857 (= res!396032 (= (select (store (arr!17974 a!2986) i!1108 k0!1786) index!984) (select (arr!17974 a!2986) j!136)))))

(declare-fun e!352526 () Bool)

(assert (=> b!614857 (=> (not res!396032) (not e!352526))))

(assert (=> b!614857 e!352526))

(declare-fun c!69785 () Bool)

(assert (=> b!614857 (= c!69785 (bvslt j!136 index!984))))

(declare-fun lt!282199 () Unit!19868)

(declare-fun e!352539 () Unit!19868)

(assert (=> b!614857 (= lt!282199 e!352539)))

(declare-fun c!69782 () Bool)

(assert (=> b!614857 (= c!69782 (bvslt index!984 j!136))))

(declare-fun lt!282202 () Unit!19868)

(declare-fun e!352535 () Unit!19868)

(assert (=> b!614857 (= lt!282202 e!352535)))

(assert (=> b!614857 false))

(declare-fun b!614858 () Bool)

(declare-fun e!352530 () Bool)

(declare-fun e!352537 () Bool)

(assert (=> b!614858 (= e!352530 e!352537)))

(declare-fun res!396029 () Bool)

(assert (=> b!614858 (=> (not res!396029) (not e!352537))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!614858 (= res!396029 (= (select (store (arr!17974 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!282217 () array!37456)

(assert (=> b!614858 (= lt!282217 (array!37457 (store (arr!17974 a!2986) i!1108 k0!1786) (size!18338 a!2986)))))

(declare-fun b!614859 () Bool)

(declare-fun res!396028 () Bool)

(assert (=> b!614859 (=> (not res!396028) (not e!352536))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!614859 (= res!396028 (and (= (size!18338 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18338 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18338 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!614860 () Bool)

(declare-fun res!396039 () Bool)

(assert (=> b!614860 (=> (not res!396039) (not e!352536))))

(declare-fun arrayContainsKey!0 (array!37456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!614860 (= res!396039 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!614861 () Bool)

(declare-fun res!396037 () Bool)

(assert (=> b!614861 (=> (not res!396037) (not e!352530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37456 (_ BitVec 32)) Bool)

(assert (=> b!614861 (= res!396037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!614862 () Bool)

(declare-fun e!352532 () Bool)

(assert (=> b!614862 (= e!352532 (not true))))

(declare-fun lt!282206 () Unit!19868)

(assert (=> b!614862 (= lt!282206 e!352529)))

(declare-fun c!69784 () Bool)

(declare-datatypes ((SeekEntryResult!6414 0))(
  ( (MissingZero!6414 (index!27940 (_ BitVec 32))) (Found!6414 (index!27941 (_ BitVec 32))) (Intermediate!6414 (undefined!7226 Bool) (index!27942 (_ BitVec 32)) (x!56742 (_ BitVec 32))) (Undefined!6414) (MissingVacant!6414 (index!27943 (_ BitVec 32))) )
))
(declare-fun lt!282207 () SeekEntryResult!6414)

(assert (=> b!614862 (= c!69784 (= lt!282207 (Found!6414 index!984)))))

(declare-fun lt!282201 () Unit!19868)

(declare-fun e!352527 () Unit!19868)

(assert (=> b!614862 (= lt!282201 e!352527)))

(declare-fun c!69783 () Bool)

(assert (=> b!614862 (= c!69783 (= lt!282207 Undefined!6414))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!282214 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37456 (_ BitVec 32)) SeekEntryResult!6414)

(assert (=> b!614862 (= lt!282207 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282214 lt!282217 mask!3053))))

(declare-fun e!352533 () Bool)

(assert (=> b!614862 e!352533))

(declare-fun res!396041 () Bool)

(assert (=> b!614862 (=> (not res!396041) (not e!352533))))

(declare-fun lt!282209 () SeekEntryResult!6414)

(declare-fun lt!282211 () (_ BitVec 32))

(assert (=> b!614862 (= res!396041 (= lt!282209 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282211 vacantSpotIndex!68 lt!282214 lt!282217 mask!3053)))))

(assert (=> b!614862 (= lt!282209 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282211 vacantSpotIndex!68 (select (arr!17974 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!614862 (= lt!282214 (select (store (arr!17974 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!282215 () Unit!19868)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37456 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19868)

(assert (=> b!614862 (= lt!282215 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282211 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!614862 (= lt!282211 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun e!352538 () Bool)

(declare-fun b!614863 () Bool)

(assert (=> b!614863 (= e!352538 (arrayContainsKey!0 lt!282217 (select (arr!17974 a!2986) j!136) index!984))))

(declare-fun b!614865 () Bool)

(declare-fun res!396038 () Bool)

(assert (=> b!614865 (=> (not res!396038) (not e!352530))))

(declare-datatypes ((List!12015 0))(
  ( (Nil!12012) (Cons!12011 (h!13056 (_ BitVec 64)) (t!18243 List!12015)) )
))
(declare-fun arrayNoDuplicates!0 (array!37456 (_ BitVec 32) List!12015) Bool)

(assert (=> b!614865 (= res!396038 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12012))))

(declare-fun b!614866 () Bool)

(declare-fun res!396033 () Bool)

(assert (=> b!614866 (=> (not res!396033) (not e!352530))))

(assert (=> b!614866 (= res!396033 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17974 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!614867 () Bool)

(declare-fun Unit!19871 () Unit!19868)

(assert (=> b!614867 (= e!352527 Unit!19871)))

(assert (=> b!614867 false))

(declare-fun b!614868 () Bool)

(declare-fun Unit!19872 () Unit!19868)

(assert (=> b!614868 (= e!352529 Unit!19872)))

(declare-fun b!614869 () Bool)

(declare-fun Unit!19873 () Unit!19868)

(assert (=> b!614869 (= e!352535 Unit!19873)))

(declare-fun b!614870 () Bool)

(declare-fun res!396036 () Bool)

(assert (=> b!614870 (= res!396036 (arrayContainsKey!0 lt!282217 (select (arr!17974 a!2986) j!136) j!136))))

(declare-fun e!352531 () Bool)

(assert (=> b!614870 (=> (not res!396036) (not e!352531))))

(declare-fun e!352534 () Bool)

(assert (=> b!614870 (= e!352534 e!352531)))

(declare-fun b!614871 () Bool)

(assert (=> b!614871 (= e!352537 e!352532)))

(declare-fun res!396040 () Bool)

(assert (=> b!614871 (=> (not res!396040) (not e!352532))))

(declare-fun lt!282208 () SeekEntryResult!6414)

(assert (=> b!614871 (= res!396040 (and (= lt!282208 (Found!6414 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17974 a!2986) index!984) (select (arr!17974 a!2986) j!136))) (not (= (select (arr!17974 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!614871 (= lt!282208 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17974 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!614872 () Bool)

(assert (=> b!614872 false))

(declare-fun lt!282205 () Unit!19868)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37456 (_ BitVec 64) (_ BitVec 32) List!12015) Unit!19868)

(assert (=> b!614872 (= lt!282205 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282217 (select (arr!17974 a!2986) j!136) j!136 Nil!12012))))

(assert (=> b!614872 (arrayNoDuplicates!0 lt!282217 j!136 Nil!12012)))

(declare-fun lt!282203 () Unit!19868)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37456 (_ BitVec 32) (_ BitVec 32)) Unit!19868)

(assert (=> b!614872 (= lt!282203 (lemmaNoDuplicateFromThenFromBigger!0 lt!282217 #b00000000000000000000000000000000 j!136))))

(assert (=> b!614872 (arrayNoDuplicates!0 lt!282217 #b00000000000000000000000000000000 Nil!12012)))

(declare-fun lt!282210 () Unit!19868)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37456 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12015) Unit!19868)

(assert (=> b!614872 (= lt!282210 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12012))))

(assert (=> b!614872 (arrayContainsKey!0 lt!282217 (select (arr!17974 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282213 () Unit!19868)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37456 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19868)

(assert (=> b!614872 (= lt!282213 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282217 (select (arr!17974 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!19874 () Unit!19868)

(assert (=> b!614872 (= e!352539 Unit!19874)))

(declare-fun b!614873 () Bool)

(assert (=> b!614873 (= e!352533 (= lt!282208 lt!282209))))

(declare-fun res!396027 () Bool)

(assert (=> start!55986 (=> (not res!396027) (not e!352536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55986 (= res!396027 (validMask!0 mask!3053))))

(assert (=> start!55986 e!352536))

(assert (=> start!55986 true))

(declare-fun array_inv!13770 (array!37456) Bool)

(assert (=> start!55986 (array_inv!13770 a!2986)))

(declare-fun b!614864 () Bool)

(declare-fun Unit!19875 () Unit!19868)

(assert (=> b!614864 (= e!352527 Unit!19875)))

(declare-fun b!614874 () Bool)

(assert (=> b!614874 false))

(declare-fun lt!282198 () Unit!19868)

(assert (=> b!614874 (= lt!282198 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282217 (select (arr!17974 a!2986) j!136) index!984 Nil!12012))))

(assert (=> b!614874 (arrayNoDuplicates!0 lt!282217 index!984 Nil!12012)))

(declare-fun lt!282216 () Unit!19868)

(assert (=> b!614874 (= lt!282216 (lemmaNoDuplicateFromThenFromBigger!0 lt!282217 #b00000000000000000000000000000000 index!984))))

(assert (=> b!614874 (arrayNoDuplicates!0 lt!282217 #b00000000000000000000000000000000 Nil!12012)))

(declare-fun lt!282212 () Unit!19868)

(assert (=> b!614874 (= lt!282212 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12012))))

(assert (=> b!614874 (arrayContainsKey!0 lt!282217 (select (arr!17974 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282204 () Unit!19868)

(assert (=> b!614874 (= lt!282204 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282217 (select (arr!17974 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!614874 e!352538))

(declare-fun res!396034 () Bool)

(assert (=> b!614874 (=> (not res!396034) (not e!352538))))

(assert (=> b!614874 (= res!396034 (arrayContainsKey!0 lt!282217 (select (arr!17974 a!2986) j!136) j!136))))

(declare-fun Unit!19876 () Unit!19868)

(assert (=> b!614874 (= e!352535 Unit!19876)))

(declare-fun b!614875 () Bool)

(assert (=> b!614875 (= e!352536 e!352530)))

(declare-fun res!396030 () Bool)

(assert (=> b!614875 (=> (not res!396030) (not e!352530))))

(declare-fun lt!282200 () SeekEntryResult!6414)

(assert (=> b!614875 (= res!396030 (or (= lt!282200 (MissingZero!6414 i!1108)) (= lt!282200 (MissingVacant!6414 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37456 (_ BitVec 32)) SeekEntryResult!6414)

(assert (=> b!614875 (= lt!282200 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!614876 () Bool)

(declare-fun res!396035 () Bool)

(assert (=> b!614876 (= res!396035 (bvsge j!136 index!984))))

(assert (=> b!614876 (=> res!396035 e!352534)))

(assert (=> b!614876 (= e!352526 e!352534)))

(declare-fun b!614877 () Bool)

(declare-fun res!396031 () Bool)

(assert (=> b!614877 (=> (not res!396031) (not e!352536))))

(assert (=> b!614877 (= res!396031 (validKeyInArray!0 (select (arr!17974 a!2986) j!136)))))

(declare-fun b!614878 () Bool)

(assert (=> b!614878 (= e!352531 (arrayContainsKey!0 lt!282217 (select (arr!17974 a!2986) j!136) index!984))))

(declare-fun b!614879 () Bool)

(declare-fun Unit!19877 () Unit!19868)

(assert (=> b!614879 (= e!352539 Unit!19877)))

(assert (= (and start!55986 res!396027) b!614859))

(assert (= (and b!614859 res!396028) b!614877))

(assert (= (and b!614877 res!396031) b!614856))

(assert (= (and b!614856 res!396026) b!614860))

(assert (= (and b!614860 res!396039) b!614875))

(assert (= (and b!614875 res!396030) b!614861))

(assert (= (and b!614861 res!396037) b!614865))

(assert (= (and b!614865 res!396038) b!614866))

(assert (= (and b!614866 res!396033) b!614858))

(assert (= (and b!614858 res!396029) b!614871))

(assert (= (and b!614871 res!396040) b!614862))

(assert (= (and b!614862 res!396041) b!614873))

(assert (= (and b!614862 c!69783) b!614867))

(assert (= (and b!614862 (not c!69783)) b!614864))

(assert (= (and b!614862 c!69784) b!614857))

(assert (= (and b!614862 (not c!69784)) b!614868))

(assert (= (and b!614857 res!396032) b!614876))

(assert (= (and b!614876 (not res!396035)) b!614870))

(assert (= (and b!614870 res!396036) b!614878))

(assert (= (and b!614857 c!69785) b!614872))

(assert (= (and b!614857 (not c!69785)) b!614879))

(assert (= (and b!614857 c!69782) b!614874))

(assert (= (and b!614857 (not c!69782)) b!614869))

(assert (= (and b!614874 res!396034) b!614863))

(declare-fun m!591075 () Bool)

(assert (=> b!614874 m!591075))

(declare-fun m!591077 () Bool)

(assert (=> b!614874 m!591077))

(assert (=> b!614874 m!591077))

(declare-fun m!591079 () Bool)

(assert (=> b!614874 m!591079))

(declare-fun m!591081 () Bool)

(assert (=> b!614874 m!591081))

(declare-fun m!591083 () Bool)

(assert (=> b!614874 m!591083))

(assert (=> b!614874 m!591077))

(declare-fun m!591085 () Bool)

(assert (=> b!614874 m!591085))

(declare-fun m!591087 () Bool)

(assert (=> b!614874 m!591087))

(assert (=> b!614874 m!591077))

(declare-fun m!591089 () Bool)

(assert (=> b!614874 m!591089))

(assert (=> b!614874 m!591077))

(declare-fun m!591091 () Bool)

(assert (=> b!614874 m!591091))

(declare-fun m!591093 () Bool)

(assert (=> b!614856 m!591093))

(declare-fun m!591095 () Bool)

(assert (=> b!614858 m!591095))

(declare-fun m!591097 () Bool)

(assert (=> b!614858 m!591097))

(assert (=> b!614863 m!591077))

(assert (=> b!614863 m!591077))

(declare-fun m!591099 () Bool)

(assert (=> b!614863 m!591099))

(assert (=> b!614857 m!591095))

(declare-fun m!591101 () Bool)

(assert (=> b!614857 m!591101))

(assert (=> b!614857 m!591077))

(declare-fun m!591103 () Bool)

(assert (=> b!614862 m!591103))

(declare-fun m!591105 () Bool)

(assert (=> b!614862 m!591105))

(assert (=> b!614862 m!591077))

(declare-fun m!591107 () Bool)

(assert (=> b!614862 m!591107))

(assert (=> b!614862 m!591095))

(declare-fun m!591109 () Bool)

(assert (=> b!614862 m!591109))

(declare-fun m!591111 () Bool)

(assert (=> b!614862 m!591111))

(assert (=> b!614862 m!591077))

(declare-fun m!591113 () Bool)

(assert (=> b!614862 m!591113))

(declare-fun m!591115 () Bool)

(assert (=> b!614866 m!591115))

(declare-fun m!591117 () Bool)

(assert (=> start!55986 m!591117))

(declare-fun m!591119 () Bool)

(assert (=> start!55986 m!591119))

(assert (=> b!614878 m!591077))

(assert (=> b!614878 m!591077))

(assert (=> b!614878 m!591099))

(declare-fun m!591121 () Bool)

(assert (=> b!614860 m!591121))

(declare-fun m!591123 () Bool)

(assert (=> b!614871 m!591123))

(assert (=> b!614871 m!591077))

(assert (=> b!614871 m!591077))

(declare-fun m!591125 () Bool)

(assert (=> b!614871 m!591125))

(declare-fun m!591127 () Bool)

(assert (=> b!614865 m!591127))

(assert (=> b!614872 m!591075))

(assert (=> b!614872 m!591077))

(declare-fun m!591129 () Bool)

(assert (=> b!614872 m!591129))

(assert (=> b!614872 m!591077))

(declare-fun m!591131 () Bool)

(assert (=> b!614872 m!591131))

(declare-fun m!591133 () Bool)

(assert (=> b!614872 m!591133))

(assert (=> b!614872 m!591077))

(declare-fun m!591135 () Bool)

(assert (=> b!614872 m!591135))

(assert (=> b!614872 m!591077))

(declare-fun m!591137 () Bool)

(assert (=> b!614872 m!591137))

(assert (=> b!614872 m!591087))

(declare-fun m!591139 () Bool)

(assert (=> b!614861 m!591139))

(assert (=> b!614877 m!591077))

(assert (=> b!614877 m!591077))

(declare-fun m!591141 () Bool)

(assert (=> b!614877 m!591141))

(assert (=> b!614870 m!591077))

(assert (=> b!614870 m!591077))

(assert (=> b!614870 m!591085))

(declare-fun m!591143 () Bool)

(assert (=> b!614875 m!591143))

(check-sat (not start!55986) (not b!614863) (not b!614856) (not b!614877) (not b!614874) (not b!614865) (not b!614878) (not b!614871) (not b!614861) (not b!614862) (not b!614875) (not b!614870) (not b!614860) (not b!614872))
(check-sat)
