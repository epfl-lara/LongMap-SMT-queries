; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59358 () Bool)

(assert start!59358)

(declare-fun b!655461 () Bool)

(declare-datatypes ((Unit!22544 0))(
  ( (Unit!22545) )
))
(declare-fun e!376433 () Unit!22544)

(declare-fun Unit!22546 () Unit!22544)

(assert (=> b!655461 (= e!376433 Unit!22546)))

(declare-fun b!655462 () Bool)

(declare-fun e!376429 () Unit!22544)

(declare-fun Unit!22547 () Unit!22544)

(assert (=> b!655462 (= e!376429 Unit!22547)))

(declare-fun b!655463 () Bool)

(declare-fun e!376430 () Unit!22544)

(declare-fun Unit!22548 () Unit!22544)

(assert (=> b!655463 (= e!376430 Unit!22548)))

(declare-fun b!655464 () Bool)

(declare-fun res!425197 () Bool)

(declare-fun e!376434 () Bool)

(assert (=> b!655464 (=> (not res!425197) (not e!376434))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38678 0))(
  ( (array!38679 (arr!18539 (Array (_ BitVec 32) (_ BitVec 64))) (size!18903 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38678)

(assert (=> b!655464 (= res!425197 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18539 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!655465 () Bool)

(declare-fun res!425195 () Bool)

(assert (=> b!655465 (=> (not res!425195) (not e!376434))))

(declare-datatypes ((List!12580 0))(
  ( (Nil!12577) (Cons!12576 (h!13621 (_ BitVec 64)) (t!18808 List!12580)) )
))
(declare-fun arrayNoDuplicates!0 (array!38678 (_ BitVec 32) List!12580) Bool)

(assert (=> b!655465 (= res!425195 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12577))))

(declare-fun b!655466 () Bool)

(declare-fun res!425191 () Bool)

(declare-fun e!376422 () Bool)

(assert (=> b!655466 (=> (not res!425191) (not e!376422))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!655466 (= res!425191 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!655467 () Bool)

(declare-fun res!425203 () Bool)

(assert (=> b!655467 (=> (not res!425203) (not e!376434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38678 (_ BitVec 32)) Bool)

(assert (=> b!655467 (= res!425203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!655468 () Bool)

(declare-fun Unit!22549 () Unit!22544)

(assert (=> b!655468 (= e!376430 Unit!22549)))

(assert (=> b!655468 false))

(declare-fun b!655469 () Bool)

(declare-fun res!425201 () Bool)

(assert (=> b!655469 (=> (not res!425201) (not e!376422))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!655469 (= res!425201 (validKeyInArray!0 (select (arr!18539 a!2986) j!136)))))

(declare-fun b!655470 () Bool)

(declare-fun res!425193 () Bool)

(assert (=> b!655470 (= res!425193 (bvsge j!136 index!984))))

(declare-fun e!376423 () Bool)

(assert (=> b!655470 (=> res!425193 e!376423)))

(declare-fun e!376421 () Bool)

(assert (=> b!655470 (= e!376421 e!376423)))

(declare-fun e!376427 () Bool)

(declare-fun lt!305720 () array!38678)

(declare-fun b!655471 () Bool)

(assert (=> b!655471 (= e!376427 (arrayContainsKey!0 lt!305720 (select (arr!18539 a!2986) j!136) index!984))))

(declare-fun b!655472 () Bool)

(declare-fun Unit!22550 () Unit!22544)

(assert (=> b!655472 (= e!376433 Unit!22550)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun res!425192 () Bool)

(assert (=> b!655472 (= res!425192 (= (select (store (arr!18539 a!2986) i!1108 k!1786) index!984) (select (arr!18539 a!2986) j!136)))))

(assert (=> b!655472 (=> (not res!425192) (not e!376421))))

(assert (=> b!655472 e!376421))

(declare-fun c!75504 () Bool)

(assert (=> b!655472 (= c!75504 (bvslt j!136 index!984))))

(declare-fun lt!305722 () Unit!22544)

(assert (=> b!655472 (= lt!305722 e!376429)))

(declare-fun c!75506 () Bool)

(assert (=> b!655472 (= c!75506 (bvslt index!984 j!136))))

(declare-fun lt!305708 () Unit!22544)

(declare-fun e!376424 () Unit!22544)

(assert (=> b!655472 (= lt!305708 e!376424)))

(assert (=> b!655472 false))

(declare-fun b!655473 () Bool)

(declare-fun res!425198 () Bool)

(assert (=> b!655473 (=> (not res!425198) (not e!376422))))

(assert (=> b!655473 (= res!425198 (and (= (size!18903 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18903 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18903 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!655474 () Bool)

(declare-fun res!425202 () Bool)

(assert (=> b!655474 (=> (not res!425202) (not e!376422))))

(assert (=> b!655474 (= res!425202 (validKeyInArray!0 k!1786))))

(declare-fun b!655475 () Bool)

(declare-fun e!376431 () Bool)

(declare-fun e!376425 () Bool)

(assert (=> b!655475 (= e!376431 e!376425)))

(declare-fun res!425200 () Bool)

(assert (=> b!655475 (=> (not res!425200) (not e!376425))))

(declare-datatypes ((SeekEntryResult!6979 0))(
  ( (MissingZero!6979 (index!30275 (_ BitVec 32))) (Found!6979 (index!30276 (_ BitVec 32))) (Intermediate!6979 (undefined!7791 Bool) (index!30277 (_ BitVec 32)) (x!59060 (_ BitVec 32))) (Undefined!6979) (MissingVacant!6979 (index!30278 (_ BitVec 32))) )
))
(declare-fun lt!305710 () SeekEntryResult!6979)

(assert (=> b!655475 (= res!425200 (and (= lt!305710 (Found!6979 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18539 a!2986) index!984) (select (arr!18539 a!2986) j!136))) (not (= (select (arr!18539 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38678 (_ BitVec 32)) SeekEntryResult!6979)

(assert (=> b!655475 (= lt!305710 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18539 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!655476 () Bool)

(assert (=> b!655476 (= e!376422 e!376434)))

(declare-fun res!425196 () Bool)

(assert (=> b!655476 (=> (not res!425196) (not e!376434))))

(declare-fun lt!305719 () SeekEntryResult!6979)

(assert (=> b!655476 (= res!425196 (or (= lt!305719 (MissingZero!6979 i!1108)) (= lt!305719 (MissingVacant!6979 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38678 (_ BitVec 32)) SeekEntryResult!6979)

(assert (=> b!655476 (= lt!305719 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!655477 () Bool)

(assert (=> b!655477 (= e!376434 e!376431)))

(declare-fun res!425199 () Bool)

(assert (=> b!655477 (=> (not res!425199) (not e!376431))))

(assert (=> b!655477 (= res!425199 (= (select (store (arr!18539 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!655477 (= lt!305720 (array!38679 (store (arr!18539 a!2986) i!1108 k!1786) (size!18903 a!2986)))))

(declare-fun b!655478 () Bool)

(assert (=> b!655478 false))

(declare-fun lt!305711 () Unit!22544)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38678 (_ BitVec 64) (_ BitVec 32) List!12580) Unit!22544)

(assert (=> b!655478 (= lt!305711 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305720 (select (arr!18539 a!2986) j!136) j!136 Nil!12577))))

(assert (=> b!655478 (arrayNoDuplicates!0 lt!305720 j!136 Nil!12577)))

(declare-fun lt!305712 () Unit!22544)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38678 (_ BitVec 32) (_ BitVec 32)) Unit!22544)

(assert (=> b!655478 (= lt!305712 (lemmaNoDuplicateFromThenFromBigger!0 lt!305720 #b00000000000000000000000000000000 j!136))))

(assert (=> b!655478 (arrayNoDuplicates!0 lt!305720 #b00000000000000000000000000000000 Nil!12577)))

(declare-fun lt!305705 () Unit!22544)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38678 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12580) Unit!22544)

(assert (=> b!655478 (= lt!305705 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12577))))

(assert (=> b!655478 (arrayContainsKey!0 lt!305720 (select (arr!18539 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!305716 () Unit!22544)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38678 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22544)

(assert (=> b!655478 (= lt!305716 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305720 (select (arr!18539 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!22551 () Unit!22544)

(assert (=> b!655478 (= e!376429 Unit!22551)))

(declare-fun b!655479 () Bool)

(declare-fun res!425190 () Bool)

(assert (=> b!655479 (= res!425190 (arrayContainsKey!0 lt!305720 (select (arr!18539 a!2986) j!136) j!136))))

(assert (=> b!655479 (=> (not res!425190) (not e!376427))))

(assert (=> b!655479 (= e!376423 e!376427)))

(declare-fun b!655480 () Bool)

(assert (=> b!655480 (= e!376425 (not true))))

(declare-fun lt!305714 () Unit!22544)

(assert (=> b!655480 (= lt!305714 e!376433)))

(declare-fun c!75503 () Bool)

(declare-fun lt!305718 () SeekEntryResult!6979)

(assert (=> b!655480 (= c!75503 (= lt!305718 (Found!6979 index!984)))))

(declare-fun lt!305704 () Unit!22544)

(assert (=> b!655480 (= lt!305704 e!376430)))

(declare-fun c!75505 () Bool)

(assert (=> b!655480 (= c!75505 (= lt!305718 Undefined!6979))))

(declare-fun lt!305706 () (_ BitVec 64))

(assert (=> b!655480 (= lt!305718 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!305706 lt!305720 mask!3053))))

(declare-fun e!376428 () Bool)

(assert (=> b!655480 e!376428))

(declare-fun res!425189 () Bool)

(assert (=> b!655480 (=> (not res!425189) (not e!376428))))

(declare-fun lt!305703 () (_ BitVec 32))

(declare-fun lt!305715 () SeekEntryResult!6979)

(assert (=> b!655480 (= res!425189 (= lt!305715 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305703 vacantSpotIndex!68 lt!305706 lt!305720 mask!3053)))))

(assert (=> b!655480 (= lt!305715 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!305703 vacantSpotIndex!68 (select (arr!18539 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!655480 (= lt!305706 (select (store (arr!18539 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!305721 () Unit!22544)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38678 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22544)

(assert (=> b!655480 (= lt!305721 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!305703 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!655480 (= lt!305703 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!655481 () Bool)

(assert (=> b!655481 (= e!376428 (= lt!305710 lt!305715))))

(declare-fun b!655482 () Bool)

(declare-fun Unit!22552 () Unit!22544)

(assert (=> b!655482 (= e!376424 Unit!22552)))

(declare-fun b!655483 () Bool)

(assert (=> b!655483 false))

(declare-fun lt!305707 () Unit!22544)

(assert (=> b!655483 (= lt!305707 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!305720 (select (arr!18539 a!2986) j!136) index!984 Nil!12577))))

(assert (=> b!655483 (arrayNoDuplicates!0 lt!305720 index!984 Nil!12577)))

(declare-fun lt!305717 () Unit!22544)

(assert (=> b!655483 (= lt!305717 (lemmaNoDuplicateFromThenFromBigger!0 lt!305720 #b00000000000000000000000000000000 index!984))))

(assert (=> b!655483 (arrayNoDuplicates!0 lt!305720 #b00000000000000000000000000000000 Nil!12577)))

(declare-fun lt!305709 () Unit!22544)

(assert (=> b!655483 (= lt!305709 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12577))))

(assert (=> b!655483 (arrayContainsKey!0 lt!305720 (select (arr!18539 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!305713 () Unit!22544)

(assert (=> b!655483 (= lt!305713 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!305720 (select (arr!18539 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!376432 () Bool)

(assert (=> b!655483 e!376432))

(declare-fun res!425194 () Bool)

(assert (=> b!655483 (=> (not res!425194) (not e!376432))))

(assert (=> b!655483 (= res!425194 (arrayContainsKey!0 lt!305720 (select (arr!18539 a!2986) j!136) j!136))))

(declare-fun Unit!22553 () Unit!22544)

(assert (=> b!655483 (= e!376424 Unit!22553)))

(declare-fun res!425204 () Bool)

(assert (=> start!59358 (=> (not res!425204) (not e!376422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59358 (= res!425204 (validMask!0 mask!3053))))

(assert (=> start!59358 e!376422))

(assert (=> start!59358 true))

(declare-fun array_inv!14335 (array!38678) Bool)

(assert (=> start!59358 (array_inv!14335 a!2986)))

(declare-fun b!655484 () Bool)

(assert (=> b!655484 (= e!376432 (arrayContainsKey!0 lt!305720 (select (arr!18539 a!2986) j!136) index!984))))

(assert (= (and start!59358 res!425204) b!655473))

(assert (= (and b!655473 res!425198) b!655469))

(assert (= (and b!655469 res!425201) b!655474))

(assert (= (and b!655474 res!425202) b!655466))

(assert (= (and b!655466 res!425191) b!655476))

(assert (= (and b!655476 res!425196) b!655467))

(assert (= (and b!655467 res!425203) b!655465))

(assert (= (and b!655465 res!425195) b!655464))

(assert (= (and b!655464 res!425197) b!655477))

(assert (= (and b!655477 res!425199) b!655475))

(assert (= (and b!655475 res!425200) b!655480))

(assert (= (and b!655480 res!425189) b!655481))

(assert (= (and b!655480 c!75505) b!655468))

(assert (= (and b!655480 (not c!75505)) b!655463))

(assert (= (and b!655480 c!75503) b!655472))

(assert (= (and b!655480 (not c!75503)) b!655461))

(assert (= (and b!655472 res!425192) b!655470))

(assert (= (and b!655470 (not res!425193)) b!655479))

(assert (= (and b!655479 res!425190) b!655471))

(assert (= (and b!655472 c!75504) b!655478))

(assert (= (and b!655472 (not c!75504)) b!655462))

(assert (= (and b!655472 c!75506) b!655483))

(assert (= (and b!655472 (not c!75506)) b!655482))

(assert (= (and b!655483 res!425194) b!655484))

(declare-fun m!628537 () Bool)

(assert (=> b!655471 m!628537))

(assert (=> b!655471 m!628537))

(declare-fun m!628539 () Bool)

(assert (=> b!655471 m!628539))

(assert (=> b!655484 m!628537))

(assert (=> b!655484 m!628537))

(assert (=> b!655484 m!628539))

(declare-fun m!628541 () Bool)

(assert (=> b!655476 m!628541))

(declare-fun m!628543 () Bool)

(assert (=> b!655475 m!628543))

(assert (=> b!655475 m!628537))

(assert (=> b!655475 m!628537))

(declare-fun m!628545 () Bool)

(assert (=> b!655475 m!628545))

(declare-fun m!628547 () Bool)

(assert (=> b!655472 m!628547))

(declare-fun m!628549 () Bool)

(assert (=> b!655472 m!628549))

(assert (=> b!655472 m!628537))

(declare-fun m!628551 () Bool)

(assert (=> b!655466 m!628551))

(declare-fun m!628553 () Bool)

(assert (=> b!655478 m!628553))

(assert (=> b!655478 m!628537))

(declare-fun m!628555 () Bool)

(assert (=> b!655478 m!628555))

(declare-fun m!628557 () Bool)

(assert (=> b!655478 m!628557))

(assert (=> b!655478 m!628537))

(declare-fun m!628559 () Bool)

(assert (=> b!655478 m!628559))

(assert (=> b!655478 m!628537))

(declare-fun m!628561 () Bool)

(assert (=> b!655478 m!628561))

(assert (=> b!655478 m!628537))

(declare-fun m!628563 () Bool)

(assert (=> b!655478 m!628563))

(declare-fun m!628565 () Bool)

(assert (=> b!655478 m!628565))

(declare-fun m!628567 () Bool)

(assert (=> b!655474 m!628567))

(declare-fun m!628569 () Bool)

(assert (=> b!655480 m!628569))

(declare-fun m!628571 () Bool)

(assert (=> b!655480 m!628571))

(assert (=> b!655480 m!628547))

(declare-fun m!628573 () Bool)

(assert (=> b!655480 m!628573))

(assert (=> b!655480 m!628537))

(declare-fun m!628575 () Bool)

(assert (=> b!655480 m!628575))

(assert (=> b!655480 m!628537))

(declare-fun m!628577 () Bool)

(assert (=> b!655480 m!628577))

(declare-fun m!628579 () Bool)

(assert (=> b!655480 m!628579))

(declare-fun m!628581 () Bool)

(assert (=> b!655467 m!628581))

(assert (=> b!655479 m!628537))

(assert (=> b!655479 m!628537))

(declare-fun m!628583 () Bool)

(assert (=> b!655479 m!628583))

(declare-fun m!628585 () Bool)

(assert (=> b!655465 m!628585))

(assert (=> b!655477 m!628547))

(declare-fun m!628587 () Bool)

(assert (=> b!655477 m!628587))

(assert (=> b!655483 m!628537))

(declare-fun m!628589 () Bool)

(assert (=> b!655483 m!628589))

(assert (=> b!655483 m!628537))

(declare-fun m!628591 () Bool)

(assert (=> b!655483 m!628591))

(assert (=> b!655483 m!628537))

(assert (=> b!655483 m!628555))

(declare-fun m!628593 () Bool)

(assert (=> b!655483 m!628593))

(assert (=> b!655483 m!628537))

(declare-fun m!628595 () Bool)

(assert (=> b!655483 m!628595))

(assert (=> b!655483 m!628565))

(assert (=> b!655483 m!628537))

(assert (=> b!655483 m!628583))

(declare-fun m!628597 () Bool)

(assert (=> b!655483 m!628597))

(assert (=> b!655469 m!628537))

(assert (=> b!655469 m!628537))

(declare-fun m!628599 () Bool)

(assert (=> b!655469 m!628599))

(declare-fun m!628601 () Bool)

(assert (=> start!59358 m!628601))

(declare-fun m!628603 () Bool)

(assert (=> start!59358 m!628603))

(declare-fun m!628605 () Bool)

(assert (=> b!655464 m!628605))

(push 1)

