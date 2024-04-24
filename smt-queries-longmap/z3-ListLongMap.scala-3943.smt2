; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53718 () Bool)

(assert start!53718)

(declare-fun b!585143 () Bool)

(declare-fun res!372855 () Bool)

(declare-fun e!334945 () Bool)

(assert (=> b!585143 (=> (not res!372855) (not e!334945))))

(declare-datatypes ((array!36564 0))(
  ( (array!36565 (arr!17554 (Array (_ BitVec 32) (_ BitVec 64))) (size!17918 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36564)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36564 (_ BitVec 32)) Bool)

(assert (=> b!585143 (= res!372855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585144 () Bool)

(declare-fun res!372861 () Bool)

(declare-fun e!334944 () Bool)

(assert (=> b!585144 (=> (not res!372861) (not e!334944))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585144 (= res!372861 (and (= (size!17918 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17918 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17918 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!585145 () Bool)

(declare-fun res!372858 () Bool)

(assert (=> b!585145 (=> (not res!372858) (not e!334945))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!585145 (= res!372858 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17554 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17554 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585146 () Bool)

(declare-fun res!372865 () Bool)

(assert (=> b!585146 (=> (not res!372865) (not e!334945))))

(declare-datatypes ((List!11502 0))(
  ( (Nil!11499) (Cons!11498 (h!12546 (_ BitVec 64)) (t!17722 List!11502)) )
))
(declare-fun arrayNoDuplicates!0 (array!36564 (_ BitVec 32) List!11502) Bool)

(assert (=> b!585146 (= res!372865 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11499))))

(declare-fun b!585147 () Bool)

(declare-fun res!372864 () Bool)

(assert (=> b!585147 (=> (not res!372864) (not e!334944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585147 (= res!372864 (validKeyInArray!0 (select (arr!17554 a!2986) j!136)))))

(declare-fun b!585148 () Bool)

(declare-fun e!334946 () Bool)

(assert (=> b!585148 (= e!334946 false)))

(declare-fun lt!265800 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5950 0))(
  ( (MissingZero!5950 (index!26027 (_ BitVec 32))) (Found!5950 (index!26028 (_ BitVec 32))) (Intermediate!5950 (undefined!6762 Bool) (index!26029 (_ BitVec 32)) (x!55006 (_ BitVec 32))) (Undefined!5950) (MissingVacant!5950 (index!26030 (_ BitVec 32))) )
))
(declare-fun lt!265801 () SeekEntryResult!5950)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36564 (_ BitVec 32)) SeekEntryResult!5950)

(assert (=> b!585148 (= lt!265801 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265800 vacantSpotIndex!68 (select (arr!17554 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585149 () Bool)

(assert (=> b!585149 (= e!334944 e!334945)))

(declare-fun res!372854 () Bool)

(assert (=> b!585149 (=> (not res!372854) (not e!334945))))

(declare-fun lt!265799 () SeekEntryResult!5950)

(assert (=> b!585149 (= res!372854 (or (= lt!265799 (MissingZero!5950 i!1108)) (= lt!265799 (MissingVacant!5950 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36564 (_ BitVec 32)) SeekEntryResult!5950)

(assert (=> b!585149 (= lt!265799 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!585150 () Bool)

(declare-fun res!372863 () Bool)

(assert (=> b!585150 (=> (not res!372863) (not e!334945))))

(assert (=> b!585150 (= res!372863 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17554 a!2986) j!136) a!2986 mask!3053) (Found!5950 j!136)))))

(declare-fun b!585151 () Bool)

(assert (=> b!585151 (= e!334945 e!334946)))

(declare-fun res!372860 () Bool)

(assert (=> b!585151 (=> (not res!372860) (not e!334946))))

(assert (=> b!585151 (= res!372860 (and (bvsge lt!265800 #b00000000000000000000000000000000) (bvslt lt!265800 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585151 (= lt!265800 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!585152 () Bool)

(declare-fun res!372856 () Bool)

(assert (=> b!585152 (=> (not res!372856) (not e!334945))))

(assert (=> b!585152 (= res!372856 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17554 a!2986) index!984) (select (arr!17554 a!2986) j!136))) (not (= (select (arr!17554 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585154 () Bool)

(declare-fun res!372859 () Bool)

(assert (=> b!585154 (=> (not res!372859) (not e!334944))))

(declare-fun arrayContainsKey!0 (array!36564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585154 (= res!372859 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!372862 () Bool)

(assert (=> start!53718 (=> (not res!372862) (not e!334944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53718 (= res!372862 (validMask!0 mask!3053))))

(assert (=> start!53718 e!334944))

(assert (=> start!53718 true))

(declare-fun array_inv!13413 (array!36564) Bool)

(assert (=> start!53718 (array_inv!13413 a!2986)))

(declare-fun b!585153 () Bool)

(declare-fun res!372857 () Bool)

(assert (=> b!585153 (=> (not res!372857) (not e!334944))))

(assert (=> b!585153 (= res!372857 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53718 res!372862) b!585144))

(assert (= (and b!585144 res!372861) b!585147))

(assert (= (and b!585147 res!372864) b!585153))

(assert (= (and b!585153 res!372857) b!585154))

(assert (= (and b!585154 res!372859) b!585149))

(assert (= (and b!585149 res!372854) b!585143))

(assert (= (and b!585143 res!372855) b!585146))

(assert (= (and b!585146 res!372865) b!585145))

(assert (= (and b!585145 res!372858) b!585150))

(assert (= (and b!585150 res!372863) b!585152))

(assert (= (and b!585152 res!372856) b!585151))

(assert (= (and b!585151 res!372860) b!585148))

(declare-fun m!563591 () Bool)

(assert (=> b!585150 m!563591))

(assert (=> b!585150 m!563591))

(declare-fun m!563593 () Bool)

(assert (=> b!585150 m!563593))

(assert (=> b!585148 m!563591))

(assert (=> b!585148 m!563591))

(declare-fun m!563595 () Bool)

(assert (=> b!585148 m!563595))

(declare-fun m!563597 () Bool)

(assert (=> b!585145 m!563597))

(declare-fun m!563599 () Bool)

(assert (=> b!585145 m!563599))

(declare-fun m!563601 () Bool)

(assert (=> b!585145 m!563601))

(declare-fun m!563603 () Bool)

(assert (=> b!585154 m!563603))

(declare-fun m!563605 () Bool)

(assert (=> b!585152 m!563605))

(assert (=> b!585152 m!563591))

(declare-fun m!563607 () Bool)

(assert (=> start!53718 m!563607))

(declare-fun m!563609 () Bool)

(assert (=> start!53718 m!563609))

(assert (=> b!585147 m!563591))

(assert (=> b!585147 m!563591))

(declare-fun m!563611 () Bool)

(assert (=> b!585147 m!563611))

(declare-fun m!563613 () Bool)

(assert (=> b!585149 m!563613))

(declare-fun m!563615 () Bool)

(assert (=> b!585153 m!563615))

(declare-fun m!563617 () Bool)

(assert (=> b!585146 m!563617))

(declare-fun m!563619 () Bool)

(assert (=> b!585143 m!563619))

(declare-fun m!563621 () Bool)

(assert (=> b!585151 m!563621))

(check-sat (not b!585153) (not b!585154) (not b!585146) (not b!585151) (not b!585149) (not start!53718) (not b!585147) (not b!585143) (not b!585148) (not b!585150))
(check-sat)
