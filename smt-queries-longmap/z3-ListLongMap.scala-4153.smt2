; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56592 () Bool)

(assert start!56592)

(declare-fun b!626880 () Bool)

(declare-fun res!404727 () Bool)

(declare-fun e!359004 () Bool)

(assert (=> b!626880 (=> (not res!404727) (not e!359004))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37896 0))(
  ( (array!37897 (arr!18188 (Array (_ BitVec 32) (_ BitVec 64))) (size!18553 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37896)

(assert (=> b!626880 (= res!404727 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18188 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18188 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626881 () Bool)

(declare-fun res!404731 () Bool)

(declare-fun e!359003 () Bool)

(assert (=> b!626881 (=> (not res!404731) (not e!359003))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!626881 (= res!404731 (and (= (size!18553 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18553 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18553 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626882 () Bool)

(assert (=> b!626882 (= e!359003 e!359004)))

(declare-fun res!404724 () Bool)

(assert (=> b!626882 (=> (not res!404724) (not e!359004))))

(declare-datatypes ((SeekEntryResult!6625 0))(
  ( (MissingZero!6625 (index!28784 (_ BitVec 32))) (Found!6625 (index!28785 (_ BitVec 32))) (Intermediate!6625 (undefined!7437 Bool) (index!28786 (_ BitVec 32)) (x!57536 (_ BitVec 32))) (Undefined!6625) (MissingVacant!6625 (index!28787 (_ BitVec 32))) )
))
(declare-fun lt!289993 () SeekEntryResult!6625)

(assert (=> b!626882 (= res!404724 (or (= lt!289993 (MissingZero!6625 i!1108)) (= lt!289993 (MissingVacant!6625 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37896 (_ BitVec 32)) SeekEntryResult!6625)

(assert (=> b!626882 (= lt!289993 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626884 () Bool)

(declare-fun res!404722 () Bool)

(assert (=> b!626884 (=> (not res!404722) (not e!359004))))

(declare-datatypes ((List!12268 0))(
  ( (Nil!12265) (Cons!12264 (h!13309 (_ BitVec 64)) (t!18487 List!12268)) )
))
(declare-fun arrayNoDuplicates!0 (array!37896 (_ BitVec 32) List!12268) Bool)

(assert (=> b!626884 (= res!404722 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12265))))

(declare-fun b!626885 () Bool)

(declare-fun res!404728 () Bool)

(assert (=> b!626885 (=> (not res!404728) (not e!359004))))

(assert (=> b!626885 (= res!404728 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18188 a!2986) index!984) (select (arr!18188 a!2986) j!136))) (not (= (select (arr!18188 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!626886 () Bool)

(declare-fun res!404729 () Bool)

(assert (=> b!626886 (=> (not res!404729) (not e!359003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626886 (= res!404729 (validKeyInArray!0 (select (arr!18188 a!2986) j!136)))))

(declare-fun res!404725 () Bool)

(assert (=> start!56592 (=> (not res!404725) (not e!359003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56592 (= res!404725 (validMask!0 mask!3053))))

(assert (=> start!56592 e!359003))

(assert (=> start!56592 true))

(declare-fun array_inv!14071 (array!37896) Bool)

(assert (=> start!56592 (array_inv!14071 a!2986)))

(declare-fun b!626883 () Bool)

(declare-fun res!404730 () Bool)

(assert (=> b!626883 (=> (not res!404730) (not e!359003))))

(declare-fun arrayContainsKey!0 (array!37896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626883 (= res!404730 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626887 () Bool)

(declare-fun res!404732 () Bool)

(assert (=> b!626887 (=> (not res!404732) (not e!359003))))

(assert (=> b!626887 (= res!404732 (validKeyInArray!0 k0!1786))))

(declare-fun b!626888 () Bool)

(declare-fun res!404726 () Bool)

(assert (=> b!626888 (=> (not res!404726) (not e!359004))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37896 (_ BitVec 32)) SeekEntryResult!6625)

(assert (=> b!626888 (= res!404726 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18188 a!2986) j!136) a!2986 mask!3053) (Found!6625 j!136)))))

(declare-fun b!626889 () Bool)

(declare-fun res!404723 () Bool)

(assert (=> b!626889 (=> (not res!404723) (not e!359004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37896 (_ BitVec 32)) Bool)

(assert (=> b!626889 (= res!404723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626890 () Bool)

(assert (=> b!626890 (= e!359004 false)))

(declare-fun lt!289992 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!626890 (= lt!289992 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!56592 res!404725) b!626881))

(assert (= (and b!626881 res!404731) b!626886))

(assert (= (and b!626886 res!404729) b!626887))

(assert (= (and b!626887 res!404732) b!626883))

(assert (= (and b!626883 res!404730) b!626882))

(assert (= (and b!626882 res!404724) b!626889))

(assert (= (and b!626889 res!404723) b!626884))

(assert (= (and b!626884 res!404722) b!626880))

(assert (= (and b!626880 res!404727) b!626888))

(assert (= (and b!626888 res!404726) b!626885))

(assert (= (and b!626885 res!404728) b!626890))

(declare-fun m!601723 () Bool)

(assert (=> b!626887 m!601723))

(declare-fun m!601725 () Bool)

(assert (=> b!626880 m!601725))

(declare-fun m!601727 () Bool)

(assert (=> b!626880 m!601727))

(declare-fun m!601729 () Bool)

(assert (=> b!626880 m!601729))

(declare-fun m!601731 () Bool)

(assert (=> b!626890 m!601731))

(declare-fun m!601733 () Bool)

(assert (=> start!56592 m!601733))

(declare-fun m!601735 () Bool)

(assert (=> start!56592 m!601735))

(declare-fun m!601737 () Bool)

(assert (=> b!626883 m!601737))

(declare-fun m!601739 () Bool)

(assert (=> b!626889 m!601739))

(declare-fun m!601741 () Bool)

(assert (=> b!626884 m!601741))

(declare-fun m!601743 () Bool)

(assert (=> b!626882 m!601743))

(declare-fun m!601745 () Bool)

(assert (=> b!626885 m!601745))

(declare-fun m!601747 () Bool)

(assert (=> b!626885 m!601747))

(assert (=> b!626886 m!601747))

(assert (=> b!626886 m!601747))

(declare-fun m!601749 () Bool)

(assert (=> b!626886 m!601749))

(assert (=> b!626888 m!601747))

(assert (=> b!626888 m!601747))

(declare-fun m!601751 () Bool)

(assert (=> b!626888 m!601751))

(check-sat (not b!626889) (not b!626882) (not b!626888) (not b!626887) (not b!626890) (not b!626884) (not b!626886) (not start!56592) (not b!626883))
(check-sat)
