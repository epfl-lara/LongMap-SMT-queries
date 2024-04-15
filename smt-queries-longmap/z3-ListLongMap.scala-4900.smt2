; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67556 () Bool)

(assert start!67556)

(declare-datatypes ((array!42678 0))(
  ( (array!42679 (arr!20429 (Array (_ BitVec 32) (_ BitVec 64))) (size!20850 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42678)

(declare-datatypes ((SeekEntryResult!8026 0))(
  ( (MissingZero!8026 (index!34472 (_ BitVec 32))) (Found!8026 (index!34473 (_ BitVec 32))) (Intermediate!8026 (undefined!8838 Bool) (index!34474 (_ BitVec 32)) (x!65432 (_ BitVec 32))) (Undefined!8026) (MissingVacant!8026 (index!34475 (_ BitVec 32))) )
))
(declare-fun lt!348504 () SeekEntryResult!8026)

(declare-fun e!434959 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!782268 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42678 (_ BitVec 32)) SeekEntryResult!8026)

(assert (=> b!782268 (= e!434959 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20429 a!3186) j!159) a!3186 mask!3328) lt!348504))))

(declare-fun b!782269 () Bool)

(declare-fun e!434953 () Bool)

(declare-fun e!434962 () Bool)

(assert (=> b!782269 (= e!434953 (not e!434962))))

(declare-fun res!529398 () Bool)

(assert (=> b!782269 (=> res!529398 e!434962)))

(declare-fun lt!348508 () SeekEntryResult!8026)

(get-info :version)

(assert (=> b!782269 (= res!529398 (or (not ((_ is Intermediate!8026) lt!348508)) (bvslt x!1131 (x!65432 lt!348508)) (not (= x!1131 (x!65432 lt!348508))) (not (= index!1321 (index!34474 lt!348508)))))))

(declare-fun e!434955 () Bool)

(assert (=> b!782269 e!434955))

(declare-fun res!529395 () Bool)

(assert (=> b!782269 (=> (not res!529395) (not e!434955))))

(declare-fun lt!348505 () SeekEntryResult!8026)

(declare-fun lt!348506 () SeekEntryResult!8026)

(assert (=> b!782269 (= res!529395 (= lt!348505 lt!348506))))

(assert (=> b!782269 (= lt!348506 (Found!8026 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42678 (_ BitVec 32)) SeekEntryResult!8026)

(assert (=> b!782269 (= lt!348505 (seekEntryOrOpen!0 (select (arr!20429 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42678 (_ BitVec 32)) Bool)

(assert (=> b!782269 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26972 0))(
  ( (Unit!26973) )
))
(declare-fun lt!348510 () Unit!26972)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26972)

(assert (=> b!782269 (= lt!348510 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782270 () Bool)

(declare-fun res!529403 () Bool)

(assert (=> b!782270 (=> res!529403 e!434962)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42678 (_ BitVec 32)) SeekEntryResult!8026)

(assert (=> b!782270 (= res!529403 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20429 a!3186) j!159) a!3186 mask!3328) lt!348506)))))

(declare-fun b!782271 () Bool)

(declare-fun res!529402 () Bool)

(declare-fun e!434956 () Bool)

(assert (=> b!782271 (=> (not res!529402) (not e!434956))))

(assert (=> b!782271 (= res!529402 e!434959)))

(declare-fun c!86843 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782271 (= c!86843 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782272 () Bool)

(declare-fun e!434958 () Bool)

(declare-fun e!434957 () Bool)

(assert (=> b!782272 (= e!434958 e!434957)))

(declare-fun res!529404 () Bool)

(assert (=> b!782272 (=> (not res!529404) (not e!434957))))

(declare-fun lt!348503 () SeekEntryResult!8026)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!782272 (= res!529404 (or (= lt!348503 (MissingZero!8026 i!1173)) (= lt!348503 (MissingVacant!8026 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!782272 (= lt!348503 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!529405 () Bool)

(assert (=> start!67556 (=> (not res!529405) (not e!434958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67556 (= res!529405 (validMask!0 mask!3328))))

(assert (=> start!67556 e!434958))

(assert (=> start!67556 true))

(declare-fun array_inv!16312 (array!42678) Bool)

(assert (=> start!67556 (array_inv!16312 a!3186)))

(declare-fun b!782273 () Bool)

(declare-fun res!529410 () Bool)

(assert (=> b!782273 (=> (not res!529410) (not e!434958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782273 (= res!529410 (validKeyInArray!0 (select (arr!20429 a!3186) j!159)))))

(declare-fun b!782274 () Bool)

(declare-fun res!529396 () Bool)

(assert (=> b!782274 (=> (not res!529396) (not e!434957))))

(assert (=> b!782274 (= res!529396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782275 () Bool)

(declare-fun res!529408 () Bool)

(assert (=> b!782275 (=> (not res!529408) (not e!434957))))

(assert (=> b!782275 (= res!529408 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20850 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20850 a!3186))))))

(declare-fun b!782276 () Bool)

(declare-fun res!529399 () Bool)

(assert (=> b!782276 (=> (not res!529399) (not e!434956))))

(assert (=> b!782276 (= res!529399 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20429 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782277 () Bool)

(declare-fun res!529406 () Bool)

(assert (=> b!782277 (=> (not res!529406) (not e!434957))))

(declare-datatypes ((List!14470 0))(
  ( (Nil!14467) (Cons!14466 (h!15586 (_ BitVec 64)) (t!20776 List!14470)) )
))
(declare-fun arrayNoDuplicates!0 (array!42678 (_ BitVec 32) List!14470) Bool)

(assert (=> b!782277 (= res!529406 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14467))))

(declare-fun b!782278 () Bool)

(declare-fun e!434954 () Bool)

(assert (=> b!782278 (= e!434962 e!434954)))

(declare-fun res!529397 () Bool)

(assert (=> b!782278 (=> res!529397 e!434954)))

(declare-fun lt!348512 () (_ BitVec 64))

(declare-fun lt!348511 () (_ BitVec 64))

(assert (=> b!782278 (= res!529397 (= lt!348512 lt!348511))))

(assert (=> b!782278 (= lt!348512 (select (store (arr!20429 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!782279 () Bool)

(declare-fun lt!348509 () array!42678)

(assert (=> b!782279 (= e!434954 (= (seekEntryOrOpen!0 lt!348511 lt!348509 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!348511 lt!348509 mask!3328)))))

(assert (=> b!782279 (= lt!348512 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348502 () Unit!26972)

(declare-fun e!434961 () Unit!26972)

(assert (=> b!782279 (= lt!348502 e!434961)))

(declare-fun c!86844 () Bool)

(assert (=> b!782279 (= c!86844 (= lt!348512 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782280 () Bool)

(declare-fun res!529400 () Bool)

(assert (=> b!782280 (=> (not res!529400) (not e!434958))))

(assert (=> b!782280 (= res!529400 (validKeyInArray!0 k0!2102))))

(declare-fun b!782281 () Bool)

(declare-fun res!529407 () Bool)

(assert (=> b!782281 (=> (not res!529407) (not e!434958))))

(assert (=> b!782281 (= res!529407 (and (= (size!20850 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20850 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20850 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782282 () Bool)

(assert (=> b!782282 (= e!434957 e!434956)))

(declare-fun res!529401 () Bool)

(assert (=> b!782282 (=> (not res!529401) (not e!434956))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782282 (= res!529401 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20429 a!3186) j!159) mask!3328) (select (arr!20429 a!3186) j!159) a!3186 mask!3328) lt!348504))))

(assert (=> b!782282 (= lt!348504 (Intermediate!8026 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782283 () Bool)

(assert (=> b!782283 (= e!434956 e!434953)))

(declare-fun res!529409 () Bool)

(assert (=> b!782283 (=> (not res!529409) (not e!434953))))

(declare-fun lt!348507 () SeekEntryResult!8026)

(assert (=> b!782283 (= res!529409 (= lt!348507 lt!348508))))

(assert (=> b!782283 (= lt!348508 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348511 lt!348509 mask!3328))))

(assert (=> b!782283 (= lt!348507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348511 mask!3328) lt!348511 lt!348509 mask!3328))))

(assert (=> b!782283 (= lt!348511 (select (store (arr!20429 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!782283 (= lt!348509 (array!42679 (store (arr!20429 a!3186) i!1173 k0!2102) (size!20850 a!3186)))))

(declare-fun b!782284 () Bool)

(assert (=> b!782284 (= e!434955 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20429 a!3186) j!159) a!3186 mask!3328) lt!348506))))

(declare-fun b!782285 () Bool)

(declare-fun Unit!26974 () Unit!26972)

(assert (=> b!782285 (= e!434961 Unit!26974)))

(declare-fun b!782286 () Bool)

(declare-fun res!529394 () Bool)

(assert (=> b!782286 (=> (not res!529394) (not e!434958))))

(declare-fun arrayContainsKey!0 (array!42678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782286 (= res!529394 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782287 () Bool)

(assert (=> b!782287 (= e!434959 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20429 a!3186) j!159) a!3186 mask!3328) (Found!8026 j!159)))))

(declare-fun b!782288 () Bool)

(declare-fun Unit!26975 () Unit!26972)

(assert (=> b!782288 (= e!434961 Unit!26975)))

(assert (=> b!782288 false))

(assert (= (and start!67556 res!529405) b!782281))

(assert (= (and b!782281 res!529407) b!782273))

(assert (= (and b!782273 res!529410) b!782280))

(assert (= (and b!782280 res!529400) b!782286))

(assert (= (and b!782286 res!529394) b!782272))

(assert (= (and b!782272 res!529404) b!782274))

(assert (= (and b!782274 res!529396) b!782277))

(assert (= (and b!782277 res!529406) b!782275))

(assert (= (and b!782275 res!529408) b!782282))

(assert (= (and b!782282 res!529401) b!782276))

(assert (= (and b!782276 res!529399) b!782271))

(assert (= (and b!782271 c!86843) b!782268))

(assert (= (and b!782271 (not c!86843)) b!782287))

(assert (= (and b!782271 res!529402) b!782283))

(assert (= (and b!782283 res!529409) b!782269))

(assert (= (and b!782269 res!529395) b!782284))

(assert (= (and b!782269 (not res!529398)) b!782270))

(assert (= (and b!782270 (not res!529403)) b!782278))

(assert (= (and b!782278 (not res!529397)) b!782279))

(assert (= (and b!782279 c!86844) b!782288))

(assert (= (and b!782279 (not c!86844)) b!782285))

(declare-fun m!724533 () Bool)

(assert (=> b!782278 m!724533))

(declare-fun m!724535 () Bool)

(assert (=> b!782278 m!724535))

(declare-fun m!724537 () Bool)

(assert (=> b!782286 m!724537))

(declare-fun m!724539 () Bool)

(assert (=> b!782273 m!724539))

(assert (=> b!782273 m!724539))

(declare-fun m!724541 () Bool)

(assert (=> b!782273 m!724541))

(assert (=> b!782282 m!724539))

(assert (=> b!782282 m!724539))

(declare-fun m!724543 () Bool)

(assert (=> b!782282 m!724543))

(assert (=> b!782282 m!724543))

(assert (=> b!782282 m!724539))

(declare-fun m!724545 () Bool)

(assert (=> b!782282 m!724545))

(declare-fun m!724547 () Bool)

(assert (=> start!67556 m!724547))

(declare-fun m!724549 () Bool)

(assert (=> start!67556 m!724549))

(assert (=> b!782287 m!724539))

(assert (=> b!782287 m!724539))

(declare-fun m!724551 () Bool)

(assert (=> b!782287 m!724551))

(declare-fun m!724553 () Bool)

(assert (=> b!782274 m!724553))

(assert (=> b!782270 m!724539))

(assert (=> b!782270 m!724539))

(assert (=> b!782270 m!724551))

(assert (=> b!782269 m!724539))

(assert (=> b!782269 m!724539))

(declare-fun m!724555 () Bool)

(assert (=> b!782269 m!724555))

(declare-fun m!724557 () Bool)

(assert (=> b!782269 m!724557))

(declare-fun m!724559 () Bool)

(assert (=> b!782269 m!724559))

(declare-fun m!724561 () Bool)

(assert (=> b!782277 m!724561))

(declare-fun m!724563 () Bool)

(assert (=> b!782276 m!724563))

(declare-fun m!724565 () Bool)

(assert (=> b!782279 m!724565))

(declare-fun m!724567 () Bool)

(assert (=> b!782279 m!724567))

(declare-fun m!724569 () Bool)

(assert (=> b!782280 m!724569))

(assert (=> b!782268 m!724539))

(assert (=> b!782268 m!724539))

(declare-fun m!724571 () Bool)

(assert (=> b!782268 m!724571))

(declare-fun m!724573 () Bool)

(assert (=> b!782283 m!724573))

(assert (=> b!782283 m!724533))

(declare-fun m!724575 () Bool)

(assert (=> b!782283 m!724575))

(declare-fun m!724577 () Bool)

(assert (=> b!782283 m!724577))

(declare-fun m!724579 () Bool)

(assert (=> b!782283 m!724579))

(assert (=> b!782283 m!724577))

(declare-fun m!724581 () Bool)

(assert (=> b!782272 m!724581))

(assert (=> b!782284 m!724539))

(assert (=> b!782284 m!724539))

(declare-fun m!724583 () Bool)

(assert (=> b!782284 m!724583))

(check-sat (not b!782274) (not b!782270) (not b!782286) (not b!782268) (not start!67556) (not b!782282) (not b!782272) (not b!782269) (not b!782280) (not b!782283) (not b!782287) (not b!782284) (not b!782273) (not b!782277) (not b!782279))
(check-sat)
(get-model)

(declare-fun b!782427 () Bool)

(declare-fun c!86865 () Bool)

(declare-fun lt!348587 () (_ BitVec 64))

(assert (=> b!782427 (= c!86865 (= lt!348587 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435030 () SeekEntryResult!8026)

(declare-fun e!435029 () SeekEntryResult!8026)

(assert (=> b!782427 (= e!435030 e!435029)))

(declare-fun b!782428 () Bool)

(declare-fun e!435031 () SeekEntryResult!8026)

(assert (=> b!782428 (= e!435031 Undefined!8026)))

(declare-fun d!102455 () Bool)

(declare-fun lt!348586 () SeekEntryResult!8026)

(assert (=> d!102455 (and (or ((_ is Undefined!8026) lt!348586) (not ((_ is Found!8026) lt!348586)) (and (bvsge (index!34473 lt!348586) #b00000000000000000000000000000000) (bvslt (index!34473 lt!348586) (size!20850 a!3186)))) (or ((_ is Undefined!8026) lt!348586) ((_ is Found!8026) lt!348586) (not ((_ is MissingZero!8026) lt!348586)) (and (bvsge (index!34472 lt!348586) #b00000000000000000000000000000000) (bvslt (index!34472 lt!348586) (size!20850 a!3186)))) (or ((_ is Undefined!8026) lt!348586) ((_ is Found!8026) lt!348586) ((_ is MissingZero!8026) lt!348586) (not ((_ is MissingVacant!8026) lt!348586)) (and (bvsge (index!34475 lt!348586) #b00000000000000000000000000000000) (bvslt (index!34475 lt!348586) (size!20850 a!3186)))) (or ((_ is Undefined!8026) lt!348586) (ite ((_ is Found!8026) lt!348586) (= (select (arr!20429 a!3186) (index!34473 lt!348586)) (select (arr!20429 a!3186) j!159)) (ite ((_ is MissingZero!8026) lt!348586) (= (select (arr!20429 a!3186) (index!34472 lt!348586)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8026) lt!348586) (= (select (arr!20429 a!3186) (index!34475 lt!348586)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102455 (= lt!348586 e!435031)))

(declare-fun c!86864 () Bool)

(declare-fun lt!348585 () SeekEntryResult!8026)

(assert (=> d!102455 (= c!86864 (and ((_ is Intermediate!8026) lt!348585) (undefined!8838 lt!348585)))))

(assert (=> d!102455 (= lt!348585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20429 a!3186) j!159) mask!3328) (select (arr!20429 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102455 (validMask!0 mask!3328)))

(assert (=> d!102455 (= (seekEntryOrOpen!0 (select (arr!20429 a!3186) j!159) a!3186 mask!3328) lt!348586)))

(declare-fun b!782429 () Bool)

(assert (=> b!782429 (= e!435029 (MissingZero!8026 (index!34474 lt!348585)))))

(declare-fun b!782430 () Bool)

(assert (=> b!782430 (= e!435031 e!435030)))

(assert (=> b!782430 (= lt!348587 (select (arr!20429 a!3186) (index!34474 lt!348585)))))

(declare-fun c!86863 () Bool)

(assert (=> b!782430 (= c!86863 (= lt!348587 (select (arr!20429 a!3186) j!159)))))

(declare-fun b!782431 () Bool)

(assert (=> b!782431 (= e!435029 (seekKeyOrZeroReturnVacant!0 (x!65432 lt!348585) (index!34474 lt!348585) (index!34474 lt!348585) (select (arr!20429 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!782432 () Bool)

(assert (=> b!782432 (= e!435030 (Found!8026 (index!34474 lt!348585)))))

(assert (= (and d!102455 c!86864) b!782428))

(assert (= (and d!102455 (not c!86864)) b!782430))

(assert (= (and b!782430 c!86863) b!782432))

(assert (= (and b!782430 (not c!86863)) b!782427))

(assert (= (and b!782427 c!86865) b!782429))

(assert (= (and b!782427 (not c!86865)) b!782431))

(declare-fun m!724689 () Bool)

(assert (=> d!102455 m!724689))

(assert (=> d!102455 m!724543))

(assert (=> d!102455 m!724539))

(assert (=> d!102455 m!724545))

(assert (=> d!102455 m!724539))

(assert (=> d!102455 m!724543))

(declare-fun m!724691 () Bool)

(assert (=> d!102455 m!724691))

(declare-fun m!724693 () Bool)

(assert (=> d!102455 m!724693))

(assert (=> d!102455 m!724547))

(declare-fun m!724695 () Bool)

(assert (=> b!782430 m!724695))

(assert (=> b!782431 m!724539))

(declare-fun m!724697 () Bool)

(assert (=> b!782431 m!724697))

(assert (=> b!782269 d!102455))

(declare-fun b!782441 () Bool)

(declare-fun e!435040 () Bool)

(declare-fun call!35233 () Bool)

(assert (=> b!782441 (= e!435040 call!35233)))

(declare-fun d!102457 () Bool)

(declare-fun res!529518 () Bool)

(declare-fun e!435039 () Bool)

(assert (=> d!102457 (=> res!529518 e!435039)))

(assert (=> d!102457 (= res!529518 (bvsge j!159 (size!20850 a!3186)))))

(assert (=> d!102457 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!435039)))

(declare-fun bm!35230 () Bool)

(assert (=> bm!35230 (= call!35233 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!782442 () Bool)

(declare-fun e!435038 () Bool)

(assert (=> b!782442 (= e!435039 e!435038)))

(declare-fun c!86868 () Bool)

(assert (=> b!782442 (= c!86868 (validKeyInArray!0 (select (arr!20429 a!3186) j!159)))))

(declare-fun b!782443 () Bool)

(assert (=> b!782443 (= e!435038 e!435040)))

(declare-fun lt!348596 () (_ BitVec 64))

(assert (=> b!782443 (= lt!348596 (select (arr!20429 a!3186) j!159))))

(declare-fun lt!348594 () Unit!26972)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42678 (_ BitVec 64) (_ BitVec 32)) Unit!26972)

(assert (=> b!782443 (= lt!348594 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!348596 j!159))))

(assert (=> b!782443 (arrayContainsKey!0 a!3186 lt!348596 #b00000000000000000000000000000000)))

(declare-fun lt!348595 () Unit!26972)

(assert (=> b!782443 (= lt!348595 lt!348594)))

(declare-fun res!529517 () Bool)

(assert (=> b!782443 (= res!529517 (= (seekEntryOrOpen!0 (select (arr!20429 a!3186) j!159) a!3186 mask!3328) (Found!8026 j!159)))))

(assert (=> b!782443 (=> (not res!529517) (not e!435040))))

(declare-fun b!782444 () Bool)

(assert (=> b!782444 (= e!435038 call!35233)))

(assert (= (and d!102457 (not res!529518)) b!782442))

(assert (= (and b!782442 c!86868) b!782443))

(assert (= (and b!782442 (not c!86868)) b!782444))

(assert (= (and b!782443 res!529517) b!782441))

(assert (= (or b!782441 b!782444) bm!35230))

(declare-fun m!724699 () Bool)

(assert (=> bm!35230 m!724699))

(assert (=> b!782442 m!724539))

(assert (=> b!782442 m!724539))

(assert (=> b!782442 m!724541))

(assert (=> b!782443 m!724539))

(declare-fun m!724701 () Bool)

(assert (=> b!782443 m!724701))

(declare-fun m!724703 () Bool)

(assert (=> b!782443 m!724703))

(assert (=> b!782443 m!724539))

(assert (=> b!782443 m!724555))

(assert (=> b!782269 d!102457))

(declare-fun d!102459 () Bool)

(assert (=> d!102459 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348599 () Unit!26972)

(declare-fun choose!38 (array!42678 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26972)

(assert (=> d!102459 (= lt!348599 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102459 (validMask!0 mask!3328)))

(assert (=> d!102459 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!348599)))

(declare-fun bs!21723 () Bool)

(assert (= bs!21723 d!102459))

(assert (=> bs!21723 m!724557))

(declare-fun m!724705 () Bool)

(assert (=> bs!21723 m!724705))

(assert (=> bs!21723 m!724547))

(assert (=> b!782269 d!102459))

(declare-fun b!782445 () Bool)

(declare-fun c!86871 () Bool)

(declare-fun lt!348602 () (_ BitVec 64))

(assert (=> b!782445 (= c!86871 (= lt!348602 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435042 () SeekEntryResult!8026)

(declare-fun e!435041 () SeekEntryResult!8026)

(assert (=> b!782445 (= e!435042 e!435041)))

(declare-fun b!782446 () Bool)

(declare-fun e!435043 () SeekEntryResult!8026)

(assert (=> b!782446 (= e!435043 Undefined!8026)))

(declare-fun d!102461 () Bool)

(declare-fun lt!348601 () SeekEntryResult!8026)

(assert (=> d!102461 (and (or ((_ is Undefined!8026) lt!348601) (not ((_ is Found!8026) lt!348601)) (and (bvsge (index!34473 lt!348601) #b00000000000000000000000000000000) (bvslt (index!34473 lt!348601) (size!20850 lt!348509)))) (or ((_ is Undefined!8026) lt!348601) ((_ is Found!8026) lt!348601) (not ((_ is MissingZero!8026) lt!348601)) (and (bvsge (index!34472 lt!348601) #b00000000000000000000000000000000) (bvslt (index!34472 lt!348601) (size!20850 lt!348509)))) (or ((_ is Undefined!8026) lt!348601) ((_ is Found!8026) lt!348601) ((_ is MissingZero!8026) lt!348601) (not ((_ is MissingVacant!8026) lt!348601)) (and (bvsge (index!34475 lt!348601) #b00000000000000000000000000000000) (bvslt (index!34475 lt!348601) (size!20850 lt!348509)))) (or ((_ is Undefined!8026) lt!348601) (ite ((_ is Found!8026) lt!348601) (= (select (arr!20429 lt!348509) (index!34473 lt!348601)) lt!348511) (ite ((_ is MissingZero!8026) lt!348601) (= (select (arr!20429 lt!348509) (index!34472 lt!348601)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8026) lt!348601) (= (select (arr!20429 lt!348509) (index!34475 lt!348601)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102461 (= lt!348601 e!435043)))

(declare-fun c!86870 () Bool)

(declare-fun lt!348600 () SeekEntryResult!8026)

(assert (=> d!102461 (= c!86870 (and ((_ is Intermediate!8026) lt!348600) (undefined!8838 lt!348600)))))

(assert (=> d!102461 (= lt!348600 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348511 mask!3328) lt!348511 lt!348509 mask!3328))))

(assert (=> d!102461 (validMask!0 mask!3328)))

(assert (=> d!102461 (= (seekEntryOrOpen!0 lt!348511 lt!348509 mask!3328) lt!348601)))

(declare-fun b!782447 () Bool)

(assert (=> b!782447 (= e!435041 (MissingZero!8026 (index!34474 lt!348600)))))

(declare-fun b!782448 () Bool)

(assert (=> b!782448 (= e!435043 e!435042)))

(assert (=> b!782448 (= lt!348602 (select (arr!20429 lt!348509) (index!34474 lt!348600)))))

(declare-fun c!86869 () Bool)

(assert (=> b!782448 (= c!86869 (= lt!348602 lt!348511))))

(declare-fun b!782449 () Bool)

(assert (=> b!782449 (= e!435041 (seekKeyOrZeroReturnVacant!0 (x!65432 lt!348600) (index!34474 lt!348600) (index!34474 lt!348600) lt!348511 lt!348509 mask!3328))))

(declare-fun b!782450 () Bool)

(assert (=> b!782450 (= e!435042 (Found!8026 (index!34474 lt!348600)))))

(assert (= (and d!102461 c!86870) b!782446))

(assert (= (and d!102461 (not c!86870)) b!782448))

(assert (= (and b!782448 c!86869) b!782450))

(assert (= (and b!782448 (not c!86869)) b!782445))

(assert (= (and b!782445 c!86871) b!782447))

(assert (= (and b!782445 (not c!86871)) b!782449))

(declare-fun m!724707 () Bool)

(assert (=> d!102461 m!724707))

(assert (=> d!102461 m!724577))

(assert (=> d!102461 m!724579))

(assert (=> d!102461 m!724577))

(declare-fun m!724709 () Bool)

(assert (=> d!102461 m!724709))

(declare-fun m!724711 () Bool)

(assert (=> d!102461 m!724711))

(assert (=> d!102461 m!724547))

(declare-fun m!724713 () Bool)

(assert (=> b!782448 m!724713))

(declare-fun m!724715 () Bool)

(assert (=> b!782449 m!724715))

(assert (=> b!782279 d!102461))

(declare-fun b!782463 () Bool)

(declare-fun c!86878 () Bool)

(declare-fun lt!348608 () (_ BitVec 64))

(assert (=> b!782463 (= c!86878 (= lt!348608 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435050 () SeekEntryResult!8026)

(declare-fun e!435051 () SeekEntryResult!8026)

(assert (=> b!782463 (= e!435050 e!435051)))

(declare-fun lt!348607 () SeekEntryResult!8026)

(declare-fun d!102463 () Bool)

(assert (=> d!102463 (and (or ((_ is Undefined!8026) lt!348607) (not ((_ is Found!8026) lt!348607)) (and (bvsge (index!34473 lt!348607) #b00000000000000000000000000000000) (bvslt (index!34473 lt!348607) (size!20850 lt!348509)))) (or ((_ is Undefined!8026) lt!348607) ((_ is Found!8026) lt!348607) (not ((_ is MissingVacant!8026) lt!348607)) (not (= (index!34475 lt!348607) index!1321)) (and (bvsge (index!34475 lt!348607) #b00000000000000000000000000000000) (bvslt (index!34475 lt!348607) (size!20850 lt!348509)))) (or ((_ is Undefined!8026) lt!348607) (ite ((_ is Found!8026) lt!348607) (= (select (arr!20429 lt!348509) (index!34473 lt!348607)) lt!348511) (and ((_ is MissingVacant!8026) lt!348607) (= (index!34475 lt!348607) index!1321) (= (select (arr!20429 lt!348509) (index!34475 lt!348607)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!435052 () SeekEntryResult!8026)

(assert (=> d!102463 (= lt!348607 e!435052)))

(declare-fun c!86880 () Bool)

(assert (=> d!102463 (= c!86880 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102463 (= lt!348608 (select (arr!20429 lt!348509) index!1321))))

(assert (=> d!102463 (validMask!0 mask!3328)))

(assert (=> d!102463 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!348511 lt!348509 mask!3328) lt!348607)))

(declare-fun b!782464 () Bool)

(assert (=> b!782464 (= e!435050 (Found!8026 index!1321))))

(declare-fun b!782465 () Bool)

(assert (=> b!782465 (= e!435052 Undefined!8026)))

(declare-fun b!782466 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782466 (= e!435051 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) index!1321 lt!348511 lt!348509 mask!3328))))

(declare-fun b!782467 () Bool)

(assert (=> b!782467 (= e!435051 (MissingVacant!8026 index!1321))))

(declare-fun b!782468 () Bool)

(assert (=> b!782468 (= e!435052 e!435050)))

(declare-fun c!86879 () Bool)

(assert (=> b!782468 (= c!86879 (= lt!348608 lt!348511))))

(assert (= (and d!102463 c!86880) b!782465))

(assert (= (and d!102463 (not c!86880)) b!782468))

(assert (= (and b!782468 c!86879) b!782464))

(assert (= (and b!782468 (not c!86879)) b!782463))

(assert (= (and b!782463 c!86878) b!782467))

(assert (= (and b!782463 (not c!86878)) b!782466))

(declare-fun m!724717 () Bool)

(assert (=> d!102463 m!724717))

(declare-fun m!724719 () Bool)

(assert (=> d!102463 m!724719))

(declare-fun m!724721 () Bool)

(assert (=> d!102463 m!724721))

(assert (=> d!102463 m!724547))

(declare-fun m!724723 () Bool)

(assert (=> b!782466 m!724723))

(assert (=> b!782466 m!724723))

(declare-fun m!724725 () Bool)

(assert (=> b!782466 m!724725))

(assert (=> b!782279 d!102463))

(declare-fun b!782499 () Bool)

(declare-fun e!435073 () Bool)

(declare-fun lt!348619 () SeekEntryResult!8026)

(assert (=> b!782499 (= e!435073 (bvsge (x!65432 lt!348619) #b01111111111111111111111111111110))))

(declare-fun b!782500 () Bool)

(assert (=> b!782500 (and (bvsge (index!34474 lt!348619) #b00000000000000000000000000000000) (bvslt (index!34474 lt!348619) (size!20850 a!3186)))))

(declare-fun e!435072 () Bool)

(assert (=> b!782500 (= e!435072 (= (select (arr!20429 a!3186) (index!34474 lt!348619)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782501 () Bool)

(assert (=> b!782501 (and (bvsge (index!34474 lt!348619) #b00000000000000000000000000000000) (bvslt (index!34474 lt!348619) (size!20850 a!3186)))))

(declare-fun res!529527 () Bool)

(assert (=> b!782501 (= res!529527 (= (select (arr!20429 a!3186) (index!34474 lt!348619)) (select (arr!20429 a!3186) j!159)))))

(assert (=> b!782501 (=> res!529527 e!435072)))

(declare-fun e!435071 () Bool)

(assert (=> b!782501 (= e!435071 e!435072)))

(declare-fun b!782502 () Bool)

(declare-fun e!435070 () SeekEntryResult!8026)

(declare-fun e!435069 () SeekEntryResult!8026)

(assert (=> b!782502 (= e!435070 e!435069)))

(declare-fun lt!348620 () (_ BitVec 64))

(declare-fun c!86893 () Bool)

(assert (=> b!782502 (= c!86893 (or (= lt!348620 (select (arr!20429 a!3186) j!159)) (= (bvadd lt!348620 lt!348620) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782503 () Bool)

(assert (=> b!782503 (and (bvsge (index!34474 lt!348619) #b00000000000000000000000000000000) (bvslt (index!34474 lt!348619) (size!20850 a!3186)))))

(declare-fun res!529525 () Bool)

(assert (=> b!782503 (= res!529525 (= (select (arr!20429 a!3186) (index!34474 lt!348619)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!782503 (=> res!529525 e!435072)))

(declare-fun b!782505 () Bool)

(assert (=> b!782505 (= e!435069 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20429 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102465 () Bool)

(assert (=> d!102465 e!435073))

(declare-fun c!86894 () Bool)

(assert (=> d!102465 (= c!86894 (and ((_ is Intermediate!8026) lt!348619) (undefined!8838 lt!348619)))))

(assert (=> d!102465 (= lt!348619 e!435070)))

(declare-fun c!86895 () Bool)

(assert (=> d!102465 (= c!86895 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102465 (= lt!348620 (select (arr!20429 a!3186) index!1321))))

(assert (=> d!102465 (validMask!0 mask!3328)))

(assert (=> d!102465 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20429 a!3186) j!159) a!3186 mask!3328) lt!348619)))

(declare-fun b!782504 () Bool)

(assert (=> b!782504 (= e!435069 (Intermediate!8026 false index!1321 x!1131))))

(declare-fun b!782506 () Bool)

(assert (=> b!782506 (= e!435073 e!435071)))

(declare-fun res!529526 () Bool)

(assert (=> b!782506 (= res!529526 (and ((_ is Intermediate!8026) lt!348619) (not (undefined!8838 lt!348619)) (bvslt (x!65432 lt!348619) #b01111111111111111111111111111110) (bvsge (x!65432 lt!348619) #b00000000000000000000000000000000) (bvsge (x!65432 lt!348619) x!1131)))))

(assert (=> b!782506 (=> (not res!529526) (not e!435071))))

(declare-fun b!782507 () Bool)

(assert (=> b!782507 (= e!435070 (Intermediate!8026 true index!1321 x!1131))))

(assert (= (and d!102465 c!86895) b!782507))

(assert (= (and d!102465 (not c!86895)) b!782502))

(assert (= (and b!782502 c!86893) b!782504))

(assert (= (and b!782502 (not c!86893)) b!782505))

(assert (= (and d!102465 c!86894) b!782499))

(assert (= (and d!102465 (not c!86894)) b!782506))

(assert (= (and b!782506 res!529526) b!782501))

(assert (= (and b!782501 (not res!529527)) b!782503))

(assert (= (and b!782503 (not res!529525)) b!782500))

(declare-fun m!724727 () Bool)

(assert (=> d!102465 m!724727))

(assert (=> d!102465 m!724547))

(declare-fun m!724729 () Bool)

(assert (=> b!782501 m!724729))

(assert (=> b!782503 m!724729))

(assert (=> b!782505 m!724723))

(assert (=> b!782505 m!724723))

(assert (=> b!782505 m!724539))

(declare-fun m!724731 () Bool)

(assert (=> b!782505 m!724731))

(assert (=> b!782500 m!724729))

(assert (=> b!782268 d!102465))

(declare-fun b!782514 () Bool)

(declare-fun c!86899 () Bool)

(declare-fun lt!348625 () (_ BitVec 64))

(assert (=> b!782514 (= c!86899 (= lt!348625 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435077 () SeekEntryResult!8026)

(declare-fun e!435078 () SeekEntryResult!8026)

(assert (=> b!782514 (= e!435077 e!435078)))

(declare-fun lt!348624 () SeekEntryResult!8026)

(declare-fun d!102469 () Bool)

(assert (=> d!102469 (and (or ((_ is Undefined!8026) lt!348624) (not ((_ is Found!8026) lt!348624)) (and (bvsge (index!34473 lt!348624) #b00000000000000000000000000000000) (bvslt (index!34473 lt!348624) (size!20850 a!3186)))) (or ((_ is Undefined!8026) lt!348624) ((_ is Found!8026) lt!348624) (not ((_ is MissingVacant!8026) lt!348624)) (not (= (index!34475 lt!348624) resIntermediateIndex!5)) (and (bvsge (index!34475 lt!348624) #b00000000000000000000000000000000) (bvslt (index!34475 lt!348624) (size!20850 a!3186)))) (or ((_ is Undefined!8026) lt!348624) (ite ((_ is Found!8026) lt!348624) (= (select (arr!20429 a!3186) (index!34473 lt!348624)) (select (arr!20429 a!3186) j!159)) (and ((_ is MissingVacant!8026) lt!348624) (= (index!34475 lt!348624) resIntermediateIndex!5) (= (select (arr!20429 a!3186) (index!34475 lt!348624)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!435079 () SeekEntryResult!8026)

(assert (=> d!102469 (= lt!348624 e!435079)))

(declare-fun c!86901 () Bool)

(assert (=> d!102469 (= c!86901 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102469 (= lt!348625 (select (arr!20429 a!3186) index!1321))))

(assert (=> d!102469 (validMask!0 mask!3328)))

(assert (=> d!102469 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20429 a!3186) j!159) a!3186 mask!3328) lt!348624)))

(declare-fun b!782515 () Bool)

(assert (=> b!782515 (= e!435077 (Found!8026 index!1321))))

(declare-fun b!782516 () Bool)

(assert (=> b!782516 (= e!435079 Undefined!8026)))

(declare-fun b!782517 () Bool)

(assert (=> b!782517 (= e!435078 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20429 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!782518 () Bool)

(assert (=> b!782518 (= e!435078 (MissingVacant!8026 resIntermediateIndex!5))))

(declare-fun b!782519 () Bool)

(assert (=> b!782519 (= e!435079 e!435077)))

(declare-fun c!86900 () Bool)

(assert (=> b!782519 (= c!86900 (= lt!348625 (select (arr!20429 a!3186) j!159)))))

(assert (= (and d!102469 c!86901) b!782516))

(assert (= (and d!102469 (not c!86901)) b!782519))

(assert (= (and b!782519 c!86900) b!782515))

(assert (= (and b!782519 (not c!86900)) b!782514))

(assert (= (and b!782514 c!86899) b!782518))

(assert (= (and b!782514 (not c!86899)) b!782517))

(declare-fun m!724741 () Bool)

(assert (=> d!102469 m!724741))

(declare-fun m!724743 () Bool)

(assert (=> d!102469 m!724743))

(assert (=> d!102469 m!724727))

(assert (=> d!102469 m!724547))

(assert (=> b!782517 m!724723))

(assert (=> b!782517 m!724723))

(assert (=> b!782517 m!724539))

(declare-fun m!724747 () Bool)

(assert (=> b!782517 m!724747))

(assert (=> b!782270 d!102469))

(declare-fun d!102473 () Bool)

(assert (=> d!102473 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!782280 d!102473))

(declare-fun b!782520 () Bool)

(declare-fun e!435084 () Bool)

(declare-fun lt!348626 () SeekEntryResult!8026)

(assert (=> b!782520 (= e!435084 (bvsge (x!65432 lt!348626) #b01111111111111111111111111111110))))

(declare-fun b!782521 () Bool)

(assert (=> b!782521 (and (bvsge (index!34474 lt!348626) #b00000000000000000000000000000000) (bvslt (index!34474 lt!348626) (size!20850 a!3186)))))

(declare-fun e!435083 () Bool)

(assert (=> b!782521 (= e!435083 (= (select (arr!20429 a!3186) (index!34474 lt!348626)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782522 () Bool)

(assert (=> b!782522 (and (bvsge (index!34474 lt!348626) #b00000000000000000000000000000000) (bvslt (index!34474 lt!348626) (size!20850 a!3186)))))

(declare-fun res!529530 () Bool)

(assert (=> b!782522 (= res!529530 (= (select (arr!20429 a!3186) (index!34474 lt!348626)) (select (arr!20429 a!3186) j!159)))))

(assert (=> b!782522 (=> res!529530 e!435083)))

(declare-fun e!435082 () Bool)

(assert (=> b!782522 (= e!435082 e!435083)))

(declare-fun b!782523 () Bool)

(declare-fun e!435081 () SeekEntryResult!8026)

(declare-fun e!435080 () SeekEntryResult!8026)

(assert (=> b!782523 (= e!435081 e!435080)))

(declare-fun lt!348627 () (_ BitVec 64))

(declare-fun c!86902 () Bool)

(assert (=> b!782523 (= c!86902 (or (= lt!348627 (select (arr!20429 a!3186) j!159)) (= (bvadd lt!348627 lt!348627) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782524 () Bool)

(assert (=> b!782524 (and (bvsge (index!34474 lt!348626) #b00000000000000000000000000000000) (bvslt (index!34474 lt!348626) (size!20850 a!3186)))))

(declare-fun res!529528 () Bool)

(assert (=> b!782524 (= res!529528 (= (select (arr!20429 a!3186) (index!34474 lt!348626)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!782524 (=> res!529528 e!435083)))

(declare-fun b!782526 () Bool)

(assert (=> b!782526 (= e!435080 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20429 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20429 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!102475 () Bool)

(assert (=> d!102475 e!435084))

(declare-fun c!86903 () Bool)

(assert (=> d!102475 (= c!86903 (and ((_ is Intermediate!8026) lt!348626) (undefined!8838 lt!348626)))))

(assert (=> d!102475 (= lt!348626 e!435081)))

(declare-fun c!86904 () Bool)

(assert (=> d!102475 (= c!86904 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102475 (= lt!348627 (select (arr!20429 a!3186) (toIndex!0 (select (arr!20429 a!3186) j!159) mask!3328)))))

(assert (=> d!102475 (validMask!0 mask!3328)))

(assert (=> d!102475 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20429 a!3186) j!159) mask!3328) (select (arr!20429 a!3186) j!159) a!3186 mask!3328) lt!348626)))

(declare-fun b!782525 () Bool)

(assert (=> b!782525 (= e!435080 (Intermediate!8026 false (toIndex!0 (select (arr!20429 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!782527 () Bool)

(assert (=> b!782527 (= e!435084 e!435082)))

(declare-fun res!529529 () Bool)

(assert (=> b!782527 (= res!529529 (and ((_ is Intermediate!8026) lt!348626) (not (undefined!8838 lt!348626)) (bvslt (x!65432 lt!348626) #b01111111111111111111111111111110) (bvsge (x!65432 lt!348626) #b00000000000000000000000000000000) (bvsge (x!65432 lt!348626) #b00000000000000000000000000000000)))))

(assert (=> b!782527 (=> (not res!529529) (not e!435082))))

(declare-fun b!782528 () Bool)

(assert (=> b!782528 (= e!435081 (Intermediate!8026 true (toIndex!0 (select (arr!20429 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!102475 c!86904) b!782528))

(assert (= (and d!102475 (not c!86904)) b!782523))

(assert (= (and b!782523 c!86902) b!782525))

(assert (= (and b!782523 (not c!86902)) b!782526))

(assert (= (and d!102475 c!86903) b!782520))

(assert (= (and d!102475 (not c!86903)) b!782527))

(assert (= (and b!782527 res!529529) b!782522))

(assert (= (and b!782522 (not res!529530)) b!782524))

(assert (= (and b!782524 (not res!529528)) b!782521))

(assert (=> d!102475 m!724543))

(declare-fun m!724749 () Bool)

(assert (=> d!102475 m!724749))

(assert (=> d!102475 m!724547))

(declare-fun m!724751 () Bool)

(assert (=> b!782522 m!724751))

(assert (=> b!782524 m!724751))

(assert (=> b!782526 m!724543))

(declare-fun m!724753 () Bool)

(assert (=> b!782526 m!724753))

(assert (=> b!782526 m!724753))

(assert (=> b!782526 m!724539))

(declare-fun m!724755 () Bool)

(assert (=> b!782526 m!724755))

(assert (=> b!782521 m!724751))

(assert (=> b!782282 d!102475))

(declare-fun d!102477 () Bool)

(declare-fun lt!348633 () (_ BitVec 32))

(declare-fun lt!348632 () (_ BitVec 32))

(assert (=> d!102477 (= lt!348633 (bvmul (bvxor lt!348632 (bvlshr lt!348632 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102477 (= lt!348632 ((_ extract 31 0) (bvand (bvxor (select (arr!20429 a!3186) j!159) (bvlshr (select (arr!20429 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102477 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!529531 (let ((h!15589 ((_ extract 31 0) (bvand (bvxor (select (arr!20429 a!3186) j!159) (bvlshr (select (arr!20429 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65437 (bvmul (bvxor h!15589 (bvlshr h!15589 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65437 (bvlshr x!65437 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!529531 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!529531 #b00000000000000000000000000000000))))))

(assert (=> d!102477 (= (toIndex!0 (select (arr!20429 a!3186) j!159) mask!3328) (bvand (bvxor lt!348633 (bvlshr lt!348633 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!782282 d!102477))

(declare-fun d!102479 () Bool)

(assert (=> d!102479 (= (validKeyInArray!0 (select (arr!20429 a!3186) j!159)) (and (not (= (select (arr!20429 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20429 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!782273 d!102479))

(declare-fun b!782529 () Bool)

(declare-fun e!435089 () Bool)

(declare-fun lt!348634 () SeekEntryResult!8026)

(assert (=> b!782529 (= e!435089 (bvsge (x!65432 lt!348634) #b01111111111111111111111111111110))))

(declare-fun b!782530 () Bool)

(assert (=> b!782530 (and (bvsge (index!34474 lt!348634) #b00000000000000000000000000000000) (bvslt (index!34474 lt!348634) (size!20850 lt!348509)))))

(declare-fun e!435088 () Bool)

(assert (=> b!782530 (= e!435088 (= (select (arr!20429 lt!348509) (index!34474 lt!348634)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782531 () Bool)

(assert (=> b!782531 (and (bvsge (index!34474 lt!348634) #b00000000000000000000000000000000) (bvslt (index!34474 lt!348634) (size!20850 lt!348509)))))

(declare-fun res!529534 () Bool)

(assert (=> b!782531 (= res!529534 (= (select (arr!20429 lt!348509) (index!34474 lt!348634)) lt!348511))))

(assert (=> b!782531 (=> res!529534 e!435088)))

(declare-fun e!435087 () Bool)

(assert (=> b!782531 (= e!435087 e!435088)))

(declare-fun b!782532 () Bool)

(declare-fun e!435086 () SeekEntryResult!8026)

(declare-fun e!435085 () SeekEntryResult!8026)

(assert (=> b!782532 (= e!435086 e!435085)))

(declare-fun c!86905 () Bool)

(declare-fun lt!348635 () (_ BitVec 64))

(assert (=> b!782532 (= c!86905 (or (= lt!348635 lt!348511) (= (bvadd lt!348635 lt!348635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782533 () Bool)

(assert (=> b!782533 (and (bvsge (index!34474 lt!348634) #b00000000000000000000000000000000) (bvslt (index!34474 lt!348634) (size!20850 lt!348509)))))

(declare-fun res!529532 () Bool)

(assert (=> b!782533 (= res!529532 (= (select (arr!20429 lt!348509) (index!34474 lt!348634)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!782533 (=> res!529532 e!435088)))

(declare-fun b!782535 () Bool)

(assert (=> b!782535 (= e!435085 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!348511 lt!348509 mask!3328))))

(declare-fun d!102481 () Bool)

(assert (=> d!102481 e!435089))

(declare-fun c!86906 () Bool)

(assert (=> d!102481 (= c!86906 (and ((_ is Intermediate!8026) lt!348634) (undefined!8838 lt!348634)))))

(assert (=> d!102481 (= lt!348634 e!435086)))

(declare-fun c!86907 () Bool)

(assert (=> d!102481 (= c!86907 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102481 (= lt!348635 (select (arr!20429 lt!348509) index!1321))))

(assert (=> d!102481 (validMask!0 mask!3328)))

(assert (=> d!102481 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348511 lt!348509 mask!3328) lt!348634)))

(declare-fun b!782534 () Bool)

(assert (=> b!782534 (= e!435085 (Intermediate!8026 false index!1321 x!1131))))

(declare-fun b!782536 () Bool)

(assert (=> b!782536 (= e!435089 e!435087)))

(declare-fun res!529533 () Bool)

(assert (=> b!782536 (= res!529533 (and ((_ is Intermediate!8026) lt!348634) (not (undefined!8838 lt!348634)) (bvslt (x!65432 lt!348634) #b01111111111111111111111111111110) (bvsge (x!65432 lt!348634) #b00000000000000000000000000000000) (bvsge (x!65432 lt!348634) x!1131)))))

(assert (=> b!782536 (=> (not res!529533) (not e!435087))))

(declare-fun b!782537 () Bool)

(assert (=> b!782537 (= e!435086 (Intermediate!8026 true index!1321 x!1131))))

(assert (= (and d!102481 c!86907) b!782537))

(assert (= (and d!102481 (not c!86907)) b!782532))

(assert (= (and b!782532 c!86905) b!782534))

(assert (= (and b!782532 (not c!86905)) b!782535))

(assert (= (and d!102481 c!86906) b!782529))

(assert (= (and d!102481 (not c!86906)) b!782536))

(assert (= (and b!782536 res!529533) b!782531))

(assert (= (and b!782531 (not res!529534)) b!782533))

(assert (= (and b!782533 (not res!529532)) b!782530))

(assert (=> d!102481 m!724721))

(assert (=> d!102481 m!724547))

(declare-fun m!724757 () Bool)

(assert (=> b!782531 m!724757))

(assert (=> b!782533 m!724757))

(assert (=> b!782535 m!724723))

(assert (=> b!782535 m!724723))

(declare-fun m!724759 () Bool)

(assert (=> b!782535 m!724759))

(assert (=> b!782530 m!724757))

(assert (=> b!782283 d!102481))

(declare-fun b!782538 () Bool)

(declare-fun e!435094 () Bool)

(declare-fun lt!348636 () SeekEntryResult!8026)

(assert (=> b!782538 (= e!435094 (bvsge (x!65432 lt!348636) #b01111111111111111111111111111110))))

(declare-fun b!782539 () Bool)

(assert (=> b!782539 (and (bvsge (index!34474 lt!348636) #b00000000000000000000000000000000) (bvslt (index!34474 lt!348636) (size!20850 lt!348509)))))

(declare-fun e!435093 () Bool)

(assert (=> b!782539 (= e!435093 (= (select (arr!20429 lt!348509) (index!34474 lt!348636)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782540 () Bool)

(assert (=> b!782540 (and (bvsge (index!34474 lt!348636) #b00000000000000000000000000000000) (bvslt (index!34474 lt!348636) (size!20850 lt!348509)))))

(declare-fun res!529537 () Bool)

(assert (=> b!782540 (= res!529537 (= (select (arr!20429 lt!348509) (index!34474 lt!348636)) lt!348511))))

(assert (=> b!782540 (=> res!529537 e!435093)))

(declare-fun e!435092 () Bool)

(assert (=> b!782540 (= e!435092 e!435093)))

(declare-fun b!782541 () Bool)

(declare-fun e!435091 () SeekEntryResult!8026)

(declare-fun e!435090 () SeekEntryResult!8026)

(assert (=> b!782541 (= e!435091 e!435090)))

(declare-fun c!86908 () Bool)

(declare-fun lt!348637 () (_ BitVec 64))

(assert (=> b!782541 (= c!86908 (or (= lt!348637 lt!348511) (= (bvadd lt!348637 lt!348637) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782542 () Bool)

(assert (=> b!782542 (and (bvsge (index!34474 lt!348636) #b00000000000000000000000000000000) (bvslt (index!34474 lt!348636) (size!20850 lt!348509)))))

(declare-fun res!529535 () Bool)

(assert (=> b!782542 (= res!529535 (= (select (arr!20429 lt!348509) (index!34474 lt!348636)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!782542 (=> res!529535 e!435093)))

(declare-fun b!782544 () Bool)

(assert (=> b!782544 (= e!435090 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!348511 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!348511 lt!348509 mask!3328))))

(declare-fun d!102485 () Bool)

(assert (=> d!102485 e!435094))

(declare-fun c!86909 () Bool)

(assert (=> d!102485 (= c!86909 (and ((_ is Intermediate!8026) lt!348636) (undefined!8838 lt!348636)))))

(assert (=> d!102485 (= lt!348636 e!435091)))

(declare-fun c!86910 () Bool)

(assert (=> d!102485 (= c!86910 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102485 (= lt!348637 (select (arr!20429 lt!348509) (toIndex!0 lt!348511 mask!3328)))))

(assert (=> d!102485 (validMask!0 mask!3328)))

(assert (=> d!102485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348511 mask!3328) lt!348511 lt!348509 mask!3328) lt!348636)))

(declare-fun b!782543 () Bool)

(assert (=> b!782543 (= e!435090 (Intermediate!8026 false (toIndex!0 lt!348511 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!782545 () Bool)

(assert (=> b!782545 (= e!435094 e!435092)))

(declare-fun res!529536 () Bool)

(assert (=> b!782545 (= res!529536 (and ((_ is Intermediate!8026) lt!348636) (not (undefined!8838 lt!348636)) (bvslt (x!65432 lt!348636) #b01111111111111111111111111111110) (bvsge (x!65432 lt!348636) #b00000000000000000000000000000000) (bvsge (x!65432 lt!348636) #b00000000000000000000000000000000)))))

(assert (=> b!782545 (=> (not res!529536) (not e!435092))))

(declare-fun b!782546 () Bool)

(assert (=> b!782546 (= e!435091 (Intermediate!8026 true (toIndex!0 lt!348511 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!102485 c!86910) b!782546))

(assert (= (and d!102485 (not c!86910)) b!782541))

(assert (= (and b!782541 c!86908) b!782543))

(assert (= (and b!782541 (not c!86908)) b!782544))

(assert (= (and d!102485 c!86909) b!782538))

(assert (= (and d!102485 (not c!86909)) b!782545))

(assert (= (and b!782545 res!529536) b!782540))

(assert (= (and b!782540 (not res!529537)) b!782542))

(assert (= (and b!782542 (not res!529535)) b!782539))

(assert (=> d!102485 m!724577))

(declare-fun m!724761 () Bool)

(assert (=> d!102485 m!724761))

(assert (=> d!102485 m!724547))

(declare-fun m!724763 () Bool)

(assert (=> b!782540 m!724763))

(assert (=> b!782542 m!724763))

(assert (=> b!782544 m!724577))

(declare-fun m!724765 () Bool)

(assert (=> b!782544 m!724765))

(assert (=> b!782544 m!724765))

(declare-fun m!724767 () Bool)

(assert (=> b!782544 m!724767))

(assert (=> b!782539 m!724763))

(assert (=> b!782283 d!102485))

(declare-fun d!102487 () Bool)

(declare-fun lt!348639 () (_ BitVec 32))

(declare-fun lt!348638 () (_ BitVec 32))

(assert (=> d!102487 (= lt!348639 (bvmul (bvxor lt!348638 (bvlshr lt!348638 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102487 (= lt!348638 ((_ extract 31 0) (bvand (bvxor lt!348511 (bvlshr lt!348511 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102487 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!529531 (let ((h!15589 ((_ extract 31 0) (bvand (bvxor lt!348511 (bvlshr lt!348511 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65437 (bvmul (bvxor h!15589 (bvlshr h!15589 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65437 (bvlshr x!65437 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!529531 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!529531 #b00000000000000000000000000000000))))))

(assert (=> d!102487 (= (toIndex!0 lt!348511 mask!3328) (bvand (bvxor lt!348639 (bvlshr lt!348639 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!782283 d!102487))

(declare-fun b!782547 () Bool)

(declare-fun c!86913 () Bool)

(declare-fun lt!348642 () (_ BitVec 64))

(assert (=> b!782547 (= c!86913 (= lt!348642 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435096 () SeekEntryResult!8026)

(declare-fun e!435095 () SeekEntryResult!8026)

(assert (=> b!782547 (= e!435096 e!435095)))

(declare-fun b!782548 () Bool)

(declare-fun e!435097 () SeekEntryResult!8026)

(assert (=> b!782548 (= e!435097 Undefined!8026)))

(declare-fun d!102489 () Bool)

(declare-fun lt!348641 () SeekEntryResult!8026)

(assert (=> d!102489 (and (or ((_ is Undefined!8026) lt!348641) (not ((_ is Found!8026) lt!348641)) (and (bvsge (index!34473 lt!348641) #b00000000000000000000000000000000) (bvslt (index!34473 lt!348641) (size!20850 a!3186)))) (or ((_ is Undefined!8026) lt!348641) ((_ is Found!8026) lt!348641) (not ((_ is MissingZero!8026) lt!348641)) (and (bvsge (index!34472 lt!348641) #b00000000000000000000000000000000) (bvslt (index!34472 lt!348641) (size!20850 a!3186)))) (or ((_ is Undefined!8026) lt!348641) ((_ is Found!8026) lt!348641) ((_ is MissingZero!8026) lt!348641) (not ((_ is MissingVacant!8026) lt!348641)) (and (bvsge (index!34475 lt!348641) #b00000000000000000000000000000000) (bvslt (index!34475 lt!348641) (size!20850 a!3186)))) (or ((_ is Undefined!8026) lt!348641) (ite ((_ is Found!8026) lt!348641) (= (select (arr!20429 a!3186) (index!34473 lt!348641)) k0!2102) (ite ((_ is MissingZero!8026) lt!348641) (= (select (arr!20429 a!3186) (index!34472 lt!348641)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8026) lt!348641) (= (select (arr!20429 a!3186) (index!34475 lt!348641)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!102489 (= lt!348641 e!435097)))

(declare-fun c!86912 () Bool)

(declare-fun lt!348640 () SeekEntryResult!8026)

(assert (=> d!102489 (= c!86912 (and ((_ is Intermediate!8026) lt!348640) (undefined!8838 lt!348640)))))

(assert (=> d!102489 (= lt!348640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!102489 (validMask!0 mask!3328)))

(assert (=> d!102489 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!348641)))

(declare-fun b!782549 () Bool)

(assert (=> b!782549 (= e!435095 (MissingZero!8026 (index!34474 lt!348640)))))

(declare-fun b!782550 () Bool)

(assert (=> b!782550 (= e!435097 e!435096)))

(assert (=> b!782550 (= lt!348642 (select (arr!20429 a!3186) (index!34474 lt!348640)))))

(declare-fun c!86911 () Bool)

(assert (=> b!782550 (= c!86911 (= lt!348642 k0!2102))))

(declare-fun b!782551 () Bool)

(assert (=> b!782551 (= e!435095 (seekKeyOrZeroReturnVacant!0 (x!65432 lt!348640) (index!34474 lt!348640) (index!34474 lt!348640) k0!2102 a!3186 mask!3328))))

(declare-fun b!782552 () Bool)

(assert (=> b!782552 (= e!435096 (Found!8026 (index!34474 lt!348640)))))

(assert (= (and d!102489 c!86912) b!782548))

(assert (= (and d!102489 (not c!86912)) b!782550))

(assert (= (and b!782550 c!86911) b!782552))

(assert (= (and b!782550 (not c!86911)) b!782547))

(assert (= (and b!782547 c!86913) b!782549))

(assert (= (and b!782547 (not c!86913)) b!782551))

(declare-fun m!724769 () Bool)

(assert (=> d!102489 m!724769))

(declare-fun m!724771 () Bool)

(assert (=> d!102489 m!724771))

(declare-fun m!724773 () Bool)

(assert (=> d!102489 m!724773))

(assert (=> d!102489 m!724771))

(declare-fun m!724775 () Bool)

(assert (=> d!102489 m!724775))

(declare-fun m!724777 () Bool)

(assert (=> d!102489 m!724777))

(assert (=> d!102489 m!724547))

(declare-fun m!724779 () Bool)

(assert (=> b!782550 m!724779))

(declare-fun m!724781 () Bool)

(assert (=> b!782551 m!724781))

(assert (=> b!782272 d!102489))

(declare-fun b!782553 () Bool)

(declare-fun e!435100 () Bool)

(declare-fun call!35234 () Bool)

(assert (=> b!782553 (= e!435100 call!35234)))

(declare-fun d!102491 () Bool)

(declare-fun res!529539 () Bool)

(declare-fun e!435099 () Bool)

(assert (=> d!102491 (=> res!529539 e!435099)))

(assert (=> d!102491 (= res!529539 (bvsge #b00000000000000000000000000000000 (size!20850 a!3186)))))

(assert (=> d!102491 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!435099)))

(declare-fun bm!35231 () Bool)

(assert (=> bm!35231 (= call!35234 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!782554 () Bool)

(declare-fun e!435098 () Bool)

(assert (=> b!782554 (= e!435099 e!435098)))

(declare-fun c!86914 () Bool)

(assert (=> b!782554 (= c!86914 (validKeyInArray!0 (select (arr!20429 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!782555 () Bool)

(assert (=> b!782555 (= e!435098 e!435100)))

(declare-fun lt!348645 () (_ BitVec 64))

(assert (=> b!782555 (= lt!348645 (select (arr!20429 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!348643 () Unit!26972)

(assert (=> b!782555 (= lt!348643 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!348645 #b00000000000000000000000000000000))))

(assert (=> b!782555 (arrayContainsKey!0 a!3186 lt!348645 #b00000000000000000000000000000000)))

(declare-fun lt!348644 () Unit!26972)

(assert (=> b!782555 (= lt!348644 lt!348643)))

(declare-fun res!529538 () Bool)

(assert (=> b!782555 (= res!529538 (= (seekEntryOrOpen!0 (select (arr!20429 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!8026 #b00000000000000000000000000000000)))))

(assert (=> b!782555 (=> (not res!529538) (not e!435100))))

(declare-fun b!782556 () Bool)

(assert (=> b!782556 (= e!435098 call!35234)))

(assert (= (and d!102491 (not res!529539)) b!782554))

(assert (= (and b!782554 c!86914) b!782555))

(assert (= (and b!782554 (not c!86914)) b!782556))

(assert (= (and b!782555 res!529538) b!782553))

(assert (= (or b!782553 b!782556) bm!35231))

(declare-fun m!724783 () Bool)

(assert (=> bm!35231 m!724783))

(declare-fun m!724785 () Bool)

(assert (=> b!782554 m!724785))

(assert (=> b!782554 m!724785))

(declare-fun m!724787 () Bool)

(assert (=> b!782554 m!724787))

(assert (=> b!782555 m!724785))

(declare-fun m!724789 () Bool)

(assert (=> b!782555 m!724789))

(declare-fun m!724791 () Bool)

(assert (=> b!782555 m!724791))

(assert (=> b!782555 m!724785))

(declare-fun m!724793 () Bool)

(assert (=> b!782555 m!724793))

(assert (=> b!782274 d!102491))

(declare-fun b!782557 () Bool)

(declare-fun c!86915 () Bool)

(declare-fun lt!348647 () (_ BitVec 64))

(assert (=> b!782557 (= c!86915 (= lt!348647 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!435101 () SeekEntryResult!8026)

(declare-fun e!435102 () SeekEntryResult!8026)

(assert (=> b!782557 (= e!435101 e!435102)))

(declare-fun d!102493 () Bool)

(declare-fun lt!348646 () SeekEntryResult!8026)

(assert (=> d!102493 (and (or ((_ is Undefined!8026) lt!348646) (not ((_ is Found!8026) lt!348646)) (and (bvsge (index!34473 lt!348646) #b00000000000000000000000000000000) (bvslt (index!34473 lt!348646) (size!20850 a!3186)))) (or ((_ is Undefined!8026) lt!348646) ((_ is Found!8026) lt!348646) (not ((_ is MissingVacant!8026) lt!348646)) (not (= (index!34475 lt!348646) resIntermediateIndex!5)) (and (bvsge (index!34475 lt!348646) #b00000000000000000000000000000000) (bvslt (index!34475 lt!348646) (size!20850 a!3186)))) (or ((_ is Undefined!8026) lt!348646) (ite ((_ is Found!8026) lt!348646) (= (select (arr!20429 a!3186) (index!34473 lt!348646)) (select (arr!20429 a!3186) j!159)) (and ((_ is MissingVacant!8026) lt!348646) (= (index!34475 lt!348646) resIntermediateIndex!5) (= (select (arr!20429 a!3186) (index!34475 lt!348646)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!435103 () SeekEntryResult!8026)

(assert (=> d!102493 (= lt!348646 e!435103)))

(declare-fun c!86917 () Bool)

(assert (=> d!102493 (= c!86917 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102493 (= lt!348647 (select (arr!20429 a!3186) resIntermediateIndex!5))))

(assert (=> d!102493 (validMask!0 mask!3328)))

(assert (=> d!102493 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20429 a!3186) j!159) a!3186 mask!3328) lt!348646)))

(declare-fun b!782558 () Bool)

(assert (=> b!782558 (= e!435101 (Found!8026 resIntermediateIndex!5))))

(declare-fun b!782559 () Bool)

(assert (=> b!782559 (= e!435103 Undefined!8026)))

(declare-fun b!782560 () Bool)

(assert (=> b!782560 (= e!435102 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20429 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!782561 () Bool)

(assert (=> b!782561 (= e!435102 (MissingVacant!8026 resIntermediateIndex!5))))

(declare-fun b!782562 () Bool)

(assert (=> b!782562 (= e!435103 e!435101)))

(declare-fun c!86916 () Bool)

(assert (=> b!782562 (= c!86916 (= lt!348647 (select (arr!20429 a!3186) j!159)))))

(assert (= (and d!102493 c!86917) b!782559))

(assert (= (and d!102493 (not c!86917)) b!782562))

(assert (= (and b!782562 c!86916) b!782558))

(assert (= (and b!782562 (not c!86916)) b!782557))

(assert (= (and b!782557 c!86915) b!782561))

(assert (= (and b!782557 (not c!86915)) b!782560))

(declare-fun m!724795 () Bool)

(assert (=> d!102493 m!724795))

(declare-fun m!724797 () Bool)

(assert (=> d!102493 m!724797))

(assert (=> d!102493 m!724563))

(assert (=> d!102493 m!724547))

(declare-fun m!724799 () Bool)

(assert (=> b!782560 m!724799))

(assert (=> b!782560 m!724799))

(assert (=> b!782560 m!724539))

(declare-fun m!724801 () Bool)

(assert (=> b!782560 m!724801))

(assert (=> b!782284 d!102493))

(declare-fun d!102495 () Bool)

(declare-fun res!529544 () Bool)

(declare-fun e!435114 () Bool)

(assert (=> d!102495 (=> res!529544 e!435114)))

(assert (=> d!102495 (= res!529544 (= (select (arr!20429 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!102495 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!435114)))

(declare-fun b!782579 () Bool)

(declare-fun e!435115 () Bool)

(assert (=> b!782579 (= e!435114 e!435115)))

(declare-fun res!529545 () Bool)

(assert (=> b!782579 (=> (not res!529545) (not e!435115))))

(assert (=> b!782579 (= res!529545 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20850 a!3186)))))

(declare-fun b!782580 () Bool)

(assert (=> b!782580 (= e!435115 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!102495 (not res!529544)) b!782579))

(assert (= (and b!782579 res!529545) b!782580))

(assert (=> d!102495 m!724785))

(declare-fun m!724803 () Bool)

(assert (=> b!782580 m!724803))

(assert (=> b!782286 d!102495))

(declare-fun b!782604 () Bool)

(declare-fun e!435132 () Bool)

(declare-fun call!35237 () Bool)

(assert (=> b!782604 (= e!435132 call!35237)))

(declare-fun b!782605 () Bool)

(assert (=> b!782605 (= e!435132 call!35237)))

(declare-fun b!782606 () Bool)

(declare-fun e!435130 () Bool)

(assert (=> b!782606 (= e!435130 e!435132)))

(declare-fun c!86932 () Bool)

(assert (=> b!782606 (= c!86932 (validKeyInArray!0 (select (arr!20429 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!782607 () Bool)

(declare-fun e!435133 () Bool)

(declare-fun contains!4087 (List!14470 (_ BitVec 64)) Bool)

(assert (=> b!782607 (= e!435133 (contains!4087 Nil!14467 (select (arr!20429 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35234 () Bool)

(assert (=> bm!35234 (= call!35237 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!86932 (Cons!14466 (select (arr!20429 a!3186) #b00000000000000000000000000000000) Nil!14467) Nil!14467)))))

(declare-fun b!782603 () Bool)

(declare-fun e!435131 () Bool)

(assert (=> b!782603 (= e!435131 e!435130)))

(declare-fun res!529552 () Bool)

(assert (=> b!782603 (=> (not res!529552) (not e!435130))))

(assert (=> b!782603 (= res!529552 (not e!435133))))

(declare-fun res!529553 () Bool)

(assert (=> b!782603 (=> (not res!529553) (not e!435133))))

(assert (=> b!782603 (= res!529553 (validKeyInArray!0 (select (arr!20429 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!102497 () Bool)

(declare-fun res!529554 () Bool)

(assert (=> d!102497 (=> res!529554 e!435131)))

(assert (=> d!102497 (= res!529554 (bvsge #b00000000000000000000000000000000 (size!20850 a!3186)))))

(assert (=> d!102497 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14467) e!435131)))

(assert (= (and d!102497 (not res!529554)) b!782603))

(assert (= (and b!782603 res!529553) b!782607))

(assert (= (and b!782603 res!529552) b!782606))

(assert (= (and b!782606 c!86932) b!782605))

(assert (= (and b!782606 (not c!86932)) b!782604))

(assert (= (or b!782605 b!782604) bm!35234))

(assert (=> b!782606 m!724785))

(assert (=> b!782606 m!724785))

(assert (=> b!782606 m!724787))

(assert (=> b!782607 m!724785))

(assert (=> b!782607 m!724785))

(declare-fun m!724823 () Bool)

(assert (=> b!782607 m!724823))

(assert (=> bm!35234 m!724785))

(declare-fun m!724825 () Bool)

(assert (=> bm!35234 m!724825))

(assert (=> b!782603 m!724785))

(assert (=> b!782603 m!724785))

(assert (=> b!782603 m!724787))

(assert (=> b!782277 d!102497))

(assert (=> b!782287 d!102469))

(declare-fun d!102503 () Bool)

(assert (=> d!102503 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67556 d!102503))

(declare-fun d!102513 () Bool)

(assert (=> d!102513 (= (array_inv!16312 a!3186) (bvsge (size!20850 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67556 d!102513))

(check-sat (not b!782607) (not b!782560) (not b!782526) (not b!782466) (not d!102475) (not d!102465) (not b!782517) (not b!782580) (not b!782431) (not bm!35231) (not d!102481) (not d!102485) (not d!102463) (not d!102489) (not d!102459) (not b!782603) (not b!782449) (not b!782555) (not bm!35230) (not b!782551) (not b!782443) (not b!782535) (not b!782606) (not d!102455) (not b!782505) (not d!102469) (not b!782442) (not b!782554) (not b!782544) (not d!102493) (not d!102461) (not bm!35234))
(check-sat)
