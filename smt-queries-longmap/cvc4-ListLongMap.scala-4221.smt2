; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57910 () Bool)

(assert start!57910)

(declare-fun b!640362 () Bool)

(declare-fun res!414770 () Bool)

(declare-fun e!366566 () Bool)

(assert (=> b!640362 (=> (not res!414770) (not e!366566))))

(declare-datatypes ((array!38348 0))(
  ( (array!38349 (arr!18393 (Array (_ BitVec 32) (_ BitVec 64))) (size!18758 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38348)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38348 (_ BitVec 32)) Bool)

(assert (=> b!640362 (= res!414770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640363 () Bool)

(declare-fun e!366556 () Bool)

(declare-fun e!366564 () Bool)

(assert (=> b!640363 (= e!366556 (not e!366564))))

(declare-fun res!414777 () Bool)

(assert (=> b!640363 (=> res!414777 e!366564)))

(declare-datatypes ((SeekEntryResult!6830 0))(
  ( (MissingZero!6830 (index!29640 (_ BitVec 32))) (Found!6830 (index!29641 (_ BitVec 32))) (Intermediate!6830 (undefined!7642 Bool) (index!29642 (_ BitVec 32)) (x!58405 (_ BitVec 32))) (Undefined!6830) (MissingVacant!6830 (index!29643 (_ BitVec 32))) )
))
(declare-fun lt!296294 () SeekEntryResult!6830)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!640363 (= res!414777 (not (= lt!296294 (Found!6830 index!984))))))

(declare-datatypes ((Unit!21648 0))(
  ( (Unit!21649) )
))
(declare-fun lt!296287 () Unit!21648)

(declare-fun e!366558 () Unit!21648)

(assert (=> b!640363 (= lt!296287 e!366558)))

(declare-fun c!73167 () Bool)

(assert (=> b!640363 (= c!73167 (= lt!296294 Undefined!6830))))

(declare-fun lt!296297 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!296298 () array!38348)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38348 (_ BitVec 32)) SeekEntryResult!6830)

(assert (=> b!640363 (= lt!296294 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296297 lt!296298 mask!3053))))

(declare-fun e!366560 () Bool)

(assert (=> b!640363 e!366560))

(declare-fun res!414771 () Bool)

(assert (=> b!640363 (=> (not res!414771) (not e!366560))))

(declare-fun lt!296295 () SeekEntryResult!6830)

(declare-fun lt!296291 () (_ BitVec 32))

(assert (=> b!640363 (= res!414771 (= lt!296295 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296291 vacantSpotIndex!68 lt!296297 lt!296298 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!640363 (= lt!296295 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296291 vacantSpotIndex!68 (select (arr!18393 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!640363 (= lt!296297 (select (store (arr!18393 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!296292 () Unit!21648)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38348 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21648)

(assert (=> b!640363 (= lt!296292 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296291 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640363 (= lt!296291 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!640364 () Bool)

(declare-fun Unit!21650 () Unit!21648)

(assert (=> b!640364 (= e!366558 Unit!21650)))

(declare-fun b!640365 () Bool)

(declare-fun Unit!21651 () Unit!21648)

(assert (=> b!640365 (= e!366558 Unit!21651)))

(assert (=> b!640365 false))

(declare-fun b!640366 () Bool)

(declare-fun e!366565 () Bool)

(assert (=> b!640366 (= e!366564 e!366565)))

(declare-fun res!414769 () Bool)

(assert (=> b!640366 (=> res!414769 e!366565)))

(declare-fun lt!296296 () (_ BitVec 64))

(assert (=> b!640366 (= res!414769 (or (not (= (select (arr!18393 a!2986) j!136) lt!296297)) (not (= (select (arr!18393 a!2986) j!136) lt!296296)) (bvsge j!136 index!984)))))

(declare-fun e!366562 () Bool)

(assert (=> b!640366 e!366562))

(declare-fun res!414778 () Bool)

(assert (=> b!640366 (=> (not res!414778) (not e!366562))))

(assert (=> b!640366 (= res!414778 (= lt!296296 (select (arr!18393 a!2986) j!136)))))

(assert (=> b!640366 (= lt!296296 (select (store (arr!18393 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!640367 () Bool)

(declare-fun res!414766 () Bool)

(declare-fun e!366561 () Bool)

(assert (=> b!640367 (=> (not res!414766) (not e!366561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640367 (= res!414766 (validKeyInArray!0 k!1786))))

(declare-fun b!640368 () Bool)

(declare-fun e!366555 () Bool)

(assert (=> b!640368 (= e!366555 e!366556)))

(declare-fun res!414774 () Bool)

(assert (=> b!640368 (=> (not res!414774) (not e!366556))))

(declare-fun lt!296289 () SeekEntryResult!6830)

(assert (=> b!640368 (= res!414774 (and (= lt!296289 (Found!6830 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18393 a!2986) index!984) (select (arr!18393 a!2986) j!136))) (not (= (select (arr!18393 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!640368 (= lt!296289 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18393 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640369 () Bool)

(assert (=> b!640369 (= e!366561 e!366566)))

(declare-fun res!414763 () Bool)

(assert (=> b!640369 (=> (not res!414763) (not e!366566))))

(declare-fun lt!296290 () SeekEntryResult!6830)

(assert (=> b!640369 (= res!414763 (or (= lt!296290 (MissingZero!6830 i!1108)) (= lt!296290 (MissingVacant!6830 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38348 (_ BitVec 32)) SeekEntryResult!6830)

(assert (=> b!640369 (= lt!296290 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!640370 () Bool)

(declare-fun res!414768 () Bool)

(assert (=> b!640370 (=> (not res!414768) (not e!366561))))

(declare-fun arrayContainsKey!0 (array!38348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640370 (= res!414768 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640371 () Bool)

(assert (=> b!640371 (= e!366566 e!366555)))

(declare-fun res!414764 () Bool)

(assert (=> b!640371 (=> (not res!414764) (not e!366555))))

(assert (=> b!640371 (= res!414764 (= (select (store (arr!18393 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640371 (= lt!296298 (array!38349 (store (arr!18393 a!2986) i!1108 k!1786) (size!18758 a!2986)))))

(declare-fun res!414775 () Bool)

(assert (=> start!57910 (=> (not res!414775) (not e!366561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57910 (= res!414775 (validMask!0 mask!3053))))

(assert (=> start!57910 e!366561))

(assert (=> start!57910 true))

(declare-fun array_inv!14276 (array!38348) Bool)

(assert (=> start!57910 (array_inv!14276 a!2986)))

(declare-fun b!640372 () Bool)

(declare-fun res!414765 () Bool)

(assert (=> b!640372 (=> (not res!414765) (not e!366566))))

(assert (=> b!640372 (= res!414765 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18393 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640373 () Bool)

(declare-fun res!414762 () Bool)

(assert (=> b!640373 (=> (not res!414762) (not e!366561))))

(assert (=> b!640373 (= res!414762 (validKeyInArray!0 (select (arr!18393 a!2986) j!136)))))

(declare-fun b!640374 () Bool)

(assert (=> b!640374 (= e!366565 (or (bvsge (size!18758 a!2986) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 j!136) (size!18758 a!2986))))))

(declare-datatypes ((List!12473 0))(
  ( (Nil!12470) (Cons!12469 (h!13514 (_ BitVec 64)) (t!18692 List!12473)) )
))
(declare-fun arrayNoDuplicates!0 (array!38348 (_ BitVec 32) List!12473) Bool)

(assert (=> b!640374 (arrayNoDuplicates!0 lt!296298 j!136 Nil!12470)))

(declare-fun lt!296293 () Unit!21648)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38348 (_ BitVec 32) (_ BitVec 32)) Unit!21648)

(assert (=> b!640374 (= lt!296293 (lemmaNoDuplicateFromThenFromBigger!0 lt!296298 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640374 (arrayNoDuplicates!0 lt!296298 #b00000000000000000000000000000000 Nil!12470)))

(declare-fun lt!296286 () Unit!21648)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38348 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12473) Unit!21648)

(assert (=> b!640374 (= lt!296286 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12470))))

(assert (=> b!640374 (arrayContainsKey!0 lt!296298 (select (arr!18393 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296288 () Unit!21648)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38348 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21648)

(assert (=> b!640374 (= lt!296288 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296298 (select (arr!18393 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!640375 () Bool)

(declare-fun res!414772 () Bool)

(assert (=> b!640375 (=> (not res!414772) (not e!366566))))

(assert (=> b!640375 (= res!414772 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12470))))

(declare-fun b!640376 () Bool)

(declare-fun e!366559 () Bool)

(declare-fun e!366557 () Bool)

(assert (=> b!640376 (= e!366559 e!366557)))

(declare-fun res!414776 () Bool)

(assert (=> b!640376 (=> (not res!414776) (not e!366557))))

(assert (=> b!640376 (= res!414776 (arrayContainsKey!0 lt!296298 (select (arr!18393 a!2986) j!136) j!136))))

(declare-fun b!640377 () Bool)

(declare-fun res!414767 () Bool)

(assert (=> b!640377 (=> (not res!414767) (not e!366561))))

(assert (=> b!640377 (= res!414767 (and (= (size!18758 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18758 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18758 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640378 () Bool)

(assert (=> b!640378 (= e!366560 (= lt!296289 lt!296295))))

(declare-fun b!640379 () Bool)

(assert (=> b!640379 (= e!366562 e!366559)))

(declare-fun res!414773 () Bool)

(assert (=> b!640379 (=> res!414773 e!366559)))

(assert (=> b!640379 (= res!414773 (or (not (= (select (arr!18393 a!2986) j!136) lt!296297)) (not (= (select (arr!18393 a!2986) j!136) lt!296296)) (bvsge j!136 index!984)))))

(declare-fun b!640380 () Bool)

(assert (=> b!640380 (= e!366557 (arrayContainsKey!0 lt!296298 (select (arr!18393 a!2986) j!136) index!984))))

(assert (= (and start!57910 res!414775) b!640377))

(assert (= (and b!640377 res!414767) b!640373))

(assert (= (and b!640373 res!414762) b!640367))

(assert (= (and b!640367 res!414766) b!640370))

(assert (= (and b!640370 res!414768) b!640369))

(assert (= (and b!640369 res!414763) b!640362))

(assert (= (and b!640362 res!414770) b!640375))

(assert (= (and b!640375 res!414772) b!640372))

(assert (= (and b!640372 res!414765) b!640371))

(assert (= (and b!640371 res!414764) b!640368))

(assert (= (and b!640368 res!414774) b!640363))

(assert (= (and b!640363 res!414771) b!640378))

(assert (= (and b!640363 c!73167) b!640365))

(assert (= (and b!640363 (not c!73167)) b!640364))

(assert (= (and b!640363 (not res!414777)) b!640366))

(assert (= (and b!640366 res!414778) b!640379))

(assert (= (and b!640379 (not res!414773)) b!640376))

(assert (= (and b!640376 res!414776) b!640380))

(assert (= (and b!640366 (not res!414769)) b!640374))

(declare-fun m!613711 () Bool)

(assert (=> b!640367 m!613711))

(declare-fun m!613713 () Bool)

(assert (=> b!640379 m!613713))

(assert (=> b!640373 m!613713))

(assert (=> b!640373 m!613713))

(declare-fun m!613715 () Bool)

(assert (=> b!640373 m!613715))

(declare-fun m!613717 () Bool)

(assert (=> b!640372 m!613717))

(assert (=> b!640374 m!613713))

(declare-fun m!613719 () Bool)

(assert (=> b!640374 m!613719))

(assert (=> b!640374 m!613713))

(declare-fun m!613721 () Bool)

(assert (=> b!640374 m!613721))

(assert (=> b!640374 m!613713))

(declare-fun m!613723 () Bool)

(assert (=> b!640374 m!613723))

(declare-fun m!613725 () Bool)

(assert (=> b!640374 m!613725))

(declare-fun m!613727 () Bool)

(assert (=> b!640374 m!613727))

(declare-fun m!613729 () Bool)

(assert (=> b!640374 m!613729))

(declare-fun m!613731 () Bool)

(assert (=> b!640371 m!613731))

(declare-fun m!613733 () Bool)

(assert (=> b!640371 m!613733))

(assert (=> b!640380 m!613713))

(assert (=> b!640380 m!613713))

(declare-fun m!613735 () Bool)

(assert (=> b!640380 m!613735))

(declare-fun m!613737 () Bool)

(assert (=> b!640363 m!613737))

(declare-fun m!613739 () Bool)

(assert (=> b!640363 m!613739))

(assert (=> b!640363 m!613713))

(declare-fun m!613741 () Bool)

(assert (=> b!640363 m!613741))

(assert (=> b!640363 m!613731))

(declare-fun m!613743 () Bool)

(assert (=> b!640363 m!613743))

(assert (=> b!640363 m!613713))

(declare-fun m!613745 () Bool)

(assert (=> b!640363 m!613745))

(declare-fun m!613747 () Bool)

(assert (=> b!640363 m!613747))

(declare-fun m!613749 () Bool)

(assert (=> start!57910 m!613749))

(declare-fun m!613751 () Bool)

(assert (=> start!57910 m!613751))

(assert (=> b!640366 m!613713))

(assert (=> b!640366 m!613731))

(declare-fun m!613753 () Bool)

(assert (=> b!640366 m!613753))

(declare-fun m!613755 () Bool)

(assert (=> b!640370 m!613755))

(assert (=> b!640376 m!613713))

(assert (=> b!640376 m!613713))

(declare-fun m!613757 () Bool)

(assert (=> b!640376 m!613757))

(declare-fun m!613759 () Bool)

(assert (=> b!640369 m!613759))

(declare-fun m!613761 () Bool)

(assert (=> b!640375 m!613761))

(declare-fun m!613763 () Bool)

(assert (=> b!640362 m!613763))

(declare-fun m!613765 () Bool)

(assert (=> b!640368 m!613765))

(assert (=> b!640368 m!613713))

(assert (=> b!640368 m!613713))

(declare-fun m!613767 () Bool)

(assert (=> b!640368 m!613767))

(push 1)

(assert (not b!640373))

(assert (not b!640370))

(assert (not b!640380))

(assert (not b!640367))

(assert (not b!640376))

(assert (not b!640369))

(assert (not b!640368))

(assert (not b!640363))

(assert (not start!57910))

(assert (not b!640375))

(assert (not b!640374))

(assert (not b!640362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

