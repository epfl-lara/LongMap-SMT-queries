; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58862 () Bool)

(assert start!58862)

(declare-fun b!649081 () Bool)

(declare-fun res!420748 () Bool)

(declare-fun e!372272 () Bool)

(assert (=> b!649081 (=> (not res!420748) (not e!372272))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38535 0))(
  ( (array!38536 (arr!18473 (Array (_ BitVec 32) (_ BitVec 64))) (size!18838 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38535)

(assert (=> b!649081 (= res!420748 (and (= (size!18838 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18838 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18838 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649082 () Bool)

(declare-fun e!372274 () Bool)

(declare-fun e!372284 () Bool)

(assert (=> b!649082 (= e!372274 e!372284)))

(declare-fun res!420767 () Bool)

(assert (=> b!649082 (=> res!420767 e!372284)))

(assert (=> b!649082 (= res!420767 (or (bvsge (size!18838 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18838 a!2986))))))

(declare-fun lt!301278 () array!38535)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649082 (arrayContainsKey!0 lt!301278 (select (arr!18473 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!22088 0))(
  ( (Unit!22089) )
))
(declare-fun lt!301290 () Unit!22088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38535 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22088)

(assert (=> b!649082 (= lt!301290 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301278 (select (arr!18473 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372273 () Bool)

(assert (=> b!649082 e!372273))

(declare-fun res!420750 () Bool)

(assert (=> b!649082 (=> (not res!420750) (not e!372273))))

(assert (=> b!649082 (= res!420750 (arrayContainsKey!0 lt!301278 (select (arr!18473 a!2986) j!136) j!136))))

(declare-fun b!649083 () Bool)

(declare-fun e!372276 () Bool)

(declare-fun e!372278 () Bool)

(assert (=> b!649083 (= e!372276 e!372278)))

(declare-fun res!420757 () Bool)

(assert (=> b!649083 (=> res!420757 e!372278)))

(declare-fun lt!301274 () (_ BitVec 64))

(declare-fun lt!301280 () (_ BitVec 64))

(assert (=> b!649083 (= res!420757 (or (not (= (select (arr!18473 a!2986) j!136) lt!301274)) (not (= (select (arr!18473 a!2986) j!136) lt!301280)) (bvsge j!136 index!984)))))

(declare-fun b!649084 () Bool)

(declare-fun e!372285 () Bool)

(assert (=> b!649084 (= e!372278 e!372285)))

(declare-fun res!420753 () Bool)

(assert (=> b!649084 (=> (not res!420753) (not e!372285))))

(assert (=> b!649084 (= res!420753 (arrayContainsKey!0 lt!301278 (select (arr!18473 a!2986) j!136) j!136))))

(declare-fun res!420751 () Bool)

(assert (=> start!58862 (=> (not res!420751) (not e!372272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58862 (= res!420751 (validMask!0 mask!3053))))

(assert (=> start!58862 e!372272))

(assert (=> start!58862 true))

(declare-fun array_inv!14356 (array!38535) Bool)

(assert (=> start!58862 (array_inv!14356 a!2986)))

(declare-fun b!649085 () Bool)

(declare-fun res!420769 () Bool)

(assert (=> b!649085 (=> (not res!420769) (not e!372272))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649085 (= res!420769 (validKeyInArray!0 k0!1786))))

(declare-fun b!649086 () Bool)

(declare-fun res!420766 () Bool)

(assert (=> b!649086 (=> (not res!420766) (not e!372272))))

(assert (=> b!649086 (= res!420766 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649087 () Bool)

(declare-fun e!372282 () Unit!22088)

(declare-fun Unit!22090 () Unit!22088)

(assert (=> b!649087 (= e!372282 Unit!22090)))

(assert (=> b!649087 false))

(declare-fun b!649088 () Bool)

(declare-fun res!420762 () Bool)

(assert (=> b!649088 (=> res!420762 e!372284)))

(declare-datatypes ((List!12553 0))(
  ( (Nil!12550) (Cons!12549 (h!13594 (_ BitVec 64)) (t!18772 List!12553)) )
))
(declare-fun noDuplicate!437 (List!12553) Bool)

(assert (=> b!649088 (= res!420762 (not (noDuplicate!437 Nil!12550)))))

(declare-fun b!649089 () Bool)

(declare-fun res!420755 () Bool)

(declare-fun e!372279 () Bool)

(assert (=> b!649089 (=> (not res!420755) (not e!372279))))

(declare-fun arrayNoDuplicates!0 (array!38535 (_ BitVec 32) List!12553) Bool)

(assert (=> b!649089 (= res!420755 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12550))))

(declare-fun b!649090 () Bool)

(declare-fun e!372286 () Bool)

(declare-fun e!372280 () Bool)

(assert (=> b!649090 (= e!372286 e!372280)))

(declare-fun res!420759 () Bool)

(assert (=> b!649090 (=> (not res!420759) (not e!372280))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6910 0))(
  ( (MissingZero!6910 (index!29987 (_ BitVec 32))) (Found!6910 (index!29988 (_ BitVec 32))) (Intermediate!6910 (undefined!7722 Bool) (index!29989 (_ BitVec 32)) (x!58782 (_ BitVec 32))) (Undefined!6910) (MissingVacant!6910 (index!29990 (_ BitVec 32))) )
))
(declare-fun lt!301276 () SeekEntryResult!6910)

(assert (=> b!649090 (= res!420759 (and (= lt!301276 (Found!6910 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18473 a!2986) index!984) (select (arr!18473 a!2986) j!136))) (not (= (select (arr!18473 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38535 (_ BitVec 32)) SeekEntryResult!6910)

(assert (=> b!649090 (= lt!301276 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18473 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649091 () Bool)

(declare-fun e!372283 () Bool)

(declare-fun e!372287 () Bool)

(assert (=> b!649091 (= e!372283 e!372287)))

(declare-fun res!420768 () Bool)

(assert (=> b!649091 (=> res!420768 e!372287)))

(assert (=> b!649091 (= res!420768 (or (not (= (select (arr!18473 a!2986) j!136) lt!301274)) (not (= (select (arr!18473 a!2986) j!136) lt!301280))))))

(assert (=> b!649091 e!372276))

(declare-fun res!420749 () Bool)

(assert (=> b!649091 (=> (not res!420749) (not e!372276))))

(assert (=> b!649091 (= res!420749 (= lt!301280 (select (arr!18473 a!2986) j!136)))))

(assert (=> b!649091 (= lt!301280 (select (store (arr!18473 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!649092 () Bool)

(declare-fun res!420761 () Bool)

(assert (=> b!649092 (=> (not res!420761) (not e!372279))))

(assert (=> b!649092 (= res!420761 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18473 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649093 () Bool)

(assert (=> b!649093 (= e!372280 (not e!372283))))

(declare-fun res!420765 () Bool)

(assert (=> b!649093 (=> res!420765 e!372283)))

(declare-fun lt!301281 () SeekEntryResult!6910)

(assert (=> b!649093 (= res!420765 (not (= lt!301281 (Found!6910 index!984))))))

(declare-fun lt!301286 () Unit!22088)

(assert (=> b!649093 (= lt!301286 e!372282)))

(declare-fun c!74534 () Bool)

(assert (=> b!649093 (= c!74534 (= lt!301281 Undefined!6910))))

(assert (=> b!649093 (= lt!301281 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301274 lt!301278 mask!3053))))

(declare-fun e!372281 () Bool)

(assert (=> b!649093 e!372281))

(declare-fun res!420763 () Bool)

(assert (=> b!649093 (=> (not res!420763) (not e!372281))))

(declare-fun lt!301285 () (_ BitVec 32))

(declare-fun lt!301288 () SeekEntryResult!6910)

(assert (=> b!649093 (= res!420763 (= lt!301288 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301285 vacantSpotIndex!68 lt!301274 lt!301278 mask!3053)))))

(assert (=> b!649093 (= lt!301288 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301285 vacantSpotIndex!68 (select (arr!18473 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649093 (= lt!301274 (select (store (arr!18473 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301284 () Unit!22088)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38535 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22088)

(assert (=> b!649093 (= lt!301284 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301285 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649093 (= lt!301285 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649094 () Bool)

(declare-fun res!420760 () Bool)

(assert (=> b!649094 (=> (not res!420760) (not e!372279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38535 (_ BitVec 32)) Bool)

(assert (=> b!649094 (= res!420760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649095 () Bool)

(assert (=> b!649095 (= e!372287 e!372274)))

(declare-fun res!420756 () Bool)

(assert (=> b!649095 (=> res!420756 e!372274)))

(assert (=> b!649095 (= res!420756 (bvsge index!984 j!136))))

(declare-fun lt!301287 () Unit!22088)

(declare-fun e!372275 () Unit!22088)

(assert (=> b!649095 (= lt!301287 e!372275)))

(declare-fun c!74535 () Bool)

(assert (=> b!649095 (= c!74535 (bvslt j!136 index!984))))

(declare-fun b!649096 () Bool)

(declare-fun res!420758 () Bool)

(assert (=> b!649096 (=> res!420758 e!372284)))

(declare-fun contains!3154 (List!12553 (_ BitVec 64)) Bool)

(assert (=> b!649096 (= res!420758 (contains!3154 Nil!12550 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649097 () Bool)

(declare-fun res!420764 () Bool)

(assert (=> b!649097 (=> (not res!420764) (not e!372272))))

(assert (=> b!649097 (= res!420764 (validKeyInArray!0 (select (arr!18473 a!2986) j!136)))))

(declare-fun b!649098 () Bool)

(assert (=> b!649098 (= e!372272 e!372279)))

(declare-fun res!420752 () Bool)

(assert (=> b!649098 (=> (not res!420752) (not e!372279))))

(declare-fun lt!301279 () SeekEntryResult!6910)

(assert (=> b!649098 (= res!420752 (or (= lt!301279 (MissingZero!6910 i!1108)) (= lt!301279 (MissingVacant!6910 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38535 (_ BitVec 32)) SeekEntryResult!6910)

(assert (=> b!649098 (= lt!301279 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!649099 () Bool)

(declare-fun Unit!22091 () Unit!22088)

(assert (=> b!649099 (= e!372275 Unit!22091)))

(declare-fun lt!301283 () Unit!22088)

(assert (=> b!649099 (= lt!301283 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301278 (select (arr!18473 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649099 (arrayContainsKey!0 lt!301278 (select (arr!18473 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301289 () Unit!22088)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38535 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12553) Unit!22088)

(assert (=> b!649099 (= lt!301289 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12550))))

(assert (=> b!649099 (arrayNoDuplicates!0 lt!301278 #b00000000000000000000000000000000 Nil!12550)))

(declare-fun lt!301277 () Unit!22088)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38535 (_ BitVec 32) (_ BitVec 32)) Unit!22088)

(assert (=> b!649099 (= lt!301277 (lemmaNoDuplicateFromThenFromBigger!0 lt!301278 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649099 (arrayNoDuplicates!0 lt!301278 j!136 Nil!12550)))

(declare-fun lt!301275 () Unit!22088)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38535 (_ BitVec 64) (_ BitVec 32) List!12553) Unit!22088)

(assert (=> b!649099 (= lt!301275 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301278 (select (arr!18473 a!2986) j!136) j!136 Nil!12550))))

(assert (=> b!649099 false))

(declare-fun b!649100 () Bool)

(assert (=> b!649100 (= e!372285 (arrayContainsKey!0 lt!301278 (select (arr!18473 a!2986) j!136) index!984))))

(declare-fun b!649101 () Bool)

(declare-fun Unit!22092 () Unit!22088)

(assert (=> b!649101 (= e!372282 Unit!22092)))

(declare-fun b!649102 () Bool)

(declare-fun Unit!22093 () Unit!22088)

(assert (=> b!649102 (= e!372275 Unit!22093)))

(declare-fun b!649103 () Bool)

(assert (=> b!649103 (= e!372284 true)))

(declare-fun lt!301282 () Bool)

(assert (=> b!649103 (= lt!301282 (contains!3154 Nil!12550 k0!1786))))

(declare-fun b!649104 () Bool)

(assert (=> b!649104 (= e!372279 e!372286)))

(declare-fun res!420754 () Bool)

(assert (=> b!649104 (=> (not res!420754) (not e!372286))))

(assert (=> b!649104 (= res!420754 (= (select (store (arr!18473 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!649104 (= lt!301278 (array!38536 (store (arr!18473 a!2986) i!1108 k0!1786) (size!18838 a!2986)))))

(declare-fun b!649105 () Bool)

(assert (=> b!649105 (= e!372281 (= lt!301276 lt!301288))))

(declare-fun b!649106 () Bool)

(assert (=> b!649106 (= e!372273 (arrayContainsKey!0 lt!301278 (select (arr!18473 a!2986) j!136) index!984))))

(declare-fun b!649107 () Bool)

(declare-fun res!420747 () Bool)

(assert (=> b!649107 (=> res!420747 e!372284)))

(assert (=> b!649107 (= res!420747 (contains!3154 Nil!12550 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!58862 res!420751) b!649081))

(assert (= (and b!649081 res!420748) b!649097))

(assert (= (and b!649097 res!420764) b!649085))

(assert (= (and b!649085 res!420769) b!649086))

(assert (= (and b!649086 res!420766) b!649098))

(assert (= (and b!649098 res!420752) b!649094))

(assert (= (and b!649094 res!420760) b!649089))

(assert (= (and b!649089 res!420755) b!649092))

(assert (= (and b!649092 res!420761) b!649104))

(assert (= (and b!649104 res!420754) b!649090))

(assert (= (and b!649090 res!420759) b!649093))

(assert (= (and b!649093 res!420763) b!649105))

(assert (= (and b!649093 c!74534) b!649087))

(assert (= (and b!649093 (not c!74534)) b!649101))

(assert (= (and b!649093 (not res!420765)) b!649091))

(assert (= (and b!649091 res!420749) b!649083))

(assert (= (and b!649083 (not res!420757)) b!649084))

(assert (= (and b!649084 res!420753) b!649100))

(assert (= (and b!649091 (not res!420768)) b!649095))

(assert (= (and b!649095 c!74535) b!649099))

(assert (= (and b!649095 (not c!74535)) b!649102))

(assert (= (and b!649095 (not res!420756)) b!649082))

(assert (= (and b!649082 res!420750) b!649106))

(assert (= (and b!649082 (not res!420767)) b!649088))

(assert (= (and b!649088 (not res!420762)) b!649096))

(assert (= (and b!649096 (not res!420758)) b!649107))

(assert (= (and b!649107 (not res!420747)) b!649103))

(declare-fun m!621855 () Bool)

(assert (=> b!649093 m!621855))

(declare-fun m!621857 () Bool)

(assert (=> b!649093 m!621857))

(declare-fun m!621859 () Bool)

(assert (=> b!649093 m!621859))

(declare-fun m!621861 () Bool)

(assert (=> b!649093 m!621861))

(declare-fun m!621863 () Bool)

(assert (=> b!649093 m!621863))

(declare-fun m!621865 () Bool)

(assert (=> b!649093 m!621865))

(assert (=> b!649093 m!621861))

(declare-fun m!621867 () Bool)

(assert (=> b!649093 m!621867))

(declare-fun m!621869 () Bool)

(assert (=> b!649093 m!621869))

(declare-fun m!621871 () Bool)

(assert (=> b!649089 m!621871))

(assert (=> b!649106 m!621861))

(assert (=> b!649106 m!621861))

(declare-fun m!621873 () Bool)

(assert (=> b!649106 m!621873))

(declare-fun m!621875 () Bool)

(assert (=> b!649086 m!621875))

(assert (=> b!649097 m!621861))

(assert (=> b!649097 m!621861))

(declare-fun m!621877 () Bool)

(assert (=> b!649097 m!621877))

(declare-fun m!621879 () Bool)

(assert (=> b!649096 m!621879))

(declare-fun m!621881 () Bool)

(assert (=> start!58862 m!621881))

(declare-fun m!621883 () Bool)

(assert (=> start!58862 m!621883))

(declare-fun m!621885 () Bool)

(assert (=> b!649107 m!621885))

(declare-fun m!621887 () Bool)

(assert (=> b!649085 m!621887))

(declare-fun m!621889 () Bool)

(assert (=> b!649092 m!621889))

(assert (=> b!649100 m!621861))

(assert (=> b!649100 m!621861))

(assert (=> b!649100 m!621873))

(assert (=> b!649104 m!621863))

(declare-fun m!621891 () Bool)

(assert (=> b!649104 m!621891))

(declare-fun m!621893 () Bool)

(assert (=> b!649094 m!621893))

(assert (=> b!649082 m!621861))

(assert (=> b!649082 m!621861))

(declare-fun m!621895 () Bool)

(assert (=> b!649082 m!621895))

(assert (=> b!649082 m!621861))

(declare-fun m!621897 () Bool)

(assert (=> b!649082 m!621897))

(assert (=> b!649082 m!621861))

(declare-fun m!621899 () Bool)

(assert (=> b!649082 m!621899))

(assert (=> b!649084 m!621861))

(assert (=> b!649084 m!621861))

(assert (=> b!649084 m!621899))

(declare-fun m!621901 () Bool)

(assert (=> b!649098 m!621901))

(declare-fun m!621903 () Bool)

(assert (=> b!649088 m!621903))

(declare-fun m!621905 () Bool)

(assert (=> b!649099 m!621905))

(assert (=> b!649099 m!621861))

(declare-fun m!621907 () Bool)

(assert (=> b!649099 m!621907))

(declare-fun m!621909 () Bool)

(assert (=> b!649099 m!621909))

(assert (=> b!649099 m!621861))

(declare-fun m!621911 () Bool)

(assert (=> b!649099 m!621911))

(declare-fun m!621913 () Bool)

(assert (=> b!649099 m!621913))

(declare-fun m!621915 () Bool)

(assert (=> b!649099 m!621915))

(assert (=> b!649099 m!621861))

(assert (=> b!649099 m!621861))

(declare-fun m!621917 () Bool)

(assert (=> b!649099 m!621917))

(declare-fun m!621919 () Bool)

(assert (=> b!649090 m!621919))

(assert (=> b!649090 m!621861))

(assert (=> b!649090 m!621861))

(declare-fun m!621921 () Bool)

(assert (=> b!649090 m!621921))

(assert (=> b!649083 m!621861))

(assert (=> b!649091 m!621861))

(assert (=> b!649091 m!621863))

(declare-fun m!621923 () Bool)

(assert (=> b!649091 m!621923))

(declare-fun m!621925 () Bool)

(assert (=> b!649103 m!621925))

(check-sat (not b!649107) (not b!649090) (not b!649094) (not b!649106) (not b!649099) (not b!649096) (not b!649100) (not b!649084) (not b!649093) (not b!649089) (not b!649086) (not b!649088) (not b!649082) (not b!649098) (not start!58862) (not b!649097) (not b!649085) (not b!649103))
(check-sat)
