; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52784 () Bool)

(assert start!52784)

(declare-fun b!575589 () Bool)

(declare-fun res!364012 () Bool)

(declare-fun e!331187 () Bool)

(assert (=> b!575589 (=> (not res!364012) (not e!331187))))

(declare-datatypes ((array!35929 0))(
  ( (array!35930 (arr!17247 (Array (_ BitVec 32) (_ BitVec 64))) (size!17611 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35929)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575589 (= res!364012 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575590 () Bool)

(declare-fun e!331190 () Bool)

(declare-fun e!331188 () Bool)

(assert (=> b!575590 (= e!331190 e!331188)))

(declare-fun res!364011 () Bool)

(assert (=> b!575590 (=> (not res!364011) (not e!331188))))

(declare-datatypes ((SeekEntryResult!5696 0))(
  ( (MissingZero!5696 (index!25011 (_ BitVec 32))) (Found!5696 (index!25012 (_ BitVec 32))) (Intermediate!5696 (undefined!6508 Bool) (index!25013 (_ BitVec 32)) (x!53905 (_ BitVec 32))) (Undefined!5696) (MissingVacant!5696 (index!25014 (_ BitVec 32))) )
))
(declare-fun lt!263203 () SeekEntryResult!5696)

(declare-fun lt!263209 () array!35929)

(declare-fun lt!263205 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!263204 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35929 (_ BitVec 32)) SeekEntryResult!5696)

(assert (=> b!575590 (= res!364011 (= lt!263203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263205 lt!263204 lt!263209 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!263200 () (_ BitVec 32))

(assert (=> b!575590 (= lt!263203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263200 (select (arr!17247 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575590 (= lt!263205 (toIndex!0 lt!263204 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575590 (= lt!263204 (select (store (arr!17247 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!575590 (= lt!263200 (toIndex!0 (select (arr!17247 a!3118) j!142) mask!3119))))

(assert (=> b!575590 (= lt!263209 (array!35930 (store (arr!17247 a!3118) i!1132 k!1914) (size!17611 a!3118)))))

(declare-fun b!575591 () Bool)

(assert (=> b!575591 (= e!331187 e!331190)))

(declare-fun res!364015 () Bool)

(assert (=> b!575591 (=> (not res!364015) (not e!331190))))

(declare-fun lt!263201 () SeekEntryResult!5696)

(assert (=> b!575591 (= res!364015 (or (= lt!263201 (MissingZero!5696 i!1132)) (= lt!263201 (MissingVacant!5696 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35929 (_ BitVec 32)) SeekEntryResult!5696)

(assert (=> b!575591 (= lt!263201 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!575593 () Bool)

(declare-fun e!331189 () Bool)

(assert (=> b!575593 (= e!331189 true)))

(declare-fun lt!263199 () SeekEntryResult!5696)

(declare-fun lt!263212 () SeekEntryResult!5696)

(assert (=> b!575593 (= lt!263199 lt!263212)))

(declare-datatypes ((Unit!18094 0))(
  ( (Unit!18095) )
))
(declare-fun lt!263206 () Unit!18094)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18094)

(assert (=> b!575593 (= lt!263206 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k!1914 j!142 (x!53905 lt!263203) (index!25013 lt!263203) (index!25013 lt!263203) mask!3119))))

(declare-fun b!575594 () Bool)

(declare-fun res!364008 () Bool)

(assert (=> b!575594 (=> (not res!364008) (not e!331187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575594 (= res!364008 (validKeyInArray!0 (select (arr!17247 a!3118) j!142)))))

(declare-fun b!575595 () Bool)

(declare-fun e!331185 () Bool)

(declare-fun e!331186 () Bool)

(assert (=> b!575595 (= e!331185 e!331186)))

(declare-fun res!364007 () Bool)

(assert (=> b!575595 (=> res!364007 e!331186)))

(declare-fun lt!263211 () (_ BitVec 64))

(assert (=> b!575595 (= res!364007 (or (= lt!263211 (select (arr!17247 a!3118) j!142)) (= lt!263211 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575595 (= lt!263211 (select (arr!17247 a!3118) (index!25013 lt!263203)))))

(declare-fun b!575596 () Bool)

(declare-fun res!364013 () Bool)

(assert (=> b!575596 (=> (not res!364013) (not e!331187))))

(assert (=> b!575596 (= res!364013 (and (= (size!17611 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17611 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17611 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575597 () Bool)

(declare-fun res!364006 () Bool)

(assert (=> b!575597 (=> (not res!364006) (not e!331190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35929 (_ BitVec 32)) Bool)

(assert (=> b!575597 (= res!364006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575598 () Bool)

(assert (=> b!575598 (= e!331186 e!331189)))

(declare-fun res!364009 () Bool)

(assert (=> b!575598 (=> res!364009 e!331189)))

(declare-fun lt!263208 () SeekEntryResult!5696)

(assert (=> b!575598 (= res!364009 (or (bvslt (index!25013 lt!263203) #b00000000000000000000000000000000) (bvsge (index!25013 lt!263203) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53905 lt!263203) #b01111111111111111111111111111110) (bvslt (x!53905 lt!263203) #b00000000000000000000000000000000) (not (= lt!263211 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17247 a!3118) i!1132 k!1914) (index!25013 lt!263203)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263199 lt!263208))))))

(declare-fun lt!263207 () SeekEntryResult!5696)

(assert (=> b!575598 (= lt!263207 lt!263212)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35929 (_ BitVec 32)) SeekEntryResult!5696)

(assert (=> b!575598 (= lt!263212 (seekKeyOrZeroReturnVacant!0 (x!53905 lt!263203) (index!25013 lt!263203) (index!25013 lt!263203) lt!263204 lt!263209 mask!3119))))

(assert (=> b!575598 (= lt!263207 (seekEntryOrOpen!0 lt!263204 lt!263209 mask!3119))))

(declare-fun lt!263202 () SeekEntryResult!5696)

(assert (=> b!575598 (= lt!263202 lt!263199)))

(assert (=> b!575598 (= lt!263199 (seekKeyOrZeroReturnVacant!0 (x!53905 lt!263203) (index!25013 lt!263203) (index!25013 lt!263203) (select (arr!17247 a!3118) j!142) a!3118 mask!3119))))

(declare-fun res!364016 () Bool)

(assert (=> start!52784 (=> (not res!364016) (not e!331187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52784 (= res!364016 (validMask!0 mask!3119))))

(assert (=> start!52784 e!331187))

(assert (=> start!52784 true))

(declare-fun array_inv!13043 (array!35929) Bool)

(assert (=> start!52784 (array_inv!13043 a!3118)))

(declare-fun b!575592 () Bool)

(declare-fun res!364010 () Bool)

(assert (=> b!575592 (=> (not res!364010) (not e!331187))))

(assert (=> b!575592 (= res!364010 (validKeyInArray!0 k!1914))))

(declare-fun b!575599 () Bool)

(declare-fun res!364014 () Bool)

(assert (=> b!575599 (=> (not res!364014) (not e!331190))))

(declare-datatypes ((List!11327 0))(
  ( (Nil!11324) (Cons!11323 (h!12362 (_ BitVec 64)) (t!17555 List!11327)) )
))
(declare-fun arrayNoDuplicates!0 (array!35929 (_ BitVec 32) List!11327) Bool)

(assert (=> b!575599 (= res!364014 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11324))))

(declare-fun b!575600 () Bool)

(assert (=> b!575600 (= e!331188 (not e!331185))))

(declare-fun res!364005 () Bool)

(assert (=> b!575600 (=> res!364005 e!331185)))

(assert (=> b!575600 (= res!364005 (or (undefined!6508 lt!263203) (not (is-Intermediate!5696 lt!263203))))))

(assert (=> b!575600 (= lt!263202 lt!263208)))

(assert (=> b!575600 (= lt!263208 (Found!5696 j!142))))

(assert (=> b!575600 (= lt!263202 (seekEntryOrOpen!0 (select (arr!17247 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!575600 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263210 () Unit!18094)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18094)

(assert (=> b!575600 (= lt!263210 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52784 res!364016) b!575596))

(assert (= (and b!575596 res!364013) b!575594))

(assert (= (and b!575594 res!364008) b!575592))

(assert (= (and b!575592 res!364010) b!575589))

(assert (= (and b!575589 res!364012) b!575591))

(assert (= (and b!575591 res!364015) b!575597))

(assert (= (and b!575597 res!364006) b!575599))

(assert (= (and b!575599 res!364014) b!575590))

(assert (= (and b!575590 res!364011) b!575600))

(assert (= (and b!575600 (not res!364005)) b!575595))

(assert (= (and b!575595 (not res!364007)) b!575598))

(assert (= (and b!575598 (not res!364009)) b!575593))

(declare-fun m!554493 () Bool)

(assert (=> b!575594 m!554493))

(assert (=> b!575594 m!554493))

(declare-fun m!554495 () Bool)

(assert (=> b!575594 m!554495))

(declare-fun m!554497 () Bool)

(assert (=> start!52784 m!554497))

(declare-fun m!554499 () Bool)

(assert (=> start!52784 m!554499))

(declare-fun m!554501 () Bool)

(assert (=> b!575597 m!554501))

(declare-fun m!554503 () Bool)

(assert (=> b!575598 m!554503))

(declare-fun m!554505 () Bool)

(assert (=> b!575598 m!554505))

(assert (=> b!575598 m!554493))

(declare-fun m!554507 () Bool)

(assert (=> b!575598 m!554507))

(declare-fun m!554509 () Bool)

(assert (=> b!575598 m!554509))

(declare-fun m!554511 () Bool)

(assert (=> b!575598 m!554511))

(assert (=> b!575598 m!554493))

(declare-fun m!554513 () Bool)

(assert (=> b!575593 m!554513))

(assert (=> b!575595 m!554493))

(declare-fun m!554515 () Bool)

(assert (=> b!575595 m!554515))

(declare-fun m!554517 () Bool)

(assert (=> b!575590 m!554517))

(assert (=> b!575590 m!554493))

(declare-fun m!554519 () Bool)

(assert (=> b!575590 m!554519))

(assert (=> b!575590 m!554505))

(declare-fun m!554521 () Bool)

(assert (=> b!575590 m!554521))

(assert (=> b!575590 m!554493))

(declare-fun m!554523 () Bool)

(assert (=> b!575590 m!554523))

(assert (=> b!575590 m!554493))

(declare-fun m!554525 () Bool)

(assert (=> b!575590 m!554525))

(assert (=> b!575600 m!554493))

(assert (=> b!575600 m!554493))

(declare-fun m!554527 () Bool)

(assert (=> b!575600 m!554527))

(declare-fun m!554529 () Bool)

(assert (=> b!575600 m!554529))

(declare-fun m!554531 () Bool)

(assert (=> b!575600 m!554531))

(declare-fun m!554533 () Bool)

(assert (=> b!575589 m!554533))

(declare-fun m!554535 () Bool)

(assert (=> b!575599 m!554535))

(declare-fun m!554537 () Bool)

(assert (=> b!575592 m!554537))

(declare-fun m!554539 () Bool)

(assert (=> b!575591 m!554539))

(push 1)

