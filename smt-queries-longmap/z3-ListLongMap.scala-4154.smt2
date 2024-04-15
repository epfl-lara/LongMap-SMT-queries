; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56598 () Bool)

(assert start!56598)

(declare-fun b!626980 () Bool)

(declare-fun res!404831 () Bool)

(declare-fun e!359031 () Bool)

(assert (=> b!626980 (=> (not res!404831) (not e!359031))))

(declare-datatypes ((array!37902 0))(
  ( (array!37903 (arr!18191 (Array (_ BitVec 32) (_ BitVec 64))) (size!18556 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37902)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626980 (= res!404831 (validKeyInArray!0 (select (arr!18191 a!2986) j!136)))))

(declare-fun b!626981 () Bool)

(declare-fun res!404826 () Bool)

(declare-fun e!359030 () Bool)

(assert (=> b!626981 (=> (not res!404826) (not e!359030))))

(declare-datatypes ((List!12271 0))(
  ( (Nil!12268) (Cons!12267 (h!13312 (_ BitVec 64)) (t!18490 List!12271)) )
))
(declare-fun arrayNoDuplicates!0 (array!37902 (_ BitVec 32) List!12271) Bool)

(assert (=> b!626981 (= res!404826 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12268))))

(declare-fun b!626982 () Bool)

(assert (=> b!626982 (= e!359030 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lt!290011 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!626982 (= lt!290011 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!626983 () Bool)

(declare-fun res!404829 () Bool)

(assert (=> b!626983 (=> (not res!404829) (not e!359030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37902 (_ BitVec 32)) Bool)

(assert (=> b!626983 (= res!404829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626984 () Bool)

(assert (=> b!626984 (= e!359031 e!359030)))

(declare-fun res!404830 () Bool)

(assert (=> b!626984 (=> (not res!404830) (not e!359030))))

(declare-datatypes ((SeekEntryResult!6628 0))(
  ( (MissingZero!6628 (index!28796 (_ BitVec 32))) (Found!6628 (index!28797 (_ BitVec 32))) (Intermediate!6628 (undefined!7440 Bool) (index!28798 (_ BitVec 32)) (x!57547 (_ BitVec 32))) (Undefined!6628) (MissingVacant!6628 (index!28799 (_ BitVec 32))) )
))
(declare-fun lt!290010 () SeekEntryResult!6628)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626984 (= res!404830 (or (= lt!290010 (MissingZero!6628 i!1108)) (= lt!290010 (MissingVacant!6628 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37902 (_ BitVec 32)) SeekEntryResult!6628)

(assert (=> b!626984 (= lt!290010 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626985 () Bool)

(declare-fun res!404822 () Bool)

(assert (=> b!626985 (=> (not res!404822) (not e!359030))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!626985 (= res!404822 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18191 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18191 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626986 () Bool)

(declare-fun res!404827 () Bool)

(assert (=> b!626986 (=> (not res!404827) (not e!359030))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37902 (_ BitVec 32)) SeekEntryResult!6628)

(assert (=> b!626986 (= res!404827 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18191 a!2986) j!136) a!2986 mask!3053) (Found!6628 j!136)))))

(declare-fun b!626987 () Bool)

(declare-fun res!404823 () Bool)

(assert (=> b!626987 (=> (not res!404823) (not e!359031))))

(assert (=> b!626987 (= res!404823 (and (= (size!18556 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18556 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18556 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626979 () Bool)

(declare-fun res!404821 () Bool)

(assert (=> b!626979 (=> (not res!404821) (not e!359031))))

(declare-fun arrayContainsKey!0 (array!37902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626979 (= res!404821 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!404828 () Bool)

(assert (=> start!56598 (=> (not res!404828) (not e!359031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56598 (= res!404828 (validMask!0 mask!3053))))

(assert (=> start!56598 e!359031))

(assert (=> start!56598 true))

(declare-fun array_inv!14074 (array!37902) Bool)

(assert (=> start!56598 (array_inv!14074 a!2986)))

(declare-fun b!626988 () Bool)

(declare-fun res!404824 () Bool)

(assert (=> b!626988 (=> (not res!404824) (not e!359030))))

(assert (=> b!626988 (= res!404824 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18191 a!2986) index!984) (select (arr!18191 a!2986) j!136))) (not (= (select (arr!18191 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!626989 () Bool)

(declare-fun res!404825 () Bool)

(assert (=> b!626989 (=> (not res!404825) (not e!359031))))

(assert (=> b!626989 (= res!404825 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56598 res!404828) b!626987))

(assert (= (and b!626987 res!404823) b!626980))

(assert (= (and b!626980 res!404831) b!626989))

(assert (= (and b!626989 res!404825) b!626979))

(assert (= (and b!626979 res!404821) b!626984))

(assert (= (and b!626984 res!404830) b!626983))

(assert (= (and b!626983 res!404829) b!626981))

(assert (= (and b!626981 res!404826) b!626985))

(assert (= (and b!626985 res!404822) b!626986))

(assert (= (and b!626986 res!404827) b!626988))

(assert (= (and b!626988 res!404824) b!626982))

(declare-fun m!601813 () Bool)

(assert (=> b!626980 m!601813))

(assert (=> b!626980 m!601813))

(declare-fun m!601815 () Bool)

(assert (=> b!626980 m!601815))

(declare-fun m!601817 () Bool)

(assert (=> b!626983 m!601817))

(declare-fun m!601819 () Bool)

(assert (=> start!56598 m!601819))

(declare-fun m!601821 () Bool)

(assert (=> start!56598 m!601821))

(declare-fun m!601823 () Bool)

(assert (=> b!626984 m!601823))

(declare-fun m!601825 () Bool)

(assert (=> b!626981 m!601825))

(declare-fun m!601827 () Bool)

(assert (=> b!626989 m!601827))

(declare-fun m!601829 () Bool)

(assert (=> b!626979 m!601829))

(declare-fun m!601831 () Bool)

(assert (=> b!626982 m!601831))

(declare-fun m!601833 () Bool)

(assert (=> b!626988 m!601833))

(assert (=> b!626988 m!601813))

(declare-fun m!601835 () Bool)

(assert (=> b!626985 m!601835))

(declare-fun m!601837 () Bool)

(assert (=> b!626985 m!601837))

(declare-fun m!601839 () Bool)

(assert (=> b!626985 m!601839))

(assert (=> b!626986 m!601813))

(assert (=> b!626986 m!601813))

(declare-fun m!601841 () Bool)

(assert (=> b!626986 m!601841))

(check-sat (not start!56598) (not b!626986) (not b!626989) (not b!626980) (not b!626983) (not b!626984) (not b!626981) (not b!626979) (not b!626982))
(check-sat)
