; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50250 () Bool)

(assert start!50250)

(declare-fun b!550092 () Bool)

(declare-fun res!343244 () Bool)

(declare-fun e!317573 () Bool)

(assert (=> b!550092 (=> (not res!343244) (not e!317573))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34703 0))(
  ( (array!34704 (arr!16667 (Array (_ BitVec 32) (_ BitVec 64))) (size!17031 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34703)

(assert (=> b!550092 (= res!343244 (and (= (size!17031 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17031 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17031 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550093 () Bool)

(declare-fun res!343237 () Bool)

(assert (=> b!550093 (=> (not res!343237) (not e!317573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550093 (= res!343237 (validKeyInArray!0 (select (arr!16667 a!3118) j!142)))))

(declare-fun b!550094 () Bool)

(declare-fun res!343243 () Bool)

(declare-fun e!317574 () Bool)

(assert (=> b!550094 (=> (not res!343243) (not e!317574))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5116 0))(
  ( (MissingZero!5116 (index!22691 (_ BitVec 32))) (Found!5116 (index!22692 (_ BitVec 32))) (Intermediate!5116 (undefined!5928 Bool) (index!22693 (_ BitVec 32)) (x!51614 (_ BitVec 32))) (Undefined!5116) (MissingVacant!5116 (index!22694 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34703 (_ BitVec 32)) SeekEntryResult!5116)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550094 (= res!343243 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16667 a!3118) j!142) mask!3119) (select (arr!16667 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16667 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16667 a!3118) i!1132 k!1914) j!142) (array!34704 (store (arr!16667 a!3118) i!1132 k!1914) (size!17031 a!3118)) mask!3119)))))

(declare-fun b!550095 () Bool)

(assert (=> b!550095 (= e!317574 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34703 (_ BitVec 32)) Bool)

(assert (=> b!550095 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17006 0))(
  ( (Unit!17007) )
))
(declare-fun lt!250411 () Unit!17006)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17006)

(assert (=> b!550095 (= lt!250411 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550096 () Bool)

(declare-fun res!343240 () Bool)

(assert (=> b!550096 (=> (not res!343240) (not e!317574))))

(declare-datatypes ((List!10747 0))(
  ( (Nil!10744) (Cons!10743 (h!11716 (_ BitVec 64)) (t!16975 List!10747)) )
))
(declare-fun arrayNoDuplicates!0 (array!34703 (_ BitVec 32) List!10747) Bool)

(assert (=> b!550096 (= res!343240 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10744))))

(declare-fun b!550097 () Bool)

(declare-fun res!343239 () Bool)

(assert (=> b!550097 (=> (not res!343239) (not e!317574))))

(assert (=> b!550097 (= res!343239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550098 () Bool)

(declare-fun res!343241 () Bool)

(assert (=> b!550098 (=> (not res!343241) (not e!317573))))

(assert (=> b!550098 (= res!343241 (validKeyInArray!0 k!1914))))

(declare-fun b!550099 () Bool)

(assert (=> b!550099 (= e!317573 e!317574)))

(declare-fun res!343242 () Bool)

(assert (=> b!550099 (=> (not res!343242) (not e!317574))))

(declare-fun lt!250410 () SeekEntryResult!5116)

(assert (=> b!550099 (= res!343242 (or (= lt!250410 (MissingZero!5116 i!1132)) (= lt!250410 (MissingVacant!5116 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34703 (_ BitVec 32)) SeekEntryResult!5116)

(assert (=> b!550099 (= lt!250410 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!343236 () Bool)

(assert (=> start!50250 (=> (not res!343236) (not e!317573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50250 (= res!343236 (validMask!0 mask!3119))))

(assert (=> start!50250 e!317573))

(assert (=> start!50250 true))

(declare-fun array_inv!12463 (array!34703) Bool)

(assert (=> start!50250 (array_inv!12463 a!3118)))

(declare-fun b!550100 () Bool)

(declare-fun res!343238 () Bool)

(assert (=> b!550100 (=> (not res!343238) (not e!317573))))

(declare-fun arrayContainsKey!0 (array!34703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550100 (= res!343238 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50250 res!343236) b!550092))

(assert (= (and b!550092 res!343244) b!550093))

(assert (= (and b!550093 res!343237) b!550098))

(assert (= (and b!550098 res!343241) b!550100))

(assert (= (and b!550100 res!343238) b!550099))

(assert (= (and b!550099 res!343242) b!550097))

(assert (= (and b!550097 res!343239) b!550096))

(assert (= (and b!550096 res!343240) b!550094))

(assert (= (and b!550094 res!343243) b!550095))

(declare-fun m!527105 () Bool)

(assert (=> start!50250 m!527105))

(declare-fun m!527107 () Bool)

(assert (=> start!50250 m!527107))

(declare-fun m!527109 () Bool)

(assert (=> b!550093 m!527109))

(assert (=> b!550093 m!527109))

(declare-fun m!527111 () Bool)

(assert (=> b!550093 m!527111))

(declare-fun m!527113 () Bool)

(assert (=> b!550100 m!527113))

(declare-fun m!527115 () Bool)

(assert (=> b!550097 m!527115))

(assert (=> b!550094 m!527109))

(declare-fun m!527117 () Bool)

(assert (=> b!550094 m!527117))

(assert (=> b!550094 m!527109))

(declare-fun m!527119 () Bool)

(assert (=> b!550094 m!527119))

(declare-fun m!527121 () Bool)

(assert (=> b!550094 m!527121))

(assert (=> b!550094 m!527119))

(declare-fun m!527123 () Bool)

(assert (=> b!550094 m!527123))

(assert (=> b!550094 m!527117))

(assert (=> b!550094 m!527109))

(declare-fun m!527125 () Bool)

(assert (=> b!550094 m!527125))

(declare-fun m!527127 () Bool)

(assert (=> b!550094 m!527127))

(assert (=> b!550094 m!527119))

(assert (=> b!550094 m!527121))

(declare-fun m!527129 () Bool)

(assert (=> b!550098 m!527129))

(declare-fun m!527131 () Bool)

(assert (=> b!550096 m!527131))

(declare-fun m!527133 () Bool)

(assert (=> b!550099 m!527133))

(declare-fun m!527135 () Bool)

(assert (=> b!550095 m!527135))

(declare-fun m!527137 () Bool)

(assert (=> b!550095 m!527137))

(push 1)

(assert (not b!550093))

