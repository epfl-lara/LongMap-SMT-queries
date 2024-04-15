; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55536 () Bool)

(assert start!55536)

(declare-fun b!607268 () Bool)

(declare-fun res!390214 () Bool)

(declare-fun e!347739 () Bool)

(assert (=> b!607268 (=> res!390214 e!347739)))

(declare-datatypes ((List!11971 0))(
  ( (Nil!11968) (Cons!11967 (h!13012 (_ BitVec 64)) (t!18190 List!11971)) )
))
(declare-fun contains!2993 (List!11971 (_ BitVec 64)) Bool)

(assert (=> b!607268 (= res!390214 (contains!2993 Nil!11968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607269 () Bool)

(declare-fun res!390228 () Bool)

(declare-fun e!347742 () Bool)

(assert (=> b!607269 (=> (not res!390228) (not e!347742))))

(declare-datatypes ((array!37281 0))(
  ( (array!37282 (arr!17891 (Array (_ BitVec 32) (_ BitVec 64))) (size!18256 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37281)

(declare-fun arrayNoDuplicates!0 (array!37281 (_ BitVec 32) List!11971) Bool)

(assert (=> b!607269 (= res!390228 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11968))))

(declare-fun b!607270 () Bool)

(declare-fun e!347748 () Bool)

(declare-fun e!347745 () Bool)

(assert (=> b!607270 (= e!347748 e!347745)))

(declare-fun res!390220 () Bool)

(assert (=> b!607270 (=> (not res!390220) (not e!347745))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6328 0))(
  ( (MissingZero!6328 (index!27587 (_ BitVec 32))) (Found!6328 (index!27588 (_ BitVec 32))) (Intermediate!6328 (undefined!7140 Bool) (index!27589 (_ BitVec 32)) (x!56408 (_ BitVec 32))) (Undefined!6328) (MissingVacant!6328 (index!27590 (_ BitVec 32))) )
))
(declare-fun lt!277163 () SeekEntryResult!6328)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!607270 (= res!390220 (and (= lt!277163 (Found!6328 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17891 a!2986) index!984) (select (arr!17891 a!2986) j!136))) (not (= (select (arr!17891 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37281 (_ BitVec 32)) SeekEntryResult!6328)

(assert (=> b!607270 (= lt!277163 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17891 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607271 () Bool)

(declare-fun e!347750 () Bool)

(declare-fun e!347737 () Bool)

(assert (=> b!607271 (= e!347750 e!347737)))

(declare-fun res!390216 () Bool)

(assert (=> b!607271 (=> res!390216 e!347737)))

(declare-fun lt!277154 () (_ BitVec 64))

(declare-fun lt!277164 () (_ BitVec 64))

(assert (=> b!607271 (= res!390216 (or (not (= (select (arr!17891 a!2986) j!136) lt!277154)) (not (= (select (arr!17891 a!2986) j!136) lt!277164)) (bvsge j!136 index!984)))))

(declare-fun b!607272 () Bool)

(declare-fun res!390218 () Bool)

(assert (=> b!607272 (=> res!390218 e!347739)))

(declare-fun noDuplicate!320 (List!11971) Bool)

(assert (=> b!607272 (= res!390218 (not (noDuplicate!320 Nil!11968)))))

(declare-fun b!607273 () Bool)

(declare-fun e!347740 () Bool)

(declare-fun e!347743 () Bool)

(assert (=> b!607273 (= e!347740 e!347743)))

(declare-fun res!390219 () Bool)

(assert (=> b!607273 (=> res!390219 e!347743)))

(assert (=> b!607273 (= res!390219 (or (not (= (select (arr!17891 a!2986) j!136) lt!277154)) (not (= (select (arr!17891 a!2986) j!136) lt!277164))))))

(assert (=> b!607273 e!347750))

(declare-fun res!390215 () Bool)

(assert (=> b!607273 (=> (not res!390215) (not e!347750))))

(assert (=> b!607273 (= res!390215 (= lt!277164 (select (arr!17891 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!607273 (= lt!277164 (select (store (arr!17891 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!607274 () Bool)

(assert (=> b!607274 (= e!347739 true)))

(declare-fun lt!277168 () Bool)

(assert (=> b!607274 (= lt!277168 (contains!2993 Nil!11968 k0!1786))))

(declare-fun res!390230 () Bool)

(declare-fun e!347749 () Bool)

(assert (=> start!55536 (=> (not res!390230) (not e!347749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55536 (= res!390230 (validMask!0 mask!3053))))

(assert (=> start!55536 e!347749))

(assert (=> start!55536 true))

(declare-fun array_inv!13774 (array!37281) Bool)

(assert (=> start!55536 (array_inv!13774 a!2986)))

(declare-fun lt!277155 () array!37281)

(declare-fun e!347746 () Bool)

(declare-fun b!607275 () Bool)

(declare-fun arrayContainsKey!0 (array!37281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607275 (= e!347746 (arrayContainsKey!0 lt!277155 (select (arr!17891 a!2986) j!136) index!984))))

(declare-fun b!607276 () Bool)

(declare-fun e!347751 () Bool)

(assert (=> b!607276 (= e!347743 e!347751)))

(declare-fun res!390235 () Bool)

(assert (=> b!607276 (=> res!390235 e!347751)))

(assert (=> b!607276 (= res!390235 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19350 0))(
  ( (Unit!19351) )
))
(declare-fun lt!277152 () Unit!19350)

(declare-fun e!347741 () Unit!19350)

(assert (=> b!607276 (= lt!277152 e!347741)))

(declare-fun c!68894 () Bool)

(assert (=> b!607276 (= c!68894 (bvslt j!136 index!984))))

(declare-fun b!607277 () Bool)

(assert (=> b!607277 (= e!347742 e!347748)))

(declare-fun res!390226 () Bool)

(assert (=> b!607277 (=> (not res!390226) (not e!347748))))

(assert (=> b!607277 (= res!390226 (= (select (store (arr!17891 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!607277 (= lt!277155 (array!37282 (store (arr!17891 a!2986) i!1108 k0!1786) (size!18256 a!2986)))))

(declare-fun b!607278 () Bool)

(assert (=> b!607278 (= e!347745 (not e!347740))))

(declare-fun res!390221 () Bool)

(assert (=> b!607278 (=> res!390221 e!347740)))

(declare-fun lt!277157 () SeekEntryResult!6328)

(assert (=> b!607278 (= res!390221 (not (= lt!277157 (Found!6328 index!984))))))

(declare-fun lt!277159 () Unit!19350)

(declare-fun e!347738 () Unit!19350)

(assert (=> b!607278 (= lt!277159 e!347738)))

(declare-fun c!68895 () Bool)

(assert (=> b!607278 (= c!68895 (= lt!277157 Undefined!6328))))

(assert (=> b!607278 (= lt!277157 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277154 lt!277155 mask!3053))))

(declare-fun e!347744 () Bool)

(assert (=> b!607278 e!347744))

(declare-fun res!390217 () Bool)

(assert (=> b!607278 (=> (not res!390217) (not e!347744))))

(declare-fun lt!277160 () (_ BitVec 32))

(declare-fun lt!277158 () SeekEntryResult!6328)

(assert (=> b!607278 (= res!390217 (= lt!277158 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277160 vacantSpotIndex!68 lt!277154 lt!277155 mask!3053)))))

(assert (=> b!607278 (= lt!277158 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277160 vacantSpotIndex!68 (select (arr!17891 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!607278 (= lt!277154 (select (store (arr!17891 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277156 () Unit!19350)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19350)

(assert (=> b!607278 (= lt!277156 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277160 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607278 (= lt!277160 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!607279 () Bool)

(declare-fun e!347736 () Bool)

(assert (=> b!607279 (= e!347737 e!347736)))

(declare-fun res!390223 () Bool)

(assert (=> b!607279 (=> (not res!390223) (not e!347736))))

(assert (=> b!607279 (= res!390223 (arrayContainsKey!0 lt!277155 (select (arr!17891 a!2986) j!136) j!136))))

(declare-fun b!607280 () Bool)

(declare-fun Unit!19352 () Unit!19350)

(assert (=> b!607280 (= e!347741 Unit!19352)))

(declare-fun lt!277167 () Unit!19350)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37281 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19350)

(assert (=> b!607280 (= lt!277167 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277155 (select (arr!17891 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607280 (arrayContainsKey!0 lt!277155 (select (arr!17891 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277166 () Unit!19350)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37281 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11971) Unit!19350)

(assert (=> b!607280 (= lt!277166 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11968))))

(assert (=> b!607280 (arrayNoDuplicates!0 lt!277155 #b00000000000000000000000000000000 Nil!11968)))

(declare-fun lt!277153 () Unit!19350)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37281 (_ BitVec 32) (_ BitVec 32)) Unit!19350)

(assert (=> b!607280 (= lt!277153 (lemmaNoDuplicateFromThenFromBigger!0 lt!277155 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607280 (arrayNoDuplicates!0 lt!277155 j!136 Nil!11968)))

(declare-fun lt!277162 () Unit!19350)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37281 (_ BitVec 64) (_ BitVec 32) List!11971) Unit!19350)

(assert (=> b!607280 (= lt!277162 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277155 (select (arr!17891 a!2986) j!136) j!136 Nil!11968))))

(assert (=> b!607280 false))

(declare-fun b!607281 () Bool)

(declare-fun res!390227 () Bool)

(assert (=> b!607281 (=> (not res!390227) (not e!347742))))

(assert (=> b!607281 (= res!390227 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17891 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607282 () Bool)

(declare-fun Unit!19353 () Unit!19350)

(assert (=> b!607282 (= e!347741 Unit!19353)))

(declare-fun b!607283 () Bool)

(declare-fun res!390234 () Bool)

(assert (=> b!607283 (=> res!390234 e!347739)))

(assert (=> b!607283 (= res!390234 (contains!2993 Nil!11968 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607284 () Bool)

(declare-fun res!390229 () Bool)

(assert (=> b!607284 (=> (not res!390229) (not e!347749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607284 (= res!390229 (validKeyInArray!0 k0!1786))))

(declare-fun b!607285 () Bool)

(assert (=> b!607285 (= e!347744 (= lt!277163 lt!277158))))

(declare-fun b!607286 () Bool)

(declare-fun res!390231 () Bool)

(assert (=> b!607286 (=> (not res!390231) (not e!347749))))

(assert (=> b!607286 (= res!390231 (and (= (size!18256 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18256 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18256 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!607287 () Bool)

(assert (=> b!607287 (= e!347749 e!347742)))

(declare-fun res!390222 () Bool)

(assert (=> b!607287 (=> (not res!390222) (not e!347742))))

(declare-fun lt!277161 () SeekEntryResult!6328)

(assert (=> b!607287 (= res!390222 (or (= lt!277161 (MissingZero!6328 i!1108)) (= lt!277161 (MissingVacant!6328 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37281 (_ BitVec 32)) SeekEntryResult!6328)

(assert (=> b!607287 (= lt!277161 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!607288 () Bool)

(declare-fun res!390233 () Bool)

(assert (=> b!607288 (=> (not res!390233) (not e!347742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37281 (_ BitVec 32)) Bool)

(assert (=> b!607288 (= res!390233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607289 () Bool)

(declare-fun res!390225 () Bool)

(assert (=> b!607289 (=> (not res!390225) (not e!347749))))

(assert (=> b!607289 (= res!390225 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!607290 () Bool)

(declare-fun res!390236 () Bool)

(assert (=> b!607290 (=> (not res!390236) (not e!347749))))

(assert (=> b!607290 (= res!390236 (validKeyInArray!0 (select (arr!17891 a!2986) j!136)))))

(declare-fun b!607291 () Bool)

(assert (=> b!607291 (= e!347736 (arrayContainsKey!0 lt!277155 (select (arr!17891 a!2986) j!136) index!984))))

(declare-fun b!607292 () Bool)

(declare-fun Unit!19354 () Unit!19350)

(assert (=> b!607292 (= e!347738 Unit!19354)))

(declare-fun b!607293 () Bool)

(declare-fun Unit!19355 () Unit!19350)

(assert (=> b!607293 (= e!347738 Unit!19355)))

(assert (=> b!607293 false))

(declare-fun b!607294 () Bool)

(assert (=> b!607294 (= e!347751 e!347739)))

(declare-fun res!390232 () Bool)

(assert (=> b!607294 (=> res!390232 e!347739)))

(assert (=> b!607294 (= res!390232 (or (bvsge (size!18256 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18256 a!2986))))))

(assert (=> b!607294 (arrayContainsKey!0 lt!277155 (select (arr!17891 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277165 () Unit!19350)

(assert (=> b!607294 (= lt!277165 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277155 (select (arr!17891 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!607294 e!347746))

(declare-fun res!390224 () Bool)

(assert (=> b!607294 (=> (not res!390224) (not e!347746))))

(assert (=> b!607294 (= res!390224 (arrayContainsKey!0 lt!277155 (select (arr!17891 a!2986) j!136) j!136))))

(assert (= (and start!55536 res!390230) b!607286))

(assert (= (and b!607286 res!390231) b!607290))

(assert (= (and b!607290 res!390236) b!607284))

(assert (= (and b!607284 res!390229) b!607289))

(assert (= (and b!607289 res!390225) b!607287))

(assert (= (and b!607287 res!390222) b!607288))

(assert (= (and b!607288 res!390233) b!607269))

(assert (= (and b!607269 res!390228) b!607281))

(assert (= (and b!607281 res!390227) b!607277))

(assert (= (and b!607277 res!390226) b!607270))

(assert (= (and b!607270 res!390220) b!607278))

(assert (= (and b!607278 res!390217) b!607285))

(assert (= (and b!607278 c!68895) b!607293))

(assert (= (and b!607278 (not c!68895)) b!607292))

(assert (= (and b!607278 (not res!390221)) b!607273))

(assert (= (and b!607273 res!390215) b!607271))

(assert (= (and b!607271 (not res!390216)) b!607279))

(assert (= (and b!607279 res!390223) b!607291))

(assert (= (and b!607273 (not res!390219)) b!607276))

(assert (= (and b!607276 c!68894) b!607280))

(assert (= (and b!607276 (not c!68894)) b!607282))

(assert (= (and b!607276 (not res!390235)) b!607294))

(assert (= (and b!607294 res!390224) b!607275))

(assert (= (and b!607294 (not res!390232)) b!607272))

(assert (= (and b!607272 (not res!390218)) b!607268))

(assert (= (and b!607268 (not res!390214)) b!607283))

(assert (= (and b!607283 (not res!390234)) b!607274))

(declare-fun m!583495 () Bool)

(assert (=> b!607280 m!583495))

(declare-fun m!583497 () Bool)

(assert (=> b!607280 m!583497))

(assert (=> b!607280 m!583495))

(declare-fun m!583499 () Bool)

(assert (=> b!607280 m!583499))

(assert (=> b!607280 m!583495))

(declare-fun m!583501 () Bool)

(assert (=> b!607280 m!583501))

(declare-fun m!583503 () Bool)

(assert (=> b!607280 m!583503))

(assert (=> b!607280 m!583495))

(declare-fun m!583505 () Bool)

(assert (=> b!607280 m!583505))

(declare-fun m!583507 () Bool)

(assert (=> b!607280 m!583507))

(declare-fun m!583509 () Bool)

(assert (=> b!607280 m!583509))

(declare-fun m!583511 () Bool)

(assert (=> b!607270 m!583511))

(assert (=> b!607270 m!583495))

(assert (=> b!607270 m!583495))

(declare-fun m!583513 () Bool)

(assert (=> b!607270 m!583513))

(assert (=> b!607294 m!583495))

(assert (=> b!607294 m!583495))

(declare-fun m!583515 () Bool)

(assert (=> b!607294 m!583515))

(assert (=> b!607294 m!583495))

(declare-fun m!583517 () Bool)

(assert (=> b!607294 m!583517))

(assert (=> b!607294 m!583495))

(declare-fun m!583519 () Bool)

(assert (=> b!607294 m!583519))

(assert (=> b!607275 m!583495))

(assert (=> b!607275 m!583495))

(declare-fun m!583521 () Bool)

(assert (=> b!607275 m!583521))

(declare-fun m!583523 () Bool)

(assert (=> b!607274 m!583523))

(declare-fun m!583525 () Bool)

(assert (=> b!607272 m!583525))

(declare-fun m!583527 () Bool)

(assert (=> b!607287 m!583527))

(assert (=> b!607290 m!583495))

(assert (=> b!607290 m!583495))

(declare-fun m!583529 () Bool)

(assert (=> b!607290 m!583529))

(declare-fun m!583531 () Bool)

(assert (=> b!607277 m!583531))

(declare-fun m!583533 () Bool)

(assert (=> b!607277 m!583533))

(declare-fun m!583535 () Bool)

(assert (=> b!607284 m!583535))

(declare-fun m!583537 () Bool)

(assert (=> start!55536 m!583537))

(declare-fun m!583539 () Bool)

(assert (=> start!55536 m!583539))

(declare-fun m!583541 () Bool)

(assert (=> b!607269 m!583541))

(declare-fun m!583543 () Bool)

(assert (=> b!607289 m!583543))

(declare-fun m!583545 () Bool)

(assert (=> b!607283 m!583545))

(declare-fun m!583547 () Bool)

(assert (=> b!607281 m!583547))

(declare-fun m!583549 () Bool)

(assert (=> b!607288 m!583549))

(assert (=> b!607279 m!583495))

(assert (=> b!607279 m!583495))

(assert (=> b!607279 m!583519))

(assert (=> b!607273 m!583495))

(assert (=> b!607273 m!583531))

(declare-fun m!583551 () Bool)

(assert (=> b!607273 m!583551))

(assert (=> b!607271 m!583495))

(declare-fun m!583553 () Bool)

(assert (=> b!607278 m!583553))

(declare-fun m!583555 () Bool)

(assert (=> b!607278 m!583555))

(assert (=> b!607278 m!583495))

(declare-fun m!583557 () Bool)

(assert (=> b!607278 m!583557))

(assert (=> b!607278 m!583531))

(assert (=> b!607278 m!583495))

(declare-fun m!583559 () Bool)

(assert (=> b!607278 m!583559))

(declare-fun m!583561 () Bool)

(assert (=> b!607278 m!583561))

(declare-fun m!583563 () Bool)

(assert (=> b!607278 m!583563))

(declare-fun m!583565 () Bool)

(assert (=> b!607268 m!583565))

(assert (=> b!607291 m!583495))

(assert (=> b!607291 m!583495))

(assert (=> b!607291 m!583521))

(check-sat (not b!607283) (not b!607289) (not b!607288) (not b!607294) (not b!607290) (not b!607278) (not b!607280) (not b!607275) (not b!607284) (not b!607291) (not b!607272) (not b!607274) (not b!607270) (not start!55536) (not b!607269) (not b!607287) (not b!607279) (not b!607268))
(check-sat)
