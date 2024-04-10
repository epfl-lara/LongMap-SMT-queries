; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54152 () Bool)

(assert start!54152)

(declare-fun b!591486 () Bool)

(declare-fun e!337731 () Bool)

(declare-datatypes ((SeekEntryResult!6151 0))(
  ( (MissingZero!6151 (index!26840 (_ BitVec 32))) (Found!6151 (index!26841 (_ BitVec 32))) (Intermediate!6151 (undefined!6963 Bool) (index!26842 (_ BitVec 32)) (x!55631 (_ BitVec 32))) (Undefined!6151) (MissingVacant!6151 (index!26843 (_ BitVec 32))) )
))
(declare-fun lt!268393 () SeekEntryResult!6151)

(declare-fun lt!268396 () SeekEntryResult!6151)

(assert (=> b!591486 (= e!337731 (= lt!268393 lt!268396))))

(declare-fun b!591487 () Bool)

(declare-fun e!337729 () Bool)

(declare-fun e!337736 () Bool)

(assert (=> b!591487 (= e!337729 e!337736)))

(declare-fun res!378422 () Bool)

(assert (=> b!591487 (=> (not res!378422) (not e!337736))))

(declare-fun lt!268398 () SeekEntryResult!6151)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!591487 (= res!378422 (or (= lt!268398 (MissingZero!6151 i!1108)) (= lt!268398 (MissingVacant!6151 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36882 0))(
  ( (array!36883 (arr!17711 (Array (_ BitVec 32) (_ BitVec 64))) (size!18075 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36882)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36882 (_ BitVec 32)) SeekEntryResult!6151)

(assert (=> b!591487 (= lt!268398 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!268400 () array!36882)

(declare-fun b!591488 () Bool)

(declare-fun e!337734 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!36882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!591488 (= e!337734 (arrayContainsKey!0 lt!268400 (select (arr!17711 a!2986) j!136) index!984))))

(declare-fun b!591489 () Bool)

(declare-fun e!337733 () Bool)

(assert (=> b!591489 (= e!337733 true)))

(declare-fun e!337728 () Bool)

(assert (=> b!591489 e!337728))

(declare-fun res!378427 () Bool)

(assert (=> b!591489 (=> (not res!378427) (not e!337728))))

(declare-fun lt!268401 () (_ BitVec 64))

(assert (=> b!591489 (= res!378427 (= lt!268401 (select (arr!17711 a!2986) j!136)))))

(assert (=> b!591489 (= lt!268401 (select (store (arr!17711 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!591490 () Bool)

(declare-fun res!378435 () Bool)

(assert (=> b!591490 (=> (not res!378435) (not e!337729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!591490 (= res!378435 (validKeyInArray!0 k!1786))))

(declare-fun b!591491 () Bool)

(declare-fun e!337727 () Bool)

(assert (=> b!591491 (= e!337727 (not e!337733))))

(declare-fun res!378437 () Bool)

(assert (=> b!591491 (=> res!378437 e!337733)))

(declare-fun lt!268394 () SeekEntryResult!6151)

(assert (=> b!591491 (= res!378437 (not (= lt!268394 (Found!6151 index!984))))))

(declare-datatypes ((Unit!18522 0))(
  ( (Unit!18523) )
))
(declare-fun lt!268399 () Unit!18522)

(declare-fun e!337737 () Unit!18522)

(assert (=> b!591491 (= lt!268399 e!337737)))

(declare-fun c!66899 () Bool)

(assert (=> b!591491 (= c!66899 (= lt!268394 Undefined!6151))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!268402 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36882 (_ BitVec 32)) SeekEntryResult!6151)

(assert (=> b!591491 (= lt!268394 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268402 lt!268400 mask!3053))))

(assert (=> b!591491 e!337731))

(declare-fun res!378423 () Bool)

(assert (=> b!591491 (=> (not res!378423) (not e!337731))))

(declare-fun lt!268395 () (_ BitVec 32))

(assert (=> b!591491 (= res!378423 (= lt!268396 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268395 vacantSpotIndex!68 lt!268402 lt!268400 mask!3053)))))

(assert (=> b!591491 (= lt!268396 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268395 vacantSpotIndex!68 (select (arr!17711 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!591491 (= lt!268402 (select (store (arr!17711 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268397 () Unit!18522)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36882 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18522)

(assert (=> b!591491 (= lt!268397 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268395 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!591491 (= lt!268395 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!591492 () Bool)

(declare-fun res!378425 () Bool)

(assert (=> b!591492 (=> (not res!378425) (not e!337736))))

(declare-datatypes ((List!11752 0))(
  ( (Nil!11749) (Cons!11748 (h!12793 (_ BitVec 64)) (t!17980 List!11752)) )
))
(declare-fun arrayNoDuplicates!0 (array!36882 (_ BitVec 32) List!11752) Bool)

(assert (=> b!591492 (= res!378425 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11749))))

(declare-fun b!591493 () Bool)

(declare-fun e!337730 () Bool)

(assert (=> b!591493 (= e!337730 e!337734)))

(declare-fun res!378426 () Bool)

(assert (=> b!591493 (=> (not res!378426) (not e!337734))))

(assert (=> b!591493 (= res!378426 (arrayContainsKey!0 lt!268400 (select (arr!17711 a!2986) j!136) j!136))))

(declare-fun res!378430 () Bool)

(assert (=> start!54152 (=> (not res!378430) (not e!337729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54152 (= res!378430 (validMask!0 mask!3053))))

(assert (=> start!54152 e!337729))

(assert (=> start!54152 true))

(declare-fun array_inv!13507 (array!36882) Bool)

(assert (=> start!54152 (array_inv!13507 a!2986)))

(declare-fun b!591494 () Bool)

(declare-fun e!337732 () Bool)

(assert (=> b!591494 (= e!337736 e!337732)))

(declare-fun res!378424 () Bool)

(assert (=> b!591494 (=> (not res!378424) (not e!337732))))

(assert (=> b!591494 (= res!378424 (= (select (store (arr!17711 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591494 (= lt!268400 (array!36883 (store (arr!17711 a!2986) i!1108 k!1786) (size!18075 a!2986)))))

(declare-fun b!591495 () Bool)

(assert (=> b!591495 (= e!337728 e!337730)))

(declare-fun res!378429 () Bool)

(assert (=> b!591495 (=> res!378429 e!337730)))

(assert (=> b!591495 (= res!378429 (or (not (= (select (arr!17711 a!2986) j!136) lt!268402)) (not (= (select (arr!17711 a!2986) j!136) lt!268401)) (bvsge j!136 index!984)))))

(declare-fun b!591496 () Bool)

(declare-fun Unit!18524 () Unit!18522)

(assert (=> b!591496 (= e!337737 Unit!18524)))

(declare-fun b!591497 () Bool)

(declare-fun res!378432 () Bool)

(assert (=> b!591497 (=> (not res!378432) (not e!337729))))

(assert (=> b!591497 (= res!378432 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!591498 () Bool)

(declare-fun res!378431 () Bool)

(assert (=> b!591498 (=> (not res!378431) (not e!337729))))

(assert (=> b!591498 (= res!378431 (validKeyInArray!0 (select (arr!17711 a!2986) j!136)))))

(declare-fun b!591499 () Bool)

(assert (=> b!591499 (= e!337732 e!337727)))

(declare-fun res!378436 () Bool)

(assert (=> b!591499 (=> (not res!378436) (not e!337727))))

(assert (=> b!591499 (= res!378436 (and (= lt!268393 (Found!6151 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17711 a!2986) index!984) (select (arr!17711 a!2986) j!136))) (not (= (select (arr!17711 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!591499 (= lt!268393 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17711 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591500 () Bool)

(declare-fun res!378428 () Bool)

(assert (=> b!591500 (=> (not res!378428) (not e!337729))))

(assert (=> b!591500 (= res!378428 (and (= (size!18075 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18075 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18075 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!591501 () Bool)

(declare-fun res!378433 () Bool)

(assert (=> b!591501 (=> (not res!378433) (not e!337736))))

(assert (=> b!591501 (= res!378433 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17711 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!591502 () Bool)

(declare-fun Unit!18525 () Unit!18522)

(assert (=> b!591502 (= e!337737 Unit!18525)))

(assert (=> b!591502 false))

(declare-fun b!591503 () Bool)

(declare-fun res!378434 () Bool)

(assert (=> b!591503 (=> (not res!378434) (not e!337736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36882 (_ BitVec 32)) Bool)

(assert (=> b!591503 (= res!378434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!54152 res!378430) b!591500))

(assert (= (and b!591500 res!378428) b!591498))

(assert (= (and b!591498 res!378431) b!591490))

(assert (= (and b!591490 res!378435) b!591497))

(assert (= (and b!591497 res!378432) b!591487))

(assert (= (and b!591487 res!378422) b!591503))

(assert (= (and b!591503 res!378434) b!591492))

(assert (= (and b!591492 res!378425) b!591501))

(assert (= (and b!591501 res!378433) b!591494))

(assert (= (and b!591494 res!378424) b!591499))

(assert (= (and b!591499 res!378436) b!591491))

(assert (= (and b!591491 res!378423) b!591486))

(assert (= (and b!591491 c!66899) b!591502))

(assert (= (and b!591491 (not c!66899)) b!591496))

(assert (= (and b!591491 (not res!378437)) b!591489))

(assert (= (and b!591489 res!378427) b!591495))

(assert (= (and b!591495 (not res!378429)) b!591493))

(assert (= (and b!591493 res!378426) b!591488))

(declare-fun m!569727 () Bool)

(assert (=> b!591501 m!569727))

(declare-fun m!569729 () Bool)

(assert (=> b!591503 m!569729))

(declare-fun m!569731 () Bool)

(assert (=> b!591489 m!569731))

(declare-fun m!569733 () Bool)

(assert (=> b!591489 m!569733))

(declare-fun m!569735 () Bool)

(assert (=> b!591489 m!569735))

(declare-fun m!569737 () Bool)

(assert (=> b!591492 m!569737))

(assert (=> b!591498 m!569731))

(assert (=> b!591498 m!569731))

(declare-fun m!569739 () Bool)

(assert (=> b!591498 m!569739))

(declare-fun m!569741 () Bool)

(assert (=> b!591491 m!569741))

(declare-fun m!569743 () Bool)

(assert (=> b!591491 m!569743))

(assert (=> b!591491 m!569731))

(declare-fun m!569745 () Bool)

(assert (=> b!591491 m!569745))

(declare-fun m!569747 () Bool)

(assert (=> b!591491 m!569747))

(assert (=> b!591491 m!569731))

(assert (=> b!591491 m!569733))

(declare-fun m!569749 () Bool)

(assert (=> b!591491 m!569749))

(declare-fun m!569751 () Bool)

(assert (=> b!591491 m!569751))

(assert (=> b!591493 m!569731))

(assert (=> b!591493 m!569731))

(declare-fun m!569753 () Bool)

(assert (=> b!591493 m!569753))

(assert (=> b!591494 m!569733))

(declare-fun m!569755 () Bool)

(assert (=> b!591494 m!569755))

(declare-fun m!569757 () Bool)

(assert (=> b!591497 m!569757))

(declare-fun m!569759 () Bool)

(assert (=> b!591490 m!569759))

(declare-fun m!569761 () Bool)

(assert (=> b!591487 m!569761))

(assert (=> b!591495 m!569731))

(declare-fun m!569763 () Bool)

(assert (=> b!591499 m!569763))

(assert (=> b!591499 m!569731))

(assert (=> b!591499 m!569731))

(declare-fun m!569765 () Bool)

(assert (=> b!591499 m!569765))

(assert (=> b!591488 m!569731))

(assert (=> b!591488 m!569731))

(declare-fun m!569767 () Bool)

(assert (=> b!591488 m!569767))

(declare-fun m!569769 () Bool)

(assert (=> start!54152 m!569769))

(declare-fun m!569771 () Bool)

(assert (=> start!54152 m!569771))

(push 1)

