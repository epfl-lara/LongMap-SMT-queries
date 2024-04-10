; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55136 () Bool)

(assert start!55136)

(declare-fun b!603892 () Bool)

(declare-fun res!387911 () Bool)

(declare-fun e!345501 () Bool)

(assert (=> b!603892 (=> (not res!387911) (not e!345501))))

(declare-datatypes ((array!37209 0))(
  ( (array!37210 (arr!17861 (Array (_ BitVec 32) (_ BitVec 64))) (size!18225 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37209)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603892 (= res!387911 (validKeyInArray!0 (select (arr!17861 a!2986) j!136)))))

(declare-fun b!603893 () Bool)

(declare-fun e!345496 () Bool)

(declare-fun e!345507 () Bool)

(assert (=> b!603893 (= e!345496 e!345507)))

(declare-fun res!387924 () Bool)

(assert (=> b!603893 (=> (not res!387924) (not e!345507))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!603893 (= res!387924 (= (select (store (arr!17861 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!275301 () array!37209)

(assert (=> b!603893 (= lt!275301 (array!37210 (store (arr!17861 a!2986) i!1108 k!1786) (size!18225 a!2986)))))

(declare-fun b!603894 () Bool)

(declare-fun e!345509 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603894 (= e!345509 (arrayContainsKey!0 lt!275301 (select (arr!17861 a!2986) j!136) index!984))))

(declare-fun b!603895 () Bool)

(declare-fun e!345503 () Bool)

(assert (=> b!603895 (= e!345503 true)))

(assert (=> b!603895 e!345509))

(declare-fun res!387909 () Bool)

(assert (=> b!603895 (=> (not res!387909) (not e!345509))))

(assert (=> b!603895 (= res!387909 (arrayContainsKey!0 lt!275301 (select (arr!17861 a!2986) j!136) j!136))))

(declare-fun b!603896 () Bool)

(declare-fun res!387923 () Bool)

(assert (=> b!603896 (=> (not res!387923) (not e!345501))))

(assert (=> b!603896 (= res!387923 (validKeyInArray!0 k!1786))))

(declare-fun b!603897 () Bool)

(assert (=> b!603897 (= e!345501 e!345496)))

(declare-fun res!387922 () Bool)

(assert (=> b!603897 (=> (not res!387922) (not e!345496))))

(declare-datatypes ((SeekEntryResult!6301 0))(
  ( (MissingZero!6301 (index!27467 (_ BitVec 32))) (Found!6301 (index!27468 (_ BitVec 32))) (Intermediate!6301 (undefined!7113 Bool) (index!27469 (_ BitVec 32)) (x!56262 (_ BitVec 32))) (Undefined!6301) (MissingVacant!6301 (index!27470 (_ BitVec 32))) )
))
(declare-fun lt!275297 () SeekEntryResult!6301)

(assert (=> b!603897 (= res!387922 (or (= lt!275297 (MissingZero!6301 i!1108)) (= lt!275297 (MissingVacant!6301 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37209 (_ BitVec 32)) SeekEntryResult!6301)

(assert (=> b!603897 (= lt!275297 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!603898 () Bool)

(declare-datatypes ((Unit!19186 0))(
  ( (Unit!19187) )
))
(declare-fun e!345508 () Unit!19186)

(declare-fun Unit!19188 () Unit!19186)

(assert (=> b!603898 (= e!345508 Unit!19188)))

(declare-fun b!603899 () Bool)

(declare-fun res!387921 () Bool)

(assert (=> b!603899 (=> (not res!387921) (not e!345501))))

(assert (=> b!603899 (= res!387921 (and (= (size!18225 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18225 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18225 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603900 () Bool)

(declare-fun res!387918 () Bool)

(assert (=> b!603900 (=> (not res!387918) (not e!345496))))

(declare-datatypes ((List!11902 0))(
  ( (Nil!11899) (Cons!11898 (h!12943 (_ BitVec 64)) (t!18130 List!11902)) )
))
(declare-fun arrayNoDuplicates!0 (array!37209 (_ BitVec 32) List!11902) Bool)

(assert (=> b!603900 (= res!387918 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11899))))

(declare-fun b!603901 () Bool)

(declare-fun e!345510 () Bool)

(declare-fun e!345499 () Bool)

(assert (=> b!603901 (= e!345510 e!345499)))

(declare-fun res!387910 () Bool)

(assert (=> b!603901 (=> res!387910 e!345499)))

(declare-fun lt!275302 () (_ BitVec 64))

(declare-fun lt!275294 () (_ BitVec 64))

(assert (=> b!603901 (= res!387910 (or (not (= (select (arr!17861 a!2986) j!136) lt!275294)) (not (= (select (arr!17861 a!2986) j!136) lt!275302)) (bvsge j!136 index!984)))))

(declare-fun b!603902 () Bool)

(declare-fun e!345504 () Bool)

(declare-fun e!345505 () Bool)

(assert (=> b!603902 (= e!345504 (not e!345505))))

(declare-fun res!387912 () Bool)

(assert (=> b!603902 (=> res!387912 e!345505)))

(declare-fun lt!275292 () SeekEntryResult!6301)

(assert (=> b!603902 (= res!387912 (not (= lt!275292 (Found!6301 index!984))))))

(declare-fun lt!275295 () Unit!19186)

(declare-fun e!345497 () Unit!19186)

(assert (=> b!603902 (= lt!275295 e!345497)))

(declare-fun c!68359 () Bool)

(assert (=> b!603902 (= c!68359 (= lt!275292 Undefined!6301))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37209 (_ BitVec 32)) SeekEntryResult!6301)

(assert (=> b!603902 (= lt!275292 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!275294 lt!275301 mask!3053))))

(declare-fun e!345502 () Bool)

(assert (=> b!603902 e!345502))

(declare-fun res!387913 () Bool)

(assert (=> b!603902 (=> (not res!387913) (not e!345502))))

(declare-fun lt!275293 () SeekEntryResult!6301)

(declare-fun lt!275298 () (_ BitVec 32))

(assert (=> b!603902 (= res!387913 (= lt!275293 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275298 vacantSpotIndex!68 lt!275294 lt!275301 mask!3053)))))

(assert (=> b!603902 (= lt!275293 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!275298 vacantSpotIndex!68 (select (arr!17861 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603902 (= lt!275294 (select (store (arr!17861 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!275299 () Unit!19186)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37209 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19186)

(assert (=> b!603902 (= lt!275299 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!275298 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603902 (= lt!275298 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603903 () Bool)

(declare-fun Unit!19189 () Unit!19186)

(assert (=> b!603903 (= e!345497 Unit!19189)))

(assert (=> b!603903 false))

(declare-fun b!603904 () Bool)

(declare-fun e!345500 () Bool)

(assert (=> b!603904 (= e!345500 (arrayContainsKey!0 lt!275301 (select (arr!17861 a!2986) j!136) index!984))))

(declare-fun b!603905 () Bool)

(declare-fun res!387915 () Bool)

(assert (=> b!603905 (=> (not res!387915) (not e!345496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37209 (_ BitVec 32)) Bool)

(assert (=> b!603905 (= res!387915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!387908 () Bool)

(assert (=> start!55136 (=> (not res!387908) (not e!345501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55136 (= res!387908 (validMask!0 mask!3053))))

(assert (=> start!55136 e!345501))

(assert (=> start!55136 true))

(declare-fun array_inv!13657 (array!37209) Bool)

(assert (=> start!55136 (array_inv!13657 a!2986)))

(declare-fun b!603906 () Bool)

(declare-fun e!345498 () Bool)

(assert (=> b!603906 (= e!345505 e!345498)))

(declare-fun res!387919 () Bool)

(assert (=> b!603906 (=> res!387919 e!345498)))

(assert (=> b!603906 (= res!387919 (or (not (= (select (arr!17861 a!2986) j!136) lt!275294)) (not (= (select (arr!17861 a!2986) j!136) lt!275302))))))

(assert (=> b!603906 e!345510))

(declare-fun res!387916 () Bool)

(assert (=> b!603906 (=> (not res!387916) (not e!345510))))

(assert (=> b!603906 (= res!387916 (= lt!275302 (select (arr!17861 a!2986) j!136)))))

(assert (=> b!603906 (= lt!275302 (select (store (arr!17861 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!603907 () Bool)

(assert (=> b!603907 (= e!345498 e!345503)))

(declare-fun res!387914 () Bool)

(assert (=> b!603907 (=> res!387914 e!345503)))

(assert (=> b!603907 (= res!387914 (bvsge index!984 j!136))))

(declare-fun lt!275288 () Unit!19186)

(assert (=> b!603907 (= lt!275288 e!345508)))

(declare-fun c!68360 () Bool)

(assert (=> b!603907 (= c!68360 (bvslt j!136 index!984))))

(declare-fun b!603908 () Bool)

(declare-fun Unit!19190 () Unit!19186)

(assert (=> b!603908 (= e!345497 Unit!19190)))

(declare-fun b!603909 () Bool)

(assert (=> b!603909 (= e!345499 e!345500)))

(declare-fun res!387917 () Bool)

(assert (=> b!603909 (=> (not res!387917) (not e!345500))))

(assert (=> b!603909 (= res!387917 (arrayContainsKey!0 lt!275301 (select (arr!17861 a!2986) j!136) j!136))))

(declare-fun b!603910 () Bool)

(declare-fun res!387920 () Bool)

(assert (=> b!603910 (=> (not res!387920) (not e!345501))))

(assert (=> b!603910 (= res!387920 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603911 () Bool)

(declare-fun res!387925 () Bool)

(assert (=> b!603911 (=> (not res!387925) (not e!345496))))

(assert (=> b!603911 (= res!387925 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17861 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603912 () Bool)

(declare-fun Unit!19191 () Unit!19186)

(assert (=> b!603912 (= e!345508 Unit!19191)))

(declare-fun lt!275290 () Unit!19186)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37209 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19186)

(assert (=> b!603912 (= lt!275290 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!275301 (select (arr!17861 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603912 (arrayContainsKey!0 lt!275301 (select (arr!17861 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!275291 () Unit!19186)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37209 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11902) Unit!19186)

(assert (=> b!603912 (= lt!275291 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11899))))

(assert (=> b!603912 (arrayNoDuplicates!0 lt!275301 #b00000000000000000000000000000000 Nil!11899)))

(declare-fun lt!275289 () Unit!19186)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37209 (_ BitVec 32) (_ BitVec 32)) Unit!19186)

(assert (=> b!603912 (= lt!275289 (lemmaNoDuplicateFromThenFromBigger!0 lt!275301 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603912 (arrayNoDuplicates!0 lt!275301 j!136 Nil!11899)))

(declare-fun lt!275300 () Unit!19186)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37209 (_ BitVec 64) (_ BitVec 32) List!11902) Unit!19186)

(assert (=> b!603912 (= lt!275300 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!275301 (select (arr!17861 a!2986) j!136) j!136 Nil!11899))))

(assert (=> b!603912 false))

(declare-fun b!603913 () Bool)

(assert (=> b!603913 (= e!345507 e!345504)))

(declare-fun res!387926 () Bool)

(assert (=> b!603913 (=> (not res!387926) (not e!345504))))

(declare-fun lt!275296 () SeekEntryResult!6301)

(assert (=> b!603913 (= res!387926 (and (= lt!275296 (Found!6301 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17861 a!2986) index!984) (select (arr!17861 a!2986) j!136))) (not (= (select (arr!17861 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!603913 (= lt!275296 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17861 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603914 () Bool)

(assert (=> b!603914 (= e!345502 (= lt!275296 lt!275293))))

(assert (= (and start!55136 res!387908) b!603899))

(assert (= (and b!603899 res!387921) b!603892))

(assert (= (and b!603892 res!387911) b!603896))

(assert (= (and b!603896 res!387923) b!603910))

(assert (= (and b!603910 res!387920) b!603897))

(assert (= (and b!603897 res!387922) b!603905))

(assert (= (and b!603905 res!387915) b!603900))

(assert (= (and b!603900 res!387918) b!603911))

(assert (= (and b!603911 res!387925) b!603893))

(assert (= (and b!603893 res!387924) b!603913))

(assert (= (and b!603913 res!387926) b!603902))

(assert (= (and b!603902 res!387913) b!603914))

(assert (= (and b!603902 c!68359) b!603903))

(assert (= (and b!603902 (not c!68359)) b!603908))

(assert (= (and b!603902 (not res!387912)) b!603906))

(assert (= (and b!603906 res!387916) b!603901))

(assert (= (and b!603901 (not res!387910)) b!603909))

(assert (= (and b!603909 res!387917) b!603904))

(assert (= (and b!603906 (not res!387919)) b!603907))

(assert (= (and b!603907 c!68360) b!603912))

(assert (= (and b!603907 (not c!68360)) b!603898))

(assert (= (and b!603907 (not res!387914)) b!603895))

(assert (= (and b!603895 res!387909) b!603894))

(declare-fun m!580853 () Bool)

(assert (=> b!603902 m!580853))

(declare-fun m!580855 () Bool)

(assert (=> b!603902 m!580855))

(declare-fun m!580857 () Bool)

(assert (=> b!603902 m!580857))

(declare-fun m!580859 () Bool)

(assert (=> b!603902 m!580859))

(declare-fun m!580861 () Bool)

(assert (=> b!603902 m!580861))

(declare-fun m!580863 () Bool)

(assert (=> b!603902 m!580863))

(declare-fun m!580865 () Bool)

(assert (=> b!603902 m!580865))

(assert (=> b!603902 m!580865))

(declare-fun m!580867 () Bool)

(assert (=> b!603902 m!580867))

(assert (=> b!603893 m!580859))

(declare-fun m!580869 () Bool)

(assert (=> b!603893 m!580869))

(assert (=> b!603909 m!580865))

(assert (=> b!603909 m!580865))

(declare-fun m!580871 () Bool)

(assert (=> b!603909 m!580871))

(declare-fun m!580873 () Bool)

(assert (=> b!603913 m!580873))

(assert (=> b!603913 m!580865))

(assert (=> b!603913 m!580865))

(declare-fun m!580875 () Bool)

(assert (=> b!603913 m!580875))

(assert (=> b!603895 m!580865))

(assert (=> b!603895 m!580865))

(assert (=> b!603895 m!580871))

(declare-fun m!580877 () Bool)

(assert (=> b!603911 m!580877))

(declare-fun m!580879 () Bool)

(assert (=> b!603905 m!580879))

(assert (=> b!603901 m!580865))

(assert (=> b!603892 m!580865))

(assert (=> b!603892 m!580865))

(declare-fun m!580881 () Bool)

(assert (=> b!603892 m!580881))

(assert (=> b!603912 m!580865))

(declare-fun m!580883 () Bool)

(assert (=> b!603912 m!580883))

(assert (=> b!603912 m!580865))

(declare-fun m!580885 () Bool)

(assert (=> b!603912 m!580885))

(declare-fun m!580887 () Bool)

(assert (=> b!603912 m!580887))

(assert (=> b!603912 m!580865))

(declare-fun m!580889 () Bool)

(assert (=> b!603912 m!580889))

(declare-fun m!580891 () Bool)

(assert (=> b!603912 m!580891))

(assert (=> b!603912 m!580865))

(declare-fun m!580893 () Bool)

(assert (=> b!603912 m!580893))

(declare-fun m!580895 () Bool)

(assert (=> b!603912 m!580895))

(declare-fun m!580897 () Bool)

(assert (=> b!603897 m!580897))

(declare-fun m!580899 () Bool)

(assert (=> b!603910 m!580899))

(declare-fun m!580901 () Bool)

(assert (=> b!603896 m!580901))

(assert (=> b!603894 m!580865))

(assert (=> b!603894 m!580865))

(declare-fun m!580903 () Bool)

(assert (=> b!603894 m!580903))

(assert (=> b!603904 m!580865))

(assert (=> b!603904 m!580865))

(assert (=> b!603904 m!580903))

(assert (=> b!603906 m!580865))

(assert (=> b!603906 m!580859))

(declare-fun m!580905 () Bool)

(assert (=> b!603906 m!580905))

(declare-fun m!580907 () Bool)

(assert (=> start!55136 m!580907))

(declare-fun m!580909 () Bool)

(assert (=> start!55136 m!580909))

(declare-fun m!580911 () Bool)

(assert (=> b!603900 m!580911))

(push 1)

