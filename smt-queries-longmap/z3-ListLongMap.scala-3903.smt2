; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53430 () Bool)

(assert start!53430)

(declare-fun b!581333 () Bool)

(declare-fun res!369157 () Bool)

(declare-fun e!333626 () Bool)

(assert (=> b!581333 (=> (not res!369157) (not e!333626))))

(declare-datatypes ((array!36331 0))(
  ( (array!36332 (arr!17440 (Array (_ BitVec 32) (_ BitVec 64))) (size!17804 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36331)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36331 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581333 (= res!369157 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581334 () Bool)

(declare-fun res!369154 () Bool)

(assert (=> b!581334 (=> (not res!369154) (not e!333626))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581334 (= res!369154 (validKeyInArray!0 (select (arr!17440 a!2986) j!136)))))

(declare-fun b!581335 () Bool)

(declare-fun res!369158 () Bool)

(declare-fun e!333627 () Bool)

(assert (=> b!581335 (=> (not res!369158) (not e!333627))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36331 (_ BitVec 32)) Bool)

(assert (=> b!581335 (= res!369158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581336 () Bool)

(assert (=> b!581336 (= e!333626 e!333627)))

(declare-fun res!369152 () Bool)

(assert (=> b!581336 (=> (not res!369152) (not e!333627))))

(declare-datatypes ((SeekEntryResult!5880 0))(
  ( (MissingZero!5880 (index!25747 (_ BitVec 32))) (Found!5880 (index!25748 (_ BitVec 32))) (Intermediate!5880 (undefined!6692 Bool) (index!25749 (_ BitVec 32)) (x!54613 (_ BitVec 32))) (Undefined!5880) (MissingVacant!5880 (index!25750 (_ BitVec 32))) )
))
(declare-fun lt!264886 () SeekEntryResult!5880)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581336 (= res!369152 (or (= lt!264886 (MissingZero!5880 i!1108)) (= lt!264886 (MissingVacant!5880 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36331 (_ BitVec 32)) SeekEntryResult!5880)

(assert (=> b!581336 (= lt!264886 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581337 () Bool)

(declare-fun res!369156 () Bool)

(assert (=> b!581337 (=> (not res!369156) (not e!333627))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36331 (_ BitVec 32)) SeekEntryResult!5880)

(assert (=> b!581337 (= res!369156 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17440 a!2986) j!136) a!2986 mask!3053) (Found!5880 j!136)))))

(declare-fun res!369149 () Bool)

(assert (=> start!53430 (=> (not res!369149) (not e!333626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53430 (= res!369149 (validMask!0 mask!3053))))

(assert (=> start!53430 e!333626))

(assert (=> start!53430 true))

(declare-fun array_inv!13236 (array!36331) Bool)

(assert (=> start!53430 (array_inv!13236 a!2986)))

(declare-fun b!581338 () Bool)

(declare-fun res!369150 () Bool)

(assert (=> b!581338 (=> (not res!369150) (not e!333626))))

(assert (=> b!581338 (= res!369150 (and (= (size!17804 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17804 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17804 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581339 () Bool)

(declare-fun res!369153 () Bool)

(assert (=> b!581339 (=> (not res!369153) (not e!333626))))

(assert (=> b!581339 (= res!369153 (validKeyInArray!0 k0!1786))))

(declare-fun b!581340 () Bool)

(declare-fun res!369151 () Bool)

(assert (=> b!581340 (=> (not res!369151) (not e!333627))))

(assert (=> b!581340 (= res!369151 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17440 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17440 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581341 () Bool)

(declare-fun res!369155 () Bool)

(assert (=> b!581341 (=> (not res!369155) (not e!333627))))

(declare-datatypes ((List!11481 0))(
  ( (Nil!11478) (Cons!11477 (h!12522 (_ BitVec 64)) (t!17709 List!11481)) )
))
(declare-fun arrayNoDuplicates!0 (array!36331 (_ BitVec 32) List!11481) Bool)

(assert (=> b!581341 (= res!369155 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11478))))

(declare-fun b!581342 () Bool)

(assert (=> b!581342 (= e!333627 (and (bvslt x!910 #b01111111111111111111111111111110) (= (select (arr!17440 a!2986) index!984) (select (arr!17440 a!2986) j!136)) (= index!984 j!136) (bvslt mask!3053 #b00000000000000000000000000000000)))))

(assert (= (and start!53430 res!369149) b!581338))

(assert (= (and b!581338 res!369150) b!581334))

(assert (= (and b!581334 res!369154) b!581339))

(assert (= (and b!581339 res!369153) b!581333))

(assert (= (and b!581333 res!369157) b!581336))

(assert (= (and b!581336 res!369152) b!581335))

(assert (= (and b!581335 res!369158) b!581341))

(assert (= (and b!581341 res!369155) b!581340))

(assert (= (and b!581340 res!369151) b!581337))

(assert (= (and b!581337 res!369156) b!581342))

(declare-fun m!559877 () Bool)

(assert (=> b!581341 m!559877))

(declare-fun m!559879 () Bool)

(assert (=> b!581342 m!559879))

(declare-fun m!559881 () Bool)

(assert (=> b!581342 m!559881))

(declare-fun m!559883 () Bool)

(assert (=> b!581336 m!559883))

(declare-fun m!559885 () Bool)

(assert (=> b!581335 m!559885))

(declare-fun m!559887 () Bool)

(assert (=> b!581333 m!559887))

(declare-fun m!559889 () Bool)

(assert (=> start!53430 m!559889))

(declare-fun m!559891 () Bool)

(assert (=> start!53430 m!559891))

(declare-fun m!559893 () Bool)

(assert (=> b!581340 m!559893))

(declare-fun m!559895 () Bool)

(assert (=> b!581340 m!559895))

(declare-fun m!559897 () Bool)

(assert (=> b!581340 m!559897))

(assert (=> b!581334 m!559881))

(assert (=> b!581334 m!559881))

(declare-fun m!559899 () Bool)

(assert (=> b!581334 m!559899))

(assert (=> b!581337 m!559881))

(assert (=> b!581337 m!559881))

(declare-fun m!559901 () Bool)

(assert (=> b!581337 m!559901))

(declare-fun m!559903 () Bool)

(assert (=> b!581339 m!559903))

(check-sat (not b!581334) (not b!581337) (not b!581341) (not b!581336) (not b!581335) (not b!581333) (not b!581339) (not start!53430))
(check-sat)
