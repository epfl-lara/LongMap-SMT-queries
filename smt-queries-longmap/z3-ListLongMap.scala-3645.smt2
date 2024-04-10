; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50248 () Bool)

(assert start!50248)

(declare-fun b!550065 () Bool)

(declare-fun res!343209 () Bool)

(declare-fun e!317564 () Bool)

(assert (=> b!550065 (=> (not res!343209) (not e!317564))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550065 (= res!343209 (validKeyInArray!0 k0!1914))))

(declare-fun b!550066 () Bool)

(declare-fun res!343215 () Bool)

(declare-fun e!317565 () Bool)

(assert (=> b!550066 (=> (not res!343215) (not e!317565))))

(declare-datatypes ((array!34701 0))(
  ( (array!34702 (arr!16666 (Array (_ BitVec 32) (_ BitVec 64))) (size!17030 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34701)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34701 (_ BitVec 32)) Bool)

(assert (=> b!550066 (= res!343215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550067 () Bool)

(declare-fun res!343213 () Bool)

(assert (=> b!550067 (=> (not res!343213) (not e!317565))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5115 0))(
  ( (MissingZero!5115 (index!22687 (_ BitVec 32))) (Found!5115 (index!22688 (_ BitVec 32))) (Intermediate!5115 (undefined!5927 Bool) (index!22689 (_ BitVec 32)) (x!51613 (_ BitVec 32))) (Undefined!5115) (MissingVacant!5115 (index!22690 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34701 (_ BitVec 32)) SeekEntryResult!5115)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550067 (= res!343213 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16666 a!3118) j!142) mask!3119) (select (arr!16666 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16666 a!3118) i!1132 k0!1914) j!142) (array!34702 (store (arr!16666 a!3118) i!1132 k0!1914) (size!17030 a!3118)) mask!3119)))))

(declare-fun b!550068 () Bool)

(declare-fun res!343212 () Bool)

(assert (=> b!550068 (=> (not res!343212) (not e!317564))))

(declare-fun arrayContainsKey!0 (array!34701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550068 (= res!343212 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550070 () Bool)

(declare-fun res!343217 () Bool)

(assert (=> b!550070 (=> (not res!343217) (not e!317565))))

(declare-datatypes ((List!10746 0))(
  ( (Nil!10743) (Cons!10742 (h!11715 (_ BitVec 64)) (t!16974 List!10746)) )
))
(declare-fun arrayNoDuplicates!0 (array!34701 (_ BitVec 32) List!10746) Bool)

(assert (=> b!550070 (= res!343217 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10743))))

(declare-fun b!550071 () Bool)

(assert (=> b!550071 (= e!317564 e!317565)))

(declare-fun res!343210 () Bool)

(assert (=> b!550071 (=> (not res!343210) (not e!317565))))

(declare-fun lt!250405 () SeekEntryResult!5115)

(assert (=> b!550071 (= res!343210 (or (= lt!250405 (MissingZero!5115 i!1132)) (= lt!250405 (MissingVacant!5115 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34701 (_ BitVec 32)) SeekEntryResult!5115)

(assert (=> b!550071 (= lt!250405 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550072 () Bool)

(declare-fun res!343214 () Bool)

(assert (=> b!550072 (=> (not res!343214) (not e!317564))))

(assert (=> b!550072 (= res!343214 (validKeyInArray!0 (select (arr!16666 a!3118) j!142)))))

(declare-fun b!550073 () Bool)

(declare-fun res!343211 () Bool)

(assert (=> b!550073 (=> (not res!343211) (not e!317564))))

(assert (=> b!550073 (= res!343211 (and (= (size!17030 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17030 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17030 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550069 () Bool)

(assert (=> b!550069 (= e!317565 (not true))))

(assert (=> b!550069 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17004 0))(
  ( (Unit!17005) )
))
(declare-fun lt!250404 () Unit!17004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17004)

(assert (=> b!550069 (= lt!250404 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!343216 () Bool)

(assert (=> start!50248 (=> (not res!343216) (not e!317564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50248 (= res!343216 (validMask!0 mask!3119))))

(assert (=> start!50248 e!317564))

(assert (=> start!50248 true))

(declare-fun array_inv!12462 (array!34701) Bool)

(assert (=> start!50248 (array_inv!12462 a!3118)))

(assert (= (and start!50248 res!343216) b!550073))

(assert (= (and b!550073 res!343211) b!550072))

(assert (= (and b!550072 res!343214) b!550065))

(assert (= (and b!550065 res!343209) b!550068))

(assert (= (and b!550068 res!343212) b!550071))

(assert (= (and b!550071 res!343210) b!550066))

(assert (= (and b!550066 res!343215) b!550070))

(assert (= (and b!550070 res!343217) b!550067))

(assert (= (and b!550067 res!343213) b!550069))

(declare-fun m!527071 () Bool)

(assert (=> start!50248 m!527071))

(declare-fun m!527073 () Bool)

(assert (=> start!50248 m!527073))

(declare-fun m!527075 () Bool)

(assert (=> b!550066 m!527075))

(declare-fun m!527077 () Bool)

(assert (=> b!550070 m!527077))

(declare-fun m!527079 () Bool)

(assert (=> b!550071 m!527079))

(declare-fun m!527081 () Bool)

(assert (=> b!550068 m!527081))

(declare-fun m!527083 () Bool)

(assert (=> b!550069 m!527083))

(declare-fun m!527085 () Bool)

(assert (=> b!550069 m!527085))

(declare-fun m!527087 () Bool)

(assert (=> b!550072 m!527087))

(assert (=> b!550072 m!527087))

(declare-fun m!527089 () Bool)

(assert (=> b!550072 m!527089))

(assert (=> b!550067 m!527087))

(declare-fun m!527091 () Bool)

(assert (=> b!550067 m!527091))

(assert (=> b!550067 m!527087))

(declare-fun m!527093 () Bool)

(assert (=> b!550067 m!527093))

(declare-fun m!527095 () Bool)

(assert (=> b!550067 m!527095))

(assert (=> b!550067 m!527093))

(declare-fun m!527097 () Bool)

(assert (=> b!550067 m!527097))

(assert (=> b!550067 m!527091))

(assert (=> b!550067 m!527087))

(declare-fun m!527099 () Bool)

(assert (=> b!550067 m!527099))

(declare-fun m!527101 () Bool)

(assert (=> b!550067 m!527101))

(assert (=> b!550067 m!527093))

(assert (=> b!550067 m!527095))

(declare-fun m!527103 () Bool)

(assert (=> b!550065 m!527103))

(check-sat (not b!550066) (not b!550065) (not b!550069) (not b!550072) (not b!550070) (not b!550068) (not start!50248) (not b!550067) (not b!550071))
(check-sat)
