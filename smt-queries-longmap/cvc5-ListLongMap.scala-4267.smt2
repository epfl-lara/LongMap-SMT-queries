; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59342 () Bool)

(assert start!59342)

(declare-fun b!654885 () Bool)

(declare-fun res!424806 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!654885 (= res!424806 (bvsge j!136 index!984))))

(declare-fun e!376094 () Bool)

(assert (=> b!654885 (=> res!424806 e!376094)))

(declare-fun e!376087 () Bool)

(assert (=> b!654885 (= e!376087 e!376094)))

(declare-fun b!654886 () Bool)

(assert (=> b!654886 false))

(declare-datatypes ((array!38662 0))(
  ( (array!38663 (arr!18531 (Array (_ BitVec 32) (_ BitVec 64))) (size!18895 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38662)

(declare-fun lt!305233 () array!38662)

(declare-datatypes ((Unit!22464 0))(
  ( (Unit!22465) )
))
(declare-fun lt!305229 () Unit!22464)

(declare-datatypes ((List!12572 0))(
  ( (Nil!12569) (Cons!12568 (h!13613 (_ BitVec 64)) (t!18800 List!12572)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38662 (_ BitVec 64) (_ BitVec 32) List!12572) Unit!22464)

(assert (=> b!654886 (= lt!305229 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305233 (select (arr!18531 a!2986) j!136) j!136 Nil!12569))))

(declare-fun arrayNoDuplicates!0 (array!38662 (_ BitVec 32) List!12572) Bool)

(assert (=> b!654886 (arrayNoDuplicates!0 lt!305233 j!136 Nil!12569)))

(declare-fun lt!305227 () Unit!22464)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38662 (_ BitVec 32) (_ BitVec 32)) Unit!22464)

(assert (=> b!654886 (= lt!305227 (lemmaNoDuplicateFromThenFromBigger!0 lt!305233 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654886 (arrayNoDuplicates!0 lt!305233 #b00000000000000000000000000000000 Nil!12569)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!305236 () Unit!22464)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38662 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12572) Unit!22464)

(assert (=> b!654886 (= lt!305236 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12569))))

(declare-fun arrayContainsKey!0 (array!38662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654886 (arrayContainsKey!0 lt!305233 (select (arr!18531 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305242 () Unit!22464)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38662 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22464)

(assert (=> b!654886 (= lt!305242 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305233 (select (arr!18531 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!376098 () Unit!22464)

(declare-fun Unit!22466 () Unit!22464)

(assert (=> b!654886 (= e!376098 Unit!22466)))

(declare-fun b!654887 () Bool)

(declare-fun e!376090 () Bool)

(declare-datatypes ((SeekEntryResult!6971 0))(
  ( (MissingZero!6971 (index!30243 (_ BitVec 32))) (Found!6971 (index!30244 (_ BitVec 32))) (Intermediate!6971 (undefined!7783 Bool) (index!30245 (_ BitVec 32)) (x!59036 (_ BitVec 32))) (Undefined!6971) (MissingVacant!6971 (index!30246 (_ BitVec 32))) )
))
(declare-fun lt!305237 () SeekEntryResult!6971)

(declare-fun lt!305226 () SeekEntryResult!6971)

(assert (=> b!654887 (= e!376090 (= lt!305237 lt!305226))))

(declare-fun b!654888 () Bool)

(declare-fun res!424811 () Bool)

(declare-fun e!376089 () Bool)

(assert (=> b!654888 (=> (not res!424811) (not e!376089))))

(assert (=> b!654888 (= res!424811 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12569))))

(declare-fun b!654889 () Bool)

(declare-fun res!424819 () Bool)

(declare-fun e!376092 () Bool)

(assert (=> b!654889 (=> (not res!424819) (not e!376092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654889 (= res!424819 (validKeyInArray!0 (select (arr!18531 a!2986) j!136)))))

(declare-fun b!654890 () Bool)

(declare-fun e!376093 () Unit!22464)

(declare-fun Unit!22467 () Unit!22464)

(assert (=> b!654890 (= e!376093 Unit!22467)))

(declare-fun res!424810 () Bool)

(assert (=> b!654890 (= res!424810 (= (select (store (arr!18531 a!2986) i!1108 k!1786) index!984) (select (arr!18531 a!2986) j!136)))))

(assert (=> b!654890 (=> (not res!424810) (not e!376087))))

(assert (=> b!654890 e!376087))

(declare-fun c!75407 () Bool)

(assert (=> b!654890 (= c!75407 (bvslt j!136 index!984))))

(declare-fun lt!305239 () Unit!22464)

(assert (=> b!654890 (= lt!305239 e!376098)))

(declare-fun c!75410 () Bool)

(assert (=> b!654890 (= c!75410 (bvslt index!984 j!136))))

(declare-fun lt!305235 () Unit!22464)

(declare-fun e!376086 () Unit!22464)

(assert (=> b!654890 (= lt!305235 e!376086)))

(assert (=> b!654890 false))

(declare-fun res!424820 () Bool)

(assert (=> start!59342 (=> (not res!424820) (not e!376092))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59342 (= res!424820 (validMask!0 mask!3053))))

(assert (=> start!59342 e!376092))

(assert (=> start!59342 true))

(declare-fun array_inv!14327 (array!38662) Bool)

(assert (=> start!59342 (array_inv!14327 a!2986)))

(declare-fun b!654891 () Bool)

(declare-fun Unit!22468 () Unit!22464)

(assert (=> b!654891 (= e!376093 Unit!22468)))

(declare-fun b!654892 () Bool)

(declare-fun e!376091 () Bool)

(declare-fun e!376096 () Bool)

(assert (=> b!654892 (= e!376091 e!376096)))

(declare-fun res!424818 () Bool)

(assert (=> b!654892 (=> (not res!424818) (not e!376096))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!654892 (= res!424818 (and (= lt!305237 (Found!6971 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18531 a!2986) index!984) (select (arr!18531 a!2986) j!136))) (not (= (select (arr!18531 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38662 (_ BitVec 32)) SeekEntryResult!6971)

(assert (=> b!654892 (= lt!305237 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18531 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654893 () Bool)

(assert (=> b!654893 (= e!376089 e!376091)))

(declare-fun res!424807 () Bool)

(assert (=> b!654893 (=> (not res!424807) (not e!376091))))

(assert (=> b!654893 (= res!424807 (= (select (store (arr!18531 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!654893 (= lt!305233 (array!38663 (store (arr!18531 a!2986) i!1108 k!1786) (size!18895 a!2986)))))

(declare-fun b!654894 () Bool)

(declare-fun e!376088 () Unit!22464)

(declare-fun Unit!22469 () Unit!22464)

(assert (=> b!654894 (= e!376088 Unit!22469)))

(assert (=> b!654894 false))

(declare-fun b!654895 () Bool)

(declare-fun Unit!22470 () Unit!22464)

(assert (=> b!654895 (= e!376088 Unit!22470)))

(declare-fun b!654896 () Bool)

(declare-fun res!424813 () Bool)

(assert (=> b!654896 (=> (not res!424813) (not e!376089))))

(assert (=> b!654896 (= res!424813 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18531 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!654897 () Bool)

(declare-fun Unit!22471 () Unit!22464)

(assert (=> b!654897 (= e!376086 Unit!22471)))

(declare-fun b!654898 () Bool)

(declare-fun e!376097 () Bool)

(assert (=> b!654898 (= e!376097 (arrayContainsKey!0 lt!305233 (select (arr!18531 a!2986) j!136) index!984))))

(declare-fun b!654899 () Bool)

(declare-fun e!376095 () Bool)

(assert (=> b!654899 (= e!376095 (arrayContainsKey!0 lt!305233 (select (arr!18531 a!2986) j!136) index!984))))

(declare-fun b!654900 () Bool)

(declare-fun res!424808 () Bool)

(assert (=> b!654900 (=> (not res!424808) (not e!376089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38662 (_ BitVec 32)) Bool)

(assert (=> b!654900 (= res!424808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654901 () Bool)

(declare-fun res!424815 () Bool)

(assert (=> b!654901 (=> (not res!424815) (not e!376092))))

(assert (=> b!654901 (= res!424815 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!654902 () Bool)

(declare-fun res!424816 () Bool)

(assert (=> b!654902 (=> (not res!424816) (not e!376092))))

(assert (=> b!654902 (= res!424816 (validKeyInArray!0 k!1786))))

(declare-fun b!654903 () Bool)

(assert (=> b!654903 (= e!376092 e!376089)))

(declare-fun res!424814 () Bool)

(assert (=> b!654903 (=> (not res!424814) (not e!376089))))

(declare-fun lt!305241 () SeekEntryResult!6971)

(assert (=> b!654903 (= res!424814 (or (= lt!305241 (MissingZero!6971 i!1108)) (= lt!305241 (MissingVacant!6971 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38662 (_ BitVec 32)) SeekEntryResult!6971)

(assert (=> b!654903 (= lt!305241 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!654904 () Bool)

(declare-fun Unit!22472 () Unit!22464)

(assert (=> b!654904 (= e!376098 Unit!22472)))

(declare-fun b!654905 () Bool)

(assert (=> b!654905 false))

(declare-fun lt!305225 () Unit!22464)

(assert (=> b!654905 (= lt!305225 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305233 (select (arr!18531 a!2986) j!136) index!984 Nil!12569))))

(assert (=> b!654905 (arrayNoDuplicates!0 lt!305233 index!984 Nil!12569)))

(declare-fun lt!305232 () Unit!22464)

(assert (=> b!654905 (= lt!305232 (lemmaNoDuplicateFromThenFromBigger!0 lt!305233 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654905 (arrayNoDuplicates!0 lt!305233 #b00000000000000000000000000000000 Nil!12569)))

(declare-fun lt!305223 () Unit!22464)

(assert (=> b!654905 (= lt!305223 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12569))))

(assert (=> b!654905 (arrayContainsKey!0 lt!305233 (select (arr!18531 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305231 () Unit!22464)

(assert (=> b!654905 (= lt!305231 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305233 (select (arr!18531 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654905 e!376097))

(declare-fun res!424812 () Bool)

(assert (=> b!654905 (=> (not res!424812) (not e!376097))))

(assert (=> b!654905 (= res!424812 (arrayContainsKey!0 lt!305233 (select (arr!18531 a!2986) j!136) j!136))))

(declare-fun Unit!22473 () Unit!22464)

(assert (=> b!654905 (= e!376086 Unit!22473)))

(declare-fun b!654906 () Bool)

(assert (=> b!654906 (= e!376096 (not true))))

(declare-fun lt!305234 () Unit!22464)

(assert (=> b!654906 (= lt!305234 e!376093)))

(declare-fun c!75408 () Bool)

(declare-fun lt!305230 () SeekEntryResult!6971)

(assert (=> b!654906 (= c!75408 (= lt!305230 (Found!6971 index!984)))))

(declare-fun lt!305228 () Unit!22464)

(assert (=> b!654906 (= lt!305228 e!376088)))

(declare-fun c!75409 () Bool)

(assert (=> b!654906 (= c!75409 (= lt!305230 Undefined!6971))))

(declare-fun lt!305240 () (_ BitVec 64))

(assert (=> b!654906 (= lt!305230 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305240 lt!305233 mask!3053))))

(assert (=> b!654906 e!376090))

(declare-fun res!424817 () Bool)

(assert (=> b!654906 (=> (not res!424817) (not e!376090))))

(declare-fun lt!305224 () (_ BitVec 32))

(assert (=> b!654906 (= res!424817 (= lt!305226 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305224 vacantSpotIndex!68 lt!305240 lt!305233 mask!3053)))))

(assert (=> b!654906 (= lt!305226 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305224 vacantSpotIndex!68 (select (arr!18531 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!654906 (= lt!305240 (select (store (arr!18531 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!305238 () Unit!22464)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38662 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22464)

(assert (=> b!654906 (= lt!305238 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305224 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654906 (= lt!305224 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!424805 () Bool)

(declare-fun b!654907 () Bool)

(assert (=> b!654907 (= res!424805 (arrayContainsKey!0 lt!305233 (select (arr!18531 a!2986) j!136) j!136))))

(assert (=> b!654907 (=> (not res!424805) (not e!376095))))

(assert (=> b!654907 (= e!376094 e!376095)))

(declare-fun b!654908 () Bool)

(declare-fun res!424809 () Bool)

(assert (=> b!654908 (=> (not res!424809) (not e!376092))))

(assert (=> b!654908 (= res!424809 (and (= (size!18895 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18895 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18895 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!59342 res!424820) b!654908))

(assert (= (and b!654908 res!424809) b!654889))

(assert (= (and b!654889 res!424819) b!654902))

(assert (= (and b!654902 res!424816) b!654901))

(assert (= (and b!654901 res!424815) b!654903))

(assert (= (and b!654903 res!424814) b!654900))

(assert (= (and b!654900 res!424808) b!654888))

(assert (= (and b!654888 res!424811) b!654896))

(assert (= (and b!654896 res!424813) b!654893))

(assert (= (and b!654893 res!424807) b!654892))

(assert (= (and b!654892 res!424818) b!654906))

(assert (= (and b!654906 res!424817) b!654887))

(assert (= (and b!654906 c!75409) b!654894))

(assert (= (and b!654906 (not c!75409)) b!654895))

(assert (= (and b!654906 c!75408) b!654890))

(assert (= (and b!654906 (not c!75408)) b!654891))

(assert (= (and b!654890 res!424810) b!654885))

(assert (= (and b!654885 (not res!424806)) b!654907))

(assert (= (and b!654907 res!424805) b!654899))

(assert (= (and b!654890 c!75407) b!654886))

(assert (= (and b!654890 (not c!75407)) b!654904))

(assert (= (and b!654890 c!75410) b!654905))

(assert (= (and b!654890 (not c!75410)) b!654897))

(assert (= (and b!654905 res!424812) b!654898))

(declare-fun m!627977 () Bool)

(assert (=> b!654901 m!627977))

(declare-fun m!627979 () Bool)

(assert (=> b!654905 m!627979))

(declare-fun m!627981 () Bool)

(assert (=> b!654905 m!627981))

(assert (=> b!654905 m!627981))

(declare-fun m!627983 () Bool)

(assert (=> b!654905 m!627983))

(declare-fun m!627985 () Bool)

(assert (=> b!654905 m!627985))

(assert (=> b!654905 m!627981))

(declare-fun m!627987 () Bool)

(assert (=> b!654905 m!627987))

(declare-fun m!627989 () Bool)

(assert (=> b!654905 m!627989))

(assert (=> b!654905 m!627981))

(declare-fun m!627991 () Bool)

(assert (=> b!654905 m!627991))

(assert (=> b!654905 m!627981))

(declare-fun m!627993 () Bool)

(assert (=> b!654905 m!627993))

(declare-fun m!627995 () Bool)

(assert (=> b!654905 m!627995))

(declare-fun m!627997 () Bool)

(assert (=> b!654900 m!627997))

(assert (=> b!654907 m!627981))

(assert (=> b!654907 m!627981))

(assert (=> b!654907 m!627993))

(assert (=> b!654899 m!627981))

(assert (=> b!654899 m!627981))

(declare-fun m!627999 () Bool)

(assert (=> b!654899 m!627999))

(declare-fun m!628001 () Bool)

(assert (=> b!654903 m!628001))

(assert (=> b!654889 m!627981))

(assert (=> b!654889 m!627981))

(declare-fun m!628003 () Bool)

(assert (=> b!654889 m!628003))

(declare-fun m!628005 () Bool)

(assert (=> b!654890 m!628005))

(declare-fun m!628007 () Bool)

(assert (=> b!654890 m!628007))

(assert (=> b!654890 m!627981))

(assert (=> b!654886 m!627981))

(declare-fun m!628009 () Bool)

(assert (=> b!654886 m!628009))

(assert (=> b!654886 m!627981))

(assert (=> b!654886 m!627981))

(declare-fun m!628011 () Bool)

(assert (=> b!654886 m!628011))

(assert (=> b!654886 m!627981))

(declare-fun m!628013 () Bool)

(assert (=> b!654886 m!628013))

(assert (=> b!654886 m!627989))

(assert (=> b!654886 m!627995))

(declare-fun m!628015 () Bool)

(assert (=> b!654886 m!628015))

(declare-fun m!628017 () Bool)

(assert (=> b!654886 m!628017))

(declare-fun m!628019 () Bool)

(assert (=> start!59342 m!628019))

(declare-fun m!628021 () Bool)

(assert (=> start!59342 m!628021))

(declare-fun m!628023 () Bool)

(assert (=> b!654906 m!628023))

(declare-fun m!628025 () Bool)

(assert (=> b!654906 m!628025))

(declare-fun m!628027 () Bool)

(assert (=> b!654906 m!628027))

(assert (=> b!654906 m!627981))

(assert (=> b!654906 m!628005))

(declare-fun m!628029 () Bool)

(assert (=> b!654906 m!628029))

(assert (=> b!654906 m!627981))

(declare-fun m!628031 () Bool)

(assert (=> b!654906 m!628031))

(declare-fun m!628033 () Bool)

(assert (=> b!654906 m!628033))

(declare-fun m!628035 () Bool)

(assert (=> b!654888 m!628035))

(declare-fun m!628037 () Bool)

(assert (=> b!654902 m!628037))

(declare-fun m!628039 () Bool)

(assert (=> b!654896 m!628039))

(assert (=> b!654898 m!627981))

(assert (=> b!654898 m!627981))

(assert (=> b!654898 m!627999))

(declare-fun m!628041 () Bool)

(assert (=> b!654892 m!628041))

(assert (=> b!654892 m!627981))

(assert (=> b!654892 m!627981))

(declare-fun m!628043 () Bool)

(assert (=> b!654892 m!628043))

(assert (=> b!654893 m!628005))

(declare-fun m!628045 () Bool)

(assert (=> b!654893 m!628045))

(push 1)

