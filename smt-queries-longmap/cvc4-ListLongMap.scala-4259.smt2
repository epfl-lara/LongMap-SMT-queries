; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59112 () Bool)

(assert start!59112)

(declare-fun b!652501 () Bool)

(declare-fun e!374526 () Bool)

(declare-datatypes ((SeekEntryResult!6949 0))(
  ( (MissingZero!6949 (index!30149 (_ BitVec 32))) (Found!6949 (index!30150 (_ BitVec 32))) (Intermediate!6949 (undefined!7761 Bool) (index!30151 (_ BitVec 32)) (x!58932 (_ BitVec 32))) (Undefined!6949) (MissingVacant!6949 (index!30152 (_ BitVec 32))) )
))
(declare-fun lt!303658 () SeekEntryResult!6949)

(declare-fun lt!303656 () SeekEntryResult!6949)

(assert (=> b!652501 (= e!374526 (= lt!303658 lt!303656))))

(declare-fun b!652502 () Bool)

(declare-fun e!374521 () Bool)

(declare-fun e!374513 () Bool)

(assert (=> b!652502 (= e!374521 e!374513)))

(declare-fun res!423165 () Bool)

(assert (=> b!652502 (=> res!423165 e!374513)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!303657 () (_ BitVec 64))

(declare-datatypes ((array!38612 0))(
  ( (array!38613 (arr!18509 (Array (_ BitVec 32) (_ BitVec 64))) (size!18873 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38612)

(declare-fun lt!303664 () (_ BitVec 64))

(assert (=> b!652502 (= res!423165 (or (not (= (select (arr!18509 a!2986) j!136) lt!303664)) (not (= (select (arr!18509 a!2986) j!136) lt!303657))))))

(declare-fun e!374517 () Bool)

(assert (=> b!652502 e!374517))

(declare-fun res!423172 () Bool)

(assert (=> b!652502 (=> (not res!423172) (not e!374517))))

(assert (=> b!652502 (= res!423172 (= lt!303657 (select (arr!18509 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!652502 (= lt!303657 (select (store (arr!18509 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!652503 () Bool)

(declare-fun e!374525 () Bool)

(declare-fun e!374523 () Bool)

(assert (=> b!652503 (= e!374525 e!374523)))

(declare-fun res!423164 () Bool)

(assert (=> b!652503 (=> (not res!423164) (not e!374523))))

(declare-fun lt!303669 () SeekEntryResult!6949)

(assert (=> b!652503 (= res!423164 (or (= lt!303669 (MissingZero!6949 i!1108)) (= lt!303669 (MissingVacant!6949 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38612 (_ BitVec 32)) SeekEntryResult!6949)

(assert (=> b!652503 (= lt!303669 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!652504 () Bool)

(declare-fun e!374519 () Bool)

(declare-fun lt!303668 () array!38612)

(declare-fun arrayContainsKey!0 (array!38612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652504 (= e!374519 (arrayContainsKey!0 lt!303668 (select (arr!18509 a!2986) j!136) index!984))))

(declare-fun b!652505 () Bool)

(declare-fun res!423178 () Bool)

(assert (=> b!652505 (=> (not res!423178) (not e!374523))))

(declare-datatypes ((List!12550 0))(
  ( (Nil!12547) (Cons!12546 (h!13591 (_ BitVec 64)) (t!18778 List!12550)) )
))
(declare-fun arrayNoDuplicates!0 (array!38612 (_ BitVec 32) List!12550) Bool)

(assert (=> b!652505 (= res!423178 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12547))))

(declare-fun b!652506 () Bool)

(declare-fun res!423161 () Bool)

(assert (=> b!652506 (=> (not res!423161) (not e!374525))))

(assert (=> b!652506 (= res!423161 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652507 () Bool)

(declare-fun res!423162 () Bool)

(assert (=> b!652507 (=> (not res!423162) (not e!374523))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!652507 (= res!423162 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18509 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!423166 () Bool)

(assert (=> start!59112 (=> (not res!423166) (not e!374525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59112 (= res!423166 (validMask!0 mask!3053))))

(assert (=> start!59112 e!374525))

(assert (=> start!59112 true))

(declare-fun array_inv!14305 (array!38612) Bool)

(assert (=> start!59112 (array_inv!14305 a!2986)))

(declare-fun b!652508 () Bool)

(declare-fun e!374522 () Bool)

(assert (=> b!652508 (= e!374523 e!374522)))

(declare-fun res!423173 () Bool)

(assert (=> b!652508 (=> (not res!423173) (not e!374522))))

(assert (=> b!652508 (= res!423173 (= (select (store (arr!18509 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!652508 (= lt!303668 (array!38613 (store (arr!18509 a!2986) i!1108 k!1786) (size!18873 a!2986)))))

(declare-fun b!652509 () Bool)

(declare-fun res!423174 () Bool)

(assert (=> b!652509 (=> (not res!423174) (not e!374525))))

(assert (=> b!652509 (= res!423174 (and (= (size!18873 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18873 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18873 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652510 () Bool)

(declare-fun res!423169 () Bool)

(assert (=> b!652510 (=> (not res!423169) (not e!374525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652510 (= res!423169 (validKeyInArray!0 (select (arr!18509 a!2986) j!136)))))

(declare-fun b!652511 () Bool)

(declare-datatypes ((Unit!22320 0))(
  ( (Unit!22321) )
))
(declare-fun e!374515 () Unit!22320)

(declare-fun Unit!22322 () Unit!22320)

(assert (=> b!652511 (= e!374515 Unit!22322)))

(declare-fun lt!303672 () Unit!22320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38612 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22320)

(assert (=> b!652511 (= lt!303672 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303668 (select (arr!18509 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652511 (arrayContainsKey!0 lt!303668 (select (arr!18509 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303670 () Unit!22320)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38612 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12550) Unit!22320)

(assert (=> b!652511 (= lt!303670 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12547))))

(assert (=> b!652511 (arrayNoDuplicates!0 lt!303668 #b00000000000000000000000000000000 Nil!12547)))

(declare-fun lt!303661 () Unit!22320)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38612 (_ BitVec 32) (_ BitVec 32)) Unit!22320)

(assert (=> b!652511 (= lt!303661 (lemmaNoDuplicateFromThenFromBigger!0 lt!303668 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652511 (arrayNoDuplicates!0 lt!303668 j!136 Nil!12547)))

(declare-fun lt!303659 () Unit!22320)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38612 (_ BitVec 64) (_ BitVec 32) List!12550) Unit!22320)

(assert (=> b!652511 (= lt!303659 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303668 (select (arr!18509 a!2986) j!136) j!136 Nil!12547))))

(assert (=> b!652511 false))

(declare-fun b!652512 () Bool)

(declare-fun Unit!22323 () Unit!22320)

(assert (=> b!652512 (= e!374515 Unit!22323)))

(declare-fun b!652513 () Bool)

(declare-fun e!374512 () Unit!22320)

(declare-fun Unit!22324 () Unit!22320)

(assert (=> b!652513 (= e!374512 Unit!22324)))

(declare-fun b!652514 () Bool)

(declare-fun e!374516 () Bool)

(assert (=> b!652514 (= e!374516 (or (bvsge (size!18873 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 index!984) (size!18873 a!2986)) (bvslt index!984 (size!18873 a!2986))))))

(assert (=> b!652514 (arrayNoDuplicates!0 lt!303668 index!984 Nil!12547)))

(declare-fun lt!303662 () Unit!22320)

(assert (=> b!652514 (= lt!303662 (lemmaNoDuplicateFromThenFromBigger!0 lt!303668 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652514 (arrayNoDuplicates!0 lt!303668 #b00000000000000000000000000000000 Nil!12547)))

(declare-fun lt!303671 () Unit!22320)

(assert (=> b!652514 (= lt!303671 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12547))))

(assert (=> b!652514 (arrayContainsKey!0 lt!303668 (select (arr!18509 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303673 () Unit!22320)

(assert (=> b!652514 (= lt!303673 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303668 (select (arr!18509 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!652514 e!374519))

(declare-fun res!423176 () Bool)

(assert (=> b!652514 (=> (not res!423176) (not e!374519))))

(assert (=> b!652514 (= res!423176 (arrayContainsKey!0 lt!303668 (select (arr!18509 a!2986) j!136) j!136))))

(declare-fun b!652515 () Bool)

(declare-fun e!374520 () Bool)

(declare-fun e!374514 () Bool)

(assert (=> b!652515 (= e!374520 e!374514)))

(declare-fun res!423179 () Bool)

(assert (=> b!652515 (=> (not res!423179) (not e!374514))))

(assert (=> b!652515 (= res!423179 (arrayContainsKey!0 lt!303668 (select (arr!18509 a!2986) j!136) j!136))))

(declare-fun b!652516 () Bool)

(declare-fun res!423163 () Bool)

(assert (=> b!652516 (=> (not res!423163) (not e!374523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38612 (_ BitVec 32)) Bool)

(assert (=> b!652516 (= res!423163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652517 () Bool)

(declare-fun res!423171 () Bool)

(assert (=> b!652517 (=> (not res!423171) (not e!374525))))

(assert (=> b!652517 (= res!423171 (validKeyInArray!0 k!1786))))

(declare-fun b!652518 () Bool)

(assert (=> b!652518 (= e!374513 e!374516)))

(declare-fun res!423167 () Bool)

(assert (=> b!652518 (=> res!423167 e!374516)))

(assert (=> b!652518 (= res!423167 (bvsge index!984 j!136))))

(declare-fun lt!303666 () Unit!22320)

(assert (=> b!652518 (= lt!303666 e!374515)))

(declare-fun c!75037 () Bool)

(assert (=> b!652518 (= c!75037 (bvslt j!136 index!984))))

(declare-fun b!652519 () Bool)

(declare-fun e!374518 () Bool)

(assert (=> b!652519 (= e!374522 e!374518)))

(declare-fun res!423177 () Bool)

(assert (=> b!652519 (=> (not res!423177) (not e!374518))))

(assert (=> b!652519 (= res!423177 (and (= lt!303658 (Found!6949 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18509 a!2986) index!984) (select (arr!18509 a!2986) j!136))) (not (= (select (arr!18509 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38612 (_ BitVec 32)) SeekEntryResult!6949)

(assert (=> b!652519 (= lt!303658 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18509 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652520 () Bool)

(declare-fun Unit!22325 () Unit!22320)

(assert (=> b!652520 (= e!374512 Unit!22325)))

(assert (=> b!652520 false))

(declare-fun b!652521 () Bool)

(assert (=> b!652521 (= e!374514 (arrayContainsKey!0 lt!303668 (select (arr!18509 a!2986) j!136) index!984))))

(declare-fun b!652522 () Bool)

(assert (=> b!652522 (= e!374518 (not e!374521))))

(declare-fun res!423170 () Bool)

(assert (=> b!652522 (=> res!423170 e!374521)))

(declare-fun lt!303667 () SeekEntryResult!6949)

(assert (=> b!652522 (= res!423170 (not (= lt!303667 (Found!6949 index!984))))))

(declare-fun lt!303663 () Unit!22320)

(assert (=> b!652522 (= lt!303663 e!374512)))

(declare-fun c!75038 () Bool)

(assert (=> b!652522 (= c!75038 (= lt!303667 Undefined!6949))))

(assert (=> b!652522 (= lt!303667 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303664 lt!303668 mask!3053))))

(assert (=> b!652522 e!374526))

(declare-fun res!423175 () Bool)

(assert (=> b!652522 (=> (not res!423175) (not e!374526))))

(declare-fun lt!303660 () (_ BitVec 32))

(assert (=> b!652522 (= res!423175 (= lt!303656 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303660 vacantSpotIndex!68 lt!303664 lt!303668 mask!3053)))))

(assert (=> b!652522 (= lt!303656 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303660 vacantSpotIndex!68 (select (arr!18509 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652522 (= lt!303664 (select (store (arr!18509 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!303665 () Unit!22320)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38612 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22320)

(assert (=> b!652522 (= lt!303665 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303660 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652522 (= lt!303660 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!652523 () Bool)

(assert (=> b!652523 (= e!374517 e!374520)))

(declare-fun res!423168 () Bool)

(assert (=> b!652523 (=> res!423168 e!374520)))

(assert (=> b!652523 (= res!423168 (or (not (= (select (arr!18509 a!2986) j!136) lt!303664)) (not (= (select (arr!18509 a!2986) j!136) lt!303657)) (bvsge j!136 index!984)))))

(assert (= (and start!59112 res!423166) b!652509))

(assert (= (and b!652509 res!423174) b!652510))

(assert (= (and b!652510 res!423169) b!652517))

(assert (= (and b!652517 res!423171) b!652506))

(assert (= (and b!652506 res!423161) b!652503))

(assert (= (and b!652503 res!423164) b!652516))

(assert (= (and b!652516 res!423163) b!652505))

(assert (= (and b!652505 res!423178) b!652507))

(assert (= (and b!652507 res!423162) b!652508))

(assert (= (and b!652508 res!423173) b!652519))

(assert (= (and b!652519 res!423177) b!652522))

(assert (= (and b!652522 res!423175) b!652501))

(assert (= (and b!652522 c!75038) b!652520))

(assert (= (and b!652522 (not c!75038)) b!652513))

(assert (= (and b!652522 (not res!423170)) b!652502))

(assert (= (and b!652502 res!423172) b!652523))

(assert (= (and b!652523 (not res!423168)) b!652515))

(assert (= (and b!652515 res!423179) b!652521))

(assert (= (and b!652502 (not res!423165)) b!652518))

(assert (= (and b!652518 c!75037) b!652511))

(assert (= (and b!652518 (not c!75037)) b!652512))

(assert (= (and b!652518 (not res!423167)) b!652514))

(assert (= (and b!652514 res!423176) b!652504))

(declare-fun m!625641 () Bool)

(assert (=> b!652503 m!625641))

(declare-fun m!625643 () Bool)

(assert (=> b!652507 m!625643))

(declare-fun m!625645 () Bool)

(assert (=> b!652511 m!625645))

(declare-fun m!625647 () Bool)

(assert (=> b!652511 m!625647))

(assert (=> b!652511 m!625645))

(declare-fun m!625649 () Bool)

(assert (=> b!652511 m!625649))

(assert (=> b!652511 m!625645))

(declare-fun m!625651 () Bool)

(assert (=> b!652511 m!625651))

(assert (=> b!652511 m!625645))

(declare-fun m!625653 () Bool)

(assert (=> b!652511 m!625653))

(declare-fun m!625655 () Bool)

(assert (=> b!652511 m!625655))

(declare-fun m!625657 () Bool)

(assert (=> b!652511 m!625657))

(declare-fun m!625659 () Bool)

(assert (=> b!652511 m!625659))

(declare-fun m!625661 () Bool)

(assert (=> b!652505 m!625661))

(assert (=> b!652504 m!625645))

(assert (=> b!652504 m!625645))

(declare-fun m!625663 () Bool)

(assert (=> b!652504 m!625663))

(declare-fun m!625665 () Bool)

(assert (=> b!652508 m!625665))

(declare-fun m!625667 () Bool)

(assert (=> b!652508 m!625667))

(assert (=> b!652523 m!625645))

(declare-fun m!625669 () Bool)

(assert (=> b!652516 m!625669))

(declare-fun m!625671 () Bool)

(assert (=> b!652522 m!625671))

(declare-fun m!625673 () Bool)

(assert (=> b!652522 m!625673))

(declare-fun m!625675 () Bool)

(assert (=> b!652522 m!625675))

(assert (=> b!652522 m!625645))

(assert (=> b!652522 m!625665))

(assert (=> b!652522 m!625645))

(declare-fun m!625677 () Bool)

(assert (=> b!652522 m!625677))

(declare-fun m!625679 () Bool)

(assert (=> b!652522 m!625679))

(declare-fun m!625681 () Bool)

(assert (=> b!652522 m!625681))

(assert (=> b!652502 m!625645))

(assert (=> b!652502 m!625665))

(declare-fun m!625683 () Bool)

(assert (=> b!652502 m!625683))

(assert (=> b!652510 m!625645))

(assert (=> b!652510 m!625645))

(declare-fun m!625685 () Bool)

(assert (=> b!652510 m!625685))

(declare-fun m!625687 () Bool)

(assert (=> b!652514 m!625687))

(assert (=> b!652514 m!625645))

(assert (=> b!652514 m!625645))

(declare-fun m!625689 () Bool)

(assert (=> b!652514 m!625689))

(assert (=> b!652514 m!625645))

(declare-fun m!625691 () Bool)

(assert (=> b!652514 m!625691))

(assert (=> b!652514 m!625655))

(declare-fun m!625693 () Bool)

(assert (=> b!652514 m!625693))

(assert (=> b!652514 m!625645))

(declare-fun m!625695 () Bool)

(assert (=> b!652514 m!625695))

(assert (=> b!652514 m!625659))

(assert (=> b!652515 m!625645))

(assert (=> b!652515 m!625645))

(assert (=> b!652515 m!625691))

(declare-fun m!625697 () Bool)

(assert (=> b!652517 m!625697))

(declare-fun m!625699 () Bool)

(assert (=> start!59112 m!625699))

(declare-fun m!625701 () Bool)

(assert (=> start!59112 m!625701))

(assert (=> b!652521 m!625645))

(assert (=> b!652521 m!625645))

(assert (=> b!652521 m!625663))

(declare-fun m!625703 () Bool)

(assert (=> b!652506 m!625703))

(declare-fun m!625705 () Bool)

(assert (=> b!652519 m!625705))

(assert (=> b!652519 m!625645))

(assert (=> b!652519 m!625645))

(declare-fun m!625707 () Bool)

(assert (=> b!652519 m!625707))

(push 1)

(assert (not b!652503))

(assert (not b!652506))

(assert (not b!652515))

(assert (not b!652504))

(assert (not b!652521))

(assert (not start!59112))

(assert (not b!652516))

(assert (not b!652519))

(assert (not b!652505))

(assert (not b!652522))

(assert (not b!652517))

(assert (not b!652514))

(assert (not b!652510))

(assert (not b!652511))

(check-sat)

(pop 1)

(push 1)

(check-sat)

