; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55996 () Bool)

(assert start!55996)

(declare-fun b!615216 () Bool)

(declare-fun e!352749 () Bool)

(declare-fun e!352742 () Bool)

(assert (=> b!615216 (= e!352749 e!352742)))

(declare-fun res!396278 () Bool)

(assert (=> b!615216 (=> (not res!396278) (not e!352742))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6419 0))(
  ( (MissingZero!6419 (index!27960 (_ BitVec 32))) (Found!6419 (index!27961 (_ BitVec 32))) (Intermediate!6419 (undefined!7231 Bool) (index!27962 (_ BitVec 32)) (x!56763 (_ BitVec 32))) (Undefined!6419) (MissingVacant!6419 (index!27963 (_ BitVec 32))) )
))
(declare-fun lt!282505 () SeekEntryResult!6419)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37466 0))(
  ( (array!37467 (arr!17979 (Array (_ BitVec 32) (_ BitVec 64))) (size!18343 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37466)

(assert (=> b!615216 (= res!396278 (and (= lt!282505 (Found!6419 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17979 a!2986) index!984) (select (arr!17979 a!2986) j!136))) (not (= (select (arr!17979 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37466 (_ BitVec 32)) SeekEntryResult!6419)

(assert (=> b!615216 (= lt!282505 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17979 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!615217 () Bool)

(declare-fun res!396280 () Bool)

(declare-fun e!352736 () Bool)

(assert (=> b!615217 (=> (not res!396280) (not e!352736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!615217 (= res!396280 (validKeyInArray!0 (select (arr!17979 a!2986) j!136)))))

(declare-fun b!615218 () Bool)

(declare-fun res!396272 () Bool)

(assert (=> b!615218 (=> (not res!396272) (not e!352736))))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!615218 (= res!396272 (validKeyInArray!0 k!1786))))

(declare-fun b!615219 () Bool)

(declare-datatypes ((Unit!19918 0))(
  ( (Unit!19919) )
))
(declare-fun e!352743 () Unit!19918)

(declare-fun Unit!19920 () Unit!19918)

(assert (=> b!615219 (= e!352743 Unit!19920)))

(declare-fun b!615220 () Bool)

(declare-fun e!352745 () Bool)

(assert (=> b!615220 (= e!352745 e!352749)))

(declare-fun res!396275 () Bool)

(assert (=> b!615220 (=> (not res!396275) (not e!352749))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!615220 (= res!396275 (= (select (store (arr!17979 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!282514 () array!37466)

(assert (=> b!615220 (= lt!282514 (array!37467 (store (arr!17979 a!2986) i!1108 k!1786) (size!18343 a!2986)))))

(declare-fun b!615221 () Bool)

(declare-fun res!396271 () Bool)

(assert (=> b!615221 (=> (not res!396271) (not e!352745))))

(declare-datatypes ((List!12020 0))(
  ( (Nil!12017) (Cons!12016 (h!13061 (_ BitVec 64)) (t!18248 List!12020)) )
))
(declare-fun arrayNoDuplicates!0 (array!37466 (_ BitVec 32) List!12020) Bool)

(assert (=> b!615221 (= res!396271 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12017))))

(declare-fun res!396269 () Bool)

(assert (=> start!55996 (=> (not res!396269) (not e!352736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55996 (= res!396269 (validMask!0 mask!3053))))

(assert (=> start!55996 e!352736))

(assert (=> start!55996 true))

(declare-fun array_inv!13775 (array!37466) Bool)

(assert (=> start!55996 (array_inv!13775 a!2986)))

(declare-fun e!352739 () Bool)

(declare-fun b!615222 () Bool)

(declare-fun arrayContainsKey!0 (array!37466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!615222 (= e!352739 (arrayContainsKey!0 lt!282514 (select (arr!17979 a!2986) j!136) index!984))))

(declare-fun b!615223 () Bool)

(assert (=> b!615223 false))

(declare-fun lt!282502 () Unit!19918)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37466 (_ BitVec 64) (_ BitVec 32) List!12020) Unit!19918)

(assert (=> b!615223 (= lt!282502 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282514 (select (arr!17979 a!2986) j!136) j!136 Nil!12017))))

(assert (=> b!615223 (arrayNoDuplicates!0 lt!282514 j!136 Nil!12017)))

(declare-fun lt!282500 () Unit!19918)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37466 (_ BitVec 32) (_ BitVec 32)) Unit!19918)

(assert (=> b!615223 (= lt!282500 (lemmaNoDuplicateFromThenFromBigger!0 lt!282514 #b00000000000000000000000000000000 j!136))))

(assert (=> b!615223 (arrayNoDuplicates!0 lt!282514 #b00000000000000000000000000000000 Nil!12017)))

(declare-fun lt!282512 () Unit!19918)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37466 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12020) Unit!19918)

(assert (=> b!615223 (= lt!282512 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12017))))

(assert (=> b!615223 (arrayContainsKey!0 lt!282514 (select (arr!17979 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!282504 () Unit!19918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37466 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19918)

(assert (=> b!615223 (= lt!282504 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282514 (select (arr!17979 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!352740 () Unit!19918)

(declare-fun Unit!19921 () Unit!19918)

(assert (=> b!615223 (= e!352740 Unit!19921)))

(declare-fun b!615224 () Bool)

(assert (=> b!615224 (= e!352742 (not true))))

(declare-fun lt!282498 () Unit!19918)

(declare-fun e!352746 () Unit!19918)

(assert (=> b!615224 (= lt!282498 e!352746)))

(declare-fun c!69843 () Bool)

(declare-fun lt!282517 () SeekEntryResult!6419)

(assert (=> b!615224 (= c!69843 (= lt!282517 (Found!6419 index!984)))))

(declare-fun lt!282508 () Unit!19918)

(assert (=> b!615224 (= lt!282508 e!352743)))

(declare-fun c!69842 () Bool)

(assert (=> b!615224 (= c!69842 (= lt!282517 Undefined!6419))))

(declare-fun lt!282511 () (_ BitVec 64))

(assert (=> b!615224 (= lt!282517 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!282511 lt!282514 mask!3053))))

(declare-fun e!352737 () Bool)

(assert (=> b!615224 e!352737))

(declare-fun res!396270 () Bool)

(assert (=> b!615224 (=> (not res!396270) (not e!352737))))

(declare-fun lt!282513 () SeekEntryResult!6419)

(declare-fun lt!282499 () (_ BitVec 32))

(assert (=> b!615224 (= res!396270 (= lt!282513 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282499 vacantSpotIndex!68 lt!282511 lt!282514 mask!3053)))))

(assert (=> b!615224 (= lt!282513 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!282499 vacantSpotIndex!68 (select (arr!17979 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!615224 (= lt!282511 (select (store (arr!17979 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!282501 () Unit!19918)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37466 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19918)

(assert (=> b!615224 (= lt!282501 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!282499 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!615224 (= lt!282499 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!615225 () Bool)

(assert (=> b!615225 false))

(declare-fun lt!282510 () Unit!19918)

(assert (=> b!615225 (= lt!282510 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!282514 (select (arr!17979 a!2986) j!136) index!984 Nil!12017))))

(assert (=> b!615225 (arrayNoDuplicates!0 lt!282514 index!984 Nil!12017)))

(declare-fun lt!282507 () Unit!19918)

(assert (=> b!615225 (= lt!282507 (lemmaNoDuplicateFromThenFromBigger!0 lt!282514 #b00000000000000000000000000000000 index!984))))

(assert (=> b!615225 (arrayNoDuplicates!0 lt!282514 #b00000000000000000000000000000000 Nil!12017)))

(declare-fun lt!282503 () Unit!19918)

(assert (=> b!615225 (= lt!282503 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12017))))

(assert (=> b!615225 (arrayContainsKey!0 lt!282514 (select (arr!17979 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!282515 () Unit!19918)

(assert (=> b!615225 (= lt!282515 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!282514 (select (arr!17979 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!352741 () Bool)

(assert (=> b!615225 e!352741))

(declare-fun res!396276 () Bool)

(assert (=> b!615225 (=> (not res!396276) (not e!352741))))

(assert (=> b!615225 (= res!396276 (arrayContainsKey!0 lt!282514 (select (arr!17979 a!2986) j!136) j!136))))

(declare-fun e!352738 () Unit!19918)

(declare-fun Unit!19922 () Unit!19918)

(assert (=> b!615225 (= e!352738 Unit!19922)))

(declare-fun b!615226 () Bool)

(declare-fun Unit!19923 () Unit!19918)

(assert (=> b!615226 (= e!352743 Unit!19923)))

(assert (=> b!615226 false))

(declare-fun b!615227 () Bool)

(assert (=> b!615227 (= e!352737 (= lt!282505 lt!282513))))

(declare-fun b!615228 () Bool)

(declare-fun res!396277 () Bool)

(assert (=> b!615228 (= res!396277 (bvsge j!136 index!984))))

(declare-fun e!352747 () Bool)

(assert (=> b!615228 (=> res!396277 e!352747)))

(declare-fun e!352744 () Bool)

(assert (=> b!615228 (= e!352744 e!352747)))

(declare-fun b!615229 () Bool)

(assert (=> b!615229 (= e!352741 (arrayContainsKey!0 lt!282514 (select (arr!17979 a!2986) j!136) index!984))))

(declare-fun res!396274 () Bool)

(declare-fun b!615230 () Bool)

(assert (=> b!615230 (= res!396274 (arrayContainsKey!0 lt!282514 (select (arr!17979 a!2986) j!136) j!136))))

(assert (=> b!615230 (=> (not res!396274) (not e!352739))))

(assert (=> b!615230 (= e!352747 e!352739)))

(declare-fun b!615231 () Bool)

(declare-fun res!396266 () Bool)

(assert (=> b!615231 (=> (not res!396266) (not e!352736))))

(assert (=> b!615231 (= res!396266 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!615232 () Bool)

(declare-fun Unit!19924 () Unit!19918)

(assert (=> b!615232 (= e!352738 Unit!19924)))

(declare-fun b!615233 () Bool)

(declare-fun Unit!19925 () Unit!19918)

(assert (=> b!615233 (= e!352746 Unit!19925)))

(declare-fun b!615234 () Bool)

(assert (=> b!615234 (= e!352736 e!352745)))

(declare-fun res!396268 () Bool)

(assert (=> b!615234 (=> (not res!396268) (not e!352745))))

(declare-fun lt!282516 () SeekEntryResult!6419)

(assert (=> b!615234 (= res!396268 (or (= lt!282516 (MissingZero!6419 i!1108)) (= lt!282516 (MissingVacant!6419 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37466 (_ BitVec 32)) SeekEntryResult!6419)

(assert (=> b!615234 (= lt!282516 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!615235 () Bool)

(declare-fun Unit!19926 () Unit!19918)

(assert (=> b!615235 (= e!352746 Unit!19926)))

(declare-fun res!396273 () Bool)

(assert (=> b!615235 (= res!396273 (= (select (store (arr!17979 a!2986) i!1108 k!1786) index!984) (select (arr!17979 a!2986) j!136)))))

(assert (=> b!615235 (=> (not res!396273) (not e!352744))))

(assert (=> b!615235 e!352744))

(declare-fun c!69845 () Bool)

(assert (=> b!615235 (= c!69845 (bvslt j!136 index!984))))

(declare-fun lt!282506 () Unit!19918)

(assert (=> b!615235 (= lt!282506 e!352740)))

(declare-fun c!69844 () Bool)

(assert (=> b!615235 (= c!69844 (bvslt index!984 j!136))))

(declare-fun lt!282509 () Unit!19918)

(assert (=> b!615235 (= lt!282509 e!352738)))

(assert (=> b!615235 false))

(declare-fun b!615236 () Bool)

(declare-fun res!396281 () Bool)

(assert (=> b!615236 (=> (not res!396281) (not e!352745))))

(assert (=> b!615236 (= res!396281 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17979 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!615237 () Bool)

(declare-fun res!396279 () Bool)

(assert (=> b!615237 (=> (not res!396279) (not e!352745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37466 (_ BitVec 32)) Bool)

(assert (=> b!615237 (= res!396279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!615238 () Bool)

(declare-fun Unit!19927 () Unit!19918)

(assert (=> b!615238 (= e!352740 Unit!19927)))

(declare-fun b!615239 () Bool)

(declare-fun res!396267 () Bool)

(assert (=> b!615239 (=> (not res!396267) (not e!352736))))

(assert (=> b!615239 (= res!396267 (and (= (size!18343 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18343 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18343 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!55996 res!396269) b!615239))

(assert (= (and b!615239 res!396267) b!615217))

(assert (= (and b!615217 res!396280) b!615218))

(assert (= (and b!615218 res!396272) b!615231))

(assert (= (and b!615231 res!396266) b!615234))

(assert (= (and b!615234 res!396268) b!615237))

(assert (= (and b!615237 res!396279) b!615221))

(assert (= (and b!615221 res!396271) b!615236))

(assert (= (and b!615236 res!396281) b!615220))

(assert (= (and b!615220 res!396275) b!615216))

(assert (= (and b!615216 res!396278) b!615224))

(assert (= (and b!615224 res!396270) b!615227))

(assert (= (and b!615224 c!69842) b!615226))

(assert (= (and b!615224 (not c!69842)) b!615219))

(assert (= (and b!615224 c!69843) b!615235))

(assert (= (and b!615224 (not c!69843)) b!615233))

(assert (= (and b!615235 res!396273) b!615228))

(assert (= (and b!615228 (not res!396277)) b!615230))

(assert (= (and b!615230 res!396274) b!615222))

(assert (= (and b!615235 c!69845) b!615223))

(assert (= (and b!615235 (not c!69845)) b!615238))

(assert (= (and b!615235 c!69844) b!615225))

(assert (= (and b!615235 (not c!69844)) b!615232))

(assert (= (and b!615225 res!396276) b!615229))

(declare-fun m!591425 () Bool)

(assert (=> b!615230 m!591425))

(assert (=> b!615230 m!591425))

(declare-fun m!591427 () Bool)

(assert (=> b!615230 m!591427))

(declare-fun m!591429 () Bool)

(assert (=> b!615235 m!591429))

(declare-fun m!591431 () Bool)

(assert (=> b!615235 m!591431))

(assert (=> b!615235 m!591425))

(assert (=> b!615220 m!591429))

(declare-fun m!591433 () Bool)

(assert (=> b!615220 m!591433))

(declare-fun m!591435 () Bool)

(assert (=> b!615216 m!591435))

(assert (=> b!615216 m!591425))

(assert (=> b!615216 m!591425))

(declare-fun m!591437 () Bool)

(assert (=> b!615216 m!591437))

(declare-fun m!591439 () Bool)

(assert (=> b!615231 m!591439))

(assert (=> b!615217 m!591425))

(assert (=> b!615217 m!591425))

(declare-fun m!591441 () Bool)

(assert (=> b!615217 m!591441))

(declare-fun m!591443 () Bool)

(assert (=> b!615224 m!591443))

(declare-fun m!591445 () Bool)

(assert (=> b!615224 m!591445))

(assert (=> b!615224 m!591425))

(declare-fun m!591447 () Bool)

(assert (=> b!615224 m!591447))

(declare-fun m!591449 () Bool)

(assert (=> b!615224 m!591449))

(assert (=> b!615224 m!591425))

(declare-fun m!591451 () Bool)

(assert (=> b!615224 m!591451))

(assert (=> b!615224 m!591429))

(declare-fun m!591453 () Bool)

(assert (=> b!615224 m!591453))

(assert (=> b!615225 m!591425))

(declare-fun m!591455 () Bool)

(assert (=> b!615225 m!591455))

(assert (=> b!615225 m!591425))

(declare-fun m!591457 () Bool)

(assert (=> b!615225 m!591457))

(assert (=> b!615225 m!591425))

(declare-fun m!591459 () Bool)

(assert (=> b!615225 m!591459))

(declare-fun m!591461 () Bool)

(assert (=> b!615225 m!591461))

(declare-fun m!591463 () Bool)

(assert (=> b!615225 m!591463))

(assert (=> b!615225 m!591425))

(assert (=> b!615225 m!591427))

(assert (=> b!615225 m!591425))

(declare-fun m!591465 () Bool)

(assert (=> b!615225 m!591465))

(declare-fun m!591467 () Bool)

(assert (=> b!615225 m!591467))

(declare-fun m!591469 () Bool)

(assert (=> b!615221 m!591469))

(declare-fun m!591471 () Bool)

(assert (=> b!615236 m!591471))

(assert (=> b!615229 m!591425))

(assert (=> b!615229 m!591425))

(declare-fun m!591473 () Bool)

(assert (=> b!615229 m!591473))

(declare-fun m!591475 () Bool)

(assert (=> start!55996 m!591475))

(declare-fun m!591477 () Bool)

(assert (=> start!55996 m!591477))

(assert (=> b!615222 m!591425))

(assert (=> b!615222 m!591425))

(assert (=> b!615222 m!591473))

(declare-fun m!591479 () Bool)

(assert (=> b!615237 m!591479))

(assert (=> b!615223 m!591425))

(assert (=> b!615223 m!591425))

(declare-fun m!591481 () Bool)

(assert (=> b!615223 m!591481))

(assert (=> b!615223 m!591425))

(declare-fun m!591483 () Bool)

(assert (=> b!615223 m!591483))

(assert (=> b!615223 m!591461))

(assert (=> b!615223 m!591425))

(declare-fun m!591485 () Bool)

(assert (=> b!615223 m!591485))

(declare-fun m!591487 () Bool)

(assert (=> b!615223 m!591487))

(declare-fun m!591489 () Bool)

(assert (=> b!615223 m!591489))

(assert (=> b!615223 m!591467))

(declare-fun m!591491 () Bool)

(assert (=> b!615218 m!591491))

(declare-fun m!591493 () Bool)

(assert (=> b!615234 m!591493))

(push 1)

