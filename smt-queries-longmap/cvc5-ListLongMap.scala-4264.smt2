; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59324 () Bool)

(assert start!59324)

(declare-fun b!654244 () Bool)

(declare-fun res!424331 () Bool)

(declare-fun e!375687 () Bool)

(assert (=> b!654244 (=> (not res!424331) (not e!375687))))

(declare-datatypes ((array!38644 0))(
  ( (array!38645 (arr!18522 (Array (_ BitVec 32) (_ BitVec 64))) (size!18886 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38644)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!654244 (= res!424331 (validKeyInArray!0 (select (arr!18522 a!2986) j!136)))))

(declare-fun b!654245 () Bool)

(declare-fun e!375685 () Bool)

(declare-fun e!375688 () Bool)

(assert (=> b!654245 (= e!375685 e!375688)))

(declare-fun res!424324 () Bool)

(assert (=> b!654245 (=> res!424324 e!375688)))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!654245 (= res!424324 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!22398 0))(
  ( (Unit!22399) )
))
(declare-fun lt!304690 () Unit!22398)

(declare-fun e!375682 () Unit!22398)

(assert (=> b!654245 (= lt!304690 e!375682)))

(declare-fun c!75331 () Bool)

(assert (=> b!654245 (= c!75331 (bvslt j!136 index!984))))

(declare-fun b!654246 () Bool)

(declare-fun res!424329 () Bool)

(assert (=> b!654246 (=> (not res!424329) (not e!375687))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!654246 (= res!424329 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!654247 () Bool)

(declare-fun e!375690 () Bool)

(declare-fun e!375689 () Bool)

(assert (=> b!654247 (= e!375690 e!375689)))

(declare-fun res!424323 () Bool)

(assert (=> b!654247 (=> (not res!424323) (not e!375689))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!654247 (= res!424323 (= (select (store (arr!18522 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!304697 () array!38644)

(assert (=> b!654247 (= lt!304697 (array!38645 (store (arr!18522 a!2986) i!1108 k!1786) (size!18886 a!2986)))))

(declare-fun b!654248 () Bool)

(declare-fun e!375693 () Bool)

(declare-fun e!375684 () Bool)

(assert (=> b!654248 (= e!375693 e!375684)))

(declare-fun res!424333 () Bool)

(assert (=> b!654248 (=> (not res!424333) (not e!375684))))

(assert (=> b!654248 (= res!424333 (arrayContainsKey!0 lt!304697 (select (arr!18522 a!2986) j!136) j!136))))

(declare-fun b!654249 () Bool)

(declare-fun e!375695 () Bool)

(assert (=> b!654249 (= e!375695 e!375685)))

(declare-fun res!424332 () Bool)

(assert (=> b!654249 (=> res!424332 e!375685)))

(declare-fun lt!304702 () (_ BitVec 64))

(declare-fun lt!304707 () (_ BitVec 64))

(assert (=> b!654249 (= res!424332 (or (not (= (select (arr!18522 a!2986) j!136) lt!304707)) (not (= (select (arr!18522 a!2986) j!136) lt!304702))))))

(declare-fun e!375696 () Bool)

(assert (=> b!654249 e!375696))

(declare-fun res!424316 () Bool)

(assert (=> b!654249 (=> (not res!424316) (not e!375696))))

(assert (=> b!654249 (= res!424316 (= lt!304702 (select (arr!18522 a!2986) j!136)))))

(assert (=> b!654249 (= lt!304702 (select (store (arr!18522 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!654250 () Bool)

(assert (=> b!654250 (= e!375696 e!375693)))

(declare-fun res!424325 () Bool)

(assert (=> b!654250 (=> res!424325 e!375693)))

(assert (=> b!654250 (= res!424325 (or (not (= (select (arr!18522 a!2986) j!136) lt!304707)) (not (= (select (arr!18522 a!2986) j!136) lt!304702)) (bvsge j!136 index!984)))))

(declare-fun b!654251 () Bool)

(declare-fun Unit!22400 () Unit!22398)

(assert (=> b!654251 (= e!375682 Unit!22400)))

(declare-fun b!654252 () Bool)

(declare-fun res!424320 () Bool)

(assert (=> b!654252 (=> (not res!424320) (not e!375690))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38644 (_ BitVec 32)) Bool)

(assert (=> b!654252 (= res!424320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!654253 () Bool)

(assert (=> b!654253 (= e!375687 e!375690)))

(declare-fun res!424322 () Bool)

(assert (=> b!654253 (=> (not res!424322) (not e!375690))))

(declare-datatypes ((SeekEntryResult!6962 0))(
  ( (MissingZero!6962 (index!30207 (_ BitVec 32))) (Found!6962 (index!30208 (_ BitVec 32))) (Intermediate!6962 (undefined!7774 Bool) (index!30209 (_ BitVec 32)) (x!59003 (_ BitVec 32))) (Undefined!6962) (MissingVacant!6962 (index!30210 (_ BitVec 32))) )
))
(declare-fun lt!304699 () SeekEntryResult!6962)

(assert (=> b!654253 (= res!424322 (or (= lt!304699 (MissingZero!6962 i!1108)) (= lt!304699 (MissingVacant!6962 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38644 (_ BitVec 32)) SeekEntryResult!6962)

(assert (=> b!654253 (= lt!304699 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!654254 () Bool)

(declare-fun e!375694 () Bool)

(assert (=> b!654254 (= e!375694 (not e!375695))))

(declare-fun res!424326 () Bool)

(assert (=> b!654254 (=> res!424326 e!375695)))

(declare-fun lt!304703 () SeekEntryResult!6962)

(assert (=> b!654254 (= res!424326 (not (= lt!304703 (Found!6962 index!984))))))

(declare-fun lt!304694 () Unit!22398)

(declare-fun e!375691 () Unit!22398)

(assert (=> b!654254 (= lt!304694 e!375691)))

(declare-fun c!75332 () Bool)

(assert (=> b!654254 (= c!75332 (= lt!304703 Undefined!6962))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38644 (_ BitVec 32)) SeekEntryResult!6962)

(assert (=> b!654254 (= lt!304703 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!304707 lt!304697 mask!3053))))

(declare-fun e!375692 () Bool)

(assert (=> b!654254 e!375692))

(declare-fun res!424319 () Bool)

(assert (=> b!654254 (=> (not res!424319) (not e!375692))))

(declare-fun lt!304695 () SeekEntryResult!6962)

(declare-fun lt!304693 () (_ BitVec 32))

(assert (=> b!654254 (= res!424319 (= lt!304695 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304693 vacantSpotIndex!68 lt!304707 lt!304697 mask!3053)))))

(assert (=> b!654254 (= lt!304695 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!304693 vacantSpotIndex!68 (select (arr!18522 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!654254 (= lt!304707 (select (store (arr!18522 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!304704 () Unit!22398)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38644 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22398)

(assert (=> b!654254 (= lt!304704 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!304693 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!654254 (= lt!304693 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!654255 () Bool)

(declare-fun lt!304691 () SeekEntryResult!6962)

(assert (=> b!654255 (= e!375692 (= lt!304691 lt!304695))))

(declare-fun b!654257 () Bool)

(declare-fun res!424321 () Bool)

(assert (=> b!654257 (=> (not res!424321) (not e!375687))))

(assert (=> b!654257 (= res!424321 (validKeyInArray!0 k!1786))))

(declare-fun b!654258 () Bool)

(assert (=> b!654258 (= e!375689 e!375694)))

(declare-fun res!424317 () Bool)

(assert (=> b!654258 (=> (not res!424317) (not e!375694))))

(assert (=> b!654258 (= res!424317 (and (= lt!304691 (Found!6962 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18522 a!2986) index!984) (select (arr!18522 a!2986) j!136))) (not (= (select (arr!18522 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!654258 (= lt!304691 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18522 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!654259 () Bool)

(declare-fun Unit!22401 () Unit!22398)

(assert (=> b!654259 (= e!375691 Unit!22401)))

(declare-fun b!654260 () Bool)

(declare-fun res!424330 () Bool)

(assert (=> b!654260 (=> (not res!424330) (not e!375690))))

(declare-datatypes ((List!12563 0))(
  ( (Nil!12560) (Cons!12559 (h!13604 (_ BitVec 64)) (t!18791 List!12563)) )
))
(declare-fun arrayNoDuplicates!0 (array!38644 (_ BitVec 32) List!12563) Bool)

(assert (=> b!654260 (= res!424330 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12560))))

(declare-fun b!654261 () Bool)

(assert (=> b!654261 (= e!375684 (arrayContainsKey!0 lt!304697 (select (arr!18522 a!2986) j!136) index!984))))

(declare-fun b!654262 () Bool)

(declare-fun e!375683 () Bool)

(assert (=> b!654262 (= e!375683 (arrayContainsKey!0 lt!304697 (select (arr!18522 a!2986) j!136) index!984))))

(declare-fun b!654263 () Bool)

(declare-fun Unit!22402 () Unit!22398)

(assert (=> b!654263 (= e!375691 Unit!22402)))

(assert (=> b!654263 false))

(declare-fun b!654264 () Bool)

(assert (=> b!654264 (= e!375688 true)))

(assert (=> b!654264 false))

(declare-fun lt!304692 () Unit!22398)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38644 (_ BitVec 64) (_ BitVec 32) List!12563) Unit!22398)

(assert (=> b!654264 (= lt!304692 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304697 (select (arr!18522 a!2986) j!136) index!984 Nil!12560))))

(assert (=> b!654264 (arrayNoDuplicates!0 lt!304697 index!984 Nil!12560)))

(declare-fun lt!304698 () Unit!22398)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38644 (_ BitVec 32) (_ BitVec 32)) Unit!22398)

(assert (=> b!654264 (= lt!304698 (lemmaNoDuplicateFromThenFromBigger!0 lt!304697 #b00000000000000000000000000000000 index!984))))

(assert (=> b!654264 (arrayNoDuplicates!0 lt!304697 #b00000000000000000000000000000000 Nil!12560)))

(declare-fun lt!304700 () Unit!22398)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38644 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12563) Unit!22398)

(assert (=> b!654264 (= lt!304700 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12560))))

(assert (=> b!654264 (arrayContainsKey!0 lt!304697 (select (arr!18522 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!304706 () Unit!22398)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38644 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22398)

(assert (=> b!654264 (= lt!304706 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304697 (select (arr!18522 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!654264 e!375683))

(declare-fun res!424328 () Bool)

(assert (=> b!654264 (=> (not res!424328) (not e!375683))))

(assert (=> b!654264 (= res!424328 (arrayContainsKey!0 lt!304697 (select (arr!18522 a!2986) j!136) j!136))))

(declare-fun b!654256 () Bool)

(declare-fun res!424327 () Bool)

(assert (=> b!654256 (=> (not res!424327) (not e!375690))))

(assert (=> b!654256 (= res!424327 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18522 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!424334 () Bool)

(assert (=> start!59324 (=> (not res!424334) (not e!375687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59324 (= res!424334 (validMask!0 mask!3053))))

(assert (=> start!59324 e!375687))

(assert (=> start!59324 true))

(declare-fun array_inv!14318 (array!38644) Bool)

(assert (=> start!59324 (array_inv!14318 a!2986)))

(declare-fun b!654265 () Bool)

(declare-fun res!424318 () Bool)

(assert (=> b!654265 (=> (not res!424318) (not e!375687))))

(assert (=> b!654265 (= res!424318 (and (= (size!18886 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18886 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18886 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!654266 () Bool)

(declare-fun Unit!22403 () Unit!22398)

(assert (=> b!654266 (= e!375682 Unit!22403)))

(declare-fun lt!304701 () Unit!22398)

(assert (=> b!654266 (= lt!304701 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!304697 (select (arr!18522 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!654266 (arrayContainsKey!0 lt!304697 (select (arr!18522 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!304696 () Unit!22398)

(assert (=> b!654266 (= lt!304696 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12560))))

(assert (=> b!654266 (arrayNoDuplicates!0 lt!304697 #b00000000000000000000000000000000 Nil!12560)))

(declare-fun lt!304705 () Unit!22398)

(assert (=> b!654266 (= lt!304705 (lemmaNoDuplicateFromThenFromBigger!0 lt!304697 #b00000000000000000000000000000000 j!136))))

(assert (=> b!654266 (arrayNoDuplicates!0 lt!304697 j!136 Nil!12560)))

(declare-fun lt!304708 () Unit!22398)

(assert (=> b!654266 (= lt!304708 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!304697 (select (arr!18522 a!2986) j!136) j!136 Nil!12560))))

(assert (=> b!654266 false))

(assert (= (and start!59324 res!424334) b!654265))

(assert (= (and b!654265 res!424318) b!654244))

(assert (= (and b!654244 res!424331) b!654257))

(assert (= (and b!654257 res!424321) b!654246))

(assert (= (and b!654246 res!424329) b!654253))

(assert (= (and b!654253 res!424322) b!654252))

(assert (= (and b!654252 res!424320) b!654260))

(assert (= (and b!654260 res!424330) b!654256))

(assert (= (and b!654256 res!424327) b!654247))

(assert (= (and b!654247 res!424323) b!654258))

(assert (= (and b!654258 res!424317) b!654254))

(assert (= (and b!654254 res!424319) b!654255))

(assert (= (and b!654254 c!75332) b!654263))

(assert (= (and b!654254 (not c!75332)) b!654259))

(assert (= (and b!654254 (not res!424326)) b!654249))

(assert (= (and b!654249 res!424316) b!654250))

(assert (= (and b!654250 (not res!424325)) b!654248))

(assert (= (and b!654248 res!424333) b!654261))

(assert (= (and b!654249 (not res!424332)) b!654245))

(assert (= (and b!654245 c!75331) b!654266))

(assert (= (and b!654245 (not c!75331)) b!654251))

(assert (= (and b!654245 (not res!424324)) b!654264))

(assert (= (and b!654264 res!424328) b!654262))

(declare-fun m!627347 () Bool)

(assert (=> b!654248 m!627347))

(assert (=> b!654248 m!627347))

(declare-fun m!627349 () Bool)

(assert (=> b!654248 m!627349))

(declare-fun m!627351 () Bool)

(assert (=> b!654247 m!627351))

(declare-fun m!627353 () Bool)

(assert (=> b!654247 m!627353))

(assert (=> b!654262 m!627347))

(assert (=> b!654262 m!627347))

(declare-fun m!627355 () Bool)

(assert (=> b!654262 m!627355))

(assert (=> b!654249 m!627347))

(assert (=> b!654249 m!627351))

(declare-fun m!627357 () Bool)

(assert (=> b!654249 m!627357))

(declare-fun m!627359 () Bool)

(assert (=> b!654252 m!627359))

(declare-fun m!627361 () Bool)

(assert (=> b!654253 m!627361))

(declare-fun m!627363 () Bool)

(assert (=> b!654257 m!627363))

(assert (=> b!654264 m!627347))

(declare-fun m!627365 () Bool)

(assert (=> b!654264 m!627365))

(declare-fun m!627367 () Bool)

(assert (=> b!654264 m!627367))

(assert (=> b!654264 m!627347))

(declare-fun m!627369 () Bool)

(assert (=> b!654264 m!627369))

(assert (=> b!654264 m!627347))

(declare-fun m!627371 () Bool)

(assert (=> b!654264 m!627371))

(assert (=> b!654264 m!627347))

(assert (=> b!654264 m!627349))

(declare-fun m!627373 () Bool)

(assert (=> b!654264 m!627373))

(assert (=> b!654264 m!627347))

(declare-fun m!627375 () Bool)

(assert (=> b!654264 m!627375))

(declare-fun m!627377 () Bool)

(assert (=> b!654264 m!627377))

(assert (=> b!654261 m!627347))

(assert (=> b!654261 m!627347))

(assert (=> b!654261 m!627355))

(declare-fun m!627379 () Bool)

(assert (=> b!654254 m!627379))

(declare-fun m!627381 () Bool)

(assert (=> b!654254 m!627381))

(assert (=> b!654254 m!627347))

(assert (=> b!654254 m!627351))

(declare-fun m!627383 () Bool)

(assert (=> b!654254 m!627383))

(declare-fun m!627385 () Bool)

(assert (=> b!654254 m!627385))

(declare-fun m!627387 () Bool)

(assert (=> b!654254 m!627387))

(assert (=> b!654254 m!627347))

(declare-fun m!627389 () Bool)

(assert (=> b!654254 m!627389))

(assert (=> b!654266 m!627347))

(declare-fun m!627391 () Bool)

(assert (=> b!654266 m!627391))

(assert (=> b!654266 m!627347))

(assert (=> b!654266 m!627367))

(declare-fun m!627393 () Bool)

(assert (=> b!654266 m!627393))

(assert (=> b!654266 m!627347))

(declare-fun m!627395 () Bool)

(assert (=> b!654266 m!627395))

(assert (=> b!654266 m!627377))

(declare-fun m!627397 () Bool)

(assert (=> b!654266 m!627397))

(assert (=> b!654266 m!627347))

(declare-fun m!627399 () Bool)

(assert (=> b!654266 m!627399))

(declare-fun m!627401 () Bool)

(assert (=> b!654246 m!627401))

(assert (=> b!654250 m!627347))

(assert (=> b!654244 m!627347))

(assert (=> b!654244 m!627347))

(declare-fun m!627403 () Bool)

(assert (=> b!654244 m!627403))

(declare-fun m!627405 () Bool)

(assert (=> b!654256 m!627405))

(declare-fun m!627407 () Bool)

(assert (=> b!654260 m!627407))

(declare-fun m!627409 () Bool)

(assert (=> b!654258 m!627409))

(assert (=> b!654258 m!627347))

(assert (=> b!654258 m!627347))

(declare-fun m!627411 () Bool)

(assert (=> b!654258 m!627411))

(declare-fun m!627413 () Bool)

(assert (=> start!59324 m!627413))

(declare-fun m!627415 () Bool)

(assert (=> start!59324 m!627415))

(push 1)

