; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50246 () Bool)

(assert start!50246)

(declare-fun b!550038 () Bool)

(declare-fun res!343185 () Bool)

(declare-fun e!317554 () Bool)

(assert (=> b!550038 (=> (not res!343185) (not e!317554))))

(declare-datatypes ((array!34699 0))(
  ( (array!34700 (arr!16665 (Array (_ BitVec 32) (_ BitVec 64))) (size!17029 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34699)

(declare-datatypes ((List!10745 0))(
  ( (Nil!10742) (Cons!10741 (h!11714 (_ BitVec 64)) (t!16973 List!10745)) )
))
(declare-fun arrayNoDuplicates!0 (array!34699 (_ BitVec 32) List!10745) Bool)

(assert (=> b!550038 (= res!343185 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10742))))

(declare-fun b!550039 () Bool)

(declare-fun res!343182 () Bool)

(assert (=> b!550039 (=> (not res!343182) (not e!317554))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34699 (_ BitVec 32)) Bool)

(assert (=> b!550039 (= res!343182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550040 () Bool)

(declare-fun res!343188 () Bool)

(declare-fun e!317556 () Bool)

(assert (=> b!550040 (=> (not res!343188) (not e!317556))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550040 (= res!343188 (validKeyInArray!0 k!1914))))

(declare-fun b!550041 () Bool)

(declare-fun res!343183 () Bool)

(assert (=> b!550041 (=> (not res!343183) (not e!317556))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550041 (= res!343183 (and (= (size!17029 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17029 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17029 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550042 () Bool)

(assert (=> b!550042 (= e!317554 (not true))))

(assert (=> b!550042 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17002 0))(
  ( (Unit!17003) )
))
(declare-fun lt!250398 () Unit!17002)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17002)

(assert (=> b!550042 (= lt!250398 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550043 () Bool)

(declare-fun res!343186 () Bool)

(assert (=> b!550043 (=> (not res!343186) (not e!317554))))

(declare-datatypes ((SeekEntryResult!5114 0))(
  ( (MissingZero!5114 (index!22683 (_ BitVec 32))) (Found!5114 (index!22684 (_ BitVec 32))) (Intermediate!5114 (undefined!5926 Bool) (index!22685 (_ BitVec 32)) (x!51612 (_ BitVec 32))) (Undefined!5114) (MissingVacant!5114 (index!22686 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34699 (_ BitVec 32)) SeekEntryResult!5114)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550043 (= res!343186 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16665 a!3118) j!142) mask!3119) (select (arr!16665 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16665 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16665 a!3118) i!1132 k!1914) j!142) (array!34700 (store (arr!16665 a!3118) i!1132 k!1914) (size!17029 a!3118)) mask!3119)))))

(declare-fun b!550044 () Bool)

(assert (=> b!550044 (= e!317556 e!317554)))

(declare-fun res!343189 () Bool)

(assert (=> b!550044 (=> (not res!343189) (not e!317554))))

(declare-fun lt!250399 () SeekEntryResult!5114)

(assert (=> b!550044 (= res!343189 (or (= lt!250399 (MissingZero!5114 i!1132)) (= lt!250399 (MissingVacant!5114 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34699 (_ BitVec 32)) SeekEntryResult!5114)

(assert (=> b!550044 (= lt!250399 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!550045 () Bool)

(declare-fun res!343187 () Bool)

(assert (=> b!550045 (=> (not res!343187) (not e!317556))))

(assert (=> b!550045 (= res!343187 (validKeyInArray!0 (select (arr!16665 a!3118) j!142)))))

(declare-fun b!550046 () Bool)

(declare-fun res!343190 () Bool)

(assert (=> b!550046 (=> (not res!343190) (not e!317556))))

(declare-fun arrayContainsKey!0 (array!34699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550046 (= res!343190 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!343184 () Bool)

(assert (=> start!50246 (=> (not res!343184) (not e!317556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50246 (= res!343184 (validMask!0 mask!3119))))

(assert (=> start!50246 e!317556))

(assert (=> start!50246 true))

(declare-fun array_inv!12461 (array!34699) Bool)

(assert (=> start!50246 (array_inv!12461 a!3118)))

(assert (= (and start!50246 res!343184) b!550041))

(assert (= (and b!550041 res!343183) b!550045))

(assert (= (and b!550045 res!343187) b!550040))

(assert (= (and b!550040 res!343188) b!550046))

(assert (= (and b!550046 res!343190) b!550044))

(assert (= (and b!550044 res!343189) b!550039))

(assert (= (and b!550039 res!343182) b!550038))

(assert (= (and b!550038 res!343185) b!550043))

(assert (= (and b!550043 res!343186) b!550042))

(declare-fun m!527037 () Bool)

(assert (=> b!550045 m!527037))

(assert (=> b!550045 m!527037))

(declare-fun m!527039 () Bool)

(assert (=> b!550045 m!527039))

(declare-fun m!527041 () Bool)

(assert (=> b!550046 m!527041))

(declare-fun m!527043 () Bool)

(assert (=> b!550038 m!527043))

(declare-fun m!527045 () Bool)

(assert (=> b!550044 m!527045))

(declare-fun m!527047 () Bool)

(assert (=> b!550040 m!527047))

(declare-fun m!527049 () Bool)

(assert (=> b!550039 m!527049))

(declare-fun m!527051 () Bool)

(assert (=> start!50246 m!527051))

(declare-fun m!527053 () Bool)

(assert (=> start!50246 m!527053))

(declare-fun m!527055 () Bool)

(assert (=> b!550042 m!527055))

(declare-fun m!527057 () Bool)

(assert (=> b!550042 m!527057))

(assert (=> b!550043 m!527037))

(declare-fun m!527059 () Bool)

(assert (=> b!550043 m!527059))

(assert (=> b!550043 m!527037))

(declare-fun m!527061 () Bool)

(assert (=> b!550043 m!527061))

(declare-fun m!527063 () Bool)

(assert (=> b!550043 m!527063))

(assert (=> b!550043 m!527061))

(declare-fun m!527065 () Bool)

(assert (=> b!550043 m!527065))

(assert (=> b!550043 m!527059))

(assert (=> b!550043 m!527037))

(declare-fun m!527067 () Bool)

(assert (=> b!550043 m!527067))

(declare-fun m!527069 () Bool)

(assert (=> b!550043 m!527069))

(assert (=> b!550043 m!527061))

(assert (=> b!550043 m!527063))

(push 1)

