; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50816 () Bool)

(assert start!50816)

(declare-fun b!556019 () Bool)

(declare-fun res!348435 () Bool)

(declare-fun e!320392 () Bool)

(assert (=> b!556019 (=> (not res!348435) (not e!320392))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35041 0))(
  ( (array!35042 (arr!16830 (Array (_ BitVec 32) (_ BitVec 64))) (size!17194 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35041)

(assert (=> b!556019 (= res!348435 (and (= (size!17194 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17194 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17194 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556020 () Bool)

(declare-fun res!348437 () Bool)

(declare-fun e!320391 () Bool)

(assert (=> b!556020 (=> (not res!348437) (not e!320391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35041 (_ BitVec 32)) Bool)

(assert (=> b!556020 (= res!348437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556021 () Bool)

(declare-fun e!320390 () Bool)

(assert (=> b!556021 (= e!320391 e!320390)))

(declare-fun res!348438 () Bool)

(assert (=> b!556021 (=> (not res!348438) (not e!320390))))

(declare-fun lt!252760 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5279 0))(
  ( (MissingZero!5279 (index!23343 (_ BitVec 32))) (Found!5279 (index!23344 (_ BitVec 32))) (Intermediate!5279 (undefined!6091 Bool) (index!23345 (_ BitVec 32)) (x!52241 (_ BitVec 32))) (Undefined!5279) (MissingVacant!5279 (index!23346 (_ BitVec 32))) )
))
(declare-fun lt!252759 () SeekEntryResult!5279)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35041 (_ BitVec 32)) SeekEntryResult!5279)

(assert (=> b!556021 (= res!348438 (= lt!252759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252760 (select (store (arr!16830 a!3118) i!1132 k!1914) j!142) (array!35042 (store (arr!16830 a!3118) i!1132 k!1914) (size!17194 a!3118)) mask!3119)))))

(declare-fun lt!252758 () (_ BitVec 32))

(assert (=> b!556021 (= lt!252759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252758 (select (arr!16830 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556021 (= lt!252760 (toIndex!0 (select (store (arr!16830 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!556021 (= lt!252758 (toIndex!0 (select (arr!16830 a!3118) j!142) mask!3119))))

(declare-fun b!556022 () Bool)

(assert (=> b!556022 (= e!320390 (not (or (not (is-Intermediate!5279 lt!252759)) (undefined!6091 lt!252759) (= (select (arr!16830 a!3118) (index!23345 lt!252759)) (select (arr!16830 a!3118) j!142)) (= (select (arr!16830 a!3118) (index!23345 lt!252759)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!320393 () Bool)

(assert (=> b!556022 e!320393))

(declare-fun res!348433 () Bool)

(assert (=> b!556022 (=> (not res!348433) (not e!320393))))

(assert (=> b!556022 (= res!348433 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17332 0))(
  ( (Unit!17333) )
))
(declare-fun lt!252757 () Unit!17332)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35041 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17332)

(assert (=> b!556022 (= lt!252757 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!348432 () Bool)

(assert (=> start!50816 (=> (not res!348432) (not e!320392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50816 (= res!348432 (validMask!0 mask!3119))))

(assert (=> start!50816 e!320392))

(assert (=> start!50816 true))

(declare-fun array_inv!12626 (array!35041) Bool)

(assert (=> start!50816 (array_inv!12626 a!3118)))

(declare-fun b!556023 () Bool)

(assert (=> b!556023 (= e!320392 e!320391)))

(declare-fun res!348439 () Bool)

(assert (=> b!556023 (=> (not res!348439) (not e!320391))))

(declare-fun lt!252756 () SeekEntryResult!5279)

(assert (=> b!556023 (= res!348439 (or (= lt!252756 (MissingZero!5279 i!1132)) (= lt!252756 (MissingVacant!5279 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35041 (_ BitVec 32)) SeekEntryResult!5279)

(assert (=> b!556023 (= lt!252756 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!556024 () Bool)

(declare-fun res!348436 () Bool)

(assert (=> b!556024 (=> (not res!348436) (not e!320392))))

(declare-fun arrayContainsKey!0 (array!35041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556024 (= res!348436 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556025 () Bool)

(assert (=> b!556025 (= e!320393 (= (seekEntryOrOpen!0 (select (arr!16830 a!3118) j!142) a!3118 mask!3119) (Found!5279 j!142)))))

(declare-fun b!556026 () Bool)

(declare-fun res!348431 () Bool)

(assert (=> b!556026 (=> (not res!348431) (not e!320391))))

(declare-datatypes ((List!10910 0))(
  ( (Nil!10907) (Cons!10906 (h!11891 (_ BitVec 64)) (t!17138 List!10910)) )
))
(declare-fun arrayNoDuplicates!0 (array!35041 (_ BitVec 32) List!10910) Bool)

(assert (=> b!556026 (= res!348431 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10907))))

(declare-fun b!556027 () Bool)

(declare-fun res!348440 () Bool)

(assert (=> b!556027 (=> (not res!348440) (not e!320392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556027 (= res!348440 (validKeyInArray!0 (select (arr!16830 a!3118) j!142)))))

(declare-fun b!556028 () Bool)

(declare-fun res!348434 () Bool)

(assert (=> b!556028 (=> (not res!348434) (not e!320392))))

(assert (=> b!556028 (= res!348434 (validKeyInArray!0 k!1914))))

(assert (= (and start!50816 res!348432) b!556019))

(assert (= (and b!556019 res!348435) b!556027))

(assert (= (and b!556027 res!348440) b!556028))

(assert (= (and b!556028 res!348434) b!556024))

(assert (= (and b!556024 res!348436) b!556023))

(assert (= (and b!556023 res!348439) b!556020))

(assert (= (and b!556020 res!348437) b!556026))

(assert (= (and b!556026 res!348431) b!556021))

(assert (= (and b!556021 res!348438) b!556022))

(assert (= (and b!556022 res!348433) b!556025))

(declare-fun m!533919 () Bool)

(assert (=> b!556020 m!533919))

(declare-fun m!533921 () Bool)

(assert (=> b!556025 m!533921))

(assert (=> b!556025 m!533921))

(declare-fun m!533923 () Bool)

(assert (=> b!556025 m!533923))

(declare-fun m!533925 () Bool)

(assert (=> b!556024 m!533925))

(declare-fun m!533927 () Bool)

(assert (=> b!556022 m!533927))

(assert (=> b!556022 m!533921))

(declare-fun m!533929 () Bool)

(assert (=> b!556022 m!533929))

(declare-fun m!533931 () Bool)

(assert (=> b!556022 m!533931))

(declare-fun m!533933 () Bool)

(assert (=> b!556023 m!533933))

(declare-fun m!533935 () Bool)

(assert (=> b!556026 m!533935))

(declare-fun m!533937 () Bool)

(assert (=> start!50816 m!533937))

(declare-fun m!533939 () Bool)

(assert (=> start!50816 m!533939))

(assert (=> b!556021 m!533921))

(declare-fun m!533941 () Bool)

(assert (=> b!556021 m!533941))

(assert (=> b!556021 m!533921))

(declare-fun m!533943 () Bool)

(assert (=> b!556021 m!533943))

(declare-fun m!533945 () Bool)

(assert (=> b!556021 m!533945))

(assert (=> b!556021 m!533943))

(declare-fun m!533947 () Bool)

(assert (=> b!556021 m!533947))

(assert (=> b!556021 m!533943))

(declare-fun m!533949 () Bool)

(assert (=> b!556021 m!533949))

(assert (=> b!556021 m!533921))

(declare-fun m!533951 () Bool)

(assert (=> b!556021 m!533951))

(declare-fun m!533953 () Bool)

(assert (=> b!556028 m!533953))

(assert (=> b!556027 m!533921))

(assert (=> b!556027 m!533921))

(declare-fun m!533955 () Bool)

(assert (=> b!556027 m!533955))

(push 1)

(assert (not b!556021))

(assert (not b!556027))

(assert (not b!556028))

(assert (not b!556023))

(assert (not b!556020))

(assert (not b!556022))

(assert (not start!50816))

(assert (not b!556024))

(assert (not b!556025))

(assert (not b!556026))

(check-sat)

