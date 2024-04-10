; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57602 () Bool)

(assert start!57602)

(declare-fun res!411988 () Bool)

(declare-fun e!364371 () Bool)

(assert (=> start!57602 (=> (not res!411988) (not e!364371))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57602 (= res!411988 (validMask!0 mask!3053))))

(assert (=> start!57602 e!364371))

(assert (=> start!57602 true))

(declare-datatypes ((array!38248 0))(
  ( (array!38249 (arr!18348 (Array (_ BitVec 32) (_ BitVec 64))) (size!18712 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38248)

(declare-fun array_inv!14144 (array!38248) Bool)

(assert (=> start!57602 (array_inv!14144 a!2986)))

(declare-fun b!636853 () Bool)

(declare-datatypes ((Unit!21486 0))(
  ( (Unit!21487) )
))
(declare-fun e!364375 () Unit!21486)

(declare-fun Unit!21488 () Unit!21486)

(assert (=> b!636853 (= e!364375 Unit!21488)))

(assert (=> b!636853 false))

(declare-fun b!636854 () Bool)

(declare-fun Unit!21489 () Unit!21486)

(assert (=> b!636854 (= e!364375 Unit!21489)))

(declare-fun b!636855 () Bool)

(declare-fun res!411983 () Bool)

(assert (=> b!636855 (=> (not res!411983) (not e!364371))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!636855 (= res!411983 (and (= (size!18712 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18712 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18712 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!636856 () Bool)

(declare-fun e!364369 () Bool)

(declare-fun e!364376 () Bool)

(assert (=> b!636856 (= e!364369 e!364376)))

(declare-fun res!411984 () Bool)

(assert (=> b!636856 (=> res!411984 e!364376)))

(assert (=> b!636856 (= res!411984 (or (bvsge (size!18712 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18712 a!2986))))))

(declare-fun lt!294473 () array!38248)

(declare-fun arrayContainsKey!0 (array!38248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!636856 (arrayContainsKey!0 lt!294473 (select (arr!18348 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294477 () Unit!21486)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38248 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21486)

(assert (=> b!636856 (= lt!294477 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294473 (select (arr!18348 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!636857 () Bool)

(declare-fun e!364374 () Bool)

(declare-fun e!364379 () Bool)

(assert (=> b!636857 (= e!364374 e!364379)))

(declare-fun res!411987 () Bool)

(assert (=> b!636857 (=> res!411987 e!364379)))

(declare-fun lt!294472 () (_ BitVec 64))

(declare-fun lt!294470 () (_ BitVec 64))

(assert (=> b!636857 (= res!411987 (or (not (= (select (arr!18348 a!2986) j!136) lt!294470)) (not (= (select (arr!18348 a!2986) j!136) lt!294472)) (bvsge j!136 index!984)))))

(declare-fun b!636858 () Bool)

(declare-fun e!364372 () Bool)

(assert (=> b!636858 (= e!364372 e!364369)))

(declare-fun res!411999 () Bool)

(assert (=> b!636858 (=> res!411999 e!364369)))

(assert (=> b!636858 (= res!411999 (or (not (= (select (arr!18348 a!2986) j!136) lt!294470)) (not (= (select (arr!18348 a!2986) j!136) lt!294472)) (bvsge j!136 index!984)))))

(assert (=> b!636858 e!364374))

(declare-fun res!412000 () Bool)

(assert (=> b!636858 (=> (not res!412000) (not e!364374))))

(assert (=> b!636858 (= res!412000 (= lt!294472 (select (arr!18348 a!2986) j!136)))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!636858 (= lt!294472 (select (store (arr!18348 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!636859 () Bool)

(declare-fun res!411981 () Bool)

(declare-fun e!364377 () Bool)

(assert (=> b!636859 (=> (not res!411981) (not e!364377))))

(declare-datatypes ((List!12389 0))(
  ( (Nil!12386) (Cons!12385 (h!13430 (_ BitVec 64)) (t!18617 List!12389)) )
))
(declare-fun arrayNoDuplicates!0 (array!38248 (_ BitVec 32) List!12389) Bool)

(assert (=> b!636859 (= res!411981 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12386))))

(declare-fun b!636860 () Bool)

(declare-fun contains!3103 (List!12389 (_ BitVec 64)) Bool)

(assert (=> b!636860 (= e!364376 (not (contains!3103 Nil!12386 k!1786)))))

(declare-fun b!636861 () Bool)

(declare-fun res!411993 () Bool)

(assert (=> b!636861 (=> (not res!411993) (not e!364377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38248 (_ BitVec 32)) Bool)

(assert (=> b!636861 (= res!411993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!636862 () Bool)

(declare-fun e!364370 () Bool)

(assert (=> b!636862 (= e!364370 (not e!364372))))

(declare-fun res!411996 () Bool)

(assert (=> b!636862 (=> res!411996 e!364372)))

(declare-datatypes ((SeekEntryResult!6788 0))(
  ( (MissingZero!6788 (index!29463 (_ BitVec 32))) (Found!6788 (index!29464 (_ BitVec 32))) (Intermediate!6788 (undefined!7600 Bool) (index!29465 (_ BitVec 32)) (x!58221 (_ BitVec 32))) (Undefined!6788) (MissingVacant!6788 (index!29466 (_ BitVec 32))) )
))
(declare-fun lt!294474 () SeekEntryResult!6788)

(assert (=> b!636862 (= res!411996 (not (= lt!294474 (Found!6788 index!984))))))

(declare-fun lt!294475 () Unit!21486)

(assert (=> b!636862 (= lt!294475 e!364375)))

(declare-fun c!72803 () Bool)

(assert (=> b!636862 (= c!72803 (= lt!294474 Undefined!6788))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38248 (_ BitVec 32)) SeekEntryResult!6788)

(assert (=> b!636862 (= lt!294474 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294470 lt!294473 mask!3053))))

(declare-fun e!364380 () Bool)

(assert (=> b!636862 e!364380))

(declare-fun res!411989 () Bool)

(assert (=> b!636862 (=> (not res!411989) (not e!364380))))

(declare-fun lt!294468 () (_ BitVec 32))

(declare-fun lt!294469 () SeekEntryResult!6788)

(assert (=> b!636862 (= res!411989 (= lt!294469 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294468 vacantSpotIndex!68 lt!294470 lt!294473 mask!3053)))))

(assert (=> b!636862 (= lt!294469 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294468 vacantSpotIndex!68 (select (arr!18348 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!636862 (= lt!294470 (select (store (arr!18348 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!294478 () Unit!21486)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38248 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21486)

(assert (=> b!636862 (= lt!294478 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294468 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!636862 (= lt!294468 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!636863 () Bool)

(declare-fun e!364378 () Bool)

(assert (=> b!636863 (= e!364378 (arrayContainsKey!0 lt!294473 (select (arr!18348 a!2986) j!136) index!984))))

(declare-fun b!636864 () Bool)

(declare-fun res!411990 () Bool)

(assert (=> b!636864 (=> (not res!411990) (not e!364377))))

(assert (=> b!636864 (= res!411990 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18348 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!636865 () Bool)

(declare-fun res!411982 () Bool)

(assert (=> b!636865 (=> res!411982 e!364376)))

(declare-fun noDuplicate!381 (List!12389) Bool)

(assert (=> b!636865 (= res!411982 (not (noDuplicate!381 Nil!12386)))))

(declare-fun b!636866 () Bool)

(assert (=> b!636866 (= e!364371 e!364377)))

(declare-fun res!411994 () Bool)

(assert (=> b!636866 (=> (not res!411994) (not e!364377))))

(declare-fun lt!294476 () SeekEntryResult!6788)

(assert (=> b!636866 (= res!411994 (or (= lt!294476 (MissingZero!6788 i!1108)) (= lt!294476 (MissingVacant!6788 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38248 (_ BitVec 32)) SeekEntryResult!6788)

(assert (=> b!636866 (= lt!294476 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!636867 () Bool)

(declare-fun res!411997 () Bool)

(assert (=> b!636867 (=> (not res!411997) (not e!364371))))

(assert (=> b!636867 (= res!411997 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!636868 () Bool)

(declare-fun res!411985 () Bool)

(assert (=> b!636868 (=> res!411985 e!364376)))

(assert (=> b!636868 (= res!411985 (contains!3103 Nil!12386 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!636869 () Bool)

(declare-fun lt!294471 () SeekEntryResult!6788)

(assert (=> b!636869 (= e!364380 (= lt!294471 lt!294469))))

(declare-fun b!636870 () Bool)

(declare-fun e!364373 () Bool)

(assert (=> b!636870 (= e!364377 e!364373)))

(declare-fun res!411991 () Bool)

(assert (=> b!636870 (=> (not res!411991) (not e!364373))))

(assert (=> b!636870 (= res!411991 (= (select (store (arr!18348 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!636870 (= lt!294473 (array!38249 (store (arr!18348 a!2986) i!1108 k!1786) (size!18712 a!2986)))))

(declare-fun b!636871 () Bool)

(declare-fun res!412001 () Bool)

(assert (=> b!636871 (=> (not res!412001) (not e!364371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!636871 (= res!412001 (validKeyInArray!0 (select (arr!18348 a!2986) j!136)))))

(declare-fun b!636872 () Bool)

(assert (=> b!636872 (= e!364379 e!364378)))

(declare-fun res!411998 () Bool)

(assert (=> b!636872 (=> (not res!411998) (not e!364378))))

(assert (=> b!636872 (= res!411998 (arrayContainsKey!0 lt!294473 (select (arr!18348 a!2986) j!136) j!136))))

(declare-fun b!636873 () Bool)

(declare-fun res!411986 () Bool)

(assert (=> b!636873 (=> (not res!411986) (not e!364371))))

(assert (=> b!636873 (= res!411986 (validKeyInArray!0 k!1786))))

(declare-fun b!636874 () Bool)

(assert (=> b!636874 (= e!364373 e!364370)))

(declare-fun res!411992 () Bool)

(assert (=> b!636874 (=> (not res!411992) (not e!364370))))

(assert (=> b!636874 (= res!411992 (and (= lt!294471 (Found!6788 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18348 a!2986) index!984) (select (arr!18348 a!2986) j!136))) (not (= (select (arr!18348 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!636874 (= lt!294471 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18348 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!636875 () Bool)

(declare-fun res!411995 () Bool)

(assert (=> b!636875 (=> res!411995 e!364376)))

(assert (=> b!636875 (= res!411995 (contains!3103 Nil!12386 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!57602 res!411988) b!636855))

(assert (= (and b!636855 res!411983) b!636871))

(assert (= (and b!636871 res!412001) b!636873))

(assert (= (and b!636873 res!411986) b!636867))

(assert (= (and b!636867 res!411997) b!636866))

(assert (= (and b!636866 res!411994) b!636861))

(assert (= (and b!636861 res!411993) b!636859))

(assert (= (and b!636859 res!411981) b!636864))

(assert (= (and b!636864 res!411990) b!636870))

(assert (= (and b!636870 res!411991) b!636874))

(assert (= (and b!636874 res!411992) b!636862))

(assert (= (and b!636862 res!411989) b!636869))

(assert (= (and b!636862 c!72803) b!636853))

(assert (= (and b!636862 (not c!72803)) b!636854))

(assert (= (and b!636862 (not res!411996)) b!636858))

(assert (= (and b!636858 res!412000) b!636857))

(assert (= (and b!636857 (not res!411987)) b!636872))

(assert (= (and b!636872 res!411998) b!636863))

(assert (= (and b!636858 (not res!411999)) b!636856))

(assert (= (and b!636856 (not res!411984)) b!636865))

(assert (= (and b!636865 (not res!411982)) b!636875))

(assert (= (and b!636875 (not res!411995)) b!636868))

(assert (= (and b!636868 (not res!411985)) b!636860))

(declare-fun m!611009 () Bool)

(assert (=> b!636860 m!611009))

(declare-fun m!611011 () Bool)

(assert (=> b!636859 m!611011))

(declare-fun m!611013 () Bool)

(assert (=> b!636858 m!611013))

(declare-fun m!611015 () Bool)

(assert (=> b!636858 m!611015))

(declare-fun m!611017 () Bool)

(assert (=> b!636858 m!611017))

(declare-fun m!611019 () Bool)

(assert (=> b!636861 m!611019))

(declare-fun m!611021 () Bool)

(assert (=> b!636867 m!611021))

(declare-fun m!611023 () Bool)

(assert (=> b!636864 m!611023))

(declare-fun m!611025 () Bool)

(assert (=> start!57602 m!611025))

(declare-fun m!611027 () Bool)

(assert (=> start!57602 m!611027))

(declare-fun m!611029 () Bool)

(assert (=> b!636862 m!611029))

(assert (=> b!636862 m!611013))

(assert (=> b!636862 m!611015))

(declare-fun m!611031 () Bool)

(assert (=> b!636862 m!611031))

(declare-fun m!611033 () Bool)

(assert (=> b!636862 m!611033))

(declare-fun m!611035 () Bool)

(assert (=> b!636862 m!611035))

(assert (=> b!636862 m!611013))

(declare-fun m!611037 () Bool)

(assert (=> b!636862 m!611037))

(declare-fun m!611039 () Bool)

(assert (=> b!636862 m!611039))

(assert (=> b!636870 m!611015))

(declare-fun m!611041 () Bool)

(assert (=> b!636870 m!611041))

(assert (=> b!636857 m!611013))

(assert (=> b!636871 m!611013))

(assert (=> b!636871 m!611013))

(declare-fun m!611043 () Bool)

(assert (=> b!636871 m!611043))

(declare-fun m!611045 () Bool)

(assert (=> b!636874 m!611045))

(assert (=> b!636874 m!611013))

(assert (=> b!636874 m!611013))

(declare-fun m!611047 () Bool)

(assert (=> b!636874 m!611047))

(assert (=> b!636856 m!611013))

(assert (=> b!636856 m!611013))

(declare-fun m!611049 () Bool)

(assert (=> b!636856 m!611049))

(assert (=> b!636856 m!611013))

(declare-fun m!611051 () Bool)

(assert (=> b!636856 m!611051))

(declare-fun m!611053 () Bool)

(assert (=> b!636875 m!611053))

(declare-fun m!611055 () Bool)

(assert (=> b!636868 m!611055))

(assert (=> b!636863 m!611013))

(assert (=> b!636863 m!611013))

(declare-fun m!611057 () Bool)

(assert (=> b!636863 m!611057))

(assert (=> b!636872 m!611013))

(assert (=> b!636872 m!611013))

(declare-fun m!611059 () Bool)

(assert (=> b!636872 m!611059))

(declare-fun m!611061 () Bool)

(assert (=> b!636865 m!611061))

(declare-fun m!611063 () Bool)

(assert (=> b!636866 m!611063))

(declare-fun m!611065 () Bool)

(assert (=> b!636873 m!611065))

(push 1)

(assert (not b!636872))

(assert (not b!636874))

(assert (not b!636863))

(assert (not b!636865))

(assert (not b!636873))

(assert (not b!636867))

(assert (not b!636866))

(assert (not b!636871))

(assert (not b!636859))

(assert (not b!636862))

(assert (not b!636868))

(assert (not b!636860))

(assert (not b!636861))

(assert (not b!636875))

(assert (not b!636856))

(assert (not start!57602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90089 () Bool)

(declare-fun res!412158 () Bool)

(declare-fun e!364508 () Bool)

(assert (=> d!90089 (=> res!412158 e!364508)))

(assert (=> d!90089 (= res!412158 (bvsge #b00000000000000000000000000000000 (size!18712 a!2986)))))

(assert (=> d!90089 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12386) e!364508)))

(declare-fun b!637077 () Bool)

(declare-fun e!364507 () Bool)

(assert (=> b!637077 (= e!364507 (contains!3103 Nil!12386 (select (arr!18348 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!637078 () Bool)

(declare-fun e!364506 () Bool)

(assert (=> b!637078 (= e!364508 e!364506)))

(declare-fun res!412157 () Bool)

(assert (=> b!637078 (=> (not res!412157) (not e!364506))))

(assert (=> b!637078 (= res!412157 (not e!364507))))

(declare-fun res!412159 () Bool)

(assert (=> b!637078 (=> (not res!412159) (not e!364507))))

(assert (=> b!637078 (= res!412159 (validKeyInArray!0 (select (arr!18348 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!637079 () Bool)

(declare-fun e!364505 () Bool)

(declare-fun call!33452 () Bool)

(assert (=> b!637079 (= e!364505 call!33452)))

(declare-fun b!637080 () Bool)

(assert (=> b!637080 (= e!364505 call!33452)))

(declare-fun bm!33449 () Bool)

(declare-fun c!72827 () Bool)

(assert (=> bm!33449 (= call!33452 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72827 (Cons!12385 (select (arr!18348 a!2986) #b00000000000000000000000000000000) Nil!12386) Nil!12386)))))

(declare-fun b!637081 () Bool)

(assert (=> b!637081 (= e!364506 e!364505)))

(assert (=> b!637081 (= c!72827 (validKeyInArray!0 (select (arr!18348 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90089 (not res!412158)) b!637078))

(assert (= (and b!637078 res!412159) b!637077))

(assert (= (and b!637078 res!412157) b!637081))

(assert (= (and b!637081 c!72827) b!637079))

(assert (= (and b!637081 (not c!72827)) b!637080))

(assert (= (or b!637079 b!637080) bm!33449))

(declare-fun m!611235 () Bool)

(assert (=> b!637077 m!611235))

(assert (=> b!637077 m!611235))

(declare-fun m!611237 () Bool)

(assert (=> b!637077 m!611237))

(assert (=> b!637078 m!611235))

(assert (=> b!637078 m!611235))

(declare-fun m!611239 () Bool)

(assert (=> b!637078 m!611239))

(assert (=> bm!33449 m!611235))

(declare-fun m!611241 () Bool)

(assert (=> bm!33449 m!611241))

(assert (=> b!637081 m!611235))

(assert (=> b!637081 m!611235))

(assert (=> b!637081 m!611239))

(assert (=> b!636859 d!90089))

(declare-fun d!90099 () Bool)

(declare-fun lt!294575 () Bool)

(declare-fun content!245 (List!12389) (Set (_ BitVec 64)))

(assert (=> d!90099 (= lt!294575 (set.member k!1786 (content!245 Nil!12386)))))

(declare-fun e!364531 () Bool)

(assert (=> d!90099 (= lt!294575 e!364531)))

(declare-fun res!412177 () Bool)

(assert (=> d!90099 (=> (not res!412177) (not e!364531))))

(assert (=> d!90099 (= res!412177 (is-Cons!12385 Nil!12386))))

(assert (=> d!90099 (= (contains!3103 Nil!12386 k!1786) lt!294575)))

(declare-fun b!637109 () Bool)

(declare-fun e!364532 () Bool)

(assert (=> b!637109 (= e!364531 e!364532)))

(declare-fun res!412178 () Bool)

(assert (=> b!637109 (=> res!412178 e!364532)))

(assert (=> b!637109 (= res!412178 (= (h!13430 Nil!12386) k!1786))))

(declare-fun b!637110 () Bool)

(assert (=> b!637110 (= e!364532 (contains!3103 (t!18617 Nil!12386) k!1786))))

(assert (= (and d!90099 res!412177) b!637109))

(assert (= (and b!637109 (not res!412178)) b!637110))

(declare-fun m!611251 () Bool)

(assert (=> d!90099 m!611251))

(declare-fun m!611253 () Bool)

(assert (=> d!90099 m!611253))

(declare-fun m!611255 () Bool)

(assert (=> b!637110 m!611255))

(assert (=> b!636860 d!90099))

(declare-fun d!90103 () Bool)

(assert (=> d!90103 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57602 d!90103))

(declare-fun d!90115 () Bool)

(assert (=> d!90115 (= (array_inv!14144 a!2986) (bvsge (size!18712 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57602 d!90115))

(declare-fun d!90117 () Bool)

(assert (=> d!90117 (= (validKeyInArray!0 (select (arr!18348 a!2986) j!136)) (and (not (= (select (arr!18348 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18348 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!636871 d!90117))

(declare-fun d!90119 () Bool)

(declare-fun res!412195 () Bool)

(declare-fun e!364550 () Bool)

(assert (=> d!90119 (=> res!412195 e!364550)))

(assert (=> d!90119 (= res!412195 (= (select (arr!18348 lt!294473) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18348 a!2986) j!136)))))

(assert (=> d!90119 (= (arrayContainsKey!0 lt!294473 (select (arr!18348 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!364550)))

(declare-fun b!637129 () Bool)

(declare-fun e!364551 () Bool)

(assert (=> b!637129 (= e!364550 e!364551)))

(declare-fun res!412196 () Bool)

(assert (=> b!637129 (=> (not res!412196) (not e!364551))))

(assert (=> b!637129 (= res!412196 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18712 lt!294473)))))

(declare-fun b!637130 () Bool)

(assert (=> b!637130 (= e!364551 (arrayContainsKey!0 lt!294473 (select (arr!18348 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90119 (not res!412195)) b!637129))

(assert (= (and b!637129 res!412196) b!637130))

(declare-fun m!611281 () Bool)

(assert (=> d!90119 m!611281))

(assert (=> b!637130 m!611013))

(declare-fun m!611283 () Bool)

(assert (=> b!637130 m!611283))

(assert (=> b!636856 d!90119))

(declare-fun d!90121 () Bool)

(assert (=> d!90121 (arrayContainsKey!0 lt!294473 (select (arr!18348 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294590 () Unit!21486)

(declare-fun choose!114 (array!38248 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21486)

(assert (=> d!90121 (= lt!294590 (choose!114 lt!294473 (select (arr!18348 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90121 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90121 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294473 (select (arr!18348 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!294590)))

(declare-fun bs!19126 () Bool)

(assert (= bs!19126 d!90121))

(assert (=> bs!19126 m!611013))

(assert (=> bs!19126 m!611049))

(assert (=> bs!19126 m!611013))

(declare-fun m!611285 () Bool)

(assert (=> bs!19126 m!611285))

(assert (=> b!636856 d!90121))

(declare-fun d!90123 () Bool)

(declare-fun res!412197 () Bool)

(declare-fun e!364558 () Bool)

(assert (=> d!90123 (=> res!412197 e!364558)))

(assert (=> d!90123 (= res!412197 (= (select (arr!18348 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!90123 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!364558)))

(declare-fun b!637143 () Bool)

(declare-fun e!364559 () Bool)

(assert (=> b!637143 (= e!364558 e!364559)))

(declare-fun res!412198 () Bool)

(assert (=> b!637143 (=> (not res!412198) (not e!364559))))

(assert (=> b!637143 (= res!412198 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18712 a!2986)))))

(declare-fun b!637144 () Bool)

(assert (=> b!637144 (= e!364559 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90123 (not res!412197)) b!637143))

(assert (= (and b!637143 res!412198) b!637144))

(assert (=> d!90123 m!611235))

(declare-fun m!611287 () Bool)

(assert (=> b!637144 m!611287))

(assert (=> b!636867 d!90123))

(declare-fun b!637213 () Bool)

(declare-fun e!364605 () SeekEntryResult!6788)

(declare-fun lt!294621 () SeekEntryResult!6788)

(assert (=> b!637213 (= e!364605 (Found!6788 (index!29465 lt!294621)))))

(declare-fun b!637214 () Bool)

(declare-fun c!72864 () Bool)

(declare-fun lt!294619 () (_ BitVec 64))

(assert (=> b!637214 (= c!72864 (= lt!294619 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364604 () SeekEntryResult!6788)

(assert (=> b!637214 (= e!364605 e!364604)))

(declare-fun b!637215 () Bool)

(assert (=> b!637215 (= e!364604 (seekKeyOrZeroReturnVacant!0 (x!58221 lt!294621) (index!29465 lt!294621) (index!29465 lt!294621) k!1786 a!2986 mask!3053))))

(declare-fun b!637216 () Bool)

(declare-fun e!364606 () SeekEntryResult!6788)

(assert (=> b!637216 (= e!364606 Undefined!6788)))

(declare-fun b!637217 () Bool)

(assert (=> b!637217 (= e!364606 e!364605)))

(assert (=> b!637217 (= lt!294619 (select (arr!18348 a!2986) (index!29465 lt!294621)))))

(declare-fun c!72865 () Bool)

(assert (=> b!637217 (= c!72865 (= lt!294619 k!1786))))

(declare-fun b!637218 () Bool)

(assert (=> b!637218 (= e!364604 (MissingZero!6788 (index!29465 lt!294621)))))

(declare-fun d!90125 () Bool)

(declare-fun lt!294620 () SeekEntryResult!6788)

(assert (=> d!90125 (and (or (is-Undefined!6788 lt!294620) (not (is-Found!6788 lt!294620)) (and (bvsge (index!29464 lt!294620) #b00000000000000000000000000000000) (bvslt (index!29464 lt!294620) (size!18712 a!2986)))) (or (is-Undefined!6788 lt!294620) (is-Found!6788 lt!294620) (not (is-MissingZero!6788 lt!294620)) (and (bvsge (index!29463 lt!294620) #b00000000000000000000000000000000) (bvslt (index!29463 lt!294620) (size!18712 a!2986)))) (or (is-Undefined!6788 lt!294620) (is-Found!6788 lt!294620) (is-MissingZero!6788 lt!294620) (not (is-MissingVacant!6788 lt!294620)) (and (bvsge (index!29466 lt!294620) #b00000000000000000000000000000000) (bvslt (index!29466 lt!294620) (size!18712 a!2986)))) (or (is-Undefined!6788 lt!294620) (ite (is-Found!6788 lt!294620) (= (select (arr!18348 a!2986) (index!29464 lt!294620)) k!1786) (ite (is-MissingZero!6788 lt!294620) (= (select (arr!18348 a!2986) (index!29463 lt!294620)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6788 lt!294620) (= (select (arr!18348 a!2986) (index!29466 lt!294620)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90125 (= lt!294620 e!364606)))

(declare-fun c!72866 () Bool)

(assert (=> d!90125 (= c!72866 (and (is-Intermediate!6788 lt!294621) (undefined!7600 lt!294621)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38248 (_ BitVec 32)) SeekEntryResult!6788)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90125 (= lt!294621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!90125 (validMask!0 mask!3053)))

(assert (=> d!90125 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!294620)))

(assert (= (and d!90125 c!72866) b!637216))

(assert (= (and d!90125 (not c!72866)) b!637217))

(assert (= (and b!637217 c!72865) b!637213))

(assert (= (and b!637217 (not c!72865)) b!637214))

(assert (= (and b!637214 c!72864) b!637218))

(assert (= (and b!637214 (not c!72864)) b!637215))

(declare-fun m!611339 () Bool)

(assert (=> b!637215 m!611339))

(declare-fun m!611341 () Bool)

(assert (=> b!637217 m!611341))

(declare-fun m!611343 () Bool)

(assert (=> d!90125 m!611343))

(declare-fun m!611345 () Bool)

(assert (=> d!90125 m!611345))

(declare-fun m!611347 () Bool)

(assert (=> d!90125 m!611347))

(assert (=> d!90125 m!611343))

(declare-fun m!611349 () Bool)

(assert (=> d!90125 m!611349))

(assert (=> d!90125 m!611025))

(declare-fun m!611351 () Bool)

(assert (=> d!90125 m!611351))

(assert (=> b!636866 d!90125))

(declare-fun d!90147 () Bool)

(declare-fun lt!294622 () Bool)

(assert (=> d!90147 (= lt!294622 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!245 Nil!12386)))))

(declare-fun e!364607 () Bool)

(assert (=> d!90147 (= lt!294622 e!364607)))

(declare-fun res!412219 () Bool)

(assert (=> d!90147 (=> (not res!412219) (not e!364607))))

(assert (=> d!90147 (= res!412219 (is-Cons!12385 Nil!12386))))

(assert (=> d!90147 (= (contains!3103 Nil!12386 #b1000000000000000000000000000000000000000000000000000000000000000) lt!294622)))

(declare-fun b!637219 () Bool)

(declare-fun e!364608 () Bool)

(assert (=> b!637219 (= e!364607 e!364608)))

(declare-fun res!412220 () Bool)

(assert (=> b!637219 (=> res!412220 e!364608)))

(assert (=> b!637219 (= res!412220 (= (h!13430 Nil!12386) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637220 () Bool)

(assert (=> b!637220 (= e!364608 (contains!3103 (t!18617 Nil!12386) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90147 res!412219) b!637219))

(assert (= (and b!637219 (not res!412220)) b!637220))

(assert (=> d!90147 m!611251))

(declare-fun m!611353 () Bool)

(assert (=> d!90147 m!611353))

(declare-fun m!611355 () Bool)

(assert (=> b!637220 m!611355))

(assert (=> b!636868 d!90147))

(declare-fun d!90149 () Bool)

(declare-fun lt!294623 () Bool)

(assert (=> d!90149 (= lt!294623 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!245 Nil!12386)))))

(declare-fun e!364609 () Bool)

(assert (=> d!90149 (= lt!294623 e!364609)))

(declare-fun res!412221 () Bool)

(assert (=> d!90149 (=> (not res!412221) (not e!364609))))

(assert (=> d!90149 (= res!412221 (is-Cons!12385 Nil!12386))))

(assert (=> d!90149 (= (contains!3103 Nil!12386 #b0000000000000000000000000000000000000000000000000000000000000000) lt!294623)))

(declare-fun b!637221 () Bool)

(declare-fun e!364610 () Bool)

(assert (=> b!637221 (= e!364609 e!364610)))

(declare-fun res!412222 () Bool)

(assert (=> b!637221 (=> res!412222 e!364610)))

(assert (=> b!637221 (= res!412222 (= (h!13430 Nil!12386) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637222 () Bool)

(assert (=> b!637222 (= e!364610 (contains!3103 (t!18617 Nil!12386) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!90149 res!412221) b!637221))

(assert (= (and b!637221 (not res!412222)) b!637222))

(assert (=> d!90149 m!611251))

(declare-fun m!611357 () Bool)

(assert (=> d!90149 m!611357))

(declare-fun m!611359 () Bool)

(assert (=> b!637222 m!611359))

(assert (=> b!636875 d!90149))

(declare-fun b!637253 () Bool)

(declare-fun c!72882 () Bool)

(declare-fun lt!294638 () (_ BitVec 64))

(assert (=> b!637253 (= c!72882 (= lt!294638 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!364628 () SeekEntryResult!6788)

(declare-fun e!364627 () SeekEntryResult!6788)

(assert (=> b!637253 (= e!364628 e!364627)))

(declare-fun b!637254 () Bool)

(assert (=> b!637254 (= e!364627 (MissingVacant!6788 vacantSpotIndex!68))))

(declare-fun d!90151 () Bool)

(declare-fun lt!294637 () SeekEntryResult!6788)

(assert (=> d!90151 (and (or (is-Undefined!6788 lt!294637) (not (is-Found!6788 lt!294637)) (and (bvsge (index!29464 lt!294637) #b00000000000000000000000000000000) (bvslt (index!29464 lt!294637) (size!18712 a!2986)))) (or (is-Undefined!6788 lt!294637) (is-Found!6788 lt!294637) (not (is-MissingVacant!6788 lt!294637)) (not (= (index!29466 lt!294637) vacantSpotIndex!68)) (and (bvsge (index!29466 lt!294637) #b00000000000000000000000000000000) (bvslt (index!29466 lt!294637) (size!18712 a!2986)))) (or (is-Undefined!6788 lt!294637) (ite (is-Found!6788 lt!294637) (= (select (arr!18348 a!2986) (index!29464 lt!294637)) (select (arr!18348 a!2986) j!136)) (and (is-MissingVacant!6788 lt!294637) (= (index!29466 lt!294637) vacantSpotIndex!68) (= (select (arr!18348 a!2986) (index!29466 lt!294637)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!364626 () SeekEntryResult!6788)

(assert (=> d!90151 (= lt!294637 e!364626)))

(declare-fun c!72884 () Bool)

(assert (=> d!90151 (= c!72884 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90151 (= lt!294638 (select (arr!18348 a!2986) index!984))))

(assert (=> d!90151 (validMask!0 mask!3053)))

(assert (=> d!90151 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18348 a!2986) j!136) a!2986 mask!3053) lt!294637)))

(declare-fun b!637255 () Bool)

(assert (=> b!637255 (= e!364626 Undefined!6788)))

(declare-fun b!637256 () Bool)

(assert (=> b!637256 (= e!364627 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18348 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637257 () Bool)

(assert (=> b!637257 (= e!364628 (Found!6788 index!984))))

(declare-fun b!637258 () Bool)

(assert (=> b!637258 (= e!364626 e!364628)))

(declare-fun c!72883 () Bool)

(assert (=> b!637258 (= c!72883 (= lt!294638 (select (arr!18348 a!2986) j!136)))))

(assert (= (and d!90151 c!72884) b!637255))

(assert (= (and d!90151 (not c!72884)) b!637258))

(assert (= (and b!637258 c!72883) b!637257))

(assert (= (and b!637258 (not c!72883)) b!637253))

(assert (= (and b!637253 c!72882) b!637254))

(assert (= (and b!637253 (not c!72882)) b!637256))

(declare-fun m!611375 () Bool)

(assert (=> d!90151 m!611375))

(declare-fun m!611377 () Bool)

(assert (=> d!90151 m!611377))

(assert (=> d!90151 m!611045))

(assert (=> d!90151 m!611025))

(assert (=> b!637256 m!611029))

(assert (=> b!637256 m!611029))

(assert (=> b!637256 m!611013))

(declare-fun m!611379 () Bool)

(assert (=> b!637256 m!611379))

(assert (=> b!636874 d!90151))

(declare-fun d!90155 () Bool)

(declare-fun res!412227 () Bool)

(declare-fun e!364633 () Bool)

(assert (=> d!90155 (=> res!412227 e!364633)))

(assert (=> d!90155 (= res!412227 (is-Nil!12386 Nil!12386))))

