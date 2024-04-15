; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55560 () Bool)

(assert start!55560)

(declare-fun b!608240 () Bool)

(declare-fun e!348325 () Bool)

(declare-fun e!348317 () Bool)

(assert (=> b!608240 (= e!348325 e!348317)))

(declare-fun res!391049 () Bool)

(assert (=> b!608240 (=> res!391049 e!348317)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37305 0))(
  ( (array!37306 (arr!17903 (Array (_ BitVec 32) (_ BitVec 64))) (size!18268 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37305)

(declare-fun lt!277780 () (_ BitVec 64))

(declare-fun lt!277770 () (_ BitVec 64))

(assert (=> b!608240 (= res!391049 (or (not (= (select (arr!17903 a!2986) j!136) lt!277780)) (not (= (select (arr!17903 a!2986) j!136) lt!277770))))))

(declare-fun e!348319 () Bool)

(assert (=> b!608240 e!348319))

(declare-fun res!391054 () Bool)

(assert (=> b!608240 (=> (not res!391054) (not e!348319))))

(assert (=> b!608240 (= res!391054 (= lt!277770 (select (arr!17903 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!608240 (= lt!277770 (select (store (arr!17903 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!608241 () Bool)

(declare-fun res!391062 () Bool)

(declare-fun e!348320 () Bool)

(assert (=> b!608241 (=> (not res!391062) (not e!348320))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37305 (_ BitVec 32)) Bool)

(assert (=> b!608241 (= res!391062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!608243 () Bool)

(declare-fun res!391056 () Bool)

(declare-fun e!348315 () Bool)

(assert (=> b!608243 (=> res!391056 e!348315)))

(declare-datatypes ((List!11983 0))(
  ( (Nil!11980) (Cons!11979 (h!13024 (_ BitVec 64)) (t!18202 List!11983)) )
))
(declare-fun noDuplicate!332 (List!11983) Bool)

(assert (=> b!608243 (= res!391056 (not (noDuplicate!332 Nil!11980)))))

(declare-fun b!608244 () Bool)

(assert (=> b!608244 (= e!348315 true)))

(declare-fun lt!277769 () Bool)

(declare-fun contains!3005 (List!11983 (_ BitVec 64)) Bool)

(assert (=> b!608244 (= lt!277769 (contains!3005 Nil!11980 k0!1786))))

(declare-fun b!608245 () Bool)

(declare-fun e!348323 () Bool)

(assert (=> b!608245 (= e!348320 e!348323)))

(declare-fun res!391052 () Bool)

(assert (=> b!608245 (=> (not res!391052) (not e!348323))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!608245 (= res!391052 (= (select (store (arr!17903 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!277777 () array!37305)

(assert (=> b!608245 (= lt!277777 (array!37306 (store (arr!17903 a!2986) i!1108 k0!1786) (size!18268 a!2986)))))

(declare-fun b!608246 () Bool)

(declare-fun e!348314 () Bool)

(assert (=> b!608246 (= e!348314 (not e!348325))))

(declare-fun res!391061 () Bool)

(assert (=> b!608246 (=> res!391061 e!348325)))

(declare-datatypes ((SeekEntryResult!6340 0))(
  ( (MissingZero!6340 (index!27635 (_ BitVec 32))) (Found!6340 (index!27636 (_ BitVec 32))) (Intermediate!6340 (undefined!7152 Bool) (index!27637 (_ BitVec 32)) (x!56452 (_ BitVec 32))) (Undefined!6340) (MissingVacant!6340 (index!27638 (_ BitVec 32))) )
))
(declare-fun lt!277764 () SeekEntryResult!6340)

(assert (=> b!608246 (= res!391061 (not (= lt!277764 (Found!6340 index!984))))))

(declare-datatypes ((Unit!19422 0))(
  ( (Unit!19423) )
))
(declare-fun lt!277774 () Unit!19422)

(declare-fun e!348316 () Unit!19422)

(assert (=> b!608246 (= lt!277774 e!348316)))

(declare-fun c!68967 () Bool)

(assert (=> b!608246 (= c!68967 (= lt!277764 Undefined!6340))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37305 (_ BitVec 32)) SeekEntryResult!6340)

(assert (=> b!608246 (= lt!277764 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277780 lt!277777 mask!3053))))

(declare-fun e!348321 () Bool)

(assert (=> b!608246 e!348321))

(declare-fun res!391059 () Bool)

(assert (=> b!608246 (=> (not res!391059) (not e!348321))))

(declare-fun lt!277767 () SeekEntryResult!6340)

(declare-fun lt!277771 () (_ BitVec 32))

(assert (=> b!608246 (= res!391059 (= lt!277767 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277771 vacantSpotIndex!68 lt!277780 lt!277777 mask!3053)))))

(assert (=> b!608246 (= lt!277767 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277771 vacantSpotIndex!68 (select (arr!17903 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!608246 (= lt!277780 (select (store (arr!17903 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!277775 () Unit!19422)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37305 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19422)

(assert (=> b!608246 (= lt!277775 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277771 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!608246 (= lt!277771 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!608247 () Bool)

(declare-fun res!391053 () Bool)

(assert (=> b!608247 (=> res!391053 e!348315)))

(assert (=> b!608247 (= res!391053 (contains!3005 Nil!11980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608248 () Bool)

(declare-fun res!391044 () Bool)

(declare-fun e!348324 () Bool)

(assert (=> b!608248 (=> (not res!391044) (not e!348324))))

(assert (=> b!608248 (= res!391044 (and (= (size!18268 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18268 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18268 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!608249 () Bool)

(declare-fun res!391063 () Bool)

(assert (=> b!608249 (=> (not res!391063) (not e!348324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!608249 (= res!391063 (validKeyInArray!0 (select (arr!17903 a!2986) j!136)))))

(declare-fun res!391043 () Bool)

(assert (=> start!55560 (=> (not res!391043) (not e!348324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55560 (= res!391043 (validMask!0 mask!3053))))

(assert (=> start!55560 e!348324))

(assert (=> start!55560 true))

(declare-fun array_inv!13786 (array!37305) Bool)

(assert (=> start!55560 (array_inv!13786 a!2986)))

(declare-fun b!608242 () Bool)

(declare-fun res!391048 () Bool)

(assert (=> b!608242 (=> (not res!391048) (not e!348320))))

(declare-fun arrayNoDuplicates!0 (array!37305 (_ BitVec 32) List!11983) Bool)

(assert (=> b!608242 (= res!391048 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11980))))

(declare-fun b!608250 () Bool)

(declare-fun e!348327 () Unit!19422)

(declare-fun Unit!19424 () Unit!19422)

(assert (=> b!608250 (= e!348327 Unit!19424)))

(declare-fun b!608251 () Bool)

(declare-fun res!391060 () Bool)

(assert (=> b!608251 (=> res!391060 e!348315)))

(assert (=> b!608251 (= res!391060 (contains!3005 Nil!11980 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!608252 () Bool)

(declare-fun res!391064 () Bool)

(assert (=> b!608252 (=> (not res!391064) (not e!348320))))

(assert (=> b!608252 (= res!391064 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17903 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!348313 () Bool)

(declare-fun b!608253 () Bool)

(declare-fun arrayContainsKey!0 (array!37305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!608253 (= e!348313 (arrayContainsKey!0 lt!277777 (select (arr!17903 a!2986) j!136) index!984))))

(declare-fun b!608254 () Bool)

(declare-fun e!348322 () Bool)

(assert (=> b!608254 (= e!348319 e!348322)))

(declare-fun res!391045 () Bool)

(assert (=> b!608254 (=> res!391045 e!348322)))

(assert (=> b!608254 (= res!391045 (or (not (= (select (arr!17903 a!2986) j!136) lt!277780)) (not (= (select (arr!17903 a!2986) j!136) lt!277770)) (bvsge j!136 index!984)))))

(declare-fun b!608255 () Bool)

(assert (=> b!608255 (= e!348323 e!348314)))

(declare-fun res!391055 () Bool)

(assert (=> b!608255 (=> (not res!391055) (not e!348314))))

(declare-fun lt!277778 () SeekEntryResult!6340)

(assert (=> b!608255 (= res!391055 (and (= lt!277778 (Found!6340 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17903 a!2986) index!984) (select (arr!17903 a!2986) j!136))) (not (= (select (arr!17903 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!608255 (= lt!277778 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17903 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!608256 () Bool)

(declare-fun e!348326 () Bool)

(assert (=> b!608256 (= e!348317 e!348326)))

(declare-fun res!391051 () Bool)

(assert (=> b!608256 (=> res!391051 e!348326)))

(assert (=> b!608256 (= res!391051 (bvsge index!984 j!136))))

(declare-fun lt!277766 () Unit!19422)

(assert (=> b!608256 (= lt!277766 e!348327)))

(declare-fun c!68966 () Bool)

(assert (=> b!608256 (= c!68966 (bvslt j!136 index!984))))

(declare-fun b!608257 () Bool)

(declare-fun Unit!19425 () Unit!19422)

(assert (=> b!608257 (= e!348316 Unit!19425)))

(declare-fun b!608258 () Bool)

(assert (=> b!608258 (= e!348322 e!348313)))

(declare-fun res!391047 () Bool)

(assert (=> b!608258 (=> (not res!391047) (not e!348313))))

(assert (=> b!608258 (= res!391047 (arrayContainsKey!0 lt!277777 (select (arr!17903 a!2986) j!136) j!136))))

(declare-fun b!608259 () Bool)

(declare-fun e!348312 () Bool)

(assert (=> b!608259 (= e!348312 (arrayContainsKey!0 lt!277777 (select (arr!17903 a!2986) j!136) index!984))))

(declare-fun b!608260 () Bool)

(declare-fun Unit!19426 () Unit!19422)

(assert (=> b!608260 (= e!348316 Unit!19426)))

(assert (=> b!608260 false))

(declare-fun b!608261 () Bool)

(declare-fun res!391042 () Bool)

(assert (=> b!608261 (=> (not res!391042) (not e!348324))))

(assert (=> b!608261 (= res!391042 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!608262 () Bool)

(assert (=> b!608262 (= e!348326 e!348315)))

(declare-fun res!391057 () Bool)

(assert (=> b!608262 (=> res!391057 e!348315)))

(assert (=> b!608262 (= res!391057 (or (bvsge (size!18268 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18268 a!2986))))))

(assert (=> b!608262 (arrayContainsKey!0 lt!277777 (select (arr!17903 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277779 () Unit!19422)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37305 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19422)

(assert (=> b!608262 (= lt!277779 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277777 (select (arr!17903 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!608262 e!348312))

(declare-fun res!391050 () Bool)

(assert (=> b!608262 (=> (not res!391050) (not e!348312))))

(assert (=> b!608262 (= res!391050 (arrayContainsKey!0 lt!277777 (select (arr!17903 a!2986) j!136) j!136))))

(declare-fun b!608263 () Bool)

(assert (=> b!608263 (= e!348324 e!348320)))

(declare-fun res!391058 () Bool)

(assert (=> b!608263 (=> (not res!391058) (not e!348320))))

(declare-fun lt!277776 () SeekEntryResult!6340)

(assert (=> b!608263 (= res!391058 (or (= lt!277776 (MissingZero!6340 i!1108)) (= lt!277776 (MissingVacant!6340 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37305 (_ BitVec 32)) SeekEntryResult!6340)

(assert (=> b!608263 (= lt!277776 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!608264 () Bool)

(assert (=> b!608264 (= e!348321 (= lt!277778 lt!277767))))

(declare-fun b!608265 () Bool)

(declare-fun Unit!19427 () Unit!19422)

(assert (=> b!608265 (= e!348327 Unit!19427)))

(declare-fun lt!277765 () Unit!19422)

(assert (=> b!608265 (= lt!277765 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277777 (select (arr!17903 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!608265 (arrayContainsKey!0 lt!277777 (select (arr!17903 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277773 () Unit!19422)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37305 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11983) Unit!19422)

(assert (=> b!608265 (= lt!277773 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11980))))

(assert (=> b!608265 (arrayNoDuplicates!0 lt!277777 #b00000000000000000000000000000000 Nil!11980)))

(declare-fun lt!277772 () Unit!19422)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37305 (_ BitVec 32) (_ BitVec 32)) Unit!19422)

(assert (=> b!608265 (= lt!277772 (lemmaNoDuplicateFromThenFromBigger!0 lt!277777 #b00000000000000000000000000000000 j!136))))

(assert (=> b!608265 (arrayNoDuplicates!0 lt!277777 j!136 Nil!11980)))

(declare-fun lt!277768 () Unit!19422)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37305 (_ BitVec 64) (_ BitVec 32) List!11983) Unit!19422)

(assert (=> b!608265 (= lt!277768 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277777 (select (arr!17903 a!2986) j!136) j!136 Nil!11980))))

(assert (=> b!608265 false))

(declare-fun b!608266 () Bool)

(declare-fun res!391046 () Bool)

(assert (=> b!608266 (=> (not res!391046) (not e!348324))))

(assert (=> b!608266 (= res!391046 (validKeyInArray!0 k0!1786))))

(assert (= (and start!55560 res!391043) b!608248))

(assert (= (and b!608248 res!391044) b!608249))

(assert (= (and b!608249 res!391063) b!608266))

(assert (= (and b!608266 res!391046) b!608261))

(assert (= (and b!608261 res!391042) b!608263))

(assert (= (and b!608263 res!391058) b!608241))

(assert (= (and b!608241 res!391062) b!608242))

(assert (= (and b!608242 res!391048) b!608252))

(assert (= (and b!608252 res!391064) b!608245))

(assert (= (and b!608245 res!391052) b!608255))

(assert (= (and b!608255 res!391055) b!608246))

(assert (= (and b!608246 res!391059) b!608264))

(assert (= (and b!608246 c!68967) b!608260))

(assert (= (and b!608246 (not c!68967)) b!608257))

(assert (= (and b!608246 (not res!391061)) b!608240))

(assert (= (and b!608240 res!391054) b!608254))

(assert (= (and b!608254 (not res!391045)) b!608258))

(assert (= (and b!608258 res!391047) b!608253))

(assert (= (and b!608240 (not res!391049)) b!608256))

(assert (= (and b!608256 c!68966) b!608265))

(assert (= (and b!608256 (not c!68966)) b!608250))

(assert (= (and b!608256 (not res!391051)) b!608262))

(assert (= (and b!608262 res!391050) b!608259))

(assert (= (and b!608262 (not res!391057)) b!608243))

(assert (= (and b!608243 (not res!391056)) b!608247))

(assert (= (and b!608247 (not res!391053)) b!608251))

(assert (= (and b!608251 (not res!391060)) b!608244))

(declare-fun m!584359 () Bool)

(assert (=> b!608242 m!584359))

(declare-fun m!584361 () Bool)

(assert (=> start!55560 m!584361))

(declare-fun m!584363 () Bool)

(assert (=> start!55560 m!584363))

(declare-fun m!584365 () Bool)

(assert (=> b!608245 m!584365))

(declare-fun m!584367 () Bool)

(assert (=> b!608245 m!584367))

(declare-fun m!584369 () Bool)

(assert (=> b!608254 m!584369))

(declare-fun m!584371 () Bool)

(assert (=> b!608266 m!584371))

(assert (=> b!608259 m!584369))

(assert (=> b!608259 m!584369))

(declare-fun m!584373 () Bool)

(assert (=> b!608259 m!584373))

(declare-fun m!584375 () Bool)

(assert (=> b!608265 m!584375))

(assert (=> b!608265 m!584369))

(declare-fun m!584377 () Bool)

(assert (=> b!608265 m!584377))

(assert (=> b!608265 m!584369))

(declare-fun m!584379 () Bool)

(assert (=> b!608265 m!584379))

(declare-fun m!584381 () Bool)

(assert (=> b!608265 m!584381))

(assert (=> b!608265 m!584369))

(declare-fun m!584383 () Bool)

(assert (=> b!608265 m!584383))

(assert (=> b!608265 m!584369))

(declare-fun m!584385 () Bool)

(assert (=> b!608265 m!584385))

(declare-fun m!584387 () Bool)

(assert (=> b!608265 m!584387))

(declare-fun m!584389 () Bool)

(assert (=> b!608246 m!584389))

(assert (=> b!608246 m!584369))

(declare-fun m!584391 () Bool)

(assert (=> b!608246 m!584391))

(declare-fun m!584393 () Bool)

(assert (=> b!608246 m!584393))

(declare-fun m!584395 () Bool)

(assert (=> b!608246 m!584395))

(declare-fun m!584397 () Bool)

(assert (=> b!608246 m!584397))

(assert (=> b!608246 m!584365))

(assert (=> b!608246 m!584369))

(declare-fun m!584399 () Bool)

(assert (=> b!608246 m!584399))

(declare-fun m!584401 () Bool)

(assert (=> b!608244 m!584401))

(assert (=> b!608262 m!584369))

(assert (=> b!608262 m!584369))

(declare-fun m!584403 () Bool)

(assert (=> b!608262 m!584403))

(assert (=> b!608262 m!584369))

(declare-fun m!584405 () Bool)

(assert (=> b!608262 m!584405))

(assert (=> b!608262 m!584369))

(declare-fun m!584407 () Bool)

(assert (=> b!608262 m!584407))

(assert (=> b!608249 m!584369))

(assert (=> b!608249 m!584369))

(declare-fun m!584409 () Bool)

(assert (=> b!608249 m!584409))

(declare-fun m!584411 () Bool)

(assert (=> b!608263 m!584411))

(assert (=> b!608253 m!584369))

(assert (=> b!608253 m!584369))

(assert (=> b!608253 m!584373))

(assert (=> b!608240 m!584369))

(assert (=> b!608240 m!584365))

(declare-fun m!584413 () Bool)

(assert (=> b!608240 m!584413))

(declare-fun m!584415 () Bool)

(assert (=> b!608252 m!584415))

(declare-fun m!584417 () Bool)

(assert (=> b!608255 m!584417))

(assert (=> b!608255 m!584369))

(assert (=> b!608255 m!584369))

(declare-fun m!584419 () Bool)

(assert (=> b!608255 m!584419))

(declare-fun m!584421 () Bool)

(assert (=> b!608261 m!584421))

(declare-fun m!584423 () Bool)

(assert (=> b!608241 m!584423))

(declare-fun m!584425 () Bool)

(assert (=> b!608247 m!584425))

(declare-fun m!584427 () Bool)

(assert (=> b!608251 m!584427))

(declare-fun m!584429 () Bool)

(assert (=> b!608243 m!584429))

(assert (=> b!608258 m!584369))

(assert (=> b!608258 m!584369))

(assert (=> b!608258 m!584407))

(check-sat (not b!608246) (not b!608259) (not b!608253) (not b!608241) (not b!608263) (not b!608242) (not b!608247) (not b!608255) (not start!55560) (not b!608266) (not b!608258) (not b!608261) (not b!608262) (not b!608243) (not b!608251) (not b!608244) (not b!608265) (not b!608249))
(check-sat)
