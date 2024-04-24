; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55848 () Bool)

(assert start!55848)

(declare-fun b!611247 () Bool)

(declare-fun e!350225 () Bool)

(declare-fun e!350235 () Bool)

(assert (=> b!611247 (= e!350225 e!350235)))

(declare-fun res!393100 () Bool)

(assert (=> b!611247 (=> res!393100 e!350235)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!279630 () (_ BitVec 64))

(declare-fun lt!279627 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37356 0))(
  ( (array!37357 (arr!17923 (Array (_ BitVec 32) (_ BitVec 64))) (size!18287 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37356)

(assert (=> b!611247 (= res!393100 (or (not (= (select (arr!17923 a!2986) j!136) lt!279630)) (not (= (select (arr!17923 a!2986) j!136) lt!279627)) (bvsge j!136 index!984)))))

(declare-fun b!611248 () Bool)

(declare-fun e!350240 () Bool)

(declare-fun e!350230 () Bool)

(assert (=> b!611248 (= e!350240 e!350230)))

(declare-fun res!393099 () Bool)

(assert (=> b!611248 (=> (not res!393099) (not e!350230))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!611248 (= res!393099 (= (select (store (arr!17923 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!279633 () array!37356)

(assert (=> b!611248 (= lt!279633 (array!37357 (store (arr!17923 a!2986) i!1108 k0!1786) (size!18287 a!2986)))))

(declare-fun b!611249 () Bool)

(declare-fun e!350226 () Bool)

(assert (=> b!611249 (= e!350235 e!350226)))

(declare-fun res!393109 () Bool)

(assert (=> b!611249 (=> (not res!393109) (not e!350226))))

(declare-fun arrayContainsKey!0 (array!37356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611249 (= res!393109 (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) j!136))))

(declare-fun res!393105 () Bool)

(declare-fun e!350238 () Bool)

(assert (=> start!55848 (=> (not res!393105) (not e!350238))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55848 (= res!393105 (validMask!0 mask!3053))))

(assert (=> start!55848 e!350238))

(assert (=> start!55848 true))

(declare-fun array_inv!13782 (array!37356) Bool)

(assert (=> start!55848 (array_inv!13782 a!2986)))

(declare-fun b!611250 () Bool)

(declare-fun e!350236 () Bool)

(declare-datatypes ((SeekEntryResult!6319 0))(
  ( (MissingZero!6319 (index!27557 (_ BitVec 32))) (Found!6319 (index!27558 (_ BitVec 32))) (Intermediate!6319 (undefined!7131 Bool) (index!27559 (_ BitVec 32)) (x!56521 (_ BitVec 32))) (Undefined!6319) (MissingVacant!6319 (index!27560 (_ BitVec 32))) )
))
(declare-fun lt!279619 () SeekEntryResult!6319)

(declare-fun lt!279629 () SeekEntryResult!6319)

(assert (=> b!611250 (= e!350236 (= lt!279619 lt!279629))))

(declare-fun b!611251 () Bool)

(declare-fun res!393113 () Bool)

(assert (=> b!611251 (=> (not res!393113) (not e!350240))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!611251 (= res!393113 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17923 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611252 () Bool)

(declare-fun res!393095 () Bool)

(assert (=> b!611252 (=> (not res!393095) (not e!350238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611252 (= res!393095 (validKeyInArray!0 (select (arr!17923 a!2986) j!136)))))

(declare-fun b!611253 () Bool)

(declare-fun e!350239 () Bool)

(declare-datatypes ((List!11871 0))(
  ( (Nil!11868) (Cons!11867 (h!12915 (_ BitVec 64)) (t!18091 List!11871)) )
))
(declare-fun contains!3018 (List!11871 (_ BitVec 64)) Bool)

(assert (=> b!611253 (= e!350239 (not (contains!3018 Nil!11868 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611254 () Bool)

(declare-fun res!393107 () Bool)

(assert (=> b!611254 (=> (not res!393107) (not e!350238))))

(assert (=> b!611254 (= res!393107 (validKeyInArray!0 k0!1786))))

(declare-fun b!611255 () Bool)

(declare-fun e!350241 () Bool)

(declare-fun e!350228 () Bool)

(assert (=> b!611255 (= e!350241 e!350228)))

(declare-fun res!393110 () Bool)

(assert (=> b!611255 (=> res!393110 e!350228)))

(assert (=> b!611255 (= res!393110 (or (not (= (select (arr!17923 a!2986) j!136) lt!279630)) (not (= (select (arr!17923 a!2986) j!136) lt!279627))))))

(assert (=> b!611255 e!350225))

(declare-fun res!393097 () Bool)

(assert (=> b!611255 (=> (not res!393097) (not e!350225))))

(assert (=> b!611255 (= res!393097 (= lt!279627 (select (arr!17923 a!2986) j!136)))))

(assert (=> b!611255 (= lt!279627 (select (store (arr!17923 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!611256 () Bool)

(declare-fun e!350229 () Bool)

(assert (=> b!611256 (= e!350229 (not e!350241))))

(declare-fun res!393112 () Bool)

(assert (=> b!611256 (=> res!393112 e!350241)))

(declare-fun lt!279623 () SeekEntryResult!6319)

(assert (=> b!611256 (= res!393112 (not (= lt!279623 (Found!6319 index!984))))))

(declare-datatypes ((Unit!19567 0))(
  ( (Unit!19568) )
))
(declare-fun lt!279622 () Unit!19567)

(declare-fun e!350237 () Unit!19567)

(assert (=> b!611256 (= lt!279622 e!350237)))

(declare-fun c!69446 () Bool)

(assert (=> b!611256 (= c!69446 (= lt!279623 Undefined!6319))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37356 (_ BitVec 32)) SeekEntryResult!6319)

(assert (=> b!611256 (= lt!279623 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279630 lt!279633 mask!3053))))

(assert (=> b!611256 e!350236))

(declare-fun res!393094 () Bool)

(assert (=> b!611256 (=> (not res!393094) (not e!350236))))

(declare-fun lt!279634 () (_ BitVec 32))

(assert (=> b!611256 (= res!393094 (= lt!279629 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279634 vacantSpotIndex!68 lt!279630 lt!279633 mask!3053)))))

(assert (=> b!611256 (= lt!279629 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279634 vacantSpotIndex!68 (select (arr!17923 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!611256 (= lt!279630 (select (store (arr!17923 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!279620 () Unit!19567)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37356 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19567)

(assert (=> b!611256 (= lt!279620 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279634 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!611256 (= lt!279634 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!611257 () Bool)

(declare-fun e!350233 () Bool)

(assert (=> b!611257 (= e!350233 e!350239)))

(declare-fun res!393115 () Bool)

(assert (=> b!611257 (=> (not res!393115) (not e!350239))))

(assert (=> b!611257 (= res!393115 (not (contains!3018 Nil!11868 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611258 () Bool)

(declare-fun res!393108 () Bool)

(assert (=> b!611258 (=> (not res!393108) (not e!350240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37356 (_ BitVec 32)) Bool)

(assert (=> b!611258 (= res!393108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!611259 () Bool)

(declare-fun res!393102 () Bool)

(assert (=> b!611259 (=> res!393102 e!350233)))

(declare-fun noDuplicate!349 (List!11871) Bool)

(assert (=> b!611259 (= res!393102 (not (noDuplicate!349 Nil!11868)))))

(declare-fun b!611260 () Bool)

(declare-fun res!393096 () Bool)

(assert (=> b!611260 (=> (not res!393096) (not e!350238))))

(assert (=> b!611260 (= res!393096 (and (= (size!18287 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18287 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18287 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!611261 () Bool)

(assert (=> b!611261 (= e!350238 e!350240)))

(declare-fun res!393106 () Bool)

(assert (=> b!611261 (=> (not res!393106) (not e!350240))))

(declare-fun lt!279625 () SeekEntryResult!6319)

(assert (=> b!611261 (= res!393106 (or (= lt!279625 (MissingZero!6319 i!1108)) (= lt!279625 (MissingVacant!6319 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37356 (_ BitVec 32)) SeekEntryResult!6319)

(assert (=> b!611261 (= lt!279625 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!611262 () Bool)

(declare-fun e!350234 () Unit!19567)

(declare-fun Unit!19569 () Unit!19567)

(assert (=> b!611262 (= e!350234 Unit!19569)))

(declare-fun lt!279624 () Unit!19567)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37356 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19567)

(assert (=> b!611262 (= lt!279624 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279633 (select (arr!17923 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!611262 (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279632 () Unit!19567)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37356 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11871) Unit!19567)

(assert (=> b!611262 (= lt!279632 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11868))))

(declare-fun arrayNoDuplicates!0 (array!37356 (_ BitVec 32) List!11871) Bool)

(assert (=> b!611262 (arrayNoDuplicates!0 lt!279633 #b00000000000000000000000000000000 Nil!11868)))

(declare-fun lt!279618 () Unit!19567)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37356 (_ BitVec 32) (_ BitVec 32)) Unit!19567)

(assert (=> b!611262 (= lt!279618 (lemmaNoDuplicateFromThenFromBigger!0 lt!279633 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611262 (arrayNoDuplicates!0 lt!279633 j!136 Nil!11868)))

(declare-fun lt!279631 () Unit!19567)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37356 (_ BitVec 64) (_ BitVec 32) List!11871) Unit!19567)

(assert (=> b!611262 (= lt!279631 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279633 (select (arr!17923 a!2986) j!136) j!136 Nil!11868))))

(assert (=> b!611262 false))

(declare-fun b!611263 () Bool)

(assert (=> b!611263 (= e!350226 (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) index!984))))

(declare-fun b!611264 () Bool)

(declare-fun e!350231 () Bool)

(assert (=> b!611264 (= e!350231 e!350233)))

(declare-fun res!393114 () Bool)

(assert (=> b!611264 (=> res!393114 e!350233)))

(assert (=> b!611264 (= res!393114 (or (bvsgt #b00000000000000000000000000000000 (size!18287 a!2986)) (bvsge (size!18287 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!611264 (arrayNoDuplicates!0 lt!279633 #b00000000000000000000000000000000 Nil!11868)))

(declare-fun lt!279621 () Unit!19567)

(assert (=> b!611264 (= lt!279621 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11868))))

(assert (=> b!611264 (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279626 () Unit!19567)

(assert (=> b!611264 (= lt!279626 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279633 (select (arr!17923 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!350232 () Bool)

(assert (=> b!611264 e!350232))

(declare-fun res!393111 () Bool)

(assert (=> b!611264 (=> (not res!393111) (not e!350232))))

(assert (=> b!611264 (= res!393111 (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) j!136))))

(declare-fun b!611265 () Bool)

(declare-fun Unit!19570 () Unit!19567)

(assert (=> b!611265 (= e!350237 Unit!19570)))

(declare-fun b!611266 () Bool)

(declare-fun Unit!19571 () Unit!19567)

(assert (=> b!611266 (= e!350234 Unit!19571)))

(declare-fun b!611267 () Bool)

(assert (=> b!611267 (= e!350232 (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) index!984))))

(declare-fun b!611268 () Bool)

(declare-fun Unit!19572 () Unit!19567)

(assert (=> b!611268 (= e!350237 Unit!19572)))

(assert (=> b!611268 false))

(declare-fun b!611269 () Bool)

(assert (=> b!611269 (= e!350228 e!350231)))

(declare-fun res!393104 () Bool)

(assert (=> b!611269 (=> res!393104 e!350231)))

(assert (=> b!611269 (= res!393104 (bvsge index!984 j!136))))

(declare-fun lt!279628 () Unit!19567)

(assert (=> b!611269 (= lt!279628 e!350234)))

(declare-fun c!69445 () Bool)

(assert (=> b!611269 (= c!69445 (bvslt j!136 index!984))))

(declare-fun b!611270 () Bool)

(assert (=> b!611270 (= e!350230 e!350229)))

(declare-fun res!393101 () Bool)

(assert (=> b!611270 (=> (not res!393101) (not e!350229))))

(assert (=> b!611270 (= res!393101 (and (= lt!279619 (Found!6319 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17923 a!2986) index!984) (select (arr!17923 a!2986) j!136))) (not (= (select (arr!17923 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!611270 (= lt!279619 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17923 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611271 () Bool)

(declare-fun res!393098 () Bool)

(assert (=> b!611271 (=> (not res!393098) (not e!350238))))

(assert (=> b!611271 (= res!393098 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!611272 () Bool)

(declare-fun res!393103 () Bool)

(assert (=> b!611272 (=> (not res!393103) (not e!350240))))

(assert (=> b!611272 (= res!393103 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11868))))

(assert (= (and start!55848 res!393105) b!611260))

(assert (= (and b!611260 res!393096) b!611252))

(assert (= (and b!611252 res!393095) b!611254))

(assert (= (and b!611254 res!393107) b!611271))

(assert (= (and b!611271 res!393098) b!611261))

(assert (= (and b!611261 res!393106) b!611258))

(assert (= (and b!611258 res!393108) b!611272))

(assert (= (and b!611272 res!393103) b!611251))

(assert (= (and b!611251 res!393113) b!611248))

(assert (= (and b!611248 res!393099) b!611270))

(assert (= (and b!611270 res!393101) b!611256))

(assert (= (and b!611256 res!393094) b!611250))

(assert (= (and b!611256 c!69446) b!611268))

(assert (= (and b!611256 (not c!69446)) b!611265))

(assert (= (and b!611256 (not res!393112)) b!611255))

(assert (= (and b!611255 res!393097) b!611247))

(assert (= (and b!611247 (not res!393100)) b!611249))

(assert (= (and b!611249 res!393109) b!611263))

(assert (= (and b!611255 (not res!393110)) b!611269))

(assert (= (and b!611269 c!69445) b!611262))

(assert (= (and b!611269 (not c!69445)) b!611266))

(assert (= (and b!611269 (not res!393104)) b!611264))

(assert (= (and b!611264 res!393111) b!611267))

(assert (= (and b!611264 (not res!393114)) b!611259))

(assert (= (and b!611259 (not res!393102)) b!611257))

(assert (= (and b!611257 res!393115) b!611253))

(declare-fun m!587945 () Bool)

(assert (=> b!611271 m!587945))

(declare-fun m!587947 () Bool)

(assert (=> b!611272 m!587947))

(declare-fun m!587949 () Bool)

(assert (=> b!611261 m!587949))

(declare-fun m!587951 () Bool)

(assert (=> b!611259 m!587951))

(declare-fun m!587953 () Bool)

(assert (=> b!611267 m!587953))

(assert (=> b!611267 m!587953))

(declare-fun m!587955 () Bool)

(assert (=> b!611267 m!587955))

(declare-fun m!587957 () Bool)

(assert (=> b!611248 m!587957))

(declare-fun m!587959 () Bool)

(assert (=> b!611248 m!587959))

(assert (=> b!611247 m!587953))

(assert (=> b!611262 m!587953))

(declare-fun m!587961 () Bool)

(assert (=> b!611262 m!587961))

(assert (=> b!611262 m!587953))

(declare-fun m!587963 () Bool)

(assert (=> b!611262 m!587963))

(assert (=> b!611262 m!587953))

(declare-fun m!587965 () Bool)

(assert (=> b!611262 m!587965))

(declare-fun m!587967 () Bool)

(assert (=> b!611262 m!587967))

(assert (=> b!611262 m!587953))

(declare-fun m!587969 () Bool)

(assert (=> b!611262 m!587969))

(declare-fun m!587971 () Bool)

(assert (=> b!611262 m!587971))

(declare-fun m!587973 () Bool)

(assert (=> b!611262 m!587973))

(assert (=> b!611264 m!587953))

(declare-fun m!587975 () Bool)

(assert (=> b!611264 m!587975))

(assert (=> b!611264 m!587967))

(assert (=> b!611264 m!587953))

(declare-fun m!587977 () Bool)

(assert (=> b!611264 m!587977))

(assert (=> b!611264 m!587971))

(assert (=> b!611264 m!587953))

(assert (=> b!611264 m!587953))

(declare-fun m!587979 () Bool)

(assert (=> b!611264 m!587979))

(declare-fun m!587981 () Bool)

(assert (=> b!611253 m!587981))

(declare-fun m!587983 () Bool)

(assert (=> b!611254 m!587983))

(assert (=> b!611263 m!587953))

(assert (=> b!611263 m!587953))

(assert (=> b!611263 m!587955))

(assert (=> b!611255 m!587953))

(assert (=> b!611255 m!587957))

(declare-fun m!587985 () Bool)

(assert (=> b!611255 m!587985))

(declare-fun m!587987 () Bool)

(assert (=> b!611251 m!587987))

(declare-fun m!587989 () Bool)

(assert (=> b!611270 m!587989))

(assert (=> b!611270 m!587953))

(assert (=> b!611270 m!587953))

(declare-fun m!587991 () Bool)

(assert (=> b!611270 m!587991))

(assert (=> b!611252 m!587953))

(assert (=> b!611252 m!587953))

(declare-fun m!587993 () Bool)

(assert (=> b!611252 m!587993))

(assert (=> b!611249 m!587953))

(assert (=> b!611249 m!587953))

(assert (=> b!611249 m!587977))

(declare-fun m!587995 () Bool)

(assert (=> b!611257 m!587995))

(declare-fun m!587997 () Bool)

(assert (=> start!55848 m!587997))

(declare-fun m!587999 () Bool)

(assert (=> start!55848 m!587999))

(declare-fun m!588001 () Bool)

(assert (=> b!611258 m!588001))

(declare-fun m!588003 () Bool)

(assert (=> b!611256 m!588003))

(declare-fun m!588005 () Bool)

(assert (=> b!611256 m!588005))

(assert (=> b!611256 m!587953))

(assert (=> b!611256 m!587953))

(declare-fun m!588007 () Bool)

(assert (=> b!611256 m!588007))

(assert (=> b!611256 m!587957))

(declare-fun m!588009 () Bool)

(assert (=> b!611256 m!588009))

(declare-fun m!588011 () Bool)

(assert (=> b!611256 m!588011))

(declare-fun m!588013 () Bool)

(assert (=> b!611256 m!588013))

(check-sat (not b!611267) (not start!55848) (not b!611249) (not b!611259) (not b!611257) (not b!611264) (not b!611252) (not b!611270) (not b!611261) (not b!611272) (not b!611253) (not b!611258) (not b!611262) (not b!611271) (not b!611263) (not b!611254) (not b!611256))
(check-sat)
(get-model)

(declare-fun d!88517 () Bool)

(declare-fun res!393252 () Bool)

(declare-fun e!350348 () Bool)

(assert (=> d!88517 (=> res!393252 e!350348)))

(assert (=> d!88517 (= res!393252 (= (select (arr!17923 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88517 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!350348)))

(declare-fun b!611433 () Bool)

(declare-fun e!350349 () Bool)

(assert (=> b!611433 (= e!350348 e!350349)))

(declare-fun res!393253 () Bool)

(assert (=> b!611433 (=> (not res!393253) (not e!350349))))

(assert (=> b!611433 (= res!393253 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18287 a!2986)))))

(declare-fun b!611434 () Bool)

(assert (=> b!611434 (= e!350349 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88517 (not res!393252)) b!611433))

(assert (= (and b!611433 res!393253) b!611434))

(declare-fun m!588155 () Bool)

(assert (=> d!88517 m!588155))

(declare-fun m!588157 () Bool)

(assert (=> b!611434 m!588157))

(assert (=> b!611271 d!88517))

(declare-fun d!88519 () Bool)

(declare-fun res!393254 () Bool)

(declare-fun e!350350 () Bool)

(assert (=> d!88519 (=> res!393254 e!350350)))

(assert (=> d!88519 (= res!393254 (= (select (arr!17923 lt!279633) j!136) (select (arr!17923 a!2986) j!136)))))

(assert (=> d!88519 (= (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) j!136) e!350350)))

(declare-fun b!611435 () Bool)

(declare-fun e!350351 () Bool)

(assert (=> b!611435 (= e!350350 e!350351)))

(declare-fun res!393255 () Bool)

(assert (=> b!611435 (=> (not res!393255) (not e!350351))))

(assert (=> b!611435 (= res!393255 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18287 lt!279633)))))

(declare-fun b!611436 () Bool)

(assert (=> b!611436 (= e!350351 (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88519 (not res!393254)) b!611435))

(assert (= (and b!611435 res!393255) b!611436))

(declare-fun m!588159 () Bool)

(assert (=> d!88519 m!588159))

(assert (=> b!611436 m!587953))

(declare-fun m!588161 () Bool)

(assert (=> b!611436 m!588161))

(assert (=> b!611249 d!88519))

(declare-fun b!611449 () Bool)

(declare-fun e!350360 () SeekEntryResult!6319)

(assert (=> b!611449 (= e!350360 (Found!6319 index!984))))

(declare-fun b!611450 () Bool)

(declare-fun e!350359 () SeekEntryResult!6319)

(assert (=> b!611450 (= e!350359 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17923 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611451 () Bool)

(assert (=> b!611451 (= e!350359 (MissingVacant!6319 vacantSpotIndex!68))))

(declare-fun d!88521 () Bool)

(declare-fun lt!279742 () SeekEntryResult!6319)

(get-info :version)

(assert (=> d!88521 (and (or ((_ is Undefined!6319) lt!279742) (not ((_ is Found!6319) lt!279742)) (and (bvsge (index!27558 lt!279742) #b00000000000000000000000000000000) (bvslt (index!27558 lt!279742) (size!18287 a!2986)))) (or ((_ is Undefined!6319) lt!279742) ((_ is Found!6319) lt!279742) (not ((_ is MissingVacant!6319) lt!279742)) (not (= (index!27560 lt!279742) vacantSpotIndex!68)) (and (bvsge (index!27560 lt!279742) #b00000000000000000000000000000000) (bvslt (index!27560 lt!279742) (size!18287 a!2986)))) (or ((_ is Undefined!6319) lt!279742) (ite ((_ is Found!6319) lt!279742) (= (select (arr!17923 a!2986) (index!27558 lt!279742)) (select (arr!17923 a!2986) j!136)) (and ((_ is MissingVacant!6319) lt!279742) (= (index!27560 lt!279742) vacantSpotIndex!68) (= (select (arr!17923 a!2986) (index!27560 lt!279742)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350358 () SeekEntryResult!6319)

(assert (=> d!88521 (= lt!279742 e!350358)))

(declare-fun c!69466 () Bool)

(assert (=> d!88521 (= c!69466 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!279741 () (_ BitVec 64))

(assert (=> d!88521 (= lt!279741 (select (arr!17923 a!2986) index!984))))

(assert (=> d!88521 (validMask!0 mask!3053)))

(assert (=> d!88521 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17923 a!2986) j!136) a!2986 mask!3053) lt!279742)))

(declare-fun b!611452 () Bool)

(assert (=> b!611452 (= e!350358 e!350360)))

(declare-fun c!69467 () Bool)

(assert (=> b!611452 (= c!69467 (= lt!279741 (select (arr!17923 a!2986) j!136)))))

(declare-fun b!611453 () Bool)

(assert (=> b!611453 (= e!350358 Undefined!6319)))

(declare-fun b!611454 () Bool)

(declare-fun c!69465 () Bool)

(assert (=> b!611454 (= c!69465 (= lt!279741 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611454 (= e!350360 e!350359)))

(assert (= (and d!88521 c!69466) b!611453))

(assert (= (and d!88521 (not c!69466)) b!611452))

(assert (= (and b!611452 c!69467) b!611449))

(assert (= (and b!611452 (not c!69467)) b!611454))

(assert (= (and b!611454 c!69465) b!611451))

(assert (= (and b!611454 (not c!69465)) b!611450))

(declare-fun m!588163 () Bool)

(assert (=> b!611450 m!588163))

(assert (=> b!611450 m!588163))

(assert (=> b!611450 m!587953))

(declare-fun m!588165 () Bool)

(assert (=> b!611450 m!588165))

(declare-fun m!588167 () Bool)

(assert (=> d!88521 m!588167))

(declare-fun m!588169 () Bool)

(assert (=> d!88521 m!588169))

(assert (=> d!88521 m!587989))

(assert (=> d!88521 m!587997))

(assert (=> b!611270 d!88521))

(declare-fun bm!33162 () Bool)

(declare-fun call!33165 () Bool)

(declare-fun c!69470 () Bool)

(assert (=> bm!33162 (= call!33165 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69470 (Cons!11867 (select (arr!17923 a!2986) #b00000000000000000000000000000000) Nil!11868) Nil!11868)))))

(declare-fun b!611465 () Bool)

(declare-fun e!350370 () Bool)

(declare-fun e!350372 () Bool)

(assert (=> b!611465 (= e!350370 e!350372)))

(assert (=> b!611465 (= c!69470 (validKeyInArray!0 (select (arr!17923 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!611466 () Bool)

(declare-fun e!350371 () Bool)

(assert (=> b!611466 (= e!350371 (contains!3018 Nil!11868 (select (arr!17923 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88523 () Bool)

(declare-fun res!393262 () Bool)

(declare-fun e!350369 () Bool)

(assert (=> d!88523 (=> res!393262 e!350369)))

(assert (=> d!88523 (= res!393262 (bvsge #b00000000000000000000000000000000 (size!18287 a!2986)))))

(assert (=> d!88523 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11868) e!350369)))

(declare-fun b!611467 () Bool)

(assert (=> b!611467 (= e!350372 call!33165)))

(declare-fun b!611468 () Bool)

(assert (=> b!611468 (= e!350369 e!350370)))

(declare-fun res!393263 () Bool)

(assert (=> b!611468 (=> (not res!393263) (not e!350370))))

(assert (=> b!611468 (= res!393263 (not e!350371))))

(declare-fun res!393264 () Bool)

(assert (=> b!611468 (=> (not res!393264) (not e!350371))))

(assert (=> b!611468 (= res!393264 (validKeyInArray!0 (select (arr!17923 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!611469 () Bool)

(assert (=> b!611469 (= e!350372 call!33165)))

(assert (= (and d!88523 (not res!393262)) b!611468))

(assert (= (and b!611468 res!393264) b!611466))

(assert (= (and b!611468 res!393263) b!611465))

(assert (= (and b!611465 c!69470) b!611469))

(assert (= (and b!611465 (not c!69470)) b!611467))

(assert (= (or b!611469 b!611467) bm!33162))

(assert (=> bm!33162 m!588155))

(declare-fun m!588171 () Bool)

(assert (=> bm!33162 m!588171))

(assert (=> b!611465 m!588155))

(assert (=> b!611465 m!588155))

(declare-fun m!588173 () Bool)

(assert (=> b!611465 m!588173))

(assert (=> b!611466 m!588155))

(assert (=> b!611466 m!588155))

(declare-fun m!588175 () Bool)

(assert (=> b!611466 m!588175))

(assert (=> b!611468 m!588155))

(assert (=> b!611468 m!588155))

(assert (=> b!611468 m!588173))

(assert (=> b!611272 d!88523))

(declare-fun b!611482 () Bool)

(declare-fun e!350379 () SeekEntryResult!6319)

(declare-fun lt!279751 () SeekEntryResult!6319)

(assert (=> b!611482 (= e!350379 (Found!6319 (index!27559 lt!279751)))))

(declare-fun b!611483 () Bool)

(declare-fun e!350381 () SeekEntryResult!6319)

(assert (=> b!611483 (= e!350381 e!350379)))

(declare-fun lt!279750 () (_ BitVec 64))

(assert (=> b!611483 (= lt!279750 (select (arr!17923 a!2986) (index!27559 lt!279751)))))

(declare-fun c!69479 () Bool)

(assert (=> b!611483 (= c!69479 (= lt!279750 k0!1786))))

(declare-fun e!350380 () SeekEntryResult!6319)

(declare-fun b!611484 () Bool)

(assert (=> b!611484 (= e!350380 (seekKeyOrZeroReturnVacant!0 (x!56521 lt!279751) (index!27559 lt!279751) (index!27559 lt!279751) k0!1786 a!2986 mask!3053))))

(declare-fun b!611485 () Bool)

(declare-fun c!69477 () Bool)

(assert (=> b!611485 (= c!69477 (= lt!279750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611485 (= e!350379 e!350380)))

(declare-fun d!88525 () Bool)

(declare-fun lt!279749 () SeekEntryResult!6319)

(assert (=> d!88525 (and (or ((_ is Undefined!6319) lt!279749) (not ((_ is Found!6319) lt!279749)) (and (bvsge (index!27558 lt!279749) #b00000000000000000000000000000000) (bvslt (index!27558 lt!279749) (size!18287 a!2986)))) (or ((_ is Undefined!6319) lt!279749) ((_ is Found!6319) lt!279749) (not ((_ is MissingZero!6319) lt!279749)) (and (bvsge (index!27557 lt!279749) #b00000000000000000000000000000000) (bvslt (index!27557 lt!279749) (size!18287 a!2986)))) (or ((_ is Undefined!6319) lt!279749) ((_ is Found!6319) lt!279749) ((_ is MissingZero!6319) lt!279749) (not ((_ is MissingVacant!6319) lt!279749)) (and (bvsge (index!27560 lt!279749) #b00000000000000000000000000000000) (bvslt (index!27560 lt!279749) (size!18287 a!2986)))) (or ((_ is Undefined!6319) lt!279749) (ite ((_ is Found!6319) lt!279749) (= (select (arr!17923 a!2986) (index!27558 lt!279749)) k0!1786) (ite ((_ is MissingZero!6319) lt!279749) (= (select (arr!17923 a!2986) (index!27557 lt!279749)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6319) lt!279749) (= (select (arr!17923 a!2986) (index!27560 lt!279749)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88525 (= lt!279749 e!350381)))

(declare-fun c!69478 () Bool)

(assert (=> d!88525 (= c!69478 (and ((_ is Intermediate!6319) lt!279751) (undefined!7131 lt!279751)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37356 (_ BitVec 32)) SeekEntryResult!6319)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88525 (= lt!279751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88525 (validMask!0 mask!3053)))

(assert (=> d!88525 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!279749)))

(declare-fun b!611486 () Bool)

(assert (=> b!611486 (= e!350381 Undefined!6319)))

(declare-fun b!611487 () Bool)

(assert (=> b!611487 (= e!350380 (MissingZero!6319 (index!27559 lt!279751)))))

(assert (= (and d!88525 c!69478) b!611486))

(assert (= (and d!88525 (not c!69478)) b!611483))

(assert (= (and b!611483 c!69479) b!611482))

(assert (= (and b!611483 (not c!69479)) b!611485))

(assert (= (and b!611485 c!69477) b!611487))

(assert (= (and b!611485 (not c!69477)) b!611484))

(declare-fun m!588177 () Bool)

(assert (=> b!611483 m!588177))

(declare-fun m!588179 () Bool)

(assert (=> b!611484 m!588179))

(declare-fun m!588181 () Bool)

(assert (=> d!88525 m!588181))

(declare-fun m!588183 () Bool)

(assert (=> d!88525 m!588183))

(assert (=> d!88525 m!587997))

(declare-fun m!588185 () Bool)

(assert (=> d!88525 m!588185))

(declare-fun m!588187 () Bool)

(assert (=> d!88525 m!588187))

(declare-fun m!588189 () Bool)

(assert (=> d!88525 m!588189))

(assert (=> d!88525 m!588181))

(assert (=> b!611261 d!88525))

(declare-fun d!88527 () Bool)

(declare-fun lt!279754 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!240 (List!11871) (InoxSet (_ BitVec 64)))

(assert (=> d!88527 (= lt!279754 (select (content!240 Nil!11868) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!350386 () Bool)

(assert (=> d!88527 (= lt!279754 e!350386)))

(declare-fun res!393269 () Bool)

(assert (=> d!88527 (=> (not res!393269) (not e!350386))))

(assert (=> d!88527 (= res!393269 ((_ is Cons!11867) Nil!11868))))

(assert (=> d!88527 (= (contains!3018 Nil!11868 #b0000000000000000000000000000000000000000000000000000000000000000) lt!279754)))

(declare-fun b!611492 () Bool)

(declare-fun e!350387 () Bool)

(assert (=> b!611492 (= e!350386 e!350387)))

(declare-fun res!393270 () Bool)

(assert (=> b!611492 (=> res!393270 e!350387)))

(assert (=> b!611492 (= res!393270 (= (h!12915 Nil!11868) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!611493 () Bool)

(assert (=> b!611493 (= e!350387 (contains!3018 (t!18091 Nil!11868) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!88527 res!393269) b!611492))

(assert (= (and b!611492 (not res!393270)) b!611493))

(declare-fun m!588191 () Bool)

(assert (=> d!88527 m!588191))

(declare-fun m!588193 () Bool)

(assert (=> d!88527 m!588193))

(declare-fun m!588195 () Bool)

(assert (=> b!611493 m!588195))

(assert (=> b!611257 d!88527))

(declare-fun d!88529 () Bool)

(declare-fun res!393275 () Bool)

(declare-fun e!350392 () Bool)

(assert (=> d!88529 (=> res!393275 e!350392)))

(assert (=> d!88529 (= res!393275 ((_ is Nil!11868) Nil!11868))))

(assert (=> d!88529 (= (noDuplicate!349 Nil!11868) e!350392)))

(declare-fun b!611498 () Bool)

(declare-fun e!350393 () Bool)

(assert (=> b!611498 (= e!350392 e!350393)))

(declare-fun res!393276 () Bool)

(assert (=> b!611498 (=> (not res!393276) (not e!350393))))

(assert (=> b!611498 (= res!393276 (not (contains!3018 (t!18091 Nil!11868) (h!12915 Nil!11868))))))

(declare-fun b!611499 () Bool)

(assert (=> b!611499 (= e!350393 (noDuplicate!349 (t!18091 Nil!11868)))))

(assert (= (and d!88529 (not res!393275)) b!611498))

(assert (= (and b!611498 res!393276) b!611499))

(declare-fun m!588197 () Bool)

(assert (=> b!611498 m!588197))

(declare-fun m!588199 () Bool)

(assert (=> b!611499 m!588199))

(assert (=> b!611259 d!88529))

(declare-fun b!611523 () Bool)

(declare-fun e!350414 () Bool)

(declare-fun e!350413 () Bool)

(assert (=> b!611523 (= e!350414 e!350413)))

(declare-fun c!69485 () Bool)

(assert (=> b!611523 (= c!69485 (validKeyInArray!0 (select (arr!17923 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!611524 () Bool)

(declare-fun e!350412 () Bool)

(assert (=> b!611524 (= e!350413 e!350412)))

(declare-fun lt!279763 () (_ BitVec 64))

(assert (=> b!611524 (= lt!279763 (select (arr!17923 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!279761 () Unit!19567)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37356 (_ BitVec 64) (_ BitVec 32)) Unit!19567)

(assert (=> b!611524 (= lt!279761 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!279763 #b00000000000000000000000000000000))))

(assert (=> b!611524 (arrayContainsKey!0 a!2986 lt!279763 #b00000000000000000000000000000000)))

(declare-fun lt!279762 () Unit!19567)

(assert (=> b!611524 (= lt!279762 lt!279761)))

(declare-fun res!393291 () Bool)

(assert (=> b!611524 (= res!393291 (= (seekEntryOrOpen!0 (select (arr!17923 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6319 #b00000000000000000000000000000000)))))

(assert (=> b!611524 (=> (not res!393291) (not e!350412))))

(declare-fun bm!33168 () Bool)

(declare-fun call!33171 () Bool)

(assert (=> bm!33168 (= call!33171 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!88531 () Bool)

(declare-fun res!393290 () Bool)

(assert (=> d!88531 (=> res!393290 e!350414)))

(assert (=> d!88531 (= res!393290 (bvsge #b00000000000000000000000000000000 (size!18287 a!2986)))))

(assert (=> d!88531 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!350414)))

(declare-fun b!611525 () Bool)

(assert (=> b!611525 (= e!350413 call!33171)))

(declare-fun b!611526 () Bool)

(assert (=> b!611526 (= e!350412 call!33171)))

(assert (= (and d!88531 (not res!393290)) b!611523))

(assert (= (and b!611523 c!69485) b!611524))

(assert (= (and b!611523 (not c!69485)) b!611525))

(assert (= (and b!611524 res!393291) b!611526))

(assert (= (or b!611526 b!611525) bm!33168))

(assert (=> b!611523 m!588155))

(assert (=> b!611523 m!588155))

(assert (=> b!611523 m!588173))

(assert (=> b!611524 m!588155))

(declare-fun m!588209 () Bool)

(assert (=> b!611524 m!588209))

(declare-fun m!588211 () Bool)

(assert (=> b!611524 m!588211))

(assert (=> b!611524 m!588155))

(declare-fun m!588213 () Bool)

(assert (=> b!611524 m!588213))

(declare-fun m!588215 () Bool)

(assert (=> bm!33168 m!588215))

(assert (=> b!611258 d!88531))

(declare-fun d!88539 () Bool)

(assert (=> d!88539 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!55848 d!88539))

(declare-fun d!88551 () Bool)

(assert (=> d!88551 (= (array_inv!13782 a!2986) (bvsge (size!18287 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!55848 d!88551))

(declare-fun d!88553 () Bool)

(assert (=> d!88553 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!611254 d!88553))

(declare-fun d!88555 () Bool)

(declare-fun res!393309 () Bool)

(declare-fun e!350439 () Bool)

(assert (=> d!88555 (=> res!393309 e!350439)))

(assert (=> d!88555 (= res!393309 (= (select (arr!17923 lt!279633) index!984) (select (arr!17923 a!2986) j!136)))))

(assert (=> d!88555 (= (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) index!984) e!350439)))

(declare-fun b!611558 () Bool)

(declare-fun e!350440 () Bool)

(assert (=> b!611558 (= e!350439 e!350440)))

(declare-fun res!393310 () Bool)

(assert (=> b!611558 (=> (not res!393310) (not e!350440))))

(assert (=> b!611558 (= res!393310 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18287 lt!279633)))))

(declare-fun b!611559 () Bool)

(assert (=> b!611559 (= e!350440 (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88555 (not res!393309)) b!611558))

(assert (= (and b!611558 res!393310) b!611559))

(declare-fun m!588241 () Bool)

(assert (=> d!88555 m!588241))

(assert (=> b!611559 m!587953))

(declare-fun m!588243 () Bool)

(assert (=> b!611559 m!588243))

(assert (=> b!611267 d!88555))

(declare-fun b!611560 () Bool)

(declare-fun e!350443 () SeekEntryResult!6319)

(assert (=> b!611560 (= e!350443 (Found!6319 lt!279634))))

(declare-fun e!350442 () SeekEntryResult!6319)

(declare-fun b!611561 () Bool)

(assert (=> b!611561 (= e!350442 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279634 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!279630 lt!279633 mask!3053))))

(declare-fun b!611562 () Bool)

(assert (=> b!611562 (= e!350442 (MissingVacant!6319 vacantSpotIndex!68))))

(declare-fun lt!279777 () SeekEntryResult!6319)

(declare-fun d!88557 () Bool)

(assert (=> d!88557 (and (or ((_ is Undefined!6319) lt!279777) (not ((_ is Found!6319) lt!279777)) (and (bvsge (index!27558 lt!279777) #b00000000000000000000000000000000) (bvslt (index!27558 lt!279777) (size!18287 lt!279633)))) (or ((_ is Undefined!6319) lt!279777) ((_ is Found!6319) lt!279777) (not ((_ is MissingVacant!6319) lt!279777)) (not (= (index!27560 lt!279777) vacantSpotIndex!68)) (and (bvsge (index!27560 lt!279777) #b00000000000000000000000000000000) (bvslt (index!27560 lt!279777) (size!18287 lt!279633)))) (or ((_ is Undefined!6319) lt!279777) (ite ((_ is Found!6319) lt!279777) (= (select (arr!17923 lt!279633) (index!27558 lt!279777)) lt!279630) (and ((_ is MissingVacant!6319) lt!279777) (= (index!27560 lt!279777) vacantSpotIndex!68) (= (select (arr!17923 lt!279633) (index!27560 lt!279777)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350441 () SeekEntryResult!6319)

(assert (=> d!88557 (= lt!279777 e!350441)))

(declare-fun c!69494 () Bool)

(assert (=> d!88557 (= c!69494 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!279776 () (_ BitVec 64))

(assert (=> d!88557 (= lt!279776 (select (arr!17923 lt!279633) lt!279634))))

(assert (=> d!88557 (validMask!0 mask!3053)))

(assert (=> d!88557 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279634 vacantSpotIndex!68 lt!279630 lt!279633 mask!3053) lt!279777)))

(declare-fun b!611563 () Bool)

(assert (=> b!611563 (= e!350441 e!350443)))

(declare-fun c!69495 () Bool)

(assert (=> b!611563 (= c!69495 (= lt!279776 lt!279630))))

(declare-fun b!611564 () Bool)

(assert (=> b!611564 (= e!350441 Undefined!6319)))

(declare-fun b!611565 () Bool)

(declare-fun c!69493 () Bool)

(assert (=> b!611565 (= c!69493 (= lt!279776 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611565 (= e!350443 e!350442)))

(assert (= (and d!88557 c!69494) b!611564))

(assert (= (and d!88557 (not c!69494)) b!611563))

(assert (= (and b!611563 c!69495) b!611560))

(assert (= (and b!611563 (not c!69495)) b!611565))

(assert (= (and b!611565 c!69493) b!611562))

(assert (= (and b!611565 (not c!69493)) b!611561))

(declare-fun m!588245 () Bool)

(assert (=> b!611561 m!588245))

(assert (=> b!611561 m!588245))

(declare-fun m!588247 () Bool)

(assert (=> b!611561 m!588247))

(declare-fun m!588249 () Bool)

(assert (=> d!88557 m!588249))

(declare-fun m!588251 () Bool)

(assert (=> d!88557 m!588251))

(declare-fun m!588253 () Bool)

(assert (=> d!88557 m!588253))

(assert (=> d!88557 m!587997))

(assert (=> b!611256 d!88557))

(declare-fun d!88559 () Bool)

(declare-fun e!350472 () Bool)

(assert (=> d!88559 e!350472))

(declare-fun res!393332 () Bool)

(assert (=> d!88559 (=> (not res!393332) (not e!350472))))

(assert (=> d!88559 (= res!393332 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18287 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18287 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18287 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18287 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18287 a!2986))))))

(declare-fun lt!279789 () Unit!19567)

(declare-fun choose!9 (array!37356 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19567)

(assert (=> d!88559 (= lt!279789 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279634 vacantSpotIndex!68 mask!3053))))

(assert (=> d!88559 (validMask!0 mask!3053)))

(assert (=> d!88559 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279634 vacantSpotIndex!68 mask!3053) lt!279789)))

(declare-fun b!611601 () Bool)

(assert (=> b!611601 (= e!350472 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279634 vacantSpotIndex!68 (select (arr!17923 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279634 vacantSpotIndex!68 (select (store (arr!17923 a!2986) i!1108 k0!1786) j!136) (array!37357 (store (arr!17923 a!2986) i!1108 k0!1786) (size!18287 a!2986)) mask!3053)))))

(assert (= (and d!88559 res!393332) b!611601))

(declare-fun m!588291 () Bool)

(assert (=> d!88559 m!588291))

(assert (=> d!88559 m!587997))

(assert (=> b!611601 m!587953))

(assert (=> b!611601 m!588005))

(declare-fun m!588297 () Bool)

(assert (=> b!611601 m!588297))

(assert (=> b!611601 m!587957))

(assert (=> b!611601 m!588005))

(assert (=> b!611601 m!587953))

(assert (=> b!611601 m!588007))

(assert (=> b!611256 d!88559))

(declare-fun b!611604 () Bool)

(declare-fun e!350477 () SeekEntryResult!6319)

(assert (=> b!611604 (= e!350477 (Found!6319 lt!279634))))

(declare-fun e!350476 () SeekEntryResult!6319)

(declare-fun b!611605 () Bool)

(assert (=> b!611605 (= e!350476 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!279634 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17923 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611606 () Bool)

(assert (=> b!611606 (= e!350476 (MissingVacant!6319 vacantSpotIndex!68))))

(declare-fun d!88573 () Bool)

(declare-fun lt!279791 () SeekEntryResult!6319)

(assert (=> d!88573 (and (or ((_ is Undefined!6319) lt!279791) (not ((_ is Found!6319) lt!279791)) (and (bvsge (index!27558 lt!279791) #b00000000000000000000000000000000) (bvslt (index!27558 lt!279791) (size!18287 a!2986)))) (or ((_ is Undefined!6319) lt!279791) ((_ is Found!6319) lt!279791) (not ((_ is MissingVacant!6319) lt!279791)) (not (= (index!27560 lt!279791) vacantSpotIndex!68)) (and (bvsge (index!27560 lt!279791) #b00000000000000000000000000000000) (bvslt (index!27560 lt!279791) (size!18287 a!2986)))) (or ((_ is Undefined!6319) lt!279791) (ite ((_ is Found!6319) lt!279791) (= (select (arr!17923 a!2986) (index!27558 lt!279791)) (select (arr!17923 a!2986) j!136)) (and ((_ is MissingVacant!6319) lt!279791) (= (index!27560 lt!279791) vacantSpotIndex!68) (= (select (arr!17923 a!2986) (index!27560 lt!279791)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350475 () SeekEntryResult!6319)

(assert (=> d!88573 (= lt!279791 e!350475)))

(declare-fun c!69504 () Bool)

(assert (=> d!88573 (= c!69504 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!279790 () (_ BitVec 64))

(assert (=> d!88573 (= lt!279790 (select (arr!17923 a!2986) lt!279634))))

(assert (=> d!88573 (validMask!0 mask!3053)))

(assert (=> d!88573 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279634 vacantSpotIndex!68 (select (arr!17923 a!2986) j!136) a!2986 mask!3053) lt!279791)))

(declare-fun b!611607 () Bool)

(assert (=> b!611607 (= e!350475 e!350477)))

(declare-fun c!69505 () Bool)

(assert (=> b!611607 (= c!69505 (= lt!279790 (select (arr!17923 a!2986) j!136)))))

(declare-fun b!611608 () Bool)

(assert (=> b!611608 (= e!350475 Undefined!6319)))

(declare-fun b!611609 () Bool)

(declare-fun c!69503 () Bool)

(assert (=> b!611609 (= c!69503 (= lt!279790 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611609 (= e!350477 e!350476)))

(assert (= (and d!88573 c!69504) b!611608))

(assert (= (and d!88573 (not c!69504)) b!611607))

(assert (= (and b!611607 c!69505) b!611604))

(assert (= (and b!611607 (not c!69505)) b!611609))

(assert (= (and b!611609 c!69503) b!611606))

(assert (= (and b!611609 (not c!69503)) b!611605))

(assert (=> b!611605 m!588245))

(assert (=> b!611605 m!588245))

(assert (=> b!611605 m!587953))

(declare-fun m!588299 () Bool)

(assert (=> b!611605 m!588299))

(declare-fun m!588301 () Bool)

(assert (=> d!88573 m!588301))

(declare-fun m!588303 () Bool)

(assert (=> d!88573 m!588303))

(declare-fun m!588305 () Bool)

(assert (=> d!88573 m!588305))

(assert (=> d!88573 m!587997))

(assert (=> b!611256 d!88573))

(declare-fun d!88575 () Bool)

(declare-fun lt!279797 () (_ BitVec 32))

(assert (=> d!88575 (and (bvsge lt!279797 #b00000000000000000000000000000000) (bvslt lt!279797 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88575 (= lt!279797 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!88575 (validMask!0 mask!3053)))

(assert (=> d!88575 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!279797)))

(declare-fun bs!18668 () Bool)

(assert (= bs!18668 d!88575))

(declare-fun m!588309 () Bool)

(assert (=> bs!18668 m!588309))

(assert (=> bs!18668 m!587997))

(assert (=> b!611256 d!88575))

(declare-fun b!611612 () Bool)

(declare-fun e!350480 () SeekEntryResult!6319)

(assert (=> b!611612 (= e!350480 (Found!6319 index!984))))

(declare-fun b!611613 () Bool)

(declare-fun e!350479 () SeekEntryResult!6319)

(assert (=> b!611613 (= e!350479 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!279630 lt!279633 mask!3053))))

(declare-fun b!611614 () Bool)

(assert (=> b!611614 (= e!350479 (MissingVacant!6319 vacantSpotIndex!68))))

(declare-fun d!88579 () Bool)

(declare-fun lt!279803 () SeekEntryResult!6319)

(assert (=> d!88579 (and (or ((_ is Undefined!6319) lt!279803) (not ((_ is Found!6319) lt!279803)) (and (bvsge (index!27558 lt!279803) #b00000000000000000000000000000000) (bvslt (index!27558 lt!279803) (size!18287 lt!279633)))) (or ((_ is Undefined!6319) lt!279803) ((_ is Found!6319) lt!279803) (not ((_ is MissingVacant!6319) lt!279803)) (not (= (index!27560 lt!279803) vacantSpotIndex!68)) (and (bvsge (index!27560 lt!279803) #b00000000000000000000000000000000) (bvslt (index!27560 lt!279803) (size!18287 lt!279633)))) (or ((_ is Undefined!6319) lt!279803) (ite ((_ is Found!6319) lt!279803) (= (select (arr!17923 lt!279633) (index!27558 lt!279803)) lt!279630) (and ((_ is MissingVacant!6319) lt!279803) (= (index!27560 lt!279803) vacantSpotIndex!68) (= (select (arr!17923 lt!279633) (index!27560 lt!279803)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!350478 () SeekEntryResult!6319)

(assert (=> d!88579 (= lt!279803 e!350478)))

(declare-fun c!69507 () Bool)

(assert (=> d!88579 (= c!69507 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!279802 () (_ BitVec 64))

(assert (=> d!88579 (= lt!279802 (select (arr!17923 lt!279633) index!984))))

(assert (=> d!88579 (validMask!0 mask!3053)))

(assert (=> d!88579 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279630 lt!279633 mask!3053) lt!279803)))

(declare-fun b!611615 () Bool)

(assert (=> b!611615 (= e!350478 e!350480)))

(declare-fun c!69508 () Bool)

(assert (=> b!611615 (= c!69508 (= lt!279802 lt!279630))))

(declare-fun b!611616 () Bool)

(assert (=> b!611616 (= e!350478 Undefined!6319)))

(declare-fun b!611617 () Bool)

(declare-fun c!69506 () Bool)

(assert (=> b!611617 (= c!69506 (= lt!279802 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611617 (= e!350480 e!350479)))

(assert (= (and d!88579 c!69507) b!611616))

(assert (= (and d!88579 (not c!69507)) b!611615))

(assert (= (and b!611615 c!69508) b!611612))

(assert (= (and b!611615 (not c!69508)) b!611617))

(assert (= (and b!611617 c!69506) b!611614))

(assert (= (and b!611617 (not c!69506)) b!611613))

(assert (=> b!611613 m!588163))

(assert (=> b!611613 m!588163))

(declare-fun m!588311 () Bool)

(assert (=> b!611613 m!588311))

(declare-fun m!588313 () Bool)

(assert (=> d!88579 m!588313))

(declare-fun m!588315 () Bool)

(assert (=> d!88579 m!588315))

(assert (=> d!88579 m!588241))

(assert (=> d!88579 m!587997))

(assert (=> b!611256 d!88579))

(assert (=> b!611263 d!88555))

(declare-fun d!88581 () Bool)

(assert (=> d!88581 (= (validKeyInArray!0 (select (arr!17923 a!2986) j!136)) (and (not (= (select (arr!17923 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17923 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!611252 d!88581))

(declare-fun d!88583 () Bool)

(declare-fun res!393335 () Bool)

(declare-fun e!350487 () Bool)

(assert (=> d!88583 (=> res!393335 e!350487)))

(assert (=> d!88583 (= res!393335 (= (select (arr!17923 lt!279633) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17923 a!2986) j!136)))))

(assert (=> d!88583 (= (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!350487)))

(declare-fun b!611628 () Bool)

(declare-fun e!350488 () Bool)

(assert (=> b!611628 (= e!350487 e!350488)))

(declare-fun res!393336 () Bool)

(assert (=> b!611628 (=> (not res!393336) (not e!350488))))

(assert (=> b!611628 (= res!393336 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18287 lt!279633)))))

(declare-fun b!611629 () Bool)

(assert (=> b!611629 (= e!350488 (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!88583 (not res!393335)) b!611628))

(assert (= (and b!611628 res!393336) b!611629))

(declare-fun m!588317 () Bool)

(assert (=> d!88583 m!588317))

(assert (=> b!611629 m!587953))

(declare-fun m!588319 () Bool)

(assert (=> b!611629 m!588319))

(assert (=> b!611262 d!88583))

(declare-fun d!88585 () Bool)

(assert (=> d!88585 (arrayNoDuplicates!0 lt!279633 j!136 Nil!11868)))

(declare-fun lt!279811 () Unit!19567)

(declare-fun choose!39 (array!37356 (_ BitVec 32) (_ BitVec 32)) Unit!19567)

(assert (=> d!88585 (= lt!279811 (choose!39 lt!279633 #b00000000000000000000000000000000 j!136))))

(assert (=> d!88585 (bvslt (size!18287 lt!279633) #b01111111111111111111111111111111)))

(assert (=> d!88585 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!279633 #b00000000000000000000000000000000 j!136) lt!279811)))

(declare-fun bs!18669 () Bool)

(assert (= bs!18669 d!88585))

(assert (=> bs!18669 m!587961))

(declare-fun m!588325 () Bool)

(assert (=> bs!18669 m!588325))

(assert (=> b!611262 d!88585))

(declare-fun c!69515 () Bool)

(declare-fun call!33177 () Bool)

(declare-fun bm!33174 () Bool)

(assert (=> bm!33174 (= call!33177 (arrayNoDuplicates!0 lt!279633 (bvadd j!136 #b00000000000000000000000000000001) (ite c!69515 (Cons!11867 (select (arr!17923 lt!279633) j!136) Nil!11868) Nil!11868)))))

(declare-fun b!611633 () Bool)

(declare-fun e!350493 () Bool)

(declare-fun e!350495 () Bool)

(assert (=> b!611633 (= e!350493 e!350495)))

(assert (=> b!611633 (= c!69515 (validKeyInArray!0 (select (arr!17923 lt!279633) j!136)))))

(declare-fun b!611634 () Bool)

(declare-fun e!350494 () Bool)

(assert (=> b!611634 (= e!350494 (contains!3018 Nil!11868 (select (arr!17923 lt!279633) j!136)))))

(declare-fun d!88589 () Bool)

(declare-fun res!393340 () Bool)

(declare-fun e!350492 () Bool)

(assert (=> d!88589 (=> res!393340 e!350492)))

(assert (=> d!88589 (= res!393340 (bvsge j!136 (size!18287 lt!279633)))))

(assert (=> d!88589 (= (arrayNoDuplicates!0 lt!279633 j!136 Nil!11868) e!350492)))

(declare-fun b!611635 () Bool)

(assert (=> b!611635 (= e!350495 call!33177)))

(declare-fun b!611636 () Bool)

(assert (=> b!611636 (= e!350492 e!350493)))

(declare-fun res!393341 () Bool)

(assert (=> b!611636 (=> (not res!393341) (not e!350493))))

(assert (=> b!611636 (= res!393341 (not e!350494))))

(declare-fun res!393342 () Bool)

(assert (=> b!611636 (=> (not res!393342) (not e!350494))))

(assert (=> b!611636 (= res!393342 (validKeyInArray!0 (select (arr!17923 lt!279633) j!136)))))

(declare-fun b!611637 () Bool)

(assert (=> b!611637 (= e!350495 call!33177)))

(assert (= (and d!88589 (not res!393340)) b!611636))

(assert (= (and b!611636 res!393342) b!611634))

(assert (= (and b!611636 res!393341) b!611633))

(assert (= (and b!611633 c!69515) b!611637))

(assert (= (and b!611633 (not c!69515)) b!611635))

(assert (= (or b!611637 b!611635) bm!33174))

(assert (=> bm!33174 m!588159))

(declare-fun m!588327 () Bool)

(assert (=> bm!33174 m!588327))

(assert (=> b!611633 m!588159))

(assert (=> b!611633 m!588159))

(declare-fun m!588329 () Bool)

(assert (=> b!611633 m!588329))

(assert (=> b!611634 m!588159))

(assert (=> b!611634 m!588159))

(declare-fun m!588331 () Bool)

(assert (=> b!611634 m!588331))

(assert (=> b!611636 m!588159))

(assert (=> b!611636 m!588159))

(assert (=> b!611636 m!588329))

(assert (=> b!611262 d!88589))

(declare-fun d!88591 () Bool)

(assert (=> d!88591 (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279820 () Unit!19567)

(declare-fun choose!114 (array!37356 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19567)

(assert (=> d!88591 (= lt!279820 (choose!114 lt!279633 (select (arr!17923 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!88591 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!88591 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279633 (select (arr!17923 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!279820)))

(declare-fun bs!18671 () Bool)

(assert (= bs!18671 d!88591))

(assert (=> bs!18671 m!587953))

(assert (=> bs!18671 m!587965))

(assert (=> bs!18671 m!587953))

(declare-fun m!588349 () Bool)

(assert (=> bs!18671 m!588349))

(assert (=> b!611262 d!88591))

(declare-fun bm!33175 () Bool)

(declare-fun call!33178 () Bool)

(declare-fun c!69519 () Bool)

(assert (=> bm!33175 (= call!33178 (arrayNoDuplicates!0 lt!279633 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!69519 (Cons!11867 (select (arr!17923 lt!279633) #b00000000000000000000000000000000) Nil!11868) Nil!11868)))))

(declare-fun b!611646 () Bool)

(declare-fun e!350502 () Bool)

(declare-fun e!350504 () Bool)

(assert (=> b!611646 (= e!350502 e!350504)))

(assert (=> b!611646 (= c!69519 (validKeyInArray!0 (select (arr!17923 lt!279633) #b00000000000000000000000000000000)))))

(declare-fun b!611647 () Bool)

(declare-fun e!350503 () Bool)

(assert (=> b!611647 (= e!350503 (contains!3018 Nil!11868 (select (arr!17923 lt!279633) #b00000000000000000000000000000000)))))

(declare-fun d!88597 () Bool)

(declare-fun res!393345 () Bool)

(declare-fun e!350501 () Bool)

(assert (=> d!88597 (=> res!393345 e!350501)))

(assert (=> d!88597 (= res!393345 (bvsge #b00000000000000000000000000000000 (size!18287 lt!279633)))))

(assert (=> d!88597 (= (arrayNoDuplicates!0 lt!279633 #b00000000000000000000000000000000 Nil!11868) e!350501)))

(declare-fun b!611648 () Bool)

(assert (=> b!611648 (= e!350504 call!33178)))

(declare-fun b!611649 () Bool)

(assert (=> b!611649 (= e!350501 e!350502)))

(declare-fun res!393346 () Bool)

(assert (=> b!611649 (=> (not res!393346) (not e!350502))))

(assert (=> b!611649 (= res!393346 (not e!350503))))

(declare-fun res!393347 () Bool)

(assert (=> b!611649 (=> (not res!393347) (not e!350503))))

(assert (=> b!611649 (= res!393347 (validKeyInArray!0 (select (arr!17923 lt!279633) #b00000000000000000000000000000000)))))

(declare-fun b!611650 () Bool)

(assert (=> b!611650 (= e!350504 call!33178)))

(assert (= (and d!88597 (not res!393345)) b!611649))

(assert (= (and b!611649 res!393347) b!611647))

(assert (= (and b!611649 res!393346) b!611646))

(assert (= (and b!611646 c!69519) b!611650))

(assert (= (and b!611646 (not c!69519)) b!611648))

(assert (= (or b!611650 b!611648) bm!33175))

(declare-fun m!588355 () Bool)

(assert (=> bm!33175 m!588355))

(declare-fun m!588357 () Bool)

(assert (=> bm!33175 m!588357))

(assert (=> b!611646 m!588355))

(assert (=> b!611646 m!588355))

(declare-fun m!588359 () Bool)

(assert (=> b!611646 m!588359))

(assert (=> b!611647 m!588355))

(assert (=> b!611647 m!588355))

(declare-fun m!588361 () Bool)

(assert (=> b!611647 m!588361))

(assert (=> b!611649 m!588355))

(assert (=> b!611649 m!588355))

(assert (=> b!611649 m!588359))

(assert (=> b!611262 d!88597))

(declare-fun d!88601 () Bool)

(declare-fun e!350513 () Bool)

(assert (=> d!88601 e!350513))

(declare-fun res!393356 () Bool)

(assert (=> d!88601 (=> (not res!393356) (not e!350513))))

(assert (=> d!88601 (= res!393356 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18287 a!2986))))))

(declare-fun lt!279826 () Unit!19567)

(declare-fun choose!41 (array!37356 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11871) Unit!19567)

(assert (=> d!88601 (= lt!279826 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11868))))

(assert (=> d!88601 (bvslt (size!18287 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!88601 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11868) lt!279826)))

(declare-fun b!611659 () Bool)

(assert (=> b!611659 (= e!350513 (arrayNoDuplicates!0 (array!37357 (store (arr!17923 a!2986) i!1108 k0!1786) (size!18287 a!2986)) #b00000000000000000000000000000000 Nil!11868))))

(assert (= (and d!88601 res!393356) b!611659))

(declare-fun m!588369 () Bool)

(assert (=> d!88601 m!588369))

(assert (=> b!611659 m!587957))

(declare-fun m!588371 () Bool)

(assert (=> b!611659 m!588371))

(assert (=> b!611262 d!88601))

(declare-fun d!88605 () Bool)

(assert (=> d!88605 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18287 lt!279633)) (not (= (select (arr!17923 lt!279633) j!136) (select (arr!17923 a!2986) j!136))))))

(declare-fun lt!279829 () Unit!19567)

(declare-fun choose!21 (array!37356 (_ BitVec 64) (_ BitVec 32) List!11871) Unit!19567)

(assert (=> d!88605 (= lt!279829 (choose!21 lt!279633 (select (arr!17923 a!2986) j!136) j!136 Nil!11868))))

(assert (=> d!88605 (bvslt (size!18287 lt!279633) #b01111111111111111111111111111111)))

(assert (=> d!88605 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279633 (select (arr!17923 a!2986) j!136) j!136 Nil!11868) lt!279829)))

(declare-fun bs!18672 () Bool)

(assert (= bs!18672 d!88605))

(assert (=> bs!18672 m!588159))

(assert (=> bs!18672 m!587953))

(declare-fun m!588373 () Bool)

(assert (=> bs!18672 m!588373))

(assert (=> b!611262 d!88605))

(assert (=> b!611264 d!88519))

(declare-fun d!88607 () Bool)

(assert (=> d!88607 (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279830 () Unit!19567)

(assert (=> d!88607 (= lt!279830 (choose!114 lt!279633 (select (arr!17923 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!88607 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!88607 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279633 (select (arr!17923 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!279830)))

(declare-fun bs!18673 () Bool)

(assert (= bs!18673 d!88607))

(assert (=> bs!18673 m!587953))

(assert (=> bs!18673 m!587975))

(assert (=> bs!18673 m!587953))

(declare-fun m!588375 () Bool)

(assert (=> bs!18673 m!588375))

(assert (=> b!611264 d!88607))

(declare-fun d!88609 () Bool)

(declare-fun res!393357 () Bool)

(declare-fun e!350514 () Bool)

(assert (=> d!88609 (=> res!393357 e!350514)))

(assert (=> d!88609 (= res!393357 (= (select (arr!17923 lt!279633) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!17923 a!2986) j!136)))))

(assert (=> d!88609 (= (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!350514)))

(declare-fun b!611662 () Bool)

(declare-fun e!350515 () Bool)

(assert (=> b!611662 (= e!350514 e!350515)))

(declare-fun res!393358 () Bool)

(assert (=> b!611662 (=> (not res!393358) (not e!350515))))

(assert (=> b!611662 (= res!393358 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18287 lt!279633)))))

(declare-fun b!611663 () Bool)

(assert (=> b!611663 (= e!350515 (arrayContainsKey!0 lt!279633 (select (arr!17923 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!88609 (not res!393357)) b!611662))

(assert (= (and b!611662 res!393358) b!611663))

(declare-fun m!588377 () Bool)

(assert (=> d!88609 m!588377))

(assert (=> b!611663 m!587953))

(declare-fun m!588379 () Bool)

(assert (=> b!611663 m!588379))

(assert (=> b!611264 d!88609))

(assert (=> b!611264 d!88597))

(assert (=> b!611264 d!88601))

(declare-fun d!88611 () Bool)

(declare-fun lt!279835 () Bool)

(assert (=> d!88611 (= lt!279835 (select (content!240 Nil!11868) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!350522 () Bool)

(assert (=> d!88611 (= lt!279835 e!350522)))

(declare-fun res!393359 () Bool)

(assert (=> d!88611 (=> (not res!393359) (not e!350522))))

(assert (=> d!88611 (= res!393359 ((_ is Cons!11867) Nil!11868))))

(assert (=> d!88611 (= (contains!3018 Nil!11868 #b1000000000000000000000000000000000000000000000000000000000000000) lt!279835)))

(declare-fun b!611674 () Bool)

(declare-fun e!350523 () Bool)

(assert (=> b!611674 (= e!350522 e!350523)))

(declare-fun res!393360 () Bool)

(assert (=> b!611674 (=> res!393360 e!350523)))

(assert (=> b!611674 (= res!393360 (= (h!12915 Nil!11868) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!611675 () Bool)

(assert (=> b!611675 (= e!350523 (contains!3018 (t!18091 Nil!11868) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!88611 res!393359) b!611674))

(assert (= (and b!611674 (not res!393360)) b!611675))

(assert (=> d!88611 m!588191))

(declare-fun m!588381 () Bool)

(assert (=> d!88611 m!588381))

(declare-fun m!588383 () Bool)

(assert (=> b!611675 m!588383))

(assert (=> b!611253 d!88611))

(check-sat (not d!88575) (not d!88521) (not b!611601) (not b!611524) (not b!611659) (not d!88579) (not b!611499) (not b!611559) (not b!611605) (not d!88525) (not b!611629) (not d!88601) (not b!611561) (not b!611434) (not b!611647) (not d!88585) (not b!611436) (not b!611634) (not d!88591) (not d!88559) (not b!611493) (not b!611613) (not b!611646) (not d!88557) (not b!611636) (not d!88607) (not d!88527) (not b!611498) (not b!611663) (not b!611465) (not b!611675) (not b!611633) (not d!88611) (not bm!33162) (not bm!33168) (not b!611450) (not b!611523) (not b!611649) (not b!611466) (not b!611484) (not bm!33175) (not d!88605) (not d!88573) (not b!611468) (not bm!33174))
(check-sat)
