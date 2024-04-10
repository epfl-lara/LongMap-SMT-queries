; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59212 () Bool)

(assert start!59212)

(declare-fun b!653236 () Bool)

(declare-fun e!375023 () Bool)

(declare-fun e!375016 () Bool)

(assert (=> b!653236 (= e!375023 (not e!375016))))

(declare-fun res!423624 () Bool)

(assert (=> b!653236 (=> res!423624 e!375016)))

(declare-datatypes ((SeekEntryResult!6954 0))(
  ( (MissingZero!6954 (index!30172 (_ BitVec 32))) (Found!6954 (index!30173 (_ BitVec 32))) (Intermediate!6954 (undefined!7766 Bool) (index!30174 (_ BitVec 32)) (x!58962 (_ BitVec 32))) (Undefined!6954) (MissingVacant!6954 (index!30175 (_ BitVec 32))) )
))
(declare-fun lt!304085 () SeekEntryResult!6954)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!653236 (= res!423624 (not (= lt!304085 (Found!6954 index!984))))))

(declare-datatypes ((Unit!22350 0))(
  ( (Unit!22351) )
))
(declare-fun lt!304086 () Unit!22350)

(declare-fun e!375026 () Unit!22350)

(assert (=> b!653236 (= lt!304086 e!375026)))

(declare-fun c!75176 () Bool)

(assert (=> b!653236 (= c!75176 (= lt!304085 Undefined!6954))))

(declare-fun lt!304093 () (_ BitVec 64))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!38625 0))(
  ( (array!38626 (arr!18514 (Array (_ BitVec 32) (_ BitVec 64))) (size!18878 (_ BitVec 32))) )
))
(declare-fun lt!304092 () array!38625)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38625 (_ BitVec 32)) SeekEntryResult!6954)

(assert (=> b!653236 (= lt!304085 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304093 lt!304092 mask!3053))))

(declare-fun e!375017 () Bool)

(assert (=> b!653236 e!375017))

(declare-fun res!423630 () Bool)

(assert (=> b!653236 (=> (not res!423630) (not e!375017))))

(declare-fun lt!304087 () (_ BitVec 32))

(declare-fun lt!304078 () SeekEntryResult!6954)

(assert (=> b!653236 (= res!423630 (= lt!304078 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304087 vacantSpotIndex!68 lt!304093 lt!304092 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38625)

(assert (=> b!653236 (= lt!304078 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304087 vacantSpotIndex!68 (select (arr!18514 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!653236 (= lt!304093 (select (store (arr!18514 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!304091 () Unit!22350)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22350)

(assert (=> b!653236 (= lt!304091 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304087 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!653236 (= lt!304087 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!653237 () Bool)

(declare-fun res!423635 () Bool)

(declare-fun e!375025 () Bool)

(assert (=> b!653237 (=> (not res!423635) (not e!375025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!653237 (= res!423635 (validKeyInArray!0 (select (arr!18514 a!2986) j!136)))))

(declare-fun b!653238 () Bool)

(declare-fun e!375018 () Bool)

(assert (=> b!653238 (= e!375018 e!375023)))

(declare-fun res!423637 () Bool)

(assert (=> b!653238 (=> (not res!423637) (not e!375023))))

(declare-fun lt!304084 () SeekEntryResult!6954)

(assert (=> b!653238 (= res!423637 (and (= lt!304084 (Found!6954 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18514 a!2986) index!984) (select (arr!18514 a!2986) j!136))) (not (= (select (arr!18514 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!653238 (= lt!304084 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18514 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!653239 () Bool)

(declare-fun e!375030 () Bool)

(declare-datatypes ((List!12555 0))(
  ( (Nil!12552) (Cons!12551 (h!13596 (_ BitVec 64)) (t!18783 List!12555)) )
))
(declare-fun contains!3183 (List!12555 (_ BitVec 64)) Bool)

(assert (=> b!653239 (= e!375030 (not (contains!3183 Nil!12552 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!653240 () Bool)

(declare-fun res!423623 () Bool)

(declare-fun e!375024 () Bool)

(assert (=> b!653240 (=> (not res!423623) (not e!375024))))

(assert (=> b!653240 (= res!423623 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18514 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!653241 () Bool)

(declare-fun Unit!22352 () Unit!22350)

(assert (=> b!653241 (= e!375026 Unit!22352)))

(assert (=> b!653241 false))

(declare-fun e!375021 () Bool)

(declare-fun b!653242 () Bool)

(declare-fun arrayContainsKey!0 (array!38625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!653242 (= e!375021 (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) index!984))))

(declare-fun res!423620 () Bool)

(assert (=> start!59212 (=> (not res!423620) (not e!375025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59212 (= res!423620 (validMask!0 mask!3053))))

(assert (=> start!59212 e!375025))

(assert (=> start!59212 true))

(declare-fun array_inv!14310 (array!38625) Bool)

(assert (=> start!59212 (array_inv!14310 a!2986)))

(declare-fun b!653243 () Bool)

(declare-fun e!375020 () Bool)

(declare-fun e!375029 () Bool)

(assert (=> b!653243 (= e!375020 e!375029)))

(declare-fun res!423639 () Bool)

(assert (=> b!653243 (=> res!423639 e!375029)))

(assert (=> b!653243 (= res!423639 (bvsge index!984 j!136))))

(declare-fun lt!304080 () Unit!22350)

(declare-fun e!375019 () Unit!22350)

(assert (=> b!653243 (= lt!304080 e!375019)))

(declare-fun c!75175 () Bool)

(assert (=> b!653243 (= c!75175 (bvslt j!136 index!984))))

(declare-fun b!653244 () Bool)

(declare-fun Unit!22353 () Unit!22350)

(assert (=> b!653244 (= e!375019 Unit!22353)))

(declare-fun lt!304083 () Unit!22350)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38625 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22350)

(assert (=> b!653244 (= lt!304083 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304092 (select (arr!18514 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!653244 (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304079 () Unit!22350)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38625 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12555) Unit!22350)

(assert (=> b!653244 (= lt!304079 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12552))))

(declare-fun arrayNoDuplicates!0 (array!38625 (_ BitVec 32) List!12555) Bool)

(assert (=> b!653244 (arrayNoDuplicates!0 lt!304092 #b00000000000000000000000000000000 Nil!12552)))

(declare-fun lt!304088 () Unit!22350)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38625 (_ BitVec 32) (_ BitVec 32)) Unit!22350)

(assert (=> b!653244 (= lt!304088 (lemmaNoDuplicateFromThenFromBigger!0 lt!304092 #b00000000000000000000000000000000 j!136))))

(assert (=> b!653244 (arrayNoDuplicates!0 lt!304092 j!136 Nil!12552)))

(declare-fun lt!304090 () Unit!22350)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38625 (_ BitVec 64) (_ BitVec 32) List!12555) Unit!22350)

(assert (=> b!653244 (= lt!304090 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304092 (select (arr!18514 a!2986) j!136) j!136 Nil!12552))))

(assert (=> b!653244 false))

(declare-fun b!653245 () Bool)

(declare-fun res!423625 () Bool)

(assert (=> b!653245 (=> (not res!423625) (not e!375024))))

(assert (=> b!653245 (= res!423625 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12552))))

(declare-fun b!653246 () Bool)

(declare-fun Unit!22354 () Unit!22350)

(assert (=> b!653246 (= e!375026 Unit!22354)))

(declare-fun b!653247 () Bool)

(declare-fun res!423632 () Bool)

(assert (=> b!653247 (=> (not res!423632) (not e!375025))))

(assert (=> b!653247 (= res!423632 (validKeyInArray!0 k0!1786))))

(declare-fun b!653248 () Bool)

(declare-fun e!375022 () Bool)

(assert (=> b!653248 (= e!375022 (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) index!984))))

(declare-fun b!653249 () Bool)

(declare-fun e!375015 () Bool)

(assert (=> b!653249 (= e!375029 e!375015)))

(declare-fun res!423622 () Bool)

(assert (=> b!653249 (=> res!423622 e!375015)))

(assert (=> b!653249 (= res!423622 (or (bvsge (size!18878 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18878 a!2986)) (bvsge index!984 (size!18878 a!2986))))))

(assert (=> b!653249 (arrayNoDuplicates!0 lt!304092 index!984 Nil!12552)))

(declare-fun lt!304081 () Unit!22350)

(assert (=> b!653249 (= lt!304081 (lemmaNoDuplicateFromThenFromBigger!0 lt!304092 #b00000000000000000000000000000000 index!984))))

(assert (=> b!653249 (arrayNoDuplicates!0 lt!304092 #b00000000000000000000000000000000 Nil!12552)))

(declare-fun lt!304082 () Unit!22350)

(assert (=> b!653249 (= lt!304082 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12552))))

(assert (=> b!653249 (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304077 () Unit!22350)

(assert (=> b!653249 (= lt!304077 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304092 (select (arr!18514 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!653249 e!375021))

(declare-fun res!423638 () Bool)

(assert (=> b!653249 (=> (not res!423638) (not e!375021))))

(assert (=> b!653249 (= res!423638 (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) j!136))))

(declare-fun b!653250 () Bool)

(declare-fun Unit!22355 () Unit!22350)

(assert (=> b!653250 (= e!375019 Unit!22355)))

(declare-fun b!653251 () Bool)

(declare-fun res!423627 () Bool)

(assert (=> b!653251 (=> (not res!423627) (not e!375024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38625 (_ BitVec 32)) Bool)

(assert (=> b!653251 (= res!423627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!653252 () Bool)

(assert (=> b!653252 (= e!375015 e!375030)))

(declare-fun res!423621 () Bool)

(assert (=> b!653252 (=> (not res!423621) (not e!375030))))

(assert (=> b!653252 (= res!423621 (not (contains!3183 Nil!12552 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!653253 () Bool)

(assert (=> b!653253 (= e!375025 e!375024)))

(declare-fun res!423629 () Bool)

(assert (=> b!653253 (=> (not res!423629) (not e!375024))))

(declare-fun lt!304089 () SeekEntryResult!6954)

(assert (=> b!653253 (= res!423629 (or (= lt!304089 (MissingZero!6954 i!1108)) (= lt!304089 (MissingVacant!6954 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38625 (_ BitVec 32)) SeekEntryResult!6954)

(assert (=> b!653253 (= lt!304089 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!653254 () Bool)

(declare-fun e!375027 () Bool)

(assert (=> b!653254 (= e!375027 e!375022)))

(declare-fun res!423626 () Bool)

(assert (=> b!653254 (=> (not res!423626) (not e!375022))))

(assert (=> b!653254 (= res!423626 (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) j!136))))

(declare-fun b!653255 () Bool)

(declare-fun res!423634 () Bool)

(assert (=> b!653255 (=> res!423634 e!375015)))

(declare-fun noDuplicate!439 (List!12555) Bool)

(assert (=> b!653255 (= res!423634 (not (noDuplicate!439 Nil!12552)))))

(declare-fun b!653256 () Bool)

(assert (=> b!653256 (= e!375017 (= lt!304084 lt!304078))))

(declare-fun b!653257 () Bool)

(declare-fun e!375014 () Bool)

(assert (=> b!653257 (= e!375014 e!375027)))

(declare-fun res!423631 () Bool)

(assert (=> b!653257 (=> res!423631 e!375027)))

(declare-fun lt!304076 () (_ BitVec 64))

(assert (=> b!653257 (= res!423631 (or (not (= (select (arr!18514 a!2986) j!136) lt!304093)) (not (= (select (arr!18514 a!2986) j!136) lt!304076)) (bvsge j!136 index!984)))))

(declare-fun b!653258 () Bool)

(declare-fun res!423628 () Bool)

(assert (=> b!653258 (=> (not res!423628) (not e!375025))))

(assert (=> b!653258 (= res!423628 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!653259 () Bool)

(assert (=> b!653259 (= e!375024 e!375018)))

(declare-fun res!423633 () Bool)

(assert (=> b!653259 (=> (not res!423633) (not e!375018))))

(assert (=> b!653259 (= res!423633 (= (select (store (arr!18514 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!653259 (= lt!304092 (array!38626 (store (arr!18514 a!2986) i!1108 k0!1786) (size!18878 a!2986)))))

(declare-fun b!653260 () Bool)

(declare-fun res!423636 () Bool)

(assert (=> b!653260 (=> (not res!423636) (not e!375025))))

(assert (=> b!653260 (= res!423636 (and (= (size!18878 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18878 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18878 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!653261 () Bool)

(assert (=> b!653261 (= e!375016 e!375020)))

(declare-fun res!423641 () Bool)

(assert (=> b!653261 (=> res!423641 e!375020)))

(assert (=> b!653261 (= res!423641 (or (not (= (select (arr!18514 a!2986) j!136) lt!304093)) (not (= (select (arr!18514 a!2986) j!136) lt!304076))))))

(assert (=> b!653261 e!375014))

(declare-fun res!423640 () Bool)

(assert (=> b!653261 (=> (not res!423640) (not e!375014))))

(assert (=> b!653261 (= res!423640 (= lt!304076 (select (arr!18514 a!2986) j!136)))))

(assert (=> b!653261 (= lt!304076 (select (store (arr!18514 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!59212 res!423620) b!653260))

(assert (= (and b!653260 res!423636) b!653237))

(assert (= (and b!653237 res!423635) b!653247))

(assert (= (and b!653247 res!423632) b!653258))

(assert (= (and b!653258 res!423628) b!653253))

(assert (= (and b!653253 res!423629) b!653251))

(assert (= (and b!653251 res!423627) b!653245))

(assert (= (and b!653245 res!423625) b!653240))

(assert (= (and b!653240 res!423623) b!653259))

(assert (= (and b!653259 res!423633) b!653238))

(assert (= (and b!653238 res!423637) b!653236))

(assert (= (and b!653236 res!423630) b!653256))

(assert (= (and b!653236 c!75176) b!653241))

(assert (= (and b!653236 (not c!75176)) b!653246))

(assert (= (and b!653236 (not res!423624)) b!653261))

(assert (= (and b!653261 res!423640) b!653257))

(assert (= (and b!653257 (not res!423631)) b!653254))

(assert (= (and b!653254 res!423626) b!653248))

(assert (= (and b!653261 (not res!423641)) b!653243))

(assert (= (and b!653243 c!75175) b!653244))

(assert (= (and b!653243 (not c!75175)) b!653250))

(assert (= (and b!653243 (not res!423639)) b!653249))

(assert (= (and b!653249 res!423638) b!653242))

(assert (= (and b!653249 (not res!423622)) b!653255))

(assert (= (and b!653255 (not res!423634)) b!653252))

(assert (= (and b!653252 res!423621) b!653239))

(declare-fun m!626359 () Bool)

(assert (=> b!653254 m!626359))

(assert (=> b!653254 m!626359))

(declare-fun m!626361 () Bool)

(assert (=> b!653254 m!626361))

(declare-fun m!626363 () Bool)

(assert (=> b!653236 m!626363))

(declare-fun m!626365 () Bool)

(assert (=> b!653236 m!626365))

(assert (=> b!653236 m!626359))

(assert (=> b!653236 m!626359))

(declare-fun m!626367 () Bool)

(assert (=> b!653236 m!626367))

(declare-fun m!626369 () Bool)

(assert (=> b!653236 m!626369))

(declare-fun m!626371 () Bool)

(assert (=> b!653236 m!626371))

(declare-fun m!626373 () Bool)

(assert (=> b!653236 m!626373))

(declare-fun m!626375 () Bool)

(assert (=> b!653236 m!626375))

(declare-fun m!626377 () Bool)

(assert (=> start!59212 m!626377))

(declare-fun m!626379 () Bool)

(assert (=> start!59212 m!626379))

(assert (=> b!653257 m!626359))

(declare-fun m!626381 () Bool)

(assert (=> b!653238 m!626381))

(assert (=> b!653238 m!626359))

(assert (=> b!653238 m!626359))

(declare-fun m!626383 () Bool)

(assert (=> b!653238 m!626383))

(assert (=> b!653248 m!626359))

(assert (=> b!653248 m!626359))

(declare-fun m!626385 () Bool)

(assert (=> b!653248 m!626385))

(declare-fun m!626387 () Bool)

(assert (=> b!653247 m!626387))

(declare-fun m!626389 () Bool)

(assert (=> b!653240 m!626389))

(declare-fun m!626391 () Bool)

(assert (=> b!653251 m!626391))

(declare-fun m!626393 () Bool)

(assert (=> b!653245 m!626393))

(assert (=> b!653244 m!626359))

(declare-fun m!626395 () Bool)

(assert (=> b!653244 m!626395))

(assert (=> b!653244 m!626359))

(assert (=> b!653244 m!626359))

(declare-fun m!626397 () Bool)

(assert (=> b!653244 m!626397))

(declare-fun m!626399 () Bool)

(assert (=> b!653244 m!626399))

(declare-fun m!626401 () Bool)

(assert (=> b!653244 m!626401))

(declare-fun m!626403 () Bool)

(assert (=> b!653244 m!626403))

(assert (=> b!653244 m!626359))

(declare-fun m!626405 () Bool)

(assert (=> b!653244 m!626405))

(declare-fun m!626407 () Bool)

(assert (=> b!653244 m!626407))

(assert (=> b!653259 m!626369))

(declare-fun m!626409 () Bool)

(assert (=> b!653259 m!626409))

(declare-fun m!626411 () Bool)

(assert (=> b!653252 m!626411))

(declare-fun m!626413 () Bool)

(assert (=> b!653255 m!626413))

(assert (=> b!653261 m!626359))

(assert (=> b!653261 m!626369))

(declare-fun m!626415 () Bool)

(assert (=> b!653261 m!626415))

(declare-fun m!626417 () Bool)

(assert (=> b!653239 m!626417))

(declare-fun m!626419 () Bool)

(assert (=> b!653253 m!626419))

(declare-fun m!626421 () Bool)

(assert (=> b!653258 m!626421))

(assert (=> b!653237 m!626359))

(assert (=> b!653237 m!626359))

(declare-fun m!626423 () Bool)

(assert (=> b!653237 m!626423))

(assert (=> b!653242 m!626359))

(assert (=> b!653242 m!626359))

(assert (=> b!653242 m!626385))

(assert (=> b!653249 m!626359))

(declare-fun m!626425 () Bool)

(assert (=> b!653249 m!626425))

(declare-fun m!626427 () Bool)

(assert (=> b!653249 m!626427))

(assert (=> b!653249 m!626399))

(assert (=> b!653249 m!626359))

(assert (=> b!653249 m!626361))

(assert (=> b!653249 m!626359))

(declare-fun m!626429 () Bool)

(assert (=> b!653249 m!626429))

(assert (=> b!653249 m!626403))

(assert (=> b!653249 m!626359))

(declare-fun m!626431 () Bool)

(assert (=> b!653249 m!626431))

(check-sat (not b!653242) (not b!653239) (not b!653249) (not b!653237) (not b!653236) (not b!653258) (not b!653254) (not b!653238) (not b!653253) (not b!653251) (not b!653252) (not start!59212) (not b!653255) (not b!653248) (not b!653245) (not b!653244) (not b!653247))
(check-sat)
(get-model)

(declare-fun b!653351 () Bool)

(declare-fun e!375090 () Bool)

(declare-fun e!375091 () Bool)

(assert (=> b!653351 (= e!375090 e!375091)))

(declare-fun res!423714 () Bool)

(assert (=> b!653351 (=> (not res!423714) (not e!375091))))

(declare-fun e!375093 () Bool)

(assert (=> b!653351 (= res!423714 (not e!375093))))

(declare-fun res!423716 () Bool)

(assert (=> b!653351 (=> (not res!423716) (not e!375093))))

(assert (=> b!653351 (= res!423716 (validKeyInArray!0 (select (arr!18514 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!653352 () Bool)

(declare-fun e!375092 () Bool)

(declare-fun call!33809 () Bool)

(assert (=> b!653352 (= e!375092 call!33809)))

(declare-fun bm!33806 () Bool)

(declare-fun c!75185 () Bool)

(assert (=> bm!33806 (= call!33809 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75185 (Cons!12551 (select (arr!18514 a!2986) #b00000000000000000000000000000000) Nil!12552) Nil!12552)))))

(declare-fun d!92391 () Bool)

(declare-fun res!423715 () Bool)

(assert (=> d!92391 (=> res!423715 e!375090)))

(assert (=> d!92391 (= res!423715 (bvsge #b00000000000000000000000000000000 (size!18878 a!2986)))))

(assert (=> d!92391 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12552) e!375090)))

(declare-fun b!653350 () Bool)

(assert (=> b!653350 (= e!375091 e!375092)))

(assert (=> b!653350 (= c!75185 (validKeyInArray!0 (select (arr!18514 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!653353 () Bool)

(assert (=> b!653353 (= e!375092 call!33809)))

(declare-fun b!653354 () Bool)

(assert (=> b!653354 (= e!375093 (contains!3183 Nil!12552 (select (arr!18514 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92391 (not res!423715)) b!653351))

(assert (= (and b!653351 res!423716) b!653354))

(assert (= (and b!653351 res!423714) b!653350))

(assert (= (and b!653350 c!75185) b!653352))

(assert (= (and b!653350 (not c!75185)) b!653353))

(assert (= (or b!653352 b!653353) bm!33806))

(declare-fun m!626507 () Bool)

(assert (=> b!653351 m!626507))

(assert (=> b!653351 m!626507))

(declare-fun m!626509 () Bool)

(assert (=> b!653351 m!626509))

(assert (=> bm!33806 m!626507))

(declare-fun m!626511 () Bool)

(assert (=> bm!33806 m!626511))

(assert (=> b!653350 m!626507))

(assert (=> b!653350 m!626507))

(assert (=> b!653350 m!626509))

(assert (=> b!653354 m!626507))

(assert (=> b!653354 m!626507))

(declare-fun m!626513 () Bool)

(assert (=> b!653354 m!626513))

(assert (=> b!653245 d!92391))

(declare-fun d!92393 () Bool)

(assert (=> d!92393 (arrayNoDuplicates!0 lt!304092 j!136 Nil!12552)))

(declare-fun lt!304150 () Unit!22350)

(declare-fun choose!39 (array!38625 (_ BitVec 32) (_ BitVec 32)) Unit!22350)

(assert (=> d!92393 (= lt!304150 (choose!39 lt!304092 #b00000000000000000000000000000000 j!136))))

(assert (=> d!92393 (bvslt (size!18878 lt!304092) #b01111111111111111111111111111111)))

(assert (=> d!92393 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!304092 #b00000000000000000000000000000000 j!136) lt!304150)))

(declare-fun bs!19474 () Bool)

(assert (= bs!19474 d!92393))

(assert (=> bs!19474 m!626401))

(declare-fun m!626515 () Bool)

(assert (=> bs!19474 m!626515))

(assert (=> b!653244 d!92393))

(declare-fun b!653356 () Bool)

(declare-fun e!375094 () Bool)

(declare-fun e!375095 () Bool)

(assert (=> b!653356 (= e!375094 e!375095)))

(declare-fun res!423717 () Bool)

(assert (=> b!653356 (=> (not res!423717) (not e!375095))))

(declare-fun e!375097 () Bool)

(assert (=> b!653356 (= res!423717 (not e!375097))))

(declare-fun res!423719 () Bool)

(assert (=> b!653356 (=> (not res!423719) (not e!375097))))

(assert (=> b!653356 (= res!423719 (validKeyInArray!0 (select (arr!18514 lt!304092) j!136)))))

(declare-fun b!653357 () Bool)

(declare-fun e!375096 () Bool)

(declare-fun call!33810 () Bool)

(assert (=> b!653357 (= e!375096 call!33810)))

(declare-fun c!75186 () Bool)

(declare-fun bm!33807 () Bool)

(assert (=> bm!33807 (= call!33810 (arrayNoDuplicates!0 lt!304092 (bvadd j!136 #b00000000000000000000000000000001) (ite c!75186 (Cons!12551 (select (arr!18514 lt!304092) j!136) Nil!12552) Nil!12552)))))

(declare-fun d!92395 () Bool)

(declare-fun res!423718 () Bool)

(assert (=> d!92395 (=> res!423718 e!375094)))

(assert (=> d!92395 (= res!423718 (bvsge j!136 (size!18878 lt!304092)))))

(assert (=> d!92395 (= (arrayNoDuplicates!0 lt!304092 j!136 Nil!12552) e!375094)))

(declare-fun b!653355 () Bool)

(assert (=> b!653355 (= e!375095 e!375096)))

(assert (=> b!653355 (= c!75186 (validKeyInArray!0 (select (arr!18514 lt!304092) j!136)))))

(declare-fun b!653358 () Bool)

(assert (=> b!653358 (= e!375096 call!33810)))

(declare-fun b!653359 () Bool)

(assert (=> b!653359 (= e!375097 (contains!3183 Nil!12552 (select (arr!18514 lt!304092) j!136)))))

(assert (= (and d!92395 (not res!423718)) b!653356))

(assert (= (and b!653356 res!423719) b!653359))

(assert (= (and b!653356 res!423717) b!653355))

(assert (= (and b!653355 c!75186) b!653357))

(assert (= (and b!653355 (not c!75186)) b!653358))

(assert (= (or b!653357 b!653358) bm!33807))

(declare-fun m!626517 () Bool)

(assert (=> b!653356 m!626517))

(assert (=> b!653356 m!626517))

(declare-fun m!626519 () Bool)

(assert (=> b!653356 m!626519))

(assert (=> bm!33807 m!626517))

(declare-fun m!626521 () Bool)

(assert (=> bm!33807 m!626521))

(assert (=> b!653355 m!626517))

(assert (=> b!653355 m!626517))

(assert (=> b!653355 m!626519))

(assert (=> b!653359 m!626517))

(assert (=> b!653359 m!626517))

(declare-fun m!626523 () Bool)

(assert (=> b!653359 m!626523))

(assert (=> b!653244 d!92395))

(declare-fun d!92397 () Bool)

(assert (=> d!92397 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18878 lt!304092)) (not (= (select (arr!18514 lt!304092) j!136) (select (arr!18514 a!2986) j!136))))))

(declare-fun lt!304153 () Unit!22350)

(declare-fun choose!21 (array!38625 (_ BitVec 64) (_ BitVec 32) List!12555) Unit!22350)

(assert (=> d!92397 (= lt!304153 (choose!21 lt!304092 (select (arr!18514 a!2986) j!136) j!136 Nil!12552))))

(assert (=> d!92397 (bvslt (size!18878 lt!304092) #b01111111111111111111111111111111)))

(assert (=> d!92397 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304092 (select (arr!18514 a!2986) j!136) j!136 Nil!12552) lt!304153)))

(declare-fun bs!19475 () Bool)

(assert (= bs!19475 d!92397))

(assert (=> bs!19475 m!626517))

(assert (=> bs!19475 m!626359))

(declare-fun m!626525 () Bool)

(assert (=> bs!19475 m!626525))

(assert (=> b!653244 d!92397))

(declare-fun d!92399 () Bool)

(assert (=> d!92399 (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304156 () Unit!22350)

(declare-fun choose!114 (array!38625 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22350)

(assert (=> d!92399 (= lt!304156 (choose!114 lt!304092 (select (arr!18514 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!92399 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!92399 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304092 (select (arr!18514 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!304156)))

(declare-fun bs!19476 () Bool)

(assert (= bs!19476 d!92399))

(assert (=> bs!19476 m!626359))

(assert (=> bs!19476 m!626405))

(assert (=> bs!19476 m!626359))

(declare-fun m!626527 () Bool)

(assert (=> bs!19476 m!626527))

(assert (=> b!653244 d!92399))

(declare-fun d!92401 () Bool)

(declare-fun res!423724 () Bool)

(declare-fun e!375102 () Bool)

(assert (=> d!92401 (=> res!423724 e!375102)))

(assert (=> d!92401 (= res!423724 (= (select (arr!18514 lt!304092) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18514 a!2986) j!136)))))

(assert (=> d!92401 (= (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!375102)))

(declare-fun b!653364 () Bool)

(declare-fun e!375103 () Bool)

(assert (=> b!653364 (= e!375102 e!375103)))

(declare-fun res!423725 () Bool)

(assert (=> b!653364 (=> (not res!423725) (not e!375103))))

(assert (=> b!653364 (= res!423725 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18878 lt!304092)))))

(declare-fun b!653365 () Bool)

(assert (=> b!653365 (= e!375103 (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92401 (not res!423724)) b!653364))

(assert (= (and b!653364 res!423725) b!653365))

(declare-fun m!626529 () Bool)

(assert (=> d!92401 m!626529))

(assert (=> b!653365 m!626359))

(declare-fun m!626531 () Bool)

(assert (=> b!653365 m!626531))

(assert (=> b!653244 d!92401))

(declare-fun d!92403 () Bool)

(declare-fun e!375106 () Bool)

(assert (=> d!92403 e!375106))

(declare-fun res!423728 () Bool)

(assert (=> d!92403 (=> (not res!423728) (not e!375106))))

(assert (=> d!92403 (= res!423728 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18878 a!2986))))))

(declare-fun lt!304159 () Unit!22350)

(declare-fun choose!41 (array!38625 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12555) Unit!22350)

(assert (=> d!92403 (= lt!304159 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12552))))

(assert (=> d!92403 (bvslt (size!18878 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!92403 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12552) lt!304159)))

(declare-fun b!653368 () Bool)

(assert (=> b!653368 (= e!375106 (arrayNoDuplicates!0 (array!38626 (store (arr!18514 a!2986) i!1108 k0!1786) (size!18878 a!2986)) #b00000000000000000000000000000000 Nil!12552))))

(assert (= (and d!92403 res!423728) b!653368))

(declare-fun m!626533 () Bool)

(assert (=> d!92403 m!626533))

(assert (=> b!653368 m!626369))

(declare-fun m!626535 () Bool)

(assert (=> b!653368 m!626535))

(assert (=> b!653244 d!92403))

(declare-fun b!653370 () Bool)

(declare-fun e!375107 () Bool)

(declare-fun e!375108 () Bool)

(assert (=> b!653370 (= e!375107 e!375108)))

(declare-fun res!423729 () Bool)

(assert (=> b!653370 (=> (not res!423729) (not e!375108))))

(declare-fun e!375110 () Bool)

(assert (=> b!653370 (= res!423729 (not e!375110))))

(declare-fun res!423731 () Bool)

(assert (=> b!653370 (=> (not res!423731) (not e!375110))))

(assert (=> b!653370 (= res!423731 (validKeyInArray!0 (select (arr!18514 lt!304092) #b00000000000000000000000000000000)))))

(declare-fun b!653371 () Bool)

(declare-fun e!375109 () Bool)

(declare-fun call!33811 () Bool)

(assert (=> b!653371 (= e!375109 call!33811)))

(declare-fun bm!33808 () Bool)

(declare-fun c!75187 () Bool)

(assert (=> bm!33808 (= call!33811 (arrayNoDuplicates!0 lt!304092 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!75187 (Cons!12551 (select (arr!18514 lt!304092) #b00000000000000000000000000000000) Nil!12552) Nil!12552)))))

(declare-fun d!92405 () Bool)

(declare-fun res!423730 () Bool)

(assert (=> d!92405 (=> res!423730 e!375107)))

(assert (=> d!92405 (= res!423730 (bvsge #b00000000000000000000000000000000 (size!18878 lt!304092)))))

(assert (=> d!92405 (= (arrayNoDuplicates!0 lt!304092 #b00000000000000000000000000000000 Nil!12552) e!375107)))

(declare-fun b!653369 () Bool)

(assert (=> b!653369 (= e!375108 e!375109)))

(assert (=> b!653369 (= c!75187 (validKeyInArray!0 (select (arr!18514 lt!304092) #b00000000000000000000000000000000)))))

(declare-fun b!653372 () Bool)

(assert (=> b!653372 (= e!375109 call!33811)))

(declare-fun b!653373 () Bool)

(assert (=> b!653373 (= e!375110 (contains!3183 Nil!12552 (select (arr!18514 lt!304092) #b00000000000000000000000000000000)))))

(assert (= (and d!92405 (not res!423730)) b!653370))

(assert (= (and b!653370 res!423731) b!653373))

(assert (= (and b!653370 res!423729) b!653369))

(assert (= (and b!653369 c!75187) b!653371))

(assert (= (and b!653369 (not c!75187)) b!653372))

(assert (= (or b!653371 b!653372) bm!33808))

(declare-fun m!626537 () Bool)

(assert (=> b!653370 m!626537))

(assert (=> b!653370 m!626537))

(declare-fun m!626539 () Bool)

(assert (=> b!653370 m!626539))

(assert (=> bm!33808 m!626537))

(declare-fun m!626541 () Bool)

(assert (=> bm!33808 m!626541))

(assert (=> b!653369 m!626537))

(assert (=> b!653369 m!626537))

(assert (=> b!653369 m!626539))

(assert (=> b!653373 m!626537))

(assert (=> b!653373 m!626537))

(declare-fun m!626543 () Bool)

(assert (=> b!653373 m!626543))

(assert (=> b!653244 d!92405))

(declare-fun d!92407 () Bool)

(declare-fun res!423736 () Bool)

(declare-fun e!375115 () Bool)

(assert (=> d!92407 (=> res!423736 e!375115)))

(get-info :version)

(assert (=> d!92407 (= res!423736 ((_ is Nil!12552) Nil!12552))))

(assert (=> d!92407 (= (noDuplicate!439 Nil!12552) e!375115)))

(declare-fun b!653378 () Bool)

(declare-fun e!375116 () Bool)

(assert (=> b!653378 (= e!375115 e!375116)))

(declare-fun res!423737 () Bool)

(assert (=> b!653378 (=> (not res!423737) (not e!375116))))

(assert (=> b!653378 (= res!423737 (not (contains!3183 (t!18783 Nil!12552) (h!13596 Nil!12552))))))

(declare-fun b!653379 () Bool)

(assert (=> b!653379 (= e!375116 (noDuplicate!439 (t!18783 Nil!12552)))))

(assert (= (and d!92407 (not res!423736)) b!653378))

(assert (= (and b!653378 res!423737) b!653379))

(declare-fun m!626545 () Bool)

(assert (=> b!653378 m!626545))

(declare-fun m!626547 () Bool)

(assert (=> b!653379 m!626547))

(assert (=> b!653255 d!92407))

(declare-fun d!92409 () Bool)

(declare-fun res!423738 () Bool)

(declare-fun e!375117 () Bool)

(assert (=> d!92409 (=> res!423738 e!375117)))

(assert (=> d!92409 (= res!423738 (= (select (arr!18514 lt!304092) index!984) (select (arr!18514 a!2986) j!136)))))

(assert (=> d!92409 (= (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) index!984) e!375117)))

(declare-fun b!653380 () Bool)

(declare-fun e!375118 () Bool)

(assert (=> b!653380 (= e!375117 e!375118)))

(declare-fun res!423739 () Bool)

(assert (=> b!653380 (=> (not res!423739) (not e!375118))))

(assert (=> b!653380 (= res!423739 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18878 lt!304092)))))

(declare-fun b!653381 () Bool)

(assert (=> b!653381 (= e!375118 (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92409 (not res!423738)) b!653380))

(assert (= (and b!653380 res!423739) b!653381))

(declare-fun m!626549 () Bool)

(assert (=> d!92409 m!626549))

(assert (=> b!653381 m!626359))

(declare-fun m!626551 () Bool)

(assert (=> b!653381 m!626551))

(assert (=> b!653242 d!92409))

(declare-fun b!653394 () Bool)

(declare-fun e!375126 () SeekEntryResult!6954)

(declare-fun lt!304167 () SeekEntryResult!6954)

(assert (=> b!653394 (= e!375126 (seekKeyOrZeroReturnVacant!0 (x!58962 lt!304167) (index!30174 lt!304167) (index!30174 lt!304167) k0!1786 a!2986 mask!3053))))

(declare-fun b!653395 () Bool)

(assert (=> b!653395 (= e!375126 (MissingZero!6954 (index!30174 lt!304167)))))

(declare-fun b!653396 () Bool)

(declare-fun e!375125 () SeekEntryResult!6954)

(declare-fun e!375127 () SeekEntryResult!6954)

(assert (=> b!653396 (= e!375125 e!375127)))

(declare-fun lt!304166 () (_ BitVec 64))

(assert (=> b!653396 (= lt!304166 (select (arr!18514 a!2986) (index!30174 lt!304167)))))

(declare-fun c!75194 () Bool)

(assert (=> b!653396 (= c!75194 (= lt!304166 k0!1786))))

(declare-fun b!653397 () Bool)

(assert (=> b!653397 (= e!375127 (Found!6954 (index!30174 lt!304167)))))

(declare-fun d!92411 () Bool)

(declare-fun lt!304168 () SeekEntryResult!6954)

(assert (=> d!92411 (and (or ((_ is Undefined!6954) lt!304168) (not ((_ is Found!6954) lt!304168)) (and (bvsge (index!30173 lt!304168) #b00000000000000000000000000000000) (bvslt (index!30173 lt!304168) (size!18878 a!2986)))) (or ((_ is Undefined!6954) lt!304168) ((_ is Found!6954) lt!304168) (not ((_ is MissingZero!6954) lt!304168)) (and (bvsge (index!30172 lt!304168) #b00000000000000000000000000000000) (bvslt (index!30172 lt!304168) (size!18878 a!2986)))) (or ((_ is Undefined!6954) lt!304168) ((_ is Found!6954) lt!304168) ((_ is MissingZero!6954) lt!304168) (not ((_ is MissingVacant!6954) lt!304168)) (and (bvsge (index!30175 lt!304168) #b00000000000000000000000000000000) (bvslt (index!30175 lt!304168) (size!18878 a!2986)))) (or ((_ is Undefined!6954) lt!304168) (ite ((_ is Found!6954) lt!304168) (= (select (arr!18514 a!2986) (index!30173 lt!304168)) k0!1786) (ite ((_ is MissingZero!6954) lt!304168) (= (select (arr!18514 a!2986) (index!30172 lt!304168)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6954) lt!304168) (= (select (arr!18514 a!2986) (index!30175 lt!304168)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!92411 (= lt!304168 e!375125)))

(declare-fun c!75195 () Bool)

(assert (=> d!92411 (= c!75195 (and ((_ is Intermediate!6954) lt!304167) (undefined!7766 lt!304167)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38625 (_ BitVec 32)) SeekEntryResult!6954)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92411 (= lt!304167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!92411 (validMask!0 mask!3053)))

(assert (=> d!92411 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!304168)))

(declare-fun b!653398 () Bool)

(declare-fun c!75196 () Bool)

(assert (=> b!653398 (= c!75196 (= lt!304166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!653398 (= e!375127 e!375126)))

(declare-fun b!653399 () Bool)

(assert (=> b!653399 (= e!375125 Undefined!6954)))

(assert (= (and d!92411 c!75195) b!653399))

(assert (= (and d!92411 (not c!75195)) b!653396))

(assert (= (and b!653396 c!75194) b!653397))

(assert (= (and b!653396 (not c!75194)) b!653398))

(assert (= (and b!653398 c!75196) b!653395))

(assert (= (and b!653398 (not c!75196)) b!653394))

(declare-fun m!626553 () Bool)

(assert (=> b!653394 m!626553))

(declare-fun m!626555 () Bool)

(assert (=> b!653396 m!626555))

(declare-fun m!626557 () Bool)

(assert (=> d!92411 m!626557))

(declare-fun m!626559 () Bool)

(assert (=> d!92411 m!626559))

(declare-fun m!626561 () Bool)

(assert (=> d!92411 m!626561))

(assert (=> d!92411 m!626377))

(assert (=> d!92411 m!626557))

(declare-fun m!626563 () Bool)

(assert (=> d!92411 m!626563))

(declare-fun m!626565 () Bool)

(assert (=> d!92411 m!626565))

(assert (=> b!653253 d!92411))

(declare-fun d!92413 () Bool)

(declare-fun lt!304171 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!252 (List!12555) (InoxSet (_ BitVec 64)))

(assert (=> d!92413 (= lt!304171 (select (content!252 Nil!12552) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375132 () Bool)

(assert (=> d!92413 (= lt!304171 e!375132)))

(declare-fun res!423744 () Bool)

(assert (=> d!92413 (=> (not res!423744) (not e!375132))))

(assert (=> d!92413 (= res!423744 ((_ is Cons!12551) Nil!12552))))

(assert (=> d!92413 (= (contains!3183 Nil!12552 #b0000000000000000000000000000000000000000000000000000000000000000) lt!304171)))

(declare-fun b!653404 () Bool)

(declare-fun e!375133 () Bool)

(assert (=> b!653404 (= e!375132 e!375133)))

(declare-fun res!423745 () Bool)

(assert (=> b!653404 (=> res!423745 e!375133)))

(assert (=> b!653404 (= res!423745 (= (h!13596 Nil!12552) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!653405 () Bool)

(assert (=> b!653405 (= e!375133 (contains!3183 (t!18783 Nil!12552) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!92413 res!423744) b!653404))

(assert (= (and b!653404 (not res!423745)) b!653405))

(declare-fun m!626567 () Bool)

(assert (=> d!92413 m!626567))

(declare-fun m!626569 () Bool)

(assert (=> d!92413 m!626569))

(declare-fun m!626571 () Bool)

(assert (=> b!653405 m!626571))

(assert (=> b!653252 d!92413))

(declare-fun d!92417 () Bool)

(declare-fun res!423746 () Bool)

(declare-fun e!375134 () Bool)

(assert (=> d!92417 (=> res!423746 e!375134)))

(assert (=> d!92417 (= res!423746 (= (select (arr!18514 lt!304092) j!136) (select (arr!18514 a!2986) j!136)))))

(assert (=> d!92417 (= (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) j!136) e!375134)))

(declare-fun b!653406 () Bool)

(declare-fun e!375135 () Bool)

(assert (=> b!653406 (= e!375134 e!375135)))

(declare-fun res!423747 () Bool)

(assert (=> b!653406 (=> (not res!423747) (not e!375135))))

(assert (=> b!653406 (= res!423747 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18878 lt!304092)))))

(declare-fun b!653407 () Bool)

(assert (=> b!653407 (= e!375135 (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!92417 (not res!423746)) b!653406))

(assert (= (and b!653406 res!423747) b!653407))

(assert (=> d!92417 m!626517))

(assert (=> b!653407 m!626359))

(declare-fun m!626573 () Bool)

(assert (=> b!653407 m!626573))

(assert (=> b!653254 d!92417))

(declare-fun d!92419 () Bool)

(declare-fun lt!304172 () Bool)

(assert (=> d!92419 (= lt!304172 (select (content!252 Nil!12552) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375136 () Bool)

(assert (=> d!92419 (= lt!304172 e!375136)))

(declare-fun res!423748 () Bool)

(assert (=> d!92419 (=> (not res!423748) (not e!375136))))

(assert (=> d!92419 (= res!423748 ((_ is Cons!12551) Nil!12552))))

(assert (=> d!92419 (= (contains!3183 Nil!12552 #b1000000000000000000000000000000000000000000000000000000000000000) lt!304172)))

(declare-fun b!653408 () Bool)

(declare-fun e!375137 () Bool)

(assert (=> b!653408 (= e!375136 e!375137)))

(declare-fun res!423749 () Bool)

(assert (=> b!653408 (=> res!423749 e!375137)))

(assert (=> b!653408 (= res!423749 (= (h!13596 Nil!12552) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!653409 () Bool)

(assert (=> b!653409 (= e!375137 (contains!3183 (t!18783 Nil!12552) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!92419 res!423748) b!653408))

(assert (= (and b!653408 (not res!423749)) b!653409))

(assert (=> d!92419 m!626567))

(declare-fun m!626575 () Bool)

(assert (=> d!92419 m!626575))

(declare-fun m!626577 () Bool)

(assert (=> b!653409 m!626577))

(assert (=> b!653239 d!92419))

(declare-fun d!92421 () Bool)

(assert (=> d!92421 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!59212 d!92421))

(declare-fun d!92431 () Bool)

(assert (=> d!92431 (= (array_inv!14310 a!2986) (bvsge (size!18878 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!59212 d!92431))

(declare-fun bm!33816 () Bool)

(declare-fun call!33819 () Bool)

(assert (=> bm!33816 (= call!33819 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!653468 () Bool)

(declare-fun e!375190 () Bool)

(assert (=> b!653468 (= e!375190 call!33819)))

(declare-fun b!653469 () Bool)

(declare-fun e!375189 () Bool)

(assert (=> b!653469 (= e!375190 e!375189)))

(declare-fun lt!304187 () (_ BitVec 64))

(assert (=> b!653469 (= lt!304187 (select (arr!18514 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!304185 () Unit!22350)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38625 (_ BitVec 64) (_ BitVec 32)) Unit!22350)

(assert (=> b!653469 (= lt!304185 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!304187 #b00000000000000000000000000000000))))

(assert (=> b!653469 (arrayContainsKey!0 a!2986 lt!304187 #b00000000000000000000000000000000)))

(declare-fun lt!304186 () Unit!22350)

(assert (=> b!653469 (= lt!304186 lt!304185)))

(declare-fun res!423794 () Bool)

(assert (=> b!653469 (= res!423794 (= (seekEntryOrOpen!0 (select (arr!18514 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6954 #b00000000000000000000000000000000)))))

(assert (=> b!653469 (=> (not res!423794) (not e!375189))))

(declare-fun b!653470 () Bool)

(assert (=> b!653470 (= e!375189 call!33819)))

(declare-fun d!92433 () Bool)

(declare-fun res!423793 () Bool)

(declare-fun e!375188 () Bool)

(assert (=> d!92433 (=> res!423793 e!375188)))

(assert (=> d!92433 (= res!423793 (bvsge #b00000000000000000000000000000000 (size!18878 a!2986)))))

(assert (=> d!92433 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!375188)))

(declare-fun b!653467 () Bool)

(assert (=> b!653467 (= e!375188 e!375190)))

(declare-fun c!75204 () Bool)

(assert (=> b!653467 (= c!75204 (validKeyInArray!0 (select (arr!18514 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!92433 (not res!423793)) b!653467))

(assert (= (and b!653467 c!75204) b!653469))

(assert (= (and b!653467 (not c!75204)) b!653468))

(assert (= (and b!653469 res!423794) b!653470))

(assert (= (or b!653470 b!653468) bm!33816))

(declare-fun m!626607 () Bool)

(assert (=> bm!33816 m!626607))

(assert (=> b!653469 m!626507))

(declare-fun m!626609 () Bool)

(assert (=> b!653469 m!626609))

(declare-fun m!626611 () Bool)

(assert (=> b!653469 m!626611))

(assert (=> b!653469 m!626507))

(declare-fun m!626613 () Bool)

(assert (=> b!653469 m!626613))

(assert (=> b!653467 m!626507))

(assert (=> b!653467 m!626507))

(assert (=> b!653467 m!626509))

(assert (=> b!653251 d!92433))

(declare-fun d!92445 () Bool)

(declare-fun res!423795 () Bool)

(declare-fun e!375191 () Bool)

(assert (=> d!92445 (=> res!423795 e!375191)))

(assert (=> d!92445 (= res!423795 (= (select (arr!18514 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!92445 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!375191)))

(declare-fun b!653471 () Bool)

(declare-fun e!375192 () Bool)

(assert (=> b!653471 (= e!375191 e!375192)))

(declare-fun res!423796 () Bool)

(assert (=> b!653471 (=> (not res!423796) (not e!375192))))

(assert (=> b!653471 (= res!423796 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18878 a!2986)))))

(declare-fun b!653472 () Bool)

(assert (=> b!653472 (= e!375192 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!92445 (not res!423795)) b!653471))

(assert (= (and b!653471 res!423796) b!653472))

(assert (=> d!92445 m!626507))

(declare-fun m!626615 () Bool)

(assert (=> b!653472 m!626615))

(assert (=> b!653258 d!92445))

(declare-fun d!92447 () Bool)

(assert (=> d!92447 (= (validKeyInArray!0 (select (arr!18514 a!2986) j!136)) (and (not (= (select (arr!18514 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18514 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!653237 d!92447))

(declare-fun b!653514 () Bool)

(declare-fun e!375225 () SeekEntryResult!6954)

(assert (=> b!653514 (= e!375225 Undefined!6954)))

(declare-fun b!653515 () Bool)

(declare-fun c!75218 () Bool)

(declare-fun lt!304214 () (_ BitVec 64))

(assert (=> b!653515 (= c!75218 (= lt!304214 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375224 () SeekEntryResult!6954)

(declare-fun e!375223 () SeekEntryResult!6954)

(assert (=> b!653515 (= e!375224 e!375223)))

(declare-fun b!653516 () Bool)

(assert (=> b!653516 (= e!375223 (MissingVacant!6954 vacantSpotIndex!68))))

(declare-fun b!653517 () Bool)

(assert (=> b!653517 (= e!375223 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!304087 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18514 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!653519 () Bool)

(assert (=> b!653519 (= e!375225 e!375224)))

(declare-fun c!75217 () Bool)

(assert (=> b!653519 (= c!75217 (= lt!304214 (select (arr!18514 a!2986) j!136)))))

(declare-fun lt!304213 () SeekEntryResult!6954)

(declare-fun d!92449 () Bool)

(assert (=> d!92449 (and (or ((_ is Undefined!6954) lt!304213) (not ((_ is Found!6954) lt!304213)) (and (bvsge (index!30173 lt!304213) #b00000000000000000000000000000000) (bvslt (index!30173 lt!304213) (size!18878 a!2986)))) (or ((_ is Undefined!6954) lt!304213) ((_ is Found!6954) lt!304213) (not ((_ is MissingVacant!6954) lt!304213)) (not (= (index!30175 lt!304213) vacantSpotIndex!68)) (and (bvsge (index!30175 lt!304213) #b00000000000000000000000000000000) (bvslt (index!30175 lt!304213) (size!18878 a!2986)))) (or ((_ is Undefined!6954) lt!304213) (ite ((_ is Found!6954) lt!304213) (= (select (arr!18514 a!2986) (index!30173 lt!304213)) (select (arr!18514 a!2986) j!136)) (and ((_ is MissingVacant!6954) lt!304213) (= (index!30175 lt!304213) vacantSpotIndex!68) (= (select (arr!18514 a!2986) (index!30175 lt!304213)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92449 (= lt!304213 e!375225)))

(declare-fun c!75216 () Bool)

(assert (=> d!92449 (= c!75216 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92449 (= lt!304214 (select (arr!18514 a!2986) lt!304087))))

(assert (=> d!92449 (validMask!0 mask!3053)))

(assert (=> d!92449 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304087 vacantSpotIndex!68 (select (arr!18514 a!2986) j!136) a!2986 mask!3053) lt!304213)))

(declare-fun b!653518 () Bool)

(assert (=> b!653518 (= e!375224 (Found!6954 lt!304087))))

(assert (= (and d!92449 c!75216) b!653514))

(assert (= (and d!92449 (not c!75216)) b!653519))

(assert (= (and b!653519 c!75217) b!653518))

(assert (= (and b!653519 (not c!75217)) b!653515))

(assert (= (and b!653515 c!75218) b!653516))

(assert (= (and b!653515 (not c!75218)) b!653517))

(declare-fun m!626657 () Bool)

(assert (=> b!653517 m!626657))

(assert (=> b!653517 m!626657))

(assert (=> b!653517 m!626359))

(declare-fun m!626661 () Bool)

(assert (=> b!653517 m!626661))

(declare-fun m!626665 () Bool)

(assert (=> d!92449 m!626665))

(declare-fun m!626667 () Bool)

(assert (=> d!92449 m!626667))

(declare-fun m!626669 () Bool)

(assert (=> d!92449 m!626669))

(assert (=> d!92449 m!626377))

(assert (=> b!653236 d!92449))

(declare-fun d!92475 () Bool)

(declare-fun e!375240 () Bool)

(assert (=> d!92475 e!375240))

(declare-fun res!423828 () Bool)

(assert (=> d!92475 (=> (not res!423828) (not e!375240))))

(assert (=> d!92475 (= res!423828 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18878 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18878 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18878 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18878 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18878 a!2986))))))

(declare-fun lt!304228 () Unit!22350)

(declare-fun choose!9 (array!38625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22350)

(assert (=> d!92475 (= lt!304228 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304087 vacantSpotIndex!68 mask!3053))))

(assert (=> d!92475 (validMask!0 mask!3053)))

(assert (=> d!92475 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304087 vacantSpotIndex!68 mask!3053) lt!304228)))

(declare-fun b!653536 () Bool)

(assert (=> b!653536 (= e!375240 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304087 vacantSpotIndex!68 (select (arr!18514 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304087 vacantSpotIndex!68 (select (store (arr!18514 a!2986) i!1108 k0!1786) j!136) (array!38626 (store (arr!18514 a!2986) i!1108 k0!1786) (size!18878 a!2986)) mask!3053)))))

(assert (= (and d!92475 res!423828) b!653536))

(declare-fun m!626691 () Bool)

(assert (=> d!92475 m!626691))

(assert (=> d!92475 m!626377))

(assert (=> b!653536 m!626359))

(assert (=> b!653536 m!626369))

(assert (=> b!653536 m!626365))

(declare-fun m!626693 () Bool)

(assert (=> b!653536 m!626693))

(assert (=> b!653536 m!626365))

(assert (=> b!653536 m!626359))

(assert (=> b!653536 m!626367))

(assert (=> b!653236 d!92475))

(declare-fun d!92489 () Bool)

(declare-fun lt!304238 () (_ BitVec 32))

(assert (=> d!92489 (and (bvsge lt!304238 #b00000000000000000000000000000000) (bvslt lt!304238 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!92489 (= lt!304238 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!92489 (validMask!0 mask!3053)))

(assert (=> d!92489 (= (nextIndex!0 index!984 x!910 mask!3053) lt!304238)))

(declare-fun bs!19483 () Bool)

(assert (= bs!19483 d!92489))

(declare-fun m!626703 () Bool)

(assert (=> bs!19483 m!626703))

(assert (=> bs!19483 m!626377))

(assert (=> b!653236 d!92489))

(declare-fun b!653556 () Bool)

(declare-fun e!375256 () SeekEntryResult!6954)

(assert (=> b!653556 (= e!375256 Undefined!6954)))

(declare-fun b!653557 () Bool)

(declare-fun c!75229 () Bool)

(declare-fun lt!304240 () (_ BitVec 64))

(assert (=> b!653557 (= c!75229 (= lt!304240 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375255 () SeekEntryResult!6954)

(declare-fun e!375254 () SeekEntryResult!6954)

(assert (=> b!653557 (= e!375255 e!375254)))

(declare-fun b!653558 () Bool)

(assert (=> b!653558 (= e!375254 (MissingVacant!6954 vacantSpotIndex!68))))

(declare-fun b!653559 () Bool)

(assert (=> b!653559 (= e!375254 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!304087 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!304093 lt!304092 mask!3053))))

(declare-fun b!653561 () Bool)

(assert (=> b!653561 (= e!375256 e!375255)))

(declare-fun c!75228 () Bool)

(assert (=> b!653561 (= c!75228 (= lt!304240 lt!304093))))

(declare-fun lt!304239 () SeekEntryResult!6954)

(declare-fun d!92495 () Bool)

(assert (=> d!92495 (and (or ((_ is Undefined!6954) lt!304239) (not ((_ is Found!6954) lt!304239)) (and (bvsge (index!30173 lt!304239) #b00000000000000000000000000000000) (bvslt (index!30173 lt!304239) (size!18878 lt!304092)))) (or ((_ is Undefined!6954) lt!304239) ((_ is Found!6954) lt!304239) (not ((_ is MissingVacant!6954) lt!304239)) (not (= (index!30175 lt!304239) vacantSpotIndex!68)) (and (bvsge (index!30175 lt!304239) #b00000000000000000000000000000000) (bvslt (index!30175 lt!304239) (size!18878 lt!304092)))) (or ((_ is Undefined!6954) lt!304239) (ite ((_ is Found!6954) lt!304239) (= (select (arr!18514 lt!304092) (index!30173 lt!304239)) lt!304093) (and ((_ is MissingVacant!6954) lt!304239) (= (index!30175 lt!304239) vacantSpotIndex!68) (= (select (arr!18514 lt!304092) (index!30175 lt!304239)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92495 (= lt!304239 e!375256)))

(declare-fun c!75227 () Bool)

(assert (=> d!92495 (= c!75227 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!92495 (= lt!304240 (select (arr!18514 lt!304092) lt!304087))))

(assert (=> d!92495 (validMask!0 mask!3053)))

(assert (=> d!92495 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304087 vacantSpotIndex!68 lt!304093 lt!304092 mask!3053) lt!304239)))

(declare-fun b!653560 () Bool)

(assert (=> b!653560 (= e!375255 (Found!6954 lt!304087))))

(assert (= (and d!92495 c!75227) b!653556))

(assert (= (and d!92495 (not c!75227)) b!653561))

(assert (= (and b!653561 c!75228) b!653560))

(assert (= (and b!653561 (not c!75228)) b!653557))

(assert (= (and b!653557 c!75229) b!653558))

(assert (= (and b!653557 (not c!75229)) b!653559))

(assert (=> b!653559 m!626657))

(assert (=> b!653559 m!626657))

(declare-fun m!626705 () Bool)

(assert (=> b!653559 m!626705))

(declare-fun m!626707 () Bool)

(assert (=> d!92495 m!626707))

(declare-fun m!626709 () Bool)

(assert (=> d!92495 m!626709))

(declare-fun m!626711 () Bool)

(assert (=> d!92495 m!626711))

(assert (=> d!92495 m!626377))

(assert (=> b!653236 d!92495))

(declare-fun b!653564 () Bool)

(declare-fun e!375261 () SeekEntryResult!6954)

(assert (=> b!653564 (= e!375261 Undefined!6954)))

(declare-fun b!653565 () Bool)

(declare-fun c!75232 () Bool)

(declare-fun lt!304242 () (_ BitVec 64))

(assert (=> b!653565 (= c!75232 (= lt!304242 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375260 () SeekEntryResult!6954)

(declare-fun e!375259 () SeekEntryResult!6954)

(assert (=> b!653565 (= e!375260 e!375259)))

(declare-fun b!653566 () Bool)

(assert (=> b!653566 (= e!375259 (MissingVacant!6954 vacantSpotIndex!68))))

(declare-fun b!653567 () Bool)

(assert (=> b!653567 (= e!375259 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!304093 lt!304092 mask!3053))))

(declare-fun b!653569 () Bool)

(assert (=> b!653569 (= e!375261 e!375260)))

(declare-fun c!75231 () Bool)

(assert (=> b!653569 (= c!75231 (= lt!304242 lt!304093))))

(declare-fun d!92497 () Bool)

(declare-fun lt!304241 () SeekEntryResult!6954)

(assert (=> d!92497 (and (or ((_ is Undefined!6954) lt!304241) (not ((_ is Found!6954) lt!304241)) (and (bvsge (index!30173 lt!304241) #b00000000000000000000000000000000) (bvslt (index!30173 lt!304241) (size!18878 lt!304092)))) (or ((_ is Undefined!6954) lt!304241) ((_ is Found!6954) lt!304241) (not ((_ is MissingVacant!6954) lt!304241)) (not (= (index!30175 lt!304241) vacantSpotIndex!68)) (and (bvsge (index!30175 lt!304241) #b00000000000000000000000000000000) (bvslt (index!30175 lt!304241) (size!18878 lt!304092)))) (or ((_ is Undefined!6954) lt!304241) (ite ((_ is Found!6954) lt!304241) (= (select (arr!18514 lt!304092) (index!30173 lt!304241)) lt!304093) (and ((_ is MissingVacant!6954) lt!304241) (= (index!30175 lt!304241) vacantSpotIndex!68) (= (select (arr!18514 lt!304092) (index!30175 lt!304241)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92497 (= lt!304241 e!375261)))

(declare-fun c!75230 () Bool)

(assert (=> d!92497 (= c!75230 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92497 (= lt!304242 (select (arr!18514 lt!304092) index!984))))

(assert (=> d!92497 (validMask!0 mask!3053)))

(assert (=> d!92497 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304093 lt!304092 mask!3053) lt!304241)))

(declare-fun b!653568 () Bool)

(assert (=> b!653568 (= e!375260 (Found!6954 index!984))))

(assert (= (and d!92497 c!75230) b!653564))

(assert (= (and d!92497 (not c!75230)) b!653569))

(assert (= (and b!653569 c!75231) b!653568))

(assert (= (and b!653569 (not c!75231)) b!653565))

(assert (= (and b!653565 c!75232) b!653566))

(assert (= (and b!653565 (not c!75232)) b!653567))

(assert (=> b!653567 m!626363))

(assert (=> b!653567 m!626363))

(declare-fun m!626721 () Bool)

(assert (=> b!653567 m!626721))

(declare-fun m!626723 () Bool)

(assert (=> d!92497 m!626723))

(declare-fun m!626725 () Bool)

(assert (=> d!92497 m!626725))

(assert (=> d!92497 m!626549))

(assert (=> d!92497 m!626377))

(assert (=> b!653236 d!92497))

(declare-fun d!92503 () Bool)

(assert (=> d!92503 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!653247 d!92503))

(declare-fun b!653577 () Bool)

(declare-fun e!375270 () SeekEntryResult!6954)

(assert (=> b!653577 (= e!375270 Undefined!6954)))

(declare-fun b!653578 () Bool)

(declare-fun c!75236 () Bool)

(declare-fun lt!304244 () (_ BitVec 64))

(assert (=> b!653578 (= c!75236 (= lt!304244 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!375269 () SeekEntryResult!6954)

(declare-fun e!375268 () SeekEntryResult!6954)

(assert (=> b!653578 (= e!375269 e!375268)))

(declare-fun b!653579 () Bool)

(assert (=> b!653579 (= e!375268 (MissingVacant!6954 vacantSpotIndex!68))))

(declare-fun b!653580 () Bool)

(assert (=> b!653580 (= e!375268 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18514 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!653582 () Bool)

(assert (=> b!653582 (= e!375270 e!375269)))

(declare-fun c!75235 () Bool)

(assert (=> b!653582 (= c!75235 (= lt!304244 (select (arr!18514 a!2986) j!136)))))

(declare-fun lt!304243 () SeekEntryResult!6954)

(declare-fun d!92505 () Bool)

(assert (=> d!92505 (and (or ((_ is Undefined!6954) lt!304243) (not ((_ is Found!6954) lt!304243)) (and (bvsge (index!30173 lt!304243) #b00000000000000000000000000000000) (bvslt (index!30173 lt!304243) (size!18878 a!2986)))) (or ((_ is Undefined!6954) lt!304243) ((_ is Found!6954) lt!304243) (not ((_ is MissingVacant!6954) lt!304243)) (not (= (index!30175 lt!304243) vacantSpotIndex!68)) (and (bvsge (index!30175 lt!304243) #b00000000000000000000000000000000) (bvslt (index!30175 lt!304243) (size!18878 a!2986)))) (or ((_ is Undefined!6954) lt!304243) (ite ((_ is Found!6954) lt!304243) (= (select (arr!18514 a!2986) (index!30173 lt!304243)) (select (arr!18514 a!2986) j!136)) (and ((_ is MissingVacant!6954) lt!304243) (= (index!30175 lt!304243) vacantSpotIndex!68) (= (select (arr!18514 a!2986) (index!30175 lt!304243)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!92505 (= lt!304243 e!375270)))

(declare-fun c!75234 () Bool)

(assert (=> d!92505 (= c!75234 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!92505 (= lt!304244 (select (arr!18514 a!2986) index!984))))

(assert (=> d!92505 (validMask!0 mask!3053)))

(assert (=> d!92505 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18514 a!2986) j!136) a!2986 mask!3053) lt!304243)))

(declare-fun b!653581 () Bool)

(assert (=> b!653581 (= e!375269 (Found!6954 index!984))))

(assert (= (and d!92505 c!75234) b!653577))

(assert (= (and d!92505 (not c!75234)) b!653582))

(assert (= (and b!653582 c!75235) b!653581))

(assert (= (and b!653582 (not c!75235)) b!653578))

(assert (= (and b!653578 c!75236) b!653579))

(assert (= (and b!653578 (not c!75236)) b!653580))

(assert (=> b!653580 m!626363))

(assert (=> b!653580 m!626363))

(assert (=> b!653580 m!626359))

(declare-fun m!626733 () Bool)

(assert (=> b!653580 m!626733))

(declare-fun m!626735 () Bool)

(assert (=> d!92505 m!626735))

(declare-fun m!626737 () Bool)

(assert (=> d!92505 m!626737))

(assert (=> d!92505 m!626381))

(assert (=> d!92505 m!626377))

(assert (=> b!653238 d!92505))

(declare-fun d!92509 () Bool)

(assert (=> d!92509 (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304246 () Unit!22350)

(assert (=> d!92509 (= lt!304246 (choose!114 lt!304092 (select (arr!18514 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!92509 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!92509 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304092 (select (arr!18514 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!304246)))

(declare-fun bs!19485 () Bool)

(assert (= bs!19485 d!92509))

(assert (=> bs!19485 m!626359))

(assert (=> bs!19485 m!626425))

(assert (=> bs!19485 m!626359))

(declare-fun m!626741 () Bool)

(assert (=> bs!19485 m!626741))

(assert (=> b!653249 d!92509))

(declare-fun d!92513 () Bool)

(declare-fun res!423843 () Bool)

(declare-fun e!375271 () Bool)

(assert (=> d!92513 (=> res!423843 e!375271)))

(assert (=> d!92513 (= res!423843 (= (select (arr!18514 lt!304092) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18514 a!2986) j!136)))))

(assert (=> d!92513 (= (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!375271)))

(declare-fun b!653583 () Bool)

(declare-fun e!375272 () Bool)

(assert (=> b!653583 (= e!375271 e!375272)))

(declare-fun res!423844 () Bool)

(assert (=> b!653583 (=> (not res!423844) (not e!375272))))

(assert (=> b!653583 (= res!423844 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18878 lt!304092)))))

(declare-fun b!653584 () Bool)

(assert (=> b!653584 (= e!375272 (arrayContainsKey!0 lt!304092 (select (arr!18514 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!92513 (not res!423843)) b!653583))

(assert (= (and b!653583 res!423844) b!653584))

(declare-fun m!626745 () Bool)

(assert (=> d!92513 m!626745))

(assert (=> b!653584 m!626359))

(declare-fun m!626747 () Bool)

(assert (=> b!653584 m!626747))

(assert (=> b!653249 d!92513))

(assert (=> b!653249 d!92417))

(declare-fun d!92517 () Bool)

(assert (=> d!92517 (arrayNoDuplicates!0 lt!304092 index!984 Nil!12552)))

(declare-fun lt!304248 () Unit!22350)

(assert (=> d!92517 (= lt!304248 (choose!39 lt!304092 #b00000000000000000000000000000000 index!984))))

(assert (=> d!92517 (bvslt (size!18878 lt!304092) #b01111111111111111111111111111111)))

(assert (=> d!92517 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!304092 #b00000000000000000000000000000000 index!984) lt!304248)))

(declare-fun bs!19487 () Bool)

(assert (= bs!19487 d!92517))

(assert (=> bs!19487 m!626431))

(declare-fun m!626751 () Bool)

(assert (=> bs!19487 m!626751))

(assert (=> b!653249 d!92517))

(declare-fun b!653596 () Bool)

(declare-fun e!375280 () Bool)

(declare-fun e!375281 () Bool)

(assert (=> b!653596 (= e!375280 e!375281)))

(declare-fun res!423849 () Bool)

(assert (=> b!653596 (=> (not res!423849) (not e!375281))))

(declare-fun e!375283 () Bool)

(assert (=> b!653596 (= res!423849 (not e!375283))))

(declare-fun res!423851 () Bool)

(assert (=> b!653596 (=> (not res!423851) (not e!375283))))

(assert (=> b!653596 (= res!423851 (validKeyInArray!0 (select (arr!18514 lt!304092) index!984)))))

(declare-fun b!653597 () Bool)

(declare-fun e!375282 () Bool)

(declare-fun call!33828 () Bool)

(assert (=> b!653597 (= e!375282 call!33828)))

(declare-fun bm!33825 () Bool)

(declare-fun c!75240 () Bool)

(assert (=> bm!33825 (= call!33828 (arrayNoDuplicates!0 lt!304092 (bvadd index!984 #b00000000000000000000000000000001) (ite c!75240 (Cons!12551 (select (arr!18514 lt!304092) index!984) Nil!12552) Nil!12552)))))

(declare-fun d!92521 () Bool)

(declare-fun res!423850 () Bool)

(assert (=> d!92521 (=> res!423850 e!375280)))

(assert (=> d!92521 (= res!423850 (bvsge index!984 (size!18878 lt!304092)))))

(assert (=> d!92521 (= (arrayNoDuplicates!0 lt!304092 index!984 Nil!12552) e!375280)))

(declare-fun b!653595 () Bool)

(assert (=> b!653595 (= e!375281 e!375282)))

(assert (=> b!653595 (= c!75240 (validKeyInArray!0 (select (arr!18514 lt!304092) index!984)))))

(declare-fun b!653598 () Bool)

(assert (=> b!653598 (= e!375282 call!33828)))

(declare-fun b!653599 () Bool)

(assert (=> b!653599 (= e!375283 (contains!3183 Nil!12552 (select (arr!18514 lt!304092) index!984)))))

(assert (= (and d!92521 (not res!423850)) b!653596))

(assert (= (and b!653596 res!423851) b!653599))

(assert (= (and b!653596 res!423849) b!653595))

(assert (= (and b!653595 c!75240) b!653597))

(assert (= (and b!653595 (not c!75240)) b!653598))

(assert (= (or b!653597 b!653598) bm!33825))

(assert (=> b!653596 m!626549))

(assert (=> b!653596 m!626549))

(declare-fun m!626757 () Bool)

(assert (=> b!653596 m!626757))

(assert (=> bm!33825 m!626549))

(declare-fun m!626760 () Bool)

(assert (=> bm!33825 m!626760))

(assert (=> b!653595 m!626549))

(assert (=> b!653595 m!626549))

(assert (=> b!653595 m!626757))

(assert (=> b!653599 m!626549))

(assert (=> b!653599 m!626549))

(declare-fun m!626769 () Bool)

(assert (=> b!653599 m!626769))

(assert (=> b!653249 d!92521))

(assert (=> b!653249 d!92403))

(assert (=> b!653249 d!92405))

(assert (=> b!653248 d!92409))

(check-sat (not d!92489) (not b!653351) (not b!653599) (not d!92495) (not d!92411) (not b!653536) (not b!653580) (not b!653356) (not b!653394) (not d!92403) (not b!653517) (not b!653409) (not b!653369) (not b!653407) (not b!653373) (not d!92449) (not d!92419) (not bm!33806) (not d!92399) (not d!92505) (not d!92517) (not b!653559) (not bm!33825) (not b!653365) (not b!653354) (not bm!33807) (not b!653370) (not d!92497) (not b!653405) (not b!653378) (not b!653469) (not b!653359) (not b!653381) (not b!653595) (not b!653467) (not d!92509) (not bm!33808) (not b!653472) (not d!92397) (not b!653355) (not d!92475) (not bm!33816) (not d!92393) (not b!653350) (not b!653567) (not d!92413) (not b!653368) (not b!653584) (not b!653379) (not b!653596))
(check-sat)
