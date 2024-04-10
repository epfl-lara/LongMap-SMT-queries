; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53480 () Bool)

(assert start!53480)

(declare-fun b!582030 () Bool)

(declare-fun e!333852 () Bool)

(declare-fun e!333850 () Bool)

(assert (=> b!582030 (= e!333852 e!333850)))

(declare-fun res!369851 () Bool)

(assert (=> b!582030 (=> (not res!369851) (not e!333850))))

(declare-datatypes ((SeekEntryResult!5905 0))(
  ( (MissingZero!5905 (index!25847 (_ BitVec 32))) (Found!5905 (index!25848 (_ BitVec 32))) (Intermediate!5905 (undefined!6717 Bool) (index!25849 (_ BitVec 32)) (x!54702 (_ BitVec 32))) (Undefined!5905) (MissingVacant!5905 (index!25850 (_ BitVec 32))) )
))
(declare-fun lt!265024 () SeekEntryResult!5905)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582030 (= res!369851 (or (= lt!265024 (MissingZero!5905 i!1108)) (= lt!265024 (MissingVacant!5905 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36381 0))(
  ( (array!36382 (arr!17465 (Array (_ BitVec 32) (_ BitVec 64))) (size!17829 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36381)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36381 (_ BitVec 32)) SeekEntryResult!5905)

(assert (=> b!582030 (= lt!265024 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582031 () Bool)

(declare-fun res!369852 () Bool)

(assert (=> b!582031 (=> (not res!369852) (not e!333850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36381 (_ BitVec 32)) Bool)

(assert (=> b!582031 (= res!369852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!369848 () Bool)

(assert (=> start!53480 (=> (not res!369848) (not e!333852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53480 (= res!369848 (validMask!0 mask!3053))))

(assert (=> start!53480 e!333852))

(assert (=> start!53480 true))

(declare-fun array_inv!13261 (array!36381) Bool)

(assert (=> start!53480 (array_inv!13261 a!2986)))

(declare-fun b!582032 () Bool)

(declare-fun res!369847 () Bool)

(assert (=> b!582032 (=> (not res!369847) (not e!333852))))

(declare-fun arrayContainsKey!0 (array!36381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582032 (= res!369847 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582033 () Bool)

(declare-fun res!369846 () Bool)

(assert (=> b!582033 (=> (not res!369846) (not e!333850))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!582033 (= res!369846 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17465 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17465 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582034 () Bool)

(assert (=> b!582034 (= e!333850 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!265023 () SeekEntryResult!5905)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36381 (_ BitVec 32)) SeekEntryResult!5905)

(assert (=> b!582034 (= lt!265023 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17465 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582035 () Bool)

(declare-fun res!369850 () Bool)

(assert (=> b!582035 (=> (not res!369850) (not e!333852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582035 (= res!369850 (validKeyInArray!0 (select (arr!17465 a!2986) j!136)))))

(declare-fun b!582036 () Bool)

(declare-fun res!369849 () Bool)

(assert (=> b!582036 (=> (not res!369849) (not e!333852))))

(assert (=> b!582036 (= res!369849 (and (= (size!17829 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17829 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17829 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582037 () Bool)

(declare-fun res!369853 () Bool)

(assert (=> b!582037 (=> (not res!369853) (not e!333852))))

(assert (=> b!582037 (= res!369853 (validKeyInArray!0 k!1786))))

(declare-fun b!582038 () Bool)

(declare-fun res!369854 () Bool)

(assert (=> b!582038 (=> (not res!369854) (not e!333850))))

(declare-datatypes ((List!11506 0))(
  ( (Nil!11503) (Cons!11502 (h!12547 (_ BitVec 64)) (t!17734 List!11506)) )
))
(declare-fun arrayNoDuplicates!0 (array!36381 (_ BitVec 32) List!11506) Bool)

(assert (=> b!582038 (= res!369854 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11503))))

(assert (= (and start!53480 res!369848) b!582036))

(assert (= (and b!582036 res!369849) b!582035))

(assert (= (and b!582035 res!369850) b!582037))

(assert (= (and b!582037 res!369853) b!582032))

(assert (= (and b!582032 res!369847) b!582030))

(assert (= (and b!582030 res!369851) b!582031))

(assert (= (and b!582031 res!369852) b!582038))

(assert (= (and b!582038 res!369854) b!582033))

(assert (= (and b!582033 res!369846) b!582034))

(declare-fun m!560549 () Bool)

(assert (=> b!582030 m!560549))

(declare-fun m!560551 () Bool)

(assert (=> b!582038 m!560551))

(declare-fun m!560553 () Bool)

(assert (=> b!582033 m!560553))

(declare-fun m!560555 () Bool)

(assert (=> b!582033 m!560555))

(declare-fun m!560557 () Bool)

(assert (=> b!582033 m!560557))

(declare-fun m!560559 () Bool)

(assert (=> start!53480 m!560559))

(declare-fun m!560561 () Bool)

(assert (=> start!53480 m!560561))

(declare-fun m!560563 () Bool)

(assert (=> b!582032 m!560563))

(declare-fun m!560565 () Bool)

(assert (=> b!582031 m!560565))

(declare-fun m!560567 () Bool)

(assert (=> b!582037 m!560567))

(declare-fun m!560569 () Bool)

(assert (=> b!582034 m!560569))

(assert (=> b!582034 m!560569))

(declare-fun m!560571 () Bool)

(assert (=> b!582034 m!560571))

(assert (=> b!582035 m!560569))

(assert (=> b!582035 m!560569))

(declare-fun m!560573 () Bool)

(assert (=> b!582035 m!560573))

(push 1)

