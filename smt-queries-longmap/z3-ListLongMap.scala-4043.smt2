; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55116 () Bool)

(assert start!55116)

(declare-fun b!603483 () Bool)

(declare-fun res!387682 () Bool)

(declare-fun e!345238 () Bool)

(assert (=> b!603483 (=> (not res!387682) (not e!345238))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37203 0))(
  ( (array!37204 (arr!17858 (Array (_ BitVec 32) (_ BitVec 64))) (size!18223 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37203)

(assert (=> b!603483 (= res!387682 (and (= (size!18223 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18223 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18223 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603484 () Bool)

(declare-fun e!345239 () Bool)

(declare-fun e!345246 () Bool)

(assert (=> b!603484 (= e!345239 e!345246)))

(declare-fun res!387668 () Bool)

(assert (=> b!603484 (=> (not res!387668) (not e!345246))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!603484 (= res!387668 (= (select (store (arr!17858 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!274973 () array!37203)

(assert (=> b!603484 (= lt!274973 (array!37204 (store (arr!17858 a!2986) i!1108 k0!1786) (size!18223 a!2986)))))

(declare-fun b!603485 () Bool)

(declare-fun e!345232 () Bool)

(assert (=> b!603485 (= e!345246 e!345232)))

(declare-fun res!387671 () Bool)

(assert (=> b!603485 (=> (not res!387671) (not e!345232))))

(declare-datatypes ((SeekEntryResult!6295 0))(
  ( (MissingZero!6295 (index!27443 (_ BitVec 32))) (Found!6295 (index!27444 (_ BitVec 32))) (Intermediate!6295 (undefined!7107 Bool) (index!27445 (_ BitVec 32)) (x!56251 (_ BitVec 32))) (Undefined!6295) (MissingVacant!6295 (index!27446 (_ BitVec 32))) )
))
(declare-fun lt!274972 () SeekEntryResult!6295)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!603485 (= res!387671 (and (= lt!274972 (Found!6295 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17858 a!2986) index!984) (select (arr!17858 a!2986) j!136))) (not (= (select (arr!17858 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37203 (_ BitVec 32)) SeekEntryResult!6295)

(assert (=> b!603485 (= lt!274972 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17858 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603486 () Bool)

(declare-fun res!387674 () Bool)

(assert (=> b!603486 (=> (not res!387674) (not e!345239))))

(declare-datatypes ((List!11938 0))(
  ( (Nil!11935) (Cons!11934 (h!12979 (_ BitVec 64)) (t!18157 List!11938)) )
))
(declare-fun arrayNoDuplicates!0 (array!37203 (_ BitVec 32) List!11938) Bool)

(assert (=> b!603486 (= res!387674 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11935))))

(declare-fun b!603487 () Bool)

(declare-fun e!345237 () Bool)

(assert (=> b!603487 (= e!345232 (not e!345237))))

(declare-fun res!387670 () Bool)

(assert (=> b!603487 (=> res!387670 e!345237)))

(declare-fun lt!274971 () SeekEntryResult!6295)

(assert (=> b!603487 (= res!387670 (not (= lt!274971 (Found!6295 index!984))))))

(declare-datatypes ((Unit!19152 0))(
  ( (Unit!19153) )
))
(declare-fun lt!274969 () Unit!19152)

(declare-fun e!345233 () Unit!19152)

(assert (=> b!603487 (= lt!274969 e!345233)))

(declare-fun c!68277 () Bool)

(assert (=> b!603487 (= c!68277 (= lt!274971 Undefined!6295))))

(declare-fun lt!274977 () (_ BitVec 64))

(assert (=> b!603487 (= lt!274971 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274977 lt!274973 mask!3053))))

(declare-fun e!345235 () Bool)

(assert (=> b!603487 e!345235))

(declare-fun res!387677 () Bool)

(assert (=> b!603487 (=> (not res!387677) (not e!345235))))

(declare-fun lt!274974 () SeekEntryResult!6295)

(declare-fun lt!274964 () (_ BitVec 32))

(assert (=> b!603487 (= res!387677 (= lt!274974 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274964 vacantSpotIndex!68 lt!274977 lt!274973 mask!3053)))))

(assert (=> b!603487 (= lt!274974 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274964 vacantSpotIndex!68 (select (arr!17858 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603487 (= lt!274977 (select (store (arr!17858 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!274965 () Unit!19152)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37203 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19152)

(assert (=> b!603487 (= lt!274965 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274964 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603487 (= lt!274964 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun res!387675 () Bool)

(assert (=> start!55116 (=> (not res!387675) (not e!345238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55116 (= res!387675 (validMask!0 mask!3053))))

(assert (=> start!55116 e!345238))

(assert (=> start!55116 true))

(declare-fun array_inv!13741 (array!37203) Bool)

(assert (=> start!55116 (array_inv!13741 a!2986)))

(declare-fun b!603488 () Bool)

(declare-fun res!387681 () Bool)

(assert (=> b!603488 (=> (not res!387681) (not e!345238))))

(declare-fun arrayContainsKey!0 (array!37203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603488 (= res!387681 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603489 () Bool)

(declare-fun e!345244 () Bool)

(declare-fun e!345241 () Bool)

(assert (=> b!603489 (= e!345244 e!345241)))

(declare-fun res!387680 () Bool)

(assert (=> b!603489 (=> res!387680 e!345241)))

(declare-fun lt!274970 () (_ BitVec 64))

(assert (=> b!603489 (= res!387680 (or (not (= (select (arr!17858 a!2986) j!136) lt!274977)) (not (= (select (arr!17858 a!2986) j!136) lt!274970)) (bvsge j!136 index!984)))))

(declare-fun b!603490 () Bool)

(declare-fun res!387676 () Bool)

(assert (=> b!603490 (=> (not res!387676) (not e!345238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603490 (= res!387676 (validKeyInArray!0 k0!1786))))

(declare-fun b!603491 () Bool)

(declare-fun e!345242 () Bool)

(assert (=> b!603491 (= e!345237 e!345242)))

(declare-fun res!387673 () Bool)

(assert (=> b!603491 (=> res!387673 e!345242)))

(assert (=> b!603491 (= res!387673 (or (not (= (select (arr!17858 a!2986) j!136) lt!274977)) (not (= (select (arr!17858 a!2986) j!136) lt!274970))))))

(assert (=> b!603491 e!345244))

(declare-fun res!387669 () Bool)

(assert (=> b!603491 (=> (not res!387669) (not e!345244))))

(assert (=> b!603491 (= res!387669 (= lt!274970 (select (arr!17858 a!2986) j!136)))))

(assert (=> b!603491 (= lt!274970 (select (store (arr!17858 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!603492 () Bool)

(declare-fun res!387679 () Bool)

(assert (=> b!603492 (=> (not res!387679) (not e!345239))))

(assert (=> b!603492 (= res!387679 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17858 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603493 () Bool)

(declare-fun res!387667 () Bool)

(assert (=> b!603493 (=> (not res!387667) (not e!345238))))

(assert (=> b!603493 (= res!387667 (validKeyInArray!0 (select (arr!17858 a!2986) j!136)))))

(declare-fun b!603494 () Bool)

(declare-fun Unit!19154 () Unit!19152)

(assert (=> b!603494 (= e!345233 Unit!19154)))

(assert (=> b!603494 false))

(declare-fun b!603495 () Bool)

(declare-fun e!345234 () Bool)

(assert (=> b!603495 (= e!345241 e!345234)))

(declare-fun res!387666 () Bool)

(assert (=> b!603495 (=> (not res!387666) (not e!345234))))

(assert (=> b!603495 (= res!387666 (arrayContainsKey!0 lt!274973 (select (arr!17858 a!2986) j!136) j!136))))

(declare-fun b!603496 () Bool)

(declare-fun Unit!19155 () Unit!19152)

(assert (=> b!603496 (= e!345233 Unit!19155)))

(declare-fun b!603497 () Bool)

(assert (=> b!603497 (= e!345235 (= lt!274972 lt!274974))))

(declare-fun b!603498 () Bool)

(declare-fun e!345240 () Bool)

(assert (=> b!603498 (= e!345242 e!345240)))

(declare-fun res!387678 () Bool)

(assert (=> b!603498 (=> res!387678 e!345240)))

(assert (=> b!603498 (= res!387678 (bvsge index!984 j!136))))

(declare-fun lt!274966 () Unit!19152)

(declare-fun e!345245 () Unit!19152)

(assert (=> b!603498 (= lt!274966 e!345245)))

(declare-fun c!68276 () Bool)

(assert (=> b!603498 (= c!68276 (bvslt j!136 index!984))))

(declare-fun b!603499 () Bool)

(assert (=> b!603499 (= e!345238 e!345239)))

(declare-fun res!387683 () Bool)

(assert (=> b!603499 (=> (not res!387683) (not e!345239))))

(declare-fun lt!274968 () SeekEntryResult!6295)

(assert (=> b!603499 (= res!387683 (or (= lt!274968 (MissingZero!6295 i!1108)) (= lt!274968 (MissingVacant!6295 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37203 (_ BitVec 32)) SeekEntryResult!6295)

(assert (=> b!603499 (= lt!274968 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!603500 () Bool)

(declare-fun res!387672 () Bool)

(assert (=> b!603500 (=> (not res!387672) (not e!345239))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37203 (_ BitVec 32)) Bool)

(assert (=> b!603500 (= res!387672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603501 () Bool)

(declare-fun e!345236 () Bool)

(assert (=> b!603501 (= e!345236 (arrayContainsKey!0 lt!274973 (select (arr!17858 a!2986) j!136) index!984))))

(declare-fun b!603502 () Bool)

(declare-fun Unit!19156 () Unit!19152)

(assert (=> b!603502 (= e!345245 Unit!19156)))

(declare-fun b!603503 () Bool)

(declare-fun Unit!19157 () Unit!19152)

(assert (=> b!603503 (= e!345245 Unit!19157)))

(declare-fun lt!274975 () Unit!19152)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37203 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19152)

(assert (=> b!603503 (= lt!274975 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274973 (select (arr!17858 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603503 (arrayContainsKey!0 lt!274973 (select (arr!17858 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274967 () Unit!19152)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37203 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11938) Unit!19152)

(assert (=> b!603503 (= lt!274967 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11935))))

(assert (=> b!603503 (arrayNoDuplicates!0 lt!274973 #b00000000000000000000000000000000 Nil!11935)))

(declare-fun lt!274976 () Unit!19152)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37203 (_ BitVec 32) (_ BitVec 32)) Unit!19152)

(assert (=> b!603503 (= lt!274976 (lemmaNoDuplicateFromThenFromBigger!0 lt!274973 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603503 (arrayNoDuplicates!0 lt!274973 j!136 Nil!11935)))

(declare-fun lt!274978 () Unit!19152)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37203 (_ BitVec 64) (_ BitVec 32) List!11938) Unit!19152)

(assert (=> b!603503 (= lt!274978 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274973 (select (arr!17858 a!2986) j!136) j!136 Nil!11935))))

(assert (=> b!603503 false))

(declare-fun b!603504 () Bool)

(assert (=> b!603504 (= e!345240 true)))

(assert (=> b!603504 e!345236))

(declare-fun res!387665 () Bool)

(assert (=> b!603504 (=> (not res!387665) (not e!345236))))

(assert (=> b!603504 (= res!387665 (arrayContainsKey!0 lt!274973 (select (arr!17858 a!2986) j!136) j!136))))

(declare-fun b!603505 () Bool)

(assert (=> b!603505 (= e!345234 (arrayContainsKey!0 lt!274973 (select (arr!17858 a!2986) j!136) index!984))))

(assert (= (and start!55116 res!387675) b!603483))

(assert (= (and b!603483 res!387682) b!603493))

(assert (= (and b!603493 res!387667) b!603490))

(assert (= (and b!603490 res!387676) b!603488))

(assert (= (and b!603488 res!387681) b!603499))

(assert (= (and b!603499 res!387683) b!603500))

(assert (= (and b!603500 res!387672) b!603486))

(assert (= (and b!603486 res!387674) b!603492))

(assert (= (and b!603492 res!387679) b!603484))

(assert (= (and b!603484 res!387668) b!603485))

(assert (= (and b!603485 res!387671) b!603487))

(assert (= (and b!603487 res!387677) b!603497))

(assert (= (and b!603487 c!68277) b!603494))

(assert (= (and b!603487 (not c!68277)) b!603496))

(assert (= (and b!603487 (not res!387670)) b!603491))

(assert (= (and b!603491 res!387669) b!603489))

(assert (= (and b!603489 (not res!387680)) b!603495))

(assert (= (and b!603495 res!387666) b!603505))

(assert (= (and b!603491 (not res!387673)) b!603498))

(assert (= (and b!603498 c!68276) b!603503))

(assert (= (and b!603498 (not c!68276)) b!603502))

(assert (= (and b!603498 (not res!387678)) b!603504))

(assert (= (and b!603504 res!387665) b!603501))

(declare-fun m!579961 () Bool)

(assert (=> b!603493 m!579961))

(assert (=> b!603493 m!579961))

(declare-fun m!579963 () Bool)

(assert (=> b!603493 m!579963))

(assert (=> b!603495 m!579961))

(assert (=> b!603495 m!579961))

(declare-fun m!579965 () Bool)

(assert (=> b!603495 m!579965))

(declare-fun m!579967 () Bool)

(assert (=> b!603500 m!579967))

(assert (=> b!603505 m!579961))

(assert (=> b!603505 m!579961))

(declare-fun m!579969 () Bool)

(assert (=> b!603505 m!579969))

(declare-fun m!579971 () Bool)

(assert (=> b!603488 m!579971))

(declare-fun m!579973 () Bool)

(assert (=> b!603492 m!579973))

(assert (=> b!603489 m!579961))

(declare-fun m!579975 () Bool)

(assert (=> b!603485 m!579975))

(assert (=> b!603485 m!579961))

(assert (=> b!603485 m!579961))

(declare-fun m!579977 () Bool)

(assert (=> b!603485 m!579977))

(assert (=> b!603501 m!579961))

(assert (=> b!603501 m!579961))

(assert (=> b!603501 m!579969))

(declare-fun m!579979 () Bool)

(assert (=> b!603484 m!579979))

(declare-fun m!579981 () Bool)

(assert (=> b!603484 m!579981))

(assert (=> b!603504 m!579961))

(assert (=> b!603504 m!579961))

(assert (=> b!603504 m!579965))

(declare-fun m!579983 () Bool)

(assert (=> b!603503 m!579983))

(assert (=> b!603503 m!579961))

(assert (=> b!603503 m!579961))

(declare-fun m!579985 () Bool)

(assert (=> b!603503 m!579985))

(declare-fun m!579987 () Bool)

(assert (=> b!603503 m!579987))

(declare-fun m!579989 () Bool)

(assert (=> b!603503 m!579989))

(assert (=> b!603503 m!579961))

(declare-fun m!579991 () Bool)

(assert (=> b!603503 m!579991))

(assert (=> b!603503 m!579961))

(declare-fun m!579993 () Bool)

(assert (=> b!603503 m!579993))

(declare-fun m!579995 () Bool)

(assert (=> b!603503 m!579995))

(declare-fun m!579997 () Bool)

(assert (=> b!603486 m!579997))

(declare-fun m!579999 () Bool)

(assert (=> b!603490 m!579999))

(declare-fun m!580001 () Bool)

(assert (=> b!603499 m!580001))

(assert (=> b!603491 m!579961))

(assert (=> b!603491 m!579979))

(declare-fun m!580003 () Bool)

(assert (=> b!603491 m!580003))

(declare-fun m!580005 () Bool)

(assert (=> start!55116 m!580005))

(declare-fun m!580007 () Bool)

(assert (=> start!55116 m!580007))

(declare-fun m!580009 () Bool)

(assert (=> b!603487 m!580009))

(declare-fun m!580011 () Bool)

(assert (=> b!603487 m!580011))

(assert (=> b!603487 m!579961))

(declare-fun m!580013 () Bool)

(assert (=> b!603487 m!580013))

(declare-fun m!580015 () Bool)

(assert (=> b!603487 m!580015))

(assert (=> b!603487 m!579961))

(declare-fun m!580017 () Bool)

(assert (=> b!603487 m!580017))

(declare-fun m!580019 () Bool)

(assert (=> b!603487 m!580019))

(assert (=> b!603487 m!579979))

(check-sat (not b!603490) (not b!603488) (not b!603504) (not b!603499) (not b!603501) (not b!603486) (not b!603495) (not start!55116) (not b!603503) (not b!603487) (not b!603493) (not b!603500) (not b!603505) (not b!603485))
(check-sat)
