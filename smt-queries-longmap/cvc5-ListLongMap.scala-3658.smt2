; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50504 () Bool)

(assert start!50504)

(declare-fun b!552074 () Bool)

(declare-fun res!344676 () Bool)

(declare-fun e!318584 () Bool)

(assert (=> b!552074 (=> (not res!344676) (not e!318584))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34786 0))(
  ( (array!34787 (arr!16704 (Array (_ BitVec 32) (_ BitVec 64))) (size!17068 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34786)

(declare-datatypes ((SeekEntryResult!5153 0))(
  ( (MissingZero!5153 (index!22839 (_ BitVec 32))) (Found!5153 (index!22840 (_ BitVec 32))) (Intermediate!5153 (undefined!5965 Bool) (index!22841 (_ BitVec 32)) (x!51773 (_ BitVec 32))) (Undefined!5153) (MissingVacant!5153 (index!22842 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34786 (_ BitVec 32)) SeekEntryResult!5153)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552074 (= res!344676 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16704 a!3118) j!142) mask!3119) (select (arr!16704 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16704 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16704 a!3118) i!1132 k!1914) j!142) (array!34787 (store (arr!16704 a!3118) i!1132 k!1914) (size!17068 a!3118)) mask!3119)))))

(declare-fun b!552076 () Bool)

(declare-fun res!344669 () Bool)

(declare-fun e!318583 () Bool)

(assert (=> b!552076 (=> (not res!344669) (not e!318583))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552076 (= res!344669 (validKeyInArray!0 (select (arr!16704 a!3118) j!142)))))

(declare-fun b!552077 () Bool)

(declare-fun res!344671 () Bool)

(assert (=> b!552077 (=> (not res!344671) (not e!318583))))

(assert (=> b!552077 (= res!344671 (and (= (size!17068 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17068 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17068 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552078 () Bool)

(assert (=> b!552078 (= e!318583 e!318584)))

(declare-fun res!344672 () Bool)

(assert (=> b!552078 (=> (not res!344672) (not e!318584))))

(declare-fun lt!251028 () SeekEntryResult!5153)

(assert (=> b!552078 (= res!344672 (or (= lt!251028 (MissingZero!5153 i!1132)) (= lt!251028 (MissingVacant!5153 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34786 (_ BitVec 32)) SeekEntryResult!5153)

(assert (=> b!552078 (= lt!251028 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!552079 () Bool)

(declare-fun e!318585 () Bool)

(assert (=> b!552079 (= e!318585 (= (seekEntryOrOpen!0 (select (arr!16704 a!3118) j!142) a!3118 mask!3119) (Found!5153 j!142)))))

(declare-fun b!552080 () Bool)

(assert (=> b!552080 (= e!318584 (not true))))

(assert (=> b!552080 e!318585))

(declare-fun res!344678 () Bool)

(assert (=> b!552080 (=> (not res!344678) (not e!318585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34786 (_ BitVec 32)) Bool)

(assert (=> b!552080 (= res!344678 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17080 0))(
  ( (Unit!17081) )
))
(declare-fun lt!251029 () Unit!17080)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17080)

(assert (=> b!552080 (= lt!251029 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552081 () Bool)

(declare-fun res!344677 () Bool)

(assert (=> b!552081 (=> (not res!344677) (not e!318584))))

(assert (=> b!552081 (= res!344677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!344670 () Bool)

(assert (=> start!50504 (=> (not res!344670) (not e!318583))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50504 (= res!344670 (validMask!0 mask!3119))))

(assert (=> start!50504 e!318583))

(assert (=> start!50504 true))

(declare-fun array_inv!12500 (array!34786) Bool)

(assert (=> start!50504 (array_inv!12500 a!3118)))

(declare-fun b!552075 () Bool)

(declare-fun res!344675 () Bool)

(assert (=> b!552075 (=> (not res!344675) (not e!318583))))

(assert (=> b!552075 (= res!344675 (validKeyInArray!0 k!1914))))

(declare-fun b!552082 () Bool)

(declare-fun res!344673 () Bool)

(assert (=> b!552082 (=> (not res!344673) (not e!318583))))

(declare-fun arrayContainsKey!0 (array!34786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552082 (= res!344673 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552083 () Bool)

(declare-fun res!344674 () Bool)

(assert (=> b!552083 (=> (not res!344674) (not e!318584))))

(declare-datatypes ((List!10784 0))(
  ( (Nil!10781) (Cons!10780 (h!11762 (_ BitVec 64)) (t!17012 List!10784)) )
))
(declare-fun arrayNoDuplicates!0 (array!34786 (_ BitVec 32) List!10784) Bool)

(assert (=> b!552083 (= res!344674 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10781))))

(assert (= (and start!50504 res!344670) b!552077))

(assert (= (and b!552077 res!344671) b!552076))

(assert (= (and b!552076 res!344669) b!552075))

(assert (= (and b!552075 res!344675) b!552082))

(assert (= (and b!552082 res!344673) b!552078))

(assert (= (and b!552078 res!344672) b!552081))

(assert (= (and b!552081 res!344677) b!552083))

(assert (= (and b!552083 res!344674) b!552074))

(assert (= (and b!552074 res!344676) b!552080))

(assert (= (and b!552080 res!344678) b!552079))

(declare-fun m!529035 () Bool)

(assert (=> b!552074 m!529035))

(declare-fun m!529037 () Bool)

(assert (=> b!552074 m!529037))

(assert (=> b!552074 m!529035))

(declare-fun m!529039 () Bool)

(assert (=> b!552074 m!529039))

(declare-fun m!529041 () Bool)

(assert (=> b!552074 m!529041))

(assert (=> b!552074 m!529039))

(declare-fun m!529043 () Bool)

(assert (=> b!552074 m!529043))

(assert (=> b!552074 m!529037))

(assert (=> b!552074 m!529035))

(declare-fun m!529045 () Bool)

(assert (=> b!552074 m!529045))

(declare-fun m!529047 () Bool)

(assert (=> b!552074 m!529047))

(assert (=> b!552074 m!529039))

(assert (=> b!552074 m!529041))

(declare-fun m!529049 () Bool)

(assert (=> b!552080 m!529049))

(declare-fun m!529051 () Bool)

(assert (=> b!552080 m!529051))

(assert (=> b!552079 m!529035))

(assert (=> b!552079 m!529035))

(declare-fun m!529053 () Bool)

(assert (=> b!552079 m!529053))

(declare-fun m!529055 () Bool)

(assert (=> b!552082 m!529055))

(declare-fun m!529057 () Bool)

(assert (=> b!552081 m!529057))

(declare-fun m!529059 () Bool)

(assert (=> b!552078 m!529059))

(assert (=> b!552076 m!529035))

(assert (=> b!552076 m!529035))

(declare-fun m!529061 () Bool)

(assert (=> b!552076 m!529061))

(declare-fun m!529063 () Bool)

(assert (=> b!552075 m!529063))

(declare-fun m!529065 () Bool)

(assert (=> start!50504 m!529065))

(declare-fun m!529067 () Bool)

(assert (=> start!50504 m!529067))

(declare-fun m!529069 () Bool)

(assert (=> b!552083 m!529069))

(push 1)

