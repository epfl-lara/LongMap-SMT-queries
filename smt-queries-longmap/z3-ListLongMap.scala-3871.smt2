; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53238 () Bool)

(assert start!53238)

(declare-fun b!578723 () Bool)

(declare-fun e!332762 () Bool)

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!578723 (= e!332762 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun b!578724 () Bool)

(declare-fun res!366540 () Bool)

(declare-fun e!332763 () Bool)

(assert (=> b!578724 (=> (not res!366540) (not e!332763))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578724 (= res!366540 (validKeyInArray!0 k0!1786))))

(declare-fun b!578725 () Bool)

(declare-fun res!366545 () Bool)

(assert (=> b!578725 (=> (not res!366545) (not e!332762))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36139 0))(
  ( (array!36140 (arr!17344 (Array (_ BitVec 32) (_ BitVec 64))) (size!17708 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36139)

(declare-datatypes ((SeekEntryResult!5784 0))(
  ( (MissingZero!5784 (index!25363 (_ BitVec 32))) (Found!5784 (index!25364 (_ BitVec 32))) (Intermediate!5784 (undefined!6596 Bool) (index!25365 (_ BitVec 32)) (x!54261 (_ BitVec 32))) (Undefined!5784) (MissingVacant!5784 (index!25366 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36139 (_ BitVec 32)) SeekEntryResult!5784)

(assert (=> b!578725 (= res!366545 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17344 a!2986) j!136) a!2986 mask!3053) (Found!5784 j!136)))))

(declare-fun b!578726 () Bool)

(declare-fun res!366542 () Bool)

(assert (=> b!578726 (=> (not res!366542) (not e!332762))))

(declare-datatypes ((List!11385 0))(
  ( (Nil!11382) (Cons!11381 (h!12426 (_ BitVec 64)) (t!17613 List!11385)) )
))
(declare-fun arrayNoDuplicates!0 (array!36139 (_ BitVec 32) List!11385) Bool)

(assert (=> b!578726 (= res!366542 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11382))))

(declare-fun res!366548 () Bool)

(assert (=> start!53238 (=> (not res!366548) (not e!332763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53238 (= res!366548 (validMask!0 mask!3053))))

(assert (=> start!53238 e!332763))

(assert (=> start!53238 true))

(declare-fun array_inv!13140 (array!36139) Bool)

(assert (=> start!53238 (array_inv!13140 a!2986)))

(declare-fun b!578727 () Bool)

(assert (=> b!578727 (= e!332763 e!332762)))

(declare-fun res!366546 () Bool)

(assert (=> b!578727 (=> (not res!366546) (not e!332762))))

(declare-fun lt!264328 () SeekEntryResult!5784)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578727 (= res!366546 (or (= lt!264328 (MissingZero!5784 i!1108)) (= lt!264328 (MissingVacant!5784 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36139 (_ BitVec 32)) SeekEntryResult!5784)

(assert (=> b!578727 (= lt!264328 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578728 () Bool)

(declare-fun res!366541 () Bool)

(assert (=> b!578728 (=> (not res!366541) (not e!332763))))

(assert (=> b!578728 (= res!366541 (validKeyInArray!0 (select (arr!17344 a!2986) j!136)))))

(declare-fun b!578729 () Bool)

(declare-fun res!366539 () Bool)

(assert (=> b!578729 (=> (not res!366539) (not e!332763))))

(declare-fun arrayContainsKey!0 (array!36139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578729 (= res!366539 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578730 () Bool)

(declare-fun res!366543 () Bool)

(assert (=> b!578730 (=> (not res!366543) (not e!332763))))

(assert (=> b!578730 (= res!366543 (and (= (size!17708 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17708 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17708 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578731 () Bool)

(declare-fun res!366544 () Bool)

(assert (=> b!578731 (=> (not res!366544) (not e!332762))))

(assert (=> b!578731 (= res!366544 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17344 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17344 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578732 () Bool)

(declare-fun res!366547 () Bool)

(assert (=> b!578732 (=> (not res!366547) (not e!332762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36139 (_ BitVec 32)) Bool)

(assert (=> b!578732 (= res!366547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53238 res!366548) b!578730))

(assert (= (and b!578730 res!366543) b!578728))

(assert (= (and b!578728 res!366541) b!578724))

(assert (= (and b!578724 res!366540) b!578729))

(assert (= (and b!578729 res!366539) b!578727))

(assert (= (and b!578727 res!366546) b!578732))

(assert (= (and b!578732 res!366547) b!578726))

(assert (= (and b!578726 res!366542) b!578731))

(assert (= (and b!578731 res!366544) b!578725))

(assert (= (and b!578725 res!366545) b!578723))

(declare-fun m!557373 () Bool)

(assert (=> b!578724 m!557373))

(declare-fun m!557375 () Bool)

(assert (=> b!578727 m!557375))

(declare-fun m!557377 () Bool)

(assert (=> b!578731 m!557377))

(declare-fun m!557379 () Bool)

(assert (=> b!578731 m!557379))

(declare-fun m!557381 () Bool)

(assert (=> b!578731 m!557381))

(declare-fun m!557383 () Bool)

(assert (=> b!578732 m!557383))

(declare-fun m!557385 () Bool)

(assert (=> b!578728 m!557385))

(assert (=> b!578728 m!557385))

(declare-fun m!557387 () Bool)

(assert (=> b!578728 m!557387))

(declare-fun m!557389 () Bool)

(assert (=> start!53238 m!557389))

(declare-fun m!557391 () Bool)

(assert (=> start!53238 m!557391))

(assert (=> b!578725 m!557385))

(assert (=> b!578725 m!557385))

(declare-fun m!557393 () Bool)

(assert (=> b!578725 m!557393))

(declare-fun m!557395 () Bool)

(assert (=> b!578729 m!557395))

(declare-fun m!557397 () Bool)

(assert (=> b!578726 m!557397))

(check-sat (not b!578728) (not b!578729) (not start!53238) (not b!578725) (not b!578724) (not b!578726) (not b!578732) (not b!578727))
(check-sat)
