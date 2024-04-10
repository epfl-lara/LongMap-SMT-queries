; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56106 () Bool)

(assert start!56106)

(declare-fun e!355181 () Bool)

(declare-datatypes ((array!37576 0))(
  ( (array!37577 (arr!18034 (Array (_ BitVec 32) (_ BitVec 64))) (size!18398 (_ BitVec 32))) )
))
(declare-fun lt!285810 () array!37576)

(declare-fun b!619298 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37576)

(declare-fun arrayContainsKey!0 (array!37576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!619298 (= e!355181 (arrayContainsKey!0 lt!285810 (select (arr!18034 a!2986) j!136) index!984))))

(declare-fun b!619299 () Bool)

(declare-fun res!399029 () Bool)

(assert (=> b!619299 (= res!399029 (bvsge j!136 index!984))))

(declare-fun e!355177 () Bool)

(assert (=> b!619299 (=> res!399029 e!355177)))

(declare-fun e!355169 () Bool)

(assert (=> b!619299 (= e!355169 e!355177)))

(declare-fun b!619300 () Bool)

(assert (=> b!619300 false))

(declare-datatypes ((Unit!20468 0))(
  ( (Unit!20469) )
))
(declare-fun lt!285812 () Unit!20468)

(declare-datatypes ((List!12075 0))(
  ( (Nil!12072) (Cons!12071 (h!13116 (_ BitVec 64)) (t!18303 List!12075)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37576 (_ BitVec 64) (_ BitVec 32) List!12075) Unit!20468)

(assert (=> b!619300 (= lt!285812 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285810 (select (arr!18034 a!2986) j!136) j!136 Nil!12072))))

(declare-fun arrayNoDuplicates!0 (array!37576 (_ BitVec 32) List!12075) Bool)

(assert (=> b!619300 (arrayNoDuplicates!0 lt!285810 j!136 Nil!12072)))

(declare-fun lt!285806 () Unit!20468)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37576 (_ BitVec 32) (_ BitVec 32)) Unit!20468)

(assert (=> b!619300 (= lt!285806 (lemmaNoDuplicateFromThenFromBigger!0 lt!285810 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619300 (arrayNoDuplicates!0 lt!285810 #b00000000000000000000000000000000 Nil!12072)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!285800 () Unit!20468)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37576 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12075) Unit!20468)

(assert (=> b!619300 (= lt!285800 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12072))))

(assert (=> b!619300 (arrayContainsKey!0 lt!285810 (select (arr!18034 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285817 () Unit!20468)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37576 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20468)

(assert (=> b!619300 (= lt!285817 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285810 (select (arr!18034 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!355173 () Unit!20468)

(declare-fun Unit!20470 () Unit!20468)

(assert (=> b!619300 (= e!355173 Unit!20470)))

(declare-fun e!355170 () Bool)

(declare-fun b!619301 () Bool)

(assert (=> b!619301 (= e!355170 (arrayContainsKey!0 lt!285810 (select (arr!18034 a!2986) j!136) index!984))))

(declare-fun b!619302 () Bool)

(declare-fun e!355168 () Bool)

(declare-fun e!355176 () Bool)

(assert (=> b!619302 (= e!355168 e!355176)))

(declare-fun res!399041 () Bool)

(assert (=> b!619302 (=> (not res!399041) (not e!355176))))

(declare-datatypes ((SeekEntryResult!6474 0))(
  ( (MissingZero!6474 (index!28180 (_ BitVec 32))) (Found!6474 (index!28181 (_ BitVec 32))) (Intermediate!6474 (undefined!7286 Bool) (index!28182 (_ BitVec 32)) (x!56962 (_ BitVec 32))) (Undefined!6474) (MissingVacant!6474 (index!28183 (_ BitVec 32))) )
))
(declare-fun lt!285809 () SeekEntryResult!6474)

(assert (=> b!619302 (= res!399041 (or (= lt!285809 (MissingZero!6474 i!1108)) (= lt!285809 (MissingVacant!6474 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37576 (_ BitVec 32)) SeekEntryResult!6474)

(assert (=> b!619302 (= lt!285809 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!619303 () Bool)

(declare-fun e!355171 () Unit!20468)

(declare-fun Unit!20471 () Unit!20468)

(assert (=> b!619303 (= e!355171 Unit!20471)))

(declare-fun b!619304 () Bool)

(declare-fun e!355179 () Bool)

(declare-fun lt!285801 () SeekEntryResult!6474)

(declare-fun lt!285807 () SeekEntryResult!6474)

(assert (=> b!619304 (= e!355179 (= lt!285801 lt!285807))))

(declare-fun b!619305 () Bool)

(declare-fun Unit!20472 () Unit!20468)

(assert (=> b!619305 (= e!355171 Unit!20472)))

(assert (=> b!619305 false))

(declare-fun b!619306 () Bool)

(declare-fun res!399036 () Bool)

(assert (=> b!619306 (=> (not res!399036) (not e!355168))))

(assert (=> b!619306 (= res!399036 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619307 () Bool)

(declare-fun e!355172 () Bool)

(assert (=> b!619307 (= e!355176 e!355172)))

(declare-fun res!399035 () Bool)

(assert (=> b!619307 (=> (not res!399035) (not e!355172))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!619307 (= res!399035 (= (select (store (arr!18034 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619307 (= lt!285810 (array!37577 (store (arr!18034 a!2986) i!1108 k0!1786) (size!18398 a!2986)))))

(declare-fun b!619308 () Bool)

(declare-fun e!355182 () Bool)

(declare-fun e!355178 () Bool)

(assert (=> b!619308 (= e!355182 (not e!355178))))

(declare-fun res!399039 () Bool)

(assert (=> b!619308 (=> res!399039 e!355178)))

(declare-fun lt!285813 () SeekEntryResult!6474)

(assert (=> b!619308 (= res!399039 (not (= lt!285813 (MissingVacant!6474 vacantSpotIndex!68))))))

(declare-fun lt!285798 () Unit!20468)

(declare-fun e!355180 () Unit!20468)

(assert (=> b!619308 (= lt!285798 e!355180)))

(declare-fun c!70505 () Bool)

(assert (=> b!619308 (= c!70505 (= lt!285813 (Found!6474 index!984)))))

(declare-fun lt!285802 () Unit!20468)

(assert (=> b!619308 (= lt!285802 e!355171)))

(declare-fun c!70502 () Bool)

(assert (=> b!619308 (= c!70502 (= lt!285813 Undefined!6474))))

(declare-fun lt!285811 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37576 (_ BitVec 32)) SeekEntryResult!6474)

(assert (=> b!619308 (= lt!285813 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285811 lt!285810 mask!3053))))

(assert (=> b!619308 e!355179))

(declare-fun res!399043 () Bool)

(assert (=> b!619308 (=> (not res!399043) (not e!355179))))

(declare-fun lt!285816 () (_ BitVec 32))

(assert (=> b!619308 (= res!399043 (= lt!285807 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285816 vacantSpotIndex!68 lt!285811 lt!285810 mask!3053)))))

(assert (=> b!619308 (= lt!285807 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285816 vacantSpotIndex!68 (select (arr!18034 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!619308 (= lt!285811 (select (store (arr!18034 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!285804 () Unit!20468)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37576 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20468)

(assert (=> b!619308 (= lt!285804 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285816 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!619308 (= lt!285816 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!619309 () Bool)

(declare-fun Unit!20473 () Unit!20468)

(assert (=> b!619309 (= e!355180 Unit!20473)))

(declare-fun res!399033 () Bool)

(assert (=> b!619309 (= res!399033 (= (select (store (arr!18034 a!2986) i!1108 k0!1786) index!984) (select (arr!18034 a!2986) j!136)))))

(assert (=> b!619309 (=> (not res!399033) (not e!355169))))

(assert (=> b!619309 e!355169))

(declare-fun c!70503 () Bool)

(assert (=> b!619309 (= c!70503 (bvslt j!136 index!984))))

(declare-fun lt!285814 () Unit!20468)

(assert (=> b!619309 (= lt!285814 e!355173)))

(declare-fun c!70504 () Bool)

(assert (=> b!619309 (= c!70504 (bvslt index!984 j!136))))

(declare-fun lt!285803 () Unit!20468)

(declare-fun e!355175 () Unit!20468)

(assert (=> b!619309 (= lt!285803 e!355175)))

(assert (=> b!619309 false))

(declare-fun b!619310 () Bool)

(declare-fun Unit!20474 () Unit!20468)

(assert (=> b!619310 (= e!355180 Unit!20474)))

(declare-fun b!619311 () Bool)

(declare-fun Unit!20475 () Unit!20468)

(assert (=> b!619311 (= e!355173 Unit!20475)))

(declare-fun b!619312 () Bool)

(assert (=> b!619312 (= e!355172 e!355182)))

(declare-fun res!399042 () Bool)

(assert (=> b!619312 (=> (not res!399042) (not e!355182))))

(assert (=> b!619312 (= res!399042 (and (= lt!285801 (Found!6474 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18034 a!2986) index!984) (select (arr!18034 a!2986) j!136))) (not (= (select (arr!18034 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!619312 (= lt!285801 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18034 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!399032 () Bool)

(declare-fun b!619313 () Bool)

(assert (=> b!619313 (= res!399032 (arrayContainsKey!0 lt!285810 (select (arr!18034 a!2986) j!136) j!136))))

(assert (=> b!619313 (=> (not res!399032) (not e!355170))))

(assert (=> b!619313 (= e!355177 e!355170)))

(declare-fun b!619314 () Bool)

(assert (=> b!619314 (= e!355178 true)))

(assert (=> b!619314 (= (select (store (arr!18034 a!2986) i!1108 k0!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619315 () Bool)

(declare-fun res!399038 () Bool)

(assert (=> b!619315 (=> (not res!399038) (not e!355168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619315 (= res!399038 (validKeyInArray!0 k0!1786))))

(declare-fun b!619316 () Bool)

(declare-fun res!399028 () Bool)

(assert (=> b!619316 (=> (not res!399028) (not e!355176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37576 (_ BitVec 32)) Bool)

(assert (=> b!619316 (= res!399028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619317 () Bool)

(declare-fun res!399034 () Bool)

(assert (=> b!619317 (=> (not res!399034) (not e!355168))))

(assert (=> b!619317 (= res!399034 (validKeyInArray!0 (select (arr!18034 a!2986) j!136)))))

(declare-fun b!619318 () Bool)

(assert (=> b!619318 false))

(declare-fun lt!285808 () Unit!20468)

(assert (=> b!619318 (= lt!285808 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285810 (select (arr!18034 a!2986) j!136) index!984 Nil!12072))))

(assert (=> b!619318 (arrayNoDuplicates!0 lt!285810 index!984 Nil!12072)))

(declare-fun lt!285805 () Unit!20468)

(assert (=> b!619318 (= lt!285805 (lemmaNoDuplicateFromThenFromBigger!0 lt!285810 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619318 (arrayNoDuplicates!0 lt!285810 #b00000000000000000000000000000000 Nil!12072)))

(declare-fun lt!285799 () Unit!20468)

(assert (=> b!619318 (= lt!285799 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12072))))

(assert (=> b!619318 (arrayContainsKey!0 lt!285810 (select (arr!18034 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285815 () Unit!20468)

(assert (=> b!619318 (= lt!285815 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285810 (select (arr!18034 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!619318 e!355181))

(declare-fun res!399030 () Bool)

(assert (=> b!619318 (=> (not res!399030) (not e!355181))))

(assert (=> b!619318 (= res!399030 (arrayContainsKey!0 lt!285810 (select (arr!18034 a!2986) j!136) j!136))))

(declare-fun Unit!20476 () Unit!20468)

(assert (=> b!619318 (= e!355175 Unit!20476)))

(declare-fun b!619319 () Bool)

(declare-fun res!399044 () Bool)

(assert (=> b!619319 (=> (not res!399044) (not e!355176))))

(assert (=> b!619319 (= res!399044 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18034 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619320 () Bool)

(declare-fun Unit!20477 () Unit!20468)

(assert (=> b!619320 (= e!355175 Unit!20477)))

(declare-fun res!399037 () Bool)

(assert (=> start!56106 (=> (not res!399037) (not e!355168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56106 (= res!399037 (validMask!0 mask!3053))))

(assert (=> start!56106 e!355168))

(assert (=> start!56106 true))

(declare-fun array_inv!13830 (array!37576) Bool)

(assert (=> start!56106 (array_inv!13830 a!2986)))

(declare-fun b!619321 () Bool)

(declare-fun res!399031 () Bool)

(assert (=> b!619321 (=> (not res!399031) (not e!355168))))

(assert (=> b!619321 (= res!399031 (and (= (size!18398 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18398 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18398 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619322 () Bool)

(declare-fun res!399040 () Bool)

(assert (=> b!619322 (=> (not res!399040) (not e!355176))))

(assert (=> b!619322 (= res!399040 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12072))))

(assert (= (and start!56106 res!399037) b!619321))

(assert (= (and b!619321 res!399031) b!619317))

(assert (= (and b!619317 res!399034) b!619315))

(assert (= (and b!619315 res!399038) b!619306))

(assert (= (and b!619306 res!399036) b!619302))

(assert (= (and b!619302 res!399041) b!619316))

(assert (= (and b!619316 res!399028) b!619322))

(assert (= (and b!619322 res!399040) b!619319))

(assert (= (and b!619319 res!399044) b!619307))

(assert (= (and b!619307 res!399035) b!619312))

(assert (= (and b!619312 res!399042) b!619308))

(assert (= (and b!619308 res!399043) b!619304))

(assert (= (and b!619308 c!70502) b!619305))

(assert (= (and b!619308 (not c!70502)) b!619303))

(assert (= (and b!619308 c!70505) b!619309))

(assert (= (and b!619308 (not c!70505)) b!619310))

(assert (= (and b!619309 res!399033) b!619299))

(assert (= (and b!619299 (not res!399029)) b!619313))

(assert (= (and b!619313 res!399032) b!619301))

(assert (= (and b!619309 c!70503) b!619300))

(assert (= (and b!619309 (not c!70503)) b!619311))

(assert (= (and b!619309 c!70504) b!619318))

(assert (= (and b!619309 (not c!70504)) b!619320))

(assert (= (and b!619318 res!399030) b!619298))

(assert (= (and b!619308 (not res!399039)) b!619314))

(declare-fun m!595281 () Bool)

(assert (=> b!619314 m!595281))

(declare-fun m!595283 () Bool)

(assert (=> b!619314 m!595283))

(declare-fun m!595285 () Bool)

(assert (=> b!619316 m!595285))

(declare-fun m!595287 () Bool)

(assert (=> b!619308 m!595287))

(declare-fun m!595289 () Bool)

(assert (=> b!619308 m!595289))

(declare-fun m!595291 () Bool)

(assert (=> b!619308 m!595291))

(declare-fun m!595293 () Bool)

(assert (=> b!619308 m!595293))

(assert (=> b!619308 m!595289))

(assert (=> b!619308 m!595281))

(declare-fun m!595295 () Bool)

(assert (=> b!619308 m!595295))

(declare-fun m!595297 () Bool)

(assert (=> b!619308 m!595297))

(declare-fun m!595299 () Bool)

(assert (=> b!619308 m!595299))

(assert (=> b!619298 m!595289))

(assert (=> b!619298 m!595289))

(declare-fun m!595301 () Bool)

(assert (=> b!619298 m!595301))

(assert (=> b!619318 m!595289))

(assert (=> b!619318 m!595289))

(declare-fun m!595303 () Bool)

(assert (=> b!619318 m!595303))

(declare-fun m!595305 () Bool)

(assert (=> b!619318 m!595305))

(declare-fun m!595307 () Bool)

(assert (=> b!619318 m!595307))

(assert (=> b!619318 m!595289))

(declare-fun m!595309 () Bool)

(assert (=> b!619318 m!595309))

(declare-fun m!595311 () Bool)

(assert (=> b!619318 m!595311))

(declare-fun m!595313 () Bool)

(assert (=> b!619318 m!595313))

(assert (=> b!619318 m!595289))

(declare-fun m!595315 () Bool)

(assert (=> b!619318 m!595315))

(assert (=> b!619318 m!595289))

(declare-fun m!595317 () Bool)

(assert (=> b!619318 m!595317))

(declare-fun m!595319 () Bool)

(assert (=> b!619315 m!595319))

(declare-fun m!595321 () Bool)

(assert (=> b!619312 m!595321))

(assert (=> b!619312 m!595289))

(assert (=> b!619312 m!595289))

(declare-fun m!595323 () Bool)

(assert (=> b!619312 m!595323))

(declare-fun m!595325 () Bool)

(assert (=> b!619300 m!595325))

(assert (=> b!619300 m!595289))

(assert (=> b!619300 m!595289))

(declare-fun m!595327 () Bool)

(assert (=> b!619300 m!595327))

(assert (=> b!619300 m!595289))

(declare-fun m!595329 () Bool)

(assert (=> b!619300 m!595329))

(assert (=> b!619300 m!595305))

(declare-fun m!595331 () Bool)

(assert (=> b!619300 m!595331))

(assert (=> b!619300 m!595289))

(declare-fun m!595333 () Bool)

(assert (=> b!619300 m!595333))

(assert (=> b!619300 m!595313))

(declare-fun m!595335 () Bool)

(assert (=> start!56106 m!595335))

(declare-fun m!595337 () Bool)

(assert (=> start!56106 m!595337))

(declare-fun m!595339 () Bool)

(assert (=> b!619306 m!595339))

(assert (=> b!619313 m!595289))

(assert (=> b!619313 m!595289))

(assert (=> b!619313 m!595317))

(assert (=> b!619301 m!595289))

(assert (=> b!619301 m!595289))

(assert (=> b!619301 m!595301))

(declare-fun m!595341 () Bool)

(assert (=> b!619322 m!595341))

(assert (=> b!619307 m!595281))

(declare-fun m!595343 () Bool)

(assert (=> b!619307 m!595343))

(assert (=> b!619309 m!595281))

(assert (=> b!619309 m!595283))

(assert (=> b!619309 m!595289))

(declare-fun m!595345 () Bool)

(assert (=> b!619302 m!595345))

(declare-fun m!595347 () Bool)

(assert (=> b!619319 m!595347))

(assert (=> b!619317 m!595289))

(assert (=> b!619317 m!595289))

(declare-fun m!595349 () Bool)

(assert (=> b!619317 m!595349))

(check-sat (not b!619317) (not b!619298) (not b!619318) (not b!619315) (not b!619301) (not b!619300) (not b!619312) (not b!619306) (not start!56106) (not b!619308) (not b!619313) (not b!619316) (not b!619322) (not b!619302))
(check-sat)
