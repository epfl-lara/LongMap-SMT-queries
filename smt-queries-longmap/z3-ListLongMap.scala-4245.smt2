; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58844 () Bool)

(assert start!58844)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!648352 () Bool)

(declare-fun e!371852 () Bool)

(declare-datatypes ((array!38517 0))(
  ( (array!38518 (arr!18464 (Array (_ BitVec 32) (_ BitVec 64))) (size!18829 (_ BitVec 32))) )
))
(declare-fun lt!300826 () array!38517)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38517)

(declare-fun arrayContainsKey!0 (array!38517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648352 (= e!371852 (arrayContainsKey!0 lt!300826 (select (arr!18464 a!2986) j!136) index!984))))

(declare-fun b!648353 () Bool)

(declare-datatypes ((Unit!22034 0))(
  ( (Unit!22035) )
))
(declare-fun e!371850 () Unit!22034)

(declare-fun Unit!22036 () Unit!22034)

(assert (=> b!648353 (= e!371850 Unit!22036)))

(assert (=> b!648353 false))

(declare-fun b!648354 () Bool)

(declare-fun e!371855 () Unit!22034)

(declare-fun Unit!22037 () Unit!22034)

(assert (=> b!648354 (= e!371855 Unit!22037)))

(declare-fun lt!300823 () Unit!22034)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38517 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22034)

(assert (=> b!648354 (= lt!300823 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300826 (select (arr!18464 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!648354 (arrayContainsKey!0 lt!300826 (select (arr!18464 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!300828 () Unit!22034)

(declare-datatypes ((List!12544 0))(
  ( (Nil!12541) (Cons!12540 (h!13585 (_ BitVec 64)) (t!18763 List!12544)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38517 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12544) Unit!22034)

(assert (=> b!648354 (= lt!300828 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12541))))

(declare-fun arrayNoDuplicates!0 (array!38517 (_ BitVec 32) List!12544) Bool)

(assert (=> b!648354 (arrayNoDuplicates!0 lt!300826 #b00000000000000000000000000000000 Nil!12541)))

(declare-fun lt!300818 () Unit!22034)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38517 (_ BitVec 32) (_ BitVec 32)) Unit!22034)

(assert (=> b!648354 (= lt!300818 (lemmaNoDuplicateFromThenFromBigger!0 lt!300826 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648354 (arrayNoDuplicates!0 lt!300826 j!136 Nil!12541)))

(declare-fun lt!300821 () Unit!22034)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38517 (_ BitVec 64) (_ BitVec 32) List!12544) Unit!22034)

(assert (=> b!648354 (= lt!300821 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!300826 (select (arr!18464 a!2986) j!136) j!136 Nil!12541))))

(assert (=> b!648354 false))

(declare-fun b!648355 () Bool)

(declare-fun res!420140 () Bool)

(declare-fun e!371848 () Bool)

(assert (=> b!648355 (=> res!420140 e!371848)))

(declare-fun contains!3145 (List!12544 (_ BitVec 64)) Bool)

(assert (=> b!648355 (= res!420140 (contains!3145 Nil!12541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648356 () Bool)

(declare-fun e!371844 () Bool)

(declare-fun e!371843 () Bool)

(assert (=> b!648356 (= e!371844 e!371843)))

(declare-fun res!420130 () Bool)

(assert (=> b!648356 (=> (not res!420130) (not e!371843))))

(declare-datatypes ((SeekEntryResult!6901 0))(
  ( (MissingZero!6901 (index!29951 (_ BitVec 32))) (Found!6901 (index!29952 (_ BitVec 32))) (Intermediate!6901 (undefined!7713 Bool) (index!29953 (_ BitVec 32)) (x!58749 (_ BitVec 32))) (Undefined!6901) (MissingVacant!6901 (index!29954 (_ BitVec 32))) )
))
(declare-fun lt!300820 () SeekEntryResult!6901)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!648356 (= res!420130 (and (= lt!300820 (Found!6901 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18464 a!2986) index!984) (select (arr!18464 a!2986) j!136))) (not (= (select (arr!18464 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38517 (_ BitVec 32)) SeekEntryResult!6901)

(assert (=> b!648356 (= lt!300820 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18464 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648357 () Bool)

(declare-fun e!371849 () Bool)

(declare-fun e!371853 () Bool)

(assert (=> b!648357 (= e!371849 e!371853)))

(declare-fun res!420145 () Bool)

(assert (=> b!648357 (=> res!420145 e!371853)))

(assert (=> b!648357 (= res!420145 (bvsge index!984 j!136))))

(declare-fun lt!300815 () Unit!22034)

(assert (=> b!648357 (= lt!300815 e!371855)))

(declare-fun c!74480 () Bool)

(assert (=> b!648357 (= c!74480 (bvslt j!136 index!984))))

(declare-fun b!648358 () Bool)

(assert (=> b!648358 (= e!371853 e!371848)))

(declare-fun res!420129 () Bool)

(assert (=> b!648358 (=> res!420129 e!371848)))

(assert (=> b!648358 (= res!420129 (or (bvsge (size!18829 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18829 a!2986))))))

(assert (=> b!648358 (arrayContainsKey!0 lt!300826 (select (arr!18464 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!300829 () Unit!22034)

(assert (=> b!648358 (= lt!300829 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!300826 (select (arr!18464 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!371847 () Bool)

(assert (=> b!648358 e!371847))

(declare-fun res!420144 () Bool)

(assert (=> b!648358 (=> (not res!420144) (not e!371847))))

(assert (=> b!648358 (= res!420144 (arrayContainsKey!0 lt!300826 (select (arr!18464 a!2986) j!136) j!136))))

(declare-fun b!648359 () Bool)

(declare-fun res!420132 () Bool)

(declare-fun e!371846 () Bool)

(assert (=> b!648359 (=> (not res!420132) (not e!371846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38517 (_ BitVec 32)) Bool)

(assert (=> b!648359 (= res!420132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648360 () Bool)

(declare-fun res!420147 () Bool)

(assert (=> b!648360 (=> (not res!420147) (not e!371846))))

(assert (=> b!648360 (= res!420147 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18464 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!648361 () Bool)

(declare-fun e!371841 () Bool)

(declare-fun e!371842 () Bool)

(assert (=> b!648361 (= e!371841 e!371842)))

(declare-fun res!420137 () Bool)

(assert (=> b!648361 (=> res!420137 e!371842)))

(declare-fun lt!300816 () (_ BitVec 64))

(declare-fun lt!300819 () (_ BitVec 64))

(assert (=> b!648361 (= res!420137 (or (not (= (select (arr!18464 a!2986) j!136) lt!300816)) (not (= (select (arr!18464 a!2986) j!136) lt!300819)) (bvsge j!136 index!984)))))

(declare-fun b!648362 () Bool)

(declare-fun res!420135 () Bool)

(assert (=> b!648362 (=> (not res!420135) (not e!371846))))

(assert (=> b!648362 (= res!420135 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12541))))

(declare-fun res!420146 () Bool)

(declare-fun e!371851 () Bool)

(assert (=> start!58844 (=> (not res!420146) (not e!371851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58844 (= res!420146 (validMask!0 mask!3053))))

(assert (=> start!58844 e!371851))

(assert (=> start!58844 true))

(declare-fun array_inv!14347 (array!38517) Bool)

(assert (=> start!58844 (array_inv!14347 a!2986)))

(declare-fun b!648363 () Bool)

(declare-fun res!420133 () Bool)

(assert (=> b!648363 (=> (not res!420133) (not e!371851))))

(assert (=> b!648363 (= res!420133 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648364 () Bool)

(declare-fun res!420126 () Bool)

(assert (=> b!648364 (=> (not res!420126) (not e!371851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648364 (= res!420126 (validKeyInArray!0 k0!1786))))

(declare-fun b!648365 () Bool)

(declare-fun e!371854 () Bool)

(assert (=> b!648365 (= e!371854 e!371849)))

(declare-fun res!420128 () Bool)

(assert (=> b!648365 (=> res!420128 e!371849)))

(assert (=> b!648365 (= res!420128 (or (not (= (select (arr!18464 a!2986) j!136) lt!300816)) (not (= (select (arr!18464 a!2986) j!136) lt!300819))))))

(assert (=> b!648365 e!371841))

(declare-fun res!420131 () Bool)

(assert (=> b!648365 (=> (not res!420131) (not e!371841))))

(assert (=> b!648365 (= res!420131 (= lt!300819 (select (arr!18464 a!2986) j!136)))))

(assert (=> b!648365 (= lt!300819 (select (store (arr!18464 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!648366 () Bool)

(assert (=> b!648366 (= e!371846 e!371844)))

(declare-fun res!420138 () Bool)

(assert (=> b!648366 (=> (not res!420138) (not e!371844))))

(assert (=> b!648366 (= res!420138 (= (select (store (arr!18464 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648366 (= lt!300826 (array!38518 (store (arr!18464 a!2986) i!1108 k0!1786) (size!18829 a!2986)))))

(declare-fun b!648367 () Bool)

(assert (=> b!648367 (= e!371842 e!371852)))

(declare-fun res!420141 () Bool)

(assert (=> b!648367 (=> (not res!420141) (not e!371852))))

(assert (=> b!648367 (= res!420141 (arrayContainsKey!0 lt!300826 (select (arr!18464 a!2986) j!136) j!136))))

(declare-fun b!648368 () Bool)

(declare-fun res!420148 () Bool)

(assert (=> b!648368 (=> res!420148 e!371848)))

(declare-fun noDuplicate!428 (List!12544) Bool)

(assert (=> b!648368 (= res!420148 (not (noDuplicate!428 Nil!12541)))))

(declare-fun b!648369 () Bool)

(assert (=> b!648369 (= e!371847 (arrayContainsKey!0 lt!300826 (select (arr!18464 a!2986) j!136) index!984))))

(declare-fun b!648370 () Bool)

(assert (=> b!648370 (= e!371843 (not e!371854))))

(declare-fun res!420136 () Bool)

(assert (=> b!648370 (=> res!420136 e!371854)))

(declare-fun lt!300827 () SeekEntryResult!6901)

(assert (=> b!648370 (= res!420136 (not (= lt!300827 (Found!6901 index!984))))))

(declare-fun lt!300824 () Unit!22034)

(assert (=> b!648370 (= lt!300824 e!371850)))

(declare-fun c!74481 () Bool)

(assert (=> b!648370 (= c!74481 (= lt!300827 Undefined!6901))))

(assert (=> b!648370 (= lt!300827 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!300816 lt!300826 mask!3053))))

(declare-fun e!371845 () Bool)

(assert (=> b!648370 e!371845))

(declare-fun res!420127 () Bool)

(assert (=> b!648370 (=> (not res!420127) (not e!371845))))

(declare-fun lt!300817 () (_ BitVec 32))

(declare-fun lt!300822 () SeekEntryResult!6901)

(assert (=> b!648370 (= res!420127 (= lt!300822 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300817 vacantSpotIndex!68 lt!300816 lt!300826 mask!3053)))))

(assert (=> b!648370 (= lt!300822 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!300817 vacantSpotIndex!68 (select (arr!18464 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!648370 (= lt!300816 (select (store (arr!18464 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!300830 () Unit!22034)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38517 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22034)

(assert (=> b!648370 (= lt!300830 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!300817 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648370 (= lt!300817 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!648371 () Bool)

(assert (=> b!648371 (= e!371851 e!371846)))

(declare-fun res!420134 () Bool)

(assert (=> b!648371 (=> (not res!420134) (not e!371846))))

(declare-fun lt!300825 () SeekEntryResult!6901)

(assert (=> b!648371 (= res!420134 (or (= lt!300825 (MissingZero!6901 i!1108)) (= lt!300825 (MissingVacant!6901 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38517 (_ BitVec 32)) SeekEntryResult!6901)

(assert (=> b!648371 (= lt!300825 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!648372 () Bool)

(declare-fun Unit!22038 () Unit!22034)

(assert (=> b!648372 (= e!371850 Unit!22038)))

(declare-fun b!648373 () Bool)

(declare-fun Unit!22039 () Unit!22034)

(assert (=> b!648373 (= e!371855 Unit!22039)))

(declare-fun b!648374 () Bool)

(declare-fun res!420139 () Bool)

(assert (=> b!648374 (=> (not res!420139) (not e!371851))))

(assert (=> b!648374 (= res!420139 (and (= (size!18829 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18829 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18829 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!648375 () Bool)

(declare-fun res!420143 () Bool)

(assert (=> b!648375 (=> res!420143 e!371848)))

(assert (=> b!648375 (= res!420143 (contains!3145 Nil!12541 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648376 () Bool)

(assert (=> b!648376 (= e!371845 (= lt!300820 lt!300822))))

(declare-fun b!648377 () Bool)

(assert (=> b!648377 (= e!371848 true)))

(declare-fun lt!300831 () Bool)

(assert (=> b!648377 (= lt!300831 (contains!3145 Nil!12541 k0!1786))))

(declare-fun b!648378 () Bool)

(declare-fun res!420142 () Bool)

(assert (=> b!648378 (=> (not res!420142) (not e!371851))))

(assert (=> b!648378 (= res!420142 (validKeyInArray!0 (select (arr!18464 a!2986) j!136)))))

(assert (= (and start!58844 res!420146) b!648374))

(assert (= (and b!648374 res!420139) b!648378))

(assert (= (and b!648378 res!420142) b!648364))

(assert (= (and b!648364 res!420126) b!648363))

(assert (= (and b!648363 res!420133) b!648371))

(assert (= (and b!648371 res!420134) b!648359))

(assert (= (and b!648359 res!420132) b!648362))

(assert (= (and b!648362 res!420135) b!648360))

(assert (= (and b!648360 res!420147) b!648366))

(assert (= (and b!648366 res!420138) b!648356))

(assert (= (and b!648356 res!420130) b!648370))

(assert (= (and b!648370 res!420127) b!648376))

(assert (= (and b!648370 c!74481) b!648353))

(assert (= (and b!648370 (not c!74481)) b!648372))

(assert (= (and b!648370 (not res!420136)) b!648365))

(assert (= (and b!648365 res!420131) b!648361))

(assert (= (and b!648361 (not res!420137)) b!648367))

(assert (= (and b!648367 res!420141) b!648352))

(assert (= (and b!648365 (not res!420128)) b!648357))

(assert (= (and b!648357 c!74480) b!648354))

(assert (= (and b!648357 (not c!74480)) b!648373))

(assert (= (and b!648357 (not res!420145)) b!648358))

(assert (= (and b!648358 res!420144) b!648369))

(assert (= (and b!648358 (not res!420129)) b!648368))

(assert (= (and b!648368 (not res!420148)) b!648355))

(assert (= (and b!648355 (not res!420140)) b!648375))

(assert (= (and b!648375 (not res!420143)) b!648377))

(declare-fun m!621207 () Bool)

(assert (=> b!648354 m!621207))

(declare-fun m!621209 () Bool)

(assert (=> b!648354 m!621209))

(assert (=> b!648354 m!621207))

(declare-fun m!621211 () Bool)

(assert (=> b!648354 m!621211))

(assert (=> b!648354 m!621207))

(assert (=> b!648354 m!621207))

(declare-fun m!621213 () Bool)

(assert (=> b!648354 m!621213))

(declare-fun m!621215 () Bool)

(assert (=> b!648354 m!621215))

(declare-fun m!621217 () Bool)

(assert (=> b!648354 m!621217))

(declare-fun m!621219 () Bool)

(assert (=> b!648354 m!621219))

(declare-fun m!621221 () Bool)

(assert (=> b!648354 m!621221))

(assert (=> b!648367 m!621207))

(assert (=> b!648367 m!621207))

(declare-fun m!621223 () Bool)

(assert (=> b!648367 m!621223))

(declare-fun m!621225 () Bool)

(assert (=> b!648362 m!621225))

(assert (=> b!648378 m!621207))

(assert (=> b!648378 m!621207))

(declare-fun m!621227 () Bool)

(assert (=> b!648378 m!621227))

(assert (=> b!648358 m!621207))

(assert (=> b!648358 m!621207))

(declare-fun m!621229 () Bool)

(assert (=> b!648358 m!621229))

(assert (=> b!648358 m!621207))

(declare-fun m!621231 () Bool)

(assert (=> b!648358 m!621231))

(assert (=> b!648358 m!621207))

(assert (=> b!648358 m!621223))

(declare-fun m!621233 () Bool)

(assert (=> b!648355 m!621233))

(declare-fun m!621235 () Bool)

(assert (=> b!648363 m!621235))

(declare-fun m!621237 () Bool)

(assert (=> b!648377 m!621237))

(declare-fun m!621239 () Bool)

(assert (=> b!648364 m!621239))

(assert (=> b!648352 m!621207))

(assert (=> b!648352 m!621207))

(declare-fun m!621241 () Bool)

(assert (=> b!648352 m!621241))

(assert (=> b!648365 m!621207))

(declare-fun m!621243 () Bool)

(assert (=> b!648365 m!621243))

(declare-fun m!621245 () Bool)

(assert (=> b!648365 m!621245))

(declare-fun m!621247 () Bool)

(assert (=> start!58844 m!621247))

(declare-fun m!621249 () Bool)

(assert (=> start!58844 m!621249))

(assert (=> b!648361 m!621207))

(declare-fun m!621251 () Bool)

(assert (=> b!648370 m!621251))

(declare-fun m!621253 () Bool)

(assert (=> b!648370 m!621253))

(declare-fun m!621255 () Bool)

(assert (=> b!648370 m!621255))

(assert (=> b!648370 m!621207))

(declare-fun m!621257 () Bool)

(assert (=> b!648370 m!621257))

(assert (=> b!648370 m!621207))

(assert (=> b!648370 m!621243))

(declare-fun m!621259 () Bool)

(assert (=> b!648370 m!621259))

(declare-fun m!621261 () Bool)

(assert (=> b!648370 m!621261))

(assert (=> b!648366 m!621243))

(declare-fun m!621263 () Bool)

(assert (=> b!648366 m!621263))

(declare-fun m!621265 () Bool)

(assert (=> b!648359 m!621265))

(assert (=> b!648369 m!621207))

(assert (=> b!648369 m!621207))

(assert (=> b!648369 m!621241))

(declare-fun m!621267 () Bool)

(assert (=> b!648371 m!621267))

(declare-fun m!621269 () Bool)

(assert (=> b!648375 m!621269))

(declare-fun m!621271 () Bool)

(assert (=> b!648356 m!621271))

(assert (=> b!648356 m!621207))

(assert (=> b!648356 m!621207))

(declare-fun m!621273 () Bool)

(assert (=> b!648356 m!621273))

(declare-fun m!621275 () Bool)

(assert (=> b!648368 m!621275))

(declare-fun m!621277 () Bool)

(assert (=> b!648360 m!621277))

(check-sat (not b!648367) (not b!648369) (not b!648352) (not b!648378) (not b!648371) (not b!648362) (not b!648370) (not b!648359) (not b!648364) (not b!648375) (not b!648377) (not b!648368) (not b!648363) (not start!58844) (not b!648355) (not b!648358) (not b!648356) (not b!648354))
(check-sat)
