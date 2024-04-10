; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56436 () Bool)

(assert start!56436)

(declare-fun b!625626 () Bool)

(declare-fun res!403633 () Bool)

(declare-fun e!358547 () Bool)

(assert (=> b!625626 (=> (not res!403633) (not e!358547))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!37816 0))(
  ( (array!37817 (arr!18151 (Array (_ BitVec 32) (_ BitVec 64))) (size!18515 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37816)

(assert (=> b!625626 (= res!403633 (and (= (size!18515 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18515 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18515 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625627 () Bool)

(declare-fun res!403634 () Bool)

(assert (=> b!625627 (=> (not res!403634) (not e!358547))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625627 (= res!403634 (validKeyInArray!0 k0!1786))))

(declare-fun b!625628 () Bool)

(declare-fun res!403636 () Bool)

(assert (=> b!625628 (=> (not res!403636) (not e!358547))))

(assert (=> b!625628 (= res!403636 (validKeyInArray!0 (select (arr!18151 a!2986) j!136)))))

(declare-fun b!625629 () Bool)

(declare-fun e!358548 () Bool)

(assert (=> b!625629 (= e!358547 e!358548)))

(declare-fun res!403632 () Bool)

(assert (=> b!625629 (=> (not res!403632) (not e!358548))))

(declare-datatypes ((SeekEntryResult!6591 0))(
  ( (MissingZero!6591 (index!28648 (_ BitVec 32))) (Found!6591 (index!28649 (_ BitVec 32))) (Intermediate!6591 (undefined!7403 Bool) (index!28650 (_ BitVec 32)) (x!57397 (_ BitVec 32))) (Undefined!6591) (MissingVacant!6591 (index!28651 (_ BitVec 32))) )
))
(declare-fun lt!289867 () SeekEntryResult!6591)

(assert (=> b!625629 (= res!403632 (or (= lt!289867 (MissingZero!6591 i!1108)) (= lt!289867 (MissingVacant!6591 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37816 (_ BitVec 32)) SeekEntryResult!6591)

(assert (=> b!625629 (= lt!289867 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625630 () Bool)

(declare-fun res!403639 () Bool)

(assert (=> b!625630 (=> (not res!403639) (not e!358548))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!625630 (= res!403639 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18151 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18151 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!403640 () Bool)

(assert (=> start!56436 (=> (not res!403640) (not e!358547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56436 (= res!403640 (validMask!0 mask!3053))))

(assert (=> start!56436 e!358547))

(assert (=> start!56436 true))

(declare-fun array_inv!13947 (array!37816) Bool)

(assert (=> start!56436 (array_inv!13947 a!2986)))

(declare-fun b!625631 () Bool)

(declare-fun res!403635 () Bool)

(assert (=> b!625631 (=> (not res!403635) (not e!358548))))

(declare-datatypes ((List!12192 0))(
  ( (Nil!12189) (Cons!12188 (h!13233 (_ BitVec 64)) (t!18420 List!12192)) )
))
(declare-fun arrayNoDuplicates!0 (array!37816 (_ BitVec 32) List!12192) Bool)

(assert (=> b!625631 (= res!403635 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12189))))

(declare-fun b!625632 () Bool)

(declare-fun res!403637 () Bool)

(assert (=> b!625632 (=> (not res!403637) (not e!358548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37816 (_ BitVec 32)) Bool)

(assert (=> b!625632 (= res!403637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625633 () Bool)

(declare-fun res!403638 () Bool)

(assert (=> b!625633 (=> (not res!403638) (not e!358547))))

(declare-fun arrayContainsKey!0 (array!37816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625633 (= res!403638 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!625634 () Bool)

(assert (=> b!625634 (= e!358548 false)))

(declare-fun lt!289866 () SeekEntryResult!6591)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37816 (_ BitVec 32)) SeekEntryResult!6591)

(assert (=> b!625634 (= lt!289866 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18151 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!56436 res!403640) b!625626))

(assert (= (and b!625626 res!403633) b!625628))

(assert (= (and b!625628 res!403636) b!625627))

(assert (= (and b!625627 res!403634) b!625633))

(assert (= (and b!625633 res!403638) b!625629))

(assert (= (and b!625629 res!403632) b!625632))

(assert (= (and b!625632 res!403637) b!625631))

(assert (= (and b!625631 res!403635) b!625630))

(assert (= (and b!625630 res!403639) b!625634))

(declare-fun m!601189 () Bool)

(assert (=> b!625629 m!601189))

(declare-fun m!601191 () Bool)

(assert (=> b!625632 m!601191))

(declare-fun m!601193 () Bool)

(assert (=> b!625633 m!601193))

(declare-fun m!601195 () Bool)

(assert (=> b!625627 m!601195))

(declare-fun m!601197 () Bool)

(assert (=> b!625630 m!601197))

(declare-fun m!601199 () Bool)

(assert (=> b!625630 m!601199))

(declare-fun m!601201 () Bool)

(assert (=> b!625630 m!601201))

(declare-fun m!601203 () Bool)

(assert (=> b!625631 m!601203))

(declare-fun m!601205 () Bool)

(assert (=> b!625634 m!601205))

(assert (=> b!625634 m!601205))

(declare-fun m!601207 () Bool)

(assert (=> b!625634 m!601207))

(assert (=> b!625628 m!601205))

(assert (=> b!625628 m!601205))

(declare-fun m!601209 () Bool)

(assert (=> b!625628 m!601209))

(declare-fun m!601211 () Bool)

(assert (=> start!56436 m!601211))

(declare-fun m!601213 () Bool)

(assert (=> start!56436 m!601213))

(check-sat (not b!625627) (not b!625633) (not b!625629) (not b!625628) (not b!625631) (not b!625632) (not b!625634) (not start!56436))
(check-sat)
