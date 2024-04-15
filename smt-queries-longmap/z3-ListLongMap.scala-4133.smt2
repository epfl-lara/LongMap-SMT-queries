; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56376 () Bool)

(assert start!56376)

(declare-fun b!624752 () Bool)

(declare-fun res!402900 () Bool)

(declare-fun e!358176 () Bool)

(assert (=> b!624752 (=> (not res!402900) (not e!358176))))

(declare-datatypes ((array!37770 0))(
  ( (array!37771 (arr!18128 (Array (_ BitVec 32) (_ BitVec 64))) (size!18493 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37770)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624752 (= res!402900 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624754 () Bool)

(declare-fun e!358174 () Bool)

(assert (=> b!624754 (= e!358176 e!358174)))

(declare-fun res!402903 () Bool)

(assert (=> b!624754 (=> (not res!402903) (not e!358174))))

(declare-datatypes ((SeekEntryResult!6565 0))(
  ( (MissingZero!6565 (index!28544 (_ BitVec 32))) (Found!6565 (index!28545 (_ BitVec 32))) (Intermediate!6565 (undefined!7377 Bool) (index!28546 (_ BitVec 32)) (x!57310 (_ BitVec 32))) (Undefined!6565) (MissingVacant!6565 (index!28547 (_ BitVec 32))) )
))
(declare-fun lt!289509 () SeekEntryResult!6565)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624754 (= res!402903 (or (= lt!289509 (MissingZero!6565 i!1108)) (= lt!289509 (MissingVacant!6565 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37770 (_ BitVec 32)) SeekEntryResult!6565)

(assert (=> b!624754 (= lt!289509 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624755 () Bool)

(declare-fun res!402907 () Bool)

(assert (=> b!624755 (=> (not res!402907) (not e!358174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37770 (_ BitVec 32)) Bool)

(assert (=> b!624755 (= res!402907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624756 () Bool)

(declare-fun res!402902 () Bool)

(assert (=> b!624756 (=> (not res!402902) (not e!358174))))

(declare-datatypes ((List!12208 0))(
  ( (Nil!12205) (Cons!12204 (h!13249 (_ BitVec 64)) (t!18427 List!12208)) )
))
(declare-fun arrayNoDuplicates!0 (array!37770 (_ BitVec 32) List!12208) Bool)

(assert (=> b!624756 (= res!402902 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12205))))

(declare-fun b!624757 () Bool)

(declare-fun res!402906 () Bool)

(assert (=> b!624757 (=> (not res!402906) (not e!358174))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!624757 (= res!402906 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18128 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18128 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624758 () Bool)

(declare-fun res!402908 () Bool)

(assert (=> b!624758 (=> (not res!402908) (not e!358176))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624758 (= res!402908 (and (= (size!18493 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18493 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18493 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624759 () Bool)

(declare-fun res!402905 () Bool)

(assert (=> b!624759 (=> (not res!402905) (not e!358176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624759 (= res!402905 (validKeyInArray!0 (select (arr!18128 a!2986) j!136)))))

(declare-fun b!624760 () Bool)

(assert (=> b!624760 (= e!358174 false)))

(declare-fun lt!289510 () SeekEntryResult!6565)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37770 (_ BitVec 32)) SeekEntryResult!6565)

(assert (=> b!624760 (= lt!289510 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18128 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!402901 () Bool)

(assert (=> start!56376 (=> (not res!402901) (not e!358176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56376 (= res!402901 (validMask!0 mask!3053))))

(assert (=> start!56376 e!358176))

(assert (=> start!56376 true))

(declare-fun array_inv!14011 (array!37770) Bool)

(assert (=> start!56376 (array_inv!14011 a!2986)))

(declare-fun b!624753 () Bool)

(declare-fun res!402904 () Bool)

(assert (=> b!624753 (=> (not res!402904) (not e!358176))))

(assert (=> b!624753 (= res!402904 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56376 res!402901) b!624758))

(assert (= (and b!624758 res!402908) b!624759))

(assert (= (and b!624759 res!402905) b!624753))

(assert (= (and b!624753 res!402904) b!624752))

(assert (= (and b!624752 res!402900) b!624754))

(assert (= (and b!624754 res!402903) b!624755))

(assert (= (and b!624755 res!402907) b!624756))

(assert (= (and b!624756 res!402902) b!624757))

(assert (= (and b!624757 res!402906) b!624760))

(declare-fun m!599845 () Bool)

(assert (=> b!624756 m!599845))

(declare-fun m!599847 () Bool)

(assert (=> b!624760 m!599847))

(assert (=> b!624760 m!599847))

(declare-fun m!599849 () Bool)

(assert (=> b!624760 m!599849))

(declare-fun m!599851 () Bool)

(assert (=> b!624755 m!599851))

(declare-fun m!599853 () Bool)

(assert (=> start!56376 m!599853))

(declare-fun m!599855 () Bool)

(assert (=> start!56376 m!599855))

(declare-fun m!599857 () Bool)

(assert (=> b!624757 m!599857))

(declare-fun m!599859 () Bool)

(assert (=> b!624757 m!599859))

(declare-fun m!599861 () Bool)

(assert (=> b!624757 m!599861))

(assert (=> b!624759 m!599847))

(assert (=> b!624759 m!599847))

(declare-fun m!599863 () Bool)

(assert (=> b!624759 m!599863))

(declare-fun m!599865 () Bool)

(assert (=> b!624754 m!599865))

(declare-fun m!599867 () Bool)

(assert (=> b!624752 m!599867))

(declare-fun m!599869 () Bool)

(assert (=> b!624753 m!599869))

(check-sat (not b!624756) (not b!624755) (not b!624753) (not b!624760) (not b!624752) (not b!624759) (not start!56376) (not b!624754))
(check-sat)
