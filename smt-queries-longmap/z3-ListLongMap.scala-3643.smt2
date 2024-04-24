; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50280 () Bool)

(assert start!50280)

(declare-fun b!550076 () Bool)

(declare-fun res!343119 () Bool)

(declare-fun e!317629 () Bool)

(assert (=> b!550076 (=> (not res!343119) (not e!317629))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550076 (= res!343119 (validKeyInArray!0 k0!1914))))

(declare-fun b!550077 () Bool)

(declare-fun e!317631 () Bool)

(assert (=> b!550077 (= e!317629 e!317631)))

(declare-fun res!343123 () Bool)

(assert (=> b!550077 (=> (not res!343123) (not e!317631))))

(declare-datatypes ((SeekEntryResult!5059 0))(
  ( (MissingZero!5059 (index!22463 (_ BitVec 32))) (Found!5059 (index!22464 (_ BitVec 32))) (Intermediate!5059 (undefined!5871 Bool) (index!22465 (_ BitVec 32)) (x!51544 (_ BitVec 32))) (Undefined!5059) (MissingVacant!5059 (index!22466 (_ BitVec 32))) )
))
(declare-fun lt!250473 () SeekEntryResult!5059)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550077 (= res!343123 (or (= lt!250473 (MissingZero!5059 i!1132)) (= lt!250473 (MissingVacant!5059 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34680 0))(
  ( (array!34681 (arr!16654 (Array (_ BitVec 32) (_ BitVec 64))) (size!17018 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34680)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34680 (_ BitVec 32)) SeekEntryResult!5059)

(assert (=> b!550077 (= lt!250473 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550078 () Bool)

(declare-fun res!343118 () Bool)

(assert (=> b!550078 (=> (not res!343118) (not e!317631))))

(declare-datatypes ((List!10641 0))(
  ( (Nil!10638) (Cons!10637 (h!11613 (_ BitVec 64)) (t!16861 List!10641)) )
))
(declare-fun arrayNoDuplicates!0 (array!34680 (_ BitVec 32) List!10641) Bool)

(assert (=> b!550078 (= res!343118 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10638))))

(declare-fun res!343116 () Bool)

(assert (=> start!50280 (=> (not res!343116) (not e!317629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50280 (= res!343116 (validMask!0 mask!3119))))

(assert (=> start!50280 e!317629))

(assert (=> start!50280 true))

(declare-fun array_inv!12513 (array!34680) Bool)

(assert (=> start!50280 (array_inv!12513 a!3118)))

(declare-fun b!550079 () Bool)

(declare-fun res!343122 () Bool)

(assert (=> b!550079 (=> (not res!343122) (not e!317629))))

(declare-fun arrayContainsKey!0 (array!34680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550079 (= res!343122 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550080 () Bool)

(declare-fun res!343120 () Bool)

(assert (=> b!550080 (=> (not res!343120) (not e!317629))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!550080 (= res!343120 (and (= (size!17018 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17018 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17018 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550081 () Bool)

(declare-fun res!343117 () Bool)

(assert (=> b!550081 (=> (not res!343117) (not e!317631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34680 (_ BitVec 32)) Bool)

(assert (=> b!550081 (= res!343117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550082 () Bool)

(declare-fun res!343115 () Bool)

(assert (=> b!550082 (=> (not res!343115) (not e!317631))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34680 (_ BitVec 32)) SeekEntryResult!5059)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550082 (= res!343115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16654 a!3118) j!142) mask!3119) (select (arr!16654 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16654 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16654 a!3118) i!1132 k0!1914) j!142) (array!34681 (store (arr!16654 a!3118) i!1132 k0!1914) (size!17018 a!3118)) mask!3119)))))

(declare-fun b!550083 () Bool)

(assert (=> b!550083 (= e!317631 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!550083 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16963 0))(
  ( (Unit!16964) )
))
(declare-fun lt!250474 () Unit!16963)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16963)

(assert (=> b!550083 (= lt!250474 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550084 () Bool)

(declare-fun res!343121 () Bool)

(assert (=> b!550084 (=> (not res!343121) (not e!317629))))

(assert (=> b!550084 (= res!343121 (validKeyInArray!0 (select (arr!16654 a!3118) j!142)))))

(assert (= (and start!50280 res!343116) b!550080))

(assert (= (and b!550080 res!343120) b!550084))

(assert (= (and b!550084 res!343121) b!550076))

(assert (= (and b!550076 res!343119) b!550079))

(assert (= (and b!550079 res!343122) b!550077))

(assert (= (and b!550077 res!343123) b!550081))

(assert (= (and b!550081 res!343117) b!550078))

(assert (= (and b!550078 res!343118) b!550082))

(assert (= (and b!550082 res!343115) b!550083))

(declare-fun m!527171 () Bool)

(assert (=> b!550077 m!527171))

(declare-fun m!527173 () Bool)

(assert (=> b!550076 m!527173))

(declare-fun m!527175 () Bool)

(assert (=> b!550084 m!527175))

(assert (=> b!550084 m!527175))

(declare-fun m!527177 () Bool)

(assert (=> b!550084 m!527177))

(declare-fun m!527179 () Bool)

(assert (=> b!550083 m!527179))

(declare-fun m!527181 () Bool)

(assert (=> b!550083 m!527181))

(assert (=> b!550082 m!527175))

(declare-fun m!527183 () Bool)

(assert (=> b!550082 m!527183))

(assert (=> b!550082 m!527175))

(declare-fun m!527185 () Bool)

(assert (=> b!550082 m!527185))

(declare-fun m!527187 () Bool)

(assert (=> b!550082 m!527187))

(assert (=> b!550082 m!527185))

(declare-fun m!527189 () Bool)

(assert (=> b!550082 m!527189))

(assert (=> b!550082 m!527183))

(assert (=> b!550082 m!527175))

(declare-fun m!527191 () Bool)

(assert (=> b!550082 m!527191))

(declare-fun m!527193 () Bool)

(assert (=> b!550082 m!527193))

(assert (=> b!550082 m!527185))

(assert (=> b!550082 m!527187))

(declare-fun m!527195 () Bool)

(assert (=> start!50280 m!527195))

(declare-fun m!527197 () Bool)

(assert (=> start!50280 m!527197))

(declare-fun m!527199 () Bool)

(assert (=> b!550079 m!527199))

(declare-fun m!527201 () Bool)

(assert (=> b!550081 m!527201))

(declare-fun m!527203 () Bool)

(assert (=> b!550078 m!527203))

(check-sat (not b!550082) (not b!550076) (not b!550084) (not b!550083) (not start!50280) (not b!550081) (not b!550077) (not b!550079) (not b!550078))
(check-sat)
