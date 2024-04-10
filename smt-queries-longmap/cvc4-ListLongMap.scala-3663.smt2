; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50598 () Bool)

(assert start!50598)

(declare-fun b!552884 () Bool)

(declare-fun res!345302 () Bool)

(declare-fun e!319007 () Bool)

(assert (=> b!552884 (=> (not res!345302) (not e!319007))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552884 (= res!345302 (validKeyInArray!0 k!1914))))

(declare-fun b!552885 () Bool)

(declare-fun res!345297 () Bool)

(declare-fun e!319008 () Bool)

(assert (=> b!552885 (=> (not res!345297) (not e!319008))))

(declare-datatypes ((array!34823 0))(
  ( (array!34824 (arr!16721 (Array (_ BitVec 32) (_ BitVec 64))) (size!17085 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34823)

(declare-datatypes ((List!10801 0))(
  ( (Nil!10798) (Cons!10797 (h!11782 (_ BitVec 64)) (t!17029 List!10801)) )
))
(declare-fun arrayNoDuplicates!0 (array!34823 (_ BitVec 32) List!10801) Bool)

(assert (=> b!552885 (= res!345297 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10798))))

(declare-fun res!345298 () Bool)

(assert (=> start!50598 (=> (not res!345298) (not e!319007))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50598 (= res!345298 (validMask!0 mask!3119))))

(assert (=> start!50598 e!319007))

(assert (=> start!50598 true))

(declare-fun array_inv!12517 (array!34823) Bool)

(assert (=> start!50598 (array_inv!12517 a!3118)))

(declare-fun b!552886 () Bool)

(declare-fun res!345300 () Bool)

(assert (=> b!552886 (=> (not res!345300) (not e!319007))))

(declare-fun arrayContainsKey!0 (array!34823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552886 (= res!345300 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552887 () Bool)

(declare-fun e!319009 () Bool)

(assert (=> b!552887 (= e!319008 e!319009)))

(declare-fun res!345296 () Bool)

(assert (=> b!552887 (=> (not res!345296) (not e!319009))))

(declare-datatypes ((SeekEntryResult!5170 0))(
  ( (MissingZero!5170 (index!22907 (_ BitVec 32))) (Found!5170 (index!22908 (_ BitVec 32))) (Intermediate!5170 (undefined!5982 Bool) (index!22909 (_ BitVec 32)) (x!51836 (_ BitVec 32))) (Undefined!5170) (MissingVacant!5170 (index!22910 (_ BitVec 32))) )
))
(declare-fun lt!251323 () SeekEntryResult!5170)

(declare-fun lt!251321 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34823 (_ BitVec 32)) SeekEntryResult!5170)

(assert (=> b!552887 (= res!345296 (= lt!251323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251321 (select (store (arr!16721 a!3118) i!1132 k!1914) j!142) (array!34824 (store (arr!16721 a!3118) i!1132 k!1914) (size!17085 a!3118)) mask!3119)))))

(declare-fun lt!251322 () (_ BitVec 32))

(assert (=> b!552887 (= lt!251323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251322 (select (arr!16721 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552887 (= lt!251321 (toIndex!0 (select (store (arr!16721 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!552887 (= lt!251322 (toIndex!0 (select (arr!16721 a!3118) j!142) mask!3119))))

(declare-fun b!552888 () Bool)

(declare-fun res!345299 () Bool)

(assert (=> b!552888 (=> (not res!345299) (not e!319007))))

(assert (=> b!552888 (= res!345299 (and (= (size!17085 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17085 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17085 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552889 () Bool)

(declare-fun e!319011 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34823 (_ BitVec 32)) SeekEntryResult!5170)

(assert (=> b!552889 (= e!319011 (= (seekEntryOrOpen!0 (select (arr!16721 a!3118) j!142) a!3118 mask!3119) (Found!5170 j!142)))))

(declare-fun b!552890 () Bool)

(assert (=> b!552890 (= e!319007 e!319008)))

(declare-fun res!345304 () Bool)

(assert (=> b!552890 (=> (not res!345304) (not e!319008))))

(declare-fun lt!251320 () SeekEntryResult!5170)

(assert (=> b!552890 (= res!345304 (or (= lt!251320 (MissingZero!5170 i!1132)) (= lt!251320 (MissingVacant!5170 i!1132))))))

(assert (=> b!552890 (= lt!251320 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!552891 () Bool)

(assert (=> b!552891 (= e!319009 (not (or (not (is-Intermediate!5170 lt!251323)) (not (undefined!5982 lt!251323)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!552891 e!319011))

(declare-fun res!345303 () Bool)

(assert (=> b!552891 (=> (not res!345303) (not e!319011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34823 (_ BitVec 32)) Bool)

(assert (=> b!552891 (= res!345303 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17114 0))(
  ( (Unit!17115) )
))
(declare-fun lt!251319 () Unit!17114)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17114)

(assert (=> b!552891 (= lt!251319 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552892 () Bool)

(declare-fun res!345305 () Bool)

(assert (=> b!552892 (=> (not res!345305) (not e!319007))))

(assert (=> b!552892 (= res!345305 (validKeyInArray!0 (select (arr!16721 a!3118) j!142)))))

(declare-fun b!552893 () Bool)

(declare-fun res!345301 () Bool)

(assert (=> b!552893 (=> (not res!345301) (not e!319008))))

(assert (=> b!552893 (= res!345301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50598 res!345298) b!552888))

(assert (= (and b!552888 res!345299) b!552892))

(assert (= (and b!552892 res!345305) b!552884))

(assert (= (and b!552884 res!345302) b!552886))

(assert (= (and b!552886 res!345300) b!552890))

(assert (= (and b!552890 res!345304) b!552893))

(assert (= (and b!552893 res!345301) b!552885))

(assert (= (and b!552885 res!345297) b!552887))

(assert (= (and b!552887 res!345296) b!552891))

(assert (= (and b!552891 res!345303) b!552889))

(declare-fun m!529857 () Bool)

(assert (=> b!552887 m!529857))

(declare-fun m!529859 () Bool)

(assert (=> b!552887 m!529859))

(assert (=> b!552887 m!529857))

(declare-fun m!529861 () Bool)

(assert (=> b!552887 m!529861))

(declare-fun m!529863 () Bool)

(assert (=> b!552887 m!529863))

(assert (=> b!552887 m!529861))

(declare-fun m!529865 () Bool)

(assert (=> b!552887 m!529865))

(assert (=> b!552887 m!529857))

(declare-fun m!529867 () Bool)

(assert (=> b!552887 m!529867))

(assert (=> b!552887 m!529861))

(declare-fun m!529869 () Bool)

(assert (=> b!552887 m!529869))

(assert (=> b!552892 m!529857))

(assert (=> b!552892 m!529857))

(declare-fun m!529871 () Bool)

(assert (=> b!552892 m!529871))

(declare-fun m!529873 () Bool)

(assert (=> b!552884 m!529873))

(assert (=> b!552889 m!529857))

(assert (=> b!552889 m!529857))

(declare-fun m!529875 () Bool)

(assert (=> b!552889 m!529875))

(declare-fun m!529877 () Bool)

(assert (=> b!552891 m!529877))

(declare-fun m!529879 () Bool)

(assert (=> b!552891 m!529879))

(declare-fun m!529881 () Bool)

(assert (=> start!50598 m!529881))

(declare-fun m!529883 () Bool)

(assert (=> start!50598 m!529883))

(declare-fun m!529885 () Bool)

(assert (=> b!552885 m!529885))

(declare-fun m!529887 () Bool)

(assert (=> b!552893 m!529887))

(declare-fun m!529889 () Bool)

(assert (=> b!552886 m!529889))

(declare-fun m!529891 () Bool)

(assert (=> b!552890 m!529891))

(push 1)

