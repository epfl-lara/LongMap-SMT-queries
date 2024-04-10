; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50762 () Bool)

(assert start!50762)

(declare-fun b!555279 () Bool)

(declare-fun res!347693 () Bool)

(declare-fun e!320066 () Bool)

(assert (=> b!555279 (=> (not res!347693) (not e!320066))))

(declare-datatypes ((array!34987 0))(
  ( (array!34988 (arr!16803 (Array (_ BitVec 32) (_ BitVec 64))) (size!17167 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34987)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555279 (= res!347693 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555280 () Bool)

(declare-fun res!347695 () Bool)

(assert (=> b!555280 (=> (not res!347695) (not e!320066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555280 (= res!347695 (validKeyInArray!0 k!1914))))

(declare-fun b!555281 () Bool)

(declare-fun res!347691 () Bool)

(declare-fun e!320064 () Bool)

(assert (=> b!555281 (=> (not res!347691) (not e!320064))))

(declare-datatypes ((List!10883 0))(
  ( (Nil!10880) (Cons!10879 (h!11864 (_ BitVec 64)) (t!17111 List!10883)) )
))
(declare-fun arrayNoDuplicates!0 (array!34987 (_ BitVec 32) List!10883) Bool)

(assert (=> b!555281 (= res!347691 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10880))))

(declare-fun b!555282 () Bool)

(declare-fun res!347697 () Bool)

(assert (=> b!555282 (=> (not res!347697) (not e!320064))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34987 (_ BitVec 32)) Bool)

(assert (=> b!555282 (= res!347697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555283 () Bool)

(declare-fun e!320065 () Bool)

(assert (=> b!555283 (= e!320064 e!320065)))

(declare-fun res!347696 () Bool)

(assert (=> b!555283 (=> (not res!347696) (not e!320065))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!252309 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5252 0))(
  ( (MissingZero!5252 (index!23235 (_ BitVec 32))) (Found!5252 (index!23236 (_ BitVec 32))) (Intermediate!5252 (undefined!6064 Bool) (index!23237 (_ BitVec 32)) (x!52142 (_ BitVec 32))) (Undefined!5252) (MissingVacant!5252 (index!23238 (_ BitVec 32))) )
))
(declare-fun lt!252313 () SeekEntryResult!5252)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34987 (_ BitVec 32)) SeekEntryResult!5252)

(assert (=> b!555283 (= res!347696 (= lt!252313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252309 (select (store (arr!16803 a!3118) i!1132 k!1914) j!142) (array!34988 (store (arr!16803 a!3118) i!1132 k!1914) (size!17167 a!3118)) mask!3119)))))

(declare-fun lt!252310 () (_ BitVec 32))

(assert (=> b!555283 (= lt!252313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252310 (select (arr!16803 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555283 (= lt!252309 (toIndex!0 (select (store (arr!16803 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555283 (= lt!252310 (toIndex!0 (select (arr!16803 a!3118) j!142) mask!3119))))

(declare-fun b!555285 () Bool)

(assert (=> b!555285 (= e!320065 (not true))))

(declare-fun lt!252308 () SeekEntryResult!5252)

(assert (=> b!555285 (and (= lt!252308 (Found!5252 j!142)) (or (undefined!6064 lt!252313) (not (is-Intermediate!5252 lt!252313)) (= (select (arr!16803 a!3118) (index!23237 lt!252313)) (select (arr!16803 a!3118) j!142)) (not (= (select (arr!16803 a!3118) (index!23237 lt!252313)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252308 (MissingZero!5252 (index!23237 lt!252313)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34987 (_ BitVec 32)) SeekEntryResult!5252)

(assert (=> b!555285 (= lt!252308 (seekEntryOrOpen!0 (select (arr!16803 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555285 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17278 0))(
  ( (Unit!17279) )
))
(declare-fun lt!252311 () Unit!17278)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34987 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17278)

(assert (=> b!555285 (= lt!252311 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555286 () Bool)

(declare-fun res!347699 () Bool)

(assert (=> b!555286 (=> (not res!347699) (not e!320066))))

(assert (=> b!555286 (= res!347699 (and (= (size!17167 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17167 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17167 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555287 () Bool)

(declare-fun res!347692 () Bool)

(assert (=> b!555287 (=> (not res!347692) (not e!320066))))

(assert (=> b!555287 (= res!347692 (validKeyInArray!0 (select (arr!16803 a!3118) j!142)))))

(declare-fun b!555284 () Bool)

(assert (=> b!555284 (= e!320066 e!320064)))

(declare-fun res!347698 () Bool)

(assert (=> b!555284 (=> (not res!347698) (not e!320064))))

(declare-fun lt!252312 () SeekEntryResult!5252)

(assert (=> b!555284 (= res!347698 (or (= lt!252312 (MissingZero!5252 i!1132)) (= lt!252312 (MissingVacant!5252 i!1132))))))

(assert (=> b!555284 (= lt!252312 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!347694 () Bool)

(assert (=> start!50762 (=> (not res!347694) (not e!320066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50762 (= res!347694 (validMask!0 mask!3119))))

(assert (=> start!50762 e!320066))

(assert (=> start!50762 true))

(declare-fun array_inv!12599 (array!34987) Bool)

(assert (=> start!50762 (array_inv!12599 a!3118)))

(assert (= (and start!50762 res!347694) b!555286))

(assert (= (and b!555286 res!347699) b!555287))

(assert (= (and b!555287 res!347692) b!555280))

(assert (= (and b!555280 res!347695) b!555279))

(assert (= (and b!555279 res!347693) b!555284))

(assert (= (and b!555284 res!347698) b!555282))

(assert (= (and b!555282 res!347697) b!555281))

(assert (= (and b!555281 res!347691) b!555283))

(assert (= (and b!555283 res!347696) b!555285))

(declare-fun m!532899 () Bool)

(assert (=> b!555280 m!532899))

(declare-fun m!532901 () Bool)

(assert (=> b!555287 m!532901))

(assert (=> b!555287 m!532901))

(declare-fun m!532903 () Bool)

(assert (=> b!555287 m!532903))

(declare-fun m!532905 () Bool)

(assert (=> b!555282 m!532905))

(assert (=> b!555283 m!532901))

(declare-fun m!532907 () Bool)

(assert (=> b!555283 m!532907))

(assert (=> b!555283 m!532901))

(assert (=> b!555283 m!532901))

(declare-fun m!532909 () Bool)

(assert (=> b!555283 m!532909))

(declare-fun m!532911 () Bool)

(assert (=> b!555283 m!532911))

(declare-fun m!532913 () Bool)

(assert (=> b!555283 m!532913))

(assert (=> b!555283 m!532911))

(declare-fun m!532915 () Bool)

(assert (=> b!555283 m!532915))

(assert (=> b!555283 m!532911))

(declare-fun m!532917 () Bool)

(assert (=> b!555283 m!532917))

(assert (=> b!555285 m!532901))

(declare-fun m!532919 () Bool)

(assert (=> b!555285 m!532919))

(declare-fun m!532921 () Bool)

(assert (=> b!555285 m!532921))

(declare-fun m!532923 () Bool)

(assert (=> b!555285 m!532923))

(assert (=> b!555285 m!532901))

(declare-fun m!532925 () Bool)

(assert (=> b!555285 m!532925))

(declare-fun m!532927 () Bool)

(assert (=> b!555279 m!532927))

(declare-fun m!532929 () Bool)

(assert (=> b!555281 m!532929))

(declare-fun m!532931 () Bool)

(assert (=> start!50762 m!532931))

(declare-fun m!532933 () Bool)

(assert (=> start!50762 m!532933))

(declare-fun m!532935 () Bool)

(assert (=> b!555284 m!532935))

(push 1)

