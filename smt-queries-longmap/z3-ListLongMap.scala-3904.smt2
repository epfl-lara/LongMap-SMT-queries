; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53436 () Bool)

(assert start!53436)

(declare-fun b!581418 () Bool)

(declare-fun e!333652 () Bool)

(declare-fun e!333654 () Bool)

(assert (=> b!581418 (= e!333652 e!333654)))

(declare-fun res!369234 () Bool)

(assert (=> b!581418 (=> (not res!369234) (not e!333654))))

(declare-datatypes ((SeekEntryResult!5883 0))(
  ( (MissingZero!5883 (index!25759 (_ BitVec 32))) (Found!5883 (index!25760 (_ BitVec 32))) (Intermediate!5883 (undefined!6695 Bool) (index!25761 (_ BitVec 32)) (x!54624 (_ BitVec 32))) (Undefined!5883) (MissingVacant!5883 (index!25762 (_ BitVec 32))) )
))
(declare-fun lt!264901 () SeekEntryResult!5883)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581418 (= res!369234 (or (= lt!264901 (MissingZero!5883 i!1108)) (= lt!264901 (MissingVacant!5883 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36337 0))(
  ( (array!36338 (arr!17443 (Array (_ BitVec 32) (_ BitVec 64))) (size!17807 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36337)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36337 (_ BitVec 32)) SeekEntryResult!5883)

(assert (=> b!581418 (= lt!264901 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581419 () Bool)

(declare-fun res!369237 () Bool)

(assert (=> b!581419 (=> (not res!369237) (not e!333654))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581419 (= res!369237 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17443 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17443 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581420 () Bool)

(declare-fun res!369238 () Bool)

(assert (=> b!581420 (=> (not res!369238) (not e!333654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36337 (_ BitVec 32)) Bool)

(assert (=> b!581420 (= res!369238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!369236 () Bool)

(assert (=> start!53436 (=> (not res!369236) (not e!333652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53436 (= res!369236 (validMask!0 mask!3053))))

(assert (=> start!53436 e!333652))

(assert (=> start!53436 true))

(declare-fun array_inv!13239 (array!36337) Bool)

(assert (=> start!53436 (array_inv!13239 a!2986)))

(declare-fun b!581421 () Bool)

(declare-fun res!369239 () Bool)

(assert (=> b!581421 (=> (not res!369239) (not e!333652))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!581421 (= res!369239 (and (= (size!17807 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17807 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17807 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581422 () Bool)

(declare-fun res!369240 () Bool)

(assert (=> b!581422 (=> (not res!369240) (not e!333652))))

(declare-fun arrayContainsKey!0 (array!36337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581422 (= res!369240 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581423 () Bool)

(declare-fun res!369241 () Bool)

(assert (=> b!581423 (=> (not res!369241) (not e!333652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581423 (= res!369241 (validKeyInArray!0 k0!1786))))

(declare-fun b!581424 () Bool)

(declare-fun res!369235 () Bool)

(assert (=> b!581424 (=> (not res!369235) (not e!333652))))

(assert (=> b!581424 (= res!369235 (validKeyInArray!0 (select (arr!17443 a!2986) j!136)))))

(declare-fun b!581425 () Bool)

(declare-fun res!369242 () Bool)

(assert (=> b!581425 (=> (not res!369242) (not e!333654))))

(declare-datatypes ((List!11484 0))(
  ( (Nil!11481) (Cons!11480 (h!12525 (_ BitVec 64)) (t!17712 List!11484)) )
))
(declare-fun arrayNoDuplicates!0 (array!36337 (_ BitVec 32) List!11484) Bool)

(assert (=> b!581425 (= res!369242 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11481))))

(declare-fun b!581426 () Bool)

(assert (=> b!581426 (= e!333654 false)))

(declare-fun lt!264900 () SeekEntryResult!5883)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36337 (_ BitVec 32)) SeekEntryResult!5883)

(assert (=> b!581426 (= lt!264900 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17443 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53436 res!369236) b!581421))

(assert (= (and b!581421 res!369239) b!581424))

(assert (= (and b!581424 res!369235) b!581423))

(assert (= (and b!581423 res!369241) b!581422))

(assert (= (and b!581422 res!369240) b!581418))

(assert (= (and b!581418 res!369234) b!581420))

(assert (= (and b!581420 res!369238) b!581425))

(assert (= (and b!581425 res!369242) b!581419))

(assert (= (and b!581419 res!369237) b!581426))

(declare-fun m!559959 () Bool)

(assert (=> b!581423 m!559959))

(declare-fun m!559961 () Bool)

(assert (=> b!581422 m!559961))

(declare-fun m!559963 () Bool)

(assert (=> start!53436 m!559963))

(declare-fun m!559965 () Bool)

(assert (=> start!53436 m!559965))

(declare-fun m!559967 () Bool)

(assert (=> b!581418 m!559967))

(declare-fun m!559969 () Bool)

(assert (=> b!581419 m!559969))

(declare-fun m!559971 () Bool)

(assert (=> b!581419 m!559971))

(declare-fun m!559973 () Bool)

(assert (=> b!581419 m!559973))

(declare-fun m!559975 () Bool)

(assert (=> b!581426 m!559975))

(assert (=> b!581426 m!559975))

(declare-fun m!559977 () Bool)

(assert (=> b!581426 m!559977))

(declare-fun m!559979 () Bool)

(assert (=> b!581425 m!559979))

(assert (=> b!581424 m!559975))

(assert (=> b!581424 m!559975))

(declare-fun m!559981 () Bool)

(assert (=> b!581424 m!559981))

(declare-fun m!559983 () Bool)

(assert (=> b!581420 m!559983))

(check-sat (not b!581426) (not b!581422) (not b!581424) (not start!53436) (not b!581418) (not b!581420) (not b!581423) (not b!581425))
(check-sat)
