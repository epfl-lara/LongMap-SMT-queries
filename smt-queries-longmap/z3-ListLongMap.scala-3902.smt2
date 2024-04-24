; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53472 () Bool)

(assert start!53472)

(declare-fun b!581420 () Bool)

(declare-fun res!369139 () Bool)

(declare-fun e!333719 () Bool)

(assert (=> b!581420 (=> (not res!369139) (not e!333719))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581420 (= res!369139 (validKeyInArray!0 k0!1786))))

(declare-fun b!581421 () Bool)

(declare-fun res!369132 () Bool)

(declare-fun e!333720 () Bool)

(assert (=> b!581421 (=> (not res!369132) (not e!333720))))

(declare-datatypes ((array!36318 0))(
  ( (array!36319 (arr!17431 (Array (_ BitVec 32) (_ BitVec 64))) (size!17795 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36318)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36318 (_ BitVec 32)) Bool)

(assert (=> b!581421 (= res!369132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581422 () Bool)

(declare-fun res!369133 () Bool)

(assert (=> b!581422 (=> (not res!369133) (not e!333720))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581422 (= res!369133 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17431 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17431 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!369136 () Bool)

(assert (=> start!53472 (=> (not res!369136) (not e!333719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53472 (= res!369136 (validMask!0 mask!3053))))

(assert (=> start!53472 e!333719))

(assert (=> start!53472 true))

(declare-fun array_inv!13290 (array!36318) Bool)

(assert (=> start!53472 (array_inv!13290 a!2986)))

(declare-fun b!581423 () Bool)

(declare-fun res!369134 () Bool)

(assert (=> b!581423 (=> (not res!369134) (not e!333719))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!581423 (= res!369134 (and (= (size!17795 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17795 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17795 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581424 () Bool)

(declare-fun res!369135 () Bool)

(assert (=> b!581424 (=> (not res!369135) (not e!333719))))

(declare-fun arrayContainsKey!0 (array!36318 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581424 (= res!369135 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581425 () Bool)

(assert (=> b!581425 (= e!333719 e!333720)))

(declare-fun res!369138 () Bool)

(assert (=> b!581425 (=> (not res!369138) (not e!333720))))

(declare-datatypes ((SeekEntryResult!5827 0))(
  ( (MissingZero!5827 (index!25535 (_ BitVec 32))) (Found!5827 (index!25536 (_ BitVec 32))) (Intermediate!5827 (undefined!6639 Bool) (index!25537 (_ BitVec 32)) (x!54555 (_ BitVec 32))) (Undefined!5827) (MissingVacant!5827 (index!25538 (_ BitVec 32))) )
))
(declare-fun lt!264978 () SeekEntryResult!5827)

(assert (=> b!581425 (= res!369138 (or (= lt!264978 (MissingZero!5827 i!1108)) (= lt!264978 (MissingVacant!5827 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36318 (_ BitVec 32)) SeekEntryResult!5827)

(assert (=> b!581425 (= lt!264978 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581426 () Bool)

(declare-fun res!369131 () Bool)

(assert (=> b!581426 (=> (not res!369131) (not e!333719))))

(assert (=> b!581426 (= res!369131 (validKeyInArray!0 (select (arr!17431 a!2986) j!136)))))

(declare-fun b!581427 () Bool)

(declare-fun res!369137 () Bool)

(assert (=> b!581427 (=> (not res!369137) (not e!333720))))

(declare-datatypes ((List!11379 0))(
  ( (Nil!11376) (Cons!11375 (h!12423 (_ BitVec 64)) (t!17599 List!11379)) )
))
(declare-fun arrayNoDuplicates!0 (array!36318 (_ BitVec 32) List!11379) Bool)

(assert (=> b!581427 (= res!369137 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11376))))

(declare-fun b!581428 () Bool)

(assert (=> b!581428 (= e!333720 false)))

(declare-fun lt!264979 () SeekEntryResult!5827)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36318 (_ BitVec 32)) SeekEntryResult!5827)

(assert (=> b!581428 (= lt!264979 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17431 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53472 res!369136) b!581423))

(assert (= (and b!581423 res!369134) b!581426))

(assert (= (and b!581426 res!369131) b!581420))

(assert (= (and b!581420 res!369139) b!581424))

(assert (= (and b!581424 res!369135) b!581425))

(assert (= (and b!581425 res!369138) b!581421))

(assert (= (and b!581421 res!369132) b!581427))

(assert (= (and b!581427 res!369137) b!581422))

(assert (= (and b!581422 res!369133) b!581428))

(declare-fun m!560123 () Bool)

(assert (=> b!581428 m!560123))

(assert (=> b!581428 m!560123))

(declare-fun m!560125 () Bool)

(assert (=> b!581428 m!560125))

(declare-fun m!560127 () Bool)

(assert (=> b!581421 m!560127))

(declare-fun m!560129 () Bool)

(assert (=> start!53472 m!560129))

(declare-fun m!560131 () Bool)

(assert (=> start!53472 m!560131))

(declare-fun m!560133 () Bool)

(assert (=> b!581425 m!560133))

(declare-fun m!560135 () Bool)

(assert (=> b!581424 m!560135))

(declare-fun m!560137 () Bool)

(assert (=> b!581422 m!560137))

(declare-fun m!560139 () Bool)

(assert (=> b!581422 m!560139))

(declare-fun m!560141 () Bool)

(assert (=> b!581422 m!560141))

(declare-fun m!560143 () Bool)

(assert (=> b!581420 m!560143))

(assert (=> b!581426 m!560123))

(assert (=> b!581426 m!560123))

(declare-fun m!560145 () Bool)

(assert (=> b!581426 m!560145))

(declare-fun m!560147 () Bool)

(assert (=> b!581427 m!560147))

(check-sat (not b!581428) (not b!581427) (not b!581424) (not start!53472) (not b!581420) (not b!581425) (not b!581426) (not b!581421))
(check-sat)
