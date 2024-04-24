; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53496 () Bool)

(assert start!53496)

(declare-fun b!581753 () Bool)

(declare-fun e!333828 () Bool)

(assert (=> b!581753 (= e!333828 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5839 0))(
  ( (MissingZero!5839 (index!25583 (_ BitVec 32))) (Found!5839 (index!25584 (_ BitVec 32))) (Intermediate!5839 (undefined!6651 Bool) (index!25585 (_ BitVec 32)) (x!54599 (_ BitVec 32))) (Undefined!5839) (MissingVacant!5839 (index!25586 (_ BitVec 32))) )
))
(declare-fun lt!265042 () SeekEntryResult!5839)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36342 0))(
  ( (array!36343 (arr!17443 (Array (_ BitVec 32) (_ BitVec 64))) (size!17807 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36342)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36342 (_ BitVec 32)) SeekEntryResult!5839)

(assert (=> b!581753 (= lt!265042 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17443 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581754 () Bool)

(declare-fun res!369466 () Bool)

(declare-fun e!333827 () Bool)

(assert (=> b!581754 (=> (not res!369466) (not e!333827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581754 (= res!369466 (validKeyInArray!0 (select (arr!17443 a!2986) j!136)))))

(declare-fun b!581755 () Bool)

(declare-fun res!369471 () Bool)

(assert (=> b!581755 (=> (not res!369471) (not e!333828))))

(declare-datatypes ((List!11391 0))(
  ( (Nil!11388) (Cons!11387 (h!12435 (_ BitVec 64)) (t!17611 List!11391)) )
))
(declare-fun arrayNoDuplicates!0 (array!36342 (_ BitVec 32) List!11391) Bool)

(assert (=> b!581755 (= res!369471 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11388))))

(declare-fun b!581756 () Bool)

(declare-fun res!369467 () Bool)

(assert (=> b!581756 (=> (not res!369467) (not e!333828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36342 (_ BitVec 32)) Bool)

(assert (=> b!581756 (= res!369467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!369464 () Bool)

(assert (=> start!53496 (=> (not res!369464) (not e!333827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53496 (= res!369464 (validMask!0 mask!3053))))

(assert (=> start!53496 e!333827))

(assert (=> start!53496 true))

(declare-fun array_inv!13302 (array!36342) Bool)

(assert (=> start!53496 (array_inv!13302 a!2986)))

(declare-fun b!581757 () Bool)

(assert (=> b!581757 (= e!333827 e!333828)))

(declare-fun res!369472 () Bool)

(assert (=> b!581757 (=> (not res!369472) (not e!333828))))

(declare-fun lt!265041 () SeekEntryResult!5839)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581757 (= res!369472 (or (= lt!265041 (MissingZero!5839 i!1108)) (= lt!265041 (MissingVacant!5839 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36342 (_ BitVec 32)) SeekEntryResult!5839)

(assert (=> b!581757 (= lt!265041 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581758 () Bool)

(declare-fun res!369470 () Bool)

(assert (=> b!581758 (=> (not res!369470) (not e!333828))))

(assert (=> b!581758 (= res!369470 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17443 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17443 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581759 () Bool)

(declare-fun res!369465 () Bool)

(assert (=> b!581759 (=> (not res!369465) (not e!333827))))

(declare-fun arrayContainsKey!0 (array!36342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581759 (= res!369465 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581760 () Bool)

(declare-fun res!369469 () Bool)

(assert (=> b!581760 (=> (not res!369469) (not e!333827))))

(assert (=> b!581760 (= res!369469 (and (= (size!17807 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17807 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17807 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581761 () Bool)

(declare-fun res!369468 () Bool)

(assert (=> b!581761 (=> (not res!369468) (not e!333827))))

(assert (=> b!581761 (= res!369468 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53496 res!369464) b!581760))

(assert (= (and b!581760 res!369469) b!581754))

(assert (= (and b!581754 res!369466) b!581761))

(assert (= (and b!581761 res!369468) b!581759))

(assert (= (and b!581759 res!369465) b!581757))

(assert (= (and b!581757 res!369472) b!581756))

(assert (= (and b!581756 res!369467) b!581755))

(assert (= (and b!581755 res!369471) b!581758))

(assert (= (and b!581758 res!369470) b!581753))

(declare-fun m!560441 () Bool)

(assert (=> b!581759 m!560441))

(declare-fun m!560443 () Bool)

(assert (=> b!581755 m!560443))

(declare-fun m!560445 () Bool)

(assert (=> b!581753 m!560445))

(assert (=> b!581753 m!560445))

(declare-fun m!560447 () Bool)

(assert (=> b!581753 m!560447))

(declare-fun m!560449 () Bool)

(assert (=> start!53496 m!560449))

(declare-fun m!560451 () Bool)

(assert (=> start!53496 m!560451))

(assert (=> b!581754 m!560445))

(assert (=> b!581754 m!560445))

(declare-fun m!560453 () Bool)

(assert (=> b!581754 m!560453))

(declare-fun m!560455 () Bool)

(assert (=> b!581757 m!560455))

(declare-fun m!560457 () Bool)

(assert (=> b!581758 m!560457))

(declare-fun m!560459 () Bool)

(assert (=> b!581758 m!560459))

(declare-fun m!560461 () Bool)

(assert (=> b!581758 m!560461))

(declare-fun m!560463 () Bool)

(assert (=> b!581761 m!560463))

(declare-fun m!560465 () Bool)

(assert (=> b!581756 m!560465))

(check-sat (not b!581754) (not b!581753) (not b!581757) (not b!581761) (not b!581755) (not start!53496) (not b!581756) (not b!581759))
(check-sat)
