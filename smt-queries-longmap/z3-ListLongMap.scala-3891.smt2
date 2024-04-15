; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53340 () Bool)

(assert start!53340)

(declare-fun b!580049 () Bool)

(declare-fun e!333118 () Bool)

(assert (=> b!580049 (= e!333118 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5839 0))(
  ( (MissingZero!5839 (index!25583 (_ BitVec 32))) (Found!5839 (index!25584 (_ BitVec 32))) (Intermediate!5839 (undefined!6651 Bool) (index!25585 (_ BitVec 32)) (x!54471 (_ BitVec 32))) (Undefined!5839) (MissingVacant!5839 (index!25586 (_ BitVec 32))) )
))
(declare-fun lt!264445 () SeekEntryResult!5839)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36255 0))(
  ( (array!36256 (arr!17402 (Array (_ BitVec 32) (_ BitVec 64))) (size!17767 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36255)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36255 (_ BitVec 32)) SeekEntryResult!5839)

(assert (=> b!580049 (= lt!264445 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17402 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580050 () Bool)

(declare-fun res!368014 () Bool)

(assert (=> b!580050 (=> (not res!368014) (not e!333118))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!580050 (= res!368014 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17402 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17402 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580051 () Bool)

(declare-fun res!368009 () Bool)

(declare-fun e!333120 () Bool)

(assert (=> b!580051 (=> (not res!368009) (not e!333120))))

(assert (=> b!580051 (= res!368009 (and (= (size!17767 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17767 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17767 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580052 () Bool)

(assert (=> b!580052 (= e!333120 e!333118)))

(declare-fun res!368012 () Bool)

(assert (=> b!580052 (=> (not res!368012) (not e!333118))))

(declare-fun lt!264444 () SeekEntryResult!5839)

(assert (=> b!580052 (= res!368012 (or (= lt!264444 (MissingZero!5839 i!1108)) (= lt!264444 (MissingVacant!5839 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36255 (_ BitVec 32)) SeekEntryResult!5839)

(assert (=> b!580052 (= lt!264444 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580053 () Bool)

(declare-fun res!368013 () Bool)

(assert (=> b!580053 (=> (not res!368013) (not e!333120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580053 (= res!368013 (validKeyInArray!0 (select (arr!17402 a!2986) j!136)))))

(declare-fun b!580054 () Bool)

(declare-fun res!368015 () Bool)

(assert (=> b!580054 (=> (not res!368015) (not e!333118))))

(declare-datatypes ((List!11482 0))(
  ( (Nil!11479) (Cons!11478 (h!12523 (_ BitVec 64)) (t!17701 List!11482)) )
))
(declare-fun arrayNoDuplicates!0 (array!36255 (_ BitVec 32) List!11482) Bool)

(assert (=> b!580054 (= res!368015 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11479))))

(declare-fun b!580055 () Bool)

(declare-fun res!368007 () Bool)

(assert (=> b!580055 (=> (not res!368007) (not e!333120))))

(declare-fun arrayContainsKey!0 (array!36255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580055 (= res!368007 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580056 () Bool)

(declare-fun res!368011 () Bool)

(assert (=> b!580056 (=> (not res!368011) (not e!333120))))

(assert (=> b!580056 (= res!368011 (validKeyInArray!0 k0!1786))))

(declare-fun res!368010 () Bool)

(assert (=> start!53340 (=> (not res!368010) (not e!333120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53340 (= res!368010 (validMask!0 mask!3053))))

(assert (=> start!53340 e!333120))

(assert (=> start!53340 true))

(declare-fun array_inv!13285 (array!36255) Bool)

(assert (=> start!53340 (array_inv!13285 a!2986)))

(declare-fun b!580057 () Bool)

(declare-fun res!368008 () Bool)

(assert (=> b!580057 (=> (not res!368008) (not e!333118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36255 (_ BitVec 32)) Bool)

(assert (=> b!580057 (= res!368008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53340 res!368010) b!580051))

(assert (= (and b!580051 res!368009) b!580053))

(assert (= (and b!580053 res!368013) b!580056))

(assert (= (and b!580056 res!368011) b!580055))

(assert (= (and b!580055 res!368007) b!580052))

(assert (= (and b!580052 res!368012) b!580057))

(assert (= (and b!580057 res!368008) b!580054))

(assert (= (and b!580054 res!368015) b!580050))

(assert (= (and b!580050 res!368014) b!580049))

(declare-fun m!558121 () Bool)

(assert (=> b!580056 m!558121))

(declare-fun m!558123 () Bool)

(assert (=> b!580052 m!558123))

(declare-fun m!558125 () Bool)

(assert (=> start!53340 m!558125))

(declare-fun m!558127 () Bool)

(assert (=> start!53340 m!558127))

(declare-fun m!558129 () Bool)

(assert (=> b!580054 m!558129))

(declare-fun m!558131 () Bool)

(assert (=> b!580049 m!558131))

(assert (=> b!580049 m!558131))

(declare-fun m!558133 () Bool)

(assert (=> b!580049 m!558133))

(assert (=> b!580053 m!558131))

(assert (=> b!580053 m!558131))

(declare-fun m!558135 () Bool)

(assert (=> b!580053 m!558135))

(declare-fun m!558137 () Bool)

(assert (=> b!580057 m!558137))

(declare-fun m!558139 () Bool)

(assert (=> b!580050 m!558139))

(declare-fun m!558141 () Bool)

(assert (=> b!580050 m!558141))

(declare-fun m!558143 () Bool)

(assert (=> b!580050 m!558143))

(declare-fun m!558145 () Bool)

(assert (=> b!580055 m!558145))

(check-sat (not b!580052) (not b!580055) (not b!580049) (not b!580056) (not b!580054) (not b!580057) (not start!53340) (not b!580053))
(check-sat)
