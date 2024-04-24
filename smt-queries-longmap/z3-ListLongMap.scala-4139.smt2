; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56478 () Bool)

(assert start!56478)

(declare-fun res!403636 () Bool)

(declare-fun e!358639 () Bool)

(assert (=> start!56478 (=> (not res!403636) (not e!358639))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56478 (= res!403636 (validMask!0 mask!3053))))

(assert (=> start!56478 e!358639))

(assert (=> start!56478 true))

(declare-datatypes ((array!37803 0))(
  ( (array!37804 (arr!18142 (Array (_ BitVec 32) (_ BitVec 64))) (size!18506 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37803)

(declare-fun array_inv!14001 (array!37803) Bool)

(assert (=> start!56478 (array_inv!14001 a!2986)))

(declare-fun b!625727 () Bool)

(declare-fun res!403632 () Bool)

(assert (=> b!625727 (=> (not res!403632) (not e!358639))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625727 (= res!403632 (validKeyInArray!0 k0!1786))))

(declare-fun b!625728 () Bool)

(declare-fun e!358640 () Bool)

(assert (=> b!625728 (= e!358639 e!358640)))

(declare-fun res!403631 () Bool)

(assert (=> b!625728 (=> (not res!403631) (not e!358640))))

(declare-datatypes ((SeekEntryResult!6538 0))(
  ( (MissingZero!6538 (index!28436 (_ BitVec 32))) (Found!6538 (index!28437 (_ BitVec 32))) (Intermediate!6538 (undefined!7350 Bool) (index!28438 (_ BitVec 32)) (x!57339 (_ BitVec 32))) (Undefined!6538) (MissingVacant!6538 (index!28439 (_ BitVec 32))) )
))
(declare-fun lt!289944 () SeekEntryResult!6538)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625728 (= res!403631 (or (= lt!289944 (MissingZero!6538 i!1108)) (= lt!289944 (MissingVacant!6538 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37803 (_ BitVec 32)) SeekEntryResult!6538)

(assert (=> b!625728 (= lt!289944 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625729 () Bool)

(assert (=> b!625729 (= e!358640 false)))

(declare-fun lt!289945 () SeekEntryResult!6538)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37803 (_ BitVec 32)) SeekEntryResult!6538)

(assert (=> b!625729 (= lt!289945 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18142 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625730 () Bool)

(declare-fun res!403635 () Bool)

(assert (=> b!625730 (=> (not res!403635) (not e!358639))))

(declare-fun arrayContainsKey!0 (array!37803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625730 (= res!403635 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625731 () Bool)

(declare-fun res!403628 () Bool)

(assert (=> b!625731 (=> (not res!403628) (not e!358640))))

(declare-datatypes ((List!12090 0))(
  ( (Nil!12087) (Cons!12086 (h!13134 (_ BitVec 64)) (t!18310 List!12090)) )
))
(declare-fun arrayNoDuplicates!0 (array!37803 (_ BitVec 32) List!12090) Bool)

(assert (=> b!625731 (= res!403628 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12087))))

(declare-fun b!625732 () Bool)

(declare-fun res!403634 () Bool)

(assert (=> b!625732 (=> (not res!403634) (not e!358639))))

(assert (=> b!625732 (= res!403634 (and (= (size!18506 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18506 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18506 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625733 () Bool)

(declare-fun res!403633 () Bool)

(assert (=> b!625733 (=> (not res!403633) (not e!358640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37803 (_ BitVec 32)) Bool)

(assert (=> b!625733 (= res!403633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625734 () Bool)

(declare-fun res!403629 () Bool)

(assert (=> b!625734 (=> (not res!403629) (not e!358640))))

(assert (=> b!625734 (= res!403629 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18142 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18142 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625735 () Bool)

(declare-fun res!403630 () Bool)

(assert (=> b!625735 (=> (not res!403630) (not e!358639))))

(assert (=> b!625735 (= res!403630 (validKeyInArray!0 (select (arr!18142 a!2986) j!136)))))

(assert (= (and start!56478 res!403636) b!625732))

(assert (= (and b!625732 res!403634) b!625735))

(assert (= (and b!625735 res!403630) b!625727))

(assert (= (and b!625727 res!403632) b!625730))

(assert (= (and b!625730 res!403635) b!625728))

(assert (= (and b!625728 res!403631) b!625733))

(assert (= (and b!625733 res!403633) b!625731))

(assert (= (and b!625731 res!403628) b!625734))

(assert (= (and b!625734 res!403629) b!625729))

(declare-fun m!601567 () Bool)

(assert (=> b!625733 m!601567))

(declare-fun m!601569 () Bool)

(assert (=> b!625731 m!601569))

(declare-fun m!601571 () Bool)

(assert (=> start!56478 m!601571))

(declare-fun m!601573 () Bool)

(assert (=> start!56478 m!601573))

(declare-fun m!601575 () Bool)

(assert (=> b!625734 m!601575))

(declare-fun m!601577 () Bool)

(assert (=> b!625734 m!601577))

(declare-fun m!601579 () Bool)

(assert (=> b!625734 m!601579))

(declare-fun m!601581 () Bool)

(assert (=> b!625730 m!601581))

(declare-fun m!601583 () Bool)

(assert (=> b!625735 m!601583))

(assert (=> b!625735 m!601583))

(declare-fun m!601585 () Bool)

(assert (=> b!625735 m!601585))

(assert (=> b!625729 m!601583))

(assert (=> b!625729 m!601583))

(declare-fun m!601587 () Bool)

(assert (=> b!625729 m!601587))

(declare-fun m!601589 () Bool)

(assert (=> b!625727 m!601589))

(declare-fun m!601591 () Bool)

(assert (=> b!625728 m!601591))

(check-sat (not b!625730) (not b!625729) (not b!625728) (not start!56478) (not b!625735) (not b!625733) (not b!625727) (not b!625731))
(check-sat)
