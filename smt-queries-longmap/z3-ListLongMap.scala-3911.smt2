; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53526 () Bool)

(assert start!53526)

(declare-fun b!582176 () Bool)

(declare-fun res!369894 () Bool)

(declare-fun e!333963 () Bool)

(assert (=> b!582176 (=> (not res!369894) (not e!333963))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36372 0))(
  ( (array!36373 (arr!17458 (Array (_ BitVec 32) (_ BitVec 64))) (size!17822 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36372)

(assert (=> b!582176 (= res!369894 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17458 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17458 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582177 () Bool)

(declare-fun res!369891 () Bool)

(assert (=> b!582177 (=> (not res!369891) (not e!333963))))

(declare-datatypes ((List!11406 0))(
  ( (Nil!11403) (Cons!11402 (h!12450 (_ BitVec 64)) (t!17626 List!11406)) )
))
(declare-fun arrayNoDuplicates!0 (array!36372 (_ BitVec 32) List!11406) Bool)

(assert (=> b!582177 (= res!369891 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11403))))

(declare-fun b!582178 () Bool)

(declare-fun res!369890 () Bool)

(declare-fun e!333962 () Bool)

(assert (=> b!582178 (=> (not res!369890) (not e!333962))))

(declare-fun arrayContainsKey!0 (array!36372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582178 (= res!369890 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582179 () Bool)

(declare-fun res!369895 () Bool)

(assert (=> b!582179 (=> (not res!369895) (not e!333962))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!582179 (= res!369895 (and (= (size!17822 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17822 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17822 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582180 () Bool)

(assert (=> b!582180 (= e!333962 e!333963)))

(declare-fun res!369892 () Bool)

(assert (=> b!582180 (=> (not res!369892) (not e!333963))))

(declare-datatypes ((SeekEntryResult!5854 0))(
  ( (MissingZero!5854 (index!25643 (_ BitVec 32))) (Found!5854 (index!25644 (_ BitVec 32))) (Intermediate!5854 (undefined!6666 Bool) (index!25645 (_ BitVec 32)) (x!54654 (_ BitVec 32))) (Undefined!5854) (MissingVacant!5854 (index!25646 (_ BitVec 32))) )
))
(declare-fun lt!265122 () SeekEntryResult!5854)

(assert (=> b!582180 (= res!369892 (or (= lt!265122 (MissingZero!5854 i!1108)) (= lt!265122 (MissingVacant!5854 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36372 (_ BitVec 32)) SeekEntryResult!5854)

(assert (=> b!582180 (= lt!265122 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!369888 () Bool)

(assert (=> start!53526 (=> (not res!369888) (not e!333962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53526 (= res!369888 (validMask!0 mask!3053))))

(assert (=> start!53526 e!333962))

(assert (=> start!53526 true))

(declare-fun array_inv!13317 (array!36372) Bool)

(assert (=> start!53526 (array_inv!13317 a!2986)))

(declare-fun b!582181 () Bool)

(declare-fun res!369893 () Bool)

(assert (=> b!582181 (=> (not res!369893) (not e!333963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36372 (_ BitVec 32)) Bool)

(assert (=> b!582181 (= res!369893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582182 () Bool)

(assert (=> b!582182 (= e!333963 false)))

(declare-fun lt!265123 () SeekEntryResult!5854)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36372 (_ BitVec 32)) SeekEntryResult!5854)

(assert (=> b!582182 (= lt!265123 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17458 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582183 () Bool)

(declare-fun res!369889 () Bool)

(assert (=> b!582183 (=> (not res!369889) (not e!333962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582183 (= res!369889 (validKeyInArray!0 k0!1786))))

(declare-fun b!582184 () Bool)

(declare-fun res!369887 () Bool)

(assert (=> b!582184 (=> (not res!369887) (not e!333962))))

(assert (=> b!582184 (= res!369887 (validKeyInArray!0 (select (arr!17458 a!2986) j!136)))))

(assert (= (and start!53526 res!369888) b!582179))

(assert (= (and b!582179 res!369895) b!582184))

(assert (= (and b!582184 res!369887) b!582183))

(assert (= (and b!582183 res!369889) b!582178))

(assert (= (and b!582178 res!369890) b!582180))

(assert (= (and b!582180 res!369892) b!582181))

(assert (= (and b!582181 res!369893) b!582177))

(assert (= (and b!582177 res!369891) b!582176))

(assert (= (and b!582176 res!369894) b!582182))

(declare-fun m!560849 () Bool)

(assert (=> b!582181 m!560849))

(declare-fun m!560851 () Bool)

(assert (=> b!582183 m!560851))

(declare-fun m!560853 () Bool)

(assert (=> b!582182 m!560853))

(assert (=> b!582182 m!560853))

(declare-fun m!560855 () Bool)

(assert (=> b!582182 m!560855))

(assert (=> b!582184 m!560853))

(assert (=> b!582184 m!560853))

(declare-fun m!560857 () Bool)

(assert (=> b!582184 m!560857))

(declare-fun m!560859 () Bool)

(assert (=> b!582180 m!560859))

(declare-fun m!560861 () Bool)

(assert (=> b!582177 m!560861))

(declare-fun m!560863 () Bool)

(assert (=> start!53526 m!560863))

(declare-fun m!560865 () Bool)

(assert (=> start!53526 m!560865))

(declare-fun m!560867 () Bool)

(assert (=> b!582176 m!560867))

(declare-fun m!560869 () Bool)

(assert (=> b!582176 m!560869))

(declare-fun m!560871 () Bool)

(assert (=> b!582176 m!560871))

(declare-fun m!560873 () Bool)

(assert (=> b!582178 m!560873))

(check-sat (not b!582182) (not b!582180) (not b!582178) (not b!582183) (not start!53526) (not b!582184) (not b!582181) (not b!582177))
(check-sat)
