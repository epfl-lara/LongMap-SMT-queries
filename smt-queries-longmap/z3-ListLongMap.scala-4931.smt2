; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68014 () Bool)

(assert start!68014)

(declare-fun b!790434 () Bool)

(declare-fun e!439386 () Bool)

(declare-fun e!439388 () Bool)

(assert (=> b!790434 (= e!439386 e!439388)))

(declare-fun res!535282 () Bool)

(assert (=> b!790434 (=> res!535282 e!439388)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42871 0))(
  ( (array!42872 (arr!20518 (Array (_ BitVec 32) (_ BitVec 64))) (size!20938 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42871)

(assert (=> b!790434 (= res!535282 (or (not (= (select (arr!20518 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-datatypes ((SeekEntryResult!8074 0))(
  ( (MissingZero!8074 (index!34664 (_ BitVec 32))) (Found!8074 (index!34665 (_ BitVec 32))) (Intermediate!8074 (undefined!8886 Bool) (index!34666 (_ BitVec 32)) (x!65762 (_ BitVec 32))) (Undefined!8074) (MissingVacant!8074 (index!34667 (_ BitVec 32))) )
))
(declare-fun lt!352742 () SeekEntryResult!8074)

(declare-fun lt!352743 () SeekEntryResult!8074)

(declare-fun lt!352740 () SeekEntryResult!8074)

(declare-fun lt!352737 () SeekEntryResult!8074)

(assert (=> b!790434 (and (= lt!352743 lt!352737) (= lt!352740 lt!352742))))

(declare-fun lt!352739 () array!42871)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!352741 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42871 (_ BitVec 32)) SeekEntryResult!8074)

(assert (=> b!790434 (= lt!352737 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352741 lt!352739 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42871 (_ BitVec 32)) SeekEntryResult!8074)

(assert (=> b!790434 (= lt!352743 (seekEntryOrOpen!0 lt!352741 lt!352739 mask!3328))))

(declare-fun lt!352736 () (_ BitVec 64))

(assert (=> b!790434 (= lt!352736 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!27361 0))(
  ( (Unit!27362) )
))
(declare-fun lt!352732 () Unit!27361)

(declare-fun e!439390 () Unit!27361)

(assert (=> b!790434 (= lt!352732 e!439390)))

(declare-fun c!87992 () Bool)

(assert (=> b!790434 (= c!87992 (= lt!352736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790435 () Bool)

(declare-fun res!535277 () Bool)

(declare-fun e!439384 () Bool)

(assert (=> b!790435 (=> (not res!535277) (not e!439384))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790435 (= res!535277 (validKeyInArray!0 (select (arr!20518 a!3186) j!159)))))

(declare-fun b!790436 () Bool)

(declare-fun e!439385 () Bool)

(assert (=> b!790436 (= e!439384 e!439385)))

(declare-fun res!535284 () Bool)

(assert (=> b!790436 (=> (not res!535284) (not e!439385))))

(declare-fun lt!352738 () SeekEntryResult!8074)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!790436 (= res!535284 (or (= lt!352738 (MissingZero!8074 i!1173)) (= lt!352738 (MissingVacant!8074 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!790436 (= lt!352738 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!790437 () Bool)

(declare-fun res!535280 () Bool)

(declare-fun e!439383 () Bool)

(assert (=> b!790437 (=> (not res!535280) (not e!439383))))

(declare-fun e!439387 () Bool)

(assert (=> b!790437 (= res!535280 e!439387)))

(declare-fun c!87991 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!790437 (= c!87991 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!790438 () Bool)

(declare-fun res!535290 () Bool)

(assert (=> b!790438 (=> (not res!535290) (not e!439384))))

(assert (=> b!790438 (= res!535290 (and (= (size!20938 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20938 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20938 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790439 () Bool)

(declare-fun res!535283 () Bool)

(assert (=> b!790439 (=> (not res!535283) (not e!439385))))

(assert (=> b!790439 (= res!535283 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20938 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20938 a!3186))))))

(declare-fun b!790440 () Bool)

(declare-fun lt!352734 () SeekEntryResult!8074)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42871 (_ BitVec 32)) SeekEntryResult!8074)

(assert (=> b!790440 (= e!439387 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20518 a!3186) j!159) a!3186 mask!3328) lt!352734))))

(declare-fun b!790441 () Bool)

(assert (=> b!790441 (= e!439385 e!439383)))

(declare-fun res!535293 () Bool)

(assert (=> b!790441 (=> (not res!535293) (not e!439383))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790441 (= res!535293 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20518 a!3186) j!159) mask!3328) (select (arr!20518 a!3186) j!159) a!3186 mask!3328) lt!352734))))

(assert (=> b!790441 (= lt!352734 (Intermediate!8074 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790442 () Bool)

(declare-fun e!439389 () Bool)

(declare-fun e!439381 () Bool)

(assert (=> b!790442 (= e!439389 (not e!439381))))

(declare-fun res!535292 () Bool)

(assert (=> b!790442 (=> res!535292 e!439381)))

(declare-fun lt!352731 () SeekEntryResult!8074)

(get-info :version)

(assert (=> b!790442 (= res!535292 (or (not ((_ is Intermediate!8074) lt!352731)) (bvslt x!1131 (x!65762 lt!352731)) (not (= x!1131 (x!65762 lt!352731))) (not (= index!1321 (index!34666 lt!352731)))))))

(declare-fun e!439380 () Bool)

(assert (=> b!790442 e!439380))

(declare-fun res!535276 () Bool)

(assert (=> b!790442 (=> (not res!535276) (not e!439380))))

(declare-fun lt!352735 () SeekEntryResult!8074)

(assert (=> b!790442 (= res!535276 (= lt!352740 lt!352735))))

(assert (=> b!790442 (= lt!352735 (Found!8074 j!159))))

(assert (=> b!790442 (= lt!352740 (seekEntryOrOpen!0 (select (arr!20518 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42871 (_ BitVec 32)) Bool)

(assert (=> b!790442 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352730 () Unit!27361)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42871 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27361)

(assert (=> b!790442 (= lt!352730 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790443 () Bool)

(declare-fun res!535278 () Bool)

(assert (=> b!790443 (=> (not res!535278) (not e!439384))))

(declare-fun arrayContainsKey!0 (array!42871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790443 (= res!535278 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790444 () Bool)

(declare-fun res!535291 () Bool)

(assert (=> b!790444 (=> (not res!535291) (not e!439383))))

(assert (=> b!790444 (= res!535291 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20518 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790445 () Bool)

(declare-fun Unit!27363 () Unit!27361)

(assert (=> b!790445 (= e!439390 Unit!27363)))

(assert (=> b!790445 false))

(declare-fun b!790446 () Bool)

(assert (=> b!790446 (= e!439380 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20518 a!3186) j!159) a!3186 mask!3328) lt!352735))))

(declare-fun b!790447 () Bool)

(declare-fun res!535281 () Bool)

(assert (=> b!790447 (=> (not res!535281) (not e!439384))))

(assert (=> b!790447 (= res!535281 (validKeyInArray!0 k0!2102))))

(declare-fun b!790448 () Bool)

(assert (=> b!790448 (= e!439388 true)))

(assert (=> b!790448 (= lt!352737 lt!352742)))

(declare-fun lt!352733 () Unit!27361)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42871 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27361)

(assert (=> b!790448 (= lt!352733 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!790449 () Bool)

(assert (=> b!790449 (= e!439383 e!439389)))

(declare-fun res!535288 () Bool)

(assert (=> b!790449 (=> (not res!535288) (not e!439389))))

(declare-fun lt!352744 () SeekEntryResult!8074)

(assert (=> b!790449 (= res!535288 (= lt!352744 lt!352731))))

(assert (=> b!790449 (= lt!352731 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352741 lt!352739 mask!3328))))

(assert (=> b!790449 (= lt!352744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352741 mask!3328) lt!352741 lt!352739 mask!3328))))

(assert (=> b!790449 (= lt!352741 (select (store (arr!20518 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!790449 (= lt!352739 (array!42872 (store (arr!20518 a!3186) i!1173 k0!2102) (size!20938 a!3186)))))

(declare-fun res!535287 () Bool)

(assert (=> start!68014 (=> (not res!535287) (not e!439384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68014 (= res!535287 (validMask!0 mask!3328))))

(assert (=> start!68014 e!439384))

(assert (=> start!68014 true))

(declare-fun array_inv!16377 (array!42871) Bool)

(assert (=> start!68014 (array_inv!16377 a!3186)))

(declare-fun b!790450 () Bool)

(declare-fun Unit!27364 () Unit!27361)

(assert (=> b!790450 (= e!439390 Unit!27364)))

(declare-fun b!790451 () Bool)

(declare-fun e!439382 () Bool)

(assert (=> b!790451 (= e!439381 e!439382)))

(declare-fun res!535285 () Bool)

(assert (=> b!790451 (=> res!535285 e!439382)))

(assert (=> b!790451 (= res!535285 (not (= lt!352742 lt!352735)))))

(assert (=> b!790451 (= lt!352742 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20518 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790452 () Bool)

(declare-fun res!535286 () Bool)

(assert (=> b!790452 (=> (not res!535286) (not e!439385))))

(assert (=> b!790452 (= res!535286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!790453 () Bool)

(declare-fun res!535279 () Bool)

(assert (=> b!790453 (=> (not res!535279) (not e!439385))))

(declare-datatypes ((List!14427 0))(
  ( (Nil!14424) (Cons!14423 (h!15555 (_ BitVec 64)) (t!20734 List!14427)) )
))
(declare-fun arrayNoDuplicates!0 (array!42871 (_ BitVec 32) List!14427) Bool)

(assert (=> b!790453 (= res!535279 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14424))))

(declare-fun b!790454 () Bool)

(assert (=> b!790454 (= e!439387 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20518 a!3186) j!159) a!3186 mask!3328) (Found!8074 j!159)))))

(declare-fun b!790455 () Bool)

(assert (=> b!790455 (= e!439382 e!439386)))

(declare-fun res!535289 () Bool)

(assert (=> b!790455 (=> res!535289 e!439386)))

(assert (=> b!790455 (= res!535289 (= lt!352736 lt!352741))))

(assert (=> b!790455 (= lt!352736 (select (store (arr!20518 a!3186) i!1173 k0!2102) index!1321))))

(assert (= (and start!68014 res!535287) b!790438))

(assert (= (and b!790438 res!535290) b!790435))

(assert (= (and b!790435 res!535277) b!790447))

(assert (= (and b!790447 res!535281) b!790443))

(assert (= (and b!790443 res!535278) b!790436))

(assert (= (and b!790436 res!535284) b!790452))

(assert (= (and b!790452 res!535286) b!790453))

(assert (= (and b!790453 res!535279) b!790439))

(assert (= (and b!790439 res!535283) b!790441))

(assert (= (and b!790441 res!535293) b!790444))

(assert (= (and b!790444 res!535291) b!790437))

(assert (= (and b!790437 c!87991) b!790440))

(assert (= (and b!790437 (not c!87991)) b!790454))

(assert (= (and b!790437 res!535280) b!790449))

(assert (= (and b!790449 res!535288) b!790442))

(assert (= (and b!790442 res!535276) b!790446))

(assert (= (and b!790442 (not res!535292)) b!790451))

(assert (= (and b!790451 (not res!535285)) b!790455))

(assert (= (and b!790455 (not res!535289)) b!790434))

(assert (= (and b!790434 c!87992) b!790445))

(assert (= (and b!790434 (not c!87992)) b!790450))

(assert (= (and b!790434 (not res!535282)) b!790448))

(declare-fun m!731867 () Bool)

(assert (=> b!790447 m!731867))

(declare-fun m!731869 () Bool)

(assert (=> b!790440 m!731869))

(assert (=> b!790440 m!731869))

(declare-fun m!731871 () Bool)

(assert (=> b!790440 m!731871))

(declare-fun m!731873 () Bool)

(assert (=> b!790452 m!731873))

(assert (=> b!790451 m!731869))

(assert (=> b!790451 m!731869))

(declare-fun m!731875 () Bool)

(assert (=> b!790451 m!731875))

(declare-fun m!731877 () Bool)

(assert (=> b!790449 m!731877))

(declare-fun m!731879 () Bool)

(assert (=> b!790449 m!731879))

(declare-fun m!731881 () Bool)

(assert (=> b!790449 m!731881))

(declare-fun m!731883 () Bool)

(assert (=> b!790449 m!731883))

(assert (=> b!790449 m!731877))

(declare-fun m!731885 () Bool)

(assert (=> b!790449 m!731885))

(assert (=> b!790454 m!731869))

(assert (=> b!790454 m!731869))

(assert (=> b!790454 m!731875))

(declare-fun m!731887 () Bool)

(assert (=> b!790444 m!731887))

(declare-fun m!731889 () Bool)

(assert (=> b!790443 m!731889))

(declare-fun m!731891 () Bool)

(assert (=> start!68014 m!731891))

(declare-fun m!731893 () Bool)

(assert (=> start!68014 m!731893))

(assert (=> b!790455 m!731881))

(declare-fun m!731895 () Bool)

(assert (=> b!790455 m!731895))

(assert (=> b!790435 m!731869))

(assert (=> b!790435 m!731869))

(declare-fun m!731897 () Bool)

(assert (=> b!790435 m!731897))

(declare-fun m!731899 () Bool)

(assert (=> b!790448 m!731899))

(assert (=> b!790441 m!731869))

(assert (=> b!790441 m!731869))

(declare-fun m!731901 () Bool)

(assert (=> b!790441 m!731901))

(assert (=> b!790441 m!731901))

(assert (=> b!790441 m!731869))

(declare-fun m!731903 () Bool)

(assert (=> b!790441 m!731903))

(declare-fun m!731905 () Bool)

(assert (=> b!790436 m!731905))

(declare-fun m!731907 () Bool)

(assert (=> b!790453 m!731907))

(assert (=> b!790446 m!731869))

(assert (=> b!790446 m!731869))

(declare-fun m!731909 () Bool)

(assert (=> b!790446 m!731909))

(assert (=> b!790442 m!731869))

(assert (=> b!790442 m!731869))

(declare-fun m!731911 () Bool)

(assert (=> b!790442 m!731911))

(declare-fun m!731913 () Bool)

(assert (=> b!790442 m!731913))

(declare-fun m!731915 () Bool)

(assert (=> b!790442 m!731915))

(declare-fun m!731917 () Bool)

(assert (=> b!790434 m!731917))

(declare-fun m!731919 () Bool)

(assert (=> b!790434 m!731919))

(declare-fun m!731921 () Bool)

(assert (=> b!790434 m!731921))

(check-sat (not b!790451) (not b!790443) (not b!790436) (not b!790449) (not b!790442) (not b!790454) (not b!790435) (not b!790452) (not b!790441) (not b!790453) (not b!790446) (not b!790448) (not b!790434) (not b!790447) (not start!68014) (not b!790440))
(check-sat)
