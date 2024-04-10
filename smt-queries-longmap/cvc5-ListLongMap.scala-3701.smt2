; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50822 () Bool)

(assert start!50822)

(declare-fun res!348529 () Bool)

(declare-fun e!320436 () Bool)

(assert (=> start!50822 (=> (not res!348529) (not e!320436))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50822 (= res!348529 (validMask!0 mask!3119))))

(assert (=> start!50822 e!320436))

(assert (=> start!50822 true))

(declare-datatypes ((array!35047 0))(
  ( (array!35048 (arr!16833 (Array (_ BitVec 32) (_ BitVec 64))) (size!17197 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35047)

(declare-fun array_inv!12629 (array!35047) Bool)

(assert (=> start!50822 (array_inv!12629 a!3118)))

(declare-fun b!556109 () Bool)

(declare-fun res!348521 () Bool)

(declare-fun e!320433 () Bool)

(assert (=> b!556109 (=> (not res!348521) (not e!320433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35047 (_ BitVec 32)) Bool)

(assert (=> b!556109 (= res!348521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556110 () Bool)

(assert (=> b!556110 (= e!320436 e!320433)))

(declare-fun res!348528 () Bool)

(assert (=> b!556110 (=> (not res!348528) (not e!320433))))

(declare-datatypes ((SeekEntryResult!5282 0))(
  ( (MissingZero!5282 (index!23355 (_ BitVec 32))) (Found!5282 (index!23356 (_ BitVec 32))) (Intermediate!5282 (undefined!6094 Bool) (index!23357 (_ BitVec 32)) (x!52252 (_ BitVec 32))) (Undefined!5282) (MissingVacant!5282 (index!23358 (_ BitVec 32))) )
))
(declare-fun lt!252796 () SeekEntryResult!5282)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556110 (= res!348528 (or (= lt!252796 (MissingZero!5282 i!1132)) (= lt!252796 (MissingVacant!5282 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35047 (_ BitVec 32)) SeekEntryResult!5282)

(assert (=> b!556110 (= lt!252796 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!556111 () Bool)

(declare-fun res!348526 () Bool)

(assert (=> b!556111 (=> (not res!348526) (not e!320436))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556111 (= res!348526 (validKeyInArray!0 (select (arr!16833 a!3118) j!142)))))

(declare-fun b!556112 () Bool)

(declare-fun res!348530 () Bool)

(assert (=> b!556112 (=> (not res!348530) (not e!320433))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35047 (_ BitVec 32)) SeekEntryResult!5282)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556112 (= res!348530 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16833 a!3118) j!142) mask!3119) (select (arr!16833 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16833 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16833 a!3118) i!1132 k!1914) j!142) (array!35048 (store (arr!16833 a!3118) i!1132 k!1914) (size!17197 a!3118)) mask!3119)))))

(declare-fun b!556113 () Bool)

(declare-fun res!348524 () Bool)

(assert (=> b!556113 (=> (not res!348524) (not e!320436))))

(assert (=> b!556113 (= res!348524 (and (= (size!17197 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17197 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17197 a!3118)) (not (= i!1132 j!142))))))

(declare-fun e!320435 () Bool)

(declare-fun b!556114 () Bool)

(assert (=> b!556114 (= e!320435 (= (seekEntryOrOpen!0 (select (arr!16833 a!3118) j!142) a!3118 mask!3119) (Found!5282 j!142)))))

(declare-fun b!556115 () Bool)

(declare-fun res!348527 () Bool)

(assert (=> b!556115 (=> (not res!348527) (not e!320436))))

(declare-fun arrayContainsKey!0 (array!35047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556115 (= res!348527 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556116 () Bool)

(declare-fun res!348525 () Bool)

(assert (=> b!556116 (=> (not res!348525) (not e!320436))))

(assert (=> b!556116 (= res!348525 (validKeyInArray!0 k!1914))))

(declare-fun b!556117 () Bool)

(declare-fun res!348523 () Bool)

(assert (=> b!556117 (=> (not res!348523) (not e!320433))))

(declare-datatypes ((List!10913 0))(
  ( (Nil!10910) (Cons!10909 (h!11894 (_ BitVec 64)) (t!17141 List!10913)) )
))
(declare-fun arrayNoDuplicates!0 (array!35047 (_ BitVec 32) List!10913) Bool)

(assert (=> b!556117 (= res!348523 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10910))))

(declare-fun b!556118 () Bool)

(assert (=> b!556118 (= e!320433 (not true))))

(assert (=> b!556118 e!320435))

(declare-fun res!348522 () Bool)

(assert (=> b!556118 (=> (not res!348522) (not e!320435))))

(assert (=> b!556118 (= res!348522 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17338 0))(
  ( (Unit!17339) )
))
(declare-fun lt!252795 () Unit!17338)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35047 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17338)

(assert (=> b!556118 (= lt!252795 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50822 res!348529) b!556113))

(assert (= (and b!556113 res!348524) b!556111))

(assert (= (and b!556111 res!348526) b!556116))

(assert (= (and b!556116 res!348525) b!556115))

(assert (= (and b!556115 res!348527) b!556110))

(assert (= (and b!556110 res!348528) b!556109))

(assert (= (and b!556109 res!348521) b!556117))

(assert (= (and b!556117 res!348523) b!556112))

(assert (= (and b!556112 res!348530) b!556118))

(assert (= (and b!556118 res!348522) b!556114))

(declare-fun m!534033 () Bool)

(assert (=> b!556112 m!534033))

(declare-fun m!534035 () Bool)

(assert (=> b!556112 m!534035))

(assert (=> b!556112 m!534033))

(declare-fun m!534037 () Bool)

(assert (=> b!556112 m!534037))

(declare-fun m!534039 () Bool)

(assert (=> b!556112 m!534039))

(assert (=> b!556112 m!534037))

(declare-fun m!534041 () Bool)

(assert (=> b!556112 m!534041))

(assert (=> b!556112 m!534035))

(assert (=> b!556112 m!534033))

(declare-fun m!534043 () Bool)

(assert (=> b!556112 m!534043))

(declare-fun m!534045 () Bool)

(assert (=> b!556112 m!534045))

(assert (=> b!556112 m!534037))

(assert (=> b!556112 m!534039))

(declare-fun m!534047 () Bool)

(assert (=> b!556110 m!534047))

(declare-fun m!534049 () Bool)

(assert (=> start!50822 m!534049))

(declare-fun m!534051 () Bool)

(assert (=> start!50822 m!534051))

(declare-fun m!534053 () Bool)

(assert (=> b!556117 m!534053))

(assert (=> b!556114 m!534033))

(assert (=> b!556114 m!534033))

(declare-fun m!534055 () Bool)

(assert (=> b!556114 m!534055))

(assert (=> b!556111 m!534033))

(assert (=> b!556111 m!534033))

(declare-fun m!534057 () Bool)

(assert (=> b!556111 m!534057))

(declare-fun m!534059 () Bool)

(assert (=> b!556116 m!534059))

(declare-fun m!534061 () Bool)

(assert (=> b!556109 m!534061))

(declare-fun m!534063 () Bool)

(assert (=> b!556115 m!534063))

(declare-fun m!534065 () Bool)

(assert (=> b!556118 m!534065))

(declare-fun m!534067 () Bool)

(assert (=> b!556118 m!534067))

(push 1)

