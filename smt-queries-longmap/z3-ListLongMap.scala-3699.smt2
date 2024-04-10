; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50812 () Bool)

(assert start!50812)

(declare-fun b!555959 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!320365 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35037 0))(
  ( (array!35038 (arr!16828 (Array (_ BitVec 32) (_ BitVec 64))) (size!17192 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35037)

(declare-datatypes ((SeekEntryResult!5277 0))(
  ( (MissingZero!5277 (index!23335 (_ BitVec 32))) (Found!5277 (index!23336 (_ BitVec 32))) (Intermediate!5277 (undefined!6089 Bool) (index!23337 (_ BitVec 32)) (x!52231 (_ BitVec 32))) (Undefined!5277) (MissingVacant!5277 (index!23338 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35037 (_ BitVec 32)) SeekEntryResult!5277)

(assert (=> b!555959 (= e!320365 (= (seekEntryOrOpen!0 (select (arr!16828 a!3118) j!142) a!3118 mask!3119) (Found!5277 j!142)))))

(declare-fun b!555960 () Bool)

(declare-fun res!348375 () Bool)

(declare-fun e!320367 () Bool)

(assert (=> b!555960 (=> (not res!348375) (not e!320367))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555960 (= res!348375 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555962 () Bool)

(declare-fun res!348371 () Bool)

(assert (=> b!555962 (=> (not res!348371) (not e!320367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555962 (= res!348371 (validKeyInArray!0 k0!1914))))

(declare-fun b!555963 () Bool)

(declare-fun e!320364 () Bool)

(assert (=> b!555963 (= e!320364 (not true))))

(assert (=> b!555963 e!320365))

(declare-fun res!348378 () Bool)

(assert (=> b!555963 (=> (not res!348378) (not e!320365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35037 (_ BitVec 32)) Bool)

(assert (=> b!555963 (= res!348378 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17328 0))(
  ( (Unit!17329) )
))
(declare-fun lt!252738 () Unit!17328)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35037 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17328)

(assert (=> b!555963 (= lt!252738 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555964 () Bool)

(declare-fun res!348380 () Bool)

(assert (=> b!555964 (=> (not res!348380) (not e!320367))))

(assert (=> b!555964 (= res!348380 (validKeyInArray!0 (select (arr!16828 a!3118) j!142)))))

(declare-fun b!555965 () Bool)

(declare-fun res!348372 () Bool)

(assert (=> b!555965 (=> (not res!348372) (not e!320364))))

(assert (=> b!555965 (= res!348372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555966 () Bool)

(assert (=> b!555966 (= e!320367 e!320364)))

(declare-fun res!348373 () Bool)

(assert (=> b!555966 (=> (not res!348373) (not e!320364))))

(declare-fun lt!252739 () SeekEntryResult!5277)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555966 (= res!348373 (or (= lt!252739 (MissingZero!5277 i!1132)) (= lt!252739 (MissingVacant!5277 i!1132))))))

(assert (=> b!555966 (= lt!252739 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555961 () Bool)

(declare-fun res!348374 () Bool)

(assert (=> b!555961 (=> (not res!348374) (not e!320364))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35037 (_ BitVec 32)) SeekEntryResult!5277)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555961 (= res!348374 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16828 a!3118) j!142) mask!3119) (select (arr!16828 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16828 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16828 a!3118) i!1132 k0!1914) j!142) (array!35038 (store (arr!16828 a!3118) i!1132 k0!1914) (size!17192 a!3118)) mask!3119)))))

(declare-fun res!348376 () Bool)

(assert (=> start!50812 (=> (not res!348376) (not e!320367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50812 (= res!348376 (validMask!0 mask!3119))))

(assert (=> start!50812 e!320367))

(assert (=> start!50812 true))

(declare-fun array_inv!12624 (array!35037) Bool)

(assert (=> start!50812 (array_inv!12624 a!3118)))

(declare-fun b!555967 () Bool)

(declare-fun res!348379 () Bool)

(assert (=> b!555967 (=> (not res!348379) (not e!320367))))

(assert (=> b!555967 (= res!348379 (and (= (size!17192 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17192 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17192 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555968 () Bool)

(declare-fun res!348377 () Bool)

(assert (=> b!555968 (=> (not res!348377) (not e!320364))))

(declare-datatypes ((List!10908 0))(
  ( (Nil!10905) (Cons!10904 (h!11889 (_ BitVec 64)) (t!17136 List!10908)) )
))
(declare-fun arrayNoDuplicates!0 (array!35037 (_ BitVec 32) List!10908) Bool)

(assert (=> b!555968 (= res!348377 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10905))))

(assert (= (and start!50812 res!348376) b!555967))

(assert (= (and b!555967 res!348379) b!555964))

(assert (= (and b!555964 res!348380) b!555962))

(assert (= (and b!555962 res!348371) b!555960))

(assert (= (and b!555960 res!348375) b!555966))

(assert (= (and b!555966 res!348373) b!555965))

(assert (= (and b!555965 res!348372) b!555968))

(assert (= (and b!555968 res!348377) b!555961))

(assert (= (and b!555961 res!348374) b!555963))

(assert (= (and b!555963 res!348378) b!555959))

(declare-fun m!533847 () Bool)

(assert (=> b!555966 m!533847))

(declare-fun m!533849 () Bool)

(assert (=> b!555960 m!533849))

(declare-fun m!533851 () Bool)

(assert (=> b!555963 m!533851))

(declare-fun m!533853 () Bool)

(assert (=> b!555963 m!533853))

(declare-fun m!533855 () Bool)

(assert (=> b!555962 m!533855))

(declare-fun m!533857 () Bool)

(assert (=> b!555965 m!533857))

(declare-fun m!533859 () Bool)

(assert (=> b!555961 m!533859))

(declare-fun m!533861 () Bool)

(assert (=> b!555961 m!533861))

(assert (=> b!555961 m!533859))

(declare-fun m!533863 () Bool)

(assert (=> b!555961 m!533863))

(declare-fun m!533865 () Bool)

(assert (=> b!555961 m!533865))

(assert (=> b!555961 m!533863))

(declare-fun m!533867 () Bool)

(assert (=> b!555961 m!533867))

(assert (=> b!555961 m!533861))

(assert (=> b!555961 m!533859))

(declare-fun m!533869 () Bool)

(assert (=> b!555961 m!533869))

(declare-fun m!533871 () Bool)

(assert (=> b!555961 m!533871))

(assert (=> b!555961 m!533863))

(assert (=> b!555961 m!533865))

(assert (=> b!555959 m!533859))

(assert (=> b!555959 m!533859))

(declare-fun m!533873 () Bool)

(assert (=> b!555959 m!533873))

(declare-fun m!533875 () Bool)

(assert (=> start!50812 m!533875))

(declare-fun m!533877 () Bool)

(assert (=> start!50812 m!533877))

(assert (=> b!555964 m!533859))

(assert (=> b!555964 m!533859))

(declare-fun m!533879 () Bool)

(assert (=> b!555964 m!533879))

(declare-fun m!533881 () Bool)

(assert (=> b!555968 m!533881))

(check-sat (not b!555966) (not start!50812) (not b!555965) (not b!555968) (not b!555961) (not b!555960) (not b!555962) (not b!555959) (not b!555964) (not b!555963))
(check-sat)
