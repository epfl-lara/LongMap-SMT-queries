; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67804 () Bool)

(assert start!67804)

(declare-fun b!788450 () Bool)

(declare-fun res!534155 () Bool)

(declare-fun e!438232 () Bool)

(assert (=> b!788450 (=> (not res!534155) (not e!438232))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!788450 (= res!534155 (validKeyInArray!0 k!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42844 0))(
  ( (array!42845 (arr!20510 (Array (_ BitVec 32) (_ BitVec 64))) (size!20931 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42844)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!788451 () Bool)

(declare-fun e!438234 () Bool)

(assert (=> b!788451 (= e!438234 (or (not (= (select (arr!20510 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= index!1321 resIntermediateIndex!5))))))

(declare-fun e!438235 () Bool)

(assert (=> b!788451 e!438235))

(declare-fun res!534159 () Bool)

(assert (=> b!788451 (=> (not res!534159) (not e!438235))))

(declare-fun lt!351781 () (_ BitVec 64))

(assert (=> b!788451 (= res!534159 (= lt!351781 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27328 0))(
  ( (Unit!27329) )
))
(declare-fun lt!351779 () Unit!27328)

(declare-fun e!438228 () Unit!27328)

(assert (=> b!788451 (= lt!351779 e!438228)))

(declare-fun c!87558 () Bool)

(assert (=> b!788451 (= c!87558 (= lt!351781 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!788452 () Bool)

(declare-fun e!438225 () Bool)

(declare-fun e!438226 () Bool)

(assert (=> b!788452 (= e!438225 e!438226)))

(declare-fun res!534161 () Bool)

(assert (=> b!788452 (=> res!534161 e!438226)))

(declare-datatypes ((SeekEntryResult!8110 0))(
  ( (MissingZero!8110 (index!34808 (_ BitVec 32))) (Found!8110 (index!34809 (_ BitVec 32))) (Intermediate!8110 (undefined!8922 Bool) (index!34810 (_ BitVec 32)) (x!65738 (_ BitVec 32))) (Undefined!8110) (MissingVacant!8110 (index!34811 (_ BitVec 32))) )
))
(declare-fun lt!351788 () SeekEntryResult!8110)

(declare-fun lt!351783 () SeekEntryResult!8110)

(assert (=> b!788452 (= res!534161 (not (= lt!351788 lt!351783)))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42844 (_ BitVec 32)) SeekEntryResult!8110)

(assert (=> b!788452 (= lt!351788 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20510 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788453 () Bool)

(declare-fun res!534151 () Bool)

(declare-fun e!438236 () Bool)

(assert (=> b!788453 (=> (not res!534151) (not e!438236))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!788453 (= res!534151 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20931 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20931 a!3186))))))

(declare-fun b!788454 () Bool)

(declare-fun res!534162 () Bool)

(assert (=> b!788454 (=> (not res!534162) (not e!438232))))

(assert (=> b!788454 (= res!534162 (validKeyInArray!0 (select (arr!20510 a!3186) j!159)))))

(declare-fun b!788455 () Bool)

(declare-fun e!438230 () Bool)

(declare-fun e!438233 () Bool)

(assert (=> b!788455 (= e!438230 e!438233)))

(declare-fun res!534152 () Bool)

(assert (=> b!788455 (=> (not res!534152) (not e!438233))))

(declare-fun lt!351780 () SeekEntryResult!8110)

(declare-fun lt!351778 () SeekEntryResult!8110)

(assert (=> b!788455 (= res!534152 (= lt!351780 lt!351778))))

(declare-fun lt!351787 () array!42844)

(declare-fun lt!351784 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42844 (_ BitVec 32)) SeekEntryResult!8110)

(assert (=> b!788455 (= lt!351778 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351784 lt!351787 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788455 (= lt!351780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351784 mask!3328) lt!351784 lt!351787 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!788455 (= lt!351784 (select (store (arr!20510 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!788455 (= lt!351787 (array!42845 (store (arr!20510 a!3186) i!1173 k!2102) (size!20931 a!3186)))))

(declare-fun b!788456 () Bool)

(declare-fun res!534153 () Bool)

(assert (=> b!788456 (=> (not res!534153) (not e!438230))))

(declare-fun e!438229 () Bool)

(assert (=> b!788456 (= res!534153 e!438229)))

(declare-fun c!87559 () Bool)

(assert (=> b!788456 (= c!87559 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!788457 () Bool)

(assert (=> b!788457 (= e!438226 e!438234)))

(declare-fun res!534157 () Bool)

(assert (=> b!788457 (=> res!534157 e!438234)))

(assert (=> b!788457 (= res!534157 (= lt!351781 lt!351784))))

(assert (=> b!788457 (= lt!351781 (select (store (arr!20510 a!3186) i!1173 k!2102) index!1321))))

(declare-fun e!438231 () Bool)

(declare-fun b!788458 () Bool)

(assert (=> b!788458 (= e!438231 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20510 a!3186) j!159) a!3186 mask!3328) lt!351783))))

(declare-fun b!788459 () Bool)

(declare-fun lt!351777 () SeekEntryResult!8110)

(assert (=> b!788459 (= e!438229 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20510 a!3186) j!159) a!3186 mask!3328) lt!351777))))

(declare-fun b!788460 () Bool)

(declare-fun res!534163 () Bool)

(assert (=> b!788460 (=> (not res!534163) (not e!438232))))

(declare-fun arrayContainsKey!0 (array!42844 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!788460 (= res!534163 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!788462 () Bool)

(declare-fun res!534166 () Bool)

(assert (=> b!788462 (=> (not res!534166) (not e!438235))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42844 (_ BitVec 32)) SeekEntryResult!8110)

(assert (=> b!788462 (= res!534166 (= (seekEntryOrOpen!0 lt!351784 lt!351787 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351784 lt!351787 mask!3328)))))

(declare-fun b!788463 () Bool)

(assert (=> b!788463 (= e!438232 e!438236)))

(declare-fun res!534150 () Bool)

(assert (=> b!788463 (=> (not res!534150) (not e!438236))))

(declare-fun lt!351786 () SeekEntryResult!8110)

(assert (=> b!788463 (= res!534150 (or (= lt!351786 (MissingZero!8110 i!1173)) (= lt!351786 (MissingVacant!8110 i!1173))))))

(assert (=> b!788463 (= lt!351786 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!788464 () Bool)

(declare-fun res!534164 () Bool)

(assert (=> b!788464 (=> (not res!534164) (not e!438236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42844 (_ BitVec 32)) Bool)

(assert (=> b!788464 (= res!534164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!788465 () Bool)

(declare-fun res!534167 () Bool)

(assert (=> b!788465 (=> (not res!534167) (not e!438236))))

(declare-datatypes ((List!14512 0))(
  ( (Nil!14509) (Cons!14508 (h!15631 (_ BitVec 64)) (t!20827 List!14512)) )
))
(declare-fun arrayNoDuplicates!0 (array!42844 (_ BitVec 32) List!14512) Bool)

(assert (=> b!788465 (= res!534167 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14509))))

(declare-fun b!788466 () Bool)

(assert (=> b!788466 (= e!438236 e!438230)))

(declare-fun res!534149 () Bool)

(assert (=> b!788466 (=> (not res!534149) (not e!438230))))

(assert (=> b!788466 (= res!534149 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20510 a!3186) j!159) mask!3328) (select (arr!20510 a!3186) j!159) a!3186 mask!3328) lt!351777))))

(assert (=> b!788466 (= lt!351777 (Intermediate!8110 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!788467 () Bool)

(declare-fun Unit!27330 () Unit!27328)

(assert (=> b!788467 (= e!438228 Unit!27330)))

(declare-fun b!788468 () Bool)

(declare-fun res!534160 () Bool)

(assert (=> b!788468 (=> (not res!534160) (not e!438230))))

(assert (=> b!788468 (= res!534160 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20510 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788469 () Bool)

(assert (=> b!788469 (= e!438233 (not e!438225))))

(declare-fun res!534156 () Bool)

(assert (=> b!788469 (=> res!534156 e!438225)))

(assert (=> b!788469 (= res!534156 (or (not (is-Intermediate!8110 lt!351778)) (bvslt x!1131 (x!65738 lt!351778)) (not (= x!1131 (x!65738 lt!351778))) (not (= index!1321 (index!34810 lt!351778)))))))

(assert (=> b!788469 e!438231))

(declare-fun res!534154 () Bool)

(assert (=> b!788469 (=> (not res!534154) (not e!438231))))

(declare-fun lt!351785 () SeekEntryResult!8110)

(assert (=> b!788469 (= res!534154 (= lt!351785 lt!351783))))

(assert (=> b!788469 (= lt!351783 (Found!8110 j!159))))

(assert (=> b!788469 (= lt!351785 (seekEntryOrOpen!0 (select (arr!20510 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!788469 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351782 () Unit!27328)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27328)

(assert (=> b!788469 (= lt!351782 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!788470 () Bool)

(declare-fun Unit!27331 () Unit!27328)

(assert (=> b!788470 (= e!438228 Unit!27331)))

(assert (=> b!788470 false))

(declare-fun b!788471 () Bool)

(assert (=> b!788471 (= e!438235 (= lt!351785 lt!351788))))

(declare-fun b!788472 () Bool)

(assert (=> b!788472 (= e!438229 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20510 a!3186) j!159) a!3186 mask!3328) (Found!8110 j!159)))))

(declare-fun b!788461 () Bool)

(declare-fun res!534158 () Bool)

(assert (=> b!788461 (=> (not res!534158) (not e!438232))))

(assert (=> b!788461 (= res!534158 (and (= (size!20931 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20931 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20931 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!534165 () Bool)

(assert (=> start!67804 (=> (not res!534165) (not e!438232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67804 (= res!534165 (validMask!0 mask!3328))))

(assert (=> start!67804 e!438232))

(assert (=> start!67804 true))

(declare-fun array_inv!16306 (array!42844) Bool)

(assert (=> start!67804 (array_inv!16306 a!3186)))

(assert (= (and start!67804 res!534165) b!788461))

(assert (= (and b!788461 res!534158) b!788454))

(assert (= (and b!788454 res!534162) b!788450))

(assert (= (and b!788450 res!534155) b!788460))

(assert (= (and b!788460 res!534163) b!788463))

(assert (= (and b!788463 res!534150) b!788464))

(assert (= (and b!788464 res!534164) b!788465))

(assert (= (and b!788465 res!534167) b!788453))

(assert (= (and b!788453 res!534151) b!788466))

(assert (= (and b!788466 res!534149) b!788468))

(assert (= (and b!788468 res!534160) b!788456))

(assert (= (and b!788456 c!87559) b!788459))

(assert (= (and b!788456 (not c!87559)) b!788472))

(assert (= (and b!788456 res!534153) b!788455))

(assert (= (and b!788455 res!534152) b!788469))

(assert (= (and b!788469 res!534154) b!788458))

(assert (= (and b!788469 (not res!534156)) b!788452))

(assert (= (and b!788452 (not res!534161)) b!788457))

(assert (= (and b!788457 (not res!534157)) b!788451))

(assert (= (and b!788451 c!87558) b!788470))

(assert (= (and b!788451 (not c!87558)) b!788467))

(assert (= (and b!788451 res!534159) b!788462))

(assert (= (and b!788462 res!534166) b!788471))

(declare-fun m!729791 () Bool)

(assert (=> b!788468 m!729791))

(declare-fun m!729793 () Bool)

(assert (=> b!788463 m!729793))

(declare-fun m!729795 () Bool)

(assert (=> b!788462 m!729795))

(declare-fun m!729797 () Bool)

(assert (=> b!788462 m!729797))

(declare-fun m!729799 () Bool)

(assert (=> b!788452 m!729799))

(assert (=> b!788452 m!729799))

(declare-fun m!729801 () Bool)

(assert (=> b!788452 m!729801))

(declare-fun m!729803 () Bool)

(assert (=> b!788460 m!729803))

(declare-fun m!729805 () Bool)

(assert (=> b!788464 m!729805))

(declare-fun m!729807 () Bool)

(assert (=> b!788451 m!729807))

(declare-fun m!729809 () Bool)

(assert (=> b!788465 m!729809))

(declare-fun m!729811 () Bool)

(assert (=> b!788455 m!729811))

(declare-fun m!729813 () Bool)

(assert (=> b!788455 m!729813))

(declare-fun m!729815 () Bool)

(assert (=> b!788455 m!729815))

(declare-fun m!729817 () Bool)

(assert (=> b!788455 m!729817))

(assert (=> b!788455 m!729811))

(declare-fun m!729819 () Bool)

(assert (=> b!788455 m!729819))

(assert (=> b!788458 m!729799))

(assert (=> b!788458 m!729799))

(declare-fun m!729821 () Bool)

(assert (=> b!788458 m!729821))

(assert (=> b!788459 m!729799))

(assert (=> b!788459 m!729799))

(declare-fun m!729823 () Bool)

(assert (=> b!788459 m!729823))

(assert (=> b!788466 m!729799))

(assert (=> b!788466 m!729799))

(declare-fun m!729825 () Bool)

(assert (=> b!788466 m!729825))

(assert (=> b!788466 m!729825))

(assert (=> b!788466 m!729799))

(declare-fun m!729827 () Bool)

(assert (=> b!788466 m!729827))

(assert (=> b!788469 m!729799))

(assert (=> b!788469 m!729799))

(declare-fun m!729829 () Bool)

(assert (=> b!788469 m!729829))

(declare-fun m!729831 () Bool)

(assert (=> b!788469 m!729831))

(declare-fun m!729833 () Bool)

(assert (=> b!788469 m!729833))

(declare-fun m!729835 () Bool)

(assert (=> start!67804 m!729835))

(declare-fun m!729837 () Bool)

(assert (=> start!67804 m!729837))

(declare-fun m!729839 () Bool)

(assert (=> b!788450 m!729839))

(assert (=> b!788472 m!729799))

(assert (=> b!788472 m!729799))

(assert (=> b!788472 m!729801))

(assert (=> b!788457 m!729815))

(declare-fun m!729841 () Bool)

(assert (=> b!788457 m!729841))

(assert (=> b!788454 m!729799))

(assert (=> b!788454 m!729799))

(declare-fun m!729843 () Bool)

(assert (=> b!788454 m!729843))

(push 1)

(assert (not b!788465))

(assert (not b!788458))

(assert (not b!788466))

(assert (not b!788462))

(assert (not start!67804))

(assert (not b!788472))

(assert (not b!788463))

(assert (not b!788459))

(assert (not b!788455))

(assert (not b!788469))

(assert (not b!788460))

(assert (not b!788454))

(assert (not b!788450))

(assert (not b!788464))

(assert (not b!788452))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!788600 () Bool)

(declare-fun lt!351836 () SeekEntryResult!8110)

(assert (=> b!788600 (and (bvsge (index!34810 lt!351836) #b00000000000000000000000000000000) (bvslt (index!34810 lt!351836) (size!20931 a!3186)))))

(declare-fun e!438318 () Bool)

(assert (=> b!788600 (= e!438318 (= (select (arr!20510 a!3186) (index!34810 lt!351836)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102845 () Bool)

(declare-fun e!438314 () Bool)

(assert (=> d!102845 e!438314))

(declare-fun c!87608 () Bool)

(assert (=> d!102845 (= c!87608 (and (is-Intermediate!8110 lt!351836) (undefined!8922 lt!351836)))))

(declare-fun e!438316 () SeekEntryResult!8110)

(assert (=> d!102845 (= lt!351836 e!438316)))

(declare-fun c!87606 () Bool)

(assert (=> d!102845 (= c!87606 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!351837 () (_ BitVec 64))

(assert (=> d!102845 (= lt!351837 (select (arr!20510 a!3186) (toIndex!0 (select (arr!20510 a!3186) j!159) mask!3328)))))

(assert (=> d!102845 (validMask!0 mask!3328)))

(assert (=> d!102845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20510 a!3186) j!159) mask!3328) (select (arr!20510 a!3186) j!159) a!3186 mask!3328) lt!351836)))

(declare-fun b!788601 () Bool)

(declare-fun e!438315 () SeekEntryResult!8110)

(assert (=> b!788601 (= e!438316 e!438315)))

(declare-fun c!87607 () Bool)

(assert (=> b!788601 (= c!87607 (or (= lt!351837 (select (arr!20510 a!3186) j!159)) (= (bvadd lt!351837 lt!351837) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788602 () Bool)

(assert (=> b!788602 (and (bvsge (index!34810 lt!351836) #b00000000000000000000000000000000) (bvslt (index!34810 lt!351836) (size!20931 a!3186)))))

(declare-fun res!534204 () Bool)

(assert (=> b!788602 (= res!534204 (= (select (arr!20510 a!3186) (index!34810 lt!351836)) (select (arr!20510 a!3186) j!159)))))

(assert (=> b!788602 (=> res!534204 e!438318)))

(declare-fun e!438317 () Bool)

(assert (=> b!788602 (= e!438317 e!438318)))

(declare-fun b!788603 () Bool)

(assert (=> b!788603 (= e!438314 (bvsge (x!65738 lt!351836) #b01111111111111111111111111111110))))

(declare-fun b!788604 () Bool)

(assert (=> b!788604 (= e!438316 (Intermediate!8110 true (toIndex!0 (select (arr!20510 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!788605 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!788605 (= e!438315 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20510 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20510 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788606 () Bool)

(assert (=> b!788606 (= e!438314 e!438317)))

(declare-fun res!534205 () Bool)

(assert (=> b!788606 (= res!534205 (and (is-Intermediate!8110 lt!351836) (not (undefined!8922 lt!351836)) (bvslt (x!65738 lt!351836) #b01111111111111111111111111111110) (bvsge (x!65738 lt!351836) #b00000000000000000000000000000000) (bvsge (x!65738 lt!351836) #b00000000000000000000000000000000)))))

(assert (=> b!788606 (=> (not res!534205) (not e!438317))))

(declare-fun b!788607 () Bool)

(assert (=> b!788607 (and (bvsge (index!34810 lt!351836) #b00000000000000000000000000000000) (bvslt (index!34810 lt!351836) (size!20931 a!3186)))))

(declare-fun res!534203 () Bool)

(assert (=> b!788607 (= res!534203 (= (select (arr!20510 a!3186) (index!34810 lt!351836)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788607 (=> res!534203 e!438318)))

(declare-fun b!788608 () Bool)

(assert (=> b!788608 (= e!438315 (Intermediate!8110 false (toIndex!0 (select (arr!20510 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!102845 c!87606) b!788604))

(assert (= (and d!102845 (not c!87606)) b!788601))

(assert (= (and b!788601 c!87607) b!788608))

(assert (= (and b!788601 (not c!87607)) b!788605))

(assert (= (and d!102845 c!87608) b!788603))

(assert (= (and d!102845 (not c!87608)) b!788606))

(assert (= (and b!788606 res!534205) b!788602))

(assert (= (and b!788602 (not res!534204)) b!788607))

(assert (= (and b!788607 (not res!534203)) b!788600))

(declare-fun m!729905 () Bool)

(assert (=> b!788602 m!729905))

(assert (=> b!788600 m!729905))

(assert (=> b!788607 m!729905))

(assert (=> d!102845 m!729825))

(declare-fun m!729907 () Bool)

(assert (=> d!102845 m!729907))

(assert (=> d!102845 m!729835))

(assert (=> b!788605 m!729825))

(declare-fun m!729909 () Bool)

(assert (=> b!788605 m!729909))

(assert (=> b!788605 m!729909))

(assert (=> b!788605 m!729799))

(declare-fun m!729911 () Bool)

(assert (=> b!788605 m!729911))

(assert (=> b!788466 d!102845))

(declare-fun d!102855 () Bool)

(declare-fun lt!351849 () (_ BitVec 32))

(declare-fun lt!351848 () (_ BitVec 32))

(assert (=> d!102855 (= lt!351849 (bvmul (bvxor lt!351848 (bvlshr lt!351848 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102855 (= lt!351848 ((_ extract 31 0) (bvand (bvxor (select (arr!20510 a!3186) j!159) (bvlshr (select (arr!20510 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102855 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!534209 (let ((h!15632 ((_ extract 31 0) (bvand (bvxor (select (arr!20510 a!3186) j!159) (bvlshr (select (arr!20510 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65742 (bvmul (bvxor h!15632 (bvlshr h!15632 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65742 (bvlshr x!65742 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!534209 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!534209 #b00000000000000000000000000000000))))))

(assert (=> d!102855 (= (toIndex!0 (select (arr!20510 a!3186) j!159) mask!3328) (bvand (bvxor lt!351849 (bvlshr lt!351849 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!788466 d!102855))

(declare-fun b!788618 () Bool)

(declare-fun lt!351850 () SeekEntryResult!8110)

(assert (=> b!788618 (and (bvsge (index!34810 lt!351850) #b00000000000000000000000000000000) (bvslt (index!34810 lt!351850) (size!20931 lt!351787)))))

(declare-fun e!438328 () Bool)

(assert (=> b!788618 (= e!438328 (= (select (arr!20510 lt!351787) (index!34810 lt!351850)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102859 () Bool)

(declare-fun e!438324 () Bool)

(assert (=> d!102859 e!438324))

(declare-fun c!87614 () Bool)

(assert (=> d!102859 (= c!87614 (and (is-Intermediate!8110 lt!351850) (undefined!8922 lt!351850)))))

(declare-fun e!438326 () SeekEntryResult!8110)

(assert (=> d!102859 (= lt!351850 e!438326)))

(declare-fun c!87612 () Bool)

(assert (=> d!102859 (= c!87612 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!351851 () (_ BitVec 64))

(assert (=> d!102859 (= lt!351851 (select (arr!20510 lt!351787) index!1321))))

(assert (=> d!102859 (validMask!0 mask!3328)))

(assert (=> d!102859 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351784 lt!351787 mask!3328) lt!351850)))

(declare-fun b!788619 () Bool)

(declare-fun e!438325 () SeekEntryResult!8110)

(assert (=> b!788619 (= e!438326 e!438325)))

(declare-fun c!87613 () Bool)

(assert (=> b!788619 (= c!87613 (or (= lt!351851 lt!351784) (= (bvadd lt!351851 lt!351851) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788620 () Bool)

(assert (=> b!788620 (and (bvsge (index!34810 lt!351850) #b00000000000000000000000000000000) (bvslt (index!34810 lt!351850) (size!20931 lt!351787)))))

(declare-fun res!534212 () Bool)

(assert (=> b!788620 (= res!534212 (= (select (arr!20510 lt!351787) (index!34810 lt!351850)) lt!351784))))

(assert (=> b!788620 (=> res!534212 e!438328)))

(declare-fun e!438327 () Bool)

(assert (=> b!788620 (= e!438327 e!438328)))

(declare-fun b!788621 () Bool)

(assert (=> b!788621 (= e!438324 (bvsge (x!65738 lt!351850) #b01111111111111111111111111111110))))

(declare-fun b!788622 () Bool)

(assert (=> b!788622 (= e!438326 (Intermediate!8110 true index!1321 x!1131))))

(declare-fun b!788623 () Bool)

(assert (=> b!788623 (= e!438325 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!351784 lt!351787 mask!3328))))

(declare-fun b!788624 () Bool)

(assert (=> b!788624 (= e!438324 e!438327)))

(declare-fun res!534213 () Bool)

(assert (=> b!788624 (= res!534213 (and (is-Intermediate!8110 lt!351850) (not (undefined!8922 lt!351850)) (bvslt (x!65738 lt!351850) #b01111111111111111111111111111110) (bvsge (x!65738 lt!351850) #b00000000000000000000000000000000) (bvsge (x!65738 lt!351850) x!1131)))))

(assert (=> b!788624 (=> (not res!534213) (not e!438327))))

(declare-fun b!788625 () Bool)

(assert (=> b!788625 (and (bvsge (index!34810 lt!351850) #b00000000000000000000000000000000) (bvslt (index!34810 lt!351850) (size!20931 lt!351787)))))

(declare-fun res!534211 () Bool)

(assert (=> b!788625 (= res!534211 (= (select (arr!20510 lt!351787) (index!34810 lt!351850)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788625 (=> res!534211 e!438328)))

(declare-fun b!788626 () Bool)

(assert (=> b!788626 (= e!438325 (Intermediate!8110 false index!1321 x!1131))))

(assert (= (and d!102859 c!87612) b!788622))

(assert (= (and d!102859 (not c!87612)) b!788619))

(assert (= (and b!788619 c!87613) b!788626))

(assert (= (and b!788619 (not c!87613)) b!788623))

(assert (= (and d!102859 c!87614) b!788621))

(assert (= (and d!102859 (not c!87614)) b!788624))

(assert (= (and b!788624 res!534213) b!788620))

(assert (= (and b!788620 (not res!534212)) b!788625))

(assert (= (and b!788625 (not res!534211)) b!788618))

(declare-fun m!729921 () Bool)

(assert (=> b!788620 m!729921))

(assert (=> b!788618 m!729921))

(assert (=> b!788625 m!729921))

(declare-fun m!729923 () Bool)

(assert (=> d!102859 m!729923))

(assert (=> d!102859 m!729835))

(declare-fun m!729925 () Bool)

(assert (=> b!788623 m!729925))

(assert (=> b!788623 m!729925))

(declare-fun m!729927 () Bool)

(assert (=> b!788623 m!729927))

(assert (=> b!788455 d!102859))

(declare-fun b!788633 () Bool)

(declare-fun lt!351857 () SeekEntryResult!8110)

(assert (=> b!788633 (and (bvsge (index!34810 lt!351857) #b00000000000000000000000000000000) (bvslt (index!34810 lt!351857) (size!20931 lt!351787)))))

(declare-fun e!438336 () Bool)

(assert (=> b!788633 (= e!438336 (= (select (arr!20510 lt!351787) (index!34810 lt!351857)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102863 () Bool)

(declare-fun e!438332 () Bool)

(assert (=> d!102863 e!438332))

(declare-fun c!87620 () Bool)

(assert (=> d!102863 (= c!87620 (and (is-Intermediate!8110 lt!351857) (undefined!8922 lt!351857)))))

(declare-fun e!438334 () SeekEntryResult!8110)

(assert (=> d!102863 (= lt!351857 e!438334)))

(declare-fun c!87618 () Bool)

(assert (=> d!102863 (= c!87618 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!351858 () (_ BitVec 64))

(assert (=> d!102863 (= lt!351858 (select (arr!20510 lt!351787) (toIndex!0 lt!351784 mask!3328)))))

(assert (=> d!102863 (validMask!0 mask!3328)))

(assert (=> d!102863 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351784 mask!3328) lt!351784 lt!351787 mask!3328) lt!351857)))

(declare-fun b!788634 () Bool)

(declare-fun e!438333 () SeekEntryResult!8110)

(assert (=> b!788634 (= e!438334 e!438333)))

(declare-fun c!87619 () Bool)

(assert (=> b!788634 (= c!87619 (or (= lt!351858 lt!351784) (= (bvadd lt!351858 lt!351858) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788635 () Bool)

(assert (=> b!788635 (and (bvsge (index!34810 lt!351857) #b00000000000000000000000000000000) (bvslt (index!34810 lt!351857) (size!20931 lt!351787)))))

(declare-fun res!534215 () Bool)

(assert (=> b!788635 (= res!534215 (= (select (arr!20510 lt!351787) (index!34810 lt!351857)) lt!351784))))

(assert (=> b!788635 (=> res!534215 e!438336)))

(declare-fun e!438335 () Bool)

(assert (=> b!788635 (= e!438335 e!438336)))

(declare-fun b!788636 () Bool)

(assert (=> b!788636 (= e!438332 (bvsge (x!65738 lt!351857) #b01111111111111111111111111111110))))

(declare-fun b!788637 () Bool)

(assert (=> b!788637 (= e!438334 (Intermediate!8110 true (toIndex!0 lt!351784 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!788638 () Bool)

(assert (=> b!788638 (= e!438333 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!351784 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!351784 lt!351787 mask!3328))))

(declare-fun b!788639 () Bool)

(assert (=> b!788639 (= e!438332 e!438335)))

(declare-fun res!534216 () Bool)

(assert (=> b!788639 (= res!534216 (and (is-Intermediate!8110 lt!351857) (not (undefined!8922 lt!351857)) (bvslt (x!65738 lt!351857) #b01111111111111111111111111111110) (bvsge (x!65738 lt!351857) #b00000000000000000000000000000000) (bvsge (x!65738 lt!351857) #b00000000000000000000000000000000)))))

(assert (=> b!788639 (=> (not res!534216) (not e!438335))))

(declare-fun b!788640 () Bool)

(assert (=> b!788640 (and (bvsge (index!34810 lt!351857) #b00000000000000000000000000000000) (bvslt (index!34810 lt!351857) (size!20931 lt!351787)))))

(declare-fun res!534214 () Bool)

(assert (=> b!788640 (= res!534214 (= (select (arr!20510 lt!351787) (index!34810 lt!351857)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788640 (=> res!534214 e!438336)))

(declare-fun b!788641 () Bool)

(assert (=> b!788641 (= e!438333 (Intermediate!8110 false (toIndex!0 lt!351784 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!102863 c!87618) b!788637))

(assert (= (and d!102863 (not c!87618)) b!788634))

(assert (= (and b!788634 c!87619) b!788641))

(assert (= (and b!788634 (not c!87619)) b!788638))

(assert (= (and d!102863 c!87620) b!788636))

(assert (= (and d!102863 (not c!87620)) b!788639))

(assert (= (and b!788639 res!534216) b!788635))

(assert (= (and b!788635 (not res!534215)) b!788640))

(assert (= (and b!788640 (not res!534214)) b!788633))

(declare-fun m!729943 () Bool)

(assert (=> b!788635 m!729943))

(assert (=> b!788633 m!729943))

(assert (=> b!788640 m!729943))

(assert (=> d!102863 m!729811))

(declare-fun m!729945 () Bool)

(assert (=> d!102863 m!729945))

(assert (=> d!102863 m!729835))

(assert (=> b!788638 m!729811))

(declare-fun m!729947 () Bool)

(assert (=> b!788638 m!729947))

(assert (=> b!788638 m!729947))

(declare-fun m!729949 () Bool)

(assert (=> b!788638 m!729949))

(assert (=> b!788455 d!102863))

(declare-fun d!102867 () Bool)

(declare-fun lt!351864 () (_ BitVec 32))

(declare-fun lt!351863 () (_ BitVec 32))

(assert (=> d!102867 (= lt!351864 (bvmul (bvxor lt!351863 (bvlshr lt!351863 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102867 (= lt!351863 ((_ extract 31 0) (bvand (bvxor lt!351784 (bvlshr lt!351784 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102867 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!534209 (let ((h!15632 ((_ extract 31 0) (bvand (bvxor lt!351784 (bvlshr lt!351784 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65742 (bvmul (bvxor h!15632 (bvlshr h!15632 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65742 (bvlshr x!65742 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!534209 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!534209 #b00000000000000000000000000000000))))))

(assert (=> d!102867 (= (toIndex!0 lt!351784 mask!3328) (bvand (bvxor lt!351864 (bvlshr lt!351864 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!788455 d!102867))

(declare-fun d!102869 () Bool)

(declare-fun res!534238 () Bool)

(declare-fun e!438383 () Bool)

(assert (=> d!102869 (=> res!534238 e!438383)))

(assert (=> d!102869 (= res!534238 (bvsge #b00000000000000000000000000000000 (size!20931 a!3186)))))

(assert (=> d!102869 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14509) e!438383)))

(declare-fun b!788715 () Bool)

(declare-fun e!438384 () Bool)

(declare-fun call!35287 () Bool)

(assert (=> b!788715 (= e!438384 call!35287)))

(declare-fun b!788716 () Bool)

(assert (=> b!788716 (= e!438384 call!35287)))

(declare-fun b!788717 () Bool)

(declare-fun e!438382 () Bool)

(assert (=> b!788717 (= e!438382 e!438384)))

(declare-fun c!87647 () Bool)

(assert (=> b!788717 (= c!87647 (validKeyInArray!0 (select (arr!20510 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35284 () Bool)

(assert (=> bm!35284 (= call!35287 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!87647 (Cons!14508 (select (arr!20510 a!3186) #b00000000000000000000000000000000) Nil!14509) Nil!14509)))))

(declare-fun b!788718 () Bool)

(declare-fun e!438381 () Bool)

(declare-fun contains!4111 (List!14512 (_ BitVec 64)) Bool)

(assert (=> b!788718 (= e!438381 (contains!4111 Nil!14509 (select (arr!20510 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!788719 () Bool)

(assert (=> b!788719 (= e!438383 e!438382)))

(declare-fun res!534240 () Bool)

(assert (=> b!788719 (=> (not res!534240) (not e!438382))))

(assert (=> b!788719 (= res!534240 (not e!438381))))

(declare-fun res!534239 () Bool)

(assert (=> b!788719 (=> (not res!534239) (not e!438381))))

(assert (=> b!788719 (= res!534239 (validKeyInArray!0 (select (arr!20510 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!102869 (not res!534238)) b!788719))

(assert (= (and b!788719 res!534239) b!788718))

(assert (= (and b!788719 res!534240) b!788717))

(assert (= (and b!788717 c!87647) b!788716))

(assert (= (and b!788717 (not c!87647)) b!788715))

(assert (= (or b!788716 b!788715) bm!35284))

(declare-fun m!729995 () Bool)

(assert (=> b!788717 m!729995))

(assert (=> b!788717 m!729995))

(declare-fun m!729997 () Bool)

(assert (=> b!788717 m!729997))

(assert (=> bm!35284 m!729995))

(declare-fun m!729999 () Bool)

(assert (=> bm!35284 m!729999))

(assert (=> b!788718 m!729995))

(assert (=> b!788718 m!729995))

(declare-fun m!730001 () Bool)

(assert (=> b!788718 m!730001))

(assert (=> b!788719 m!729995))

(assert (=> b!788719 m!729995))

(assert (=> b!788719 m!729997))

(assert (=> b!788465 d!102869))

(declare-fun b!788726 () Bool)

(declare-fun lt!351882 () SeekEntryResult!8110)

(assert (=> b!788726 (and (bvsge (index!34810 lt!351882) #b00000000000000000000000000000000) (bvslt (index!34810 lt!351882) (size!20931 a!3186)))))

(declare-fun e!438392 () Bool)

(assert (=> b!788726 (= e!438392 (= (select (arr!20510 a!3186) (index!34810 lt!351882)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!102889 () Bool)

(declare-fun e!438388 () Bool)

(assert (=> d!102889 e!438388))

(declare-fun c!87653 () Bool)

(assert (=> d!102889 (= c!87653 (and (is-Intermediate!8110 lt!351882) (undefined!8922 lt!351882)))))

(declare-fun e!438390 () SeekEntryResult!8110)

(assert (=> d!102889 (= lt!351882 e!438390)))

(declare-fun c!87651 () Bool)

(assert (=> d!102889 (= c!87651 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!351883 () (_ BitVec 64))

(assert (=> d!102889 (= lt!351883 (select (arr!20510 a!3186) index!1321))))

(assert (=> d!102889 (validMask!0 mask!3328)))

(assert (=> d!102889 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20510 a!3186) j!159) a!3186 mask!3328) lt!351882)))

(declare-fun b!788727 () Bool)

(declare-fun e!438389 () SeekEntryResult!8110)

(assert (=> b!788727 (= e!438390 e!438389)))

(declare-fun c!87652 () Bool)

(assert (=> b!788727 (= c!87652 (or (= lt!351883 (select (arr!20510 a!3186) j!159)) (= (bvadd lt!351883 lt!351883) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!788728 () Bool)

(assert (=> b!788728 (and (bvsge (index!34810 lt!351882) #b00000000000000000000000000000000) (bvslt (index!34810 lt!351882) (size!20931 a!3186)))))

(declare-fun res!534242 () Bool)

(assert (=> b!788728 (= res!534242 (= (select (arr!20510 a!3186) (index!34810 lt!351882)) (select (arr!20510 a!3186) j!159)))))

(assert (=> b!788728 (=> res!534242 e!438392)))

(declare-fun e!438391 () Bool)

(assert (=> b!788728 (= e!438391 e!438392)))

(declare-fun b!788729 () Bool)

(assert (=> b!788729 (= e!438388 (bvsge (x!65738 lt!351882) #b01111111111111111111111111111110))))

(declare-fun b!788730 () Bool)

(assert (=> b!788730 (= e!438390 (Intermediate!8110 true index!1321 x!1131))))

(declare-fun b!788731 () Bool)

(assert (=> b!788731 (= e!438389 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20510 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788732 () Bool)

(assert (=> b!788732 (= e!438388 e!438391)))

(declare-fun res!534243 () Bool)

(assert (=> b!788732 (= res!534243 (and (is-Intermediate!8110 lt!351882) (not (undefined!8922 lt!351882)) (bvslt (x!65738 lt!351882) #b01111111111111111111111111111110) (bvsge (x!65738 lt!351882) #b00000000000000000000000000000000) (bvsge (x!65738 lt!351882) x!1131)))))

(assert (=> b!788732 (=> (not res!534243) (not e!438391))))

(declare-fun b!788733 () Bool)

(assert (=> b!788733 (and (bvsge (index!34810 lt!351882) #b00000000000000000000000000000000) (bvslt (index!34810 lt!351882) (size!20931 a!3186)))))

(declare-fun res!534241 () Bool)

(assert (=> b!788733 (= res!534241 (= (select (arr!20510 a!3186) (index!34810 lt!351882)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!788733 (=> res!534241 e!438392)))

(declare-fun b!788734 () Bool)

(assert (=> b!788734 (= e!438389 (Intermediate!8110 false index!1321 x!1131))))

(assert (= (and d!102889 c!87651) b!788730))

(assert (= (and d!102889 (not c!87651)) b!788727))

(assert (= (and b!788727 c!87652) b!788734))

(assert (= (and b!788727 (not c!87652)) b!788731))

(assert (= (and d!102889 c!87653) b!788729))

(assert (= (and d!102889 (not c!87653)) b!788732))

(assert (= (and b!788732 res!534243) b!788728))

(assert (= (and b!788728 (not res!534242)) b!788733))

(assert (= (and b!788733 (not res!534241)) b!788726))

(declare-fun m!730013 () Bool)

(assert (=> b!788728 m!730013))

(assert (=> b!788726 m!730013))

(assert (=> b!788733 m!730013))

(assert (=> d!102889 m!729807))

(assert (=> d!102889 m!729835))

(assert (=> b!788731 m!729925))

(assert (=> b!788731 m!729925))

(assert (=> b!788731 m!729799))

(declare-fun m!730019 () Bool)

(assert (=> b!788731 m!730019))

(assert (=> b!788459 d!102889))

(declare-fun b!788798 () Bool)

(declare-fun e!438427 () SeekEntryResult!8110)

(declare-fun lt!351904 () SeekEntryResult!8110)

(assert (=> b!788798 (= e!438427 (MissingZero!8110 (index!34810 lt!351904)))))

(declare-fun d!102894 () Bool)

(declare-fun lt!351902 () SeekEntryResult!8110)

(assert (=> d!102894 (and (or (is-Undefined!8110 lt!351902) (not (is-Found!8110 lt!351902)) (and (bvsge (index!34809 lt!351902) #b00000000000000000000000000000000) (bvslt (index!34809 lt!351902) (size!20931 a!3186)))) (or (is-Undefined!8110 lt!351902) (is-Found!8110 lt!351902) (not (is-MissingZero!8110 lt!351902)) (and (bvsge (index!34808 lt!351902) #b00000000000000000000000000000000) (bvslt (index!34808 lt!351902) (size!20931 a!3186)))) (or (is-Undefined!8110 lt!351902) (is-Found!8110 lt!351902) (is-MissingZero!8110 lt!351902) (not (is-MissingVacant!8110 lt!351902)) (and (bvsge (index!34811 lt!351902) #b00000000000000000000000000000000) (bvslt (index!34811 lt!351902) (size!20931 a!3186)))) (or (is-Undefined!8110 lt!351902) (ite (is-Found!8110 lt!351902) (= (select (arr!20510 a!3186) (index!34809 lt!351902)) (select (arr!20510 a!3186) j!159)) (ite (is-MissingZero!8110 lt!351902) (= (select (arr!20510 a!3186) (index!34808 lt!351902)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8110 lt!351902) (= (select (arr!20510 a!3186) (index!34811 lt!351902)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!438429 () SeekEntryResult!8110)

(assert (=> d!102894 (= lt!351902 e!438429)))

(declare-fun c!87679 () Bool)

(assert (=> d!102894 (= c!87679 (and (is-Intermediate!8110 lt!351904) (undefined!8922 lt!351904)))))

(assert (=> d!102894 (= lt!351904 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20510 a!3186) j!159) mask!3328) (select (arr!20510 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102894 (validMask!0 mask!3328)))

(assert (=> d!102894 (= (seekEntryOrOpen!0 (select (arr!20510 a!3186) j!159) a!3186 mask!3328) lt!351902)))

(declare-fun b!788799 () Bool)

(declare-fun c!87678 () Bool)

(declare-fun lt!351903 () (_ BitVec 64))

(assert (=> b!788799 (= c!87678 (= lt!351903 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!438428 () SeekEntryResult!8110)

(assert (=> b!788799 (= e!438428 e!438427)))

(declare-fun b!788800 () Bool)

(assert (=> b!788800 (= e!438428 (Found!8110 (index!34810 lt!351904)))))

(declare-fun b!788801 () Bool)

(assert (=> b!788801 (= e!438429 e!438428)))

(assert (=> b!788801 (= lt!351903 (select (arr!20510 a!3186) (index!34810 lt!351904)))))

(declare-fun c!87680 () Bool)

(assert (=> b!788801 (= c!87680 (= lt!351903 (select (arr!20510 a!3186) j!159)))))

(declare-fun b!788802 () Bool)

(assert (=> b!788802 (= e!438429 Undefined!8110)))

(declare-fun b!788803 () Bool)

(assert (=> b!788803 (= e!438427 (seekKeyOrZeroReturnVacant!0 (x!65738 lt!351904) (index!34810 lt!351904) (index!34810 lt!351904) (select (arr!20510 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!102894 c!87679) b!788802))

(assert (= (and d!102894 (not c!87679)) b!788801))

(assert (= (and b!788801 c!87680) b!788800))

(assert (= (and b!788801 (not c!87680)) b!788799))

(assert (= (and b!788799 c!87678) b!788798))

(assert (= (and b!788799 (not c!87678)) b!788803))

(declare-fun m!730041 () Bool)

(assert (=> d!102894 m!730041))

(declare-fun m!730043 () Bool)

(assert (=> d!102894 m!730043))

(assert (=> d!102894 m!729799))

(assert (=> d!102894 m!729825))

(assert (=> d!102894 m!729835))

(assert (=> d!102894 m!729825))

(assert (=> d!102894 m!729799))

(assert (=> d!102894 m!729827))

(declare-fun m!730045 () Bool)

(assert (=> d!102894 m!730045))

(declare-fun m!730047 () Bool)

(assert (=> b!788801 m!730047))

(assert (=> b!788803 m!729799))

(declare-fun m!730049 () Bool)

(assert (=> b!788803 m!730049))

(assert (=> b!788469 d!102894))

(declare-fun bm!35287 () Bool)

(declare-fun call!35290 () Bool)

(assert (=> bm!35287 (= call!35290 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!788826 () Bool)

(declare-fun e!438445 () Bool)

(declare-fun e!438446 () Bool)

(assert (=> b!788826 (= e!438445 e!438446)))

(declare-fun lt!351922 () (_ BitVec 64))

(assert (=> b!788826 (= lt!351922 (select (arr!20510 a!3186) j!159))))

(declare-fun lt!351923 () Unit!27328)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42844 (_ BitVec 64) (_ BitVec 32)) Unit!27328)

(assert (=> b!788826 (= lt!351923 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!351922 j!159))))

(assert (=> b!788826 (arrayContainsKey!0 a!3186 lt!351922 #b00000000000000000000000000000000)))

(declare-fun lt!351924 () Unit!27328)

(assert (=> b!788826 (= lt!351924 lt!351923)))

(declare-fun res!534267 () Bool)

(assert (=> b!788826 (= res!534267 (= (seekEntryOrOpen!0 (select (arr!20510 a!3186) j!159) a!3186 mask!3328) (Found!8110 j!159)))))

(assert (=> b!788826 (=> (not res!534267) (not e!438446))))

(declare-fun d!102905 () Bool)

(declare-fun res!534266 () Bool)

(declare-fun e!438444 () Bool)

(assert (=> d!102905 (=> res!534266 e!438444)))

(assert (=> d!102905 (= res!534266 (bvsge j!159 (size!20931 a!3186)))))

(assert (=> d!102905 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!438444)))

(declare-fun b!788827 () Bool)

(assert (=> b!788827 (= e!438445 call!35290)))

(declare-fun b!788828 () Bool)

(assert (=> b!788828 (= e!438444 e!438445)))

(declare-fun c!87689 () Bool)

(assert (=> b!788828 (= c!87689 (validKeyInArray!0 (select (arr!20510 a!3186) j!159)))))

(declare-fun b!788829 () Bool)

(assert (=> b!788829 (= e!438446 call!35290)))

(assert (= (and d!102905 (not res!534266)) b!788828))

(assert (= (and b!788828 c!87689) b!788826))

(assert (= (and b!788828 (not c!87689)) b!788827))

(assert (= (and b!788826 res!534267) b!788829))

(assert (= (or b!788829 b!788827) bm!35287))

(declare-fun m!730067 () Bool)

(assert (=> bm!35287 m!730067))

(assert (=> b!788826 m!729799))

(declare-fun m!730069 () Bool)

(assert (=> b!788826 m!730069))

(declare-fun m!730071 () Bool)

(assert (=> b!788826 m!730071))

(assert (=> b!788826 m!729799))

(assert (=> b!788826 m!729829))

(assert (=> b!788828 m!729799))

(assert (=> b!788828 m!729799))

(assert (=> b!788828 m!729843))

(assert (=> b!788469 d!102905))

(declare-fun d!102913 () Bool)

(assert (=> d!102913 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351927 () Unit!27328)

(declare-fun choose!38 (array!42844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27328)

(assert (=> d!102913 (= lt!351927 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102913 (validMask!0 mask!3328)))

(assert (=> d!102913 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!351927)))

(declare-fun bs!21836 () Bool)

(assert (= bs!21836 d!102913))

(assert (=> bs!21836 m!729831))

(declare-fun m!730079 () Bool)

(assert (=> bs!21836 m!730079))

(assert (=> bs!21836 m!729835))

(assert (=> b!788469 d!102913))

(declare-fun b!788867 () Bool)

(declare-fun e!438472 () SeekEntryResult!8110)

(assert (=> b!788867 (= e!438472 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20510 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!788868 () Bool)

(declare-fun e!438474 () SeekEntryResult!8110)

(assert (=> b!788868 (= e!438474 Undefined!8110)))

(declare-fun b!788869 () Bool)

