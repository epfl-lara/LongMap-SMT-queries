; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53484 () Bool)

(assert start!53484)

(declare-fun b!582029 () Bool)

(declare-fun res!369994 () Bool)

(declare-fun e!333768 () Bool)

(assert (=> b!582029 (=> (not res!369994) (not e!333768))))

(declare-datatypes ((array!36399 0))(
  ( (array!36400 (arr!17474 (Array (_ BitVec 32) (_ BitVec 64))) (size!17839 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36399)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36399 (_ BitVec 32)) Bool)

(assert (=> b!582029 (= res!369994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582030 () Bool)

(declare-fun e!333767 () Bool)

(assert (=> b!582030 (= e!333767 e!333768)))

(declare-fun res!369988 () Bool)

(assert (=> b!582030 (=> (not res!369988) (not e!333768))))

(declare-datatypes ((SeekEntryResult!5911 0))(
  ( (MissingZero!5911 (index!25871 (_ BitVec 32))) (Found!5911 (index!25872 (_ BitVec 32))) (Intermediate!5911 (undefined!6723 Bool) (index!25873 (_ BitVec 32)) (x!54735 (_ BitVec 32))) (Undefined!5911) (MissingVacant!5911 (index!25874 (_ BitVec 32))) )
))
(declare-fun lt!264849 () SeekEntryResult!5911)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582030 (= res!369988 (or (= lt!264849 (MissingZero!5911 i!1108)) (= lt!264849 (MissingVacant!5911 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36399 (_ BitVec 32)) SeekEntryResult!5911)

(assert (=> b!582030 (= lt!264849 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582032 () Bool)

(declare-fun res!369995 () Bool)

(assert (=> b!582032 (=> (not res!369995) (not e!333767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582032 (= res!369995 (validKeyInArray!0 k0!1786))))

(declare-fun b!582033 () Bool)

(assert (=> b!582033 (= e!333768 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!264850 () SeekEntryResult!5911)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36399 (_ BitVec 32)) SeekEntryResult!5911)

(assert (=> b!582033 (= lt!264850 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17474 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582034 () Bool)

(declare-fun res!369987 () Bool)

(assert (=> b!582034 (=> (not res!369987) (not e!333767))))

(assert (=> b!582034 (= res!369987 (validKeyInArray!0 (select (arr!17474 a!2986) j!136)))))

(declare-fun res!369993 () Bool)

(assert (=> start!53484 (=> (not res!369993) (not e!333767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53484 (= res!369993 (validMask!0 mask!3053))))

(assert (=> start!53484 e!333767))

(assert (=> start!53484 true))

(declare-fun array_inv!13357 (array!36399) Bool)

(assert (=> start!53484 (array_inv!13357 a!2986)))

(declare-fun b!582031 () Bool)

(declare-fun res!369991 () Bool)

(assert (=> b!582031 (=> (not res!369991) (not e!333767))))

(declare-fun arrayContainsKey!0 (array!36399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582031 (= res!369991 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582035 () Bool)

(declare-fun res!369992 () Bool)

(assert (=> b!582035 (=> (not res!369992) (not e!333767))))

(assert (=> b!582035 (= res!369992 (and (= (size!17839 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17839 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17839 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582036 () Bool)

(declare-fun res!369990 () Bool)

(assert (=> b!582036 (=> (not res!369990) (not e!333768))))

(declare-datatypes ((List!11554 0))(
  ( (Nil!11551) (Cons!11550 (h!12595 (_ BitVec 64)) (t!17773 List!11554)) )
))
(declare-fun arrayNoDuplicates!0 (array!36399 (_ BitVec 32) List!11554) Bool)

(assert (=> b!582036 (= res!369990 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11551))))

(declare-fun b!582037 () Bool)

(declare-fun res!369989 () Bool)

(assert (=> b!582037 (=> (not res!369989) (not e!333768))))

(assert (=> b!582037 (= res!369989 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17474 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17474 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!53484 res!369993) b!582035))

(assert (= (and b!582035 res!369992) b!582034))

(assert (= (and b!582034 res!369987) b!582032))

(assert (= (and b!582032 res!369995) b!582031))

(assert (= (and b!582031 res!369991) b!582030))

(assert (= (and b!582030 res!369988) b!582029))

(assert (= (and b!582029 res!369994) b!582036))

(assert (= (and b!582036 res!369990) b!582037))

(assert (= (and b!582037 res!369989) b!582033))

(declare-fun m!560023 () Bool)

(assert (=> b!582034 m!560023))

(assert (=> b!582034 m!560023))

(declare-fun m!560025 () Bool)

(assert (=> b!582034 m!560025))

(declare-fun m!560027 () Bool)

(assert (=> b!582037 m!560027))

(declare-fun m!560029 () Bool)

(assert (=> b!582037 m!560029))

(declare-fun m!560031 () Bool)

(assert (=> b!582037 m!560031))

(declare-fun m!560033 () Bool)

(assert (=> b!582036 m!560033))

(declare-fun m!560035 () Bool)

(assert (=> b!582032 m!560035))

(declare-fun m!560037 () Bool)

(assert (=> b!582030 m!560037))

(declare-fun m!560039 () Bool)

(assert (=> b!582031 m!560039))

(declare-fun m!560041 () Bool)

(assert (=> start!53484 m!560041))

(declare-fun m!560043 () Bool)

(assert (=> start!53484 m!560043))

(assert (=> b!582033 m!560023))

(assert (=> b!582033 m!560023))

(declare-fun m!560045 () Bool)

(assert (=> b!582033 m!560045))

(declare-fun m!560047 () Bool)

(assert (=> b!582029 m!560047))

(check-sat (not b!582036) (not b!582031) (not b!582030) (not b!582033) (not b!582034) (not b!582032) (not start!53484) (not b!582029))
(check-sat)
