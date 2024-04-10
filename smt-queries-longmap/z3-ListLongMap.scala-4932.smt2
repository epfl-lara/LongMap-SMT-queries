; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67904 () Bool)

(assert start!67904)

(declare-fun b!790053 () Bool)

(declare-datatypes ((Unit!27396 0))(
  ( (Unit!27397) )
))
(declare-fun e!439107 () Unit!27396)

(declare-fun Unit!27398 () Unit!27396)

(assert (=> b!790053 (= e!439107 Unit!27398)))

(declare-fun b!790054 () Bool)

(declare-fun res!535223 () Bool)

(declare-fun e!439110 () Bool)

(assert (=> b!790054 (=> (not res!535223) (not e!439110))))

(declare-fun e!439108 () Bool)

(assert (=> b!790054 (= res!535223 e!439108)))

(declare-fun c!87825 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!790054 (= c!87825 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!790055 () Bool)

(declare-fun res!535234 () Bool)

(declare-fun e!439118 () Bool)

(assert (=> b!790055 (=> (not res!535234) (not e!439118))))

(declare-datatypes ((array!42881 0))(
  ( (array!42882 (arr!20527 (Array (_ BitVec 32) (_ BitVec 64))) (size!20948 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42881)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790055 (= res!535234 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790057 () Bool)

(declare-fun res!535229 () Bool)

(assert (=> b!790057 (=> (not res!535229) (not e!439118))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790057 (= res!535229 (validKeyInArray!0 (select (arr!20527 a!3186) j!159)))))

(declare-fun b!790058 () Bool)

(declare-fun e!439111 () Bool)

(assert (=> b!790058 (= e!439118 e!439111)))

(declare-fun res!535238 () Bool)

(assert (=> b!790058 (=> (not res!535238) (not e!439111))))

(declare-datatypes ((SeekEntryResult!8127 0))(
  ( (MissingZero!8127 (index!34876 (_ BitVec 32))) (Found!8127 (index!34877 (_ BitVec 32))) (Intermediate!8127 (undefined!8939 Bool) (index!34878 (_ BitVec 32)) (x!65812 (_ BitVec 32))) (Undefined!8127) (MissingVacant!8127 (index!34879 (_ BitVec 32))) )
))
(declare-fun lt!352639 () SeekEntryResult!8127)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!790058 (= res!535238 (or (= lt!352639 (MissingZero!8127 i!1173)) (= lt!352639 (MissingVacant!8127 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42881 (_ BitVec 32)) SeekEntryResult!8127)

(assert (=> b!790058 (= lt!352639 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!790059 () Bool)

(declare-fun e!439117 () Bool)

(declare-fun e!439112 () Bool)

(assert (=> b!790059 (= e!439117 e!439112)))

(declare-fun res!535222 () Bool)

(assert (=> b!790059 (=> res!535222 e!439112)))

(declare-fun lt!352644 () SeekEntryResult!8127)

(declare-fun lt!352652 () SeekEntryResult!8127)

(assert (=> b!790059 (= res!535222 (not (= lt!352644 lt!352652)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42881 (_ BitVec 32)) SeekEntryResult!8127)

(assert (=> b!790059 (= lt!352644 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20527 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790060 () Bool)

(declare-fun e!439114 () Bool)

(assert (=> b!790060 (= e!439114 true)))

(declare-fun lt!352643 () SeekEntryResult!8127)

(assert (=> b!790060 (= lt!352643 lt!352644)))

(declare-fun lt!352642 () Unit!27396)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42881 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27396)

(assert (=> b!790060 (= lt!352642 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!790061 () Bool)

(declare-fun e!439116 () Bool)

(assert (=> b!790061 (= e!439110 e!439116)))

(declare-fun res!535224 () Bool)

(assert (=> b!790061 (=> (not res!535224) (not e!439116))))

(declare-fun lt!352650 () SeekEntryResult!8127)

(declare-fun lt!352651 () SeekEntryResult!8127)

(assert (=> b!790061 (= res!535224 (= lt!352650 lt!352651))))

(declare-fun lt!352647 () array!42881)

(declare-fun lt!352638 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42881 (_ BitVec 32)) SeekEntryResult!8127)

(assert (=> b!790061 (= lt!352651 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352638 lt!352647 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790061 (= lt!352650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352638 mask!3328) lt!352638 lt!352647 mask!3328))))

(assert (=> b!790061 (= lt!352638 (select (store (arr!20527 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!790061 (= lt!352647 (array!42882 (store (arr!20527 a!3186) i!1173 k0!2102) (size!20948 a!3186)))))

(declare-fun b!790062 () Bool)

(declare-fun e!439113 () Bool)

(assert (=> b!790062 (= e!439113 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20527 a!3186) j!159) a!3186 mask!3328) lt!352652))))

(declare-fun b!790063 () Bool)

(declare-fun res!535230 () Bool)

(assert (=> b!790063 (=> (not res!535230) (not e!439110))))

(assert (=> b!790063 (= res!535230 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20527 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790064 () Bool)

(assert (=> b!790064 (= e!439108 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20527 a!3186) j!159) a!3186 mask!3328) (Found!8127 j!159)))))

(declare-fun b!790056 () Bool)

(declare-fun res!535232 () Bool)

(assert (=> b!790056 (=> (not res!535232) (not e!439118))))

(assert (=> b!790056 (= res!535232 (validKeyInArray!0 k0!2102))))

(declare-fun res!535227 () Bool)

(assert (=> start!67904 (=> (not res!535227) (not e!439118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67904 (= res!535227 (validMask!0 mask!3328))))

(assert (=> start!67904 e!439118))

(assert (=> start!67904 true))

(declare-fun array_inv!16323 (array!42881) Bool)

(assert (=> start!67904 (array_inv!16323 a!3186)))

(declare-fun b!790065 () Bool)

(declare-fun res!535228 () Bool)

(assert (=> b!790065 (=> (not res!535228) (not e!439111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42881 (_ BitVec 32)) Bool)

(assert (=> b!790065 (= res!535228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!790066 () Bool)

(assert (=> b!790066 (= e!439111 e!439110)))

(declare-fun res!535236 () Bool)

(assert (=> b!790066 (=> (not res!535236) (not e!439110))))

(declare-fun lt!352649 () SeekEntryResult!8127)

(assert (=> b!790066 (= res!535236 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20527 a!3186) j!159) mask!3328) (select (arr!20527 a!3186) j!159) a!3186 mask!3328) lt!352649))))

(assert (=> b!790066 (= lt!352649 (Intermediate!8127 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790067 () Bool)

(declare-fun Unit!27399 () Unit!27396)

(assert (=> b!790067 (= e!439107 Unit!27399)))

(assert (=> b!790067 false))

(declare-fun b!790068 () Bool)

(declare-fun res!535226 () Bool)

(assert (=> b!790068 (=> (not res!535226) (not e!439118))))

(assert (=> b!790068 (= res!535226 (and (= (size!20948 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20948 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20948 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790069 () Bool)

(assert (=> b!790069 (= e!439108 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20527 a!3186) j!159) a!3186 mask!3328) lt!352649))))

(declare-fun b!790070 () Bool)

(declare-fun res!535221 () Bool)

(assert (=> b!790070 (=> (not res!535221) (not e!439111))))

(assert (=> b!790070 (= res!535221 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20948 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20948 a!3186))))))

(declare-fun b!790071 () Bool)

(declare-fun e!439109 () Bool)

(assert (=> b!790071 (= e!439112 e!439109)))

(declare-fun res!535225 () Bool)

(assert (=> b!790071 (=> res!535225 e!439109)))

(declare-fun lt!352641 () (_ BitVec 64))

(assert (=> b!790071 (= res!535225 (= lt!352641 lt!352638))))

(assert (=> b!790071 (= lt!352641 (select (store (arr!20527 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!790072 () Bool)

(assert (=> b!790072 (= e!439116 (not e!439117))))

(declare-fun res!535237 () Bool)

(assert (=> b!790072 (=> res!535237 e!439117)))

(get-info :version)

(assert (=> b!790072 (= res!535237 (or (not ((_ is Intermediate!8127) lt!352651)) (bvslt x!1131 (x!65812 lt!352651)) (not (= x!1131 (x!65812 lt!352651))) (not (= index!1321 (index!34878 lt!352651)))))))

(assert (=> b!790072 e!439113))

(declare-fun res!535235 () Bool)

(assert (=> b!790072 (=> (not res!535235) (not e!439113))))

(declare-fun lt!352640 () SeekEntryResult!8127)

(assert (=> b!790072 (= res!535235 (= lt!352640 lt!352652))))

(assert (=> b!790072 (= lt!352652 (Found!8127 j!159))))

(assert (=> b!790072 (= lt!352640 (seekEntryOrOpen!0 (select (arr!20527 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!790072 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352645 () Unit!27396)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42881 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27396)

(assert (=> b!790072 (= lt!352645 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790073 () Bool)

(declare-fun res!535233 () Bool)

(assert (=> b!790073 (=> (not res!535233) (not e!439111))))

(declare-datatypes ((List!14529 0))(
  ( (Nil!14526) (Cons!14525 (h!15651 (_ BitVec 64)) (t!20844 List!14529)) )
))
(declare-fun arrayNoDuplicates!0 (array!42881 (_ BitVec 32) List!14529) Bool)

(assert (=> b!790073 (= res!535233 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14526))))

(declare-fun b!790074 () Bool)

(assert (=> b!790074 (= e!439109 e!439114)))

(declare-fun res!535231 () Bool)

(assert (=> b!790074 (=> res!535231 e!439114)))

(assert (=> b!790074 (= res!535231 (or (not (= (select (arr!20527 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352648 () SeekEntryResult!8127)

(assert (=> b!790074 (and (= lt!352648 lt!352643) (= lt!352640 lt!352644))))

(assert (=> b!790074 (= lt!352643 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352638 lt!352647 mask!3328))))

(assert (=> b!790074 (= lt!352648 (seekEntryOrOpen!0 lt!352638 lt!352647 mask!3328))))

(assert (=> b!790074 (= lt!352641 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!352646 () Unit!27396)

(assert (=> b!790074 (= lt!352646 e!439107)))

(declare-fun c!87826 () Bool)

(assert (=> b!790074 (= c!87826 (= lt!352641 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!67904 res!535227) b!790068))

(assert (= (and b!790068 res!535226) b!790057))

(assert (= (and b!790057 res!535229) b!790056))

(assert (= (and b!790056 res!535232) b!790055))

(assert (= (and b!790055 res!535234) b!790058))

(assert (= (and b!790058 res!535238) b!790065))

(assert (= (and b!790065 res!535228) b!790073))

(assert (= (and b!790073 res!535233) b!790070))

(assert (= (and b!790070 res!535221) b!790066))

(assert (= (and b!790066 res!535236) b!790063))

(assert (= (and b!790063 res!535230) b!790054))

(assert (= (and b!790054 c!87825) b!790069))

(assert (= (and b!790054 (not c!87825)) b!790064))

(assert (= (and b!790054 res!535223) b!790061))

(assert (= (and b!790061 res!535224) b!790072))

(assert (= (and b!790072 res!535235) b!790062))

(assert (= (and b!790072 (not res!535237)) b!790059))

(assert (= (and b!790059 (not res!535222)) b!790071))

(assert (= (and b!790071 (not res!535225)) b!790074))

(assert (= (and b!790074 c!87826) b!790067))

(assert (= (and b!790074 (not c!87826)) b!790053))

(assert (= (and b!790074 (not res!535231)) b!790060))

(declare-fun m!731029 () Bool)

(assert (=> b!790059 m!731029))

(assert (=> b!790059 m!731029))

(declare-fun m!731031 () Bool)

(assert (=> b!790059 m!731031))

(declare-fun m!731033 () Bool)

(assert (=> start!67904 m!731033))

(declare-fun m!731035 () Bool)

(assert (=> start!67904 m!731035))

(assert (=> b!790069 m!731029))

(assert (=> b!790069 m!731029))

(declare-fun m!731037 () Bool)

(assert (=> b!790069 m!731037))

(declare-fun m!731039 () Bool)

(assert (=> b!790061 m!731039))

(declare-fun m!731041 () Bool)

(assert (=> b!790061 m!731041))

(declare-fun m!731043 () Bool)

(assert (=> b!790061 m!731043))

(declare-fun m!731045 () Bool)

(assert (=> b!790061 m!731045))

(assert (=> b!790061 m!731043))

(declare-fun m!731047 () Bool)

(assert (=> b!790061 m!731047))

(assert (=> b!790071 m!731039))

(declare-fun m!731049 () Bool)

(assert (=> b!790071 m!731049))

(declare-fun m!731051 () Bool)

(assert (=> b!790065 m!731051))

(declare-fun m!731053 () Bool)

(assert (=> b!790058 m!731053))

(declare-fun m!731055 () Bool)

(assert (=> b!790073 m!731055))

(assert (=> b!790066 m!731029))

(assert (=> b!790066 m!731029))

(declare-fun m!731057 () Bool)

(assert (=> b!790066 m!731057))

(assert (=> b!790066 m!731057))

(assert (=> b!790066 m!731029))

(declare-fun m!731059 () Bool)

(assert (=> b!790066 m!731059))

(assert (=> b!790072 m!731029))

(assert (=> b!790072 m!731029))

(declare-fun m!731061 () Bool)

(assert (=> b!790072 m!731061))

(declare-fun m!731063 () Bool)

(assert (=> b!790072 m!731063))

(declare-fun m!731065 () Bool)

(assert (=> b!790072 m!731065))

(assert (=> b!790057 m!731029))

(assert (=> b!790057 m!731029))

(declare-fun m!731067 () Bool)

(assert (=> b!790057 m!731067))

(declare-fun m!731069 () Bool)

(assert (=> b!790074 m!731069))

(declare-fun m!731071 () Bool)

(assert (=> b!790074 m!731071))

(declare-fun m!731073 () Bool)

(assert (=> b!790074 m!731073))

(declare-fun m!731075 () Bool)

(assert (=> b!790063 m!731075))

(assert (=> b!790062 m!731029))

(assert (=> b!790062 m!731029))

(declare-fun m!731077 () Bool)

(assert (=> b!790062 m!731077))

(declare-fun m!731079 () Bool)

(assert (=> b!790056 m!731079))

(declare-fun m!731081 () Bool)

(assert (=> b!790055 m!731081))

(assert (=> b!790064 m!731029))

(assert (=> b!790064 m!731029))

(assert (=> b!790064 m!731031))

(declare-fun m!731083 () Bool)

(assert (=> b!790060 m!731083))

(check-sat (not b!790055) (not b!790057) (not b!790056) (not b!790072) (not b!790073) (not b!790060) (not b!790066) (not b!790059) (not b!790064) (not b!790061) (not b!790058) (not b!790074) (not b!790062) (not b!790065) (not b!790069) (not start!67904))
(check-sat)
