; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53226 () Bool)

(assert start!53226)

(declare-fun b!578510 () Bool)

(declare-fun res!366471 () Bool)

(declare-fun e!332607 () Bool)

(assert (=> b!578510 (=> (not res!366471) (not e!332607))))

(declare-datatypes ((array!36141 0))(
  ( (array!36142 (arr!17345 (Array (_ BitVec 32) (_ BitVec 64))) (size!17710 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36141)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578510 (= res!366471 (validKeyInArray!0 (select (arr!17345 a!2986) j!136)))))

(declare-fun b!578511 () Bool)

(declare-fun e!332605 () Bool)

(assert (=> b!578511 (= e!332607 e!332605)))

(declare-fun res!366469 () Bool)

(assert (=> b!578511 (=> (not res!366469) (not e!332605))))

(declare-datatypes ((SeekEntryResult!5782 0))(
  ( (MissingZero!5782 (index!25355 (_ BitVec 32))) (Found!5782 (index!25356 (_ BitVec 32))) (Intermediate!5782 (undefined!6594 Bool) (index!25357 (_ BitVec 32)) (x!54262 (_ BitVec 32))) (Undefined!5782) (MissingVacant!5782 (index!25358 (_ BitVec 32))) )
))
(declare-fun lt!264103 () SeekEntryResult!5782)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578511 (= res!366469 (or (= lt!264103 (MissingZero!5782 i!1108)) (= lt!264103 (MissingVacant!5782 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36141 (_ BitVec 32)) SeekEntryResult!5782)

(assert (=> b!578511 (= lt!264103 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578512 () Bool)

(declare-fun res!366472 () Bool)

(assert (=> b!578512 (=> (not res!366472) (not e!332607))))

(assert (=> b!578512 (= res!366472 (validKeyInArray!0 k0!1786))))

(declare-fun b!578513 () Bool)

(assert (=> b!578513 (= e!332605 false)))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!264102 () SeekEntryResult!5782)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36141 (_ BitVec 32)) SeekEntryResult!5782)

(assert (=> b!578513 (= lt!264102 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17345 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578515 () Bool)

(declare-fun res!366474 () Bool)

(assert (=> b!578515 (=> (not res!366474) (not e!332605))))

(declare-datatypes ((List!11425 0))(
  ( (Nil!11422) (Cons!11421 (h!12466 (_ BitVec 64)) (t!17644 List!11425)) )
))
(declare-fun arrayNoDuplicates!0 (array!36141 (_ BitVec 32) List!11425) Bool)

(assert (=> b!578515 (= res!366474 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11422))))

(declare-fun b!578516 () Bool)

(declare-fun res!366468 () Bool)

(assert (=> b!578516 (=> (not res!366468) (not e!332605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36141 (_ BitVec 32)) Bool)

(assert (=> b!578516 (= res!366468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578517 () Bool)

(declare-fun res!366470 () Bool)

(assert (=> b!578517 (=> (not res!366470) (not e!332605))))

(assert (=> b!578517 (= res!366470 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17345 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17345 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578518 () Bool)

(declare-fun res!366476 () Bool)

(assert (=> b!578518 (=> (not res!366476) (not e!332607))))

(assert (=> b!578518 (= res!366476 (and (= (size!17710 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17710 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17710 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!366475 () Bool)

(assert (=> start!53226 (=> (not res!366475) (not e!332607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53226 (= res!366475 (validMask!0 mask!3053))))

(assert (=> start!53226 e!332607))

(assert (=> start!53226 true))

(declare-fun array_inv!13228 (array!36141) Bool)

(assert (=> start!53226 (array_inv!13228 a!2986)))

(declare-fun b!578514 () Bool)

(declare-fun res!366473 () Bool)

(assert (=> b!578514 (=> (not res!366473) (not e!332607))))

(declare-fun arrayContainsKey!0 (array!36141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578514 (= res!366473 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53226 res!366475) b!578518))

(assert (= (and b!578518 res!366476) b!578510))

(assert (= (and b!578510 res!366471) b!578512))

(assert (= (and b!578512 res!366472) b!578514))

(assert (= (and b!578514 res!366473) b!578511))

(assert (= (and b!578511 res!366469) b!578516))

(assert (= (and b!578516 res!366468) b!578515))

(assert (= (and b!578515 res!366474) b!578517))

(assert (= (and b!578517 res!366470) b!578513))

(declare-fun m!556639 () Bool)

(assert (=> b!578510 m!556639))

(assert (=> b!578510 m!556639))

(declare-fun m!556641 () Bool)

(assert (=> b!578510 m!556641))

(assert (=> b!578513 m!556639))

(assert (=> b!578513 m!556639))

(declare-fun m!556643 () Bool)

(assert (=> b!578513 m!556643))

(declare-fun m!556645 () Bool)

(assert (=> b!578512 m!556645))

(declare-fun m!556647 () Bool)

(assert (=> b!578515 m!556647))

(declare-fun m!556649 () Bool)

(assert (=> start!53226 m!556649))

(declare-fun m!556651 () Bool)

(assert (=> start!53226 m!556651))

(declare-fun m!556653 () Bool)

(assert (=> b!578514 m!556653))

(declare-fun m!556655 () Bool)

(assert (=> b!578516 m!556655))

(declare-fun m!556657 () Bool)

(assert (=> b!578517 m!556657))

(declare-fun m!556659 () Bool)

(assert (=> b!578517 m!556659))

(declare-fun m!556661 () Bool)

(assert (=> b!578517 m!556661))

(declare-fun m!556663 () Bool)

(assert (=> b!578511 m!556663))

(check-sat (not b!578511) (not b!578512) (not b!578514) (not b!578513) (not b!578516) (not b!578515) (not b!578510) (not start!53226))
(check-sat)
