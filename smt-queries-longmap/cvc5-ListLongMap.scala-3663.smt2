; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50594 () Bool)

(assert start!50594)

(declare-fun b!552824 () Bool)

(declare-fun res!345243 () Bool)

(declare-fun e!318980 () Bool)

(assert (=> b!552824 (=> (not res!345243) (not e!318980))))

(declare-datatypes ((array!34819 0))(
  ( (array!34820 (arr!16719 (Array (_ BitVec 32) (_ BitVec 64))) (size!17083 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34819)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34819 (_ BitVec 32)) Bool)

(assert (=> b!552824 (= res!345243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!345242 () Bool)

(declare-fun e!318978 () Bool)

(assert (=> start!50594 (=> (not res!345242) (not e!318978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50594 (= res!345242 (validMask!0 mask!3119))))

(assert (=> start!50594 e!318978))

(assert (=> start!50594 true))

(declare-fun array_inv!12515 (array!34819) Bool)

(assert (=> start!50594 (array_inv!12515 a!3118)))

(declare-fun b!552825 () Bool)

(declare-fun res!345245 () Bool)

(assert (=> b!552825 (=> (not res!345245) (not e!318978))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552825 (= res!345245 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552826 () Bool)

(assert (=> b!552826 (= e!318978 e!318980)))

(declare-fun res!345239 () Bool)

(assert (=> b!552826 (=> (not res!345239) (not e!318980))))

(declare-datatypes ((SeekEntryResult!5168 0))(
  ( (MissingZero!5168 (index!22899 (_ BitVec 32))) (Found!5168 (index!22900 (_ BitVec 32))) (Intermediate!5168 (undefined!5980 Bool) (index!22901 (_ BitVec 32)) (x!51834 (_ BitVec 32))) (Undefined!5168) (MissingVacant!5168 (index!22902 (_ BitVec 32))) )
))
(declare-fun lt!251289 () SeekEntryResult!5168)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552826 (= res!345239 (or (= lt!251289 (MissingZero!5168 i!1132)) (= lt!251289 (MissingVacant!5168 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34819 (_ BitVec 32)) SeekEntryResult!5168)

(assert (=> b!552826 (= lt!251289 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!552827 () Bool)

(declare-fun e!318979 () Bool)

(declare-fun lt!251291 () SeekEntryResult!5168)

(assert (=> b!552827 (= e!318979 (not (or (not (is-Intermediate!5168 lt!251291)) (not (undefined!5980 lt!251291)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!318981 () Bool)

(assert (=> b!552827 e!318981))

(declare-fun res!345236 () Bool)

(assert (=> b!552827 (=> (not res!345236) (not e!318981))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!552827 (= res!345236 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17110 0))(
  ( (Unit!17111) )
))
(declare-fun lt!251293 () Unit!17110)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17110)

(assert (=> b!552827 (= lt!251293 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552828 () Bool)

(assert (=> b!552828 (= e!318981 (= (seekEntryOrOpen!0 (select (arr!16719 a!3118) j!142) a!3118 mask!3119) (Found!5168 j!142)))))

(declare-fun b!552829 () Bool)

(declare-fun res!345241 () Bool)

(assert (=> b!552829 (=> (not res!345241) (not e!318980))))

(declare-datatypes ((List!10799 0))(
  ( (Nil!10796) (Cons!10795 (h!11780 (_ BitVec 64)) (t!17027 List!10799)) )
))
(declare-fun arrayNoDuplicates!0 (array!34819 (_ BitVec 32) List!10799) Bool)

(assert (=> b!552829 (= res!345241 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10796))))

(declare-fun b!552830 () Bool)

(assert (=> b!552830 (= e!318980 e!318979)))

(declare-fun res!345240 () Bool)

(assert (=> b!552830 (=> (not res!345240) (not e!318979))))

(declare-fun lt!251292 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34819 (_ BitVec 32)) SeekEntryResult!5168)

(assert (=> b!552830 (= res!345240 (= lt!251291 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251292 (select (store (arr!16719 a!3118) i!1132 k!1914) j!142) (array!34820 (store (arr!16719 a!3118) i!1132 k!1914) (size!17083 a!3118)) mask!3119)))))

(declare-fun lt!251290 () (_ BitVec 32))

(assert (=> b!552830 (= lt!251291 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251290 (select (arr!16719 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552830 (= lt!251292 (toIndex!0 (select (store (arr!16719 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!552830 (= lt!251290 (toIndex!0 (select (arr!16719 a!3118) j!142) mask!3119))))

(declare-fun b!552831 () Bool)

(declare-fun res!345238 () Bool)

(assert (=> b!552831 (=> (not res!345238) (not e!318978))))

(assert (=> b!552831 (= res!345238 (and (= (size!17083 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17083 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17083 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552832 () Bool)

(declare-fun res!345237 () Bool)

(assert (=> b!552832 (=> (not res!345237) (not e!318978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552832 (= res!345237 (validKeyInArray!0 k!1914))))

(declare-fun b!552833 () Bool)

(declare-fun res!345244 () Bool)

(assert (=> b!552833 (=> (not res!345244) (not e!318978))))

(assert (=> b!552833 (= res!345244 (validKeyInArray!0 (select (arr!16719 a!3118) j!142)))))

(assert (= (and start!50594 res!345242) b!552831))

(assert (= (and b!552831 res!345238) b!552833))

(assert (= (and b!552833 res!345244) b!552832))

(assert (= (and b!552832 res!345237) b!552825))

(assert (= (and b!552825 res!345245) b!552826))

(assert (= (and b!552826 res!345239) b!552824))

(assert (= (and b!552824 res!345243) b!552829))

(assert (= (and b!552829 res!345241) b!552830))

(assert (= (and b!552830 res!345240) b!552827))

(assert (= (and b!552827 res!345236) b!552828))

(declare-fun m!529785 () Bool)

(assert (=> b!552826 m!529785))

(declare-fun m!529787 () Bool)

(assert (=> b!552827 m!529787))

(declare-fun m!529789 () Bool)

(assert (=> b!552827 m!529789))

(declare-fun m!529791 () Bool)

(assert (=> start!50594 m!529791))

(declare-fun m!529793 () Bool)

(assert (=> start!50594 m!529793))

(declare-fun m!529795 () Bool)

(assert (=> b!552832 m!529795))

(declare-fun m!529797 () Bool)

(assert (=> b!552833 m!529797))

(assert (=> b!552833 m!529797))

(declare-fun m!529799 () Bool)

(assert (=> b!552833 m!529799))

(declare-fun m!529801 () Bool)

(assert (=> b!552824 m!529801))

(declare-fun m!529803 () Bool)

(assert (=> b!552825 m!529803))

(assert (=> b!552830 m!529797))

(declare-fun m!529805 () Bool)

(assert (=> b!552830 m!529805))

(declare-fun m!529807 () Bool)

(assert (=> b!552830 m!529807))

(declare-fun m!529809 () Bool)

(assert (=> b!552830 m!529809))

(assert (=> b!552830 m!529797))

(declare-fun m!529811 () Bool)

(assert (=> b!552830 m!529811))

(assert (=> b!552830 m!529797))

(assert (=> b!552830 m!529807))

(declare-fun m!529813 () Bool)

(assert (=> b!552830 m!529813))

(assert (=> b!552830 m!529807))

(declare-fun m!529815 () Bool)

(assert (=> b!552830 m!529815))

(declare-fun m!529817 () Bool)

(assert (=> b!552829 m!529817))

(assert (=> b!552828 m!529797))

(assert (=> b!552828 m!529797))

(declare-fun m!529819 () Bool)

(assert (=> b!552828 m!529819))

(push 1)

