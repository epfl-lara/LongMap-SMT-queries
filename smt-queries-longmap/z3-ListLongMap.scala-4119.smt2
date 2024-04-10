; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56214 () Bool)

(assert start!56214)

(declare-fun b!623217 () Bool)

(declare-fun e!357467 () Bool)

(declare-fun e!357479 () Bool)

(assert (=> b!623217 (= e!357467 e!357479)))

(declare-fun res!401655 () Bool)

(assert (=> b!623217 (=> (not res!401655) (not e!357479))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6528 0))(
  ( (MissingZero!6528 (index!28396 (_ BitVec 32))) (Found!6528 (index!28397 (_ BitVec 32))) (Intermediate!6528 (undefined!7340 Bool) (index!28398 (_ BitVec 32)) (x!57160 (_ BitVec 32))) (Undefined!6528) (MissingVacant!6528 (index!28399 (_ BitVec 32))) )
))
(declare-fun lt!289045 () SeekEntryResult!6528)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37684 0))(
  ( (array!37685 (arr!18088 (Array (_ BitVec 32) (_ BitVec 64))) (size!18452 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37684)

(assert (=> b!623217 (= res!401655 (and (= lt!289045 (Found!6528 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18088 a!2986) index!984) (select (arr!18088 a!2986) j!136))) (not (= (select (arr!18088 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37684 (_ BitVec 32)) SeekEntryResult!6528)

(assert (=> b!623217 (= lt!289045 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18088 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!623218 () Bool)

(declare-fun e!357468 () Bool)

(declare-fun e!357477 () Bool)

(assert (=> b!623218 (= e!357468 e!357477)))

(declare-fun res!401658 () Bool)

(assert (=> b!623218 (=> (not res!401658) (not e!357477))))

(declare-fun lt!289041 () SeekEntryResult!6528)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!623218 (= res!401658 (or (= lt!289041 (MissingZero!6528 i!1108)) (= lt!289041 (MissingVacant!6528 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37684 (_ BitVec 32)) SeekEntryResult!6528)

(assert (=> b!623218 (= lt!289041 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!623219 () Bool)

(declare-fun res!401663 () Bool)

(assert (=> b!623219 (=> (not res!401663) (not e!357477))))

(assert (=> b!623219 (= res!401663 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18088 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!623220 () Bool)

(declare-datatypes ((Unit!21008 0))(
  ( (Unit!21009) )
))
(declare-fun e!357473 () Unit!21008)

(declare-fun Unit!21010 () Unit!21008)

(assert (=> b!623220 (= e!357473 Unit!21010)))

(declare-fun b!623221 () Bool)

(declare-fun res!401659 () Bool)

(assert (=> b!623221 (=> (not res!401659) (not e!357468))))

(assert (=> b!623221 (= res!401659 (and (= (size!18452 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18452 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18452 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!623222 () Bool)

(declare-fun res!401660 () Bool)

(assert (=> b!623222 (= res!401660 (bvsge j!136 index!984))))

(declare-fun e!357480 () Bool)

(assert (=> b!623222 (=> res!401660 e!357480)))

(declare-fun e!357471 () Bool)

(assert (=> b!623222 (= e!357471 e!357480)))

(declare-fun b!623223 () Bool)

(declare-fun e!357478 () Bool)

(declare-fun lt!289057 () SeekEntryResult!6528)

(assert (=> b!623223 (= e!357478 (= lt!289045 lt!289057))))

(declare-fun b!623224 () Bool)

(declare-fun res!401651 () Bool)

(assert (=> b!623224 (=> (not res!401651) (not e!357477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37684 (_ BitVec 32)) Bool)

(assert (=> b!623224 (= res!401651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!623225 () Bool)

(declare-fun res!401662 () Bool)

(assert (=> b!623225 (=> (not res!401662) (not e!357477))))

(declare-datatypes ((List!12129 0))(
  ( (Nil!12126) (Cons!12125 (h!13170 (_ BitVec 64)) (t!18357 List!12129)) )
))
(declare-fun arrayNoDuplicates!0 (array!37684 (_ BitVec 32) List!12129) Bool)

(assert (=> b!623225 (= res!401662 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12126))))

(declare-fun b!623226 () Bool)

(assert (=> b!623226 (= e!357479 (not true))))

(declare-fun lt!289055 () Unit!21008)

(assert (=> b!623226 (= lt!289055 e!357473)))

(declare-fun c!71150 () Bool)

(declare-fun lt!289053 () SeekEntryResult!6528)

(assert (=> b!623226 (= c!71150 (= lt!289053 (Found!6528 index!984)))))

(declare-fun lt!289047 () Unit!21008)

(declare-fun e!357469 () Unit!21008)

(assert (=> b!623226 (= lt!289047 e!357469)))

(declare-fun c!71151 () Bool)

(assert (=> b!623226 (= c!71151 (= lt!289053 Undefined!6528))))

(declare-fun lt!289048 () (_ BitVec 64))

(declare-fun lt!289056 () array!37684)

(assert (=> b!623226 (= lt!289053 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!289048 lt!289056 mask!3053))))

(assert (=> b!623226 e!357478))

(declare-fun res!401652 () Bool)

(assert (=> b!623226 (=> (not res!401652) (not e!357478))))

(declare-fun lt!289044 () (_ BitVec 32))

(assert (=> b!623226 (= res!401652 (= lt!289057 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289044 vacantSpotIndex!68 lt!289048 lt!289056 mask!3053)))))

(assert (=> b!623226 (= lt!289057 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!289044 vacantSpotIndex!68 (select (arr!18088 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!623226 (= lt!289048 (select (store (arr!18088 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!289039 () Unit!21008)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37684 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21008)

(assert (=> b!623226 (= lt!289039 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!289044 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!623226 (= lt!289044 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!623227 () Bool)

(assert (=> b!623227 false))

(declare-fun lt!289054 () Unit!21008)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37684 (_ BitVec 64) (_ BitVec 32) List!12129) Unit!21008)

(assert (=> b!623227 (= lt!289054 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!289056 (select (arr!18088 a!2986) j!136) j!136 Nil!12126))))

(assert (=> b!623227 (arrayNoDuplicates!0 lt!289056 j!136 Nil!12126)))

(declare-fun lt!289042 () Unit!21008)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37684 (_ BitVec 32) (_ BitVec 32)) Unit!21008)

(assert (=> b!623227 (= lt!289042 (lemmaNoDuplicateFromThenFromBigger!0 lt!289056 #b00000000000000000000000000000000 j!136))))

(assert (=> b!623227 (arrayNoDuplicates!0 lt!289056 #b00000000000000000000000000000000 Nil!12126)))

(declare-fun lt!289049 () Unit!21008)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37684 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12129) Unit!21008)

(assert (=> b!623227 (= lt!289049 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12126))))

(declare-fun arrayContainsKey!0 (array!37684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!623227 (arrayContainsKey!0 lt!289056 (select (arr!18088 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!289052 () Unit!21008)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37684 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21008)

(assert (=> b!623227 (= lt!289052 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!289056 (select (arr!18088 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!357475 () Unit!21008)

(declare-fun Unit!21011 () Unit!21008)

(assert (=> b!623227 (= e!357475 Unit!21011)))

(declare-fun b!623228 () Bool)

(declare-fun Unit!21012 () Unit!21008)

(assert (=> b!623228 (= e!357473 Unit!21012)))

(declare-fun res!401661 () Bool)

(assert (=> b!623228 (= res!401661 (= (select (store (arr!18088 a!2986) i!1108 k0!1786) index!984) (select (arr!18088 a!2986) j!136)))))

(assert (=> b!623228 (=> (not res!401661) (not e!357471))))

(assert (=> b!623228 e!357471))

(declare-fun c!71153 () Bool)

(assert (=> b!623228 (= c!71153 (bvslt j!136 index!984))))

(declare-fun lt!289046 () Unit!21008)

(assert (=> b!623228 (= lt!289046 e!357475)))

(declare-fun c!71152 () Bool)

(assert (=> b!623228 (= c!71152 (bvslt index!984 j!136))))

(declare-fun lt!289043 () Unit!21008)

(declare-fun e!357470 () Unit!21008)

(assert (=> b!623228 (= lt!289043 e!357470)))

(assert (=> b!623228 false))

(declare-fun b!623230 () Bool)

(declare-fun e!357472 () Bool)

(assert (=> b!623230 (= e!357472 (arrayContainsKey!0 lt!289056 (select (arr!18088 a!2986) j!136) index!984))))

(declare-fun b!623231 () Bool)

(declare-fun res!401656 () Bool)

(assert (=> b!623231 (=> (not res!401656) (not e!357468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!623231 (= res!401656 (validKeyInArray!0 k0!1786))))

(declare-fun b!623232 () Bool)

(declare-fun Unit!21013 () Unit!21008)

(assert (=> b!623232 (= e!357475 Unit!21013)))

(declare-fun b!623233 () Bool)

(declare-fun res!401657 () Bool)

(assert (=> b!623233 (=> (not res!401657) (not e!357468))))

(assert (=> b!623233 (= res!401657 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!623234 () Bool)

(declare-fun Unit!21014 () Unit!21008)

(assert (=> b!623234 (= e!357469 Unit!21014)))

(declare-fun e!357474 () Bool)

(declare-fun b!623235 () Bool)

(assert (=> b!623235 (= e!357474 (arrayContainsKey!0 lt!289056 (select (arr!18088 a!2986) j!136) index!984))))

(declare-fun b!623236 () Bool)

(declare-fun Unit!21015 () Unit!21008)

(assert (=> b!623236 (= e!357470 Unit!21015)))

(declare-fun b!623237 () Bool)

(declare-fun Unit!21016 () Unit!21008)

(assert (=> b!623237 (= e!357469 Unit!21016)))

(assert (=> b!623237 false))

(declare-fun b!623238 () Bool)

(declare-fun res!401664 () Bool)

(assert (=> b!623238 (= res!401664 (arrayContainsKey!0 lt!289056 (select (arr!18088 a!2986) j!136) j!136))))

(assert (=> b!623238 (=> (not res!401664) (not e!357472))))

(assert (=> b!623238 (= e!357480 e!357472)))

(declare-fun b!623239 () Bool)

(declare-fun res!401665 () Bool)

(assert (=> b!623239 (=> (not res!401665) (not e!357468))))

(assert (=> b!623239 (= res!401665 (validKeyInArray!0 (select (arr!18088 a!2986) j!136)))))

(declare-fun b!623240 () Bool)

(assert (=> b!623240 false))

(declare-fun lt!289040 () Unit!21008)

(assert (=> b!623240 (= lt!289040 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!289056 (select (arr!18088 a!2986) j!136) index!984 Nil!12126))))

(assert (=> b!623240 (arrayNoDuplicates!0 lt!289056 index!984 Nil!12126)))

(declare-fun lt!289050 () Unit!21008)

(assert (=> b!623240 (= lt!289050 (lemmaNoDuplicateFromThenFromBigger!0 lt!289056 #b00000000000000000000000000000000 index!984))))

(assert (=> b!623240 (arrayNoDuplicates!0 lt!289056 #b00000000000000000000000000000000 Nil!12126)))

(declare-fun lt!289038 () Unit!21008)

(assert (=> b!623240 (= lt!289038 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12126))))

(assert (=> b!623240 (arrayContainsKey!0 lt!289056 (select (arr!18088 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!289051 () Unit!21008)

(assert (=> b!623240 (= lt!289051 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!289056 (select (arr!18088 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!623240 e!357474))

(declare-fun res!401653 () Bool)

(assert (=> b!623240 (=> (not res!401653) (not e!357474))))

(assert (=> b!623240 (= res!401653 (arrayContainsKey!0 lt!289056 (select (arr!18088 a!2986) j!136) j!136))))

(declare-fun Unit!21017 () Unit!21008)

(assert (=> b!623240 (= e!357470 Unit!21017)))

(declare-fun b!623229 () Bool)

(assert (=> b!623229 (= e!357477 e!357467)))

(declare-fun res!401666 () Bool)

(assert (=> b!623229 (=> (not res!401666) (not e!357467))))

(assert (=> b!623229 (= res!401666 (= (select (store (arr!18088 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!623229 (= lt!289056 (array!37685 (store (arr!18088 a!2986) i!1108 k0!1786) (size!18452 a!2986)))))

(declare-fun res!401654 () Bool)

(assert (=> start!56214 (=> (not res!401654) (not e!357468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56214 (= res!401654 (validMask!0 mask!3053))))

(assert (=> start!56214 e!357468))

(assert (=> start!56214 true))

(declare-fun array_inv!13884 (array!37684) Bool)

(assert (=> start!56214 (array_inv!13884 a!2986)))

(assert (= (and start!56214 res!401654) b!623221))

(assert (= (and b!623221 res!401659) b!623239))

(assert (= (and b!623239 res!401665) b!623231))

(assert (= (and b!623231 res!401656) b!623233))

(assert (= (and b!623233 res!401657) b!623218))

(assert (= (and b!623218 res!401658) b!623224))

(assert (= (and b!623224 res!401651) b!623225))

(assert (= (and b!623225 res!401662) b!623219))

(assert (= (and b!623219 res!401663) b!623229))

(assert (= (and b!623229 res!401666) b!623217))

(assert (= (and b!623217 res!401655) b!623226))

(assert (= (and b!623226 res!401652) b!623223))

(assert (= (and b!623226 c!71151) b!623237))

(assert (= (and b!623226 (not c!71151)) b!623234))

(assert (= (and b!623226 c!71150) b!623228))

(assert (= (and b!623226 (not c!71150)) b!623220))

(assert (= (and b!623228 res!401661) b!623222))

(assert (= (and b!623222 (not res!401660)) b!623238))

(assert (= (and b!623238 res!401664) b!623230))

(assert (= (and b!623228 c!71153) b!623227))

(assert (= (and b!623228 (not c!71153)) b!623232))

(assert (= (and b!623228 c!71152) b!623240))

(assert (= (and b!623228 (not c!71152)) b!623236))

(assert (= (and b!623240 res!401653) b!623235))

(declare-fun m!599061 () Bool)

(assert (=> b!623229 m!599061))

(declare-fun m!599063 () Bool)

(assert (=> b!623229 m!599063))

(assert (=> b!623228 m!599061))

(declare-fun m!599065 () Bool)

(assert (=> b!623228 m!599065))

(declare-fun m!599067 () Bool)

(assert (=> b!623228 m!599067))

(declare-fun m!599069 () Bool)

(assert (=> b!623225 m!599069))

(declare-fun m!599071 () Bool)

(assert (=> b!623233 m!599071))

(assert (=> b!623230 m!599067))

(assert (=> b!623230 m!599067))

(declare-fun m!599073 () Bool)

(assert (=> b!623230 m!599073))

(declare-fun m!599075 () Bool)

(assert (=> b!623219 m!599075))

(declare-fun m!599077 () Bool)

(assert (=> b!623217 m!599077))

(assert (=> b!623217 m!599067))

(assert (=> b!623217 m!599067))

(declare-fun m!599079 () Bool)

(assert (=> b!623217 m!599079))

(assert (=> b!623239 m!599067))

(assert (=> b!623239 m!599067))

(declare-fun m!599081 () Bool)

(assert (=> b!623239 m!599081))

(declare-fun m!599083 () Bool)

(assert (=> b!623218 m!599083))

(assert (=> b!623238 m!599067))

(assert (=> b!623238 m!599067))

(declare-fun m!599085 () Bool)

(assert (=> b!623238 m!599085))

(assert (=> b!623235 m!599067))

(assert (=> b!623235 m!599067))

(assert (=> b!623235 m!599073))

(declare-fun m!599087 () Bool)

(assert (=> b!623231 m!599087))

(declare-fun m!599089 () Bool)

(assert (=> b!623227 m!599089))

(assert (=> b!623227 m!599067))

(declare-fun m!599091 () Bool)

(assert (=> b!623227 m!599091))

(assert (=> b!623227 m!599067))

(declare-fun m!599093 () Bool)

(assert (=> b!623227 m!599093))

(declare-fun m!599095 () Bool)

(assert (=> b!623227 m!599095))

(declare-fun m!599097 () Bool)

(assert (=> b!623227 m!599097))

(assert (=> b!623227 m!599067))

(declare-fun m!599099 () Bool)

(assert (=> b!623227 m!599099))

(assert (=> b!623227 m!599067))

(declare-fun m!599101 () Bool)

(assert (=> b!623227 m!599101))

(declare-fun m!599103 () Bool)

(assert (=> b!623240 m!599103))

(assert (=> b!623240 m!599067))

(assert (=> b!623240 m!599067))

(declare-fun m!599105 () Bool)

(assert (=> b!623240 m!599105))

(assert (=> b!623240 m!599067))

(declare-fun m!599107 () Bool)

(assert (=> b!623240 m!599107))

(assert (=> b!623240 m!599095))

(assert (=> b!623240 m!599067))

(assert (=> b!623240 m!599085))

(declare-fun m!599109 () Bool)

(assert (=> b!623240 m!599109))

(assert (=> b!623240 m!599067))

(declare-fun m!599111 () Bool)

(assert (=> b!623240 m!599111))

(assert (=> b!623240 m!599097))

(declare-fun m!599113 () Bool)

(assert (=> b!623226 m!599113))

(declare-fun m!599115 () Bool)

(assert (=> b!623226 m!599115))

(declare-fun m!599117 () Bool)

(assert (=> b!623226 m!599117))

(assert (=> b!623226 m!599067))

(assert (=> b!623226 m!599061))

(declare-fun m!599119 () Bool)

(assert (=> b!623226 m!599119))

(assert (=> b!623226 m!599067))

(declare-fun m!599121 () Bool)

(assert (=> b!623226 m!599121))

(declare-fun m!599123 () Bool)

(assert (=> b!623226 m!599123))

(declare-fun m!599125 () Bool)

(assert (=> start!56214 m!599125))

(declare-fun m!599127 () Bool)

(assert (=> start!56214 m!599127))

(declare-fun m!599129 () Bool)

(assert (=> b!623224 m!599129))

(check-sat (not b!623224) (not b!623218) (not b!623238) (not b!623240) (not b!623226) (not b!623235) (not b!623233) (not b!623230) (not b!623231) (not b!623225) (not b!623227) (not b!623217) (not b!623239) (not start!56214))
(check-sat)
