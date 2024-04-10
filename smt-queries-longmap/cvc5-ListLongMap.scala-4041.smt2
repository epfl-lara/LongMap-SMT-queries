; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55120 () Bool)

(assert start!55120)

(declare-fun b!603340 () Bool)

(declare-fun e!345138 () Bool)

(declare-fun e!345142 () Bool)

(assert (=> b!603340 (= e!345138 e!345142)))

(declare-fun res!387466 () Bool)

(assert (=> b!603340 (=> res!387466 e!345142)))

(declare-fun lt!274939 () (_ BitVec 64))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37193 0))(
  ( (array!37194 (arr!17853 (Array (_ BitVec 32) (_ BitVec 64))) (size!18217 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37193)

(declare-fun lt!274934 () (_ BitVec 64))

(assert (=> b!603340 (= res!387466 (or (not (= (select (arr!17853 a!2986) j!136) lt!274939)) (not (= (select (arr!17853 a!2986) j!136) lt!274934)) (bvsge j!136 index!984)))))

(declare-fun b!603341 () Bool)

(declare-fun res!387455 () Bool)

(declare-fun e!345139 () Bool)

(assert (=> b!603341 (=> (not res!387455) (not e!345139))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!603341 (= res!387455 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!603342 () Bool)

(declare-fun e!345137 () Bool)

(declare-fun e!345146 () Bool)

(assert (=> b!603342 (= e!345137 e!345146)))

(declare-fun res!387467 () Bool)

(assert (=> b!603342 (=> res!387467 e!345146)))

(assert (=> b!603342 (= res!387467 (or (not (= (select (arr!17853 a!2986) j!136) lt!274939)) (not (= (select (arr!17853 a!2986) j!136) lt!274934))))))

(assert (=> b!603342 e!345138))

(declare-fun res!387458 () Bool)

(assert (=> b!603342 (=> (not res!387458) (not e!345138))))

(assert (=> b!603342 (= res!387458 (= lt!274934 (select (arr!17853 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!603342 (= lt!274934 (select (store (arr!17853 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!603343 () Bool)

(declare-fun e!345148 () Bool)

(declare-fun e!345147 () Bool)

(assert (=> b!603343 (= e!345148 e!345147)))

(declare-fun res!387461 () Bool)

(assert (=> b!603343 (=> (not res!387461) (not e!345147))))

(declare-datatypes ((SeekEntryResult!6293 0))(
  ( (MissingZero!6293 (index!27435 (_ BitVec 32))) (Found!6293 (index!27436 (_ BitVec 32))) (Intermediate!6293 (undefined!7105 Bool) (index!27437 (_ BitVec 32)) (x!56238 (_ BitVec 32))) (Undefined!6293) (MissingVacant!6293 (index!27438 (_ BitVec 32))) )
))
(declare-fun lt!274928 () SeekEntryResult!6293)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!603343 (= res!387461 (and (= lt!274928 (Found!6293 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17853 a!2986) index!984) (select (arr!17853 a!2986) j!136))) (not (= (select (arr!17853 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37193 (_ BitVec 32)) SeekEntryResult!6293)

(assert (=> b!603343 (= lt!274928 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17853 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!603344 () Bool)

(declare-fun e!345143 () Bool)

(declare-fun lt!274932 () SeekEntryResult!6293)

(assert (=> b!603344 (= e!345143 (= lt!274928 lt!274932))))

(declare-fun b!603345 () Bool)

(declare-datatypes ((Unit!19138 0))(
  ( (Unit!19139) )
))
(declare-fun e!345145 () Unit!19138)

(declare-fun Unit!19140 () Unit!19138)

(assert (=> b!603345 (= e!345145 Unit!19140)))

(declare-fun lt!274930 () Unit!19138)

(declare-fun lt!274931 () array!37193)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37193 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19138)

(assert (=> b!603345 (= lt!274930 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!274931 (select (arr!17853 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!603345 (arrayContainsKey!0 lt!274931 (select (arr!17853 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!274929 () Unit!19138)

(declare-datatypes ((List!11894 0))(
  ( (Nil!11891) (Cons!11890 (h!12935 (_ BitVec 64)) (t!18122 List!11894)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37193 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11894) Unit!19138)

(assert (=> b!603345 (= lt!274929 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11891))))

(declare-fun arrayNoDuplicates!0 (array!37193 (_ BitVec 32) List!11894) Bool)

(assert (=> b!603345 (arrayNoDuplicates!0 lt!274931 #b00000000000000000000000000000000 Nil!11891)))

(declare-fun lt!274938 () Unit!19138)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37193 (_ BitVec 32) (_ BitVec 32)) Unit!19138)

(assert (=> b!603345 (= lt!274938 (lemmaNoDuplicateFromThenFromBigger!0 lt!274931 #b00000000000000000000000000000000 j!136))))

(assert (=> b!603345 (arrayNoDuplicates!0 lt!274931 j!136 Nil!11891)))

(declare-fun lt!274936 () Unit!19138)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37193 (_ BitVec 64) (_ BitVec 32) List!11894) Unit!19138)

(assert (=> b!603345 (= lt!274936 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!274931 (select (arr!17853 a!2986) j!136) j!136 Nil!11891))))

(assert (=> b!603345 false))

(declare-fun b!603346 () Bool)

(declare-fun e!345150 () Bool)

(assert (=> b!603346 (= e!345142 e!345150)))

(declare-fun res!387464 () Bool)

(assert (=> b!603346 (=> (not res!387464) (not e!345150))))

(assert (=> b!603346 (= res!387464 (arrayContainsKey!0 lt!274931 (select (arr!17853 a!2986) j!136) j!136))))

(declare-fun b!603347 () Bool)

(declare-fun e!345144 () Unit!19138)

(declare-fun Unit!19141 () Unit!19138)

(assert (=> b!603347 (= e!345144 Unit!19141)))

(assert (=> b!603347 false))

(declare-fun res!387462 () Bool)

(assert (=> start!55120 (=> (not res!387462) (not e!345139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55120 (= res!387462 (validMask!0 mask!3053))))

(assert (=> start!55120 e!345139))

(assert (=> start!55120 true))

(declare-fun array_inv!13649 (array!37193) Bool)

(assert (=> start!55120 (array_inv!13649 a!2986)))

(declare-fun b!603348 () Bool)

(declare-fun Unit!19142 () Unit!19138)

(assert (=> b!603348 (= e!345144 Unit!19142)))

(declare-fun b!603349 () Bool)

(declare-fun e!345141 () Bool)

(assert (=> b!603349 (= e!345146 e!345141)))

(declare-fun res!387468 () Bool)

(assert (=> b!603349 (=> res!387468 e!345141)))

(assert (=> b!603349 (= res!387468 (bvsge index!984 j!136))))

(declare-fun lt!274942 () Unit!19138)

(assert (=> b!603349 (= lt!274942 e!345145)))

(declare-fun c!68312 () Bool)

(assert (=> b!603349 (= c!68312 (bvslt j!136 index!984))))

(declare-fun b!603350 () Bool)

(declare-fun e!345136 () Bool)

(assert (=> b!603350 (= e!345136 (arrayContainsKey!0 lt!274931 (select (arr!17853 a!2986) j!136) index!984))))

(declare-fun b!603351 () Bool)

(declare-fun Unit!19143 () Unit!19138)

(assert (=> b!603351 (= e!345145 Unit!19143)))

(declare-fun b!603352 () Bool)

(declare-fun e!345149 () Bool)

(assert (=> b!603352 (= e!345139 e!345149)))

(declare-fun res!387456 () Bool)

(assert (=> b!603352 (=> (not res!387456) (not e!345149))))

(declare-fun lt!274940 () SeekEntryResult!6293)

(assert (=> b!603352 (= res!387456 (or (= lt!274940 (MissingZero!6293 i!1108)) (= lt!274940 (MissingVacant!6293 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37193 (_ BitVec 32)) SeekEntryResult!6293)

(assert (=> b!603352 (= lt!274940 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!603353 () Bool)

(assert (=> b!603353 (= e!345149 e!345148)))

(declare-fun res!387470 () Bool)

(assert (=> b!603353 (=> (not res!387470) (not e!345148))))

(assert (=> b!603353 (= res!387470 (= (select (store (arr!17853 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!603353 (= lt!274931 (array!37194 (store (arr!17853 a!2986) i!1108 k!1786) (size!18217 a!2986)))))

(declare-fun b!603354 () Bool)

(declare-fun res!387469 () Bool)

(assert (=> b!603354 (=> (not res!387469) (not e!345149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37193 (_ BitVec 32)) Bool)

(assert (=> b!603354 (= res!387469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!603355 () Bool)

(declare-fun res!387452 () Bool)

(assert (=> b!603355 (=> (not res!387452) (not e!345139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!603355 (= res!387452 (validKeyInArray!0 k!1786))))

(declare-fun b!603356 () Bool)

(declare-fun res!387457 () Bool)

(assert (=> b!603356 (=> (not res!387457) (not e!345149))))

(assert (=> b!603356 (= res!387457 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17853 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!603357 () Bool)

(declare-fun res!387459 () Bool)

(assert (=> b!603357 (=> (not res!387459) (not e!345139))))

(assert (=> b!603357 (= res!387459 (validKeyInArray!0 (select (arr!17853 a!2986) j!136)))))

(declare-fun b!603358 () Bool)

(declare-fun res!387465 () Bool)

(assert (=> b!603358 (=> (not res!387465) (not e!345149))))

(assert (=> b!603358 (= res!387465 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11891))))

(declare-fun b!603359 () Bool)

(assert (=> b!603359 (= e!345147 (not e!345137))))

(declare-fun res!387463 () Bool)

(assert (=> b!603359 (=> res!387463 e!345137)))

(declare-fun lt!274937 () SeekEntryResult!6293)

(assert (=> b!603359 (= res!387463 (not (= lt!274937 (Found!6293 index!984))))))

(declare-fun lt!274933 () Unit!19138)

(assert (=> b!603359 (= lt!274933 e!345144)))

(declare-fun c!68311 () Bool)

(assert (=> b!603359 (= c!68311 (= lt!274937 Undefined!6293))))

(assert (=> b!603359 (= lt!274937 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!274939 lt!274931 mask!3053))))

(assert (=> b!603359 e!345143))

(declare-fun res!387460 () Bool)

(assert (=> b!603359 (=> (not res!387460) (not e!345143))))

(declare-fun lt!274935 () (_ BitVec 32))

(assert (=> b!603359 (= res!387460 (= lt!274932 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274935 vacantSpotIndex!68 lt!274939 lt!274931 mask!3053)))))

(assert (=> b!603359 (= lt!274932 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!274935 vacantSpotIndex!68 (select (arr!17853 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!603359 (= lt!274939 (select (store (arr!17853 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!274941 () Unit!19138)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19138)

(assert (=> b!603359 (= lt!274941 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!274935 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!603359 (= lt!274935 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!603360 () Bool)

(declare-fun res!387454 () Bool)

(assert (=> b!603360 (=> (not res!387454) (not e!345139))))

(assert (=> b!603360 (= res!387454 (and (= (size!18217 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18217 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18217 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!603361 () Bool)

(assert (=> b!603361 (= e!345141 true)))

(assert (=> b!603361 e!345136))

(declare-fun res!387453 () Bool)

(assert (=> b!603361 (=> (not res!387453) (not e!345136))))

(assert (=> b!603361 (= res!387453 (arrayContainsKey!0 lt!274931 (select (arr!17853 a!2986) j!136) j!136))))

(declare-fun b!603362 () Bool)

(assert (=> b!603362 (= e!345150 (arrayContainsKey!0 lt!274931 (select (arr!17853 a!2986) j!136) index!984))))

(assert (= (and start!55120 res!387462) b!603360))

(assert (= (and b!603360 res!387454) b!603357))

(assert (= (and b!603357 res!387459) b!603355))

(assert (= (and b!603355 res!387452) b!603341))

(assert (= (and b!603341 res!387455) b!603352))

(assert (= (and b!603352 res!387456) b!603354))

(assert (= (and b!603354 res!387469) b!603358))

(assert (= (and b!603358 res!387465) b!603356))

(assert (= (and b!603356 res!387457) b!603353))

(assert (= (and b!603353 res!387470) b!603343))

(assert (= (and b!603343 res!387461) b!603359))

(assert (= (and b!603359 res!387460) b!603344))

(assert (= (and b!603359 c!68311) b!603347))

(assert (= (and b!603359 (not c!68311)) b!603348))

(assert (= (and b!603359 (not res!387463)) b!603342))

(assert (= (and b!603342 res!387458) b!603340))

(assert (= (and b!603340 (not res!387466)) b!603346))

(assert (= (and b!603346 res!387464) b!603362))

(assert (= (and b!603342 (not res!387467)) b!603349))

(assert (= (and b!603349 c!68312) b!603345))

(assert (= (and b!603349 (not c!68312)) b!603351))

(assert (= (and b!603349 (not res!387468)) b!603361))

(assert (= (and b!603361 res!387453) b!603350))

(declare-fun m!580373 () Bool)

(assert (=> b!603342 m!580373))

(declare-fun m!580375 () Bool)

(assert (=> b!603342 m!580375))

(declare-fun m!580377 () Bool)

(assert (=> b!603342 m!580377))

(declare-fun m!580379 () Bool)

(assert (=> b!603356 m!580379))

(assert (=> b!603340 m!580373))

(assert (=> b!603361 m!580373))

(assert (=> b!603361 m!580373))

(declare-fun m!580381 () Bool)

(assert (=> b!603361 m!580381))

(assert (=> b!603350 m!580373))

(assert (=> b!603350 m!580373))

(declare-fun m!580383 () Bool)

(assert (=> b!603350 m!580383))

(declare-fun m!580385 () Bool)

(assert (=> b!603352 m!580385))

(assert (=> b!603353 m!580375))

(declare-fun m!580387 () Bool)

(assert (=> b!603353 m!580387))

(assert (=> b!603346 m!580373))

(assert (=> b!603346 m!580373))

(assert (=> b!603346 m!580381))

(declare-fun m!580389 () Bool)

(assert (=> b!603355 m!580389))

(declare-fun m!580391 () Bool)

(assert (=> start!55120 m!580391))

(declare-fun m!580393 () Bool)

(assert (=> start!55120 m!580393))

(declare-fun m!580395 () Bool)

(assert (=> b!603354 m!580395))

(declare-fun m!580397 () Bool)

(assert (=> b!603343 m!580397))

(assert (=> b!603343 m!580373))

(assert (=> b!603343 m!580373))

(declare-fun m!580399 () Bool)

(assert (=> b!603343 m!580399))

(declare-fun m!580401 () Bool)

(assert (=> b!603341 m!580401))

(declare-fun m!580403 () Bool)

(assert (=> b!603345 m!580403))

(assert (=> b!603345 m!580373))

(declare-fun m!580405 () Bool)

(assert (=> b!603345 m!580405))

(declare-fun m!580407 () Bool)

(assert (=> b!603345 m!580407))

(assert (=> b!603345 m!580373))

(declare-fun m!580409 () Bool)

(assert (=> b!603345 m!580409))

(assert (=> b!603345 m!580373))

(declare-fun m!580411 () Bool)

(assert (=> b!603345 m!580411))

(declare-fun m!580413 () Bool)

(assert (=> b!603345 m!580413))

(assert (=> b!603345 m!580373))

(declare-fun m!580415 () Bool)

(assert (=> b!603345 m!580415))

(declare-fun m!580417 () Bool)

(assert (=> b!603359 m!580417))

(declare-fun m!580419 () Bool)

(assert (=> b!603359 m!580419))

(assert (=> b!603359 m!580373))

(assert (=> b!603359 m!580375))

(assert (=> b!603359 m!580373))

(declare-fun m!580421 () Bool)

(assert (=> b!603359 m!580421))

(declare-fun m!580423 () Bool)

(assert (=> b!603359 m!580423))

(declare-fun m!580425 () Bool)

(assert (=> b!603359 m!580425))

(declare-fun m!580427 () Bool)

(assert (=> b!603359 m!580427))

(assert (=> b!603357 m!580373))

(assert (=> b!603357 m!580373))

(declare-fun m!580429 () Bool)

(assert (=> b!603357 m!580429))

(assert (=> b!603362 m!580373))

(assert (=> b!603362 m!580373))

(assert (=> b!603362 m!580383))

(declare-fun m!580431 () Bool)

(assert (=> b!603358 m!580431))

(push 1)

