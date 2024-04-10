; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50810 () Bool)

(assert start!50810)

(declare-fun b!555929 () Bool)

(declare-fun e!320352 () Bool)

(declare-fun e!320353 () Bool)

(assert (=> b!555929 (= e!320352 e!320353)))

(declare-fun res!348341 () Bool)

(assert (=> b!555929 (=> (not res!348341) (not e!320353))))

(declare-datatypes ((SeekEntryResult!5276 0))(
  ( (MissingZero!5276 (index!23331 (_ BitVec 32))) (Found!5276 (index!23332 (_ BitVec 32))) (Intermediate!5276 (undefined!6088 Bool) (index!23333 (_ BitVec 32)) (x!52230 (_ BitVec 32))) (Undefined!5276) (MissingVacant!5276 (index!23334 (_ BitVec 32))) )
))
(declare-fun lt!252733 () SeekEntryResult!5276)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555929 (= res!348341 (or (= lt!252733 (MissingZero!5276 i!1132)) (= lt!252733 (MissingVacant!5276 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!35035 0))(
  ( (array!35036 (arr!16827 (Array (_ BitVec 32) (_ BitVec 64))) (size!17191 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35035)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35035 (_ BitVec 32)) SeekEntryResult!5276)

(assert (=> b!555929 (= lt!252733 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!555930 () Bool)

(declare-fun res!348344 () Bool)

(assert (=> b!555930 (=> (not res!348344) (not e!320352))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!555930 (= res!348344 (and (= (size!17191 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17191 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17191 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555931 () Bool)

(declare-fun res!348343 () Bool)

(assert (=> b!555931 (=> (not res!348343) (not e!320353))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35035 (_ BitVec 32)) SeekEntryResult!5276)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555931 (= res!348343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16827 a!3118) j!142) mask!3119) (select (arr!16827 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16827 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16827 a!3118) i!1132 k!1914) j!142) (array!35036 (store (arr!16827 a!3118) i!1132 k!1914) (size!17191 a!3118)) mask!3119)))))

(declare-fun b!555932 () Bool)

(declare-fun res!348350 () Bool)

(assert (=> b!555932 (=> (not res!348350) (not e!320352))))

(declare-fun arrayContainsKey!0 (array!35035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555932 (= res!348350 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555933 () Bool)

(declare-fun e!320354 () Bool)

(assert (=> b!555933 (= e!320354 (= (seekEntryOrOpen!0 (select (arr!16827 a!3118) j!142) a!3118 mask!3119) (Found!5276 j!142)))))

(declare-fun res!348347 () Bool)

(assert (=> start!50810 (=> (not res!348347) (not e!320352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50810 (= res!348347 (validMask!0 mask!3119))))

(assert (=> start!50810 e!320352))

(assert (=> start!50810 true))

(declare-fun array_inv!12623 (array!35035) Bool)

(assert (=> start!50810 (array_inv!12623 a!3118)))

(declare-fun b!555934 () Bool)

(declare-fun res!348345 () Bool)

(assert (=> b!555934 (=> (not res!348345) (not e!320352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555934 (= res!348345 (validKeyInArray!0 (select (arr!16827 a!3118) j!142)))))

(declare-fun b!555935 () Bool)

(declare-fun res!348342 () Bool)

(assert (=> b!555935 (=> (not res!348342) (not e!320353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35035 (_ BitVec 32)) Bool)

(assert (=> b!555935 (= res!348342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555936 () Bool)

(declare-fun res!348346 () Bool)

(assert (=> b!555936 (=> (not res!348346) (not e!320353))))

(declare-datatypes ((List!10907 0))(
  ( (Nil!10904) (Cons!10903 (h!11888 (_ BitVec 64)) (t!17135 List!10907)) )
))
(declare-fun arrayNoDuplicates!0 (array!35035 (_ BitVec 32) List!10907) Bool)

(assert (=> b!555936 (= res!348346 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10904))))

(declare-fun b!555937 () Bool)

(assert (=> b!555937 (= e!320353 (not true))))

(assert (=> b!555937 e!320354))

(declare-fun res!348348 () Bool)

(assert (=> b!555937 (=> (not res!348348) (not e!320354))))

(assert (=> b!555937 (= res!348348 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17326 0))(
  ( (Unit!17327) )
))
(declare-fun lt!252732 () Unit!17326)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17326)

(assert (=> b!555937 (= lt!252732 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555938 () Bool)

(declare-fun res!348349 () Bool)

(assert (=> b!555938 (=> (not res!348349) (not e!320352))))

(assert (=> b!555938 (= res!348349 (validKeyInArray!0 k!1914))))

(assert (= (and start!50810 res!348347) b!555930))

(assert (= (and b!555930 res!348344) b!555934))

(assert (= (and b!555934 res!348345) b!555938))

(assert (= (and b!555938 res!348349) b!555932))

(assert (= (and b!555932 res!348350) b!555929))

(assert (= (and b!555929 res!348341) b!555935))

(assert (= (and b!555935 res!348342) b!555936))

(assert (= (and b!555936 res!348346) b!555931))

(assert (= (and b!555931 res!348343) b!555937))

(assert (= (and b!555937 res!348348) b!555933))

(declare-fun m!533811 () Bool)

(assert (=> b!555938 m!533811))

(declare-fun m!533813 () Bool)

(assert (=> b!555931 m!533813))

(declare-fun m!533815 () Bool)

(assert (=> b!555931 m!533815))

(assert (=> b!555931 m!533813))

(declare-fun m!533817 () Bool)

(assert (=> b!555931 m!533817))

(declare-fun m!533819 () Bool)

(assert (=> b!555931 m!533819))

(assert (=> b!555931 m!533817))

(declare-fun m!533821 () Bool)

(assert (=> b!555931 m!533821))

(assert (=> b!555931 m!533815))

(assert (=> b!555931 m!533813))

(declare-fun m!533823 () Bool)

(assert (=> b!555931 m!533823))

(declare-fun m!533825 () Bool)

(assert (=> b!555931 m!533825))

(assert (=> b!555931 m!533817))

(assert (=> b!555931 m!533819))

(declare-fun m!533827 () Bool)

(assert (=> b!555935 m!533827))

(declare-fun m!533829 () Bool)

(assert (=> b!555936 m!533829))

(assert (=> b!555934 m!533813))

(assert (=> b!555934 m!533813))

(declare-fun m!533831 () Bool)

(assert (=> b!555934 m!533831))

(declare-fun m!533833 () Bool)

(assert (=> start!50810 m!533833))

(declare-fun m!533835 () Bool)

(assert (=> start!50810 m!533835))

(declare-fun m!533837 () Bool)

(assert (=> b!555929 m!533837))

(declare-fun m!533839 () Bool)

(assert (=> b!555932 m!533839))

(declare-fun m!533841 () Bool)

(assert (=> b!555937 m!533841))

(declare-fun m!533843 () Bool)

(assert (=> b!555937 m!533843))

(assert (=> b!555933 m!533813))

(assert (=> b!555933 m!533813))

(declare-fun m!533845 () Bool)

(assert (=> b!555933 m!533845))

(push 1)

