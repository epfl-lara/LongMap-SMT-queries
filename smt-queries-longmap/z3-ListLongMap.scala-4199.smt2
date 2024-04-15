; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57332 () Bool)

(assert start!57332)

(declare-fun b!634392 () Bool)

(declare-fun res!410408 () Bool)

(declare-fun e!362772 () Bool)

(assert (=> b!634392 (=> (not res!410408) (not e!362772))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38196 0))(
  ( (array!38197 (arr!18326 (Array (_ BitVec 32) (_ BitVec 64))) (size!18691 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38196)

(assert (=> b!634392 (= res!410408 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18326 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!634393 () Bool)

(declare-fun res!410416 () Bool)

(assert (=> b!634393 (=> (not res!410416) (not e!362772))))

(declare-datatypes ((List!12406 0))(
  ( (Nil!12403) (Cons!12402 (h!13447 (_ BitVec 64)) (t!18625 List!12406)) )
))
(declare-fun arrayNoDuplicates!0 (array!38196 (_ BitVec 32) List!12406) Bool)

(assert (=> b!634393 (= res!410416 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12403))))

(declare-fun b!634394 () Bool)

(declare-fun e!362768 () Bool)

(declare-datatypes ((SeekEntryResult!6763 0))(
  ( (MissingZero!6763 (index!29354 (_ BitVec 32))) (Found!6763 (index!29355 (_ BitVec 32))) (Intermediate!6763 (undefined!7575 Bool) (index!29356 (_ BitVec 32)) (x!58108 (_ BitVec 32))) (Undefined!6763) (MissingVacant!6763 (index!29357 (_ BitVec 32))) )
))
(declare-fun lt!293164 () SeekEntryResult!6763)

(declare-fun lt!293166 () SeekEntryResult!6763)

(assert (=> b!634394 (= e!362768 (= lt!293164 lt!293166))))

(declare-fun b!634395 () Bool)

(declare-fun e!362777 () Bool)

(declare-fun e!362773 () Bool)

(assert (=> b!634395 (= e!362777 e!362773)))

(declare-fun res!410415 () Bool)

(assert (=> b!634395 (=> (not res!410415) (not e!362773))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!634395 (= res!410415 (and (= lt!293164 (Found!6763 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18326 a!2986) index!984) (select (arr!18326 a!2986) j!136))) (not (= (select (arr!18326 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38196 (_ BitVec 32)) SeekEntryResult!6763)

(assert (=> b!634395 (= lt!293164 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18326 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!410402 () Bool)

(declare-fun e!362769 () Bool)

(assert (=> start!57332 (=> (not res!410402) (not e!362769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57332 (= res!410402 (validMask!0 mask!3053))))

(assert (=> start!57332 e!362769))

(assert (=> start!57332 true))

(declare-fun array_inv!14209 (array!38196) Bool)

(assert (=> start!57332 (array_inv!14209 a!2986)))

(declare-fun b!634396 () Bool)

(declare-fun e!362775 () Bool)

(assert (=> b!634396 (= e!362773 (not e!362775))))

(declare-fun res!410413 () Bool)

(assert (=> b!634396 (=> res!410413 e!362775)))

(declare-fun lt!293160 () SeekEntryResult!6763)

(assert (=> b!634396 (= res!410413 (not (= lt!293160 (Found!6763 index!984))))))

(declare-datatypes ((Unit!21380 0))(
  ( (Unit!21381) )
))
(declare-fun lt!293162 () Unit!21380)

(declare-fun e!362774 () Unit!21380)

(assert (=> b!634396 (= lt!293162 e!362774)))

(declare-fun c!72363 () Bool)

(assert (=> b!634396 (= c!72363 (= lt!293160 Undefined!6763))))

(declare-fun lt!293157 () (_ BitVec 64))

(declare-fun lt!293159 () array!38196)

(assert (=> b!634396 (= lt!293160 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293157 lt!293159 mask!3053))))

(assert (=> b!634396 e!362768))

(declare-fun res!410406 () Bool)

(assert (=> b!634396 (=> (not res!410406) (not e!362768))))

(declare-fun lt!293158 () (_ BitVec 32))

(assert (=> b!634396 (= res!410406 (= lt!293166 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293158 vacantSpotIndex!68 lt!293157 lt!293159 mask!3053)))))

(assert (=> b!634396 (= lt!293166 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293158 vacantSpotIndex!68 (select (arr!18326 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!634396 (= lt!293157 (select (store (arr!18326 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!293163 () Unit!21380)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38196 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21380)

(assert (=> b!634396 (= lt!293163 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293158 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!634396 (= lt!293158 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!634397 () Bool)

(assert (=> b!634397 (= e!362769 e!362772)))

(declare-fun res!410414 () Bool)

(assert (=> b!634397 (=> (not res!410414) (not e!362772))))

(declare-fun lt!293161 () SeekEntryResult!6763)

(assert (=> b!634397 (= res!410414 (or (= lt!293161 (MissingZero!6763 i!1108)) (= lt!293161 (MissingVacant!6763 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38196 (_ BitVec 32)) SeekEntryResult!6763)

(assert (=> b!634397 (= lt!293161 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!634398 () Bool)

(declare-fun res!410404 () Bool)

(assert (=> b!634398 (=> (not res!410404) (not e!362772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38196 (_ BitVec 32)) Bool)

(assert (=> b!634398 (= res!410404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!634399 () Bool)

(declare-fun res!410412 () Bool)

(assert (=> b!634399 (=> (not res!410412) (not e!362769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!634399 (= res!410412 (validKeyInArray!0 (select (arr!18326 a!2986) j!136)))))

(declare-fun b!634400 () Bool)

(declare-fun Unit!21382 () Unit!21380)

(assert (=> b!634400 (= e!362774 Unit!21382)))

(declare-fun b!634401 () Bool)

(declare-fun res!410405 () Bool)

(assert (=> b!634401 (=> (not res!410405) (not e!362769))))

(assert (=> b!634401 (= res!410405 (validKeyInArray!0 k0!1786))))

(declare-fun b!634402 () Bool)

(declare-fun e!362771 () Bool)

(declare-fun arrayContainsKey!0 (array!38196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!634402 (= e!362771 (arrayContainsKey!0 lt!293159 (select (arr!18326 a!2986) j!136) index!984))))

(declare-fun b!634403 () Bool)

(declare-fun res!410410 () Bool)

(assert (=> b!634403 (=> (not res!410410) (not e!362769))))

(assert (=> b!634403 (= res!410410 (and (= (size!18691 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18691 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18691 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!634404 () Bool)

(declare-fun e!362776 () Bool)

(assert (=> b!634404 (= e!362775 e!362776)))

(declare-fun res!410411 () Bool)

(assert (=> b!634404 (=> res!410411 e!362776)))

(declare-fun lt!293156 () (_ BitVec 64))

(assert (=> b!634404 (= res!410411 (or (not (= (select (arr!18326 a!2986) j!136) lt!293157)) (not (= (select (arr!18326 a!2986) j!136) lt!293156)) (bvsge j!136 index!984)))))

(declare-fun e!362770 () Bool)

(assert (=> b!634404 e!362770))

(declare-fun res!410403 () Bool)

(assert (=> b!634404 (=> (not res!410403) (not e!362770))))

(assert (=> b!634404 (= res!410403 (= lt!293156 (select (arr!18326 a!2986) j!136)))))

(assert (=> b!634404 (= lt!293156 (select (store (arr!18326 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!634405 () Bool)

(declare-fun res!410401 () Bool)

(assert (=> b!634405 (=> (not res!410401) (not e!362769))))

(assert (=> b!634405 (= res!410401 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!634406 () Bool)

(assert (=> b!634406 (= e!362772 e!362777)))

(declare-fun res!410400 () Bool)

(assert (=> b!634406 (=> (not res!410400) (not e!362777))))

(assert (=> b!634406 (= res!410400 (= (select (store (arr!18326 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634406 (= lt!293159 (array!38197 (store (arr!18326 a!2986) i!1108 k0!1786) (size!18691 a!2986)))))

(declare-fun b!634407 () Bool)

(declare-fun Unit!21383 () Unit!21380)

(assert (=> b!634407 (= e!362774 Unit!21383)))

(assert (=> b!634407 false))

(declare-fun b!634408 () Bool)

(declare-fun e!362767 () Bool)

(assert (=> b!634408 (= e!362767 e!362771)))

(declare-fun res!410407 () Bool)

(assert (=> b!634408 (=> (not res!410407) (not e!362771))))

(assert (=> b!634408 (= res!410407 (arrayContainsKey!0 lt!293159 (select (arr!18326 a!2986) j!136) j!136))))

(declare-fun b!634409 () Bool)

(assert (=> b!634409 (= e!362776 true)))

(assert (=> b!634409 (arrayContainsKey!0 lt!293159 (select (arr!18326 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!293165 () Unit!21380)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38196 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21380)

(assert (=> b!634409 (= lt!293165 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!293159 (select (arr!18326 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!634410 () Bool)

(assert (=> b!634410 (= e!362770 e!362767)))

(declare-fun res!410409 () Bool)

(assert (=> b!634410 (=> res!410409 e!362767)))

(assert (=> b!634410 (= res!410409 (or (not (= (select (arr!18326 a!2986) j!136) lt!293157)) (not (= (select (arr!18326 a!2986) j!136) lt!293156)) (bvsge j!136 index!984)))))

(assert (= (and start!57332 res!410402) b!634403))

(assert (= (and b!634403 res!410410) b!634399))

(assert (= (and b!634399 res!410412) b!634401))

(assert (= (and b!634401 res!410405) b!634405))

(assert (= (and b!634405 res!410401) b!634397))

(assert (= (and b!634397 res!410414) b!634398))

(assert (= (and b!634398 res!410404) b!634393))

(assert (= (and b!634393 res!410416) b!634392))

(assert (= (and b!634392 res!410408) b!634406))

(assert (= (and b!634406 res!410400) b!634395))

(assert (= (and b!634395 res!410415) b!634396))

(assert (= (and b!634396 res!410406) b!634394))

(assert (= (and b!634396 c!72363) b!634407))

(assert (= (and b!634396 (not c!72363)) b!634400))

(assert (= (and b!634396 (not res!410413)) b!634404))

(assert (= (and b!634404 res!410403) b!634410))

(assert (= (and b!634410 (not res!410409)) b!634408))

(assert (= (and b!634408 res!410407) b!634402))

(assert (= (and b!634404 (not res!410411)) b!634409))

(declare-fun m!608361 () Bool)

(assert (=> b!634396 m!608361))

(declare-fun m!608363 () Bool)

(assert (=> b!634396 m!608363))

(declare-fun m!608365 () Bool)

(assert (=> b!634396 m!608365))

(declare-fun m!608367 () Bool)

(assert (=> b!634396 m!608367))

(assert (=> b!634396 m!608365))

(declare-fun m!608369 () Bool)

(assert (=> b!634396 m!608369))

(declare-fun m!608371 () Bool)

(assert (=> b!634396 m!608371))

(declare-fun m!608373 () Bool)

(assert (=> b!634396 m!608373))

(declare-fun m!608375 () Bool)

(assert (=> b!634396 m!608375))

(declare-fun m!608377 () Bool)

(assert (=> b!634395 m!608377))

(assert (=> b!634395 m!608365))

(assert (=> b!634395 m!608365))

(declare-fun m!608379 () Bool)

(assert (=> b!634395 m!608379))

(declare-fun m!608381 () Bool)

(assert (=> start!57332 m!608381))

(declare-fun m!608383 () Bool)

(assert (=> start!57332 m!608383))

(assert (=> b!634399 m!608365))

(assert (=> b!634399 m!608365))

(declare-fun m!608385 () Bool)

(assert (=> b!634399 m!608385))

(declare-fun m!608387 () Bool)

(assert (=> b!634397 m!608387))

(assert (=> b!634406 m!608369))

(declare-fun m!608389 () Bool)

(assert (=> b!634406 m!608389))

(declare-fun m!608391 () Bool)

(assert (=> b!634401 m!608391))

(declare-fun m!608393 () Bool)

(assert (=> b!634398 m!608393))

(declare-fun m!608395 () Bool)

(assert (=> b!634392 m!608395))

(assert (=> b!634402 m!608365))

(assert (=> b!634402 m!608365))

(declare-fun m!608397 () Bool)

(assert (=> b!634402 m!608397))

(declare-fun m!608399 () Bool)

(assert (=> b!634393 m!608399))

(assert (=> b!634409 m!608365))

(assert (=> b!634409 m!608365))

(declare-fun m!608401 () Bool)

(assert (=> b!634409 m!608401))

(assert (=> b!634409 m!608365))

(declare-fun m!608403 () Bool)

(assert (=> b!634409 m!608403))

(assert (=> b!634408 m!608365))

(assert (=> b!634408 m!608365))

(declare-fun m!608405 () Bool)

(assert (=> b!634408 m!608405))

(declare-fun m!608407 () Bool)

(assert (=> b!634405 m!608407))

(assert (=> b!634404 m!608365))

(assert (=> b!634404 m!608369))

(declare-fun m!608409 () Bool)

(assert (=> b!634404 m!608409))

(assert (=> b!634410 m!608365))

(check-sat (not b!634402) (not b!634401) (not start!57332) (not b!634395) (not b!634398) (not b!634409) (not b!634408) (not b!634399) (not b!634397) (not b!634396) (not b!634405) (not b!634393))
(check-sat)
