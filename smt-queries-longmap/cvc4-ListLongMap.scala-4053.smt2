; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55550 () Bool)

(assert start!55550)

(declare-fun b!607458 () Bool)

(declare-fun e!347866 () Bool)

(declare-fun e!347873 () Bool)

(assert (=> b!607458 (= e!347866 e!347873)))

(declare-fun res!390285 () Bool)

(assert (=> b!607458 (=> (not res!390285) (not e!347873))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37281 0))(
  ( (array!37282 (arr!17891 (Array (_ BitVec 32) (_ BitVec 64))) (size!18255 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37281)

(assert (=> b!607458 (= res!390285 (= (select (store (arr!17891 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!277343 () array!37281)

(assert (=> b!607458 (= lt!277343 (array!37282 (store (arr!17891 a!2986) i!1108 k!1786) (size!18255 a!2986)))))

(declare-fun b!607459 () Bool)

(declare-fun res!390280 () Bool)

(declare-fun e!347862 () Bool)

(assert (=> b!607459 (=> (not res!390280) (not e!347862))))

(declare-fun arrayContainsKey!0 (array!37281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!607459 (= res!390280 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!390287 () Bool)

(assert (=> start!55550 (=> (not res!390287) (not e!347862))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55550 (= res!390287 (validMask!0 mask!3053))))

(assert (=> start!55550 e!347862))

(assert (=> start!55550 true))

(declare-fun array_inv!13687 (array!37281) Bool)

(assert (=> start!55550 (array_inv!13687 a!2986)))

(declare-fun e!347875 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!607460 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!607460 (= e!347875 (arrayContainsKey!0 lt!277343 (select (arr!17891 a!2986) j!136) index!984))))

(declare-fun b!607461 () Bool)

(declare-fun e!347867 () Bool)

(declare-datatypes ((SeekEntryResult!6331 0))(
  ( (MissingZero!6331 (index!27599 (_ BitVec 32))) (Found!6331 (index!27600 (_ BitVec 32))) (Intermediate!6331 (undefined!7143 Bool) (index!27601 (_ BitVec 32)) (x!56408 (_ BitVec 32))) (Undefined!6331) (MissingVacant!6331 (index!27602 (_ BitVec 32))) )
))
(declare-fun lt!277351 () SeekEntryResult!6331)

(declare-fun lt!277350 () SeekEntryResult!6331)

(assert (=> b!607461 (= e!347867 (= lt!277351 lt!277350))))

(declare-fun b!607462 () Bool)

(declare-fun res!390292 () Bool)

(declare-fun e!347863 () Bool)

(assert (=> b!607462 (=> res!390292 e!347863)))

(declare-datatypes ((List!11932 0))(
  ( (Nil!11929) (Cons!11928 (h!12973 (_ BitVec 64)) (t!18160 List!11932)) )
))
(declare-fun contains!3008 (List!11932 (_ BitVec 64)) Bool)

(assert (=> b!607462 (= res!390292 (contains!3008 Nil!11929 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607463 () Bool)

(declare-fun res!390281 () Bool)

(assert (=> b!607463 (=> (not res!390281) (not e!347866))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!607463 (= res!390281 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17891 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!607464 () Bool)

(assert (=> b!607464 (= e!347862 e!347866)))

(declare-fun res!390293 () Bool)

(assert (=> b!607464 (=> (not res!390293) (not e!347866))))

(declare-fun lt!277345 () SeekEntryResult!6331)

(assert (=> b!607464 (= res!390293 (or (= lt!277345 (MissingZero!6331 i!1108)) (= lt!277345 (MissingVacant!6331 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37281 (_ BitVec 32)) SeekEntryResult!6331)

(assert (=> b!607464 (= lt!277345 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!607465 () Bool)

(declare-fun e!347871 () Bool)

(declare-fun e!347877 () Bool)

(assert (=> b!607465 (= e!347871 (not e!347877))))

(declare-fun res!390275 () Bool)

(assert (=> b!607465 (=> res!390275 e!347877)))

(declare-fun lt!277340 () SeekEntryResult!6331)

(assert (=> b!607465 (= res!390275 (not (= lt!277340 (Found!6331 index!984))))))

(declare-datatypes ((Unit!19366 0))(
  ( (Unit!19367) )
))
(declare-fun lt!277347 () Unit!19366)

(declare-fun e!347868 () Unit!19366)

(assert (=> b!607465 (= lt!277347 e!347868)))

(declare-fun c!68959 () Bool)

(assert (=> b!607465 (= c!68959 (= lt!277340 Undefined!6331))))

(declare-fun lt!277348 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37281 (_ BitVec 32)) SeekEntryResult!6331)

(assert (=> b!607465 (= lt!277340 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!277348 lt!277343 mask!3053))))

(assert (=> b!607465 e!347867))

(declare-fun res!390276 () Bool)

(assert (=> b!607465 (=> (not res!390276) (not e!347867))))

(declare-fun lt!277344 () (_ BitVec 32))

(assert (=> b!607465 (= res!390276 (= lt!277350 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277344 vacantSpotIndex!68 lt!277348 lt!277343 mask!3053)))))

(assert (=> b!607465 (= lt!277350 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!277344 vacantSpotIndex!68 (select (arr!17891 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!607465 (= lt!277348 (select (store (arr!17891 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!277346 () Unit!19366)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37281 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19366)

(assert (=> b!607465 (= lt!277346 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!277344 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!607465 (= lt!277344 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!607466 () Bool)

(declare-fun Unit!19368 () Unit!19366)

(assert (=> b!607466 (= e!347868 Unit!19368)))

(declare-fun b!607467 () Bool)

(declare-fun res!390286 () Bool)

(assert (=> b!607467 (=> res!390286 e!347863)))

(declare-fun noDuplicate!314 (List!11932) Bool)

(assert (=> b!607467 (= res!390286 (not (noDuplicate!314 Nil!11929)))))

(declare-fun b!607468 () Bool)

(declare-fun e!347876 () Unit!19366)

(declare-fun Unit!19369 () Unit!19366)

(assert (=> b!607468 (= e!347876 Unit!19369)))

(declare-fun b!607469 () Bool)

(declare-fun e!347865 () Bool)

(assert (=> b!607469 (= e!347877 e!347865)))

(declare-fun res!390294 () Bool)

(assert (=> b!607469 (=> res!390294 e!347865)))

(declare-fun lt!277342 () (_ BitVec 64))

(assert (=> b!607469 (= res!390294 (or (not (= (select (arr!17891 a!2986) j!136) lt!277348)) (not (= (select (arr!17891 a!2986) j!136) lt!277342))))))

(declare-fun e!347872 () Bool)

(assert (=> b!607469 e!347872))

(declare-fun res!390295 () Bool)

(assert (=> b!607469 (=> (not res!390295) (not e!347872))))

(assert (=> b!607469 (= res!390295 (= lt!277342 (select (arr!17891 a!2986) j!136)))))

(assert (=> b!607469 (= lt!277342 (select (store (arr!17891 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!607470 () Bool)

(assert (=> b!607470 (= e!347863 true)))

(declare-fun lt!277339 () Bool)

(assert (=> b!607470 (= lt!277339 (contains!3008 Nil!11929 k!1786))))

(declare-fun b!607471 () Bool)

(declare-fun e!347870 () Bool)

(assert (=> b!607471 (= e!347870 e!347863)))

(declare-fun res!390296 () Bool)

(assert (=> b!607471 (=> res!390296 e!347863)))

(assert (=> b!607471 (= res!390296 (or (bvsge (size!18255 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18255 a!2986))))))

(assert (=> b!607471 (arrayContainsKey!0 lt!277343 (select (arr!17891 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!277337 () Unit!19366)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37281 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19366)

(assert (=> b!607471 (= lt!277337 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277343 (select (arr!17891 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!347874 () Bool)

(assert (=> b!607471 e!347874))

(declare-fun res!390278 () Bool)

(assert (=> b!607471 (=> (not res!390278) (not e!347874))))

(assert (=> b!607471 (= res!390278 (arrayContainsKey!0 lt!277343 (select (arr!17891 a!2986) j!136) j!136))))

(declare-fun b!607472 () Bool)

(declare-fun res!390277 () Bool)

(assert (=> b!607472 (=> res!390277 e!347863)))

(assert (=> b!607472 (= res!390277 (contains!3008 Nil!11929 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!607473 () Bool)

(assert (=> b!607473 (= e!347865 e!347870)))

(declare-fun res!390289 () Bool)

(assert (=> b!607473 (=> res!390289 e!347870)))

(assert (=> b!607473 (= res!390289 (bvsge index!984 j!136))))

(declare-fun lt!277349 () Unit!19366)

(assert (=> b!607473 (= lt!277349 e!347876)))

(declare-fun c!68960 () Bool)

(assert (=> b!607473 (= c!68960 (bvslt j!136 index!984))))

(declare-fun b!607474 () Bool)

(declare-fun res!390288 () Bool)

(assert (=> b!607474 (=> (not res!390288) (not e!347866))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37281 (_ BitVec 32)) Bool)

(assert (=> b!607474 (= res!390288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!607475 () Bool)

(declare-fun e!347869 () Bool)

(assert (=> b!607475 (= e!347872 e!347869)))

(declare-fun res!390291 () Bool)

(assert (=> b!607475 (=> res!390291 e!347869)))

(assert (=> b!607475 (= res!390291 (or (not (= (select (arr!17891 a!2986) j!136) lt!277348)) (not (= (select (arr!17891 a!2986) j!136) lt!277342)) (bvsge j!136 index!984)))))

(declare-fun b!607476 () Bool)

(declare-fun Unit!19370 () Unit!19366)

(assert (=> b!607476 (= e!347868 Unit!19370)))

(assert (=> b!607476 false))

(declare-fun b!607477 () Bool)

(declare-fun res!390279 () Bool)

(assert (=> b!607477 (=> (not res!390279) (not e!347862))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!607477 (= res!390279 (validKeyInArray!0 (select (arr!17891 a!2986) j!136)))))

(declare-fun b!607478 () Bool)

(declare-fun res!390282 () Bool)

(assert (=> b!607478 (=> (not res!390282) (not e!347866))))

(declare-fun arrayNoDuplicates!0 (array!37281 (_ BitVec 32) List!11932) Bool)

(assert (=> b!607478 (= res!390282 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11929))))

(declare-fun b!607479 () Bool)

(assert (=> b!607479 (= e!347869 e!347875)))

(declare-fun res!390283 () Bool)

(assert (=> b!607479 (=> (not res!390283) (not e!347875))))

(assert (=> b!607479 (= res!390283 (arrayContainsKey!0 lt!277343 (select (arr!17891 a!2986) j!136) j!136))))

(declare-fun b!607480 () Bool)

(assert (=> b!607480 (= e!347874 (arrayContainsKey!0 lt!277343 (select (arr!17891 a!2986) j!136) index!984))))

(declare-fun b!607481 () Bool)

(declare-fun Unit!19371 () Unit!19366)

(assert (=> b!607481 (= e!347876 Unit!19371)))

(declare-fun lt!277338 () Unit!19366)

(assert (=> b!607481 (= lt!277338 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!277343 (select (arr!17891 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!607481 (arrayContainsKey!0 lt!277343 (select (arr!17891 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!277335 () Unit!19366)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37281 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11932) Unit!19366)

(assert (=> b!607481 (= lt!277335 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11929))))

(assert (=> b!607481 (arrayNoDuplicates!0 lt!277343 #b00000000000000000000000000000000 Nil!11929)))

(declare-fun lt!277336 () Unit!19366)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37281 (_ BitVec 32) (_ BitVec 32)) Unit!19366)

(assert (=> b!607481 (= lt!277336 (lemmaNoDuplicateFromThenFromBigger!0 lt!277343 #b00000000000000000000000000000000 j!136))))

(assert (=> b!607481 (arrayNoDuplicates!0 lt!277343 j!136 Nil!11929)))

(declare-fun lt!277341 () Unit!19366)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37281 (_ BitVec 64) (_ BitVec 32) List!11932) Unit!19366)

(assert (=> b!607481 (= lt!277341 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!277343 (select (arr!17891 a!2986) j!136) j!136 Nil!11929))))

(assert (=> b!607481 false))

(declare-fun b!607482 () Bool)

(declare-fun res!390274 () Bool)

(assert (=> b!607482 (=> (not res!390274) (not e!347862))))

(assert (=> b!607482 (= res!390274 (validKeyInArray!0 k!1786))))

(declare-fun b!607483 () Bool)

(assert (=> b!607483 (= e!347873 e!347871)))

(declare-fun res!390284 () Bool)

(assert (=> b!607483 (=> (not res!390284) (not e!347871))))

(assert (=> b!607483 (= res!390284 (and (= lt!277351 (Found!6331 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17891 a!2986) index!984) (select (arr!17891 a!2986) j!136))) (not (= (select (arr!17891 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!607483 (= lt!277351 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17891 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!607484 () Bool)

(declare-fun res!390290 () Bool)

(assert (=> b!607484 (=> (not res!390290) (not e!347862))))

(assert (=> b!607484 (= res!390290 (and (= (size!18255 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18255 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18255 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!55550 res!390287) b!607484))

(assert (= (and b!607484 res!390290) b!607477))

(assert (= (and b!607477 res!390279) b!607482))

(assert (= (and b!607482 res!390274) b!607459))

(assert (= (and b!607459 res!390280) b!607464))

(assert (= (and b!607464 res!390293) b!607474))

(assert (= (and b!607474 res!390288) b!607478))

(assert (= (and b!607478 res!390282) b!607463))

(assert (= (and b!607463 res!390281) b!607458))

(assert (= (and b!607458 res!390285) b!607483))

(assert (= (and b!607483 res!390284) b!607465))

(assert (= (and b!607465 res!390276) b!607461))

(assert (= (and b!607465 c!68959) b!607476))

(assert (= (and b!607465 (not c!68959)) b!607466))

(assert (= (and b!607465 (not res!390275)) b!607469))

(assert (= (and b!607469 res!390295) b!607475))

(assert (= (and b!607475 (not res!390291)) b!607479))

(assert (= (and b!607479 res!390283) b!607460))

(assert (= (and b!607469 (not res!390294)) b!607473))

(assert (= (and b!607473 c!68960) b!607481))

(assert (= (and b!607473 (not c!68960)) b!607468))

(assert (= (and b!607473 (not res!390289)) b!607471))

(assert (= (and b!607471 res!390278) b!607480))

(assert (= (and b!607471 (not res!390296)) b!607467))

(assert (= (and b!607467 (not res!390286)) b!607462))

(assert (= (and b!607462 (not res!390292)) b!607472))

(assert (= (and b!607472 (not res!390277)) b!607470))

(declare-fun m!584195 () Bool)

(assert (=> b!607467 m!584195))

(declare-fun m!584197 () Bool)

(assert (=> b!607469 m!584197))

(declare-fun m!584199 () Bool)

(assert (=> b!607469 m!584199))

(declare-fun m!584201 () Bool)

(assert (=> b!607469 m!584201))

(assert (=> b!607479 m!584197))

(assert (=> b!607479 m!584197))

(declare-fun m!584203 () Bool)

(assert (=> b!607479 m!584203))

(assert (=> b!607471 m!584197))

(assert (=> b!607471 m!584197))

(declare-fun m!584205 () Bool)

(assert (=> b!607471 m!584205))

(assert (=> b!607471 m!584197))

(declare-fun m!584207 () Bool)

(assert (=> b!607471 m!584207))

(assert (=> b!607471 m!584197))

(assert (=> b!607471 m!584203))

(declare-fun m!584209 () Bool)

(assert (=> b!607483 m!584209))

(assert (=> b!607483 m!584197))

(assert (=> b!607483 m!584197))

(declare-fun m!584211 () Bool)

(assert (=> b!607483 m!584211))

(declare-fun m!584213 () Bool)

(assert (=> b!607472 m!584213))

(declare-fun m!584215 () Bool)

(assert (=> b!607464 m!584215))

(declare-fun m!584217 () Bool)

(assert (=> b!607463 m!584217))

(assert (=> b!607480 m!584197))

(assert (=> b!607480 m!584197))

(declare-fun m!584219 () Bool)

(assert (=> b!607480 m!584219))

(declare-fun m!584221 () Bool)

(assert (=> b!607482 m!584221))

(declare-fun m!584223 () Bool)

(assert (=> b!607470 m!584223))

(declare-fun m!584225 () Bool)

(assert (=> b!607465 m!584225))

(declare-fun m!584227 () Bool)

(assert (=> b!607465 m!584227))

(assert (=> b!607465 m!584197))

(assert (=> b!607465 m!584199))

(declare-fun m!584229 () Bool)

(assert (=> b!607465 m!584229))

(declare-fun m!584231 () Bool)

(assert (=> b!607465 m!584231))

(declare-fun m!584233 () Bool)

(assert (=> b!607465 m!584233))

(assert (=> b!607465 m!584197))

(declare-fun m!584235 () Bool)

(assert (=> b!607465 m!584235))

(declare-fun m!584237 () Bool)

(assert (=> b!607474 m!584237))

(assert (=> b!607458 m!584199))

(declare-fun m!584239 () Bool)

(assert (=> b!607458 m!584239))

(assert (=> b!607477 m!584197))

(assert (=> b!607477 m!584197))

(declare-fun m!584241 () Bool)

(assert (=> b!607477 m!584241))

(assert (=> b!607460 m!584197))

(assert (=> b!607460 m!584197))

(assert (=> b!607460 m!584219))

(declare-fun m!584243 () Bool)

(assert (=> b!607478 m!584243))

(assert (=> b!607481 m!584197))

(declare-fun m!584245 () Bool)

(assert (=> b!607481 m!584245))

(assert (=> b!607481 m!584197))

(assert (=> b!607481 m!584197))

(declare-fun m!584247 () Bool)

(assert (=> b!607481 m!584247))

(declare-fun m!584249 () Bool)

(assert (=> b!607481 m!584249))

(assert (=> b!607481 m!584197))

(declare-fun m!584251 () Bool)

(assert (=> b!607481 m!584251))

(declare-fun m!584253 () Bool)

(assert (=> b!607481 m!584253))

(declare-fun m!584255 () Bool)

(assert (=> b!607481 m!584255))

(declare-fun m!584257 () Bool)

(assert (=> b!607481 m!584257))

(declare-fun m!584259 () Bool)

(assert (=> b!607462 m!584259))

(declare-fun m!584261 () Bool)

(assert (=> start!55550 m!584261))

(declare-fun m!584263 () Bool)

(assert (=> start!55550 m!584263))

(declare-fun m!584265 () Bool)

(assert (=> b!607459 m!584265))

(assert (=> b!607475 m!584197))

(push 1)

(assert (not b!607477))

(assert (not start!55550))

(assert (not b!607481))

(assert (not b!607464))

(assert (not b!607472))

(assert (not b!607471))

(assert (not b!607480))

(assert (not b!607483))

(assert (not b!607478))

(assert (not b!607465))

(assert (not b!607467))

(assert (not b!607474))

(assert (not b!607482))

(assert (not b!607459))

(assert (not b!607470))

(assert (not b!607462))

(assert (not b!607479))

(assert (not b!607460))

(check-sat)

