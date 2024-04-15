; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56652 () Bool)

(assert start!56652)

(declare-fun b!627870 () Bool)

(declare-fun res!405714 () Bool)

(declare-fun e!359272 () Bool)

(assert (=> b!627870 (=> (not res!405714) (not e!359272))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37956 0))(
  ( (array!37957 (arr!18218 (Array (_ BitVec 32) (_ BitVec 64))) (size!18583 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37956)

(assert (=> b!627870 (= res!405714 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18218 a!2986) index!984) (select (arr!18218 a!2986) j!136))) (not (= (select (arr!18218 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627871 () Bool)

(declare-fun e!359274 () Bool)

(assert (=> b!627871 (= e!359274 e!359272)))

(declare-fun res!405721 () Bool)

(assert (=> b!627871 (=> (not res!405721) (not e!359272))))

(declare-datatypes ((SeekEntryResult!6655 0))(
  ( (MissingZero!6655 (index!28904 (_ BitVec 32))) (Found!6655 (index!28905 (_ BitVec 32))) (Intermediate!6655 (undefined!7467 Bool) (index!28906 (_ BitVec 32)) (x!57646 (_ BitVec 32))) (Undefined!6655) (MissingVacant!6655 (index!28907 (_ BitVec 32))) )
))
(declare-fun lt!290172 () SeekEntryResult!6655)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627871 (= res!405721 (or (= lt!290172 (MissingZero!6655 i!1108)) (= lt!290172 (MissingVacant!6655 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37956 (_ BitVec 32)) SeekEntryResult!6655)

(assert (=> b!627871 (= lt!290172 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627872 () Bool)

(declare-fun res!405718 () Bool)

(assert (=> b!627872 (=> (not res!405718) (not e!359272))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!627872 (= res!405718 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18218 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18218 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!405720 () Bool)

(assert (=> start!56652 (=> (not res!405720) (not e!359274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56652 (= res!405720 (validMask!0 mask!3053))))

(assert (=> start!56652 e!359274))

(assert (=> start!56652 true))

(declare-fun array_inv!14101 (array!37956) Bool)

(assert (=> start!56652 (array_inv!14101 a!2986)))

(declare-fun b!627873 () Bool)

(declare-fun res!405717 () Bool)

(assert (=> b!627873 (=> (not res!405717) (not e!359272))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37956 (_ BitVec 32)) SeekEntryResult!6655)

(assert (=> b!627873 (= res!405717 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18218 a!2986) j!136) a!2986 mask!3053) (Found!6655 j!136)))))

(declare-fun b!627874 () Bool)

(declare-fun res!405722 () Bool)

(assert (=> b!627874 (=> (not res!405722) (not e!359272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37956 (_ BitVec 32)) Bool)

(assert (=> b!627874 (= res!405722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627875 () Bool)

(declare-fun res!405716 () Bool)

(assert (=> b!627875 (=> (not res!405716) (not e!359274))))

(declare-fun arrayContainsKey!0 (array!37956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627875 (= res!405716 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627876 () Bool)

(declare-fun res!405719 () Bool)

(assert (=> b!627876 (=> (not res!405719) (not e!359274))))

(assert (=> b!627876 (= res!405719 (and (= (size!18583 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18583 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18583 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627877 () Bool)

(declare-fun res!405713 () Bool)

(assert (=> b!627877 (=> (not res!405713) (not e!359272))))

(declare-datatypes ((List!12298 0))(
  ( (Nil!12295) (Cons!12294 (h!13339 (_ BitVec 64)) (t!18517 List!12298)) )
))
(declare-fun arrayNoDuplicates!0 (array!37956 (_ BitVec 32) List!12298) Bool)

(assert (=> b!627877 (= res!405713 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12295))))

(declare-fun b!627878 () Bool)

(assert (=> b!627878 (= e!359272 false)))

(declare-fun lt!290173 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627878 (= lt!290173 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627879 () Bool)

(declare-fun res!405712 () Bool)

(assert (=> b!627879 (=> (not res!405712) (not e!359274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627879 (= res!405712 (validKeyInArray!0 k0!1786))))

(declare-fun b!627880 () Bool)

(declare-fun res!405715 () Bool)

(assert (=> b!627880 (=> (not res!405715) (not e!359274))))

(assert (=> b!627880 (= res!405715 (validKeyInArray!0 (select (arr!18218 a!2986) j!136)))))

(assert (= (and start!56652 res!405720) b!627876))

(assert (= (and b!627876 res!405719) b!627880))

(assert (= (and b!627880 res!405715) b!627879))

(assert (= (and b!627879 res!405712) b!627875))

(assert (= (and b!627875 res!405716) b!627871))

(assert (= (and b!627871 res!405721) b!627874))

(assert (= (and b!627874 res!405722) b!627877))

(assert (= (and b!627877 res!405713) b!627872))

(assert (= (and b!627872 res!405718) b!627873))

(assert (= (and b!627873 res!405717) b!627870))

(assert (= (and b!627870 res!405714) b!627878))

(declare-fun m!602623 () Bool)

(assert (=> b!627870 m!602623))

(declare-fun m!602625 () Bool)

(assert (=> b!627870 m!602625))

(declare-fun m!602627 () Bool)

(assert (=> b!627877 m!602627))

(declare-fun m!602629 () Bool)

(assert (=> start!56652 m!602629))

(declare-fun m!602631 () Bool)

(assert (=> start!56652 m!602631))

(declare-fun m!602633 () Bool)

(assert (=> b!627871 m!602633))

(assert (=> b!627873 m!602625))

(assert (=> b!627873 m!602625))

(declare-fun m!602635 () Bool)

(assert (=> b!627873 m!602635))

(assert (=> b!627880 m!602625))

(assert (=> b!627880 m!602625))

(declare-fun m!602637 () Bool)

(assert (=> b!627880 m!602637))

(declare-fun m!602639 () Bool)

(assert (=> b!627879 m!602639))

(declare-fun m!602641 () Bool)

(assert (=> b!627875 m!602641))

(declare-fun m!602643 () Bool)

(assert (=> b!627878 m!602643))

(declare-fun m!602645 () Bool)

(assert (=> b!627874 m!602645))

(declare-fun m!602647 () Bool)

(assert (=> b!627872 m!602647))

(declare-fun m!602649 () Bool)

(assert (=> b!627872 m!602649))

(declare-fun m!602651 () Bool)

(assert (=> b!627872 m!602651))

(check-sat (not b!627873) (not b!627879) (not b!627880) (not b!627874) (not b!627875) (not b!627871) (not b!627878) (not b!627877) (not start!56652))
(check-sat)
