; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67462 () Bool)

(assert start!67462)

(declare-fun b!780526 () Bool)

(declare-fun res!528112 () Bool)

(declare-fun e!434178 () Bool)

(assert (=> b!780526 (=> (not res!528112) (not e!434178))))

(declare-datatypes ((array!42628 0))(
  ( (array!42629 (arr!20405 (Array (_ BitVec 32) (_ BitVec 64))) (size!20826 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42628)

(declare-datatypes ((List!14407 0))(
  ( (Nil!14404) (Cons!14403 (h!15520 (_ BitVec 64)) (t!20722 List!14407)) )
))
(declare-fun arrayNoDuplicates!0 (array!42628 (_ BitVec 32) List!14407) Bool)

(assert (=> b!780526 (= res!528112 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14404))))

(declare-fun b!780527 () Bool)

(declare-fun e!434183 () Bool)

(assert (=> b!780527 (= e!434183 true)))

(declare-datatypes ((Unit!26908 0))(
  ( (Unit!26909) )
))
(declare-fun lt!347828 () Unit!26908)

(declare-fun e!434186 () Unit!26908)

(assert (=> b!780527 (= lt!347828 e!434186)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun c!86616 () Bool)

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!780527 (= c!86616 (= (select (store (arr!20405 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!434184 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!780528 () Bool)

(declare-datatypes ((SeekEntryResult!8005 0))(
  ( (MissingZero!8005 (index!34388 (_ BitVec 32))) (Found!8005 (index!34389 (_ BitVec 32))) (Intermediate!8005 (undefined!8817 Bool) (index!34390 (_ BitVec 32)) (x!65335 (_ BitVec 32))) (Undefined!8005) (MissingVacant!8005 (index!34391 (_ BitVec 32))) )
))
(declare-fun lt!347832 () SeekEntryResult!8005)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42628 (_ BitVec 32)) SeekEntryResult!8005)

(assert (=> b!780528 (= e!434184 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20405 a!3186) j!159) a!3186 mask!3328) lt!347832))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!780529 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42628 (_ BitVec 32)) SeekEntryResult!8005)

(assert (=> b!780529 (= e!434184 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20405 a!3186) j!159) a!3186 mask!3328) (Found!8005 j!159)))))

(declare-fun b!780530 () Bool)

(declare-fun res!528116 () Bool)

(declare-fun e!434181 () Bool)

(assert (=> b!780530 (=> (not res!528116) (not e!434181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780530 (= res!528116 (validKeyInArray!0 k!2102))))

(declare-fun b!780531 () Bool)

(declare-fun res!528114 () Bool)

(assert (=> b!780531 (=> (not res!528114) (not e!434178))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!780531 (= res!528114 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20826 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20826 a!3186))))))

(declare-fun b!780532 () Bool)

(declare-fun e!434179 () Bool)

(assert (=> b!780532 (= e!434179 (not e!434183))))

(declare-fun res!528107 () Bool)

(assert (=> b!780532 (=> res!528107 e!434183)))

(declare-fun lt!347826 () SeekEntryResult!8005)

(assert (=> b!780532 (= res!528107 (or (not (is-Intermediate!8005 lt!347826)) (bvslt x!1131 (x!65335 lt!347826)) (not (= x!1131 (x!65335 lt!347826))) (not (= index!1321 (index!34390 lt!347826)))))))

(declare-fun e!434182 () Bool)

(assert (=> b!780532 e!434182))

(declare-fun res!528108 () Bool)

(assert (=> b!780532 (=> (not res!528108) (not e!434182))))

(declare-fun lt!347834 () SeekEntryResult!8005)

(declare-fun lt!347833 () SeekEntryResult!8005)

(assert (=> b!780532 (= res!528108 (= lt!347834 lt!347833))))

(assert (=> b!780532 (= lt!347833 (Found!8005 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42628 (_ BitVec 32)) SeekEntryResult!8005)

(assert (=> b!780532 (= lt!347834 (seekEntryOrOpen!0 (select (arr!20405 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42628 (_ BitVec 32)) Bool)

(assert (=> b!780532 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347829 () Unit!26908)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26908)

(assert (=> b!780532 (= lt!347829 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780533 () Bool)

(assert (=> b!780533 (= e!434181 e!434178)))

(declare-fun res!528105 () Bool)

(assert (=> b!780533 (=> (not res!528105) (not e!434178))))

(declare-fun lt!347831 () SeekEntryResult!8005)

(assert (=> b!780533 (= res!528105 (or (= lt!347831 (MissingZero!8005 i!1173)) (= lt!347831 (MissingVacant!8005 i!1173))))))

(assert (=> b!780533 (= lt!347831 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!780534 () Bool)

(declare-fun Unit!26910 () Unit!26908)

(assert (=> b!780534 (= e!434186 Unit!26910)))

(assert (=> b!780534 false))

(declare-fun res!528111 () Bool)

(assert (=> start!67462 (=> (not res!528111) (not e!434181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67462 (= res!528111 (validMask!0 mask!3328))))

(assert (=> start!67462 e!434181))

(assert (=> start!67462 true))

(declare-fun array_inv!16201 (array!42628) Bool)

(assert (=> start!67462 (array_inv!16201 a!3186)))

(declare-fun b!780535 () Bool)

(declare-fun res!528113 () Bool)

(assert (=> b!780535 (=> (not res!528113) (not e!434181))))

(declare-fun arrayContainsKey!0 (array!42628 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780535 (= res!528113 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780536 () Bool)

(declare-fun res!528103 () Bool)

(declare-fun e!434180 () Bool)

(assert (=> b!780536 (=> (not res!528103) (not e!434180))))

(assert (=> b!780536 (= res!528103 e!434184)))

(declare-fun c!86617 () Bool)

(assert (=> b!780536 (= c!86617 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!780537 () Bool)

(declare-fun res!528117 () Bool)

(assert (=> b!780537 (=> res!528117 e!434183)))

(assert (=> b!780537 (= res!528117 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20405 a!3186) j!159) a!3186 mask!3328) lt!347833)))))

(declare-fun b!780538 () Bool)

(assert (=> b!780538 (= e!434178 e!434180)))

(declare-fun res!528119 () Bool)

(assert (=> b!780538 (=> (not res!528119) (not e!434180))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780538 (= res!528119 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20405 a!3186) j!159) mask!3328) (select (arr!20405 a!3186) j!159) a!3186 mask!3328) lt!347832))))

(assert (=> b!780538 (= lt!347832 (Intermediate!8005 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780539 () Bool)

(declare-fun res!528109 () Bool)

(assert (=> b!780539 (=> (not res!528109) (not e!434178))))

(assert (=> b!780539 (= res!528109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780540 () Bool)

(assert (=> b!780540 (= e!434182 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20405 a!3186) j!159) a!3186 mask!3328) lt!347833))))

(declare-fun b!780541 () Bool)

(assert (=> b!780541 (= e!434180 e!434179)))

(declare-fun res!528118 () Bool)

(assert (=> b!780541 (=> (not res!528118) (not e!434179))))

(declare-fun lt!347827 () SeekEntryResult!8005)

(assert (=> b!780541 (= res!528118 (= lt!347827 lt!347826))))

(declare-fun lt!347830 () array!42628)

(declare-fun lt!347825 () (_ BitVec 64))

(assert (=> b!780541 (= lt!347826 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347825 lt!347830 mask!3328))))

(assert (=> b!780541 (= lt!347827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347825 mask!3328) lt!347825 lt!347830 mask!3328))))

(assert (=> b!780541 (= lt!347825 (select (store (arr!20405 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!780541 (= lt!347830 (array!42629 (store (arr!20405 a!3186) i!1173 k!2102) (size!20826 a!3186)))))

(declare-fun b!780542 () Bool)

(declare-fun res!528115 () Bool)

(assert (=> b!780542 (=> (not res!528115) (not e!434181))))

(assert (=> b!780542 (= res!528115 (validKeyInArray!0 (select (arr!20405 a!3186) j!159)))))

(declare-fun b!780543 () Bool)

(declare-fun res!528106 () Bool)

(assert (=> b!780543 (=> (not res!528106) (not e!434181))))

(assert (=> b!780543 (= res!528106 (and (= (size!20826 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20826 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20826 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!780544 () Bool)

(declare-fun res!528110 () Bool)

(assert (=> b!780544 (=> (not res!528110) (not e!434180))))

(assert (=> b!780544 (= res!528110 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20405 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780545 () Bool)

(declare-fun res!528104 () Bool)

(assert (=> b!780545 (=> res!528104 e!434183)))

(assert (=> b!780545 (= res!528104 (= (select (store (arr!20405 a!3186) i!1173 k!2102) index!1321) lt!347825))))

(declare-fun b!780546 () Bool)

(declare-fun Unit!26911 () Unit!26908)

(assert (=> b!780546 (= e!434186 Unit!26911)))

(assert (= (and start!67462 res!528111) b!780543))

(assert (= (and b!780543 res!528106) b!780542))

(assert (= (and b!780542 res!528115) b!780530))

(assert (= (and b!780530 res!528116) b!780535))

(assert (= (and b!780535 res!528113) b!780533))

(assert (= (and b!780533 res!528105) b!780539))

(assert (= (and b!780539 res!528109) b!780526))

(assert (= (and b!780526 res!528112) b!780531))

(assert (= (and b!780531 res!528114) b!780538))

(assert (= (and b!780538 res!528119) b!780544))

(assert (= (and b!780544 res!528110) b!780536))

(assert (= (and b!780536 c!86617) b!780528))

(assert (= (and b!780536 (not c!86617)) b!780529))

(assert (= (and b!780536 res!528103) b!780541))

(assert (= (and b!780541 res!528118) b!780532))

(assert (= (and b!780532 res!528108) b!780540))

(assert (= (and b!780532 (not res!528107)) b!780537))

(assert (= (and b!780537 (not res!528117)) b!780545))

(assert (= (and b!780545 (not res!528104)) b!780527))

(assert (= (and b!780527 c!86616) b!780534))

(assert (= (and b!780527 (not c!86616)) b!780546))

(declare-fun m!723809 () Bool)

(assert (=> b!780529 m!723809))

(assert (=> b!780529 m!723809))

(declare-fun m!723811 () Bool)

(assert (=> b!780529 m!723811))

(declare-fun m!723813 () Bool)

(assert (=> b!780530 m!723813))

(assert (=> b!780538 m!723809))

(assert (=> b!780538 m!723809))

(declare-fun m!723815 () Bool)

(assert (=> b!780538 m!723815))

(assert (=> b!780538 m!723815))

(assert (=> b!780538 m!723809))

(declare-fun m!723817 () Bool)

(assert (=> b!780538 m!723817))

(declare-fun m!723819 () Bool)

(assert (=> start!67462 m!723819))

(declare-fun m!723821 () Bool)

(assert (=> start!67462 m!723821))

(assert (=> b!780540 m!723809))

(assert (=> b!780540 m!723809))

(declare-fun m!723823 () Bool)

(assert (=> b!780540 m!723823))

(declare-fun m!723825 () Bool)

(assert (=> b!780526 m!723825))

(declare-fun m!723827 () Bool)

(assert (=> b!780533 m!723827))

(declare-fun m!723829 () Bool)

(assert (=> b!780541 m!723829))

(declare-fun m!723831 () Bool)

(assert (=> b!780541 m!723831))

(declare-fun m!723833 () Bool)

(assert (=> b!780541 m!723833))

(declare-fun m!723835 () Bool)

(assert (=> b!780541 m!723835))

(declare-fun m!723837 () Bool)

(assert (=> b!780541 m!723837))

(assert (=> b!780541 m!723835))

(assert (=> b!780528 m!723809))

(assert (=> b!780528 m!723809))

(declare-fun m!723839 () Bool)

(assert (=> b!780528 m!723839))

(assert (=> b!780542 m!723809))

(assert (=> b!780542 m!723809))

(declare-fun m!723841 () Bool)

(assert (=> b!780542 m!723841))

(assert (=> b!780537 m!723809))

(assert (=> b!780537 m!723809))

(assert (=> b!780537 m!723811))

(declare-fun m!723843 () Bool)

(assert (=> b!780535 m!723843))

(declare-fun m!723845 () Bool)

(assert (=> b!780544 m!723845))

(assert (=> b!780527 m!723831))

(declare-fun m!723847 () Bool)

(assert (=> b!780527 m!723847))

(assert (=> b!780545 m!723831))

(assert (=> b!780545 m!723847))

(declare-fun m!723849 () Bool)

(assert (=> b!780539 m!723849))

(assert (=> b!780532 m!723809))

(assert (=> b!780532 m!723809))

(declare-fun m!723851 () Bool)

(assert (=> b!780532 m!723851))

(declare-fun m!723853 () Bool)

(assert (=> b!780532 m!723853))

(declare-fun m!723855 () Bool)

(assert (=> b!780532 m!723855))

(push 1)

