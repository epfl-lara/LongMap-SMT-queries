; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56580 () Bool)

(assert start!56580)

(declare-fun b!626682 () Bool)

(declare-fun res!404524 () Bool)

(declare-fun e!358948 () Bool)

(assert (=> b!626682 (=> (not res!404524) (not e!358948))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37884 0))(
  ( (array!37885 (arr!18182 (Array (_ BitVec 32) (_ BitVec 64))) (size!18547 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37884)

(assert (=> b!626682 (= res!404524 (and (= (size!18547 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18547 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18547 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626683 () Bool)

(declare-fun res!404531 () Bool)

(assert (=> b!626683 (=> (not res!404531) (not e!358948))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37884 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626683 (= res!404531 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626684 () Bool)

(declare-fun res!404530 () Bool)

(declare-fun e!358950 () Bool)

(assert (=> b!626684 (=> (not res!404530) (not e!358950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37884 (_ BitVec 32)) Bool)

(assert (=> b!626684 (= res!404530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626685 () Bool)

(assert (=> b!626685 (= e!358948 e!358950)))

(declare-fun res!404525 () Bool)

(assert (=> b!626685 (=> (not res!404525) (not e!358950))))

(declare-datatypes ((SeekEntryResult!6619 0))(
  ( (MissingZero!6619 (index!28760 (_ BitVec 32))) (Found!6619 (index!28761 (_ BitVec 32))) (Intermediate!6619 (undefined!7431 Bool) (index!28762 (_ BitVec 32)) (x!57514 (_ BitVec 32))) (Undefined!6619) (MissingVacant!6619 (index!28763 (_ BitVec 32))) )
))
(declare-fun lt!289957 () SeekEntryResult!6619)

(assert (=> b!626685 (= res!404525 (or (= lt!289957 (MissingZero!6619 i!1108)) (= lt!289957 (MissingVacant!6619 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37884 (_ BitVec 32)) SeekEntryResult!6619)

(assert (=> b!626685 (= lt!289957 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626686 () Bool)

(declare-fun res!404529 () Bool)

(assert (=> b!626686 (=> (not res!404529) (not e!358950))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!626686 (= res!404529 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18182 a!2986) index!984) (select (arr!18182 a!2986) j!136))) (not (= (select (arr!18182 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!626687 () Bool)

(assert (=> b!626687 (= e!358950 false)))

(declare-fun lt!289956 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!626687 (= lt!289956 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!626688 () Bool)

(declare-fun res!404533 () Bool)

(assert (=> b!626688 (=> (not res!404533) (not e!358950))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37884 (_ BitVec 32)) SeekEntryResult!6619)

(assert (=> b!626688 (= res!404533 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18182 a!2986) j!136) a!2986 mask!3053) (Found!6619 j!136)))))

(declare-fun b!626689 () Bool)

(declare-fun res!404534 () Bool)

(assert (=> b!626689 (=> (not res!404534) (not e!358948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626689 (= res!404534 (validKeyInArray!0 (select (arr!18182 a!2986) j!136)))))

(declare-fun res!404527 () Bool)

(assert (=> start!56580 (=> (not res!404527) (not e!358948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56580 (= res!404527 (validMask!0 mask!3053))))

(assert (=> start!56580 e!358948))

(assert (=> start!56580 true))

(declare-fun array_inv!14065 (array!37884) Bool)

(assert (=> start!56580 (array_inv!14065 a!2986)))

(declare-fun b!626690 () Bool)

(declare-fun res!404528 () Bool)

(assert (=> b!626690 (=> (not res!404528) (not e!358950))))

(assert (=> b!626690 (= res!404528 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18182 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18182 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626691 () Bool)

(declare-fun res!404526 () Bool)

(assert (=> b!626691 (=> (not res!404526) (not e!358950))))

(declare-datatypes ((List!12262 0))(
  ( (Nil!12259) (Cons!12258 (h!13303 (_ BitVec 64)) (t!18481 List!12262)) )
))
(declare-fun arrayNoDuplicates!0 (array!37884 (_ BitVec 32) List!12262) Bool)

(assert (=> b!626691 (= res!404526 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12259))))

(declare-fun b!626692 () Bool)

(declare-fun res!404532 () Bool)

(assert (=> b!626692 (=> (not res!404532) (not e!358948))))

(assert (=> b!626692 (= res!404532 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56580 res!404527) b!626682))

(assert (= (and b!626682 res!404524) b!626689))

(assert (= (and b!626689 res!404534) b!626692))

(assert (= (and b!626692 res!404532) b!626683))

(assert (= (and b!626683 res!404531) b!626685))

(assert (= (and b!626685 res!404525) b!626684))

(assert (= (and b!626684 res!404530) b!626691))

(assert (= (and b!626691 res!404526) b!626690))

(assert (= (and b!626690 res!404528) b!626688))

(assert (= (and b!626688 res!404533) b!626686))

(assert (= (and b!626686 res!404529) b!626687))

(declare-fun m!601543 () Bool)

(assert (=> b!626687 m!601543))

(declare-fun m!601545 () Bool)

(assert (=> b!626686 m!601545))

(declare-fun m!601547 () Bool)

(assert (=> b!626686 m!601547))

(declare-fun m!601549 () Bool)

(assert (=> b!626691 m!601549))

(declare-fun m!601551 () Bool)

(assert (=> b!626683 m!601551))

(declare-fun m!601553 () Bool)

(assert (=> b!626684 m!601553))

(declare-fun m!601555 () Bool)

(assert (=> b!626692 m!601555))

(declare-fun m!601557 () Bool)

(assert (=> b!626685 m!601557))

(assert (=> b!626689 m!601547))

(assert (=> b!626689 m!601547))

(declare-fun m!601559 () Bool)

(assert (=> b!626689 m!601559))

(declare-fun m!601561 () Bool)

(assert (=> b!626690 m!601561))

(declare-fun m!601563 () Bool)

(assert (=> b!626690 m!601563))

(declare-fun m!601565 () Bool)

(assert (=> b!626690 m!601565))

(assert (=> b!626688 m!601547))

(assert (=> b!626688 m!601547))

(declare-fun m!601567 () Bool)

(assert (=> b!626688 m!601567))

(declare-fun m!601569 () Bool)

(assert (=> start!56580 m!601569))

(declare-fun m!601571 () Bool)

(assert (=> start!56580 m!601571))

(check-sat (not b!626687) (not b!626683) (not b!626689) (not b!626685) (not b!626688) (not b!626684) (not start!56580) (not b!626692) (not b!626691))
(check-sat)
