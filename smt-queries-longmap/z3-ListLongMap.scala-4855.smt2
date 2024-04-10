; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66830 () Bool)

(assert start!66830)

(declare-fun b!771296 () Bool)

(declare-fun res!521840 () Bool)

(declare-fun e!429383 () Bool)

(assert (=> b!771296 (=> (not res!521840) (not e!429383))))

(declare-datatypes ((array!42392 0))(
  ( (array!42393 (arr!20296 (Array (_ BitVec 32) (_ BitVec 64))) (size!20717 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42392)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771296 (= res!521840 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!771297 () Bool)

(declare-fun res!521846 () Bool)

(assert (=> b!771297 (=> (not res!521846) (not e!429383))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!771297 (= res!521846 (and (= (size!20717 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20717 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20717 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!771298 () Bool)

(declare-fun res!521839 () Bool)

(declare-fun e!429385 () Bool)

(assert (=> b!771298 (=> (not res!521839) (not e!429385))))

(declare-fun e!429381 () Bool)

(assert (=> b!771298 (= res!521839 e!429381)))

(declare-fun c!85126 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!771298 (= c!85126 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!771299 () Bool)

(declare-fun e!429388 () Bool)

(assert (=> b!771299 (= e!429383 e!429388)))

(declare-fun res!521844 () Bool)

(assert (=> b!771299 (=> (not res!521844) (not e!429388))))

(declare-datatypes ((SeekEntryResult!7896 0))(
  ( (MissingZero!7896 (index!33952 (_ BitVec 32))) (Found!7896 (index!33953 (_ BitVec 32))) (Intermediate!7896 (undefined!8708 Bool) (index!33954 (_ BitVec 32)) (x!64875 (_ BitVec 32))) (Undefined!7896) (MissingVacant!7896 (index!33955 (_ BitVec 32))) )
))
(declare-fun lt!343373 () SeekEntryResult!7896)

(assert (=> b!771299 (= res!521844 (or (= lt!343373 (MissingZero!7896 i!1173)) (= lt!343373 (MissingVacant!7896 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42392 (_ BitVec 32)) SeekEntryResult!7896)

(assert (=> b!771299 (= lt!343373 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!771300 () Bool)

(declare-fun e!429384 () Bool)

(assert (=> b!771300 (= e!429385 e!429384)))

(declare-fun res!521837 () Bool)

(assert (=> b!771300 (=> (not res!521837) (not e!429384))))

(declare-fun lt!343368 () SeekEntryResult!7896)

(declare-fun lt!343371 () SeekEntryResult!7896)

(assert (=> b!771300 (= res!521837 (= lt!343368 lt!343371))))

(declare-fun lt!343376 () array!42392)

(declare-fun lt!343367 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42392 (_ BitVec 32)) SeekEntryResult!7896)

(assert (=> b!771300 (= lt!343371 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343367 lt!343376 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771300 (= lt!343368 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343367 mask!3328) lt!343367 lt!343376 mask!3328))))

(assert (=> b!771300 (= lt!343367 (select (store (arr!20296 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!771300 (= lt!343376 (array!42393 (store (arr!20296 a!3186) i!1173 k0!2102) (size!20717 a!3186)))))

(declare-fun b!771301 () Bool)

(declare-fun res!521848 () Bool)

(assert (=> b!771301 (=> (not res!521848) (not e!429383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771301 (= res!521848 (validKeyInArray!0 (select (arr!20296 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!429380 () Bool)

(declare-fun b!771302 () Bool)

(declare-fun lt!343366 () SeekEntryResult!7896)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42392 (_ BitVec 32)) SeekEntryResult!7896)

(assert (=> b!771302 (= e!429380 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343366))))

(declare-fun b!771303 () Bool)

(declare-fun res!521843 () Bool)

(assert (=> b!771303 (=> (not res!521843) (not e!429388))))

(assert (=> b!771303 (= res!521843 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20717 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20717 a!3186))))))

(declare-fun b!771304 () Bool)

(assert (=> b!771304 (= e!429381 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) (Found!7896 j!159)))))

(declare-fun b!771306 () Bool)

(declare-fun res!521842 () Bool)

(assert (=> b!771306 (=> (not res!521842) (not e!429388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42392 (_ BitVec 32)) Bool)

(assert (=> b!771306 (= res!521842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!771307 () Bool)

(declare-fun res!521851 () Bool)

(assert (=> b!771307 (=> (not res!521851) (not e!429385))))

(assert (=> b!771307 (= res!521851 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20296 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771308 () Bool)

(declare-fun e!429389 () Bool)

(assert (=> b!771308 (= e!429389 e!429380)))

(declare-fun res!521838 () Bool)

(assert (=> b!771308 (=> (not res!521838) (not e!429380))))

(assert (=> b!771308 (= res!521838 (= (seekEntryOrOpen!0 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343366))))

(assert (=> b!771308 (= lt!343366 (Found!7896 j!159))))

(declare-fun b!771309 () Bool)

(declare-fun e!429387 () Bool)

(assert (=> b!771309 (= e!429387 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-datatypes ((Unit!26598 0))(
  ( (Unit!26599) )
))
(declare-fun lt!343370 () Unit!26598)

(declare-fun e!429382 () Unit!26598)

(assert (=> b!771309 (= lt!343370 e!429382)))

(declare-fun c!85125 () Bool)

(assert (=> b!771309 (= c!85125 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!343372 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771309 (= lt!343372 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!771310 () Bool)

(declare-fun res!521845 () Bool)

(assert (=> b!771310 (=> (not res!521845) (not e!429383))))

(assert (=> b!771310 (= res!521845 (validKeyInArray!0 k0!2102))))

(declare-fun b!771311 () Bool)

(assert (=> b!771311 (= e!429388 e!429385)))

(declare-fun res!521852 () Bool)

(assert (=> b!771311 (=> (not res!521852) (not e!429385))))

(declare-fun lt!343369 () SeekEntryResult!7896)

(assert (=> b!771311 (= res!521852 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20296 a!3186) j!159) mask!3328) (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343369))))

(assert (=> b!771311 (= lt!343369 (Intermediate!7896 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771312 () Bool)

(assert (=> b!771312 (= e!429381 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343369))))

(declare-fun b!771313 () Bool)

(declare-fun Unit!26600 () Unit!26598)

(assert (=> b!771313 (= e!429382 Unit!26600)))

(declare-fun lt!343375 () SeekEntryResult!7896)

(assert (=> b!771313 (= lt!343375 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20296 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!771313 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343372 resIntermediateIndex!5 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) (Found!7896 j!159))))

(declare-fun b!771314 () Bool)

(declare-fun Unit!26601 () Unit!26598)

(assert (=> b!771314 (= e!429382 Unit!26601)))

(assert (=> b!771314 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343372 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343369)))

(declare-fun b!771315 () Bool)

(declare-fun res!521850 () Bool)

(assert (=> b!771315 (=> (not res!521850) (not e!429388))))

(declare-datatypes ((List!14298 0))(
  ( (Nil!14295) (Cons!14294 (h!15393 (_ BitVec 64)) (t!20613 List!14298)) )
))
(declare-fun arrayNoDuplicates!0 (array!42392 (_ BitVec 32) List!14298) Bool)

(assert (=> b!771315 (= res!521850 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14295))))

(declare-fun res!521841 () Bool)

(assert (=> start!66830 (=> (not res!521841) (not e!429383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66830 (= res!521841 (validMask!0 mask!3328))))

(assert (=> start!66830 e!429383))

(assert (=> start!66830 true))

(declare-fun array_inv!16092 (array!42392) Bool)

(assert (=> start!66830 (array_inv!16092 a!3186)))

(declare-fun b!771305 () Bool)

(assert (=> b!771305 (= e!429384 (not e!429387))))

(declare-fun res!521849 () Bool)

(assert (=> b!771305 (=> res!521849 e!429387)))

(get-info :version)

(assert (=> b!771305 (= res!521849 (or (not ((_ is Intermediate!7896) lt!343371)) (bvsge x!1131 (x!64875 lt!343371))))))

(assert (=> b!771305 e!429389))

(declare-fun res!521847 () Bool)

(assert (=> b!771305 (=> (not res!521847) (not e!429389))))

(assert (=> b!771305 (= res!521847 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343374 () Unit!26598)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26598)

(assert (=> b!771305 (= lt!343374 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!66830 res!521841) b!771297))

(assert (= (and b!771297 res!521846) b!771301))

(assert (= (and b!771301 res!521848) b!771310))

(assert (= (and b!771310 res!521845) b!771296))

(assert (= (and b!771296 res!521840) b!771299))

(assert (= (and b!771299 res!521844) b!771306))

(assert (= (and b!771306 res!521842) b!771315))

(assert (= (and b!771315 res!521850) b!771303))

(assert (= (and b!771303 res!521843) b!771311))

(assert (= (and b!771311 res!521852) b!771307))

(assert (= (and b!771307 res!521851) b!771298))

(assert (= (and b!771298 c!85126) b!771312))

(assert (= (and b!771298 (not c!85126)) b!771304))

(assert (= (and b!771298 res!521839) b!771300))

(assert (= (and b!771300 res!521837) b!771305))

(assert (= (and b!771305 res!521847) b!771308))

(assert (= (and b!771308 res!521838) b!771302))

(assert (= (and b!771305 (not res!521849)) b!771309))

(assert (= (and b!771309 c!85125) b!771314))

(assert (= (and b!771309 (not c!85125)) b!771313))

(declare-fun m!716463 () Bool)

(assert (=> b!771313 m!716463))

(assert (=> b!771313 m!716463))

(declare-fun m!716465 () Bool)

(assert (=> b!771313 m!716465))

(assert (=> b!771313 m!716463))

(declare-fun m!716467 () Bool)

(assert (=> b!771313 m!716467))

(assert (=> b!771304 m!716463))

(assert (=> b!771304 m!716463))

(assert (=> b!771304 m!716465))

(declare-fun m!716469 () Bool)

(assert (=> b!771309 m!716469))

(declare-fun m!716471 () Bool)

(assert (=> b!771299 m!716471))

(assert (=> b!771302 m!716463))

(assert (=> b!771302 m!716463))

(declare-fun m!716473 () Bool)

(assert (=> b!771302 m!716473))

(assert (=> b!771301 m!716463))

(assert (=> b!771301 m!716463))

(declare-fun m!716475 () Bool)

(assert (=> b!771301 m!716475))

(declare-fun m!716477 () Bool)

(assert (=> b!771315 m!716477))

(declare-fun m!716479 () Bool)

(assert (=> b!771300 m!716479))

(declare-fun m!716481 () Bool)

(assert (=> b!771300 m!716481))

(declare-fun m!716483 () Bool)

(assert (=> b!771300 m!716483))

(declare-fun m!716485 () Bool)

(assert (=> b!771300 m!716485))

(declare-fun m!716487 () Bool)

(assert (=> b!771300 m!716487))

(assert (=> b!771300 m!716485))

(assert (=> b!771311 m!716463))

(assert (=> b!771311 m!716463))

(declare-fun m!716489 () Bool)

(assert (=> b!771311 m!716489))

(assert (=> b!771311 m!716489))

(assert (=> b!771311 m!716463))

(declare-fun m!716491 () Bool)

(assert (=> b!771311 m!716491))

(declare-fun m!716493 () Bool)

(assert (=> b!771305 m!716493))

(declare-fun m!716495 () Bool)

(assert (=> b!771305 m!716495))

(assert (=> b!771308 m!716463))

(assert (=> b!771308 m!716463))

(declare-fun m!716497 () Bool)

(assert (=> b!771308 m!716497))

(declare-fun m!716499 () Bool)

(assert (=> start!66830 m!716499))

(declare-fun m!716501 () Bool)

(assert (=> start!66830 m!716501))

(assert (=> b!771314 m!716463))

(assert (=> b!771314 m!716463))

(declare-fun m!716503 () Bool)

(assert (=> b!771314 m!716503))

(declare-fun m!716505 () Bool)

(assert (=> b!771296 m!716505))

(assert (=> b!771312 m!716463))

(assert (=> b!771312 m!716463))

(declare-fun m!716507 () Bool)

(assert (=> b!771312 m!716507))

(declare-fun m!716509 () Bool)

(assert (=> b!771307 m!716509))

(declare-fun m!716511 () Bool)

(assert (=> b!771310 m!716511))

(declare-fun m!716513 () Bool)

(assert (=> b!771306 m!716513))

(check-sat (not b!771302) (not b!771304) (not b!771310) (not b!771301) (not b!771308) (not b!771311) (not b!771306) (not b!771314) (not b!771309) (not b!771296) (not start!66830) (not b!771315) (not b!771305) (not b!771312) (not b!771299) (not b!771313) (not b!771300))
(check-sat)
(get-model)

(declare-fun b!771394 () Bool)

(declare-fun lt!343415 () SeekEntryResult!7896)

(assert (=> b!771394 (and (bvsge (index!33954 lt!343415) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343415) (size!20717 a!3186)))))

(declare-fun res!521909 () Bool)

(assert (=> b!771394 (= res!521909 (= (select (arr!20296 a!3186) (index!33954 lt!343415)) (select (arr!20296 a!3186) j!159)))))

(declare-fun e!429434 () Bool)

(assert (=> b!771394 (=> res!521909 e!429434)))

(declare-fun e!429431 () Bool)

(assert (=> b!771394 (= e!429431 e!429434)))

(declare-fun e!429430 () SeekEntryResult!7896)

(declare-fun b!771395 () Bool)

(assert (=> b!771395 (= e!429430 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20296 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20296 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771396 () Bool)

(declare-fun e!429433 () Bool)

(assert (=> b!771396 (= e!429433 e!429431)))

(declare-fun res!521907 () Bool)

(assert (=> b!771396 (= res!521907 (and ((_ is Intermediate!7896) lt!343415) (not (undefined!8708 lt!343415)) (bvslt (x!64875 lt!343415) #b01111111111111111111111111111110) (bvsge (x!64875 lt!343415) #b00000000000000000000000000000000) (bvsge (x!64875 lt!343415) #b00000000000000000000000000000000)))))

(assert (=> b!771396 (=> (not res!521907) (not e!429431))))

(declare-fun b!771397 () Bool)

(assert (=> b!771397 (= e!429433 (bvsge (x!64875 lt!343415) #b01111111111111111111111111111110))))

(declare-fun b!771398 () Bool)

(assert (=> b!771398 (and (bvsge (index!33954 lt!343415) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343415) (size!20717 a!3186)))))

(assert (=> b!771398 (= e!429434 (= (select (arr!20296 a!3186) (index!33954 lt!343415)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771399 () Bool)

(assert (=> b!771399 (and (bvsge (index!33954 lt!343415) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343415) (size!20717 a!3186)))))

(declare-fun res!521908 () Bool)

(assert (=> b!771399 (= res!521908 (= (select (arr!20296 a!3186) (index!33954 lt!343415)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771399 (=> res!521908 e!429434)))

(declare-fun b!771400 () Bool)

(declare-fun e!429432 () SeekEntryResult!7896)

(assert (=> b!771400 (= e!429432 e!429430)))

(declare-fun lt!343414 () (_ BitVec 64))

(declare-fun c!85139 () Bool)

(assert (=> b!771400 (= c!85139 (or (= lt!343414 (select (arr!20296 a!3186) j!159)) (= (bvadd lt!343414 lt!343414) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101691 () Bool)

(assert (=> d!101691 e!429433))

(declare-fun c!85140 () Bool)

(assert (=> d!101691 (= c!85140 (and ((_ is Intermediate!7896) lt!343415) (undefined!8708 lt!343415)))))

(assert (=> d!101691 (= lt!343415 e!429432)))

(declare-fun c!85141 () Bool)

(assert (=> d!101691 (= c!85141 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101691 (= lt!343414 (select (arr!20296 a!3186) (toIndex!0 (select (arr!20296 a!3186) j!159) mask!3328)))))

(assert (=> d!101691 (validMask!0 mask!3328)))

(assert (=> d!101691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20296 a!3186) j!159) mask!3328) (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343415)))

(declare-fun b!771401 () Bool)

(assert (=> b!771401 (= e!429430 (Intermediate!7896 false (toIndex!0 (select (arr!20296 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!771402 () Bool)

(assert (=> b!771402 (= e!429432 (Intermediate!7896 true (toIndex!0 (select (arr!20296 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!101691 c!85141) b!771402))

(assert (= (and d!101691 (not c!85141)) b!771400))

(assert (= (and b!771400 c!85139) b!771401))

(assert (= (and b!771400 (not c!85139)) b!771395))

(assert (= (and d!101691 c!85140) b!771397))

(assert (= (and d!101691 (not c!85140)) b!771396))

(assert (= (and b!771396 res!521907) b!771394))

(assert (= (and b!771394 (not res!521909)) b!771399))

(assert (= (and b!771399 (not res!521908)) b!771398))

(declare-fun m!716567 () Bool)

(assert (=> b!771399 m!716567))

(assert (=> d!101691 m!716489))

(declare-fun m!716569 () Bool)

(assert (=> d!101691 m!716569))

(assert (=> d!101691 m!716499))

(assert (=> b!771398 m!716567))

(assert (=> b!771395 m!716489))

(declare-fun m!716571 () Bool)

(assert (=> b!771395 m!716571))

(assert (=> b!771395 m!716571))

(assert (=> b!771395 m!716463))

(declare-fun m!716573 () Bool)

(assert (=> b!771395 m!716573))

(assert (=> b!771394 m!716567))

(assert (=> b!771311 d!101691))

(declare-fun d!101693 () Bool)

(declare-fun lt!343421 () (_ BitVec 32))

(declare-fun lt!343420 () (_ BitVec 32))

(assert (=> d!101693 (= lt!343421 (bvmul (bvxor lt!343420 (bvlshr lt!343420 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101693 (= lt!343420 ((_ extract 31 0) (bvand (bvxor (select (arr!20296 a!3186) j!159) (bvlshr (select (arr!20296 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101693 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!521910 (let ((h!15395 ((_ extract 31 0) (bvand (bvxor (select (arr!20296 a!3186) j!159) (bvlshr (select (arr!20296 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64878 (bvmul (bvxor h!15395 (bvlshr h!15395 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64878 (bvlshr x!64878 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!521910 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!521910 #b00000000000000000000000000000000))))))

(assert (=> d!101693 (= (toIndex!0 (select (arr!20296 a!3186) j!159) mask!3328) (bvand (bvxor lt!343421 (bvlshr lt!343421 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!771311 d!101693))

(declare-fun d!101699 () Bool)

(assert (=> d!101699 (= (validKeyInArray!0 (select (arr!20296 a!3186) j!159)) (and (not (= (select (arr!20296 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20296 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!771301 d!101699))

(declare-fun b!771403 () Bool)

(declare-fun lt!343423 () SeekEntryResult!7896)

(assert (=> b!771403 (and (bvsge (index!33954 lt!343423) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343423) (size!20717 a!3186)))))

(declare-fun res!521913 () Bool)

(assert (=> b!771403 (= res!521913 (= (select (arr!20296 a!3186) (index!33954 lt!343423)) (select (arr!20296 a!3186) j!159)))))

(declare-fun e!429439 () Bool)

(assert (=> b!771403 (=> res!521913 e!429439)))

(declare-fun e!429436 () Bool)

(assert (=> b!771403 (= e!429436 e!429439)))

(declare-fun b!771404 () Bool)

(declare-fun e!429435 () SeekEntryResult!7896)

(assert (=> b!771404 (= e!429435 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20296 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771405 () Bool)

(declare-fun e!429438 () Bool)

(assert (=> b!771405 (= e!429438 e!429436)))

(declare-fun res!521911 () Bool)

(assert (=> b!771405 (= res!521911 (and ((_ is Intermediate!7896) lt!343423) (not (undefined!8708 lt!343423)) (bvslt (x!64875 lt!343423) #b01111111111111111111111111111110) (bvsge (x!64875 lt!343423) #b00000000000000000000000000000000) (bvsge (x!64875 lt!343423) x!1131)))))

(assert (=> b!771405 (=> (not res!521911) (not e!429436))))

(declare-fun b!771406 () Bool)

(assert (=> b!771406 (= e!429438 (bvsge (x!64875 lt!343423) #b01111111111111111111111111111110))))

(declare-fun b!771407 () Bool)

(assert (=> b!771407 (and (bvsge (index!33954 lt!343423) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343423) (size!20717 a!3186)))))

(assert (=> b!771407 (= e!429439 (= (select (arr!20296 a!3186) (index!33954 lt!343423)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771408 () Bool)

(assert (=> b!771408 (and (bvsge (index!33954 lt!343423) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343423) (size!20717 a!3186)))))

(declare-fun res!521912 () Bool)

(assert (=> b!771408 (= res!521912 (= (select (arr!20296 a!3186) (index!33954 lt!343423)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771408 (=> res!521912 e!429439)))

(declare-fun b!771409 () Bool)

(declare-fun e!429437 () SeekEntryResult!7896)

(assert (=> b!771409 (= e!429437 e!429435)))

(declare-fun c!85142 () Bool)

(declare-fun lt!343422 () (_ BitVec 64))

(assert (=> b!771409 (= c!85142 (or (= lt!343422 (select (arr!20296 a!3186) j!159)) (= (bvadd lt!343422 lt!343422) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101701 () Bool)

(assert (=> d!101701 e!429438))

(declare-fun c!85143 () Bool)

(assert (=> d!101701 (= c!85143 (and ((_ is Intermediate!7896) lt!343423) (undefined!8708 lt!343423)))))

(assert (=> d!101701 (= lt!343423 e!429437)))

(declare-fun c!85144 () Bool)

(assert (=> d!101701 (= c!85144 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101701 (= lt!343422 (select (arr!20296 a!3186) index!1321))))

(assert (=> d!101701 (validMask!0 mask!3328)))

(assert (=> d!101701 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343423)))

(declare-fun b!771410 () Bool)

(assert (=> b!771410 (= e!429435 (Intermediate!7896 false index!1321 x!1131))))

(declare-fun b!771411 () Bool)

(assert (=> b!771411 (= e!429437 (Intermediate!7896 true index!1321 x!1131))))

(assert (= (and d!101701 c!85144) b!771411))

(assert (= (and d!101701 (not c!85144)) b!771409))

(assert (= (and b!771409 c!85142) b!771410))

(assert (= (and b!771409 (not c!85142)) b!771404))

(assert (= (and d!101701 c!85143) b!771406))

(assert (= (and d!101701 (not c!85143)) b!771405))

(assert (= (and b!771405 res!521911) b!771403))

(assert (= (and b!771403 (not res!521913)) b!771408))

(assert (= (and b!771408 (not res!521912)) b!771407))

(declare-fun m!716575 () Bool)

(assert (=> b!771408 m!716575))

(declare-fun m!716577 () Bool)

(assert (=> d!101701 m!716577))

(assert (=> d!101701 m!716499))

(assert (=> b!771407 m!716575))

(assert (=> b!771404 m!716469))

(assert (=> b!771404 m!716469))

(assert (=> b!771404 m!716463))

(declare-fun m!716579 () Bool)

(assert (=> b!771404 m!716579))

(assert (=> b!771403 m!716575))

(assert (=> b!771312 d!101701))

(declare-fun b!771451 () Bool)

(declare-fun e!429464 () SeekEntryResult!7896)

(declare-fun lt!343434 () SeekEntryResult!7896)

(assert (=> b!771451 (= e!429464 (seekKeyOrZeroReturnVacant!0 (x!64875 lt!343434) (index!33954 lt!343434) (index!33954 lt!343434) k0!2102 a!3186 mask!3328))))

(declare-fun b!771452 () Bool)

(declare-fun c!85160 () Bool)

(declare-fun lt!343436 () (_ BitVec 64))

(assert (=> b!771452 (= c!85160 (= lt!343436 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429466 () SeekEntryResult!7896)

(assert (=> b!771452 (= e!429466 e!429464)))

(declare-fun b!771453 () Bool)

(assert (=> b!771453 (= e!429464 (MissingZero!7896 (index!33954 lt!343434)))))

(declare-fun d!101703 () Bool)

(declare-fun lt!343435 () SeekEntryResult!7896)

(assert (=> d!101703 (and (or ((_ is Undefined!7896) lt!343435) (not ((_ is Found!7896) lt!343435)) (and (bvsge (index!33953 lt!343435) #b00000000000000000000000000000000) (bvslt (index!33953 lt!343435) (size!20717 a!3186)))) (or ((_ is Undefined!7896) lt!343435) ((_ is Found!7896) lt!343435) (not ((_ is MissingZero!7896) lt!343435)) (and (bvsge (index!33952 lt!343435) #b00000000000000000000000000000000) (bvslt (index!33952 lt!343435) (size!20717 a!3186)))) (or ((_ is Undefined!7896) lt!343435) ((_ is Found!7896) lt!343435) ((_ is MissingZero!7896) lt!343435) (not ((_ is MissingVacant!7896) lt!343435)) (and (bvsge (index!33955 lt!343435) #b00000000000000000000000000000000) (bvslt (index!33955 lt!343435) (size!20717 a!3186)))) (or ((_ is Undefined!7896) lt!343435) (ite ((_ is Found!7896) lt!343435) (= (select (arr!20296 a!3186) (index!33953 lt!343435)) k0!2102) (ite ((_ is MissingZero!7896) lt!343435) (= (select (arr!20296 a!3186) (index!33952 lt!343435)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7896) lt!343435) (= (select (arr!20296 a!3186) (index!33955 lt!343435)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!429468 () SeekEntryResult!7896)

(assert (=> d!101703 (= lt!343435 e!429468)))

(declare-fun c!85162 () Bool)

(assert (=> d!101703 (= c!85162 (and ((_ is Intermediate!7896) lt!343434) (undefined!8708 lt!343434)))))

(assert (=> d!101703 (= lt!343434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101703 (validMask!0 mask!3328)))

(assert (=> d!101703 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!343435)))

(declare-fun b!771454 () Bool)

(assert (=> b!771454 (= e!429468 e!429466)))

(assert (=> b!771454 (= lt!343436 (select (arr!20296 a!3186) (index!33954 lt!343434)))))

(declare-fun c!85161 () Bool)

(assert (=> b!771454 (= c!85161 (= lt!343436 k0!2102))))

(declare-fun b!771455 () Bool)

(assert (=> b!771455 (= e!429468 Undefined!7896)))

(declare-fun b!771456 () Bool)

(assert (=> b!771456 (= e!429466 (Found!7896 (index!33954 lt!343434)))))

(assert (= (and d!101703 c!85162) b!771455))

(assert (= (and d!101703 (not c!85162)) b!771454))

(assert (= (and b!771454 c!85161) b!771456))

(assert (= (and b!771454 (not c!85161)) b!771452))

(assert (= (and b!771452 c!85160) b!771453))

(assert (= (and b!771452 (not c!85160)) b!771451))

(declare-fun m!716589 () Bool)

(assert (=> b!771451 m!716589))

(declare-fun m!716591 () Bool)

(assert (=> d!101703 m!716591))

(declare-fun m!716593 () Bool)

(assert (=> d!101703 m!716593))

(declare-fun m!716595 () Bool)

(assert (=> d!101703 m!716595))

(assert (=> d!101703 m!716595))

(declare-fun m!716597 () Bool)

(assert (=> d!101703 m!716597))

(assert (=> d!101703 m!716499))

(declare-fun m!716599 () Bool)

(assert (=> d!101703 m!716599))

(declare-fun m!716601 () Bool)

(assert (=> b!771454 m!716601))

(assert (=> b!771299 d!101703))

(declare-fun d!101709 () Bool)

(assert (=> d!101709 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!771310 d!101709))

(declare-fun b!771463 () Bool)

(declare-fun lt!343438 () SeekEntryResult!7896)

(assert (=> b!771463 (and (bvsge (index!33954 lt!343438) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343438) (size!20717 lt!343376)))))

(declare-fun res!521931 () Bool)

(assert (=> b!771463 (= res!521931 (= (select (arr!20296 lt!343376) (index!33954 lt!343438)) lt!343367))))

(declare-fun e!429475 () Bool)

(assert (=> b!771463 (=> res!521931 e!429475)))

(declare-fun e!429472 () Bool)

(assert (=> b!771463 (= e!429472 e!429475)))

(declare-fun b!771464 () Bool)

(declare-fun e!429471 () SeekEntryResult!7896)

(assert (=> b!771464 (= e!429471 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!343367 lt!343376 mask!3328))))

(declare-fun b!771465 () Bool)

(declare-fun e!429474 () Bool)

(assert (=> b!771465 (= e!429474 e!429472)))

(declare-fun res!521929 () Bool)

(assert (=> b!771465 (= res!521929 (and ((_ is Intermediate!7896) lt!343438) (not (undefined!8708 lt!343438)) (bvslt (x!64875 lt!343438) #b01111111111111111111111111111110) (bvsge (x!64875 lt!343438) #b00000000000000000000000000000000) (bvsge (x!64875 lt!343438) x!1131)))))

(assert (=> b!771465 (=> (not res!521929) (not e!429472))))

(declare-fun b!771466 () Bool)

(assert (=> b!771466 (= e!429474 (bvsge (x!64875 lt!343438) #b01111111111111111111111111111110))))

(declare-fun b!771467 () Bool)

(assert (=> b!771467 (and (bvsge (index!33954 lt!343438) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343438) (size!20717 lt!343376)))))

(assert (=> b!771467 (= e!429475 (= (select (arr!20296 lt!343376) (index!33954 lt!343438)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771468 () Bool)

(assert (=> b!771468 (and (bvsge (index!33954 lt!343438) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343438) (size!20717 lt!343376)))))

(declare-fun res!521930 () Bool)

(assert (=> b!771468 (= res!521930 (= (select (arr!20296 lt!343376) (index!33954 lt!343438)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771468 (=> res!521930 e!429475)))

(declare-fun b!771469 () Bool)

(declare-fun e!429473 () SeekEntryResult!7896)

(assert (=> b!771469 (= e!429473 e!429471)))

(declare-fun c!85163 () Bool)

(declare-fun lt!343437 () (_ BitVec 64))

(assert (=> b!771469 (= c!85163 (or (= lt!343437 lt!343367) (= (bvadd lt!343437 lt!343437) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101711 () Bool)

(assert (=> d!101711 e!429474))

(declare-fun c!85164 () Bool)

(assert (=> d!101711 (= c!85164 (and ((_ is Intermediate!7896) lt!343438) (undefined!8708 lt!343438)))))

(assert (=> d!101711 (= lt!343438 e!429473)))

(declare-fun c!85165 () Bool)

(assert (=> d!101711 (= c!85165 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101711 (= lt!343437 (select (arr!20296 lt!343376) index!1321))))

(assert (=> d!101711 (validMask!0 mask!3328)))

(assert (=> d!101711 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343367 lt!343376 mask!3328) lt!343438)))

(declare-fun b!771470 () Bool)

(assert (=> b!771470 (= e!429471 (Intermediate!7896 false index!1321 x!1131))))

(declare-fun b!771471 () Bool)

(assert (=> b!771471 (= e!429473 (Intermediate!7896 true index!1321 x!1131))))

(assert (= (and d!101711 c!85165) b!771471))

(assert (= (and d!101711 (not c!85165)) b!771469))

(assert (= (and b!771469 c!85163) b!771470))

(assert (= (and b!771469 (not c!85163)) b!771464))

(assert (= (and d!101711 c!85164) b!771466))

(assert (= (and d!101711 (not c!85164)) b!771465))

(assert (= (and b!771465 res!521929) b!771463))

(assert (= (and b!771463 (not res!521931)) b!771468))

(assert (= (and b!771468 (not res!521930)) b!771467))

(declare-fun m!716603 () Bool)

(assert (=> b!771468 m!716603))

(declare-fun m!716605 () Bool)

(assert (=> d!101711 m!716605))

(assert (=> d!101711 m!716499))

(assert (=> b!771467 m!716603))

(assert (=> b!771464 m!716469))

(assert (=> b!771464 m!716469))

(declare-fun m!716607 () Bool)

(assert (=> b!771464 m!716607))

(assert (=> b!771463 m!716603))

(assert (=> b!771300 d!101711))

(declare-fun b!771472 () Bool)

(declare-fun lt!343440 () SeekEntryResult!7896)

(assert (=> b!771472 (and (bvsge (index!33954 lt!343440) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343440) (size!20717 lt!343376)))))

(declare-fun res!521934 () Bool)

(assert (=> b!771472 (= res!521934 (= (select (arr!20296 lt!343376) (index!33954 lt!343440)) lt!343367))))

(declare-fun e!429480 () Bool)

(assert (=> b!771472 (=> res!521934 e!429480)))

(declare-fun e!429477 () Bool)

(assert (=> b!771472 (= e!429477 e!429480)))

(declare-fun b!771473 () Bool)

(declare-fun e!429476 () SeekEntryResult!7896)

(assert (=> b!771473 (= e!429476 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!343367 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!343367 lt!343376 mask!3328))))

(declare-fun b!771474 () Bool)

(declare-fun e!429479 () Bool)

(assert (=> b!771474 (= e!429479 e!429477)))

(declare-fun res!521932 () Bool)

(assert (=> b!771474 (= res!521932 (and ((_ is Intermediate!7896) lt!343440) (not (undefined!8708 lt!343440)) (bvslt (x!64875 lt!343440) #b01111111111111111111111111111110) (bvsge (x!64875 lt!343440) #b00000000000000000000000000000000) (bvsge (x!64875 lt!343440) #b00000000000000000000000000000000)))))

(assert (=> b!771474 (=> (not res!521932) (not e!429477))))

(declare-fun b!771475 () Bool)

(assert (=> b!771475 (= e!429479 (bvsge (x!64875 lt!343440) #b01111111111111111111111111111110))))

(declare-fun b!771476 () Bool)

(assert (=> b!771476 (and (bvsge (index!33954 lt!343440) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343440) (size!20717 lt!343376)))))

(assert (=> b!771476 (= e!429480 (= (select (arr!20296 lt!343376) (index!33954 lt!343440)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771477 () Bool)

(assert (=> b!771477 (and (bvsge (index!33954 lt!343440) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343440) (size!20717 lt!343376)))))

(declare-fun res!521933 () Bool)

(assert (=> b!771477 (= res!521933 (= (select (arr!20296 lt!343376) (index!33954 lt!343440)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771477 (=> res!521933 e!429480)))

(declare-fun b!771478 () Bool)

(declare-fun e!429478 () SeekEntryResult!7896)

(assert (=> b!771478 (= e!429478 e!429476)))

(declare-fun c!85166 () Bool)

(declare-fun lt!343439 () (_ BitVec 64))

(assert (=> b!771478 (= c!85166 (or (= lt!343439 lt!343367) (= (bvadd lt!343439 lt!343439) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101713 () Bool)

(assert (=> d!101713 e!429479))

(declare-fun c!85167 () Bool)

(assert (=> d!101713 (= c!85167 (and ((_ is Intermediate!7896) lt!343440) (undefined!8708 lt!343440)))))

(assert (=> d!101713 (= lt!343440 e!429478)))

(declare-fun c!85168 () Bool)

(assert (=> d!101713 (= c!85168 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101713 (= lt!343439 (select (arr!20296 lt!343376) (toIndex!0 lt!343367 mask!3328)))))

(assert (=> d!101713 (validMask!0 mask!3328)))

(assert (=> d!101713 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343367 mask!3328) lt!343367 lt!343376 mask!3328) lt!343440)))

(declare-fun b!771479 () Bool)

(assert (=> b!771479 (= e!429476 (Intermediate!7896 false (toIndex!0 lt!343367 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!771480 () Bool)

(assert (=> b!771480 (= e!429478 (Intermediate!7896 true (toIndex!0 lt!343367 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!101713 c!85168) b!771480))

(assert (= (and d!101713 (not c!85168)) b!771478))

(assert (= (and b!771478 c!85166) b!771479))

(assert (= (and b!771478 (not c!85166)) b!771473))

(assert (= (and d!101713 c!85167) b!771475))

(assert (= (and d!101713 (not c!85167)) b!771474))

(assert (= (and b!771474 res!521932) b!771472))

(assert (= (and b!771472 (not res!521934)) b!771477))

(assert (= (and b!771477 (not res!521933)) b!771476))

(declare-fun m!716609 () Bool)

(assert (=> b!771477 m!716609))

(assert (=> d!101713 m!716485))

(declare-fun m!716611 () Bool)

(assert (=> d!101713 m!716611))

(assert (=> d!101713 m!716499))

(assert (=> b!771476 m!716609))

(assert (=> b!771473 m!716485))

(declare-fun m!716613 () Bool)

(assert (=> b!771473 m!716613))

(assert (=> b!771473 m!716613))

(declare-fun m!716615 () Bool)

(assert (=> b!771473 m!716615))

(assert (=> b!771472 m!716609))

(assert (=> b!771300 d!101713))

(declare-fun d!101715 () Bool)

(declare-fun lt!343442 () (_ BitVec 32))

(declare-fun lt!343441 () (_ BitVec 32))

(assert (=> d!101715 (= lt!343442 (bvmul (bvxor lt!343441 (bvlshr lt!343441 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101715 (= lt!343441 ((_ extract 31 0) (bvand (bvxor lt!343367 (bvlshr lt!343367 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101715 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!521910 (let ((h!15395 ((_ extract 31 0) (bvand (bvxor lt!343367 (bvlshr lt!343367 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64878 (bvmul (bvxor h!15395 (bvlshr h!15395 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64878 (bvlshr x!64878 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!521910 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!521910 #b00000000000000000000000000000000))))))

(assert (=> d!101715 (= (toIndex!0 lt!343367 mask!3328) (bvand (bvxor lt!343442 (bvlshr lt!343442 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!771300 d!101715))

(declare-fun b!771481 () Bool)

(declare-fun lt!343444 () SeekEntryResult!7896)

(assert (=> b!771481 (and (bvsge (index!33954 lt!343444) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343444) (size!20717 a!3186)))))

(declare-fun res!521937 () Bool)

(assert (=> b!771481 (= res!521937 (= (select (arr!20296 a!3186) (index!33954 lt!343444)) (select (arr!20296 a!3186) j!159)))))

(declare-fun e!429485 () Bool)

(assert (=> b!771481 (=> res!521937 e!429485)))

(declare-fun e!429482 () Bool)

(assert (=> b!771481 (= e!429482 e!429485)))

(declare-fun e!429481 () SeekEntryResult!7896)

(declare-fun b!771482 () Bool)

(assert (=> b!771482 (= e!429481 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343372 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20296 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771483 () Bool)

(declare-fun e!429484 () Bool)

(assert (=> b!771483 (= e!429484 e!429482)))

(declare-fun res!521935 () Bool)

(assert (=> b!771483 (= res!521935 (and ((_ is Intermediate!7896) lt!343444) (not (undefined!8708 lt!343444)) (bvslt (x!64875 lt!343444) #b01111111111111111111111111111110) (bvsge (x!64875 lt!343444) #b00000000000000000000000000000000) (bvsge (x!64875 lt!343444) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!771483 (=> (not res!521935) (not e!429482))))

(declare-fun b!771484 () Bool)

(assert (=> b!771484 (= e!429484 (bvsge (x!64875 lt!343444) #b01111111111111111111111111111110))))

(declare-fun b!771485 () Bool)

(assert (=> b!771485 (and (bvsge (index!33954 lt!343444) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343444) (size!20717 a!3186)))))

(assert (=> b!771485 (= e!429485 (= (select (arr!20296 a!3186) (index!33954 lt!343444)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771486 () Bool)

(assert (=> b!771486 (and (bvsge (index!33954 lt!343444) #b00000000000000000000000000000000) (bvslt (index!33954 lt!343444) (size!20717 a!3186)))))

(declare-fun res!521936 () Bool)

(assert (=> b!771486 (= res!521936 (= (select (arr!20296 a!3186) (index!33954 lt!343444)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771486 (=> res!521936 e!429485)))

(declare-fun b!771487 () Bool)

(declare-fun e!429483 () SeekEntryResult!7896)

(assert (=> b!771487 (= e!429483 e!429481)))

(declare-fun c!85169 () Bool)

(declare-fun lt!343443 () (_ BitVec 64))

(assert (=> b!771487 (= c!85169 (or (= lt!343443 (select (arr!20296 a!3186) j!159)) (= (bvadd lt!343443 lt!343443) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101717 () Bool)

(assert (=> d!101717 e!429484))

(declare-fun c!85170 () Bool)

(assert (=> d!101717 (= c!85170 (and ((_ is Intermediate!7896) lt!343444) (undefined!8708 lt!343444)))))

(assert (=> d!101717 (= lt!343444 e!429483)))

(declare-fun c!85171 () Bool)

(assert (=> d!101717 (= c!85171 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101717 (= lt!343443 (select (arr!20296 a!3186) lt!343372))))

(assert (=> d!101717 (validMask!0 mask!3328)))

(assert (=> d!101717 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343372 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343444)))

(declare-fun b!771488 () Bool)

(assert (=> b!771488 (= e!429481 (Intermediate!7896 false lt!343372 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!771489 () Bool)

(assert (=> b!771489 (= e!429483 (Intermediate!7896 true lt!343372 (bvadd #b00000000000000000000000000000001 x!1131)))))

(assert (= (and d!101717 c!85171) b!771489))

(assert (= (and d!101717 (not c!85171)) b!771487))

(assert (= (and b!771487 c!85169) b!771488))

(assert (= (and b!771487 (not c!85169)) b!771482))

(assert (= (and d!101717 c!85170) b!771484))

(assert (= (and d!101717 (not c!85170)) b!771483))

(assert (= (and b!771483 res!521935) b!771481))

(assert (= (and b!771481 (not res!521937)) b!771486))

(assert (= (and b!771486 (not res!521936)) b!771485))

(declare-fun m!716617 () Bool)

(assert (=> b!771486 m!716617))

(declare-fun m!716619 () Bool)

(assert (=> d!101717 m!716619))

(assert (=> d!101717 m!716499))

(assert (=> b!771485 m!716617))

(declare-fun m!716621 () Bool)

(assert (=> b!771482 m!716621))

(assert (=> b!771482 m!716621))

(assert (=> b!771482 m!716463))

(declare-fun m!716623 () Bool)

(assert (=> b!771482 m!716623))

(assert (=> b!771481 m!716617))

(assert (=> b!771314 d!101717))

(declare-fun b!771541 () Bool)

(declare-fun e!429514 () SeekEntryResult!7896)

(assert (=> b!771541 (= e!429514 (MissingVacant!7896 resIntermediateIndex!5))))

(declare-fun b!771543 () Bool)

(declare-fun e!429512 () SeekEntryResult!7896)

(assert (=> b!771543 (= e!429512 (Found!7896 index!1321))))

(declare-fun b!771544 () Bool)

(declare-fun e!429513 () SeekEntryResult!7896)

(assert (=> b!771544 (= e!429513 Undefined!7896)))

(declare-fun b!771545 () Bool)

(assert (=> b!771545 (= e!429514 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20296 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771546 () Bool)

(declare-fun c!85198 () Bool)

(declare-fun lt!343464 () (_ BitVec 64))

(assert (=> b!771546 (= c!85198 (= lt!343464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771546 (= e!429512 e!429514)))

(declare-fun b!771542 () Bool)

(assert (=> b!771542 (= e!429513 e!429512)))

(declare-fun c!85197 () Bool)

(assert (=> b!771542 (= c!85197 (= lt!343464 (select (arr!20296 a!3186) j!159)))))

(declare-fun lt!343465 () SeekEntryResult!7896)

(declare-fun d!101719 () Bool)

(assert (=> d!101719 (and (or ((_ is Undefined!7896) lt!343465) (not ((_ is Found!7896) lt!343465)) (and (bvsge (index!33953 lt!343465) #b00000000000000000000000000000000) (bvslt (index!33953 lt!343465) (size!20717 a!3186)))) (or ((_ is Undefined!7896) lt!343465) ((_ is Found!7896) lt!343465) (not ((_ is MissingVacant!7896) lt!343465)) (not (= (index!33955 lt!343465) resIntermediateIndex!5)) (and (bvsge (index!33955 lt!343465) #b00000000000000000000000000000000) (bvslt (index!33955 lt!343465) (size!20717 a!3186)))) (or ((_ is Undefined!7896) lt!343465) (ite ((_ is Found!7896) lt!343465) (= (select (arr!20296 a!3186) (index!33953 lt!343465)) (select (arr!20296 a!3186) j!159)) (and ((_ is MissingVacant!7896) lt!343465) (= (index!33955 lt!343465) resIntermediateIndex!5) (= (select (arr!20296 a!3186) (index!33955 lt!343465)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101719 (= lt!343465 e!429513)))

(declare-fun c!85196 () Bool)

(assert (=> d!101719 (= c!85196 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101719 (= lt!343464 (select (arr!20296 a!3186) index!1321))))

(assert (=> d!101719 (validMask!0 mask!3328)))

(assert (=> d!101719 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343465)))

(assert (= (and d!101719 c!85196) b!771544))

(assert (= (and d!101719 (not c!85196)) b!771542))

(assert (= (and b!771542 c!85197) b!771543))

(assert (= (and b!771542 (not c!85197)) b!771546))

(assert (= (and b!771546 c!85198) b!771541))

(assert (= (and b!771546 (not c!85198)) b!771545))

(assert (=> b!771545 m!716469))

(assert (=> b!771545 m!716469))

(assert (=> b!771545 m!716463))

(declare-fun m!716659 () Bool)

(assert (=> b!771545 m!716659))

(declare-fun m!716661 () Bool)

(assert (=> d!101719 m!716661))

(declare-fun m!716663 () Bool)

(assert (=> d!101719 m!716663))

(assert (=> d!101719 m!716577))

(assert (=> d!101719 m!716499))

(assert (=> b!771304 d!101719))

(declare-fun b!771547 () Bool)

(declare-fun e!429517 () SeekEntryResult!7896)

(assert (=> b!771547 (= e!429517 (MissingVacant!7896 resIntermediateIndex!5))))

(declare-fun b!771549 () Bool)

(declare-fun e!429515 () SeekEntryResult!7896)

(assert (=> b!771549 (= e!429515 (Found!7896 resIntermediateIndex!5))))

(declare-fun b!771550 () Bool)

(declare-fun e!429516 () SeekEntryResult!7896)

(assert (=> b!771550 (= e!429516 Undefined!7896)))

(declare-fun b!771551 () Bool)

(assert (=> b!771551 (= e!429517 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20296 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771552 () Bool)

(declare-fun c!85201 () Bool)

(declare-fun lt!343466 () (_ BitVec 64))

(assert (=> b!771552 (= c!85201 (= lt!343466 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771552 (= e!429515 e!429517)))

(declare-fun b!771548 () Bool)

(assert (=> b!771548 (= e!429516 e!429515)))

(declare-fun c!85200 () Bool)

(assert (=> b!771548 (= c!85200 (= lt!343466 (select (arr!20296 a!3186) j!159)))))

(declare-fun d!101733 () Bool)

(declare-fun lt!343467 () SeekEntryResult!7896)

(assert (=> d!101733 (and (or ((_ is Undefined!7896) lt!343467) (not ((_ is Found!7896) lt!343467)) (and (bvsge (index!33953 lt!343467) #b00000000000000000000000000000000) (bvslt (index!33953 lt!343467) (size!20717 a!3186)))) (or ((_ is Undefined!7896) lt!343467) ((_ is Found!7896) lt!343467) (not ((_ is MissingVacant!7896) lt!343467)) (not (= (index!33955 lt!343467) resIntermediateIndex!5)) (and (bvsge (index!33955 lt!343467) #b00000000000000000000000000000000) (bvslt (index!33955 lt!343467) (size!20717 a!3186)))) (or ((_ is Undefined!7896) lt!343467) (ite ((_ is Found!7896) lt!343467) (= (select (arr!20296 a!3186) (index!33953 lt!343467)) (select (arr!20296 a!3186) j!159)) (and ((_ is MissingVacant!7896) lt!343467) (= (index!33955 lt!343467) resIntermediateIndex!5) (= (select (arr!20296 a!3186) (index!33955 lt!343467)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101733 (= lt!343467 e!429516)))

(declare-fun c!85199 () Bool)

(assert (=> d!101733 (= c!85199 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101733 (= lt!343466 (select (arr!20296 a!3186) resIntermediateIndex!5))))

(assert (=> d!101733 (validMask!0 mask!3328)))

(assert (=> d!101733 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343467)))

(assert (= (and d!101733 c!85199) b!771550))

(assert (= (and d!101733 (not c!85199)) b!771548))

(assert (= (and b!771548 c!85200) b!771549))

(assert (= (and b!771548 (not c!85200)) b!771552))

(assert (= (and b!771552 c!85201) b!771547))

(assert (= (and b!771552 (not c!85201)) b!771551))

(declare-fun m!716665 () Bool)

(assert (=> b!771551 m!716665))

(assert (=> b!771551 m!716665))

(assert (=> b!771551 m!716463))

(declare-fun m!716667 () Bool)

(assert (=> b!771551 m!716667))

(declare-fun m!716669 () Bool)

(assert (=> d!101733 m!716669))

(declare-fun m!716671 () Bool)

(assert (=> d!101733 m!716671))

(assert (=> d!101733 m!716509))

(assert (=> d!101733 m!716499))

(assert (=> b!771302 d!101733))

(assert (=> b!771313 d!101719))

(declare-fun b!771553 () Bool)

(declare-fun e!429520 () SeekEntryResult!7896)

(assert (=> b!771553 (= e!429520 (MissingVacant!7896 resIntermediateIndex!5))))

(declare-fun b!771555 () Bool)

(declare-fun e!429518 () SeekEntryResult!7896)

(assert (=> b!771555 (= e!429518 (Found!7896 lt!343372))))

(declare-fun b!771556 () Bool)

(declare-fun e!429519 () SeekEntryResult!7896)

(assert (=> b!771556 (= e!429519 Undefined!7896)))

(declare-fun b!771557 () Bool)

(assert (=> b!771557 (= e!429520 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343372 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20296 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771558 () Bool)

(declare-fun c!85204 () Bool)

(declare-fun lt!343468 () (_ BitVec 64))

(assert (=> b!771558 (= c!85204 (= lt!343468 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771558 (= e!429518 e!429520)))

(declare-fun b!771554 () Bool)

(assert (=> b!771554 (= e!429519 e!429518)))

(declare-fun c!85203 () Bool)

(assert (=> b!771554 (= c!85203 (= lt!343468 (select (arr!20296 a!3186) j!159)))))

(declare-fun lt!343469 () SeekEntryResult!7896)

(declare-fun d!101735 () Bool)

(assert (=> d!101735 (and (or ((_ is Undefined!7896) lt!343469) (not ((_ is Found!7896) lt!343469)) (and (bvsge (index!33953 lt!343469) #b00000000000000000000000000000000) (bvslt (index!33953 lt!343469) (size!20717 a!3186)))) (or ((_ is Undefined!7896) lt!343469) ((_ is Found!7896) lt!343469) (not ((_ is MissingVacant!7896) lt!343469)) (not (= (index!33955 lt!343469) resIntermediateIndex!5)) (and (bvsge (index!33955 lt!343469) #b00000000000000000000000000000000) (bvslt (index!33955 lt!343469) (size!20717 a!3186)))) (or ((_ is Undefined!7896) lt!343469) (ite ((_ is Found!7896) lt!343469) (= (select (arr!20296 a!3186) (index!33953 lt!343469)) (select (arr!20296 a!3186) j!159)) (and ((_ is MissingVacant!7896) lt!343469) (= (index!33955 lt!343469) resIntermediateIndex!5) (= (select (arr!20296 a!3186) (index!33955 lt!343469)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101735 (= lt!343469 e!429519)))

(declare-fun c!85202 () Bool)

(assert (=> d!101735 (= c!85202 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101735 (= lt!343468 (select (arr!20296 a!3186) lt!343372))))

(assert (=> d!101735 (validMask!0 mask!3328)))

(assert (=> d!101735 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343372 resIntermediateIndex!5 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343469)))

(assert (= (and d!101735 c!85202) b!771556))

(assert (= (and d!101735 (not c!85202)) b!771554))

(assert (= (and b!771554 c!85203) b!771555))

(assert (= (and b!771554 (not c!85203)) b!771558))

(assert (= (and b!771558 c!85204) b!771553))

(assert (= (and b!771558 (not c!85204)) b!771557))

(assert (=> b!771557 m!716621))

(assert (=> b!771557 m!716621))

(assert (=> b!771557 m!716463))

(declare-fun m!716673 () Bool)

(assert (=> b!771557 m!716673))

(declare-fun m!716675 () Bool)

(assert (=> d!101735 m!716675))

(declare-fun m!716677 () Bool)

(assert (=> d!101735 m!716677))

(assert (=> d!101735 m!716619))

(assert (=> d!101735 m!716499))

(assert (=> b!771313 d!101735))

(declare-fun d!101737 () Bool)

(declare-fun res!521951 () Bool)

(declare-fun e!429544 () Bool)

(assert (=> d!101737 (=> res!521951 e!429544)))

(assert (=> d!101737 (= res!521951 (bvsge #b00000000000000000000000000000000 (size!20717 a!3186)))))

(assert (=> d!101737 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!429544)))

(declare-fun bm!35112 () Bool)

(declare-fun call!35115 () Bool)

(assert (=> bm!35112 (= call!35115 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!771591 () Bool)

(declare-fun e!429542 () Bool)

(assert (=> b!771591 (= e!429542 call!35115)))

(declare-fun b!771592 () Bool)

(declare-fun e!429543 () Bool)

(assert (=> b!771592 (= e!429543 call!35115)))

(declare-fun b!771593 () Bool)

(assert (=> b!771593 (= e!429543 e!429542)))

(declare-fun lt!343490 () (_ BitVec 64))

(assert (=> b!771593 (= lt!343490 (select (arr!20296 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!343489 () Unit!26598)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42392 (_ BitVec 64) (_ BitVec 32)) Unit!26598)

(assert (=> b!771593 (= lt!343489 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343490 #b00000000000000000000000000000000))))

(assert (=> b!771593 (arrayContainsKey!0 a!3186 lt!343490 #b00000000000000000000000000000000)))

(declare-fun lt!343488 () Unit!26598)

(assert (=> b!771593 (= lt!343488 lt!343489)))

(declare-fun res!521952 () Bool)

(assert (=> b!771593 (= res!521952 (= (seekEntryOrOpen!0 (select (arr!20296 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7896 #b00000000000000000000000000000000)))))

(assert (=> b!771593 (=> (not res!521952) (not e!429542))))

(declare-fun b!771594 () Bool)

(assert (=> b!771594 (= e!429544 e!429543)))

(declare-fun c!85216 () Bool)

(assert (=> b!771594 (= c!85216 (validKeyInArray!0 (select (arr!20296 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101737 (not res!521951)) b!771594))

(assert (= (and b!771594 c!85216) b!771593))

(assert (= (and b!771594 (not c!85216)) b!771592))

(assert (= (and b!771593 res!521952) b!771591))

(assert (= (or b!771591 b!771592) bm!35112))

(declare-fun m!716693 () Bool)

(assert (=> bm!35112 m!716693))

(declare-fun m!716695 () Bool)

(assert (=> b!771593 m!716695))

(declare-fun m!716697 () Bool)

(assert (=> b!771593 m!716697))

(declare-fun m!716699 () Bool)

(assert (=> b!771593 m!716699))

(assert (=> b!771593 m!716695))

(declare-fun m!716701 () Bool)

(assert (=> b!771593 m!716701))

(assert (=> b!771594 m!716695))

(assert (=> b!771594 m!716695))

(declare-fun m!716703 () Bool)

(assert (=> b!771594 m!716703))

(assert (=> b!771306 d!101737))

(declare-fun d!101751 () Bool)

(declare-fun res!521964 () Bool)

(declare-fun e!429559 () Bool)

(assert (=> d!101751 (=> res!521964 e!429559)))

(assert (=> d!101751 (= res!521964 (= (select (arr!20296 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101751 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!429559)))

(declare-fun b!771617 () Bool)

(declare-fun e!429560 () Bool)

(assert (=> b!771617 (= e!429559 e!429560)))

(declare-fun res!521965 () Bool)

(assert (=> b!771617 (=> (not res!521965) (not e!429560))))

(assert (=> b!771617 (= res!521965 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20717 a!3186)))))

(declare-fun b!771618 () Bool)

(assert (=> b!771618 (= e!429560 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101751 (not res!521964)) b!771617))

(assert (= (and b!771617 res!521965) b!771618))

(assert (=> d!101751 m!716695))

(declare-fun m!716719 () Bool)

(assert (=> b!771618 m!716719))

(assert (=> b!771296 d!101751))

(declare-fun d!101757 () Bool)

(declare-fun res!521973 () Bool)

(declare-fun e!429569 () Bool)

(assert (=> d!101757 (=> res!521973 e!429569)))

(assert (=> d!101757 (= res!521973 (bvsge #b00000000000000000000000000000000 (size!20717 a!3186)))))

(assert (=> d!101757 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14295) e!429569)))

(declare-fun b!771629 () Bool)

(declare-fun e!429572 () Bool)

(declare-fun call!35118 () Bool)

(assert (=> b!771629 (= e!429572 call!35118)))

(declare-fun bm!35115 () Bool)

(declare-fun c!85225 () Bool)

(assert (=> bm!35115 (= call!35118 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!85225 (Cons!14294 (select (arr!20296 a!3186) #b00000000000000000000000000000000) Nil!14295) Nil!14295)))))

(declare-fun b!771630 () Bool)

(declare-fun e!429570 () Bool)

(declare-fun contains!4090 (List!14298 (_ BitVec 64)) Bool)

(assert (=> b!771630 (= e!429570 (contains!4090 Nil!14295 (select (arr!20296 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!771631 () Bool)

(assert (=> b!771631 (= e!429572 call!35118)))

(declare-fun b!771632 () Bool)

(declare-fun e!429571 () Bool)

(assert (=> b!771632 (= e!429571 e!429572)))

(assert (=> b!771632 (= c!85225 (validKeyInArray!0 (select (arr!20296 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!771633 () Bool)

(assert (=> b!771633 (= e!429569 e!429571)))

(declare-fun res!521972 () Bool)

(assert (=> b!771633 (=> (not res!521972) (not e!429571))))

(assert (=> b!771633 (= res!521972 (not e!429570))))

(declare-fun res!521974 () Bool)

(assert (=> b!771633 (=> (not res!521974) (not e!429570))))

(assert (=> b!771633 (= res!521974 (validKeyInArray!0 (select (arr!20296 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101757 (not res!521973)) b!771633))

(assert (= (and b!771633 res!521974) b!771630))

(assert (= (and b!771633 res!521972) b!771632))

(assert (= (and b!771632 c!85225) b!771629))

(assert (= (and b!771632 (not c!85225)) b!771631))

(assert (= (or b!771629 b!771631) bm!35115))

(assert (=> bm!35115 m!716695))

(declare-fun m!716721 () Bool)

(assert (=> bm!35115 m!716721))

(assert (=> b!771630 m!716695))

(assert (=> b!771630 m!716695))

(declare-fun m!716723 () Bool)

(assert (=> b!771630 m!716723))

(assert (=> b!771632 m!716695))

(assert (=> b!771632 m!716695))

(assert (=> b!771632 m!716703))

(assert (=> b!771633 m!716695))

(assert (=> b!771633 m!716695))

(assert (=> b!771633 m!716703))

(assert (=> b!771315 d!101757))

(declare-fun d!101761 () Bool)

(declare-fun res!521975 () Bool)

(declare-fun e!429575 () Bool)

(assert (=> d!101761 (=> res!521975 e!429575)))

(assert (=> d!101761 (= res!521975 (bvsge j!159 (size!20717 a!3186)))))

(assert (=> d!101761 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!429575)))

(declare-fun bm!35116 () Bool)

(declare-fun call!35119 () Bool)

(assert (=> bm!35116 (= call!35119 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!771634 () Bool)

(declare-fun e!429573 () Bool)

(assert (=> b!771634 (= e!429573 call!35119)))

(declare-fun b!771635 () Bool)

(declare-fun e!429574 () Bool)

(assert (=> b!771635 (= e!429574 call!35119)))

(declare-fun b!771636 () Bool)

(assert (=> b!771636 (= e!429574 e!429573)))

(declare-fun lt!343503 () (_ BitVec 64))

(assert (=> b!771636 (= lt!343503 (select (arr!20296 a!3186) j!159))))

(declare-fun lt!343502 () Unit!26598)

(assert (=> b!771636 (= lt!343502 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343503 j!159))))

(assert (=> b!771636 (arrayContainsKey!0 a!3186 lt!343503 #b00000000000000000000000000000000)))

(declare-fun lt!343501 () Unit!26598)

(assert (=> b!771636 (= lt!343501 lt!343502)))

(declare-fun res!521976 () Bool)

(assert (=> b!771636 (= res!521976 (= (seekEntryOrOpen!0 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) (Found!7896 j!159)))))

(assert (=> b!771636 (=> (not res!521976) (not e!429573))))

(declare-fun b!771637 () Bool)

(assert (=> b!771637 (= e!429575 e!429574)))

(declare-fun c!85226 () Bool)

(assert (=> b!771637 (= c!85226 (validKeyInArray!0 (select (arr!20296 a!3186) j!159)))))

(assert (= (and d!101761 (not res!521975)) b!771637))

(assert (= (and b!771637 c!85226) b!771636))

(assert (= (and b!771637 (not c!85226)) b!771635))

(assert (= (and b!771636 res!521976) b!771634))

(assert (= (or b!771634 b!771635) bm!35116))

(declare-fun m!716725 () Bool)

(assert (=> bm!35116 m!716725))

(assert (=> b!771636 m!716463))

(declare-fun m!716727 () Bool)

(assert (=> b!771636 m!716727))

(declare-fun m!716729 () Bool)

(assert (=> b!771636 m!716729))

(assert (=> b!771636 m!716463))

(assert (=> b!771636 m!716497))

(assert (=> b!771637 m!716463))

(assert (=> b!771637 m!716463))

(assert (=> b!771637 m!716475))

(assert (=> b!771305 d!101761))

(declare-fun d!101763 () Bool)

(assert (=> d!101763 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!343516 () Unit!26598)

(declare-fun choose!38 (array!42392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26598)

(assert (=> d!101763 (= lt!343516 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101763 (validMask!0 mask!3328)))

(assert (=> d!101763 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!343516)))

(declare-fun bs!21591 () Bool)

(assert (= bs!21591 d!101763))

(assert (=> bs!21591 m!716493))

(declare-fun m!716731 () Bool)

(assert (=> bs!21591 m!716731))

(assert (=> bs!21591 m!716499))

(assert (=> b!771305 d!101763))

(declare-fun d!101765 () Bool)

(declare-fun lt!343522 () (_ BitVec 32))

(assert (=> d!101765 (and (bvsge lt!343522 #b00000000000000000000000000000000) (bvslt lt!343522 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101765 (= lt!343522 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101765 (validMask!0 mask!3328)))

(assert (=> d!101765 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!343522)))

(declare-fun bs!21592 () Bool)

(assert (= bs!21592 d!101765))

(declare-fun m!716741 () Bool)

(assert (=> bs!21592 m!716741))

(assert (=> bs!21592 m!716499))

(assert (=> b!771309 d!101765))

(declare-fun d!101769 () Bool)

(assert (=> d!101769 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66830 d!101769))

(declare-fun d!101781 () Bool)

(assert (=> d!101781 (= (array_inv!16092 a!3186) (bvsge (size!20717 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66830 d!101781))

(declare-fun e!429603 () SeekEntryResult!7896)

(declare-fun lt!343534 () SeekEntryResult!7896)

(declare-fun b!771681 () Bool)

(assert (=> b!771681 (= e!429603 (seekKeyOrZeroReturnVacant!0 (x!64875 lt!343534) (index!33954 lt!343534) (index!33954 lt!343534) (select (arr!20296 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771682 () Bool)

(declare-fun c!85240 () Bool)

(declare-fun lt!343536 () (_ BitVec 64))

(assert (=> b!771682 (= c!85240 (= lt!343536 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429604 () SeekEntryResult!7896)

(assert (=> b!771682 (= e!429604 e!429603)))

(declare-fun b!771683 () Bool)

(assert (=> b!771683 (= e!429603 (MissingZero!7896 (index!33954 lt!343534)))))

(declare-fun d!101783 () Bool)

(declare-fun lt!343535 () SeekEntryResult!7896)

(assert (=> d!101783 (and (or ((_ is Undefined!7896) lt!343535) (not ((_ is Found!7896) lt!343535)) (and (bvsge (index!33953 lt!343535) #b00000000000000000000000000000000) (bvslt (index!33953 lt!343535) (size!20717 a!3186)))) (or ((_ is Undefined!7896) lt!343535) ((_ is Found!7896) lt!343535) (not ((_ is MissingZero!7896) lt!343535)) (and (bvsge (index!33952 lt!343535) #b00000000000000000000000000000000) (bvslt (index!33952 lt!343535) (size!20717 a!3186)))) (or ((_ is Undefined!7896) lt!343535) ((_ is Found!7896) lt!343535) ((_ is MissingZero!7896) lt!343535) (not ((_ is MissingVacant!7896) lt!343535)) (and (bvsge (index!33955 lt!343535) #b00000000000000000000000000000000) (bvslt (index!33955 lt!343535) (size!20717 a!3186)))) (or ((_ is Undefined!7896) lt!343535) (ite ((_ is Found!7896) lt!343535) (= (select (arr!20296 a!3186) (index!33953 lt!343535)) (select (arr!20296 a!3186) j!159)) (ite ((_ is MissingZero!7896) lt!343535) (= (select (arr!20296 a!3186) (index!33952 lt!343535)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7896) lt!343535) (= (select (arr!20296 a!3186) (index!33955 lt!343535)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!429605 () SeekEntryResult!7896)

(assert (=> d!101783 (= lt!343535 e!429605)))

(declare-fun c!85242 () Bool)

(assert (=> d!101783 (= c!85242 (and ((_ is Intermediate!7896) lt!343534) (undefined!8708 lt!343534)))))

(assert (=> d!101783 (= lt!343534 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20296 a!3186) j!159) mask!3328) (select (arr!20296 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101783 (validMask!0 mask!3328)))

(assert (=> d!101783 (= (seekEntryOrOpen!0 (select (arr!20296 a!3186) j!159) a!3186 mask!3328) lt!343535)))

(declare-fun b!771684 () Bool)

(assert (=> b!771684 (= e!429605 e!429604)))

(assert (=> b!771684 (= lt!343536 (select (arr!20296 a!3186) (index!33954 lt!343534)))))

(declare-fun c!85241 () Bool)

(assert (=> b!771684 (= c!85241 (= lt!343536 (select (arr!20296 a!3186) j!159)))))

(declare-fun b!771685 () Bool)

(assert (=> b!771685 (= e!429605 Undefined!7896)))

(declare-fun b!771686 () Bool)

(assert (=> b!771686 (= e!429604 (Found!7896 (index!33954 lt!343534)))))

(assert (= (and d!101783 c!85242) b!771685))

(assert (= (and d!101783 (not c!85242)) b!771684))

(assert (= (and b!771684 c!85241) b!771686))

(assert (= (and b!771684 (not c!85241)) b!771682))

(assert (= (and b!771682 c!85240) b!771683))

(assert (= (and b!771682 (not c!85240)) b!771681))

(assert (=> b!771681 m!716463))

(declare-fun m!716757 () Bool)

(assert (=> b!771681 m!716757))

(declare-fun m!716759 () Bool)

(assert (=> d!101783 m!716759))

(declare-fun m!716761 () Bool)

(assert (=> d!101783 m!716761))

(assert (=> d!101783 m!716463))

(assert (=> d!101783 m!716489))

(assert (=> d!101783 m!716489))

(assert (=> d!101783 m!716463))

(assert (=> d!101783 m!716491))

(assert (=> d!101783 m!716499))

(declare-fun m!716763 () Bool)

(assert (=> d!101783 m!716763))

(declare-fun m!716765 () Bool)

(assert (=> b!771684 m!716765))

(assert (=> b!771308 d!101783))

(check-sat (not b!771557) (not b!771630) (not d!101703) (not b!771593) (not d!101735) (not b!771545) (not bm!35112) (not b!771633) (not b!771618) (not b!771482) (not d!101763) (not b!771404) (not d!101713) (not d!101733) (not b!771632) (not b!771473) (not d!101765) (not d!101691) (not d!101701) (not b!771464) (not b!771636) (not b!771637) (not d!101783) (not b!771395) (not b!771594) (not d!101711) (not bm!35115) (not d!101719) (not b!771551) (not b!771681) (not bm!35116) (not b!771451) (not d!101717))
(check-sat)
