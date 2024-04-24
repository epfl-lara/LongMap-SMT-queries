; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53292 () Bool)

(assert start!53292)

(declare-fun res!366699 () Bool)

(declare-fun e!332909 () Bool)

(assert (=> start!53292 (=> (not res!366699) (not e!332909))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53292 (= res!366699 (validMask!0 mask!3053))))

(assert (=> start!53292 e!332909))

(assert (=> start!53292 true))

(declare-datatypes ((array!36138 0))(
  ( (array!36139 (arr!17341 (Array (_ BitVec 32) (_ BitVec 64))) (size!17705 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36138)

(declare-fun array_inv!13200 (array!36138) Bool)

(assert (=> start!53292 (array_inv!13200 a!2986)))

(declare-fun b!578981 () Bool)

(declare-fun res!366697 () Bool)

(declare-fun e!332908 () Bool)

(assert (=> b!578981 (=> (not res!366697) (not e!332908))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!578981 (= res!366697 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17341 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17341 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!578982 () Bool)

(declare-fun res!366696 () Bool)

(assert (=> b!578982 (=> (not res!366696) (not e!332909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578982 (= res!366696 (validKeyInArray!0 k0!1786))))

(declare-fun b!578983 () Bool)

(assert (=> b!578983 (= e!332909 e!332908)))

(declare-fun res!366698 () Bool)

(assert (=> b!578983 (=> (not res!366698) (not e!332908))))

(declare-datatypes ((SeekEntryResult!5737 0))(
  ( (MissingZero!5737 (index!25175 (_ BitVec 32))) (Found!5737 (index!25176 (_ BitVec 32))) (Intermediate!5737 (undefined!6549 Bool) (index!25177 (_ BitVec 32)) (x!54225 (_ BitVec 32))) (Undefined!5737) (MissingVacant!5737 (index!25178 (_ BitVec 32))) )
))
(declare-fun lt!264448 () SeekEntryResult!5737)

(assert (=> b!578983 (= res!366698 (or (= lt!264448 (MissingZero!5737 i!1108)) (= lt!264448 (MissingVacant!5737 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36138 (_ BitVec 32)) SeekEntryResult!5737)

(assert (=> b!578983 (= lt!264448 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!578984 () Bool)

(declare-fun res!366694 () Bool)

(assert (=> b!578984 (=> (not res!366694) (not e!332908))))

(declare-datatypes ((List!11289 0))(
  ( (Nil!11286) (Cons!11285 (h!12333 (_ BitVec 64)) (t!17509 List!11289)) )
))
(declare-fun arrayNoDuplicates!0 (array!36138 (_ BitVec 32) List!11289) Bool)

(assert (=> b!578984 (= res!366694 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11286))))

(declare-fun b!578985 () Bool)

(declare-fun res!366695 () Bool)

(assert (=> b!578985 (=> (not res!366695) (not e!332909))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!578985 (= res!366695 (and (= (size!17705 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17705 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17705 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578986 () Bool)

(assert (=> b!578986 (= e!332908 false)))

(declare-fun lt!264447 () SeekEntryResult!5737)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36138 (_ BitVec 32)) SeekEntryResult!5737)

(assert (=> b!578986 (= lt!264447 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17341 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!578987 () Bool)

(declare-fun res!366700 () Bool)

(assert (=> b!578987 (=> (not res!366700) (not e!332909))))

(declare-fun arrayContainsKey!0 (array!36138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578987 (= res!366700 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578988 () Bool)

(declare-fun res!366693 () Bool)

(assert (=> b!578988 (=> (not res!366693) (not e!332908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36138 (_ BitVec 32)) Bool)

(assert (=> b!578988 (= res!366693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578989 () Bool)

(declare-fun res!366692 () Bool)

(assert (=> b!578989 (=> (not res!366692) (not e!332909))))

(assert (=> b!578989 (= res!366692 (validKeyInArray!0 (select (arr!17341 a!2986) j!136)))))

(assert (= (and start!53292 res!366699) b!578985))

(assert (= (and b!578985 res!366695) b!578989))

(assert (= (and b!578989 res!366692) b!578982))

(assert (= (and b!578982 res!366696) b!578987))

(assert (= (and b!578987 res!366700) b!578983))

(assert (= (and b!578983 res!366698) b!578988))

(assert (= (and b!578988 res!366693) b!578984))

(assert (= (and b!578984 res!366694) b!578981))

(assert (= (and b!578981 res!366697) b!578986))

(declare-fun m!557777 () Bool)

(assert (=> b!578987 m!557777))

(declare-fun m!557779 () Bool)

(assert (=> b!578988 m!557779))

(declare-fun m!557781 () Bool)

(assert (=> start!53292 m!557781))

(declare-fun m!557783 () Bool)

(assert (=> start!53292 m!557783))

(declare-fun m!557785 () Bool)

(assert (=> b!578984 m!557785))

(declare-fun m!557787 () Bool)

(assert (=> b!578983 m!557787))

(declare-fun m!557789 () Bool)

(assert (=> b!578981 m!557789))

(declare-fun m!557791 () Bool)

(assert (=> b!578981 m!557791))

(declare-fun m!557793 () Bool)

(assert (=> b!578981 m!557793))

(declare-fun m!557795 () Bool)

(assert (=> b!578986 m!557795))

(assert (=> b!578986 m!557795))

(declare-fun m!557797 () Bool)

(assert (=> b!578986 m!557797))

(declare-fun m!557799 () Bool)

(assert (=> b!578982 m!557799))

(assert (=> b!578989 m!557795))

(assert (=> b!578989 m!557795))

(declare-fun m!557801 () Bool)

(assert (=> b!578989 m!557801))

(check-sat (not b!578987) (not b!578984) (not b!578983) (not b!578988) (not b!578989) (not b!578982) (not start!53292) (not b!578986))
(check-sat)
