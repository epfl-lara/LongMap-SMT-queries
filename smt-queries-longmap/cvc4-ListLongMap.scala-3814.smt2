; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52308 () Bool)

(assert start!52308)

(declare-fun b!570886 () Bool)

(declare-fun res!360673 () Bool)

(declare-fun e!328329 () Bool)

(assert (=> b!570886 (=> (not res!360673) (not e!328329))))

(declare-datatypes ((array!35768 0))(
  ( (array!35769 (arr!17174 (Array (_ BitVec 32) (_ BitVec 64))) (size!17538 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35768)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570886 (= res!360673 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570887 () Bool)

(declare-fun e!328330 () Bool)

(declare-fun e!328327 () Bool)

(assert (=> b!570887 (= e!328330 e!328327)))

(declare-fun res!360669 () Bool)

(assert (=> b!570887 (=> (not res!360669) (not e!328327))))

(declare-datatypes ((SeekEntryResult!5623 0))(
  ( (MissingZero!5623 (index!24719 (_ BitVec 32))) (Found!5623 (index!24720 (_ BitVec 32))) (Intermediate!5623 (undefined!6435 Bool) (index!24721 (_ BitVec 32)) (x!53587 (_ BitVec 32))) (Undefined!5623) (MissingVacant!5623 (index!24722 (_ BitVec 32))) )
))
(declare-fun lt!260280 () SeekEntryResult!5623)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!260277 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35768 (_ BitVec 32)) SeekEntryResult!5623)

(assert (=> b!570887 (= res!360669 (= lt!260280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260277 (select (store (arr!17174 a!3118) i!1132 k!1914) j!142) (array!35769 (store (arr!17174 a!3118) i!1132 k!1914) (size!17538 a!3118)) mask!3119)))))

(declare-fun lt!260276 () (_ BitVec 32))

(assert (=> b!570887 (= lt!260280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260276 (select (arr!17174 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570887 (= lt!260277 (toIndex!0 (select (store (arr!17174 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!570887 (= lt!260276 (toIndex!0 (select (arr!17174 a!3118) j!142) mask!3119))))

(declare-fun b!570888 () Bool)

(declare-fun res!360667 () Bool)

(assert (=> b!570888 (=> (not res!360667) (not e!328329))))

(assert (=> b!570888 (= res!360667 (and (= (size!17538 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17538 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17538 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570889 () Bool)

(assert (=> b!570889 (= e!328327 (not true))))

(declare-fun e!328331 () Bool)

(assert (=> b!570889 e!328331))

(declare-fun res!360672 () Bool)

(assert (=> b!570889 (=> (not res!360672) (not e!328331))))

(declare-fun lt!260281 () SeekEntryResult!5623)

(assert (=> b!570889 (= res!360672 (= lt!260281 (Found!5623 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35768 (_ BitVec 32)) SeekEntryResult!5623)

(assert (=> b!570889 (= lt!260281 (seekEntryOrOpen!0 (select (arr!17174 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35768 (_ BitVec 32)) Bool)

(assert (=> b!570889 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17948 0))(
  ( (Unit!17949) )
))
(declare-fun lt!260278 () Unit!17948)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17948)

(assert (=> b!570889 (= lt!260278 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!360676 () Bool)

(assert (=> start!52308 (=> (not res!360676) (not e!328329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52308 (= res!360676 (validMask!0 mask!3119))))

(assert (=> start!52308 e!328329))

(assert (=> start!52308 true))

(declare-fun array_inv!12970 (array!35768) Bool)

(assert (=> start!52308 (array_inv!12970 a!3118)))

(declare-fun b!570890 () Bool)

(declare-fun res!360675 () Bool)

(assert (=> b!570890 (=> (not res!360675) (not e!328329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570890 (= res!360675 (validKeyInArray!0 k!1914))))

(declare-fun b!570891 () Bool)

(declare-fun e!328328 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35768 (_ BitVec 32)) SeekEntryResult!5623)

(assert (=> b!570891 (= e!328328 (= lt!260281 (seekKeyOrZeroReturnVacant!0 (x!53587 lt!260280) (index!24721 lt!260280) (index!24721 lt!260280) (select (arr!17174 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570892 () Bool)

(declare-fun res!360670 () Bool)

(assert (=> b!570892 (=> (not res!360670) (not e!328330))))

(assert (=> b!570892 (= res!360670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570893 () Bool)

(assert (=> b!570893 (= e!328329 e!328330)))

(declare-fun res!360668 () Bool)

(assert (=> b!570893 (=> (not res!360668) (not e!328330))))

(declare-fun lt!260279 () SeekEntryResult!5623)

(assert (=> b!570893 (= res!360668 (or (= lt!260279 (MissingZero!5623 i!1132)) (= lt!260279 (MissingVacant!5623 i!1132))))))

(assert (=> b!570893 (= lt!260279 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!570894 () Bool)

(declare-fun res!360677 () Bool)

(assert (=> b!570894 (=> (not res!360677) (not e!328330))))

(declare-datatypes ((List!11254 0))(
  ( (Nil!11251) (Cons!11250 (h!12274 (_ BitVec 64)) (t!17482 List!11254)) )
))
(declare-fun arrayNoDuplicates!0 (array!35768 (_ BitVec 32) List!11254) Bool)

(assert (=> b!570894 (= res!360677 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11251))))

(declare-fun b!570895 () Bool)

(declare-fun res!360674 () Bool)

(assert (=> b!570895 (=> (not res!360674) (not e!328329))))

(assert (=> b!570895 (= res!360674 (validKeyInArray!0 (select (arr!17174 a!3118) j!142)))))

(declare-fun b!570896 () Bool)

(assert (=> b!570896 (= e!328331 e!328328)))

(declare-fun res!360671 () Bool)

(assert (=> b!570896 (=> res!360671 e!328328)))

(assert (=> b!570896 (= res!360671 (or (undefined!6435 lt!260280) (not (is-Intermediate!5623 lt!260280)) (= (select (arr!17174 a!3118) (index!24721 lt!260280)) (select (arr!17174 a!3118) j!142)) (= (select (arr!17174 a!3118) (index!24721 lt!260280)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!52308 res!360676) b!570888))

(assert (= (and b!570888 res!360667) b!570895))

(assert (= (and b!570895 res!360674) b!570890))

(assert (= (and b!570890 res!360675) b!570886))

(assert (= (and b!570886 res!360673) b!570893))

(assert (= (and b!570893 res!360668) b!570892))

(assert (= (and b!570892 res!360670) b!570894))

(assert (= (and b!570894 res!360677) b!570887))

(assert (= (and b!570887 res!360669) b!570889))

(assert (= (and b!570889 res!360672) b!570896))

(assert (= (and b!570896 (not res!360671)) b!570891))

(declare-fun m!549809 () Bool)

(assert (=> b!570894 m!549809))

(declare-fun m!549811 () Bool)

(assert (=> b!570896 m!549811))

(declare-fun m!549813 () Bool)

(assert (=> b!570896 m!549813))

(assert (=> b!570891 m!549813))

(assert (=> b!570891 m!549813))

(declare-fun m!549815 () Bool)

(assert (=> b!570891 m!549815))

(assert (=> b!570895 m!549813))

(assert (=> b!570895 m!549813))

(declare-fun m!549817 () Bool)

(assert (=> b!570895 m!549817))

(assert (=> b!570889 m!549813))

(assert (=> b!570889 m!549813))

(declare-fun m!549819 () Bool)

(assert (=> b!570889 m!549819))

(declare-fun m!549821 () Bool)

(assert (=> b!570889 m!549821))

(declare-fun m!549823 () Bool)

(assert (=> b!570889 m!549823))

(declare-fun m!549825 () Bool)

(assert (=> start!52308 m!549825))

(declare-fun m!549827 () Bool)

(assert (=> start!52308 m!549827))

(declare-fun m!549829 () Bool)

(assert (=> b!570892 m!549829))

(declare-fun m!549831 () Bool)

(assert (=> b!570890 m!549831))

(assert (=> b!570887 m!549813))

(declare-fun m!549833 () Bool)

(assert (=> b!570887 m!549833))

(assert (=> b!570887 m!549813))

(declare-fun m!549835 () Bool)

(assert (=> b!570887 m!549835))

(assert (=> b!570887 m!549813))

(declare-fun m!549837 () Bool)

(assert (=> b!570887 m!549837))

(assert (=> b!570887 m!549837))

(declare-fun m!549839 () Bool)

(assert (=> b!570887 m!549839))

(declare-fun m!549841 () Bool)

(assert (=> b!570887 m!549841))

(assert (=> b!570887 m!549837))

(declare-fun m!549843 () Bool)

(assert (=> b!570887 m!549843))

(declare-fun m!549845 () Bool)

(assert (=> b!570886 m!549845))

(declare-fun m!549847 () Bool)

(assert (=> b!570893 m!549847))

(push 1)

