; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56382 () Bool)

(assert start!56382)

(declare-fun b!624833 () Bool)

(declare-fun e!358201 () Bool)

(declare-fun e!358203 () Bool)

(assert (=> b!624833 (= e!358201 e!358203)))

(declare-fun res!402983 () Bool)

(assert (=> b!624833 (=> (not res!402983) (not e!358203))))

(declare-datatypes ((SeekEntryResult!6568 0))(
  ( (MissingZero!6568 (index!28556 (_ BitVec 32))) (Found!6568 (index!28557 (_ BitVec 32))) (Intermediate!6568 (undefined!7380 Bool) (index!28558 (_ BitVec 32)) (x!57321 (_ BitVec 32))) (Undefined!6568) (MissingVacant!6568 (index!28559 (_ BitVec 32))) )
))
(declare-fun lt!289528 () SeekEntryResult!6568)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624833 (= res!402983 (or (= lt!289528 (MissingZero!6568 i!1108)) (= lt!289528 (MissingVacant!6568 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37776 0))(
  ( (array!37777 (arr!18131 (Array (_ BitVec 32) (_ BitVec 64))) (size!18496 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37776)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37776 (_ BitVec 32)) SeekEntryResult!6568)

(assert (=> b!624833 (= lt!289528 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624834 () Bool)

(declare-fun res!402985 () Bool)

(assert (=> b!624834 (=> (not res!402985) (not e!358201))))

(declare-fun arrayContainsKey!0 (array!37776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624834 (= res!402985 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!402982 () Bool)

(assert (=> start!56382 (=> (not res!402982) (not e!358201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56382 (= res!402982 (validMask!0 mask!3053))))

(assert (=> start!56382 e!358201))

(assert (=> start!56382 true))

(declare-fun array_inv!14014 (array!37776) Bool)

(assert (=> start!56382 (array_inv!14014 a!2986)))

(declare-fun b!624835 () Bool)

(declare-fun res!402988 () Bool)

(assert (=> b!624835 (=> (not res!402988) (not e!358201))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624835 (= res!402988 (and (= (size!18496 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18496 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18496 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624836 () Bool)

(declare-fun res!402989 () Bool)

(assert (=> b!624836 (=> (not res!402989) (not e!358201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624836 (= res!402989 (validKeyInArray!0 (select (arr!18131 a!2986) j!136)))))

(declare-fun b!624837 () Bool)

(declare-fun res!402984 () Bool)

(assert (=> b!624837 (=> (not res!402984) (not e!358203))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624837 (= res!402984 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18131 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18131 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624838 () Bool)

(declare-fun res!402981 () Bool)

(assert (=> b!624838 (=> (not res!402981) (not e!358201))))

(assert (=> b!624838 (= res!402981 (validKeyInArray!0 k0!1786))))

(declare-fun b!624839 () Bool)

(declare-fun res!402987 () Bool)

(assert (=> b!624839 (=> (not res!402987) (not e!358203))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37776 (_ BitVec 32)) Bool)

(assert (=> b!624839 (= res!402987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624840 () Bool)

(declare-fun res!402986 () Bool)

(assert (=> b!624840 (=> (not res!402986) (not e!358203))))

(declare-datatypes ((List!12211 0))(
  ( (Nil!12208) (Cons!12207 (h!13252 (_ BitVec 64)) (t!18430 List!12211)) )
))
(declare-fun arrayNoDuplicates!0 (array!37776 (_ BitVec 32) List!12211) Bool)

(assert (=> b!624840 (= res!402986 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12208))))

(declare-fun b!624841 () Bool)

(assert (=> b!624841 (= e!358203 false)))

(declare-fun lt!289527 () SeekEntryResult!6568)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37776 (_ BitVec 32)) SeekEntryResult!6568)

(assert (=> b!624841 (= lt!289527 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18131 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!56382 res!402982) b!624835))

(assert (= (and b!624835 res!402988) b!624836))

(assert (= (and b!624836 res!402989) b!624838))

(assert (= (and b!624838 res!402981) b!624834))

(assert (= (and b!624834 res!402985) b!624833))

(assert (= (and b!624833 res!402983) b!624839))

(assert (= (and b!624839 res!402987) b!624840))

(assert (= (and b!624840 res!402986) b!624837))

(assert (= (and b!624837 res!402984) b!624841))

(declare-fun m!599923 () Bool)

(assert (=> b!624839 m!599923))

(declare-fun m!599925 () Bool)

(assert (=> b!624838 m!599925))

(declare-fun m!599927 () Bool)

(assert (=> start!56382 m!599927))

(declare-fun m!599929 () Bool)

(assert (=> start!56382 m!599929))

(declare-fun m!599931 () Bool)

(assert (=> b!624836 m!599931))

(assert (=> b!624836 m!599931))

(declare-fun m!599933 () Bool)

(assert (=> b!624836 m!599933))

(declare-fun m!599935 () Bool)

(assert (=> b!624834 m!599935))

(assert (=> b!624841 m!599931))

(assert (=> b!624841 m!599931))

(declare-fun m!599937 () Bool)

(assert (=> b!624841 m!599937))

(declare-fun m!599939 () Bool)

(assert (=> b!624833 m!599939))

(declare-fun m!599941 () Bool)

(assert (=> b!624837 m!599941))

(declare-fun m!599943 () Bool)

(assert (=> b!624837 m!599943))

(declare-fun m!599945 () Bool)

(assert (=> b!624837 m!599945))

(declare-fun m!599947 () Bool)

(assert (=> b!624840 m!599947))

(check-sat (not b!624834) (not b!624839) (not b!624836) (not b!624838) (not b!624841) (not start!56382) (not b!624833) (not b!624840))
(check-sat)
