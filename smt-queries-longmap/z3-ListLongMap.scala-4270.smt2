; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59348 () Bool)

(assert start!59348)

(declare-fun b!655237 () Bool)

(declare-datatypes ((Unit!22532 0))(
  ( (Unit!22533) )
))
(declare-fun e!376285 () Unit!22532)

(declare-fun Unit!22534 () Unit!22532)

(assert (=> b!655237 (= e!376285 Unit!22534)))

(declare-fun b!655238 () Bool)

(declare-fun e!376278 () Bool)

(declare-fun e!376280 () Bool)

(assert (=> b!655238 (= e!376278 e!376280)))

(declare-fun res!425105 () Bool)

(assert (=> b!655238 (=> (not res!425105) (not e!376280))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38679 0))(
  ( (array!38680 (arr!18539 (Array (_ BitVec 32) (_ BitVec 64))) (size!18904 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38679)

(assert (=> b!655238 (= res!425105 (= (select (store (arr!18539 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!305526 () array!38679)

(assert (=> b!655238 (= lt!305526 (array!38680 (store (arr!18539 a!2986) i!1108 k0!1786) (size!18904 a!2986)))))

(declare-fun b!655239 () Bool)

(declare-fun res!425101 () Bool)

(declare-fun e!376284 () Bool)

(assert (=> b!655239 (=> (not res!425101) (not e!376284))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655239 (= res!425101 (validKeyInArray!0 (select (arr!18539 a!2986) j!136)))))

(declare-fun b!655241 () Bool)

(declare-fun e!376283 () Bool)

(declare-datatypes ((SeekEntryResult!6976 0))(
  ( (MissingZero!6976 (index!30263 (_ BitVec 32))) (Found!6976 (index!30264 (_ BitVec 32))) (Intermediate!6976 (undefined!7788 Bool) (index!30265 (_ BitVec 32)) (x!59060 (_ BitVec 32))) (Undefined!6976) (MissingVacant!6976 (index!30266 (_ BitVec 32))) )
))
(declare-fun lt!305521 () SeekEntryResult!6976)

(declare-fun lt!305515 () SeekEntryResult!6976)

(assert (=> b!655241 (= e!376283 (= lt!305521 lt!305515))))

(declare-fun b!655242 () Bool)

(declare-fun res!425113 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!655242 (= res!425113 (bvsge j!136 index!984))))

(declare-fun e!376273 () Bool)

(assert (=> b!655242 (=> res!425113 e!376273)))

(declare-fun e!376279 () Bool)

(assert (=> b!655242 (= e!376279 e!376273)))

(declare-fun b!655243 () Bool)

(assert (=> b!655243 false))

(declare-fun lt!305525 () Unit!22532)

(declare-datatypes ((List!12619 0))(
  ( (Nil!12616) (Cons!12615 (h!13660 (_ BitVec 64)) (t!18838 List!12619)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38679 (_ BitVec 64) (_ BitVec 32) List!12619) Unit!22532)

(assert (=> b!655243 (= lt!305525 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305526 (select (arr!18539 a!2986) j!136) index!984 Nil!12616))))

(declare-fun arrayNoDuplicates!0 (array!38679 (_ BitVec 32) List!12619) Bool)

(assert (=> b!655243 (arrayNoDuplicates!0 lt!305526 index!984 Nil!12616)))

(declare-fun lt!305520 () Unit!22532)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38679 (_ BitVec 32) (_ BitVec 32)) Unit!22532)

(assert (=> b!655243 (= lt!305520 (lemmaNoDuplicateFromThenFromBigger!0 lt!305526 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655243 (arrayNoDuplicates!0 lt!305526 #b00000000000000000000000000000000 Nil!12616)))

(declare-fun lt!305512 () Unit!22532)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38679 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12619) Unit!22532)

(assert (=> b!655243 (= lt!305512 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12616))))

(declare-fun arrayContainsKey!0 (array!38679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655243 (arrayContainsKey!0 lt!305526 (select (arr!18539 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305507 () Unit!22532)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38679 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22532)

(assert (=> b!655243 (= lt!305507 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305526 (select (arr!18539 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376277 () Bool)

(assert (=> b!655243 e!376277))

(declare-fun res!425107 () Bool)

(assert (=> b!655243 (=> (not res!425107) (not e!376277))))

(assert (=> b!655243 (= res!425107 (arrayContainsKey!0 lt!305526 (select (arr!18539 a!2986) j!136) j!136))))

(declare-fun e!376282 () Unit!22532)

(declare-fun Unit!22535 () Unit!22532)

(assert (=> b!655243 (= e!376282 Unit!22535)))

(declare-fun b!655244 () Bool)

(declare-fun Unit!22536 () Unit!22532)

(assert (=> b!655244 (= e!376285 Unit!22536)))

(declare-fun res!425115 () Bool)

(assert (=> b!655244 (= res!425115 (= (select (store (arr!18539 a!2986) i!1108 k0!1786) index!984) (select (arr!18539 a!2986) j!136)))))

(assert (=> b!655244 (=> (not res!425115) (not e!376279))))

(assert (=> b!655244 e!376279))

(declare-fun c!75437 () Bool)

(assert (=> b!655244 (= c!75437 (bvslt j!136 index!984))))

(declare-fun lt!305524 () Unit!22532)

(declare-fun e!376274 () Unit!22532)

(assert (=> b!655244 (= lt!305524 e!376274)))

(declare-fun c!75436 () Bool)

(assert (=> b!655244 (= c!75436 (bvslt index!984 j!136))))

(declare-fun lt!305517 () Unit!22532)

(assert (=> b!655244 (= lt!305517 e!376282)))

(assert (=> b!655244 false))

(declare-fun b!655245 () Bool)

(assert (=> b!655245 (= e!376284 e!376278)))

(declare-fun res!425106 () Bool)

(assert (=> b!655245 (=> (not res!425106) (not e!376278))))

(declare-fun lt!305518 () SeekEntryResult!6976)

(assert (=> b!655245 (= res!425106 (or (= lt!305518 (MissingZero!6976 i!1108)) (= lt!305518 (MissingVacant!6976 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38679 (_ BitVec 32)) SeekEntryResult!6976)

(assert (=> b!655245 (= lt!305518 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun e!376275 () Bool)

(declare-fun b!655246 () Bool)

(assert (=> b!655246 (= e!376275 (arrayContainsKey!0 lt!305526 (select (arr!18539 a!2986) j!136) index!984))))

(declare-fun b!655247 () Bool)

(declare-fun res!425114 () Bool)

(assert (=> b!655247 (=> (not res!425114) (not e!376278))))

(assert (=> b!655247 (= res!425114 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12616))))

(declare-fun b!655248 () Bool)

(declare-fun e!376276 () Bool)

(assert (=> b!655248 (= e!376276 (not true))))

(declare-fun lt!305511 () Unit!22532)

(assert (=> b!655248 (= lt!305511 e!376285)))

(declare-fun c!75438 () Bool)

(declare-fun lt!305514 () SeekEntryResult!6976)

(assert (=> b!655248 (= c!75438 (= lt!305514 (Found!6976 index!984)))))

(declare-fun lt!305516 () Unit!22532)

(declare-fun e!376281 () Unit!22532)

(assert (=> b!655248 (= lt!305516 e!376281)))

(declare-fun c!75435 () Bool)

(assert (=> b!655248 (= c!75435 (= lt!305514 Undefined!6976))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!305519 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38679 (_ BitVec 32)) SeekEntryResult!6976)

(assert (=> b!655248 (= lt!305514 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305519 lt!305526 mask!3053))))

(assert (=> b!655248 e!376283))

(declare-fun res!425104 () Bool)

(assert (=> b!655248 (=> (not res!425104) (not e!376283))))

(declare-fun lt!305522 () (_ BitVec 32))

(assert (=> b!655248 (= res!425104 (= lt!305515 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305522 vacantSpotIndex!68 lt!305519 lt!305526 mask!3053)))))

(assert (=> b!655248 (= lt!305515 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305522 vacantSpotIndex!68 (select (arr!18539 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655248 (= lt!305519 (select (store (arr!18539 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305510 () Unit!22532)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38679 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22532)

(assert (=> b!655248 (= lt!305510 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305522 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655248 (= lt!305522 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655249 () Bool)

(declare-fun Unit!22537 () Unit!22532)

(assert (=> b!655249 (= e!376282 Unit!22537)))

(declare-fun b!655250 () Bool)

(declare-fun res!425109 () Bool)

(assert (=> b!655250 (=> (not res!425109) (not e!376278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38679 (_ BitVec 32)) Bool)

(assert (=> b!655250 (= res!425109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655251 () Bool)

(declare-fun res!425103 () Bool)

(assert (=> b!655251 (=> (not res!425103) (not e!376284))))

(assert (=> b!655251 (= res!425103 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!425116 () Bool)

(declare-fun b!655252 () Bool)

(assert (=> b!655252 (= res!425116 (arrayContainsKey!0 lt!305526 (select (arr!18539 a!2986) j!136) j!136))))

(assert (=> b!655252 (=> (not res!425116) (not e!376275))))

(assert (=> b!655252 (= e!376273 e!376275)))

(declare-fun b!655253 () Bool)

(declare-fun res!425112 () Bool)

(assert (=> b!655253 (=> (not res!425112) (not e!376284))))

(assert (=> b!655253 (= res!425112 (and (= (size!18904 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18904 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18904 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655240 () Bool)

(declare-fun res!425102 () Bool)

(assert (=> b!655240 (=> (not res!425102) (not e!376284))))

(assert (=> b!655240 (= res!425102 (validKeyInArray!0 k0!1786))))

(declare-fun res!425110 () Bool)

(assert (=> start!59348 (=> (not res!425110) (not e!376284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59348 (= res!425110 (validMask!0 mask!3053))))

(assert (=> start!59348 e!376284))

(assert (=> start!59348 true))

(declare-fun array_inv!14422 (array!38679) Bool)

(assert (=> start!59348 (array_inv!14422 a!2986)))

(declare-fun b!655254 () Bool)

(declare-fun Unit!22538 () Unit!22532)

(assert (=> b!655254 (= e!376274 Unit!22538)))

(declare-fun b!655255 () Bool)

(assert (=> b!655255 (= e!376277 (arrayContainsKey!0 lt!305526 (select (arr!18539 a!2986) j!136) index!984))))

(declare-fun b!655256 () Bool)

(assert (=> b!655256 (= e!376280 e!376276)))

(declare-fun res!425111 () Bool)

(assert (=> b!655256 (=> (not res!425111) (not e!376276))))

(assert (=> b!655256 (= res!425111 (and (= lt!305521 (Found!6976 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18539 a!2986) index!984) (select (arr!18539 a!2986) j!136))) (not (= (select (arr!18539 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!655256 (= lt!305521 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18539 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655257 () Bool)

(assert (=> b!655257 false))

(declare-fun lt!305513 () Unit!22532)

(assert (=> b!655257 (= lt!305513 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305526 (select (arr!18539 a!2986) j!136) j!136 Nil!12616))))

(assert (=> b!655257 (arrayNoDuplicates!0 lt!305526 j!136 Nil!12616)))

(declare-fun lt!305523 () Unit!22532)

(assert (=> b!655257 (= lt!305523 (lemmaNoDuplicateFromThenFromBigger!0 lt!305526 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655257 (arrayNoDuplicates!0 lt!305526 #b00000000000000000000000000000000 Nil!12616)))

(declare-fun lt!305508 () Unit!22532)

(assert (=> b!655257 (= lt!305508 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12616))))

(assert (=> b!655257 (arrayContainsKey!0 lt!305526 (select (arr!18539 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305509 () Unit!22532)

(assert (=> b!655257 (= lt!305509 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305526 (select (arr!18539 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22539 () Unit!22532)

(assert (=> b!655257 (= e!376274 Unit!22539)))

(declare-fun b!655258 () Bool)

(declare-fun res!425108 () Bool)

(assert (=> b!655258 (=> (not res!425108) (not e!376278))))

(assert (=> b!655258 (= res!425108 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18539 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655259 () Bool)

(declare-fun Unit!22540 () Unit!22532)

(assert (=> b!655259 (= e!376281 Unit!22540)))

(assert (=> b!655259 false))

(declare-fun b!655260 () Bool)

(declare-fun Unit!22541 () Unit!22532)

(assert (=> b!655260 (= e!376281 Unit!22541)))

(assert (= (and start!59348 res!425110) b!655253))

(assert (= (and b!655253 res!425112) b!655239))

(assert (= (and b!655239 res!425101) b!655240))

(assert (= (and b!655240 res!425102) b!655251))

(assert (= (and b!655251 res!425103) b!655245))

(assert (= (and b!655245 res!425106) b!655250))

(assert (= (and b!655250 res!425109) b!655247))

(assert (= (and b!655247 res!425114) b!655258))

(assert (= (and b!655258 res!425108) b!655238))

(assert (= (and b!655238 res!425105) b!655256))

(assert (= (and b!655256 res!425111) b!655248))

(assert (= (and b!655248 res!425104) b!655241))

(assert (= (and b!655248 c!75435) b!655259))

(assert (= (and b!655248 (not c!75435)) b!655260))

(assert (= (and b!655248 c!75438) b!655244))

(assert (= (and b!655248 (not c!75438)) b!655237))

(assert (= (and b!655244 res!425115) b!655242))

(assert (= (and b!655242 (not res!425113)) b!655252))

(assert (= (and b!655252 res!425116) b!655246))

(assert (= (and b!655244 c!75437) b!655257))

(assert (= (and b!655244 (not c!75437)) b!655254))

(assert (= (and b!655244 c!75436) b!655243))

(assert (= (and b!655244 (not c!75436)) b!655249))

(assert (= (and b!655243 res!425107) b!655255))

(declare-fun m!627825 () Bool)

(assert (=> b!655248 m!627825))

(declare-fun m!627827 () Bool)

(assert (=> b!655248 m!627827))

(declare-fun m!627829 () Bool)

(assert (=> b!655248 m!627829))

(declare-fun m!627831 () Bool)

(assert (=> b!655248 m!627831))

(declare-fun m!627833 () Bool)

(assert (=> b!655248 m!627833))

(declare-fun m!627835 () Bool)

(assert (=> b!655248 m!627835))

(declare-fun m!627837 () Bool)

(assert (=> b!655248 m!627837))

(assert (=> b!655248 m!627829))

(declare-fun m!627839 () Bool)

(assert (=> b!655248 m!627839))

(assert (=> b!655257 m!627829))

(declare-fun m!627841 () Bool)

(assert (=> b!655257 m!627841))

(declare-fun m!627843 () Bool)

(assert (=> b!655257 m!627843))

(declare-fun m!627845 () Bool)

(assert (=> b!655257 m!627845))

(assert (=> b!655257 m!627829))

(declare-fun m!627847 () Bool)

(assert (=> b!655257 m!627847))

(assert (=> b!655257 m!627829))

(declare-fun m!627849 () Bool)

(assert (=> b!655257 m!627849))

(assert (=> b!655257 m!627829))

(declare-fun m!627851 () Bool)

(assert (=> b!655257 m!627851))

(declare-fun m!627853 () Bool)

(assert (=> b!655257 m!627853))

(declare-fun m!627855 () Bool)

(assert (=> b!655256 m!627855))

(assert (=> b!655256 m!627829))

(assert (=> b!655256 m!627829))

(declare-fun m!627857 () Bool)

(assert (=> b!655256 m!627857))

(assert (=> b!655238 m!627831))

(declare-fun m!627859 () Bool)

(assert (=> b!655238 m!627859))

(assert (=> b!655246 m!627829))

(assert (=> b!655246 m!627829))

(declare-fun m!627861 () Bool)

(assert (=> b!655246 m!627861))

(assert (=> b!655255 m!627829))

(assert (=> b!655255 m!627829))

(assert (=> b!655255 m!627861))

(declare-fun m!627863 () Bool)

(assert (=> b!655247 m!627863))

(declare-fun m!627865 () Bool)

(assert (=> b!655251 m!627865))

(declare-fun m!627867 () Bool)

(assert (=> start!59348 m!627867))

(declare-fun m!627869 () Bool)

(assert (=> start!59348 m!627869))

(declare-fun m!627871 () Bool)

(assert (=> b!655240 m!627871))

(declare-fun m!627873 () Bool)

(assert (=> b!655258 m!627873))

(declare-fun m!627875 () Bool)

(assert (=> b!655243 m!627875))

(assert (=> b!655243 m!627829))

(declare-fun m!627877 () Bool)

(assert (=> b!655243 m!627877))

(declare-fun m!627879 () Bool)

(assert (=> b!655243 m!627879))

(assert (=> b!655243 m!627829))

(declare-fun m!627881 () Bool)

(assert (=> b!655243 m!627881))

(assert (=> b!655243 m!627853))

(assert (=> b!655243 m!627829))

(assert (=> b!655243 m!627849))

(assert (=> b!655243 m!627829))

(declare-fun m!627883 () Bool)

(assert (=> b!655243 m!627883))

(assert (=> b!655243 m!627829))

(declare-fun m!627885 () Bool)

(assert (=> b!655243 m!627885))

(assert (=> b!655252 m!627829))

(assert (=> b!655252 m!627829))

(assert (=> b!655252 m!627881))

(assert (=> b!655239 m!627829))

(assert (=> b!655239 m!627829))

(declare-fun m!627887 () Bool)

(assert (=> b!655239 m!627887))

(assert (=> b!655244 m!627831))

(declare-fun m!627889 () Bool)

(assert (=> b!655244 m!627889))

(assert (=> b!655244 m!627829))

(declare-fun m!627891 () Bool)

(assert (=> b!655250 m!627891))

(declare-fun m!627893 () Bool)

(assert (=> b!655245 m!627893))

(check-sat (not b!655247) (not b!655256) (not b!655248) (not b!655246) (not b!655250) (not b!655251) (not b!655252) (not start!59348) (not b!655239) (not b!655255) (not b!655257) (not b!655245) (not b!655240) (not b!655243))
(check-sat)
