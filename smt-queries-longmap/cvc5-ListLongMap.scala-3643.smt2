; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50234 () Bool)

(assert start!50234)

(declare-fun b!549876 () Bool)

(declare-fun res!343023 () Bool)

(declare-fun e!317501 () Bool)

(assert (=> b!549876 (=> (not res!343023) (not e!317501))))

(declare-datatypes ((array!34687 0))(
  ( (array!34688 (arr!16659 (Array (_ BitVec 32) (_ BitVec 64))) (size!17023 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34687)

(declare-datatypes ((List!10739 0))(
  ( (Nil!10736) (Cons!10735 (h!11708 (_ BitVec 64)) (t!16967 List!10739)) )
))
(declare-fun arrayNoDuplicates!0 (array!34687 (_ BitVec 32) List!10739) Bool)

(assert (=> b!549876 (= res!343023 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10736))))

(declare-fun b!549877 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!549877 (= e!317501 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34687 (_ BitVec 32)) Bool)

(assert (=> b!549877 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16990 0))(
  ( (Unit!16991) )
))
(declare-fun lt!250363 () Unit!16990)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16990)

(assert (=> b!549877 (= lt!250363 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!549878 () Bool)

(declare-fun res!343026 () Bool)

(declare-fun e!317500 () Bool)

(assert (=> b!549878 (=> (not res!343026) (not e!317500))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549878 (= res!343026 (validKeyInArray!0 k!1914))))

(declare-fun b!549879 () Bool)

(declare-fun res!343025 () Bool)

(assert (=> b!549879 (=> (not res!343025) (not e!317500))))

(declare-fun arrayContainsKey!0 (array!34687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549879 (= res!343025 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!343022 () Bool)

(assert (=> start!50234 (=> (not res!343022) (not e!317500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50234 (= res!343022 (validMask!0 mask!3119))))

(assert (=> start!50234 e!317500))

(assert (=> start!50234 true))

(declare-fun array_inv!12455 (array!34687) Bool)

(assert (=> start!50234 (array_inv!12455 a!3118)))

(declare-fun b!549880 () Bool)

(declare-fun res!343024 () Bool)

(assert (=> b!549880 (=> (not res!343024) (not e!317501))))

(assert (=> b!549880 (= res!343024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549881 () Bool)

(declare-fun res!343028 () Bool)

(assert (=> b!549881 (=> (not res!343028) (not e!317501))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5108 0))(
  ( (MissingZero!5108 (index!22659 (_ BitVec 32))) (Found!5108 (index!22660 (_ BitVec 32))) (Intermediate!5108 (undefined!5920 Bool) (index!22661 (_ BitVec 32)) (x!51590 (_ BitVec 32))) (Undefined!5108) (MissingVacant!5108 (index!22662 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34687 (_ BitVec 32)) SeekEntryResult!5108)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549881 (= res!343028 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16659 a!3118) j!142) mask!3119) (select (arr!16659 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16659 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16659 a!3118) i!1132 k!1914) j!142) (array!34688 (store (arr!16659 a!3118) i!1132 k!1914) (size!17023 a!3118)) mask!3119)))))

(declare-fun b!549882 () Bool)

(assert (=> b!549882 (= e!317500 e!317501)))

(declare-fun res!343027 () Bool)

(assert (=> b!549882 (=> (not res!343027) (not e!317501))))

(declare-fun lt!250362 () SeekEntryResult!5108)

(assert (=> b!549882 (= res!343027 (or (= lt!250362 (MissingZero!5108 i!1132)) (= lt!250362 (MissingVacant!5108 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34687 (_ BitVec 32)) SeekEntryResult!5108)

(assert (=> b!549882 (= lt!250362 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549883 () Bool)

(declare-fun res!343020 () Bool)

(assert (=> b!549883 (=> (not res!343020) (not e!317500))))

(assert (=> b!549883 (= res!343020 (validKeyInArray!0 (select (arr!16659 a!3118) j!142)))))

(declare-fun b!549884 () Bool)

(declare-fun res!343021 () Bool)

(assert (=> b!549884 (=> (not res!343021) (not e!317500))))

(assert (=> b!549884 (= res!343021 (and (= (size!17023 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17023 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17023 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50234 res!343022) b!549884))

(assert (= (and b!549884 res!343021) b!549883))

(assert (= (and b!549883 res!343020) b!549878))

(assert (= (and b!549878 res!343026) b!549879))

(assert (= (and b!549879 res!343025) b!549882))

(assert (= (and b!549882 res!343027) b!549880))

(assert (= (and b!549880 res!343024) b!549876))

(assert (= (and b!549876 res!343023) b!549881))

(assert (= (and b!549881 res!343028) b!549877))

(declare-fun m!526833 () Bool)

(assert (=> b!549882 m!526833))

(declare-fun m!526835 () Bool)

(assert (=> b!549880 m!526835))

(declare-fun m!526837 () Bool)

(assert (=> b!549881 m!526837))

(declare-fun m!526839 () Bool)

(assert (=> b!549881 m!526839))

(assert (=> b!549881 m!526837))

(declare-fun m!526841 () Bool)

(assert (=> b!549881 m!526841))

(declare-fun m!526843 () Bool)

(assert (=> b!549881 m!526843))

(assert (=> b!549881 m!526841))

(declare-fun m!526845 () Bool)

(assert (=> b!549881 m!526845))

(assert (=> b!549881 m!526839))

(assert (=> b!549881 m!526837))

(declare-fun m!526847 () Bool)

(assert (=> b!549881 m!526847))

(declare-fun m!526849 () Bool)

(assert (=> b!549881 m!526849))

(assert (=> b!549881 m!526841))

(assert (=> b!549881 m!526843))

(declare-fun m!526851 () Bool)

(assert (=> b!549878 m!526851))

(declare-fun m!526853 () Bool)

(assert (=> start!50234 m!526853))

(declare-fun m!526855 () Bool)

(assert (=> start!50234 m!526855))

(declare-fun m!526857 () Bool)

(assert (=> b!549879 m!526857))

(assert (=> b!549883 m!526837))

(assert (=> b!549883 m!526837))

(declare-fun m!526859 () Bool)

(assert (=> b!549883 m!526859))

(declare-fun m!526861 () Bool)

(assert (=> b!549877 m!526861))

(declare-fun m!526863 () Bool)

(assert (=> b!549877 m!526863))

(declare-fun m!526865 () Bool)

(assert (=> b!549876 m!526865))

(push 1)

