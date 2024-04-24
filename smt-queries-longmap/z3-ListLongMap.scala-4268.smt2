; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59406 () Bool)

(assert start!59406)

(declare-fun b!655325 () Bool)

(declare-datatypes ((Unit!22473 0))(
  ( (Unit!22474) )
))
(declare-fun e!376358 () Unit!22473)

(declare-fun Unit!22475 () Unit!22473)

(assert (=> b!655325 (= e!376358 Unit!22475)))

(declare-fun b!655326 () Bool)

(assert (=> b!655326 false))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!38664 0))(
  ( (array!38665 (arr!18529 (Array (_ BitVec 32) (_ BitVec 64))) (size!18893 (_ BitVec 32))) )
))
(declare-fun lt!305506 () array!38664)

(declare-fun lt!305515 () Unit!22473)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38664)

(declare-datatypes ((List!12477 0))(
  ( (Nil!12474) (Cons!12473 (h!13521 (_ BitVec 64)) (t!18697 List!12477)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38664 (_ BitVec 64) (_ BitVec 32) List!12477) Unit!22473)

(assert (=> b!655326 (= lt!305515 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305506 (select (arr!18529 a!2986) j!136) index!984 Nil!12474))))

(declare-fun arrayNoDuplicates!0 (array!38664 (_ BitVec 32) List!12477) Bool)

(assert (=> b!655326 (arrayNoDuplicates!0 lt!305506 index!984 Nil!12474)))

(declare-fun lt!305507 () Unit!22473)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38664 (_ BitVec 32) (_ BitVec 32)) Unit!22473)

(assert (=> b!655326 (= lt!305507 (lemmaNoDuplicateFromThenFromBigger!0 lt!305506 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655326 (arrayNoDuplicates!0 lt!305506 #b00000000000000000000000000000000 Nil!12474)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!305512 () Unit!22473)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38664 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12477) Unit!22473)

(assert (=> b!655326 (= lt!305512 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12474))))

(declare-fun arrayContainsKey!0 (array!38664 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655326 (arrayContainsKey!0 lt!305506 (select (arr!18529 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305511 () Unit!22473)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38664 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22473)

(assert (=> b!655326 (= lt!305511 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305506 (select (arr!18529 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376354 () Bool)

(assert (=> b!655326 e!376354))

(declare-fun res!425069 () Bool)

(assert (=> b!655326 (=> (not res!425069) (not e!376354))))

(assert (=> b!655326 (= res!425069 (arrayContainsKey!0 lt!305506 (select (arr!18529 a!2986) j!136) j!136))))

(declare-fun e!376359 () Unit!22473)

(declare-fun Unit!22476 () Unit!22473)

(assert (=> b!655326 (= e!376359 Unit!22476)))

(declare-fun b!655327 () Bool)

(declare-fun e!376355 () Bool)

(assert (=> b!655327 (= e!376355 (not true))))

(declare-fun lt!305513 () Unit!22473)

(declare-fun e!376364 () Unit!22473)

(assert (=> b!655327 (= lt!305513 e!376364)))

(declare-fun c!75500 () Bool)

(declare-datatypes ((SeekEntryResult!6925 0))(
  ( (MissingZero!6925 (index!30059 (_ BitVec 32))) (Found!6925 (index!30060 (_ BitVec 32))) (Intermediate!6925 (undefined!7737 Bool) (index!30061 (_ BitVec 32)) (x!59001 (_ BitVec 32))) (Undefined!6925) (MissingVacant!6925 (index!30062 (_ BitVec 32))) )
))
(declare-fun lt!305520 () SeekEntryResult!6925)

(assert (=> b!655327 (= c!75500 (= lt!305520 (Found!6925 index!984)))))

(declare-fun lt!305523 () Unit!22473)

(declare-fun e!376361 () Unit!22473)

(assert (=> b!655327 (= lt!305523 e!376361)))

(declare-fun c!75502 () Bool)

(assert (=> b!655327 (= c!75502 (= lt!305520 Undefined!6925))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!305522 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38664 (_ BitVec 32)) SeekEntryResult!6925)

(assert (=> b!655327 (= lt!305520 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305522 lt!305506 mask!3053))))

(declare-fun e!376362 () Bool)

(assert (=> b!655327 e!376362))

(declare-fun res!425064 () Bool)

(assert (=> b!655327 (=> (not res!425064) (not e!376362))))

(declare-fun lt!305510 () (_ BitVec 32))

(declare-fun lt!305505 () SeekEntryResult!6925)

(assert (=> b!655327 (= res!425064 (= lt!305505 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305510 vacantSpotIndex!68 lt!305522 lt!305506 mask!3053)))))

(assert (=> b!655327 (= lt!305505 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305510 vacantSpotIndex!68 (select (arr!18529 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655327 (= lt!305522 (select (store (arr!18529 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!305518 () Unit!22473)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38664 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22473)

(assert (=> b!655327 (= lt!305518 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305510 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655327 (= lt!305510 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!655328 () Bool)

(declare-fun Unit!22477 () Unit!22473)

(assert (=> b!655328 (= e!376364 Unit!22477)))

(declare-fun b!655329 () Bool)

(declare-fun res!425070 () Bool)

(declare-fun e!376353 () Bool)

(assert (=> b!655329 (=> (not res!425070) (not e!376353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655329 (= res!425070 (validKeyInArray!0 k0!1786))))

(declare-fun b!655330 () Bool)

(declare-fun res!425067 () Bool)

(assert (=> b!655330 (= res!425067 (bvsge j!136 index!984))))

(declare-fun e!376363 () Bool)

(assert (=> b!655330 (=> res!425067 e!376363)))

(declare-fun e!376352 () Bool)

(assert (=> b!655330 (= e!376352 e!376363)))

(declare-fun b!655331 () Bool)

(declare-fun res!425066 () Bool)

(declare-fun e!376357 () Bool)

(assert (=> b!655331 (=> (not res!425066) (not e!376357))))

(assert (=> b!655331 (= res!425066 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18529 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655332 () Bool)

(declare-fun res!425068 () Bool)

(assert (=> b!655332 (=> (not res!425068) (not e!376357))))

(assert (=> b!655332 (= res!425068 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12474))))

(declare-fun b!655334 () Bool)

(declare-fun e!376356 () Bool)

(assert (=> b!655334 (= e!376357 e!376356)))

(declare-fun res!425065 () Bool)

(assert (=> b!655334 (=> (not res!425065) (not e!376356))))

(assert (=> b!655334 (= res!425065 (= (select (store (arr!18529 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655334 (= lt!305506 (array!38665 (store (arr!18529 a!2986) i!1108 k0!1786) (size!18893 a!2986)))))

(declare-fun b!655335 () Bool)

(assert (=> b!655335 false))

(declare-fun lt!305516 () Unit!22473)

(assert (=> b!655335 (= lt!305516 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305506 (select (arr!18529 a!2986) j!136) j!136 Nil!12474))))

(assert (=> b!655335 (arrayNoDuplicates!0 lt!305506 j!136 Nil!12474)))

(declare-fun lt!305509 () Unit!22473)

(assert (=> b!655335 (= lt!305509 (lemmaNoDuplicateFromThenFromBigger!0 lt!305506 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655335 (arrayNoDuplicates!0 lt!305506 #b00000000000000000000000000000000 Nil!12474)))

(declare-fun lt!305508 () Unit!22473)

(assert (=> b!655335 (= lt!305508 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12474))))

(assert (=> b!655335 (arrayContainsKey!0 lt!305506 (select (arr!18529 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305521 () Unit!22473)

(assert (=> b!655335 (= lt!305521 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305506 (select (arr!18529 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22478 () Unit!22473)

(assert (=> b!655335 (= e!376358 Unit!22478)))

(declare-fun b!655336 () Bool)

(declare-fun lt!305519 () SeekEntryResult!6925)

(assert (=> b!655336 (= e!376362 (= lt!305519 lt!305505))))

(declare-fun b!655337 () Bool)

(declare-fun Unit!22479 () Unit!22473)

(assert (=> b!655337 (= e!376359 Unit!22479)))

(declare-fun b!655338 () Bool)

(declare-fun res!425076 () Bool)

(assert (=> b!655338 (=> (not res!425076) (not e!376353))))

(assert (=> b!655338 (= res!425076 (validKeyInArray!0 (select (arr!18529 a!2986) j!136)))))

(declare-fun b!655339 () Bool)

(declare-fun res!425071 () Bool)

(assert (=> b!655339 (=> (not res!425071) (not e!376353))))

(assert (=> b!655339 (= res!425071 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655340 () Bool)

(assert (=> b!655340 (= e!376353 e!376357)))

(declare-fun res!425072 () Bool)

(assert (=> b!655340 (=> (not res!425072) (not e!376357))))

(declare-fun lt!305514 () SeekEntryResult!6925)

(assert (=> b!655340 (= res!425072 (or (= lt!305514 (MissingZero!6925 i!1108)) (= lt!305514 (MissingVacant!6925 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38664 (_ BitVec 32)) SeekEntryResult!6925)

(assert (=> b!655340 (= lt!305514 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!655341 () Bool)

(assert (=> b!655341 (= e!376356 e!376355)))

(declare-fun res!425077 () Bool)

(assert (=> b!655341 (=> (not res!425077) (not e!376355))))

(assert (=> b!655341 (= res!425077 (and (= lt!305519 (Found!6925 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18529 a!2986) index!984) (select (arr!18529 a!2986) j!136))) (not (= (select (arr!18529 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!655341 (= lt!305519 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18529 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655342 () Bool)

(declare-fun Unit!22480 () Unit!22473)

(assert (=> b!655342 (= e!376364 Unit!22480)))

(declare-fun res!425075 () Bool)

(assert (=> b!655342 (= res!425075 (= (select (store (arr!18529 a!2986) i!1108 k0!1786) index!984) (select (arr!18529 a!2986) j!136)))))

(assert (=> b!655342 (=> (not res!425075) (not e!376352))))

(assert (=> b!655342 e!376352))

(declare-fun c!75501 () Bool)

(assert (=> b!655342 (= c!75501 (bvslt j!136 index!984))))

(declare-fun lt!305517 () Unit!22473)

(assert (=> b!655342 (= lt!305517 e!376358)))

(declare-fun c!75503 () Bool)

(assert (=> b!655342 (= c!75503 (bvslt index!984 j!136))))

(declare-fun lt!305524 () Unit!22473)

(assert (=> b!655342 (= lt!305524 e!376359)))

(assert (=> b!655342 false))

(declare-fun b!655343 () Bool)

(declare-fun res!425073 () Bool)

(assert (=> b!655343 (=> (not res!425073) (not e!376357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38664 (_ BitVec 32)) Bool)

(assert (=> b!655343 (= res!425073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655333 () Bool)

(declare-fun Unit!22481 () Unit!22473)

(assert (=> b!655333 (= e!376361 Unit!22481)))

(declare-fun res!425074 () Bool)

(assert (=> start!59406 (=> (not res!425074) (not e!376353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59406 (= res!425074 (validMask!0 mask!3053))))

(assert (=> start!59406 e!376353))

(assert (=> start!59406 true))

(declare-fun array_inv!14388 (array!38664) Bool)

(assert (=> start!59406 (array_inv!14388 a!2986)))

(declare-fun b!655344 () Bool)

(declare-fun res!425062 () Bool)

(assert (=> b!655344 (=> (not res!425062) (not e!376353))))

(assert (=> b!655344 (= res!425062 (and (= (size!18893 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18893 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18893 a!2986)) (not (= i!1108 j!136))))))

(declare-fun e!376360 () Bool)

(declare-fun b!655345 () Bool)

(assert (=> b!655345 (= e!376360 (arrayContainsKey!0 lt!305506 (select (arr!18529 a!2986) j!136) index!984))))

(declare-fun b!655346 () Bool)

(declare-fun Unit!22482 () Unit!22473)

(assert (=> b!655346 (= e!376361 Unit!22482)))

(assert (=> b!655346 false))

(declare-fun b!655347 () Bool)

(declare-fun res!425063 () Bool)

(assert (=> b!655347 (= res!425063 (arrayContainsKey!0 lt!305506 (select (arr!18529 a!2986) j!136) j!136))))

(assert (=> b!655347 (=> (not res!425063) (not e!376360))))

(assert (=> b!655347 (= e!376363 e!376360)))

(declare-fun b!655348 () Bool)

(assert (=> b!655348 (= e!376354 (arrayContainsKey!0 lt!305506 (select (arr!18529 a!2986) j!136) index!984))))

(assert (= (and start!59406 res!425074) b!655344))

(assert (= (and b!655344 res!425062) b!655338))

(assert (= (and b!655338 res!425076) b!655329))

(assert (= (and b!655329 res!425070) b!655339))

(assert (= (and b!655339 res!425071) b!655340))

(assert (= (and b!655340 res!425072) b!655343))

(assert (= (and b!655343 res!425073) b!655332))

(assert (= (and b!655332 res!425068) b!655331))

(assert (= (and b!655331 res!425066) b!655334))

(assert (= (and b!655334 res!425065) b!655341))

(assert (= (and b!655341 res!425077) b!655327))

(assert (= (and b!655327 res!425064) b!655336))

(assert (= (and b!655327 c!75502) b!655346))

(assert (= (and b!655327 (not c!75502)) b!655333))

(assert (= (and b!655327 c!75500) b!655342))

(assert (= (and b!655327 (not c!75500)) b!655328))

(assert (= (and b!655342 res!425075) b!655330))

(assert (= (and b!655330 (not res!425067)) b!655347))

(assert (= (and b!655347 res!425063) b!655345))

(assert (= (and b!655342 c!75501) b!655335))

(assert (= (and b!655342 (not c!75501)) b!655325))

(assert (= (and b!655342 c!75503) b!655326))

(assert (= (and b!655342 (not c!75503)) b!655337))

(assert (= (and b!655326 res!425069) b!655348))

(declare-fun m!628867 () Bool)

(assert (=> b!655338 m!628867))

(assert (=> b!655338 m!628867))

(declare-fun m!628869 () Bool)

(assert (=> b!655338 m!628869))

(declare-fun m!628871 () Bool)

(assert (=> b!655327 m!628871))

(declare-fun m!628873 () Bool)

(assert (=> b!655327 m!628873))

(declare-fun m!628875 () Bool)

(assert (=> b!655327 m!628875))

(declare-fun m!628877 () Bool)

(assert (=> b!655327 m!628877))

(assert (=> b!655327 m!628867))

(declare-fun m!628879 () Bool)

(assert (=> b!655327 m!628879))

(declare-fun m!628881 () Bool)

(assert (=> b!655327 m!628881))

(declare-fun m!628883 () Bool)

(assert (=> b!655327 m!628883))

(assert (=> b!655327 m!628867))

(declare-fun m!628885 () Bool)

(assert (=> b!655331 m!628885))

(assert (=> b!655335 m!628867))

(declare-fun m!628887 () Bool)

(assert (=> b!655335 m!628887))

(assert (=> b!655335 m!628867))

(declare-fun m!628889 () Bool)

(assert (=> b!655335 m!628889))

(assert (=> b!655335 m!628867))

(declare-fun m!628891 () Bool)

(assert (=> b!655335 m!628891))

(declare-fun m!628893 () Bool)

(assert (=> b!655335 m!628893))

(declare-fun m!628895 () Bool)

(assert (=> b!655335 m!628895))

(declare-fun m!628897 () Bool)

(assert (=> b!655335 m!628897))

(declare-fun m!628899 () Bool)

(assert (=> b!655335 m!628899))

(assert (=> b!655335 m!628867))

(assert (=> b!655347 m!628867))

(assert (=> b!655347 m!628867))

(declare-fun m!628901 () Bool)

(assert (=> b!655347 m!628901))

(declare-fun m!628903 () Bool)

(assert (=> b!655340 m!628903))

(assert (=> b!655342 m!628873))

(declare-fun m!628905 () Bool)

(assert (=> b!655342 m!628905))

(assert (=> b!655342 m!628867))

(declare-fun m!628907 () Bool)

(assert (=> b!655332 m!628907))

(declare-fun m!628909 () Bool)

(assert (=> b!655343 m!628909))

(declare-fun m!628911 () Bool)

(assert (=> b!655339 m!628911))

(assert (=> b!655345 m!628867))

(assert (=> b!655345 m!628867))

(declare-fun m!628913 () Bool)

(assert (=> b!655345 m!628913))

(assert (=> b!655334 m!628873))

(declare-fun m!628915 () Bool)

(assert (=> b!655334 m!628915))

(declare-fun m!628917 () Bool)

(assert (=> b!655329 m!628917))

(assert (=> b!655348 m!628867))

(assert (=> b!655348 m!628867))

(assert (=> b!655348 m!628913))

(declare-fun m!628919 () Bool)

(assert (=> b!655341 m!628919))

(assert (=> b!655341 m!628867))

(assert (=> b!655341 m!628867))

(declare-fun m!628921 () Bool)

(assert (=> b!655341 m!628921))

(declare-fun m!628923 () Bool)

(assert (=> start!59406 m!628923))

(declare-fun m!628925 () Bool)

(assert (=> start!59406 m!628925))

(assert (=> b!655326 m!628867))

(assert (=> b!655326 m!628901))

(declare-fun m!628927 () Bool)

(assert (=> b!655326 m!628927))

(assert (=> b!655326 m!628867))

(declare-fun m!628929 () Bool)

(assert (=> b!655326 m!628929))

(declare-fun m!628931 () Bool)

(assert (=> b!655326 m!628931))

(assert (=> b!655326 m!628867))

(declare-fun m!628933 () Bool)

(assert (=> b!655326 m!628933))

(assert (=> b!655326 m!628867))

(declare-fun m!628935 () Bool)

(assert (=> b!655326 m!628935))

(assert (=> b!655326 m!628895))

(assert (=> b!655326 m!628899))

(assert (=> b!655326 m!628867))

(check-sat (not start!59406) (not b!655345) (not b!655339) (not b!655327) (not b!655347) (not b!655348) (not b!655341) (not b!655332) (not b!655338) (not b!655329) (not b!655326) (not b!655340) (not b!655343) (not b!655335))
(check-sat)
