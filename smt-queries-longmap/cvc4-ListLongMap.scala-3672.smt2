; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50652 () Bool)

(assert start!50652)

(declare-fun b!553703 () Bool)

(declare-fun res!346121 () Bool)

(declare-fun e!319370 () Bool)

(assert (=> b!553703 (=> (not res!346121) (not e!319370))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553703 (= res!346121 (validKeyInArray!0 k!1914))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!319371 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!553704 () Bool)

(declare-datatypes ((array!34877 0))(
  ( (array!34878 (arr!16748 (Array (_ BitVec 32) (_ BitVec 64))) (size!17112 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34877)

(declare-datatypes ((SeekEntryResult!5197 0))(
  ( (MissingZero!5197 (index!23015 (_ BitVec 32))) (Found!5197 (index!23016 (_ BitVec 32))) (Intermediate!5197 (undefined!6009 Bool) (index!23017 (_ BitVec 32)) (x!51935 (_ BitVec 32))) (Undefined!5197) (MissingVacant!5197 (index!23018 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34877 (_ BitVec 32)) SeekEntryResult!5197)

(assert (=> b!553704 (= e!319371 (= (seekEntryOrOpen!0 (select (arr!16748 a!3118) j!142) a!3118 mask!3119) (Found!5197 j!142)))))

(declare-fun b!553705 () Bool)

(declare-fun res!346119 () Bool)

(assert (=> b!553705 (=> (not res!346119) (not e!319370))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553705 (= res!346119 (and (= (size!17112 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17112 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17112 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553706 () Bool)

(declare-fun res!346118 () Bool)

(declare-fun e!319369 () Bool)

(assert (=> b!553706 (=> (not res!346118) (not e!319369))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34877 (_ BitVec 32)) Bool)

(assert (=> b!553706 (= res!346118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553707 () Bool)

(assert (=> b!553707 (= e!319369 (not true))))

(assert (=> b!553707 e!319371))

(declare-fun res!346115 () Bool)

(assert (=> b!553707 (=> (not res!346115) (not e!319371))))

(assert (=> b!553707 (= res!346115 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17168 0))(
  ( (Unit!17169) )
))
(declare-fun lt!251566 () Unit!17168)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34877 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17168)

(assert (=> b!553707 (= lt!251566 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553708 () Bool)

(declare-fun res!346122 () Bool)

(assert (=> b!553708 (=> (not res!346122) (not e!319370))))

(assert (=> b!553708 (= res!346122 (validKeyInArray!0 (select (arr!16748 a!3118) j!142)))))

(declare-fun b!553709 () Bool)

(declare-fun res!346123 () Bool)

(assert (=> b!553709 (=> (not res!346123) (not e!319370))))

(declare-fun arrayContainsKey!0 (array!34877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553709 (= res!346123 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553710 () Bool)

(declare-fun res!346124 () Bool)

(assert (=> b!553710 (=> (not res!346124) (not e!319369))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34877 (_ BitVec 32)) SeekEntryResult!5197)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553710 (= res!346124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16748 a!3118) j!142) mask!3119) (select (arr!16748 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16748 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16748 a!3118) i!1132 k!1914) j!142) (array!34878 (store (arr!16748 a!3118) i!1132 k!1914) (size!17112 a!3118)) mask!3119)))))

(declare-fun res!346116 () Bool)

(assert (=> start!50652 (=> (not res!346116) (not e!319370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50652 (= res!346116 (validMask!0 mask!3119))))

(assert (=> start!50652 e!319370))

(assert (=> start!50652 true))

(declare-fun array_inv!12544 (array!34877) Bool)

(assert (=> start!50652 (array_inv!12544 a!3118)))

(declare-fun b!553711 () Bool)

(assert (=> b!553711 (= e!319370 e!319369)))

(declare-fun res!346120 () Bool)

(assert (=> b!553711 (=> (not res!346120) (not e!319369))))

(declare-fun lt!251565 () SeekEntryResult!5197)

(assert (=> b!553711 (= res!346120 (or (= lt!251565 (MissingZero!5197 i!1132)) (= lt!251565 (MissingVacant!5197 i!1132))))))

(assert (=> b!553711 (= lt!251565 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553712 () Bool)

(declare-fun res!346117 () Bool)

(assert (=> b!553712 (=> (not res!346117) (not e!319369))))

(declare-datatypes ((List!10828 0))(
  ( (Nil!10825) (Cons!10824 (h!11809 (_ BitVec 64)) (t!17056 List!10828)) )
))
(declare-fun arrayNoDuplicates!0 (array!34877 (_ BitVec 32) List!10828) Bool)

(assert (=> b!553712 (= res!346117 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10825))))

(assert (= (and start!50652 res!346116) b!553705))

(assert (= (and b!553705 res!346119) b!553708))

(assert (= (and b!553708 res!346122) b!553703))

(assert (= (and b!553703 res!346121) b!553709))

(assert (= (and b!553709 res!346123) b!553711))

(assert (= (and b!553711 res!346120) b!553706))

(assert (= (and b!553706 res!346118) b!553712))

(assert (= (and b!553712 res!346117) b!553710))

(assert (= (and b!553710 res!346124) b!553707))

(assert (= (and b!553707 res!346115) b!553704))

(declare-fun m!530841 () Bool)

(assert (=> b!553709 m!530841))

(declare-fun m!530843 () Bool)

(assert (=> b!553703 m!530843))

(declare-fun m!530845 () Bool)

(assert (=> b!553707 m!530845))

(declare-fun m!530847 () Bool)

(assert (=> b!553707 m!530847))

(declare-fun m!530849 () Bool)

(assert (=> b!553708 m!530849))

(assert (=> b!553708 m!530849))

(declare-fun m!530851 () Bool)

(assert (=> b!553708 m!530851))

(declare-fun m!530853 () Bool)

(assert (=> b!553712 m!530853))

(declare-fun m!530855 () Bool)

(assert (=> start!50652 m!530855))

(declare-fun m!530857 () Bool)

(assert (=> start!50652 m!530857))

(declare-fun m!530859 () Bool)

(assert (=> b!553711 m!530859))

(declare-fun m!530861 () Bool)

(assert (=> b!553706 m!530861))

(assert (=> b!553710 m!530849))

(declare-fun m!530863 () Bool)

(assert (=> b!553710 m!530863))

(assert (=> b!553710 m!530849))

(declare-fun m!530865 () Bool)

(assert (=> b!553710 m!530865))

(declare-fun m!530867 () Bool)

(assert (=> b!553710 m!530867))

(assert (=> b!553710 m!530865))

(declare-fun m!530869 () Bool)

(assert (=> b!553710 m!530869))

(assert (=> b!553710 m!530863))

(assert (=> b!553710 m!530849))

(declare-fun m!530871 () Bool)

(assert (=> b!553710 m!530871))

(declare-fun m!530873 () Bool)

(assert (=> b!553710 m!530873))

(assert (=> b!553710 m!530865))

(assert (=> b!553710 m!530867))

(assert (=> b!553704 m!530849))

(assert (=> b!553704 m!530849))

(declare-fun m!530875 () Bool)

(assert (=> b!553704 m!530875))

(push 1)

