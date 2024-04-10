; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53448 () Bool)

(assert start!53448)

(declare-fun b!581580 () Bool)

(declare-fun e!333706 () Bool)

(declare-fun e!333707 () Bool)

(assert (=> b!581580 (= e!333706 e!333707)))

(declare-fun res!369402 () Bool)

(assert (=> b!581580 (=> (not res!369402) (not e!333707))))

(declare-datatypes ((SeekEntryResult!5889 0))(
  ( (MissingZero!5889 (index!25783 (_ BitVec 32))) (Found!5889 (index!25784 (_ BitVec 32))) (Intermediate!5889 (undefined!6701 Bool) (index!25785 (_ BitVec 32)) (x!54646 (_ BitVec 32))) (Undefined!5889) (MissingVacant!5889 (index!25786 (_ BitVec 32))) )
))
(declare-fun lt!264937 () SeekEntryResult!5889)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581580 (= res!369402 (or (= lt!264937 (MissingZero!5889 i!1108)) (= lt!264937 (MissingVacant!5889 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!36349 0))(
  ( (array!36350 (arr!17449 (Array (_ BitVec 32) (_ BitVec 64))) (size!17813 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36349)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36349 (_ BitVec 32)) SeekEntryResult!5889)

(assert (=> b!581580 (= lt!264937 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581581 () Bool)

(declare-fun res!369403 () Bool)

(assert (=> b!581581 (=> (not res!369403) (not e!333707))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581581 (= res!369403 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17449 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17449 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581582 () Bool)

(declare-fun res!369398 () Bool)

(assert (=> b!581582 (=> (not res!369398) (not e!333706))))

(declare-fun arrayContainsKey!0 (array!36349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581582 (= res!369398 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581583 () Bool)

(declare-fun res!369400 () Bool)

(assert (=> b!581583 (=> (not res!369400) (not e!333706))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!581583 (= res!369400 (and (= (size!17813 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17813 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17813 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581584 () Bool)

(assert (=> b!581584 (= e!333707 false)))

(declare-fun lt!264936 () SeekEntryResult!5889)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36349 (_ BitVec 32)) SeekEntryResult!5889)

(assert (=> b!581584 (= lt!264936 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17449 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!369399 () Bool)

(assert (=> start!53448 (=> (not res!369399) (not e!333706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53448 (= res!369399 (validMask!0 mask!3053))))

(assert (=> start!53448 e!333706))

(assert (=> start!53448 true))

(declare-fun array_inv!13245 (array!36349) Bool)

(assert (=> start!53448 (array_inv!13245 a!2986)))

(declare-fun b!581585 () Bool)

(declare-fun res!369404 () Bool)

(assert (=> b!581585 (=> (not res!369404) (not e!333706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581585 (= res!369404 (validKeyInArray!0 k0!1786))))

(declare-fun b!581586 () Bool)

(declare-fun res!369397 () Bool)

(assert (=> b!581586 (=> (not res!369397) (not e!333707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36349 (_ BitVec 32)) Bool)

(assert (=> b!581586 (= res!369397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581587 () Bool)

(declare-fun res!369396 () Bool)

(assert (=> b!581587 (=> (not res!369396) (not e!333707))))

(declare-datatypes ((List!11490 0))(
  ( (Nil!11487) (Cons!11486 (h!12531 (_ BitVec 64)) (t!17718 List!11490)) )
))
(declare-fun arrayNoDuplicates!0 (array!36349 (_ BitVec 32) List!11490) Bool)

(assert (=> b!581587 (= res!369396 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11487))))

(declare-fun b!581588 () Bool)

(declare-fun res!369401 () Bool)

(assert (=> b!581588 (=> (not res!369401) (not e!333706))))

(assert (=> b!581588 (= res!369401 (validKeyInArray!0 (select (arr!17449 a!2986) j!136)))))

(assert (= (and start!53448 res!369399) b!581583))

(assert (= (and b!581583 res!369400) b!581588))

(assert (= (and b!581588 res!369401) b!581585))

(assert (= (and b!581585 res!369404) b!581582))

(assert (= (and b!581582 res!369398) b!581580))

(assert (= (and b!581580 res!369402) b!581586))

(assert (= (and b!581586 res!369397) b!581587))

(assert (= (and b!581587 res!369396) b!581581))

(assert (= (and b!581581 res!369403) b!581584))

(declare-fun m!560115 () Bool)

(assert (=> b!581580 m!560115))

(declare-fun m!560117 () Bool)

(assert (=> b!581584 m!560117))

(assert (=> b!581584 m!560117))

(declare-fun m!560119 () Bool)

(assert (=> b!581584 m!560119))

(declare-fun m!560121 () Bool)

(assert (=> b!581586 m!560121))

(declare-fun m!560123 () Bool)

(assert (=> b!581587 m!560123))

(declare-fun m!560125 () Bool)

(assert (=> b!581582 m!560125))

(declare-fun m!560127 () Bool)

(assert (=> b!581585 m!560127))

(declare-fun m!560129 () Bool)

(assert (=> b!581581 m!560129))

(declare-fun m!560131 () Bool)

(assert (=> b!581581 m!560131))

(declare-fun m!560133 () Bool)

(assert (=> b!581581 m!560133))

(declare-fun m!560135 () Bool)

(assert (=> start!53448 m!560135))

(declare-fun m!560137 () Bool)

(assert (=> start!53448 m!560137))

(assert (=> b!581588 m!560117))

(assert (=> b!581588 m!560117))

(declare-fun m!560139 () Bool)

(assert (=> b!581588 m!560139))

(check-sat (not b!581582) (not b!581587) (not start!53448) (not b!581588) (not b!581584) (not b!581586) (not b!581580) (not b!581585))
