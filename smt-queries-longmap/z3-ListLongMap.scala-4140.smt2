; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56484 () Bool)

(assert start!56484)

(declare-fun b!625809 () Bool)

(declare-fun res!403709 () Bool)

(declare-fun e!358667 () Bool)

(assert (=> b!625809 (=> (not res!403709) (not e!358667))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!625809 (= res!403709 (validKeyInArray!0 k0!1786))))

(declare-fun b!625810 () Bool)

(declare-fun e!358668 () Bool)

(assert (=> b!625810 (= e!358668 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6541 0))(
  ( (MissingZero!6541 (index!28448 (_ BitVec 32))) (Found!6541 (index!28449 (_ BitVec 32))) (Intermediate!6541 (undefined!7353 Bool) (index!28450 (_ BitVec 32)) (x!57350 (_ BitVec 32))) (Undefined!6541) (MissingVacant!6541 (index!28451 (_ BitVec 32))) )
))
(declare-fun lt!289963 () SeekEntryResult!6541)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37809 0))(
  ( (array!37810 (arr!18145 (Array (_ BitVec 32) (_ BitVec 64))) (size!18509 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37809)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37809 (_ BitVec 32)) SeekEntryResult!6541)

(assert (=> b!625810 (= lt!289963 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18145 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!625811 () Bool)

(assert (=> b!625811 (= e!358667 e!358668)))

(declare-fun res!403710 () Bool)

(assert (=> b!625811 (=> (not res!403710) (not e!358668))))

(declare-fun lt!289962 () SeekEntryResult!6541)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!625811 (= res!403710 (or (= lt!289962 (MissingZero!6541 i!1108)) (= lt!289962 (MissingVacant!6541 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37809 (_ BitVec 32)) SeekEntryResult!6541)

(assert (=> b!625811 (= lt!289962 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!625812 () Bool)

(declare-fun res!403717 () Bool)

(assert (=> b!625812 (=> (not res!403717) (not e!358668))))

(declare-datatypes ((List!12093 0))(
  ( (Nil!12090) (Cons!12089 (h!13137 (_ BitVec 64)) (t!18313 List!12093)) )
))
(declare-fun arrayNoDuplicates!0 (array!37809 (_ BitVec 32) List!12093) Bool)

(assert (=> b!625812 (= res!403717 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12090))))

(declare-fun b!625813 () Bool)

(declare-fun res!403715 () Bool)

(assert (=> b!625813 (=> (not res!403715) (not e!358667))))

(assert (=> b!625813 (= res!403715 (validKeyInArray!0 (select (arr!18145 a!2986) j!136)))))

(declare-fun b!625814 () Bool)

(declare-fun res!403713 () Bool)

(assert (=> b!625814 (=> (not res!403713) (not e!358668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37809 (_ BitVec 32)) Bool)

(assert (=> b!625814 (= res!403713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!625815 () Bool)

(declare-fun res!403712 () Bool)

(assert (=> b!625815 (=> (not res!403712) (not e!358668))))

(assert (=> b!625815 (= res!403712 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18145 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18145 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!625816 () Bool)

(declare-fun res!403711 () Bool)

(assert (=> b!625816 (=> (not res!403711) (not e!358667))))

(assert (=> b!625816 (= res!403711 (and (= (size!18509 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18509 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18509 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!625808 () Bool)

(declare-fun res!403716 () Bool)

(assert (=> b!625808 (=> (not res!403716) (not e!358667))))

(declare-fun arrayContainsKey!0 (array!37809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!625808 (= res!403716 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!403714 () Bool)

(assert (=> start!56484 (=> (not res!403714) (not e!358667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56484 (= res!403714 (validMask!0 mask!3053))))

(assert (=> start!56484 e!358667))

(assert (=> start!56484 true))

(declare-fun array_inv!14004 (array!37809) Bool)

(assert (=> start!56484 (array_inv!14004 a!2986)))

(assert (= (and start!56484 res!403714) b!625816))

(assert (= (and b!625816 res!403711) b!625813))

(assert (= (and b!625813 res!403715) b!625809))

(assert (= (and b!625809 res!403709) b!625808))

(assert (= (and b!625808 res!403716) b!625811))

(assert (= (and b!625811 res!403710) b!625814))

(assert (= (and b!625814 res!403713) b!625812))

(assert (= (and b!625812 res!403717) b!625815))

(assert (= (and b!625815 res!403712) b!625810))

(declare-fun m!601645 () Bool)

(assert (=> b!625813 m!601645))

(assert (=> b!625813 m!601645))

(declare-fun m!601647 () Bool)

(assert (=> b!625813 m!601647))

(declare-fun m!601649 () Bool)

(assert (=> start!56484 m!601649))

(declare-fun m!601651 () Bool)

(assert (=> start!56484 m!601651))

(declare-fun m!601653 () Bool)

(assert (=> b!625811 m!601653))

(declare-fun m!601655 () Bool)

(assert (=> b!625809 m!601655))

(declare-fun m!601657 () Bool)

(assert (=> b!625815 m!601657))

(declare-fun m!601659 () Bool)

(assert (=> b!625815 m!601659))

(declare-fun m!601661 () Bool)

(assert (=> b!625815 m!601661))

(declare-fun m!601663 () Bool)

(assert (=> b!625808 m!601663))

(declare-fun m!601665 () Bool)

(assert (=> b!625814 m!601665))

(assert (=> b!625810 m!601645))

(assert (=> b!625810 m!601645))

(declare-fun m!601667 () Bool)

(assert (=> b!625810 m!601667))

(declare-fun m!601669 () Bool)

(assert (=> b!625812 m!601669))

(check-sat (not b!625809) (not b!625808) (not b!625814) (not b!625813) (not b!625812) (not start!56484) (not b!625810) (not b!625811))
(check-sat)
