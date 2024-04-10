; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50608 () Bool)

(assert start!50608)

(declare-fun b!553034 () Bool)

(declare-fun res!345455 () Bool)

(declare-fun e!319070 () Bool)

(assert (=> b!553034 (=> (not res!345455) (not e!319070))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34833 0))(
  ( (array!34834 (arr!16726 (Array (_ BitVec 32) (_ BitVec 64))) (size!17090 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34833)

(declare-datatypes ((SeekEntryResult!5175 0))(
  ( (MissingZero!5175 (index!22927 (_ BitVec 32))) (Found!5175 (index!22928 (_ BitVec 32))) (Intermediate!5175 (undefined!5987 Bool) (index!22929 (_ BitVec 32)) (x!51857 (_ BitVec 32))) (Undefined!5175) (MissingVacant!5175 (index!22930 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34833 (_ BitVec 32)) SeekEntryResult!5175)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553034 (= res!345455 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16726 a!3118) j!142) mask!3119) (select (arr!16726 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16726 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16726 a!3118) i!1132 k0!1914) j!142) (array!34834 (store (arr!16726 a!3118) i!1132 k0!1914) (size!17090 a!3118)) mask!3119)))))

(declare-fun e!319071 () Bool)

(declare-fun b!553035 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34833 (_ BitVec 32)) SeekEntryResult!5175)

(assert (=> b!553035 (= e!319071 (= (seekEntryOrOpen!0 (select (arr!16726 a!3118) j!142) a!3118 mask!3119) (Found!5175 j!142)))))

(declare-fun b!553036 () Bool)

(declare-fun res!345452 () Bool)

(declare-fun e!319069 () Bool)

(assert (=> b!553036 (=> (not res!345452) (not e!319069))))

(assert (=> b!553036 (= res!345452 (and (= (size!17090 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17090 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17090 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553037 () Bool)

(declare-fun res!345446 () Bool)

(assert (=> b!553037 (=> (not res!345446) (not e!319070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34833 (_ BitVec 32)) Bool)

(assert (=> b!553037 (= res!345446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553038 () Bool)

(assert (=> b!553038 (= e!319069 e!319070)))

(declare-fun res!345448 () Bool)

(assert (=> b!553038 (=> (not res!345448) (not e!319070))))

(declare-fun lt!251353 () SeekEntryResult!5175)

(assert (=> b!553038 (= res!345448 (or (= lt!251353 (MissingZero!5175 i!1132)) (= lt!251353 (MissingVacant!5175 i!1132))))))

(assert (=> b!553038 (= lt!251353 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553039 () Bool)

(declare-fun res!345450 () Bool)

(assert (=> b!553039 (=> (not res!345450) (not e!319070))))

(declare-datatypes ((List!10806 0))(
  ( (Nil!10803) (Cons!10802 (h!11787 (_ BitVec 64)) (t!17034 List!10806)) )
))
(declare-fun arrayNoDuplicates!0 (array!34833 (_ BitVec 32) List!10806) Bool)

(assert (=> b!553039 (= res!345450 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10803))))

(declare-fun b!553040 () Bool)

(declare-fun res!345449 () Bool)

(assert (=> b!553040 (=> (not res!345449) (not e!319069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553040 (= res!345449 (validKeyInArray!0 (select (arr!16726 a!3118) j!142)))))

(declare-fun b!553041 () Bool)

(assert (=> b!553041 (= e!319070 (not true))))

(assert (=> b!553041 e!319071))

(declare-fun res!345447 () Bool)

(assert (=> b!553041 (=> (not res!345447) (not e!319071))))

(assert (=> b!553041 (= res!345447 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17124 0))(
  ( (Unit!17125) )
))
(declare-fun lt!251352 () Unit!17124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17124)

(assert (=> b!553041 (= lt!251352 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!345451 () Bool)

(assert (=> start!50608 (=> (not res!345451) (not e!319069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50608 (= res!345451 (validMask!0 mask!3119))))

(assert (=> start!50608 e!319069))

(assert (=> start!50608 true))

(declare-fun array_inv!12522 (array!34833) Bool)

(assert (=> start!50608 (array_inv!12522 a!3118)))

(declare-fun b!553042 () Bool)

(declare-fun res!345453 () Bool)

(assert (=> b!553042 (=> (not res!345453) (not e!319069))))

(assert (=> b!553042 (= res!345453 (validKeyInArray!0 k0!1914))))

(declare-fun b!553043 () Bool)

(declare-fun res!345454 () Bool)

(assert (=> b!553043 (=> (not res!345454) (not e!319069))))

(declare-fun arrayContainsKey!0 (array!34833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553043 (= res!345454 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50608 res!345451) b!553036))

(assert (= (and b!553036 res!345452) b!553040))

(assert (= (and b!553040 res!345449) b!553042))

(assert (= (and b!553042 res!345453) b!553043))

(assert (= (and b!553043 res!345454) b!553038))

(assert (= (and b!553038 res!345448) b!553037))

(assert (= (and b!553037 res!345446) b!553039))

(assert (= (and b!553039 res!345450) b!553034))

(assert (= (and b!553034 res!345455) b!553041))

(assert (= (and b!553041 res!345447) b!553035))

(declare-fun m!530037 () Bool)

(assert (=> b!553034 m!530037))

(declare-fun m!530039 () Bool)

(assert (=> b!553034 m!530039))

(assert (=> b!553034 m!530037))

(declare-fun m!530041 () Bool)

(assert (=> b!553034 m!530041))

(declare-fun m!530043 () Bool)

(assert (=> b!553034 m!530043))

(assert (=> b!553034 m!530041))

(declare-fun m!530045 () Bool)

(assert (=> b!553034 m!530045))

(assert (=> b!553034 m!530039))

(assert (=> b!553034 m!530037))

(declare-fun m!530047 () Bool)

(assert (=> b!553034 m!530047))

(declare-fun m!530049 () Bool)

(assert (=> b!553034 m!530049))

(assert (=> b!553034 m!530041))

(assert (=> b!553034 m!530043))

(declare-fun m!530051 () Bool)

(assert (=> b!553042 m!530051))

(declare-fun m!530053 () Bool)

(assert (=> b!553043 m!530053))

(declare-fun m!530055 () Bool)

(assert (=> b!553039 m!530055))

(declare-fun m!530057 () Bool)

(assert (=> b!553038 m!530057))

(declare-fun m!530059 () Bool)

(assert (=> b!553041 m!530059))

(declare-fun m!530061 () Bool)

(assert (=> b!553041 m!530061))

(assert (=> b!553040 m!530037))

(assert (=> b!553040 m!530037))

(declare-fun m!530063 () Bool)

(assert (=> b!553040 m!530063))

(assert (=> b!553035 m!530037))

(assert (=> b!553035 m!530037))

(declare-fun m!530065 () Bool)

(assert (=> b!553035 m!530065))

(declare-fun m!530067 () Bool)

(assert (=> b!553037 m!530067))

(declare-fun m!530069 () Bool)

(assert (=> start!50608 m!530069))

(declare-fun m!530071 () Bool)

(assert (=> start!50608 m!530071))

(check-sat (not b!553041) (not b!553038) (not b!553039) (not b!553042) (not b!553034) (not b!553035) (not b!553037) (not b!553040) (not start!50608) (not b!553043))
(check-sat)
