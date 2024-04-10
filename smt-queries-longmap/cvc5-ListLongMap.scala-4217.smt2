; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57818 () Bool)

(assert start!57818)

(declare-fun b!639590 () Bool)

(declare-fun res!414131 () Bool)

(declare-fun e!366064 () Bool)

(assert (=> b!639590 (=> (not res!414131) (not e!366064))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639590 (= res!414131 (validKeyInArray!0 k!1786))))

(declare-fun b!639591 () Bool)

(declare-fun res!414119 () Bool)

(assert (=> b!639591 (=> (not res!414119) (not e!366064))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!38320 0))(
  ( (array!38321 (arr!18381 (Array (_ BitVec 32) (_ BitVec 64))) (size!18745 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38320)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!639591 (= res!414119 (and (= (size!18745 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18745 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18745 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639592 () Bool)

(declare-fun e!366060 () Bool)

(declare-fun e!366062 () Bool)

(assert (=> b!639592 (= e!366060 e!366062)))

(declare-fun res!414128 () Bool)

(assert (=> b!639592 (=> (not res!414128) (not e!366062))))

(declare-fun lt!295909 () array!38320)

(declare-fun arrayContainsKey!0 (array!38320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639592 (= res!414128 (arrayContainsKey!0 lt!295909 (select (arr!18381 a!2986) j!136) j!136))))

(declare-fun b!639593 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!639593 (= e!366062 (arrayContainsKey!0 lt!295909 (select (arr!18381 a!2986) j!136) index!984))))

(declare-fun b!639594 () Bool)

(declare-fun e!366058 () Bool)

(assert (=> b!639594 (= e!366058 e!366060)))

(declare-fun res!414126 () Bool)

(assert (=> b!639594 (=> res!414126 e!366060)))

(declare-fun lt!295912 () (_ BitVec 64))

(declare-fun lt!295917 () (_ BitVec 64))

(assert (=> b!639594 (= res!414126 (or (not (= (select (arr!18381 a!2986) j!136) lt!295912)) (not (= (select (arr!18381 a!2986) j!136) lt!295917)) (bvsge j!136 index!984)))))

(declare-fun b!639595 () Bool)

(declare-fun e!366057 () Bool)

(declare-fun e!366059 () Bool)

(assert (=> b!639595 (= e!366057 e!366059)))

(declare-fun res!414129 () Bool)

(assert (=> b!639595 (=> res!414129 e!366059)))

(assert (=> b!639595 (= res!414129 (or (not (= (select (arr!18381 a!2986) j!136) lt!295912)) (not (= (select (arr!18381 a!2986) j!136) lt!295917)) (bvsge j!136 index!984)))))

(assert (=> b!639595 e!366058))

(declare-fun res!414118 () Bool)

(assert (=> b!639595 (=> (not res!414118) (not e!366058))))

(assert (=> b!639595 (= res!414118 (= lt!295917 (select (arr!18381 a!2986) j!136)))))

(assert (=> b!639595 (= lt!295917 (select (store (arr!18381 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!639596 () Bool)

(declare-fun e!366061 () Bool)

(declare-fun e!366063 () Bool)

(assert (=> b!639596 (= e!366061 e!366063)))

(declare-fun res!414122 () Bool)

(assert (=> b!639596 (=> (not res!414122) (not e!366063))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!639596 (= res!414122 (= (select (store (arr!18381 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639596 (= lt!295909 (array!38321 (store (arr!18381 a!2986) i!1108 k!1786) (size!18745 a!2986)))))

(declare-fun b!639597 () Bool)

(declare-fun res!414121 () Bool)

(assert (=> b!639597 (=> (not res!414121) (not e!366061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38320 (_ BitVec 32)) Bool)

(assert (=> b!639597 (= res!414121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639598 () Bool)

(declare-fun res!414127 () Bool)

(assert (=> b!639598 (=> (not res!414127) (not e!366061))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!639598 (= res!414127 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18381 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639599 () Bool)

(declare-fun e!366065 () Bool)

(assert (=> b!639599 (= e!366065 (not e!366057))))

(declare-fun res!414132 () Bool)

(assert (=> b!639599 (=> res!414132 e!366057)))

(declare-datatypes ((SeekEntryResult!6821 0))(
  ( (MissingZero!6821 (index!29601 (_ BitVec 32))) (Found!6821 (index!29602 (_ BitVec 32))) (Intermediate!6821 (undefined!7633 Bool) (index!29603 (_ BitVec 32)) (x!58360 (_ BitVec 32))) (Undefined!6821) (MissingVacant!6821 (index!29604 (_ BitVec 32))) )
))
(declare-fun lt!295911 () SeekEntryResult!6821)

(assert (=> b!639599 (= res!414132 (not (= lt!295911 (Found!6821 index!984))))))

(declare-datatypes ((Unit!21618 0))(
  ( (Unit!21619) )
))
(declare-fun lt!295916 () Unit!21618)

(declare-fun e!366055 () Unit!21618)

(assert (=> b!639599 (= lt!295916 e!366055)))

(declare-fun c!73103 () Bool)

(assert (=> b!639599 (= c!73103 (= lt!295911 Undefined!6821))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38320 (_ BitVec 32)) SeekEntryResult!6821)

(assert (=> b!639599 (= lt!295911 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295912 lt!295909 mask!3053))))

(declare-fun e!366056 () Bool)

(assert (=> b!639599 e!366056))

(declare-fun res!414120 () Bool)

(assert (=> b!639599 (=> (not res!414120) (not e!366056))))

(declare-fun lt!295918 () (_ BitVec 32))

(declare-fun lt!295910 () SeekEntryResult!6821)

(assert (=> b!639599 (= res!414120 (= lt!295910 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295918 vacantSpotIndex!68 lt!295912 lt!295909 mask!3053)))))

(assert (=> b!639599 (= lt!295910 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295918 vacantSpotIndex!68 (select (arr!18381 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639599 (= lt!295912 (select (store (arr!18381 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295908 () Unit!21618)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38320 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21618)

(assert (=> b!639599 (= lt!295908 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295918 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639599 (= lt!295918 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639600 () Bool)

(assert (=> b!639600 (= e!366063 e!366065)))

(declare-fun res!414130 () Bool)

(assert (=> b!639600 (=> (not res!414130) (not e!366065))))

(declare-fun lt!295914 () SeekEntryResult!6821)

(assert (=> b!639600 (= res!414130 (and (= lt!295914 (Found!6821 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18381 a!2986) index!984) (select (arr!18381 a!2986) j!136))) (not (= (select (arr!18381 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!639600 (= lt!295914 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18381 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639601 () Bool)

(assert (=> b!639601 (= e!366064 e!366061)))

(declare-fun res!414123 () Bool)

(assert (=> b!639601 (=> (not res!414123) (not e!366061))))

(declare-fun lt!295913 () SeekEntryResult!6821)

(assert (=> b!639601 (= res!414123 (or (= lt!295913 (MissingZero!6821 i!1108)) (= lt!295913 (MissingVacant!6821 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38320 (_ BitVec 32)) SeekEntryResult!6821)

(assert (=> b!639601 (= lt!295913 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!639602 () Bool)

(declare-fun res!414124 () Bool)

(assert (=> b!639602 (=> (not res!414124) (not e!366064))))

(assert (=> b!639602 (= res!414124 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639603 () Bool)

(declare-fun Unit!21620 () Unit!21618)

(assert (=> b!639603 (= e!366055 Unit!21620)))

(declare-fun res!414133 () Bool)

(assert (=> start!57818 (=> (not res!414133) (not e!366064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57818 (= res!414133 (validMask!0 mask!3053))))

(assert (=> start!57818 e!366064))

(assert (=> start!57818 true))

(declare-fun array_inv!14177 (array!38320) Bool)

(assert (=> start!57818 (array_inv!14177 a!2986)))

(declare-fun b!639604 () Bool)

(declare-fun res!414125 () Bool)

(assert (=> b!639604 (=> (not res!414125) (not e!366061))))

(declare-datatypes ((List!12422 0))(
  ( (Nil!12419) (Cons!12418 (h!13463 (_ BitVec 64)) (t!18650 List!12422)) )
))
(declare-fun arrayNoDuplicates!0 (array!38320 (_ BitVec 32) List!12422) Bool)

(assert (=> b!639604 (= res!414125 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12419))))

(declare-fun b!639605 () Bool)

(assert (=> b!639605 (= e!366056 (= lt!295914 lt!295910))))

(declare-fun b!639606 () Bool)

(declare-fun Unit!21621 () Unit!21618)

(assert (=> b!639606 (= e!366055 Unit!21621)))

(assert (=> b!639606 false))

(declare-fun b!639607 () Bool)

(declare-fun res!414134 () Bool)

(assert (=> b!639607 (=> (not res!414134) (not e!366064))))

(assert (=> b!639607 (= res!414134 (validKeyInArray!0 (select (arr!18381 a!2986) j!136)))))

(declare-fun b!639608 () Bool)

(assert (=> b!639608 (= e!366059 true)))

(assert (=> b!639608 (arrayNoDuplicates!0 lt!295909 #b00000000000000000000000000000000 Nil!12419)))

(declare-fun lt!295915 () Unit!21618)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38320 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12422) Unit!21618)

(assert (=> b!639608 (= lt!295915 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12419))))

(assert (=> b!639608 (arrayContainsKey!0 lt!295909 (select (arr!18381 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295907 () Unit!21618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38320 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21618)

(assert (=> b!639608 (= lt!295907 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295909 (select (arr!18381 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (= (and start!57818 res!414133) b!639591))

(assert (= (and b!639591 res!414119) b!639607))

(assert (= (and b!639607 res!414134) b!639590))

(assert (= (and b!639590 res!414131) b!639602))

(assert (= (and b!639602 res!414124) b!639601))

(assert (= (and b!639601 res!414123) b!639597))

(assert (= (and b!639597 res!414121) b!639604))

(assert (= (and b!639604 res!414125) b!639598))

(assert (= (and b!639598 res!414127) b!639596))

(assert (= (and b!639596 res!414122) b!639600))

(assert (= (and b!639600 res!414130) b!639599))

(assert (= (and b!639599 res!414120) b!639605))

(assert (= (and b!639599 c!73103) b!639606))

(assert (= (and b!639599 (not c!73103)) b!639603))

(assert (= (and b!639599 (not res!414132)) b!639595))

(assert (= (and b!639595 res!414118) b!639594))

(assert (= (and b!639594 (not res!414126)) b!639592))

(assert (= (and b!639592 res!414128) b!639593))

(assert (= (and b!639595 (not res!414129)) b!639608))

(declare-fun m!613445 () Bool)

(assert (=> b!639601 m!613445))

(declare-fun m!613447 () Bool)

(assert (=> b!639608 m!613447))

(assert (=> b!639608 m!613447))

(declare-fun m!613449 () Bool)

(assert (=> b!639608 m!613449))

(assert (=> b!639608 m!613447))

(declare-fun m!613451 () Bool)

(assert (=> b!639608 m!613451))

(declare-fun m!613453 () Bool)

(assert (=> b!639608 m!613453))

(declare-fun m!613455 () Bool)

(assert (=> b!639608 m!613455))

(declare-fun m!613457 () Bool)

(assert (=> b!639599 m!613457))

(declare-fun m!613459 () Bool)

(assert (=> b!639599 m!613459))

(assert (=> b!639599 m!613447))

(declare-fun m!613461 () Bool)

(assert (=> b!639599 m!613461))

(declare-fun m!613463 () Bool)

(assert (=> b!639599 m!613463))

(declare-fun m!613465 () Bool)

(assert (=> b!639599 m!613465))

(declare-fun m!613467 () Bool)

(assert (=> b!639599 m!613467))

(assert (=> b!639599 m!613447))

(declare-fun m!613469 () Bool)

(assert (=> b!639599 m!613469))

(declare-fun m!613471 () Bool)

(assert (=> b!639598 m!613471))

(assert (=> b!639593 m!613447))

(assert (=> b!639593 m!613447))

(declare-fun m!613473 () Bool)

(assert (=> b!639593 m!613473))

(declare-fun m!613475 () Bool)

(assert (=> b!639600 m!613475))

(assert (=> b!639600 m!613447))

(assert (=> b!639600 m!613447))

(declare-fun m!613477 () Bool)

(assert (=> b!639600 m!613477))

(assert (=> b!639594 m!613447))

(assert (=> b!639607 m!613447))

(assert (=> b!639607 m!613447))

(declare-fun m!613479 () Bool)

(assert (=> b!639607 m!613479))

(declare-fun m!613481 () Bool)

(assert (=> b!639602 m!613481))

(declare-fun m!613483 () Bool)

(assert (=> start!57818 m!613483))

(declare-fun m!613485 () Bool)

(assert (=> start!57818 m!613485))

(declare-fun m!613487 () Bool)

(assert (=> b!639604 m!613487))

(assert (=> b!639595 m!613447))

(assert (=> b!639595 m!613459))

(declare-fun m!613489 () Bool)

(assert (=> b!639595 m!613489))

(declare-fun m!613491 () Bool)

(assert (=> b!639597 m!613491))

(declare-fun m!613493 () Bool)

(assert (=> b!639590 m!613493))

(assert (=> b!639592 m!613447))

(assert (=> b!639592 m!613447))

(declare-fun m!613495 () Bool)

(assert (=> b!639592 m!613495))

(assert (=> b!639596 m!613459))

(declare-fun m!613497 () Bool)

(assert (=> b!639596 m!613497))

(push 1)

