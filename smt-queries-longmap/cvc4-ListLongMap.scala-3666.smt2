; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50616 () Bool)

(assert start!50616)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!319118 () Bool)

(declare-fun b!553154 () Bool)

(declare-datatypes ((array!34841 0))(
  ( (array!34842 (arr!16730 (Array (_ BitVec 32) (_ BitVec 64))) (size!17094 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34841)

(declare-datatypes ((SeekEntryResult!5179 0))(
  ( (MissingZero!5179 (index!22943 (_ BitVec 32))) (Found!5179 (index!22944 (_ BitVec 32))) (Intermediate!5179 (undefined!5991 Bool) (index!22945 (_ BitVec 32)) (x!51869 (_ BitVec 32))) (Undefined!5179) (MissingVacant!5179 (index!22946 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34841 (_ BitVec 32)) SeekEntryResult!5179)

(assert (=> b!553154 (= e!319118 (= (seekEntryOrOpen!0 (select (arr!16730 a!3118) j!142) a!3118 mask!3119) (Found!5179 j!142)))))

(declare-fun b!553155 () Bool)

(declare-fun res!345569 () Bool)

(declare-fun e!319119 () Bool)

(assert (=> b!553155 (=> (not res!345569) (not e!319119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553155 (= res!345569 (and (= (size!17094 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17094 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17094 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!345574 () Bool)

(assert (=> start!50616 (=> (not res!345574) (not e!319119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50616 (= res!345574 (validMask!0 mask!3119))))

(assert (=> start!50616 e!319119))

(assert (=> start!50616 true))

(declare-fun array_inv!12526 (array!34841) Bool)

(assert (=> start!50616 (array_inv!12526 a!3118)))

(declare-fun b!553156 () Bool)

(declare-fun res!345570 () Bool)

(declare-fun e!319117 () Bool)

(assert (=> b!553156 (=> (not res!345570) (not e!319117))))

(declare-datatypes ((List!10810 0))(
  ( (Nil!10807) (Cons!10806 (h!11791 (_ BitVec 64)) (t!17038 List!10810)) )
))
(declare-fun arrayNoDuplicates!0 (array!34841 (_ BitVec 32) List!10810) Bool)

(assert (=> b!553156 (= res!345570 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10807))))

(declare-fun b!553157 () Bool)

(declare-fun res!345568 () Bool)

(assert (=> b!553157 (=> (not res!345568) (not e!319119))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553157 (= res!345568 (validKeyInArray!0 k!1914))))

(declare-fun b!553158 () Bool)

(assert (=> b!553158 (= e!319119 e!319117)))

(declare-fun res!345573 () Bool)

(assert (=> b!553158 (=> (not res!345573) (not e!319117))))

(declare-fun lt!251376 () SeekEntryResult!5179)

(assert (=> b!553158 (= res!345573 (or (= lt!251376 (MissingZero!5179 i!1132)) (= lt!251376 (MissingVacant!5179 i!1132))))))

(assert (=> b!553158 (= lt!251376 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553159 () Bool)

(declare-fun res!345575 () Bool)

(assert (=> b!553159 (=> (not res!345575) (not e!319117))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34841 (_ BitVec 32)) Bool)

(assert (=> b!553159 (= res!345575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553160 () Bool)

(declare-fun res!345571 () Bool)

(assert (=> b!553160 (=> (not res!345571) (not e!319119))))

(declare-fun arrayContainsKey!0 (array!34841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553160 (= res!345571 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553161 () Bool)

(declare-fun res!345566 () Bool)

(assert (=> b!553161 (=> (not res!345566) (not e!319117))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34841 (_ BitVec 32)) SeekEntryResult!5179)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553161 (= res!345566 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16730 a!3118) j!142) mask!3119) (select (arr!16730 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16730 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16730 a!3118) i!1132 k!1914) j!142) (array!34842 (store (arr!16730 a!3118) i!1132 k!1914) (size!17094 a!3118)) mask!3119)))))

(declare-fun b!553162 () Bool)

(assert (=> b!553162 (= e!319117 (not true))))

(assert (=> b!553162 e!319118))

(declare-fun res!345567 () Bool)

(assert (=> b!553162 (=> (not res!345567) (not e!319118))))

(assert (=> b!553162 (= res!345567 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17132 0))(
  ( (Unit!17133) )
))
(declare-fun lt!251377 () Unit!17132)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17132)

(assert (=> b!553162 (= lt!251377 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553163 () Bool)

(declare-fun res!345572 () Bool)

(assert (=> b!553163 (=> (not res!345572) (not e!319119))))

(assert (=> b!553163 (= res!345572 (validKeyInArray!0 (select (arr!16730 a!3118) j!142)))))

(assert (= (and start!50616 res!345574) b!553155))

(assert (= (and b!553155 res!345569) b!553163))

(assert (= (and b!553163 res!345572) b!553157))

(assert (= (and b!553157 res!345568) b!553160))

(assert (= (and b!553160 res!345571) b!553158))

(assert (= (and b!553158 res!345573) b!553159))

(assert (= (and b!553159 res!345575) b!553156))

(assert (= (and b!553156 res!345570) b!553161))

(assert (= (and b!553161 res!345566) b!553162))

(assert (= (and b!553162 res!345567) b!553154))

(declare-fun m!530181 () Bool)

(assert (=> b!553158 m!530181))

(declare-fun m!530183 () Bool)

(assert (=> b!553163 m!530183))

(assert (=> b!553163 m!530183))

(declare-fun m!530185 () Bool)

(assert (=> b!553163 m!530185))

(assert (=> b!553161 m!530183))

(declare-fun m!530187 () Bool)

(assert (=> b!553161 m!530187))

(assert (=> b!553161 m!530183))

(declare-fun m!530189 () Bool)

(assert (=> b!553161 m!530189))

(declare-fun m!530191 () Bool)

(assert (=> b!553161 m!530191))

(assert (=> b!553161 m!530189))

(declare-fun m!530193 () Bool)

(assert (=> b!553161 m!530193))

(assert (=> b!553161 m!530187))

(assert (=> b!553161 m!530183))

(declare-fun m!530195 () Bool)

(assert (=> b!553161 m!530195))

(declare-fun m!530197 () Bool)

(assert (=> b!553161 m!530197))

(assert (=> b!553161 m!530189))

(assert (=> b!553161 m!530191))

(declare-fun m!530199 () Bool)

(assert (=> start!50616 m!530199))

(declare-fun m!530201 () Bool)

(assert (=> start!50616 m!530201))

(declare-fun m!530203 () Bool)

(assert (=> b!553157 m!530203))

(assert (=> b!553154 m!530183))

(assert (=> b!553154 m!530183))

(declare-fun m!530205 () Bool)

(assert (=> b!553154 m!530205))

(declare-fun m!530207 () Bool)

(assert (=> b!553156 m!530207))

(declare-fun m!530209 () Bool)

(assert (=> b!553159 m!530209))

(declare-fun m!530211 () Bool)

(assert (=> b!553160 m!530211))

(declare-fun m!530213 () Bool)

(assert (=> b!553162 m!530213))

(declare-fun m!530215 () Bool)

(assert (=> b!553162 m!530215))

(push 1)

