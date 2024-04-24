; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57966 () Bool)

(assert start!57966)

(declare-fun b!640483 () Bool)

(declare-fun e!366643 () Bool)

(declare-fun e!366636 () Bool)

(assert (=> b!640483 (= e!366643 e!366636)))

(declare-fun res!414666 () Bool)

(assert (=> b!640483 (=> res!414666 e!366636)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!296379 () (_ BitVec 64))

(declare-fun lt!296371 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38331 0))(
  ( (array!38332 (arr!18382 (Array (_ BitVec 32) (_ BitVec 64))) (size!18746 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38331)

(assert (=> b!640483 (= res!414666 (or (not (= (select (arr!18382 a!2986) j!136) lt!296379)) (not (= (select (arr!18382 a!2986) j!136) lt!296371)) (bvsge j!136 index!984)))))

(declare-fun e!366645 () Bool)

(assert (=> b!640483 e!366645))

(declare-fun res!414657 () Bool)

(assert (=> b!640483 (=> (not res!414657) (not e!366645))))

(assert (=> b!640483 (= res!414657 (= lt!296371 (select (arr!18382 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!640483 (= lt!296371 (select (store (arr!18382 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!640484 () Bool)

(declare-fun res!414669 () Bool)

(declare-fun e!366641 () Bool)

(assert (=> b!640484 (=> (not res!414669) (not e!366641))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38331 (_ BitVec 32)) Bool)

(assert (=> b!640484 (= res!414669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!640485 () Bool)

(declare-fun e!366638 () Bool)

(declare-datatypes ((SeekEntryResult!6778 0))(
  ( (MissingZero!6778 (index!29432 (_ BitVec 32))) (Found!6778 (index!29433 (_ BitVec 32))) (Intermediate!6778 (undefined!7590 Bool) (index!29434 (_ BitVec 32)) (x!58345 (_ BitVec 32))) (Undefined!6778) (MissingVacant!6778 (index!29435 (_ BitVec 32))) )
))
(declare-fun lt!296381 () SeekEntryResult!6778)

(declare-fun lt!296375 () SeekEntryResult!6778)

(assert (=> b!640485 (= e!366638 (= lt!296381 lt!296375))))

(declare-fun b!640486 () Bool)

(declare-fun res!414664 () Bool)

(declare-fun e!366642 () Bool)

(assert (=> b!640486 (=> (not res!414664) (not e!366642))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!640486 (= res!414664 (validKeyInArray!0 (select (arr!18382 a!2986) j!136)))))

(declare-fun b!640487 () Bool)

(declare-fun e!366635 () Bool)

(assert (=> b!640487 (= e!366645 e!366635)))

(declare-fun res!414658 () Bool)

(assert (=> b!640487 (=> res!414658 e!366635)))

(assert (=> b!640487 (= res!414658 (or (not (= (select (arr!18382 a!2986) j!136) lt!296379)) (not (= (select (arr!18382 a!2986) j!136) lt!296371)) (bvsge j!136 index!984)))))

(declare-fun b!640488 () Bool)

(assert (=> b!640488 (= e!366636 true)))

(declare-fun lt!296374 () array!38331)

(declare-datatypes ((List!12330 0))(
  ( (Nil!12327) (Cons!12326 (h!13374 (_ BitVec 64)) (t!18550 List!12330)) )
))
(declare-fun arrayNoDuplicates!0 (array!38331 (_ BitVec 32) List!12330) Bool)

(assert (=> b!640488 (arrayNoDuplicates!0 lt!296374 j!136 Nil!12327)))

(declare-datatypes ((Unit!21621 0))(
  ( (Unit!21622) )
))
(declare-fun lt!296380 () Unit!21621)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38331 (_ BitVec 32) (_ BitVec 32)) Unit!21621)

(assert (=> b!640488 (= lt!296380 (lemmaNoDuplicateFromThenFromBigger!0 lt!296374 #b00000000000000000000000000000000 j!136))))

(assert (=> b!640488 (arrayNoDuplicates!0 lt!296374 #b00000000000000000000000000000000 Nil!12327)))

(declare-fun lt!296383 () Unit!21621)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38331 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12330) Unit!21621)

(assert (=> b!640488 (= lt!296383 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12327))))

(declare-fun arrayContainsKey!0 (array!38331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!640488 (arrayContainsKey!0 lt!296374 (select (arr!18382 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!296373 () Unit!21621)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38331 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21621)

(assert (=> b!640488 (= lt!296373 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!296374 (select (arr!18382 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!366637 () Bool)

(declare-fun b!640489 () Bool)

(assert (=> b!640489 (= e!366637 (arrayContainsKey!0 lt!296374 (select (arr!18382 a!2986) j!136) index!984))))

(declare-fun b!640490 () Bool)

(declare-fun e!366640 () Unit!21621)

(declare-fun Unit!21623 () Unit!21621)

(assert (=> b!640490 (= e!366640 Unit!21623)))

(declare-fun b!640492 () Bool)

(declare-fun res!414667 () Bool)

(assert (=> b!640492 (=> (not res!414667) (not e!366642))))

(assert (=> b!640492 (= res!414667 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!640493 () Bool)

(declare-fun e!366644 () Bool)

(declare-fun e!366639 () Bool)

(assert (=> b!640493 (= e!366644 e!366639)))

(declare-fun res!414654 () Bool)

(assert (=> b!640493 (=> (not res!414654) (not e!366639))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!640493 (= res!414654 (and (= lt!296381 (Found!6778 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18382 a!2986) index!984) (select (arr!18382 a!2986) j!136))) (not (= (select (arr!18382 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38331 (_ BitVec 32)) SeekEntryResult!6778)

(assert (=> b!640493 (= lt!296381 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18382 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!640494 () Bool)

(assert (=> b!640494 (= e!366635 e!366637)))

(declare-fun res!414661 () Bool)

(assert (=> b!640494 (=> (not res!414661) (not e!366637))))

(assert (=> b!640494 (= res!414661 (arrayContainsKey!0 lt!296374 (select (arr!18382 a!2986) j!136) j!136))))

(declare-fun b!640495 () Bool)

(declare-fun res!414662 () Bool)

(assert (=> b!640495 (=> (not res!414662) (not e!366641))))

(assert (=> b!640495 (= res!414662 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12327))))

(declare-fun b!640496 () Bool)

(declare-fun res!414655 () Bool)

(assert (=> b!640496 (=> (not res!414655) (not e!366642))))

(assert (=> b!640496 (= res!414655 (and (= (size!18746 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18746 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18746 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!640497 () Bool)

(declare-fun res!414660 () Bool)

(assert (=> b!640497 (=> (not res!414660) (not e!366642))))

(assert (=> b!640497 (= res!414660 (validKeyInArray!0 k0!1786))))

(declare-fun b!640498 () Bool)

(declare-fun Unit!21624 () Unit!21621)

(assert (=> b!640498 (= e!366640 Unit!21624)))

(assert (=> b!640498 false))

(declare-fun b!640499 () Bool)

(assert (=> b!640499 (= e!366641 e!366644)))

(declare-fun res!414665 () Bool)

(assert (=> b!640499 (=> (not res!414665) (not e!366644))))

(assert (=> b!640499 (= res!414665 (= (select (store (arr!18382 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!640499 (= lt!296374 (array!38332 (store (arr!18382 a!2986) i!1108 k0!1786) (size!18746 a!2986)))))

(declare-fun b!640500 () Bool)

(declare-fun res!414659 () Bool)

(assert (=> b!640500 (=> (not res!414659) (not e!366641))))

(assert (=> b!640500 (= res!414659 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18382 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!640501 () Bool)

(assert (=> b!640501 (= e!366639 (not e!366643))))

(declare-fun res!414656 () Bool)

(assert (=> b!640501 (=> res!414656 e!366643)))

(declare-fun lt!296378 () SeekEntryResult!6778)

(assert (=> b!640501 (= res!414656 (not (= lt!296378 (Found!6778 index!984))))))

(declare-fun lt!296382 () Unit!21621)

(assert (=> b!640501 (= lt!296382 e!366640)))

(declare-fun c!73283 () Bool)

(assert (=> b!640501 (= c!73283 (= lt!296378 Undefined!6778))))

(assert (=> b!640501 (= lt!296378 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!296379 lt!296374 mask!3053))))

(assert (=> b!640501 e!366638))

(declare-fun res!414668 () Bool)

(assert (=> b!640501 (=> (not res!414668) (not e!366638))))

(declare-fun lt!296376 () (_ BitVec 32))

(assert (=> b!640501 (= res!414668 (= lt!296375 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296376 vacantSpotIndex!68 lt!296379 lt!296374 mask!3053)))))

(assert (=> b!640501 (= lt!296375 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!296376 vacantSpotIndex!68 (select (arr!18382 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!640501 (= lt!296379 (select (store (arr!18382 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!296372 () Unit!21621)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38331 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21621)

(assert (=> b!640501 (= lt!296372 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!296376 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!640501 (= lt!296376 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!640491 () Bool)

(assert (=> b!640491 (= e!366642 e!366641)))

(declare-fun res!414663 () Bool)

(assert (=> b!640491 (=> (not res!414663) (not e!366641))))

(declare-fun lt!296377 () SeekEntryResult!6778)

(assert (=> b!640491 (= res!414663 (or (= lt!296377 (MissingZero!6778 i!1108)) (= lt!296377 (MissingVacant!6778 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38331 (_ BitVec 32)) SeekEntryResult!6778)

(assert (=> b!640491 (= lt!296377 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!414670 () Bool)

(assert (=> start!57966 (=> (not res!414670) (not e!366642))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57966 (= res!414670 (validMask!0 mask!3053))))

(assert (=> start!57966 e!366642))

(assert (=> start!57966 true))

(declare-fun array_inv!14241 (array!38331) Bool)

(assert (=> start!57966 (array_inv!14241 a!2986)))

(assert (= (and start!57966 res!414670) b!640496))

(assert (= (and b!640496 res!414655) b!640486))

(assert (= (and b!640486 res!414664) b!640497))

(assert (= (and b!640497 res!414660) b!640492))

(assert (= (and b!640492 res!414667) b!640491))

(assert (= (and b!640491 res!414663) b!640484))

(assert (= (and b!640484 res!414669) b!640495))

(assert (= (and b!640495 res!414662) b!640500))

(assert (= (and b!640500 res!414659) b!640499))

(assert (= (and b!640499 res!414665) b!640493))

(assert (= (and b!640493 res!414654) b!640501))

(assert (= (and b!640501 res!414668) b!640485))

(assert (= (and b!640501 c!73283) b!640498))

(assert (= (and b!640501 (not c!73283)) b!640490))

(assert (= (and b!640501 (not res!414656)) b!640483))

(assert (= (and b!640483 res!414657) b!640487))

(assert (= (and b!640487 (not res!414658)) b!640494))

(assert (= (and b!640494 res!414661) b!640489))

(assert (= (and b!640483 (not res!414666)) b!640488))

(declare-fun m!614689 () Bool)

(assert (=> b!640491 m!614689))

(declare-fun m!614691 () Bool)

(assert (=> b!640501 m!614691))

(declare-fun m!614693 () Bool)

(assert (=> b!640501 m!614693))

(declare-fun m!614695 () Bool)

(assert (=> b!640501 m!614695))

(declare-fun m!614697 () Bool)

(assert (=> b!640501 m!614697))

(declare-fun m!614699 () Bool)

(assert (=> b!640501 m!614699))

(declare-fun m!614701 () Bool)

(assert (=> b!640501 m!614701))

(assert (=> b!640501 m!614693))

(declare-fun m!614703 () Bool)

(assert (=> b!640501 m!614703))

(declare-fun m!614705 () Bool)

(assert (=> b!640501 m!614705))

(declare-fun m!614707 () Bool)

(assert (=> start!57966 m!614707))

(declare-fun m!614709 () Bool)

(assert (=> start!57966 m!614709))

(assert (=> b!640487 m!614693))

(declare-fun m!614711 () Bool)

(assert (=> b!640492 m!614711))

(assert (=> b!640488 m!614693))

(declare-fun m!614713 () Bool)

(assert (=> b!640488 m!614713))

(assert (=> b!640488 m!614693))

(declare-fun m!614715 () Bool)

(assert (=> b!640488 m!614715))

(declare-fun m!614717 () Bool)

(assert (=> b!640488 m!614717))

(declare-fun m!614719 () Bool)

(assert (=> b!640488 m!614719))

(assert (=> b!640488 m!614693))

(declare-fun m!614721 () Bool)

(assert (=> b!640488 m!614721))

(declare-fun m!614723 () Bool)

(assert (=> b!640488 m!614723))

(assert (=> b!640486 m!614693))

(assert (=> b!640486 m!614693))

(declare-fun m!614725 () Bool)

(assert (=> b!640486 m!614725))

(declare-fun m!614727 () Bool)

(assert (=> b!640500 m!614727))

(assert (=> b!640499 m!614695))

(declare-fun m!614729 () Bool)

(assert (=> b!640499 m!614729))

(assert (=> b!640489 m!614693))

(assert (=> b!640489 m!614693))

(declare-fun m!614731 () Bool)

(assert (=> b!640489 m!614731))

(declare-fun m!614733 () Bool)

(assert (=> b!640493 m!614733))

(assert (=> b!640493 m!614693))

(assert (=> b!640493 m!614693))

(declare-fun m!614735 () Bool)

(assert (=> b!640493 m!614735))

(declare-fun m!614737 () Bool)

(assert (=> b!640497 m!614737))

(declare-fun m!614739 () Bool)

(assert (=> b!640495 m!614739))

(assert (=> b!640483 m!614693))

(assert (=> b!640483 m!614695))

(declare-fun m!614741 () Bool)

(assert (=> b!640483 m!614741))

(assert (=> b!640494 m!614693))

(assert (=> b!640494 m!614693))

(declare-fun m!614743 () Bool)

(assert (=> b!640494 m!614743))

(declare-fun m!614745 () Bool)

(assert (=> b!640484 m!614745))

(check-sat (not b!640488) (not b!640495) (not b!640501) (not b!640492) (not start!57966) (not b!640486) (not b!640493) (not b!640494) (not b!640489) (not b!640484) (not b!640497) (not b!640491))
(check-sat)
