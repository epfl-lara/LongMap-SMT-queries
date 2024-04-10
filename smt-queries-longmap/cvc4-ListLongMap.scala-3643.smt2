; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50238 () Bool)

(assert start!50238)

(declare-fun b!549930 () Bool)

(declare-fun e!317518 () Bool)

(declare-fun e!317520 () Bool)

(assert (=> b!549930 (= e!317518 e!317520)))

(declare-fun res!343075 () Bool)

(assert (=> b!549930 (=> (not res!343075) (not e!317520))))

(declare-datatypes ((SeekEntryResult!5110 0))(
  ( (MissingZero!5110 (index!22667 (_ BitVec 32))) (Found!5110 (index!22668 (_ BitVec 32))) (Intermediate!5110 (undefined!5922 Bool) (index!22669 (_ BitVec 32)) (x!51592 (_ BitVec 32))) (Undefined!5110) (MissingVacant!5110 (index!22670 (_ BitVec 32))) )
))
(declare-fun lt!250375 () SeekEntryResult!5110)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549930 (= res!343075 (or (= lt!250375 (MissingZero!5110 i!1132)) (= lt!250375 (MissingVacant!5110 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34691 0))(
  ( (array!34692 (arr!16661 (Array (_ BitVec 32) (_ BitVec 64))) (size!17025 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34691)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34691 (_ BitVec 32)) SeekEntryResult!5110)

(assert (=> b!549930 (= lt!250375 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549931 () Bool)

(declare-fun res!343081 () Bool)

(assert (=> b!549931 (=> (not res!343081) (not e!317520))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34691 (_ BitVec 32)) SeekEntryResult!5110)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549931 (= res!343081 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16661 a!3118) j!142) mask!3119) (select (arr!16661 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16661 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16661 a!3118) i!1132 k!1914) j!142) (array!34692 (store (arr!16661 a!3118) i!1132 k!1914) (size!17025 a!3118)) mask!3119)))))

(declare-fun b!549932 () Bool)

(declare-fun res!343080 () Bool)

(assert (=> b!549932 (=> (not res!343080) (not e!317518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549932 (= res!343080 (validKeyInArray!0 k!1914))))

(declare-fun res!343077 () Bool)

(assert (=> start!50238 (=> (not res!343077) (not e!317518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50238 (= res!343077 (validMask!0 mask!3119))))

(assert (=> start!50238 e!317518))

(assert (=> start!50238 true))

(declare-fun array_inv!12457 (array!34691) Bool)

(assert (=> start!50238 (array_inv!12457 a!3118)))

(declare-fun b!549933 () Bool)

(declare-fun res!343078 () Bool)

(assert (=> b!549933 (=> (not res!343078) (not e!317518))))

(declare-fun arrayContainsKey!0 (array!34691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549933 (= res!343078 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549934 () Bool)

(declare-fun res!343074 () Bool)

(assert (=> b!549934 (=> (not res!343074) (not e!317520))))

(declare-datatypes ((List!10741 0))(
  ( (Nil!10738) (Cons!10737 (h!11710 (_ BitVec 64)) (t!16969 List!10741)) )
))
(declare-fun arrayNoDuplicates!0 (array!34691 (_ BitVec 32) List!10741) Bool)

(assert (=> b!549934 (= res!343074 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10738))))

(declare-fun b!549935 () Bool)

(declare-fun res!343079 () Bool)

(assert (=> b!549935 (=> (not res!343079) (not e!317518))))

(assert (=> b!549935 (= res!343079 (and (= (size!17025 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17025 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17025 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549936 () Bool)

(declare-fun res!343082 () Bool)

(assert (=> b!549936 (=> (not res!343082) (not e!317518))))

(assert (=> b!549936 (= res!343082 (validKeyInArray!0 (select (arr!16661 a!3118) j!142)))))

(declare-fun b!549937 () Bool)

(declare-fun res!343076 () Bool)

(assert (=> b!549937 (=> (not res!343076) (not e!317520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34691 (_ BitVec 32)) Bool)

(assert (=> b!549937 (= res!343076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549938 () Bool)

(assert (=> b!549938 (= e!317520 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!549938 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16994 0))(
  ( (Unit!16995) )
))
(declare-fun lt!250374 () Unit!16994)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16994)

(assert (=> b!549938 (= lt!250374 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50238 res!343077) b!549935))

(assert (= (and b!549935 res!343079) b!549936))

(assert (= (and b!549936 res!343082) b!549932))

(assert (= (and b!549932 res!343080) b!549933))

(assert (= (and b!549933 res!343078) b!549930))

(assert (= (and b!549930 res!343075) b!549937))

(assert (= (and b!549937 res!343076) b!549934))

(assert (= (and b!549934 res!343074) b!549931))

(assert (= (and b!549931 res!343081) b!549938))

(declare-fun m!526901 () Bool)

(assert (=> b!549938 m!526901))

(declare-fun m!526903 () Bool)

(assert (=> b!549938 m!526903))

(declare-fun m!526905 () Bool)

(assert (=> b!549934 m!526905))

(declare-fun m!526907 () Bool)

(assert (=> b!549933 m!526907))

(declare-fun m!526909 () Bool)

(assert (=> b!549936 m!526909))

(assert (=> b!549936 m!526909))

(declare-fun m!526911 () Bool)

(assert (=> b!549936 m!526911))

(declare-fun m!526913 () Bool)

(assert (=> b!549932 m!526913))

(declare-fun m!526915 () Bool)

(assert (=> b!549937 m!526915))

(declare-fun m!526917 () Bool)

(assert (=> b!549930 m!526917))

(assert (=> b!549931 m!526909))

(declare-fun m!526919 () Bool)

(assert (=> b!549931 m!526919))

(assert (=> b!549931 m!526909))

(declare-fun m!526921 () Bool)

(assert (=> b!549931 m!526921))

(declare-fun m!526923 () Bool)

(assert (=> b!549931 m!526923))

(assert (=> b!549931 m!526921))

(declare-fun m!526925 () Bool)

(assert (=> b!549931 m!526925))

(assert (=> b!549931 m!526919))

(assert (=> b!549931 m!526909))

(declare-fun m!526927 () Bool)

(assert (=> b!549931 m!526927))

(declare-fun m!526929 () Bool)

(assert (=> b!549931 m!526929))

(assert (=> b!549931 m!526921))

(assert (=> b!549931 m!526923))

(declare-fun m!526931 () Bool)

(assert (=> start!50238 m!526931))

(declare-fun m!526933 () Bool)

(assert (=> start!50238 m!526933))

(push 1)

(assert (not b!549936))

(assert (not b!549937))

(assert (not b!549930))

(assert (not b!549931))

(assert (not b!549938))

