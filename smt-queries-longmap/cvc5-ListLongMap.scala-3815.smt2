; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52310 () Bool)

(assert start!52310)

(declare-fun b!570919 () Bool)

(declare-fun e!328349 () Bool)

(assert (=> b!570919 (= e!328349 (not true))))

(declare-fun e!328350 () Bool)

(assert (=> b!570919 e!328350))

(declare-fun res!360703 () Bool)

(assert (=> b!570919 (=> (not res!360703) (not e!328350))))

(declare-datatypes ((SeekEntryResult!5624 0))(
  ( (MissingZero!5624 (index!24723 (_ BitVec 32))) (Found!5624 (index!24724 (_ BitVec 32))) (Intermediate!5624 (undefined!6436 Bool) (index!24725 (_ BitVec 32)) (x!53596 (_ BitVec 32))) (Undefined!5624) (MissingVacant!5624 (index!24726 (_ BitVec 32))) )
))
(declare-fun lt!260297 () SeekEntryResult!5624)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!570919 (= res!360703 (= lt!260297 (Found!5624 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35770 0))(
  ( (array!35771 (arr!17175 (Array (_ BitVec 32) (_ BitVec 64))) (size!17539 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35770)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35770 (_ BitVec 32)) SeekEntryResult!5624)

(assert (=> b!570919 (= lt!260297 (seekEntryOrOpen!0 (select (arr!17175 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35770 (_ BitVec 32)) Bool)

(assert (=> b!570919 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17950 0))(
  ( (Unit!17951) )
))
(declare-fun lt!260298 () Unit!17950)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17950)

(assert (=> b!570919 (= lt!260298 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570920 () Bool)

(declare-fun res!360702 () Bool)

(declare-fun e!328346 () Bool)

(assert (=> b!570920 (=> (not res!360702) (not e!328346))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570920 (= res!360702 (and (= (size!17539 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17539 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17539 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570921 () Bool)

(declare-fun res!360710 () Bool)

(assert (=> b!570921 (=> (not res!360710) (not e!328346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570921 (= res!360710 (validKeyInArray!0 (select (arr!17175 a!3118) j!142)))))

(declare-fun b!570922 () Bool)

(declare-fun e!328347 () Bool)

(assert (=> b!570922 (= e!328347 e!328349)))

(declare-fun res!360707 () Bool)

(assert (=> b!570922 (=> (not res!360707) (not e!328349))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!260299 () (_ BitVec 32))

(declare-fun lt!260294 () SeekEntryResult!5624)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35770 (_ BitVec 32)) SeekEntryResult!5624)

(assert (=> b!570922 (= res!360707 (= lt!260294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260299 (select (store (arr!17175 a!3118) i!1132 k!1914) j!142) (array!35771 (store (arr!17175 a!3118) i!1132 k!1914) (size!17539 a!3118)) mask!3119)))))

(declare-fun lt!260295 () (_ BitVec 32))

(assert (=> b!570922 (= lt!260294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260295 (select (arr!17175 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570922 (= lt!260299 (toIndex!0 (select (store (arr!17175 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!570922 (= lt!260295 (toIndex!0 (select (arr!17175 a!3118) j!142) mask!3119))))

(declare-fun b!570923 () Bool)

(declare-fun res!360701 () Bool)

(assert (=> b!570923 (=> (not res!360701) (not e!328346))))

(declare-fun arrayContainsKey!0 (array!35770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570923 (= res!360701 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570924 () Bool)

(assert (=> b!570924 (= e!328346 e!328347)))

(declare-fun res!360708 () Bool)

(assert (=> b!570924 (=> (not res!360708) (not e!328347))))

(declare-fun lt!260296 () SeekEntryResult!5624)

(assert (=> b!570924 (= res!360708 (or (= lt!260296 (MissingZero!5624 i!1132)) (= lt!260296 (MissingVacant!5624 i!1132))))))

(assert (=> b!570924 (= lt!260296 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!570925 () Bool)

(declare-fun res!360705 () Bool)

(assert (=> b!570925 (=> (not res!360705) (not e!328347))))

(declare-datatypes ((List!11255 0))(
  ( (Nil!11252) (Cons!11251 (h!12275 (_ BitVec 64)) (t!17483 List!11255)) )
))
(declare-fun arrayNoDuplicates!0 (array!35770 (_ BitVec 32) List!11255) Bool)

(assert (=> b!570925 (= res!360705 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11252))))

(declare-fun b!570926 () Bool)

(declare-fun res!360709 () Bool)

(assert (=> b!570926 (=> (not res!360709) (not e!328346))))

(assert (=> b!570926 (= res!360709 (validKeyInArray!0 k!1914))))

(declare-fun b!570927 () Bool)

(declare-fun res!360706 () Bool)

(assert (=> b!570927 (=> (not res!360706) (not e!328347))))

(assert (=> b!570927 (= res!360706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570928 () Bool)

(declare-fun e!328348 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35770 (_ BitVec 32)) SeekEntryResult!5624)

(assert (=> b!570928 (= e!328348 (= lt!260297 (seekKeyOrZeroReturnVacant!0 (x!53596 lt!260294) (index!24725 lt!260294) (index!24725 lt!260294) (select (arr!17175 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!360704 () Bool)

(assert (=> start!52310 (=> (not res!360704) (not e!328346))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52310 (= res!360704 (validMask!0 mask!3119))))

(assert (=> start!52310 e!328346))

(assert (=> start!52310 true))

(declare-fun array_inv!12971 (array!35770) Bool)

(assert (=> start!52310 (array_inv!12971 a!3118)))

(declare-fun b!570929 () Bool)

(assert (=> b!570929 (= e!328350 e!328348)))

(declare-fun res!360700 () Bool)

(assert (=> b!570929 (=> res!360700 e!328348)))

(assert (=> b!570929 (= res!360700 (or (undefined!6436 lt!260294) (not (is-Intermediate!5624 lt!260294)) (= (select (arr!17175 a!3118) (index!24725 lt!260294)) (select (arr!17175 a!3118) j!142)) (= (select (arr!17175 a!3118) (index!24725 lt!260294)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!52310 res!360704) b!570920))

(assert (= (and b!570920 res!360702) b!570921))

(assert (= (and b!570921 res!360710) b!570926))

(assert (= (and b!570926 res!360709) b!570923))

(assert (= (and b!570923 res!360701) b!570924))

(assert (= (and b!570924 res!360708) b!570927))

(assert (= (and b!570927 res!360706) b!570925))

(assert (= (and b!570925 res!360705) b!570922))

(assert (= (and b!570922 res!360707) b!570919))

(assert (= (and b!570919 res!360703) b!570929))

(assert (= (and b!570929 (not res!360700)) b!570928))

(declare-fun m!549849 () Bool)

(assert (=> b!570927 m!549849))

(declare-fun m!549851 () Bool)

(assert (=> b!570926 m!549851))

(declare-fun m!549853 () Bool)

(assert (=> b!570924 m!549853))

(declare-fun m!549855 () Bool)

(assert (=> b!570919 m!549855))

(assert (=> b!570919 m!549855))

(declare-fun m!549857 () Bool)

(assert (=> b!570919 m!549857))

(declare-fun m!549859 () Bool)

(assert (=> b!570919 m!549859))

(declare-fun m!549861 () Bool)

(assert (=> b!570919 m!549861))

(assert (=> b!570921 m!549855))

(assert (=> b!570921 m!549855))

(declare-fun m!549863 () Bool)

(assert (=> b!570921 m!549863))

(assert (=> b!570928 m!549855))

(assert (=> b!570928 m!549855))

(declare-fun m!549865 () Bool)

(assert (=> b!570928 m!549865))

(declare-fun m!549867 () Bool)

(assert (=> b!570923 m!549867))

(declare-fun m!549869 () Bool)

(assert (=> b!570929 m!549869))

(assert (=> b!570929 m!549855))

(declare-fun m!549871 () Bool)

(assert (=> start!52310 m!549871))

(declare-fun m!549873 () Bool)

(assert (=> start!52310 m!549873))

(declare-fun m!549875 () Bool)

(assert (=> b!570925 m!549875))

(assert (=> b!570922 m!549855))

(declare-fun m!549877 () Bool)

(assert (=> b!570922 m!549877))

(assert (=> b!570922 m!549855))

(declare-fun m!549879 () Bool)

(assert (=> b!570922 m!549879))

(declare-fun m!549881 () Bool)

(assert (=> b!570922 m!549881))

(declare-fun m!549883 () Bool)

(assert (=> b!570922 m!549883))

(assert (=> b!570922 m!549881))

(declare-fun m!549885 () Bool)

(assert (=> b!570922 m!549885))

(assert (=> b!570922 m!549881))

(declare-fun m!549887 () Bool)

(assert (=> b!570922 m!549887))

(assert (=> b!570922 m!549855))

(push 1)

