; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53408 () Bool)

(assert start!53408)

(declare-fun b!581031 () Bool)

(declare-fun res!368851 () Bool)

(declare-fun e!333528 () Bool)

(assert (=> b!581031 (=> (not res!368851) (not e!333528))))

(declare-datatypes ((array!36309 0))(
  ( (array!36310 (arr!17429 (Array (_ BitVec 32) (_ BitVec 64))) (size!17793 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36309)

(declare-datatypes ((List!11470 0))(
  ( (Nil!11467) (Cons!11466 (h!12511 (_ BitVec 64)) (t!17698 List!11470)) )
))
(declare-fun arrayNoDuplicates!0 (array!36309 (_ BitVec 32) List!11470) Bool)

(assert (=> b!581031 (= res!368851 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11467))))

(declare-fun b!581032 () Bool)

(declare-fun res!368852 () Bool)

(declare-fun e!333526 () Bool)

(assert (=> b!581032 (=> (not res!368852) (not e!333526))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581032 (= res!368852 (and (= (size!17793 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17793 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17793 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581033 () Bool)

(assert (=> b!581033 (= e!333528 false)))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5869 0))(
  ( (MissingZero!5869 (index!25703 (_ BitVec 32))) (Found!5869 (index!25704 (_ BitVec 32))) (Intermediate!5869 (undefined!6681 Bool) (index!25705 (_ BitVec 32)) (x!54570 (_ BitVec 32))) (Undefined!5869) (MissingVacant!5869 (index!25706 (_ BitVec 32))) )
))
(declare-fun lt!264825 () SeekEntryResult!5869)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36309 (_ BitVec 32)) SeekEntryResult!5869)

(assert (=> b!581033 (= lt!264825 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17429 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581034 () Bool)

(declare-fun res!368848 () Bool)

(assert (=> b!581034 (=> (not res!368848) (not e!333526))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581034 (= res!368848 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581035 () Bool)

(declare-fun res!368849 () Bool)

(assert (=> b!581035 (=> (not res!368849) (not e!333526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581035 (= res!368849 (validKeyInArray!0 k!1786))))

(declare-fun b!581036 () Bool)

(declare-fun res!368855 () Bool)

(assert (=> b!581036 (=> (not res!368855) (not e!333528))))

(assert (=> b!581036 (= res!368855 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17429 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17429 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!368854 () Bool)

(assert (=> start!53408 (=> (not res!368854) (not e!333526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53408 (= res!368854 (validMask!0 mask!3053))))

(assert (=> start!53408 e!333526))

(assert (=> start!53408 true))

(declare-fun array_inv!13225 (array!36309) Bool)

(assert (=> start!53408 (array_inv!13225 a!2986)))

(declare-fun b!581037 () Bool)

(declare-fun res!368853 () Bool)

(assert (=> b!581037 (=> (not res!368853) (not e!333526))))

(assert (=> b!581037 (= res!368853 (validKeyInArray!0 (select (arr!17429 a!2986) j!136)))))

(declare-fun b!581038 () Bool)

(declare-fun res!368847 () Bool)

(assert (=> b!581038 (=> (not res!368847) (not e!333528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36309 (_ BitVec 32)) Bool)

(assert (=> b!581038 (= res!368847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581039 () Bool)

(assert (=> b!581039 (= e!333526 e!333528)))

(declare-fun res!368850 () Bool)

(assert (=> b!581039 (=> (not res!368850) (not e!333528))))

(declare-fun lt!264826 () SeekEntryResult!5869)

(assert (=> b!581039 (= res!368850 (or (= lt!264826 (MissingZero!5869 i!1108)) (= lt!264826 (MissingVacant!5869 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36309 (_ BitVec 32)) SeekEntryResult!5869)

(assert (=> b!581039 (= lt!264826 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53408 res!368854) b!581032))

(assert (= (and b!581032 res!368852) b!581037))

(assert (= (and b!581037 res!368853) b!581035))

(assert (= (and b!581035 res!368849) b!581034))

(assert (= (and b!581034 res!368848) b!581039))

(assert (= (and b!581039 res!368850) b!581038))

(assert (= (and b!581038 res!368847) b!581031))

(assert (= (and b!581031 res!368851) b!581036))

(assert (= (and b!581036 res!368855) b!581033))

(declare-fun m!559589 () Bool)

(assert (=> b!581034 m!559589))

(declare-fun m!559591 () Bool)

(assert (=> b!581037 m!559591))

(assert (=> b!581037 m!559591))

(declare-fun m!559593 () Bool)

(assert (=> b!581037 m!559593))

(declare-fun m!559595 () Bool)

(assert (=> b!581035 m!559595))

(declare-fun m!559597 () Bool)

(assert (=> b!581036 m!559597))

(declare-fun m!559599 () Bool)

(assert (=> b!581036 m!559599))

(declare-fun m!559601 () Bool)

(assert (=> b!581036 m!559601))

(declare-fun m!559603 () Bool)

(assert (=> start!53408 m!559603))

(declare-fun m!559605 () Bool)

(assert (=> start!53408 m!559605))

(assert (=> b!581033 m!559591))

(assert (=> b!581033 m!559591))

(declare-fun m!559607 () Bool)

(assert (=> b!581033 m!559607))

(declare-fun m!559609 () Bool)

(assert (=> b!581039 m!559609))

(declare-fun m!559611 () Bool)

(assert (=> b!581038 m!559611))

(declare-fun m!559613 () Bool)

(assert (=> b!581031 m!559613))

(push 1)

(assert (not b!581031))

(assert (not b!581035))

(assert (not b!581033))

(assert (not b!581039))

(assert (not b!581038))

(assert (not b!581034))

(assert (not start!53408))

(assert (not b!581037))

(check-sat)

