; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58870 () Bool)

(assert start!58870)

(declare-fun b!649215 () Bool)

(declare-fun res!420749 () Bool)

(declare-fun e!372367 () Bool)

(assert (=> b!649215 (=> (not res!420749) (not e!372367))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!38532 0))(
  ( (array!38533 (arr!18472 (Array (_ BitVec 32) (_ BitVec 64))) (size!18836 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38532)

(assert (=> b!649215 (= res!420749 (and (= (size!18836 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18836 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18836 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649216 () Bool)

(declare-fun e!372370 () Bool)

(declare-fun e!372369 () Bool)

(assert (=> b!649216 (= e!372370 e!372369)))

(declare-fun res!420750 () Bool)

(assert (=> b!649216 (=> (not res!420750) (not e!372369))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!649216 (= res!420750 (= (select (store (arr!18472 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!301437 () array!38532)

(assert (=> b!649216 (= lt!301437 (array!38533 (store (arr!18472 a!2986) i!1108 k0!1786) (size!18836 a!2986)))))

(declare-fun b!649217 () Bool)

(declare-fun e!372366 () Bool)

(assert (=> b!649217 (= e!372369 e!372366)))

(declare-fun res!420755 () Bool)

(assert (=> b!649217 (=> (not res!420755) (not e!372366))))

(declare-datatypes ((SeekEntryResult!6912 0))(
  ( (MissingZero!6912 (index!29995 (_ BitVec 32))) (Found!6912 (index!29996 (_ BitVec 32))) (Intermediate!6912 (undefined!7724 Bool) (index!29997 (_ BitVec 32)) (x!58781 (_ BitVec 32))) (Undefined!6912) (MissingVacant!6912 (index!29998 (_ BitVec 32))) )
))
(declare-fun lt!301433 () SeekEntryResult!6912)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!649217 (= res!420755 (and (= lt!301433 (Found!6912 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18472 a!2986) index!984) (select (arr!18472 a!2986) j!136))) (not (= (select (arr!18472 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38532 (_ BitVec 32)) SeekEntryResult!6912)

(assert (=> b!649217 (= lt!301433 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18472 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649218 () Bool)

(declare-datatypes ((Unit!22098 0))(
  ( (Unit!22099) )
))
(declare-fun e!372381 () Unit!22098)

(declare-fun Unit!22100 () Unit!22098)

(assert (=> b!649218 (= e!372381 Unit!22100)))

(assert (=> b!649218 false))

(declare-fun b!649219 () Bool)

(declare-fun e!372379 () Unit!22098)

(declare-fun Unit!22101 () Unit!22098)

(assert (=> b!649219 (= e!372379 Unit!22101)))

(declare-fun b!649220 () Bool)

(declare-fun e!372376 () Bool)

(declare-fun e!372371 () Bool)

(assert (=> b!649220 (= e!372376 e!372371)))

(declare-fun res!420767 () Bool)

(assert (=> b!649220 (=> res!420767 e!372371)))

(declare-fun lt!301432 () (_ BitVec 64))

(declare-fun lt!301440 () (_ BitVec 64))

(assert (=> b!649220 (= res!420767 (or (not (= (select (arr!18472 a!2986) j!136) lt!301440)) (not (= (select (arr!18472 a!2986) j!136) lt!301432))))))

(declare-fun e!372378 () Bool)

(assert (=> b!649220 e!372378))

(declare-fun res!420746 () Bool)

(assert (=> b!649220 (=> (not res!420746) (not e!372378))))

(assert (=> b!649220 (= res!420746 (= lt!301432 (select (arr!18472 a!2986) j!136)))))

(assert (=> b!649220 (= lt!301432 (select (store (arr!18472 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!649221 () Bool)

(declare-fun res!420745 () Bool)

(assert (=> b!649221 (=> (not res!420745) (not e!372370))))

(declare-datatypes ((List!12513 0))(
  ( (Nil!12510) (Cons!12509 (h!13554 (_ BitVec 64)) (t!18741 List!12513)) )
))
(declare-fun arrayNoDuplicates!0 (array!38532 (_ BitVec 32) List!12513) Bool)

(assert (=> b!649221 (= res!420745 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12510))))

(declare-fun b!649222 () Bool)

(declare-fun e!372374 () Bool)

(assert (=> b!649222 (= e!372378 e!372374)))

(declare-fun res!420754 () Bool)

(assert (=> b!649222 (=> res!420754 e!372374)))

(assert (=> b!649222 (= res!420754 (or (not (= (select (arr!18472 a!2986) j!136) lt!301440)) (not (= (select (arr!18472 a!2986) j!136) lt!301432)) (bvsge j!136 index!984)))))

(declare-fun res!420766 () Bool)

(assert (=> start!58870 (=> (not res!420766) (not e!372367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58870 (= res!420766 (validMask!0 mask!3053))))

(assert (=> start!58870 e!372367))

(assert (=> start!58870 true))

(declare-fun array_inv!14268 (array!38532) Bool)

(assert (=> start!58870 (array_inv!14268 a!2986)))

(declare-fun b!649223 () Bool)

(declare-fun e!372380 () Bool)

(assert (=> b!649223 (= e!372374 e!372380)))

(declare-fun res!420758 () Bool)

(assert (=> b!649223 (=> (not res!420758) (not e!372380))))

(declare-fun arrayContainsKey!0 (array!38532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649223 (= res!420758 (arrayContainsKey!0 lt!301437 (select (arr!18472 a!2986) j!136) j!136))))

(declare-fun b!649224 () Bool)

(declare-fun e!372377 () Bool)

(assert (=> b!649224 (= e!372377 true)))

(declare-fun lt!301428 () Bool)

(declare-fun contains!3168 (List!12513 (_ BitVec 64)) Bool)

(assert (=> b!649224 (= lt!301428 (contains!3168 Nil!12510 k0!1786))))

(declare-fun b!649225 () Bool)

(declare-fun res!420765 () Bool)

(assert (=> b!649225 (=> (not res!420765) (not e!372370))))

(assert (=> b!649225 (= res!420765 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18472 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649226 () Bool)

(declare-fun res!420751 () Bool)

(assert (=> b!649226 (=> (not res!420751) (not e!372367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649226 (= res!420751 (validKeyInArray!0 k0!1786))))

(declare-fun b!649227 () Bool)

(declare-fun e!372368 () Bool)

(declare-fun lt!301444 () SeekEntryResult!6912)

(assert (=> b!649227 (= e!372368 (= lt!301433 lt!301444))))

(declare-fun b!649228 () Bool)

(declare-fun res!420764 () Bool)

(assert (=> b!649228 (=> res!420764 e!372377)))

(assert (=> b!649228 (= res!420764 (contains!3168 Nil!12510 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!649229 () Bool)

(declare-fun Unit!22102 () Unit!22098)

(assert (=> b!649229 (= e!372381 Unit!22102)))

(declare-fun b!649230 () Bool)

(assert (=> b!649230 (= e!372380 (arrayContainsKey!0 lt!301437 (select (arr!18472 a!2986) j!136) index!984))))

(declare-fun b!649231 () Bool)

(assert (=> b!649231 (= e!372366 (not e!372376))))

(declare-fun res!420747 () Bool)

(assert (=> b!649231 (=> res!420747 e!372376)))

(declare-fun lt!301430 () SeekEntryResult!6912)

(assert (=> b!649231 (= res!420747 (not (= lt!301430 (Found!6912 index!984))))))

(declare-fun lt!301435 () Unit!22098)

(assert (=> b!649231 (= lt!301435 e!372381)))

(declare-fun c!74602 () Bool)

(assert (=> b!649231 (= c!74602 (= lt!301430 Undefined!6912))))

(assert (=> b!649231 (= lt!301430 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301440 lt!301437 mask!3053))))

(assert (=> b!649231 e!372368))

(declare-fun res!420761 () Bool)

(assert (=> b!649231 (=> (not res!420761) (not e!372368))))

(declare-fun lt!301439 () (_ BitVec 32))

(assert (=> b!649231 (= res!420761 (= lt!301444 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301439 vacantSpotIndex!68 lt!301440 lt!301437 mask!3053)))))

(assert (=> b!649231 (= lt!301444 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301439 vacantSpotIndex!68 (select (arr!18472 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649231 (= lt!301440 (select (store (arr!18472 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301438 () Unit!22098)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38532 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22098)

(assert (=> b!649231 (= lt!301438 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301439 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649231 (= lt!301439 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649232 () Bool)

(declare-fun res!420752 () Bool)

(assert (=> b!649232 (=> res!420752 e!372377)))

(declare-fun noDuplicate!430 (List!12513) Bool)

(assert (=> b!649232 (= res!420752 (not (noDuplicate!430 Nil!12510)))))

(declare-fun b!649233 () Bool)

(declare-fun Unit!22103 () Unit!22098)

(assert (=> b!649233 (= e!372379 Unit!22103)))

(declare-fun lt!301441 () Unit!22098)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38532 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22098)

(assert (=> b!649233 (= lt!301441 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301437 (select (arr!18472 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649233 (arrayContainsKey!0 lt!301437 (select (arr!18472 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301429 () Unit!22098)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38532 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12513) Unit!22098)

(assert (=> b!649233 (= lt!301429 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12510))))

(assert (=> b!649233 (arrayNoDuplicates!0 lt!301437 #b00000000000000000000000000000000 Nil!12510)))

(declare-fun lt!301442 () Unit!22098)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38532 (_ BitVec 32) (_ BitVec 32)) Unit!22098)

(assert (=> b!649233 (= lt!301442 (lemmaNoDuplicateFromThenFromBigger!0 lt!301437 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649233 (arrayNoDuplicates!0 lt!301437 j!136 Nil!12510)))

(declare-fun lt!301436 () Unit!22098)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38532 (_ BitVec 64) (_ BitVec 32) List!12513) Unit!22098)

(assert (=> b!649233 (= lt!301436 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301437 (select (arr!18472 a!2986) j!136) j!136 Nil!12510))))

(assert (=> b!649233 false))

(declare-fun b!649234 () Bool)

(declare-fun res!420760 () Bool)

(assert (=> b!649234 (=> (not res!420760) (not e!372370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38532 (_ BitVec 32)) Bool)

(assert (=> b!649234 (= res!420760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649235 () Bool)

(declare-fun res!420759 () Bool)

(assert (=> b!649235 (=> (not res!420759) (not e!372367))))

(assert (=> b!649235 (= res!420759 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649236 () Bool)

(declare-fun res!420753 () Bool)

(assert (=> b!649236 (=> res!420753 e!372377)))

(assert (=> b!649236 (= res!420753 (contains!3168 Nil!12510 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!372372 () Bool)

(declare-fun b!649237 () Bool)

(assert (=> b!649237 (= e!372372 (arrayContainsKey!0 lt!301437 (select (arr!18472 a!2986) j!136) index!984))))

(declare-fun b!649238 () Bool)

(declare-fun res!420763 () Bool)

(assert (=> b!649238 (=> (not res!420763) (not e!372367))))

(assert (=> b!649238 (= res!420763 (validKeyInArray!0 (select (arr!18472 a!2986) j!136)))))

(declare-fun b!649239 () Bool)

(declare-fun e!372375 () Bool)

(assert (=> b!649239 (= e!372375 e!372377)))

(declare-fun res!420748 () Bool)

(assert (=> b!649239 (=> res!420748 e!372377)))

(assert (=> b!649239 (= res!420748 (or (bvsge (size!18836 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18836 a!2986))))))

(assert (=> b!649239 (arrayContainsKey!0 lt!301437 (select (arr!18472 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301431 () Unit!22098)

(assert (=> b!649239 (= lt!301431 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301437 (select (arr!18472 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!649239 e!372372))

(declare-fun res!420756 () Bool)

(assert (=> b!649239 (=> (not res!420756) (not e!372372))))

(assert (=> b!649239 (= res!420756 (arrayContainsKey!0 lt!301437 (select (arr!18472 a!2986) j!136) j!136))))

(declare-fun b!649240 () Bool)

(assert (=> b!649240 (= e!372371 e!372375)))

(declare-fun res!420762 () Bool)

(assert (=> b!649240 (=> res!420762 e!372375)))

(assert (=> b!649240 (= res!420762 (bvsge index!984 j!136))))

(declare-fun lt!301443 () Unit!22098)

(assert (=> b!649240 (= lt!301443 e!372379)))

(declare-fun c!74603 () Bool)

(assert (=> b!649240 (= c!74603 (bvslt j!136 index!984))))

(declare-fun b!649241 () Bool)

(assert (=> b!649241 (= e!372367 e!372370)))

(declare-fun res!420757 () Bool)

(assert (=> b!649241 (=> (not res!420757) (not e!372370))))

(declare-fun lt!301434 () SeekEntryResult!6912)

(assert (=> b!649241 (= res!420757 (or (= lt!301434 (MissingZero!6912 i!1108)) (= lt!301434 (MissingVacant!6912 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38532 (_ BitVec 32)) SeekEntryResult!6912)

(assert (=> b!649241 (= lt!301434 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!58870 res!420766) b!649215))

(assert (= (and b!649215 res!420749) b!649238))

(assert (= (and b!649238 res!420763) b!649226))

(assert (= (and b!649226 res!420751) b!649235))

(assert (= (and b!649235 res!420759) b!649241))

(assert (= (and b!649241 res!420757) b!649234))

(assert (= (and b!649234 res!420760) b!649221))

(assert (= (and b!649221 res!420745) b!649225))

(assert (= (and b!649225 res!420765) b!649216))

(assert (= (and b!649216 res!420750) b!649217))

(assert (= (and b!649217 res!420755) b!649231))

(assert (= (and b!649231 res!420761) b!649227))

(assert (= (and b!649231 c!74602) b!649218))

(assert (= (and b!649231 (not c!74602)) b!649229))

(assert (= (and b!649231 (not res!420747)) b!649220))

(assert (= (and b!649220 res!420746) b!649222))

(assert (= (and b!649222 (not res!420754)) b!649223))

(assert (= (and b!649223 res!420758) b!649230))

(assert (= (and b!649220 (not res!420767)) b!649240))

(assert (= (and b!649240 c!74603) b!649233))

(assert (= (and b!649240 (not c!74603)) b!649219))

(assert (= (and b!649240 (not res!420762)) b!649239))

(assert (= (and b!649239 res!420756) b!649237))

(assert (= (and b!649239 (not res!420748)) b!649232))

(assert (= (and b!649232 (not res!420752)) b!649236))

(assert (= (and b!649236 (not res!420753)) b!649228))

(assert (= (and b!649228 (not res!420764)) b!649224))

(declare-fun m!622493 () Bool)

(assert (=> b!649241 m!622493))

(declare-fun m!622495 () Bool)

(assert (=> start!58870 m!622495))

(declare-fun m!622497 () Bool)

(assert (=> start!58870 m!622497))

(declare-fun m!622499 () Bool)

(assert (=> b!649236 m!622499))

(declare-fun m!622501 () Bool)

(assert (=> b!649235 m!622501))

(declare-fun m!622503 () Bool)

(assert (=> b!649237 m!622503))

(assert (=> b!649237 m!622503))

(declare-fun m!622505 () Bool)

(assert (=> b!649237 m!622505))

(assert (=> b!649223 m!622503))

(assert (=> b!649223 m!622503))

(declare-fun m!622507 () Bool)

(assert (=> b!649223 m!622507))

(assert (=> b!649222 m!622503))

(declare-fun m!622509 () Bool)

(assert (=> b!649226 m!622509))

(declare-fun m!622511 () Bool)

(assert (=> b!649232 m!622511))

(assert (=> b!649238 m!622503))

(assert (=> b!649238 m!622503))

(declare-fun m!622513 () Bool)

(assert (=> b!649238 m!622513))

(assert (=> b!649230 m!622503))

(assert (=> b!649230 m!622503))

(assert (=> b!649230 m!622505))

(declare-fun m!622515 () Bool)

(assert (=> b!649224 m!622515))

(declare-fun m!622517 () Bool)

(assert (=> b!649228 m!622517))

(declare-fun m!622519 () Bool)

(assert (=> b!649225 m!622519))

(declare-fun m!622521 () Bool)

(assert (=> b!649221 m!622521))

(assert (=> b!649239 m!622503))

(assert (=> b!649239 m!622503))

(declare-fun m!622523 () Bool)

(assert (=> b!649239 m!622523))

(assert (=> b!649239 m!622503))

(declare-fun m!622525 () Bool)

(assert (=> b!649239 m!622525))

(assert (=> b!649239 m!622503))

(assert (=> b!649239 m!622507))

(assert (=> b!649233 m!622503))

(assert (=> b!649233 m!622503))

(declare-fun m!622527 () Bool)

(assert (=> b!649233 m!622527))

(declare-fun m!622529 () Bool)

(assert (=> b!649233 m!622529))

(declare-fun m!622531 () Bool)

(assert (=> b!649233 m!622531))

(declare-fun m!622533 () Bool)

(assert (=> b!649233 m!622533))

(assert (=> b!649233 m!622503))

(declare-fun m!622535 () Bool)

(assert (=> b!649233 m!622535))

(declare-fun m!622537 () Bool)

(assert (=> b!649233 m!622537))

(assert (=> b!649233 m!622503))

(declare-fun m!622539 () Bool)

(assert (=> b!649233 m!622539))

(declare-fun m!622541 () Bool)

(assert (=> b!649217 m!622541))

(assert (=> b!649217 m!622503))

(assert (=> b!649217 m!622503))

(declare-fun m!622543 () Bool)

(assert (=> b!649217 m!622543))

(declare-fun m!622545 () Bool)

(assert (=> b!649234 m!622545))

(assert (=> b!649220 m!622503))

(declare-fun m!622547 () Bool)

(assert (=> b!649220 m!622547))

(declare-fun m!622549 () Bool)

(assert (=> b!649220 m!622549))

(declare-fun m!622551 () Bool)

(assert (=> b!649231 m!622551))

(declare-fun m!622553 () Bool)

(assert (=> b!649231 m!622553))

(assert (=> b!649231 m!622547))

(assert (=> b!649231 m!622503))

(declare-fun m!622555 () Bool)

(assert (=> b!649231 m!622555))

(declare-fun m!622557 () Bool)

(assert (=> b!649231 m!622557))

(declare-fun m!622559 () Bool)

(assert (=> b!649231 m!622559))

(assert (=> b!649231 m!622503))

(declare-fun m!622561 () Bool)

(assert (=> b!649231 m!622561))

(assert (=> b!649216 m!622547))

(declare-fun m!622563 () Bool)

(assert (=> b!649216 m!622563))

(check-sat (not b!649238) (not b!649234) (not b!649237) (not b!649226) (not b!649232) (not b!649223) (not b!649241) (not b!649221) (not b!649230) (not b!649217) (not b!649224) (not b!649235) (not b!649239) (not start!58870) (not b!649233) (not b!649236) (not b!649228) (not b!649231))
(check-sat)
