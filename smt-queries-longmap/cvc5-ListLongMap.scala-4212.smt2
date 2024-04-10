; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57716 () Bool)

(assert start!57716)

(declare-fun res!413259 () Bool)

(declare-fun e!365312 () Bool)

(assert (=> start!57716 (=> (not res!413259) (not e!365312))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57716 (= res!413259 (validMask!0 mask!3053))))

(assert (=> start!57716 e!365312))

(assert (=> start!57716 true))

(declare-datatypes ((array!38287 0))(
  ( (array!38288 (arr!18366 (Array (_ BitVec 32) (_ BitVec 64))) (size!18730 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38287)

(declare-fun array_inv!14162 (array!38287) Bool)

(assert (=> start!57716 (array_inv!14162 a!2986)))

(declare-fun b!638423 () Bool)

(declare-datatypes ((Unit!21558 0))(
  ( (Unit!21559) )
))
(declare-fun e!365306 () Unit!21558)

(declare-fun Unit!21560 () Unit!21558)

(assert (=> b!638423 (= e!365306 Unit!21560)))

(declare-fun b!638424 () Bool)

(declare-fun res!413248 () Bool)

(assert (=> b!638424 (=> (not res!413248) (not e!365312))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!638424 (= res!413248 (and (= (size!18730 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18730 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18730 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!638425 () Bool)

(declare-fun e!365313 () Bool)

(declare-fun e!365316 () Bool)

(assert (=> b!638425 (= e!365313 e!365316)))

(declare-fun res!413255 () Bool)

(assert (=> b!638425 (=> (not res!413255) (not e!365316))))

(declare-fun lt!295250 () array!38287)

(declare-fun arrayContainsKey!0 (array!38287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!638425 (= res!413255 (arrayContainsKey!0 lt!295250 (select (arr!18366 a!2986) j!136) j!136))))

(declare-fun b!638426 () Bool)

(declare-fun e!365315 () Bool)

(declare-fun e!365308 () Bool)

(assert (=> b!638426 (= e!365315 e!365308)))

(declare-fun res!413249 () Bool)

(assert (=> b!638426 (=> (not res!413249) (not e!365308))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!638426 (= res!413249 (= (select (store (arr!18366 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!638426 (= lt!295250 (array!38288 (store (arr!18366 a!2986) i!1108 k!1786) (size!18730 a!2986)))))

(declare-fun b!638427 () Bool)

(declare-fun e!365307 () Bool)

(assert (=> b!638427 (= e!365307 e!365313)))

(declare-fun res!413252 () Bool)

(assert (=> b!638427 (=> res!413252 e!365313)))

(declare-fun lt!295249 () (_ BitVec 64))

(declare-fun lt!295252 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!638427 (= res!413252 (or (not (= (select (arr!18366 a!2986) j!136) lt!295249)) (not (= (select (arr!18366 a!2986) j!136) lt!295252)) (bvsge j!136 index!984)))))

(declare-fun b!638428 () Bool)

(assert (=> b!638428 (= e!365312 e!365315)))

(declare-fun res!413256 () Bool)

(assert (=> b!638428 (=> (not res!413256) (not e!365315))))

(declare-datatypes ((SeekEntryResult!6806 0))(
  ( (MissingZero!6806 (index!29538 (_ BitVec 32))) (Found!6806 (index!29539 (_ BitVec 32))) (Intermediate!6806 (undefined!7618 Bool) (index!29540 (_ BitVec 32)) (x!58296 (_ BitVec 32))) (Undefined!6806) (MissingVacant!6806 (index!29541 (_ BitVec 32))) )
))
(declare-fun lt!295251 () SeekEntryResult!6806)

(assert (=> b!638428 (= res!413256 (or (= lt!295251 (MissingZero!6806 i!1108)) (= lt!295251 (MissingVacant!6806 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38287 (_ BitVec 32)) SeekEntryResult!6806)

(assert (=> b!638428 (= lt!295251 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!638429 () Bool)

(declare-fun res!413254 () Bool)

(assert (=> b!638429 (=> (not res!413254) (not e!365312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!638429 (= res!413254 (validKeyInArray!0 (select (arr!18366 a!2986) j!136)))))

(declare-fun b!638430 () Bool)

(declare-fun e!365310 () Bool)

(assert (=> b!638430 (= e!365310 true)))

(declare-datatypes ((List!12407 0))(
  ( (Nil!12404) (Cons!12403 (h!13448 (_ BitVec 64)) (t!18635 List!12407)) )
))
(declare-fun arrayNoDuplicates!0 (array!38287 (_ BitVec 32) List!12407) Bool)

(assert (=> b!638430 (arrayNoDuplicates!0 lt!295250 #b00000000000000000000000000000000 Nil!12404)))

(declare-fun lt!295247 () Unit!21558)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38287 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12407) Unit!21558)

(assert (=> b!638430 (= lt!295247 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12404))))

(assert (=> b!638430 (arrayContainsKey!0 lt!295250 (select (arr!18366 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295242 () Unit!21558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38287 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21558)

(assert (=> b!638430 (= lt!295242 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295250 (select (arr!18366 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!638431 () Bool)

(declare-fun res!413261 () Bool)

(assert (=> b!638431 (=> (not res!413261) (not e!365315))))

(assert (=> b!638431 (= res!413261 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12404))))

(declare-fun b!638432 () Bool)

(declare-fun res!413257 () Bool)

(assert (=> b!638432 (=> (not res!413257) (not e!365315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38287 (_ BitVec 32)) Bool)

(assert (=> b!638432 (= res!413257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!638433 () Bool)

(declare-fun res!413247 () Bool)

(assert (=> b!638433 (=> (not res!413247) (not e!365312))))

(assert (=> b!638433 (= res!413247 (validKeyInArray!0 k!1786))))

(declare-fun b!638434 () Bool)

(declare-fun e!365309 () Bool)

(declare-fun e!365305 () Bool)

(assert (=> b!638434 (= e!365309 (not e!365305))))

(declare-fun res!413250 () Bool)

(assert (=> b!638434 (=> res!413250 e!365305)))

(declare-fun lt!295248 () SeekEntryResult!6806)

(assert (=> b!638434 (= res!413250 (not (= lt!295248 (Found!6806 index!984))))))

(declare-fun lt!295244 () Unit!21558)

(assert (=> b!638434 (= lt!295244 e!365306)))

(declare-fun c!72956 () Bool)

(assert (=> b!638434 (= c!72956 (= lt!295248 Undefined!6806))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38287 (_ BitVec 32)) SeekEntryResult!6806)

(assert (=> b!638434 (= lt!295248 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295249 lt!295250 mask!3053))))

(declare-fun e!365311 () Bool)

(assert (=> b!638434 e!365311))

(declare-fun res!413251 () Bool)

(assert (=> b!638434 (=> (not res!413251) (not e!365311))))

(declare-fun lt!295241 () (_ BitVec 32))

(declare-fun lt!295245 () SeekEntryResult!6806)

(assert (=> b!638434 (= res!413251 (= lt!295245 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295241 vacantSpotIndex!68 lt!295249 lt!295250 mask!3053)))))

(assert (=> b!638434 (= lt!295245 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295241 vacantSpotIndex!68 (select (arr!18366 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!638434 (= lt!295249 (select (store (arr!18366 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295246 () Unit!21558)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38287 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21558)

(assert (=> b!638434 (= lt!295246 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295241 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!638434 (= lt!295241 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!638435 () Bool)

(declare-fun lt!295243 () SeekEntryResult!6806)

(assert (=> b!638435 (= e!365311 (= lt!295243 lt!295245))))

(declare-fun b!638436 () Bool)

(declare-fun res!413260 () Bool)

(assert (=> b!638436 (=> (not res!413260) (not e!365312))))

(assert (=> b!638436 (= res!413260 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!638437 () Bool)

(assert (=> b!638437 (= e!365316 (arrayContainsKey!0 lt!295250 (select (arr!18366 a!2986) j!136) index!984))))

(declare-fun b!638438 () Bool)

(assert (=> b!638438 (= e!365308 e!365309)))

(declare-fun res!413246 () Bool)

(assert (=> b!638438 (=> (not res!413246) (not e!365309))))

(assert (=> b!638438 (= res!413246 (and (= lt!295243 (Found!6806 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18366 a!2986) index!984) (select (arr!18366 a!2986) j!136))) (not (= (select (arr!18366 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!638438 (= lt!295243 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18366 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!638439 () Bool)

(declare-fun res!413258 () Bool)

(assert (=> b!638439 (=> (not res!413258) (not e!365315))))

(assert (=> b!638439 (= res!413258 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18366 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!638440 () Bool)

(declare-fun Unit!21561 () Unit!21558)

(assert (=> b!638440 (= e!365306 Unit!21561)))

(assert (=> b!638440 false))

(declare-fun b!638441 () Bool)

(assert (=> b!638441 (= e!365305 e!365310)))

(declare-fun res!413253 () Bool)

(assert (=> b!638441 (=> res!413253 e!365310)))

(assert (=> b!638441 (= res!413253 (or (not (= (select (arr!18366 a!2986) j!136) lt!295249)) (not (= (select (arr!18366 a!2986) j!136) lt!295252)) (bvsge j!136 index!984)))))

(assert (=> b!638441 e!365307))

(declare-fun res!413245 () Bool)

(assert (=> b!638441 (=> (not res!413245) (not e!365307))))

(assert (=> b!638441 (= res!413245 (= lt!295252 (select (arr!18366 a!2986) j!136)))))

(assert (=> b!638441 (= lt!295252 (select (store (arr!18366 a!2986) i!1108 k!1786) index!984))))

(assert (= (and start!57716 res!413259) b!638424))

(assert (= (and b!638424 res!413248) b!638429))

(assert (= (and b!638429 res!413254) b!638433))

(assert (= (and b!638433 res!413247) b!638436))

(assert (= (and b!638436 res!413260) b!638428))

(assert (= (and b!638428 res!413256) b!638432))

(assert (= (and b!638432 res!413257) b!638431))

(assert (= (and b!638431 res!413261) b!638439))

(assert (= (and b!638439 res!413258) b!638426))

(assert (= (and b!638426 res!413249) b!638438))

(assert (= (and b!638438 res!413246) b!638434))

(assert (= (and b!638434 res!413251) b!638435))

(assert (= (and b!638434 c!72956) b!638440))

(assert (= (and b!638434 (not c!72956)) b!638423))

(assert (= (and b!638434 (not res!413250)) b!638441))

(assert (= (and b!638441 res!413245) b!638427))

(assert (= (and b!638427 (not res!413252)) b!638425))

(assert (= (and b!638425 res!413255) b!638437))

(assert (= (and b!638441 (not res!413253)) b!638430))

(declare-fun m!612353 () Bool)

(assert (=> b!638438 m!612353))

(declare-fun m!612355 () Bool)

(assert (=> b!638438 m!612355))

(assert (=> b!638438 m!612355))

(declare-fun m!612357 () Bool)

(assert (=> b!638438 m!612357))

(declare-fun m!612359 () Bool)

(assert (=> b!638433 m!612359))

(assert (=> b!638441 m!612355))

(declare-fun m!612361 () Bool)

(assert (=> b!638441 m!612361))

(declare-fun m!612363 () Bool)

(assert (=> b!638441 m!612363))

(assert (=> b!638430 m!612355))

(declare-fun m!612365 () Bool)

(assert (=> b!638430 m!612365))

(assert (=> b!638430 m!612355))

(assert (=> b!638430 m!612355))

(declare-fun m!612367 () Bool)

(assert (=> b!638430 m!612367))

(declare-fun m!612369 () Bool)

(assert (=> b!638430 m!612369))

(declare-fun m!612371 () Bool)

(assert (=> b!638430 m!612371))

(assert (=> b!638437 m!612355))

(assert (=> b!638437 m!612355))

(declare-fun m!612373 () Bool)

(assert (=> b!638437 m!612373))

(declare-fun m!612375 () Bool)

(assert (=> start!57716 m!612375))

(declare-fun m!612377 () Bool)

(assert (=> start!57716 m!612377))

(assert (=> b!638427 m!612355))

(assert (=> b!638425 m!612355))

(assert (=> b!638425 m!612355))

(declare-fun m!612379 () Bool)

(assert (=> b!638425 m!612379))

(declare-fun m!612381 () Bool)

(assert (=> b!638428 m!612381))

(assert (=> b!638426 m!612361))

(declare-fun m!612383 () Bool)

(assert (=> b!638426 m!612383))

(declare-fun m!612385 () Bool)

(assert (=> b!638432 m!612385))

(declare-fun m!612387 () Bool)

(assert (=> b!638436 m!612387))

(declare-fun m!612389 () Bool)

(assert (=> b!638439 m!612389))

(declare-fun m!612391 () Bool)

(assert (=> b!638434 m!612391))

(declare-fun m!612393 () Bool)

(assert (=> b!638434 m!612393))

(assert (=> b!638434 m!612355))

(assert (=> b!638434 m!612361))

(declare-fun m!612395 () Bool)

(assert (=> b!638434 m!612395))

(declare-fun m!612397 () Bool)

(assert (=> b!638434 m!612397))

(declare-fun m!612399 () Bool)

(assert (=> b!638434 m!612399))

(assert (=> b!638434 m!612355))

(declare-fun m!612401 () Bool)

(assert (=> b!638434 m!612401))

(declare-fun m!612403 () Bool)

(assert (=> b!638431 m!612403))

(assert (=> b!638429 m!612355))

(assert (=> b!638429 m!612355))

(declare-fun m!612405 () Bool)

(assert (=> b!638429 m!612405))

(push 1)

