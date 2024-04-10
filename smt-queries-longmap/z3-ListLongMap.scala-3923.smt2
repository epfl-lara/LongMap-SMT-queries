; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53550 () Bool)

(assert start!53550)

(declare-fun b!582975 () Bool)

(declare-fun res!370797 () Bool)

(declare-fun e!334165 () Bool)

(assert (=> b!582975 (=> (not res!370797) (not e!334165))))

(declare-datatypes ((array!36451 0))(
  ( (array!36452 (arr!17500 (Array (_ BitVec 32) (_ BitVec 64))) (size!17864 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36451)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582975 (= res!370797 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!370795 () Bool)

(assert (=> start!53550 (=> (not res!370795) (not e!334165))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53550 (= res!370795 (validMask!0 mask!3053))))

(assert (=> start!53550 e!334165))

(assert (=> start!53550 true))

(declare-fun array_inv!13296 (array!36451) Bool)

(assert (=> start!53550 (array_inv!13296 a!2986)))

(declare-fun b!582976 () Bool)

(declare-fun res!370796 () Bool)

(declare-fun e!334166 () Bool)

(assert (=> b!582976 (=> (not res!370796) (not e!334166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36451 (_ BitVec 32)) Bool)

(assert (=> b!582976 (= res!370796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582977 () Bool)

(assert (=> b!582977 (= e!334165 e!334166)))

(declare-fun res!370791 () Bool)

(assert (=> b!582977 (=> (not res!370791) (not e!334166))))

(declare-datatypes ((SeekEntryResult!5940 0))(
  ( (MissingZero!5940 (index!25987 (_ BitVec 32))) (Found!5940 (index!25988 (_ BitVec 32))) (Intermediate!5940 (undefined!6752 Bool) (index!25989 (_ BitVec 32)) (x!54833 (_ BitVec 32))) (Undefined!5940) (MissingVacant!5940 (index!25990 (_ BitVec 32))) )
))
(declare-fun lt!265233 () SeekEntryResult!5940)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582977 (= res!370791 (or (= lt!265233 (MissingZero!5940 i!1108)) (= lt!265233 (MissingVacant!5940 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36451 (_ BitVec 32)) SeekEntryResult!5940)

(assert (=> b!582977 (= lt!265233 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582978 () Bool)

(declare-fun res!370794 () Bool)

(assert (=> b!582978 (=> (not res!370794) (not e!334165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582978 (= res!370794 (validKeyInArray!0 k0!1786))))

(declare-fun b!582979 () Bool)

(assert (=> b!582979 (= e!334166 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265234 () SeekEntryResult!5940)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36451 (_ BitVec 32)) SeekEntryResult!5940)

(assert (=> b!582979 (= lt!265234 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17500 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582980 () Bool)

(declare-fun res!370792 () Bool)

(assert (=> b!582980 (=> (not res!370792) (not e!334165))))

(assert (=> b!582980 (= res!370792 (validKeyInArray!0 (select (arr!17500 a!2986) j!136)))))

(declare-fun b!582981 () Bool)

(declare-fun res!370799 () Bool)

(assert (=> b!582981 (=> (not res!370799) (not e!334166))))

(assert (=> b!582981 (= res!370799 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17500 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17500 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582982 () Bool)

(declare-fun res!370793 () Bool)

(assert (=> b!582982 (=> (not res!370793) (not e!334166))))

(declare-datatypes ((List!11541 0))(
  ( (Nil!11538) (Cons!11537 (h!12582 (_ BitVec 64)) (t!17769 List!11541)) )
))
(declare-fun arrayNoDuplicates!0 (array!36451 (_ BitVec 32) List!11541) Bool)

(assert (=> b!582982 (= res!370793 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11538))))

(declare-fun b!582983 () Bool)

(declare-fun res!370798 () Bool)

(assert (=> b!582983 (=> (not res!370798) (not e!334165))))

(assert (=> b!582983 (= res!370798 (and (= (size!17864 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17864 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17864 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53550 res!370795) b!582983))

(assert (= (and b!582983 res!370798) b!582980))

(assert (= (and b!582980 res!370792) b!582978))

(assert (= (and b!582978 res!370794) b!582975))

(assert (= (and b!582975 res!370797) b!582977))

(assert (= (and b!582977 res!370791) b!582976))

(assert (= (and b!582976 res!370796) b!582982))

(assert (= (and b!582982 res!370793) b!582981))

(assert (= (and b!582981 res!370799) b!582979))

(declare-fun m!561459 () Bool)

(assert (=> b!582977 m!561459))

(declare-fun m!561461 () Bool)

(assert (=> b!582981 m!561461))

(declare-fun m!561463 () Bool)

(assert (=> b!582981 m!561463))

(declare-fun m!561465 () Bool)

(assert (=> b!582981 m!561465))

(declare-fun m!561467 () Bool)

(assert (=> b!582978 m!561467))

(declare-fun m!561469 () Bool)

(assert (=> start!53550 m!561469))

(declare-fun m!561471 () Bool)

(assert (=> start!53550 m!561471))

(declare-fun m!561473 () Bool)

(assert (=> b!582975 m!561473))

(declare-fun m!561475 () Bool)

(assert (=> b!582980 m!561475))

(assert (=> b!582980 m!561475))

(declare-fun m!561477 () Bool)

(assert (=> b!582980 m!561477))

(declare-fun m!561479 () Bool)

(assert (=> b!582976 m!561479))

(assert (=> b!582979 m!561475))

(assert (=> b!582979 m!561475))

(declare-fun m!561481 () Bool)

(assert (=> b!582979 m!561481))

(declare-fun m!561483 () Bool)

(assert (=> b!582982 m!561483))

(check-sat (not b!582976) (not b!582979) (not b!582977) (not b!582982) (not b!582978) (not start!53550) (not b!582980) (not b!582975))
