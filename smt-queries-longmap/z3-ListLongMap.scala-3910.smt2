; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53472 () Bool)

(assert start!53472)

(declare-fun b!581922 () Bool)

(declare-fun res!369738 () Bool)

(declare-fun e!333815 () Bool)

(assert (=> b!581922 (=> (not res!369738) (not e!333815))))

(declare-datatypes ((array!36373 0))(
  ( (array!36374 (arr!17461 (Array (_ BitVec 32) (_ BitVec 64))) (size!17825 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36373)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36373 (_ BitVec 32)) Bool)

(assert (=> b!581922 (= res!369738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!369742 () Bool)

(declare-fun e!333814 () Bool)

(assert (=> start!53472 (=> (not res!369742) (not e!333814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53472 (= res!369742 (validMask!0 mask!3053))))

(assert (=> start!53472 e!333814))

(assert (=> start!53472 true))

(declare-fun array_inv!13257 (array!36373) Bool)

(assert (=> start!53472 (array_inv!13257 a!2986)))

(declare-fun b!581923 () Bool)

(assert (=> b!581923 (= e!333814 e!333815)))

(declare-fun res!369741 () Bool)

(assert (=> b!581923 (=> (not res!369741) (not e!333815))))

(declare-datatypes ((SeekEntryResult!5901 0))(
  ( (MissingZero!5901 (index!25831 (_ BitVec 32))) (Found!5901 (index!25832 (_ BitVec 32))) (Intermediate!5901 (undefined!6713 Bool) (index!25833 (_ BitVec 32)) (x!54690 (_ BitVec 32))) (Undefined!5901) (MissingVacant!5901 (index!25834 (_ BitVec 32))) )
))
(declare-fun lt!265000 () SeekEntryResult!5901)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581923 (= res!369741 (or (= lt!265000 (MissingZero!5901 i!1108)) (= lt!265000 (MissingVacant!5901 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36373 (_ BitVec 32)) SeekEntryResult!5901)

(assert (=> b!581923 (= lt!265000 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581924 () Bool)

(declare-fun res!369744 () Bool)

(assert (=> b!581924 (=> (not res!369744) (not e!333815))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581924 (= res!369744 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17461 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17461 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581925 () Bool)

(declare-fun res!369743 () Bool)

(assert (=> b!581925 (=> (not res!369743) (not e!333814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581925 (= res!369743 (validKeyInArray!0 k0!1786))))

(declare-fun b!581926 () Bool)

(declare-fun res!369746 () Bool)

(assert (=> b!581926 (=> (not res!369746) (not e!333814))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!581926 (= res!369746 (validKeyInArray!0 (select (arr!17461 a!2986) j!136)))))

(declare-fun b!581927 () Bool)

(declare-fun res!369739 () Bool)

(assert (=> b!581927 (=> (not res!369739) (not e!333814))))

(declare-fun arrayContainsKey!0 (array!36373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581927 (= res!369739 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581928 () Bool)

(assert (=> b!581928 (= e!333815 false)))

(declare-fun lt!264999 () SeekEntryResult!5901)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36373 (_ BitVec 32)) SeekEntryResult!5901)

(assert (=> b!581928 (= lt!264999 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17461 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581929 () Bool)

(declare-fun res!369740 () Bool)

(assert (=> b!581929 (=> (not res!369740) (not e!333815))))

(declare-datatypes ((List!11502 0))(
  ( (Nil!11499) (Cons!11498 (h!12543 (_ BitVec 64)) (t!17730 List!11502)) )
))
(declare-fun arrayNoDuplicates!0 (array!36373 (_ BitVec 32) List!11502) Bool)

(assert (=> b!581929 (= res!369740 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11499))))

(declare-fun b!581930 () Bool)

(declare-fun res!369745 () Bool)

(assert (=> b!581930 (=> (not res!369745) (not e!333814))))

(assert (=> b!581930 (= res!369745 (and (= (size!17825 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17825 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17825 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53472 res!369742) b!581930))

(assert (= (and b!581930 res!369745) b!581926))

(assert (= (and b!581926 res!369746) b!581925))

(assert (= (and b!581925 res!369743) b!581927))

(assert (= (and b!581927 res!369739) b!581923))

(assert (= (and b!581923 res!369741) b!581922))

(assert (= (and b!581922 res!369738) b!581929))

(assert (= (and b!581929 res!369740) b!581924))

(assert (= (and b!581924 res!369744) b!581928))

(declare-fun m!560445 () Bool)

(assert (=> b!581923 m!560445))

(declare-fun m!560447 () Bool)

(assert (=> b!581928 m!560447))

(assert (=> b!581928 m!560447))

(declare-fun m!560449 () Bool)

(assert (=> b!581928 m!560449))

(declare-fun m!560451 () Bool)

(assert (=> b!581929 m!560451))

(declare-fun m!560453 () Bool)

(assert (=> b!581924 m!560453))

(declare-fun m!560455 () Bool)

(assert (=> b!581924 m!560455))

(declare-fun m!560457 () Bool)

(assert (=> b!581924 m!560457))

(declare-fun m!560459 () Bool)

(assert (=> b!581927 m!560459))

(declare-fun m!560461 () Bool)

(assert (=> b!581922 m!560461))

(declare-fun m!560463 () Bool)

(assert (=> start!53472 m!560463))

(declare-fun m!560465 () Bool)

(assert (=> start!53472 m!560465))

(declare-fun m!560467 () Bool)

(assert (=> b!581925 m!560467))

(assert (=> b!581926 m!560447))

(assert (=> b!581926 m!560447))

(declare-fun m!560469 () Bool)

(assert (=> b!581926 m!560469))

(check-sat (not b!581929) (not b!581925) (not b!581923) (not b!581927) (not b!581926) (not b!581922) (not start!53472) (not b!581928))
(check-sat)
