; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68110 () Bool)

(assert start!68110)

(declare-fun b!791741 () Bool)

(declare-fun res!536165 () Bool)

(declare-fun e!440097 () Bool)

(assert (=> b!791741 (=> (not res!536165) (not e!440097))))

(declare-datatypes ((array!42904 0))(
  ( (array!42905 (arr!20533 (Array (_ BitVec 32) (_ BitVec 64))) (size!20953 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42904)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791741 (= res!536165 (validKeyInArray!0 (select (arr!20533 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!440096 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!791742 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8089 0))(
  ( (MissingZero!8089 (index!34724 (_ BitVec 32))) (Found!8089 (index!34725 (_ BitVec 32))) (Intermediate!8089 (undefined!8901 Bool) (index!34726 (_ BitVec 32)) (x!65826 (_ BitVec 32))) (Undefined!8089) (MissingVacant!8089 (index!34727 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42904 (_ BitVec 32)) SeekEntryResult!8089)

(assert (=> b!791742 (= e!440096 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20533 a!3186) j!159) a!3186 mask!3328) (Found!8089 j!159)))))

(declare-fun b!791743 () Bool)

(declare-fun e!440098 () Bool)

(declare-fun e!440095 () Bool)

(assert (=> b!791743 (= e!440098 e!440095)))

(declare-fun res!536153 () Bool)

(assert (=> b!791743 (=> (not res!536153) (not e!440095))))

(declare-fun lt!353410 () SeekEntryResult!8089)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42904 (_ BitVec 32)) SeekEntryResult!8089)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791743 (= res!536153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20533 a!3186) j!159) mask!3328) (select (arr!20533 a!3186) j!159) a!3186 mask!3328) lt!353410))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!791743 (= lt!353410 (Intermediate!8089 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791744 () Bool)

(declare-fun res!536159 () Bool)

(assert (=> b!791744 (=> (not res!536159) (not e!440097))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!791744 (= res!536159 (validKeyInArray!0 k0!2102))))

(declare-fun e!440094 () Bool)

(declare-fun b!791745 () Bool)

(declare-fun lt!353413 () SeekEntryResult!8089)

(assert (=> b!791745 (= e!440094 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20533 a!3186) j!159) a!3186 mask!3328) lt!353413))))

(declare-fun b!791746 () Bool)

(declare-fun res!536152 () Bool)

(assert (=> b!791746 (=> (not res!536152) (not e!440098))))

(declare-datatypes ((List!14442 0))(
  ( (Nil!14439) (Cons!14438 (h!15573 (_ BitVec 64)) (t!20749 List!14442)) )
))
(declare-fun arrayNoDuplicates!0 (array!42904 (_ BitVec 32) List!14442) Bool)

(assert (=> b!791746 (= res!536152 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14439))))

(declare-fun res!536166 () Bool)

(assert (=> start!68110 (=> (not res!536166) (not e!440097))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68110 (= res!536166 (validMask!0 mask!3328))))

(assert (=> start!68110 e!440097))

(assert (=> start!68110 true))

(declare-fun array_inv!16392 (array!42904) Bool)

(assert (=> start!68110 (array_inv!16392 a!3186)))

(declare-fun b!791747 () Bool)

(assert (=> b!791747 (= e!440097 e!440098)))

(declare-fun res!536154 () Bool)

(assert (=> b!791747 (=> (not res!536154) (not e!440098))))

(declare-fun lt!353408 () SeekEntryResult!8089)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!791747 (= res!536154 (or (= lt!353408 (MissingZero!8089 i!1173)) (= lt!353408 (MissingVacant!8089 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42904 (_ BitVec 32)) SeekEntryResult!8089)

(assert (=> b!791747 (= lt!353408 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!791748 () Bool)

(assert (=> b!791748 (= e!440096 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20533 a!3186) j!159) a!3186 mask!3328) lt!353410))))

(declare-fun b!791749 () Bool)

(declare-fun res!536163 () Bool)

(assert (=> b!791749 (=> (not res!536163) (not e!440097))))

(declare-fun arrayContainsKey!0 (array!42904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791749 (= res!536163 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!791750 () Bool)

(declare-fun e!440092 () Bool)

(assert (=> b!791750 (= e!440095 e!440092)))

(declare-fun res!536158 () Bool)

(assert (=> b!791750 (=> (not res!536158) (not e!440092))))

(declare-fun lt!353409 () array!42904)

(declare-fun lt!353412 () (_ BitVec 64))

(assert (=> b!791750 (= res!536158 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353412 mask!3328) lt!353412 lt!353409 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353412 lt!353409 mask!3328)))))

(assert (=> b!791750 (= lt!353412 (select (store (arr!20533 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!791750 (= lt!353409 (array!42905 (store (arr!20533 a!3186) i!1173 k0!2102) (size!20953 a!3186)))))

(declare-fun b!791751 () Bool)

(declare-fun res!536161 () Bool)

(assert (=> b!791751 (=> (not res!536161) (not e!440097))))

(assert (=> b!791751 (= res!536161 (and (= (size!20953 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20953 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20953 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!791752 () Bool)

(declare-fun res!536155 () Bool)

(assert (=> b!791752 (=> (not res!536155) (not e!440095))))

(assert (=> b!791752 (= res!536155 e!440096)))

(declare-fun c!88208 () Bool)

(assert (=> b!791752 (= c!88208 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791753 () Bool)

(declare-fun res!536156 () Bool)

(assert (=> b!791753 (=> (not res!536156) (not e!440095))))

(assert (=> b!791753 (= res!536156 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20533 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791754 () Bool)

(assert (=> b!791754 (= e!440092 (not true))))

(declare-fun e!440091 () Bool)

(assert (=> b!791754 e!440091))

(declare-fun res!536160 () Bool)

(assert (=> b!791754 (=> (not res!536160) (not e!440091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42904 (_ BitVec 32)) Bool)

(assert (=> b!791754 (= res!536160 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27409 0))(
  ( (Unit!27410) )
))
(declare-fun lt!353411 () Unit!27409)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27409)

(assert (=> b!791754 (= lt!353411 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791755 () Bool)

(declare-fun res!536162 () Bool)

(assert (=> b!791755 (=> (not res!536162) (not e!440098))))

(assert (=> b!791755 (= res!536162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791756 () Bool)

(assert (=> b!791756 (= e!440091 e!440094)))

(declare-fun res!536164 () Bool)

(assert (=> b!791756 (=> (not res!536164) (not e!440094))))

(assert (=> b!791756 (= res!536164 (= (seekEntryOrOpen!0 (select (arr!20533 a!3186) j!159) a!3186 mask!3328) lt!353413))))

(assert (=> b!791756 (= lt!353413 (Found!8089 j!159))))

(declare-fun b!791757 () Bool)

(declare-fun res!536157 () Bool)

(assert (=> b!791757 (=> (not res!536157) (not e!440098))))

(assert (=> b!791757 (= res!536157 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20953 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20953 a!3186))))))

(assert (= (and start!68110 res!536166) b!791751))

(assert (= (and b!791751 res!536161) b!791741))

(assert (= (and b!791741 res!536165) b!791744))

(assert (= (and b!791744 res!536159) b!791749))

(assert (= (and b!791749 res!536163) b!791747))

(assert (= (and b!791747 res!536154) b!791755))

(assert (= (and b!791755 res!536162) b!791746))

(assert (= (and b!791746 res!536152) b!791757))

(assert (= (and b!791757 res!536157) b!791743))

(assert (= (and b!791743 res!536153) b!791753))

(assert (= (and b!791753 res!536156) b!791752))

(assert (= (and b!791752 c!88208) b!791748))

(assert (= (and b!791752 (not c!88208)) b!791742))

(assert (= (and b!791752 res!536155) b!791750))

(assert (= (and b!791750 res!536158) b!791754))

(assert (= (and b!791754 res!536160) b!791756))

(assert (= (and b!791756 res!536164) b!791745))

(declare-fun m!732929 () Bool)

(assert (=> b!791741 m!732929))

(assert (=> b!791741 m!732929))

(declare-fun m!732931 () Bool)

(assert (=> b!791741 m!732931))

(assert (=> b!791743 m!732929))

(assert (=> b!791743 m!732929))

(declare-fun m!732933 () Bool)

(assert (=> b!791743 m!732933))

(assert (=> b!791743 m!732933))

(assert (=> b!791743 m!732929))

(declare-fun m!732935 () Bool)

(assert (=> b!791743 m!732935))

(declare-fun m!732937 () Bool)

(assert (=> start!68110 m!732937))

(declare-fun m!732939 () Bool)

(assert (=> start!68110 m!732939))

(declare-fun m!732941 () Bool)

(assert (=> b!791749 m!732941))

(declare-fun m!732943 () Bool)

(assert (=> b!791753 m!732943))

(declare-fun m!732945 () Bool)

(assert (=> b!791750 m!732945))

(declare-fun m!732947 () Bool)

(assert (=> b!791750 m!732947))

(assert (=> b!791750 m!732945))

(declare-fun m!732949 () Bool)

(assert (=> b!791750 m!732949))

(declare-fun m!732951 () Bool)

(assert (=> b!791750 m!732951))

(declare-fun m!732953 () Bool)

(assert (=> b!791750 m!732953))

(declare-fun m!732955 () Bool)

(assert (=> b!791747 m!732955))

(assert (=> b!791756 m!732929))

(assert (=> b!791756 m!732929))

(declare-fun m!732957 () Bool)

(assert (=> b!791756 m!732957))

(declare-fun m!732959 () Bool)

(assert (=> b!791746 m!732959))

(assert (=> b!791748 m!732929))

(assert (=> b!791748 m!732929))

(declare-fun m!732961 () Bool)

(assert (=> b!791748 m!732961))

(assert (=> b!791742 m!732929))

(assert (=> b!791742 m!732929))

(declare-fun m!732963 () Bool)

(assert (=> b!791742 m!732963))

(assert (=> b!791745 m!732929))

(assert (=> b!791745 m!732929))

(declare-fun m!732965 () Bool)

(assert (=> b!791745 m!732965))

(declare-fun m!732967 () Bool)

(assert (=> b!791744 m!732967))

(declare-fun m!732969 () Bool)

(assert (=> b!791755 m!732969))

(declare-fun m!732971 () Bool)

(assert (=> b!791754 m!732971))

(declare-fun m!732973 () Bool)

(assert (=> b!791754 m!732973))

(check-sat (not b!791756) (not b!791750) (not b!791749) (not b!791742) (not b!791744) (not start!68110) (not b!791755) (not b!791746) (not b!791745) (not b!791748) (not b!791741) (not b!791747) (not b!791754) (not b!791743))
(check-sat)
