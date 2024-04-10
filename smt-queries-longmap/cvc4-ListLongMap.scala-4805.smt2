; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65960 () Bool)

(assert start!65960)

(declare-fun b!760328 () Bool)

(declare-fun res!514487 () Bool)

(declare-fun e!423840 () Bool)

(assert (=> b!760328 (=> (not res!514487) (not e!423840))))

(declare-datatypes ((array!42070 0))(
  ( (array!42071 (arr!20147 (Array (_ BitVec 32) (_ BitVec 64))) (size!20568 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42070)

(declare-datatypes ((List!14149 0))(
  ( (Nil!14146) (Cons!14145 (h!15220 (_ BitVec 64)) (t!20464 List!14149)) )
))
(declare-fun arrayNoDuplicates!0 (array!42070 (_ BitVec 32) List!14149) Bool)

(assert (=> b!760328 (= res!514487 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14146))))

(declare-fun b!760329 () Bool)

(declare-fun res!514495 () Bool)

(declare-fun e!423837 () Bool)

(assert (=> b!760329 (=> (not res!514495) (not e!423837))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!760329 (= res!514495 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20147 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760331 () Bool)

(declare-fun res!514483 () Bool)

(assert (=> b!760331 (=> (not res!514483) (not e!423840))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!760331 (= res!514483 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20568 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20568 a!3186))))))

(declare-datatypes ((SeekEntryResult!7747 0))(
  ( (MissingZero!7747 (index!33356 (_ BitVec 32))) (Found!7747 (index!33357 (_ BitVec 32))) (Intermediate!7747 (undefined!8559 Bool) (index!33358 (_ BitVec 32)) (x!64242 (_ BitVec 32))) (Undefined!7747) (MissingVacant!7747 (index!33359 (_ BitVec 32))) )
))
(declare-fun lt!338773 () SeekEntryResult!7747)

(declare-fun b!760332 () Bool)

(declare-fun e!423835 () Bool)

(assert (=> b!760332 (= e!423835 (not (or (not (is-Intermediate!7747 lt!338773)) (not (= x!1131 (x!64242 lt!338773))) (= index!1321 (index!33358 lt!338773)))))))

(declare-fun e!423842 () Bool)

(assert (=> b!760332 e!423842))

(declare-fun res!514492 () Bool)

(assert (=> b!760332 (=> (not res!514492) (not e!423842))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42070 (_ BitVec 32)) Bool)

(assert (=> b!760332 (= res!514492 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26334 0))(
  ( (Unit!26335) )
))
(declare-fun lt!338767 () Unit!26334)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26334)

(assert (=> b!760332 (= lt!338767 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!760333 () Bool)

(assert (=> b!760333 (= e!423840 e!423837)))

(declare-fun res!514486 () Bool)

(assert (=> b!760333 (=> (not res!514486) (not e!423837))))

(declare-fun lt!338770 () SeekEntryResult!7747)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42070 (_ BitVec 32)) SeekEntryResult!7747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!760333 (= res!514486 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328) (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338770))))

(assert (=> b!760333 (= lt!338770 (Intermediate!7747 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!760334 () Bool)

(declare-fun res!514488 () Bool)

(assert (=> b!760334 (=> (not res!514488) (not e!423837))))

(declare-fun e!423838 () Bool)

(assert (=> b!760334 (= res!514488 e!423838)))

(declare-fun c!83305 () Bool)

(assert (=> b!760334 (= c!83305 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!760335 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42070 (_ BitVec 32)) SeekEntryResult!7747)

(assert (=> b!760335 (= e!423838 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) (Found!7747 j!159)))))

(declare-fun b!760336 () Bool)

(declare-fun res!514484 () Bool)

(assert (=> b!760336 (=> (not res!514484) (not e!423840))))

(assert (=> b!760336 (= res!514484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!423841 () Bool)

(declare-fun b!760337 () Bool)

(declare-fun lt!338772 () SeekEntryResult!7747)

(assert (=> b!760337 (= e!423841 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338772))))

(declare-fun b!760338 () Bool)

(declare-fun res!514482 () Bool)

(declare-fun e!423836 () Bool)

(assert (=> b!760338 (=> (not res!514482) (not e!423836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!760338 (= res!514482 (validKeyInArray!0 (select (arr!20147 a!3186) j!159)))))

(declare-fun b!760339 () Bool)

(declare-fun res!514496 () Bool)

(assert (=> b!760339 (=> (not res!514496) (not e!423836))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!760339 (= res!514496 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!760340 () Bool)

(declare-fun res!514485 () Bool)

(assert (=> b!760340 (=> (not res!514485) (not e!423836))))

(assert (=> b!760340 (= res!514485 (validKeyInArray!0 k!2102))))

(declare-fun b!760341 () Bool)

(assert (=> b!760341 (= e!423836 e!423840)))

(declare-fun res!514490 () Bool)

(assert (=> b!760341 (=> (not res!514490) (not e!423840))))

(declare-fun lt!338768 () SeekEntryResult!7747)

(assert (=> b!760341 (= res!514490 (or (= lt!338768 (MissingZero!7747 i!1173)) (= lt!338768 (MissingVacant!7747 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42070 (_ BitVec 32)) SeekEntryResult!7747)

(assert (=> b!760341 (= lt!338768 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!760342 () Bool)

(declare-fun res!514489 () Bool)

(assert (=> b!760342 (=> (not res!514489) (not e!423836))))

(assert (=> b!760342 (= res!514489 (and (= (size!20568 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20568 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20568 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!760330 () Bool)

(assert (=> b!760330 (= e!423837 e!423835)))

(declare-fun res!514494 () Bool)

(assert (=> b!760330 (=> (not res!514494) (not e!423835))))

(declare-fun lt!338774 () SeekEntryResult!7747)

(assert (=> b!760330 (= res!514494 (= lt!338774 lt!338773))))

(declare-fun lt!338769 () array!42070)

(declare-fun lt!338771 () (_ BitVec 64))

(assert (=> b!760330 (= lt!338773 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338771 lt!338769 mask!3328))))

(assert (=> b!760330 (= lt!338774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338771 mask!3328) lt!338771 lt!338769 mask!3328))))

(assert (=> b!760330 (= lt!338771 (select (store (arr!20147 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!760330 (= lt!338769 (array!42071 (store (arr!20147 a!3186) i!1173 k!2102) (size!20568 a!3186)))))

(declare-fun res!514491 () Bool)

(assert (=> start!65960 (=> (not res!514491) (not e!423836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65960 (= res!514491 (validMask!0 mask!3328))))

(assert (=> start!65960 e!423836))

(assert (=> start!65960 true))

(declare-fun array_inv!15943 (array!42070) Bool)

(assert (=> start!65960 (array_inv!15943 a!3186)))

(declare-fun b!760343 () Bool)

(assert (=> b!760343 (= e!423838 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338770))))

(declare-fun b!760344 () Bool)

(assert (=> b!760344 (= e!423842 e!423841)))

(declare-fun res!514493 () Bool)

(assert (=> b!760344 (=> (not res!514493) (not e!423841))))

(assert (=> b!760344 (= res!514493 (= (seekEntryOrOpen!0 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338772))))

(assert (=> b!760344 (= lt!338772 (Found!7747 j!159))))

(assert (= (and start!65960 res!514491) b!760342))

(assert (= (and b!760342 res!514489) b!760338))

(assert (= (and b!760338 res!514482) b!760340))

(assert (= (and b!760340 res!514485) b!760339))

(assert (= (and b!760339 res!514496) b!760341))

(assert (= (and b!760341 res!514490) b!760336))

(assert (= (and b!760336 res!514484) b!760328))

(assert (= (and b!760328 res!514487) b!760331))

(assert (= (and b!760331 res!514483) b!760333))

(assert (= (and b!760333 res!514486) b!760329))

(assert (= (and b!760329 res!514495) b!760334))

(assert (= (and b!760334 c!83305) b!760343))

(assert (= (and b!760334 (not c!83305)) b!760335))

(assert (= (and b!760334 res!514488) b!760330))

(assert (= (and b!760330 res!514494) b!760332))

(assert (= (and b!760332 res!514492) b!760344))

(assert (= (and b!760344 res!514493) b!760337))

(declare-fun m!707505 () Bool)

(assert (=> b!760338 m!707505))

(assert (=> b!760338 m!707505))

(declare-fun m!707507 () Bool)

(assert (=> b!760338 m!707507))

(assert (=> b!760344 m!707505))

(assert (=> b!760344 m!707505))

(declare-fun m!707509 () Bool)

(assert (=> b!760344 m!707509))

(declare-fun m!707511 () Bool)

(assert (=> b!760330 m!707511))

(declare-fun m!707513 () Bool)

(assert (=> b!760330 m!707513))

(declare-fun m!707515 () Bool)

(assert (=> b!760330 m!707515))

(declare-fun m!707517 () Bool)

(assert (=> b!760330 m!707517))

(declare-fun m!707519 () Bool)

(assert (=> b!760330 m!707519))

(assert (=> b!760330 m!707517))

(declare-fun m!707521 () Bool)

(assert (=> b!760340 m!707521))

(declare-fun m!707523 () Bool)

(assert (=> b!760339 m!707523))

(declare-fun m!707525 () Bool)

(assert (=> b!760341 m!707525))

(declare-fun m!707527 () Bool)

(assert (=> b!760329 m!707527))

(declare-fun m!707529 () Bool)

(assert (=> b!760328 m!707529))

(assert (=> b!760343 m!707505))

(assert (=> b!760343 m!707505))

(declare-fun m!707531 () Bool)

(assert (=> b!760343 m!707531))

(assert (=> b!760337 m!707505))

(assert (=> b!760337 m!707505))

(declare-fun m!707533 () Bool)

(assert (=> b!760337 m!707533))

(declare-fun m!707535 () Bool)

(assert (=> b!760336 m!707535))

(assert (=> b!760335 m!707505))

(assert (=> b!760335 m!707505))

(declare-fun m!707537 () Bool)

(assert (=> b!760335 m!707537))

(declare-fun m!707539 () Bool)

(assert (=> start!65960 m!707539))

(declare-fun m!707541 () Bool)

(assert (=> start!65960 m!707541))

(assert (=> b!760333 m!707505))

(assert (=> b!760333 m!707505))

(declare-fun m!707543 () Bool)

(assert (=> b!760333 m!707543))

(assert (=> b!760333 m!707543))

(assert (=> b!760333 m!707505))

(declare-fun m!707545 () Bool)

(assert (=> b!760333 m!707545))

(declare-fun m!707547 () Bool)

(assert (=> b!760332 m!707547))

(declare-fun m!707549 () Bool)

(assert (=> b!760332 m!707549))

(push 1)

(assert (not b!760335))

(assert (not b!760337))

(assert (not b!760330))

(assert (not b!760344))

(assert (not b!760339))

(assert (not start!65960))

(assert (not b!760333))

(assert (not b!760341))

(assert (not b!760332))

(assert (not b!760338))

(assert (not b!760340))

(assert (not b!760328))

(assert (not b!760343))

(assert (not b!760336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100499 () Bool)

(declare-fun lt!338826 () SeekEntryResult!7747)

(assert (=> d!100499 (and (or (is-Undefined!7747 lt!338826) (not (is-Found!7747 lt!338826)) (and (bvsge (index!33357 lt!338826) #b00000000000000000000000000000000) (bvslt (index!33357 lt!338826) (size!20568 a!3186)))) (or (is-Undefined!7747 lt!338826) (is-Found!7747 lt!338826) (not (is-MissingZero!7747 lt!338826)) (and (bvsge (index!33356 lt!338826) #b00000000000000000000000000000000) (bvslt (index!33356 lt!338826) (size!20568 a!3186)))) (or (is-Undefined!7747 lt!338826) (is-Found!7747 lt!338826) (is-MissingZero!7747 lt!338826) (not (is-MissingVacant!7747 lt!338826)) (and (bvsge (index!33359 lt!338826) #b00000000000000000000000000000000) (bvslt (index!33359 lt!338826) (size!20568 a!3186)))) (or (is-Undefined!7747 lt!338826) (ite (is-Found!7747 lt!338826) (= (select (arr!20147 a!3186) (index!33357 lt!338826)) k!2102) (ite (is-MissingZero!7747 lt!338826) (= (select (arr!20147 a!3186) (index!33356 lt!338826)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7747 lt!338826) (= (select (arr!20147 a!3186) (index!33359 lt!338826)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!423905 () SeekEntryResult!7747)

(assert (=> d!100499 (= lt!338826 e!423905)))

(declare-fun c!83351 () Bool)

(declare-fun lt!338825 () SeekEntryResult!7747)

(assert (=> d!100499 (= c!83351 (and (is-Intermediate!7747 lt!338825) (undefined!8559 lt!338825)))))

(assert (=> d!100499 (= lt!338825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!100499 (validMask!0 mask!3328)))

(assert (=> d!100499 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!338826)))

(declare-fun b!760456 () Bool)

(declare-fun e!423906 () SeekEntryResult!7747)

(assert (=> b!760456 (= e!423906 (seekKeyOrZeroReturnVacant!0 (x!64242 lt!338825) (index!33358 lt!338825) (index!33358 lt!338825) k!2102 a!3186 mask!3328))))

(declare-fun b!760457 () Bool)

(assert (=> b!760457 (= e!423906 (MissingZero!7747 (index!33358 lt!338825)))))

(declare-fun b!760458 () Bool)

(declare-fun c!83352 () Bool)

(declare-fun lt!338824 () (_ BitVec 64))

(assert (=> b!760458 (= c!83352 (= lt!338824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423904 () SeekEntryResult!7747)

(assert (=> b!760458 (= e!423904 e!423906)))

(declare-fun b!760459 () Bool)

(assert (=> b!760459 (= e!423905 e!423904)))

(assert (=> b!760459 (= lt!338824 (select (arr!20147 a!3186) (index!33358 lt!338825)))))

(declare-fun c!83353 () Bool)

(assert (=> b!760459 (= c!83353 (= lt!338824 k!2102))))

(declare-fun b!760460 () Bool)

(assert (=> b!760460 (= e!423904 (Found!7747 (index!33358 lt!338825)))))

(declare-fun b!760461 () Bool)

(assert (=> b!760461 (= e!423905 Undefined!7747)))

(assert (= (and d!100499 c!83351) b!760461))

(assert (= (and d!100499 (not c!83351)) b!760459))

(assert (= (and b!760459 c!83353) b!760460))

(assert (= (and b!760459 (not c!83353)) b!760458))

(assert (= (and b!760458 c!83352) b!760457))

(assert (= (and b!760458 (not c!83352)) b!760456))

(declare-fun m!707617 () Bool)

(assert (=> d!100499 m!707617))

(assert (=> d!100499 m!707539))

(declare-fun m!707621 () Bool)

(assert (=> d!100499 m!707621))

(declare-fun m!707625 () Bool)

(assert (=> d!100499 m!707625))

(assert (=> d!100499 m!707625))

(declare-fun m!707627 () Bool)

(assert (=> d!100499 m!707627))

(declare-fun m!707629 () Bool)

(assert (=> d!100499 m!707629))

(declare-fun m!707631 () Bool)

(assert (=> b!760456 m!707631))

(declare-fun m!707633 () Bool)

(assert (=> b!760459 m!707633))

(assert (=> b!760341 d!100499))

(declare-fun b!760561 () Bool)

(declare-fun lt!338858 () SeekEntryResult!7747)

(assert (=> b!760561 (and (bvsge (index!33358 lt!338858) #b00000000000000000000000000000000) (bvslt (index!33358 lt!338858) (size!20568 lt!338769)))))

(declare-fun res!514554 () Bool)

(assert (=> b!760561 (= res!514554 (= (select (arr!20147 lt!338769) (index!33358 lt!338858)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423969 () Bool)

(assert (=> b!760561 (=> res!514554 e!423969)))

(declare-fun e!423967 () SeekEntryResult!7747)

(declare-fun b!760562 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!760562 (= e!423967 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!338771 lt!338769 mask!3328))))

(declare-fun b!760563 () Bool)

(declare-fun e!423965 () Bool)

(declare-fun e!423968 () Bool)

(assert (=> b!760563 (= e!423965 e!423968)))

(declare-fun res!514555 () Bool)

(assert (=> b!760563 (= res!514555 (and (is-Intermediate!7747 lt!338858) (not (undefined!8559 lt!338858)) (bvslt (x!64242 lt!338858) #b01111111111111111111111111111110) (bvsge (x!64242 lt!338858) #b00000000000000000000000000000000) (bvsge (x!64242 lt!338858) x!1131)))))

(assert (=> b!760563 (=> (not res!514555) (not e!423968))))

(declare-fun b!760565 () Bool)

(assert (=> b!760565 (and (bvsge (index!33358 lt!338858) #b00000000000000000000000000000000) (bvslt (index!33358 lt!338858) (size!20568 lt!338769)))))

(declare-fun res!514553 () Bool)

(assert (=> b!760565 (= res!514553 (= (select (arr!20147 lt!338769) (index!33358 lt!338858)) lt!338771))))

(assert (=> b!760565 (=> res!514553 e!423969)))

(assert (=> b!760565 (= e!423968 e!423969)))

(declare-fun b!760566 () Bool)

(assert (=> b!760566 (and (bvsge (index!33358 lt!338858) #b00000000000000000000000000000000) (bvslt (index!33358 lt!338858) (size!20568 lt!338769)))))

(assert (=> b!760566 (= e!423969 (= (select (arr!20147 lt!338769) (index!33358 lt!338858)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760567 () Bool)

(assert (=> b!760567 (= e!423967 (Intermediate!7747 false index!1321 x!1131))))

(declare-fun b!760564 () Bool)

(assert (=> b!760564 (= e!423965 (bvsge (x!64242 lt!338858) #b01111111111111111111111111111110))))

(declare-fun d!100513 () Bool)

(assert (=> d!100513 e!423965))

(declare-fun c!83389 () Bool)

(assert (=> d!100513 (= c!83389 (and (is-Intermediate!7747 lt!338858) (undefined!8559 lt!338858)))))

(declare-fun e!423966 () SeekEntryResult!7747)

(assert (=> d!100513 (= lt!338858 e!423966)))

(declare-fun c!83388 () Bool)

(assert (=> d!100513 (= c!83388 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!338857 () (_ BitVec 64))

(assert (=> d!100513 (= lt!338857 (select (arr!20147 lt!338769) index!1321))))

(assert (=> d!100513 (validMask!0 mask!3328)))

(assert (=> d!100513 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338771 lt!338769 mask!3328) lt!338858)))

(declare-fun b!760568 () Bool)

(assert (=> b!760568 (= e!423966 e!423967)))

(declare-fun c!83387 () Bool)

(assert (=> b!760568 (= c!83387 (or (= lt!338857 lt!338771) (= (bvadd lt!338857 lt!338857) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760569 () Bool)

(assert (=> b!760569 (= e!423966 (Intermediate!7747 true index!1321 x!1131))))

(assert (= (and d!100513 c!83388) b!760569))

(assert (= (and d!100513 (not c!83388)) b!760568))

(assert (= (and b!760568 c!83387) b!760567))

(assert (= (and b!760568 (not c!83387)) b!760562))

(assert (= (and d!100513 c!83389) b!760564))

(assert (= (and d!100513 (not c!83389)) b!760563))

(assert (= (and b!760563 res!514555) b!760565))

(assert (= (and b!760565 (not res!514553)) b!760561))

(assert (= (and b!760561 (not res!514554)) b!760566))

(declare-fun m!707669 () Bool)

(assert (=> b!760562 m!707669))

(assert (=> b!760562 m!707669))

(declare-fun m!707671 () Bool)

(assert (=> b!760562 m!707671))

(declare-fun m!707673 () Bool)

(assert (=> d!100513 m!707673))

(assert (=> d!100513 m!707539))

(declare-fun m!707675 () Bool)

(assert (=> b!760566 m!707675))

(assert (=> b!760561 m!707675))

(assert (=> b!760565 m!707675))

(assert (=> b!760330 d!100513))

(declare-fun b!760570 () Bool)

(declare-fun lt!338860 () SeekEntryResult!7747)

(assert (=> b!760570 (and (bvsge (index!33358 lt!338860) #b00000000000000000000000000000000) (bvslt (index!33358 lt!338860) (size!20568 lt!338769)))))

(declare-fun res!514557 () Bool)

(assert (=> b!760570 (= res!514557 (= (select (arr!20147 lt!338769) (index!33358 lt!338860)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423974 () Bool)

(assert (=> b!760570 (=> res!514557 e!423974)))

(declare-fun b!760571 () Bool)

(declare-fun e!423972 () SeekEntryResult!7747)

(assert (=> b!760571 (= e!423972 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!338771 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!338771 lt!338769 mask!3328))))

(declare-fun b!760572 () Bool)

(declare-fun e!423970 () Bool)

(declare-fun e!423973 () Bool)

(assert (=> b!760572 (= e!423970 e!423973)))

(declare-fun res!514558 () Bool)

(assert (=> b!760572 (= res!514558 (and (is-Intermediate!7747 lt!338860) (not (undefined!8559 lt!338860)) (bvslt (x!64242 lt!338860) #b01111111111111111111111111111110) (bvsge (x!64242 lt!338860) #b00000000000000000000000000000000) (bvsge (x!64242 lt!338860) #b00000000000000000000000000000000)))))

(assert (=> b!760572 (=> (not res!514558) (not e!423973))))

(declare-fun b!760574 () Bool)

(assert (=> b!760574 (and (bvsge (index!33358 lt!338860) #b00000000000000000000000000000000) (bvslt (index!33358 lt!338860) (size!20568 lt!338769)))))

(declare-fun res!514556 () Bool)

(assert (=> b!760574 (= res!514556 (= (select (arr!20147 lt!338769) (index!33358 lt!338860)) lt!338771))))

(assert (=> b!760574 (=> res!514556 e!423974)))

(assert (=> b!760574 (= e!423973 e!423974)))

(declare-fun b!760575 () Bool)

(assert (=> b!760575 (and (bvsge (index!33358 lt!338860) #b00000000000000000000000000000000) (bvslt (index!33358 lt!338860) (size!20568 lt!338769)))))

(assert (=> b!760575 (= e!423974 (= (select (arr!20147 lt!338769) (index!33358 lt!338860)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760576 () Bool)

(assert (=> b!760576 (= e!423972 (Intermediate!7747 false (toIndex!0 lt!338771 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760573 () Bool)

(assert (=> b!760573 (= e!423970 (bvsge (x!64242 lt!338860) #b01111111111111111111111111111110))))

(declare-fun d!100531 () Bool)

(assert (=> d!100531 e!423970))

(declare-fun c!83392 () Bool)

(assert (=> d!100531 (= c!83392 (and (is-Intermediate!7747 lt!338860) (undefined!8559 lt!338860)))))

(declare-fun e!423971 () SeekEntryResult!7747)

(assert (=> d!100531 (= lt!338860 e!423971)))

(declare-fun c!83391 () Bool)

(assert (=> d!100531 (= c!83391 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!338859 () (_ BitVec 64))

(assert (=> d!100531 (= lt!338859 (select (arr!20147 lt!338769) (toIndex!0 lt!338771 mask!3328)))))

(assert (=> d!100531 (validMask!0 mask!3328)))

(assert (=> d!100531 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338771 mask!3328) lt!338771 lt!338769 mask!3328) lt!338860)))

(declare-fun b!760577 () Bool)

(assert (=> b!760577 (= e!423971 e!423972)))

(declare-fun c!83390 () Bool)

(assert (=> b!760577 (= c!83390 (or (= lt!338859 lt!338771) (= (bvadd lt!338859 lt!338859) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760578 () Bool)

(assert (=> b!760578 (= e!423971 (Intermediate!7747 true (toIndex!0 lt!338771 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!100531 c!83391) b!760578))

(assert (= (and d!100531 (not c!83391)) b!760577))

(assert (= (and b!760577 c!83390) b!760576))

(assert (= (and b!760577 (not c!83390)) b!760571))

(assert (= (and d!100531 c!83392) b!760573))

(assert (= (and d!100531 (not c!83392)) b!760572))

(assert (= (and b!760572 res!514558) b!760574))

(assert (= (and b!760574 (not res!514556)) b!760570))

(assert (= (and b!760570 (not res!514557)) b!760575))

(assert (=> b!760571 m!707517))

(declare-fun m!707677 () Bool)

(assert (=> b!760571 m!707677))

(assert (=> b!760571 m!707677))

(declare-fun m!707679 () Bool)

(assert (=> b!760571 m!707679))

(assert (=> d!100531 m!707517))

(declare-fun m!707681 () Bool)

(assert (=> d!100531 m!707681))

(assert (=> d!100531 m!707539))

(declare-fun m!707683 () Bool)

(assert (=> b!760575 m!707683))

(assert (=> b!760570 m!707683))

(assert (=> b!760574 m!707683))

(assert (=> b!760330 d!100531))

(declare-fun d!100533 () Bool)

(declare-fun lt!338868 () (_ BitVec 32))

(declare-fun lt!338867 () (_ BitVec 32))

(assert (=> d!100533 (= lt!338868 (bvmul (bvxor lt!338867 (bvlshr lt!338867 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100533 (= lt!338867 ((_ extract 31 0) (bvand (bvxor lt!338771 (bvlshr lt!338771 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100533 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514565 (let ((h!15223 ((_ extract 31 0) (bvand (bvxor lt!338771 (bvlshr lt!338771 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64250 (bvmul (bvxor h!15223 (bvlshr h!15223 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64250 (bvlshr x!64250 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514565 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514565 #b00000000000000000000000000000000))))))

(assert (=> d!100533 (= (toIndex!0 lt!338771 mask!3328) (bvand (bvxor lt!338868 (bvlshr lt!338868 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!760330 d!100533))

(declare-fun d!100539 () Bool)

(assert (=> d!100539 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760340 d!100539))

(declare-fun b!760591 () Bool)

(declare-fun lt!338870 () SeekEntryResult!7747)

(assert (=> b!760591 (and (bvsge (index!33358 lt!338870) #b00000000000000000000000000000000) (bvslt (index!33358 lt!338870) (size!20568 a!3186)))))

(declare-fun res!514567 () Bool)

(assert (=> b!760591 (= res!514567 (= (select (arr!20147 a!3186) (index!33358 lt!338870)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423988 () Bool)

(assert (=> b!760591 (=> res!514567 e!423988)))

(declare-fun e!423986 () SeekEntryResult!7747)

(declare-fun b!760592 () Bool)

(assert (=> b!760592 (= e!423986 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20147 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760593 () Bool)

(declare-fun e!423984 () Bool)

(declare-fun e!423987 () Bool)

(assert (=> b!760593 (= e!423984 e!423987)))

(declare-fun res!514568 () Bool)

(assert (=> b!760593 (= res!514568 (and (is-Intermediate!7747 lt!338870) (not (undefined!8559 lt!338870)) (bvslt (x!64242 lt!338870) #b01111111111111111111111111111110) (bvsge (x!64242 lt!338870) #b00000000000000000000000000000000) (bvsge (x!64242 lt!338870) #b00000000000000000000000000000000)))))

(assert (=> b!760593 (=> (not res!514568) (not e!423987))))

(declare-fun b!760595 () Bool)

(assert (=> b!760595 (and (bvsge (index!33358 lt!338870) #b00000000000000000000000000000000) (bvslt (index!33358 lt!338870) (size!20568 a!3186)))))

(declare-fun res!514566 () Bool)

(assert (=> b!760595 (= res!514566 (= (select (arr!20147 a!3186) (index!33358 lt!338870)) (select (arr!20147 a!3186) j!159)))))

(assert (=> b!760595 (=> res!514566 e!423988)))

(assert (=> b!760595 (= e!423987 e!423988)))

(declare-fun b!760596 () Bool)

(assert (=> b!760596 (and (bvsge (index!33358 lt!338870) #b00000000000000000000000000000000) (bvslt (index!33358 lt!338870) (size!20568 a!3186)))))

(assert (=> b!760596 (= e!423988 (= (select (arr!20147 a!3186) (index!33358 lt!338870)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760597 () Bool)

(assert (=> b!760597 (= e!423986 (Intermediate!7747 false (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!760594 () Bool)

(assert (=> b!760594 (= e!423984 (bvsge (x!64242 lt!338870) #b01111111111111111111111111111110))))

(declare-fun d!100541 () Bool)

(assert (=> d!100541 e!423984))

(declare-fun c!83398 () Bool)

(assert (=> d!100541 (= c!83398 (and (is-Intermediate!7747 lt!338870) (undefined!8559 lt!338870)))))

(declare-fun e!423985 () SeekEntryResult!7747)

(assert (=> d!100541 (= lt!338870 e!423985)))

(declare-fun c!83397 () Bool)

(assert (=> d!100541 (= c!83397 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!338869 () (_ BitVec 64))

(assert (=> d!100541 (= lt!338869 (select (arr!20147 a!3186) (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328)))))

(assert (=> d!100541 (validMask!0 mask!3328)))

(assert (=> d!100541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328) (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338870)))

(declare-fun b!760598 () Bool)

(assert (=> b!760598 (= e!423985 e!423986)))

(declare-fun c!83396 () Bool)

(assert (=> b!760598 (= c!83396 (or (= lt!338869 (select (arr!20147 a!3186) j!159)) (= (bvadd lt!338869 lt!338869) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760599 () Bool)

(assert (=> b!760599 (= e!423985 (Intermediate!7747 true (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!100541 c!83397) b!760599))

(assert (= (and d!100541 (not c!83397)) b!760598))

(assert (= (and b!760598 c!83396) b!760597))

(assert (= (and b!760598 (not c!83396)) b!760592))

(assert (= (and d!100541 c!83398) b!760594))

(assert (= (and d!100541 (not c!83398)) b!760593))

(assert (= (and b!760593 res!514568) b!760595))

(assert (= (and b!760595 (not res!514566)) b!760591))

(assert (= (and b!760591 (not res!514567)) b!760596))

(assert (=> b!760592 m!707543))

(declare-fun m!707695 () Bool)

(assert (=> b!760592 m!707695))

(assert (=> b!760592 m!707695))

(assert (=> b!760592 m!707505))

(declare-fun m!707697 () Bool)

(assert (=> b!760592 m!707697))

(assert (=> d!100541 m!707543))

(declare-fun m!707699 () Bool)

(assert (=> d!100541 m!707699))

(assert (=> d!100541 m!707539))

(declare-fun m!707701 () Bool)

(assert (=> b!760596 m!707701))

(assert (=> b!760591 m!707701))

(assert (=> b!760595 m!707701))

(assert (=> b!760333 d!100541))

(declare-fun d!100543 () Bool)

(declare-fun lt!338872 () (_ BitVec 32))

(declare-fun lt!338871 () (_ BitVec 32))

(assert (=> d!100543 (= lt!338872 (bvmul (bvxor lt!338871 (bvlshr lt!338871 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100543 (= lt!338871 ((_ extract 31 0) (bvand (bvxor (select (arr!20147 a!3186) j!159) (bvlshr (select (arr!20147 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100543 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514565 (let ((h!15223 ((_ extract 31 0) (bvand (bvxor (select (arr!20147 a!3186) j!159) (bvlshr (select (arr!20147 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64250 (bvmul (bvxor h!15223 (bvlshr h!15223 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64250 (bvlshr x!64250 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514565 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514565 #b00000000000000000000000000000000))))))

(assert (=> d!100543 (= (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328) (bvand (bvxor lt!338872 (bvlshr lt!338872 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!760333 d!100543))

(declare-fun d!100545 () Bool)

(declare-fun lt!338875 () SeekEntryResult!7747)

(assert (=> d!100545 (and (or (is-Undefined!7747 lt!338875) (not (is-Found!7747 lt!338875)) (and (bvsge (index!33357 lt!338875) #b00000000000000000000000000000000) (bvslt (index!33357 lt!338875) (size!20568 a!3186)))) (or (is-Undefined!7747 lt!338875) (is-Found!7747 lt!338875) (not (is-MissingZero!7747 lt!338875)) (and (bvsge (index!33356 lt!338875) #b00000000000000000000000000000000) (bvslt (index!33356 lt!338875) (size!20568 a!3186)))) (or (is-Undefined!7747 lt!338875) (is-Found!7747 lt!338875) (is-MissingZero!7747 lt!338875) (not (is-MissingVacant!7747 lt!338875)) (and (bvsge (index!33359 lt!338875) #b00000000000000000000000000000000) (bvslt (index!33359 lt!338875) (size!20568 a!3186)))) (or (is-Undefined!7747 lt!338875) (ite (is-Found!7747 lt!338875) (= (select (arr!20147 a!3186) (index!33357 lt!338875)) (select (arr!20147 a!3186) j!159)) (ite (is-MissingZero!7747 lt!338875) (= (select (arr!20147 a!3186) (index!33356 lt!338875)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7747 lt!338875) (= (select (arr!20147 a!3186) (index!33359 lt!338875)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!423990 () SeekEntryResult!7747)

(assert (=> d!100545 (= lt!338875 e!423990)))

(declare-fun c!83399 () Bool)

(declare-fun lt!338874 () SeekEntryResult!7747)

(assert (=> d!100545 (= c!83399 (and (is-Intermediate!7747 lt!338874) (undefined!8559 lt!338874)))))

(assert (=> d!100545 (= lt!338874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20147 a!3186) j!159) mask!3328) (select (arr!20147 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100545 (validMask!0 mask!3328)))

(assert (=> d!100545 (= (seekEntryOrOpen!0 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338875)))

(declare-fun b!760600 () Bool)

(declare-fun e!423991 () SeekEntryResult!7747)

(assert (=> b!760600 (= e!423991 (seekKeyOrZeroReturnVacant!0 (x!64242 lt!338874) (index!33358 lt!338874) (index!33358 lt!338874) (select (arr!20147 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760601 () Bool)

(assert (=> b!760601 (= e!423991 (MissingZero!7747 (index!33358 lt!338874)))))

(declare-fun b!760602 () Bool)

(declare-fun c!83400 () Bool)

(declare-fun lt!338873 () (_ BitVec 64))

(assert (=> b!760602 (= c!83400 (= lt!338873 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423989 () SeekEntryResult!7747)

(assert (=> b!760602 (= e!423989 e!423991)))

(declare-fun b!760603 () Bool)

(assert (=> b!760603 (= e!423990 e!423989)))

(assert (=> b!760603 (= lt!338873 (select (arr!20147 a!3186) (index!33358 lt!338874)))))

(declare-fun c!83401 () Bool)

(assert (=> b!760603 (= c!83401 (= lt!338873 (select (arr!20147 a!3186) j!159)))))

(declare-fun b!760604 () Bool)

(assert (=> b!760604 (= e!423989 (Found!7747 (index!33358 lt!338874)))))

(declare-fun b!760605 () Bool)

(assert (=> b!760605 (= e!423990 Undefined!7747)))

(assert (= (and d!100545 c!83399) b!760605))

(assert (= (and d!100545 (not c!83399)) b!760603))

(assert (= (and b!760603 c!83401) b!760604))

(assert (= (and b!760603 (not c!83401)) b!760602))

(assert (= (and b!760602 c!83400) b!760601))

(assert (= (and b!760602 (not c!83400)) b!760600))

(declare-fun m!707703 () Bool)

(assert (=> d!100545 m!707703))

(assert (=> d!100545 m!707539))

(declare-fun m!707705 () Bool)

(assert (=> d!100545 m!707705))

(assert (=> d!100545 m!707505))

(assert (=> d!100545 m!707543))

(assert (=> d!100545 m!707543))

(assert (=> d!100545 m!707505))

(assert (=> d!100545 m!707545))

(declare-fun m!707707 () Bool)

(assert (=> d!100545 m!707707))

(assert (=> b!760600 m!707505))

(declare-fun m!707709 () Bool)

(assert (=> b!760600 m!707709))

(declare-fun m!707711 () Bool)

(assert (=> b!760603 m!707711))

(assert (=> b!760344 d!100545))

(declare-fun b!760606 () Bool)

(declare-fun lt!338877 () SeekEntryResult!7747)

(assert (=> b!760606 (and (bvsge (index!33358 lt!338877) #b00000000000000000000000000000000) (bvslt (index!33358 lt!338877) (size!20568 a!3186)))))

(declare-fun res!514570 () Bool)

(assert (=> b!760606 (= res!514570 (= (select (arr!20147 a!3186) (index!33358 lt!338877)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!423996 () Bool)

(assert (=> b!760606 (=> res!514570 e!423996)))

(declare-fun e!423994 () SeekEntryResult!7747)

(declare-fun b!760607 () Bool)

(assert (=> b!760607 (= e!423994 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20147 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760608 () Bool)

(declare-fun e!423992 () Bool)

(declare-fun e!423995 () Bool)

(assert (=> b!760608 (= e!423992 e!423995)))

(declare-fun res!514571 () Bool)

(assert (=> b!760608 (= res!514571 (and (is-Intermediate!7747 lt!338877) (not (undefined!8559 lt!338877)) (bvslt (x!64242 lt!338877) #b01111111111111111111111111111110) (bvsge (x!64242 lt!338877) #b00000000000000000000000000000000) (bvsge (x!64242 lt!338877) x!1131)))))

(assert (=> b!760608 (=> (not res!514571) (not e!423995))))

(declare-fun b!760610 () Bool)

(assert (=> b!760610 (and (bvsge (index!33358 lt!338877) #b00000000000000000000000000000000) (bvslt (index!33358 lt!338877) (size!20568 a!3186)))))

(declare-fun res!514569 () Bool)

(assert (=> b!760610 (= res!514569 (= (select (arr!20147 a!3186) (index!33358 lt!338877)) (select (arr!20147 a!3186) j!159)))))

(assert (=> b!760610 (=> res!514569 e!423996)))

(assert (=> b!760610 (= e!423995 e!423996)))

(declare-fun b!760611 () Bool)

(assert (=> b!760611 (and (bvsge (index!33358 lt!338877) #b00000000000000000000000000000000) (bvslt (index!33358 lt!338877) (size!20568 a!3186)))))

(assert (=> b!760611 (= e!423996 (= (select (arr!20147 a!3186) (index!33358 lt!338877)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!760612 () Bool)

(assert (=> b!760612 (= e!423994 (Intermediate!7747 false index!1321 x!1131))))

(declare-fun b!760609 () Bool)

(assert (=> b!760609 (= e!423992 (bvsge (x!64242 lt!338877) #b01111111111111111111111111111110))))

(declare-fun d!100547 () Bool)

(assert (=> d!100547 e!423992))

(declare-fun c!83404 () Bool)

(assert (=> d!100547 (= c!83404 (and (is-Intermediate!7747 lt!338877) (undefined!8559 lt!338877)))))

(declare-fun e!423993 () SeekEntryResult!7747)

(assert (=> d!100547 (= lt!338877 e!423993)))

(declare-fun c!83403 () Bool)

(assert (=> d!100547 (= c!83403 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!338876 () (_ BitVec 64))

(assert (=> d!100547 (= lt!338876 (select (arr!20147 a!3186) index!1321))))

(assert (=> d!100547 (validMask!0 mask!3328)))

(assert (=> d!100547 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338877)))

(declare-fun b!760613 () Bool)

(assert (=> b!760613 (= e!423993 e!423994)))

(declare-fun c!83402 () Bool)

(assert (=> b!760613 (= c!83402 (or (= lt!338876 (select (arr!20147 a!3186) j!159)) (= (bvadd lt!338876 lt!338876) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!760614 () Bool)

(assert (=> b!760614 (= e!423993 (Intermediate!7747 true index!1321 x!1131))))

(assert (= (and d!100547 c!83403) b!760614))

(assert (= (and d!100547 (not c!83403)) b!760613))

(assert (= (and b!760613 c!83402) b!760612))

(assert (= (and b!760613 (not c!83402)) b!760607))

(assert (= (and d!100547 c!83404) b!760609))

(assert (= (and d!100547 (not c!83404)) b!760608))

(assert (= (and b!760608 res!514571) b!760610))

(assert (= (and b!760610 (not res!514569)) b!760606))

(assert (= (and b!760606 (not res!514570)) b!760611))

(assert (=> b!760607 m!707669))

(assert (=> b!760607 m!707669))

(assert (=> b!760607 m!707505))

(declare-fun m!707713 () Bool)

(assert (=> b!760607 m!707713))

(declare-fun m!707715 () Bool)

(assert (=> d!100547 m!707715))

(assert (=> d!100547 m!707539))

(declare-fun m!707717 () Bool)

(assert (=> b!760611 m!707717))

(assert (=> b!760606 m!707717))

(assert (=> b!760610 m!707717))

(assert (=> b!760343 d!100547))

(declare-fun b!760652 () Bool)

(declare-fun e!424024 () Bool)

(declare-fun call!34946 () Bool)

(assert (=> b!760652 (= e!424024 call!34946)))

(declare-fun b!760653 () Bool)

(declare-fun e!424026 () Bool)

(assert (=> b!760653 (= e!424026 e!424024)))

(declare-fun c!83415 () Bool)

(assert (=> b!760653 (= c!83415 (validKeyInArray!0 (select (arr!20147 a!3186) j!159)))))

(declare-fun b!760654 () Bool)

(declare-fun e!424025 () Bool)

(assert (=> b!760654 (= e!424025 call!34946)))

(declare-fun bm!34943 () Bool)

(assert (=> bm!34943 (= call!34946 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760655 () Bool)

(assert (=> b!760655 (= e!424024 e!424025)))

(declare-fun lt!338894 () (_ BitVec 64))

(assert (=> b!760655 (= lt!338894 (select (arr!20147 a!3186) j!159))))

(declare-fun lt!338892 () Unit!26334)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42070 (_ BitVec 64) (_ BitVec 32)) Unit!26334)

(assert (=> b!760655 (= lt!338892 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338894 j!159))))

(assert (=> b!760655 (arrayContainsKey!0 a!3186 lt!338894 #b00000000000000000000000000000000)))

(declare-fun lt!338893 () Unit!26334)

(assert (=> b!760655 (= lt!338893 lt!338892)))

(declare-fun res!514589 () Bool)

(assert (=> b!760655 (= res!514589 (= (seekEntryOrOpen!0 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) (Found!7747 j!159)))))

(assert (=> b!760655 (=> (not res!514589) (not e!424025))))

(declare-fun d!100549 () Bool)

(declare-fun res!514590 () Bool)

(assert (=> d!100549 (=> res!514590 e!424026)))

(assert (=> d!100549 (= res!514590 (bvsge j!159 (size!20568 a!3186)))))

(assert (=> d!100549 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!424026)))

(assert (= (and d!100549 (not res!514590)) b!760653))

(assert (= (and b!760653 c!83415) b!760655))

(assert (= (and b!760653 (not c!83415)) b!760652))

(assert (= (and b!760655 res!514589) b!760654))

(assert (= (or b!760654 b!760652) bm!34943))

(assert (=> b!760653 m!707505))

(assert (=> b!760653 m!707505))

(assert (=> b!760653 m!707507))

(declare-fun m!707723 () Bool)

(assert (=> bm!34943 m!707723))

(assert (=> b!760655 m!707505))

(declare-fun m!707729 () Bool)

(assert (=> b!760655 m!707729))

(declare-fun m!707731 () Bool)

(assert (=> b!760655 m!707731))

(assert (=> b!760655 m!707505))

(assert (=> b!760655 m!707509))

(assert (=> b!760332 d!100549))

(declare-fun d!100561 () Bool)

(assert (=> d!100561 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338903 () Unit!26334)

(declare-fun choose!38 (array!42070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26334)

(assert (=> d!100561 (= lt!338903 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100561 (validMask!0 mask!3328)))

(assert (=> d!100561 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!338903)))

(declare-fun bs!21385 () Bool)

(assert (= bs!21385 d!100561))

(assert (=> bs!21385 m!707547))

(declare-fun m!707749 () Bool)

(assert (=> bs!21385 m!707749))

(assert (=> bs!21385 m!707539))

(assert (=> b!760332 d!100561))

(declare-fun b!760664 () Bool)

(declare-fun e!424033 () Bool)

(declare-fun call!34949 () Bool)

(assert (=> b!760664 (= e!424033 call!34949)))

(declare-fun b!760665 () Bool)

(declare-fun e!424035 () Bool)

(assert (=> b!760665 (= e!424035 e!424033)))

(declare-fun c!83418 () Bool)

(assert (=> b!760665 (= c!83418 (validKeyInArray!0 (select (arr!20147 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760666 () Bool)

(declare-fun e!424034 () Bool)

(assert (=> b!760666 (= e!424034 call!34949)))

(declare-fun bm!34946 () Bool)

(assert (=> bm!34946 (= call!34949 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!760667 () Bool)

(assert (=> b!760667 (= e!424033 e!424034)))

(declare-fun lt!338908 () (_ BitVec 64))

(assert (=> b!760667 (= lt!338908 (select (arr!20147 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!338906 () Unit!26334)

(assert (=> b!760667 (= lt!338906 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!338908 #b00000000000000000000000000000000))))

(assert (=> b!760667 (arrayContainsKey!0 a!3186 lt!338908 #b00000000000000000000000000000000)))

(declare-fun lt!338907 () Unit!26334)

(assert (=> b!760667 (= lt!338907 lt!338906)))

(declare-fun res!514595 () Bool)

(assert (=> b!760667 (= res!514595 (= (seekEntryOrOpen!0 (select (arr!20147 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7747 #b00000000000000000000000000000000)))))

(assert (=> b!760667 (=> (not res!514595) (not e!424034))))

(declare-fun d!100569 () Bool)

(declare-fun res!514596 () Bool)

(assert (=> d!100569 (=> res!514596 e!424035)))

(assert (=> d!100569 (= res!514596 (bvsge #b00000000000000000000000000000000 (size!20568 a!3186)))))

(assert (=> d!100569 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!424035)))

(assert (= (and d!100569 (not res!514596)) b!760665))

(assert (= (and b!760665 c!83418) b!760667))

(assert (= (and b!760665 (not c!83418)) b!760664))

(assert (= (and b!760667 res!514595) b!760666))

(assert (= (or b!760666 b!760664) bm!34946))

(declare-fun m!707751 () Bool)

(assert (=> b!760665 m!707751))

(assert (=> b!760665 m!707751))

(declare-fun m!707753 () Bool)

(assert (=> b!760665 m!707753))

(declare-fun m!707755 () Bool)

(assert (=> bm!34946 m!707755))

(assert (=> b!760667 m!707751))

(declare-fun m!707757 () Bool)

(assert (=> b!760667 m!707757))

(declare-fun m!707761 () Bool)

(assert (=> b!760667 m!707761))

(assert (=> b!760667 m!707751))

(declare-fun m!707763 () Bool)

(assert (=> b!760667 m!707763))

(assert (=> b!760336 d!100569))

(declare-fun b!760689 () Bool)

(declare-fun e!424048 () SeekEntryResult!7747)

(assert (=> b!760689 (= e!424048 (MissingVacant!7747 resIntermediateIndex!5))))

(declare-fun b!760690 () Bool)

(declare-fun e!424047 () SeekEntryResult!7747)

(assert (=> b!760690 (= e!424047 (Found!7747 index!1321))))

(declare-fun b!760691 () Bool)

(assert (=> b!760691 (= e!424048 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20147 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760692 () Bool)

(declare-fun c!83429 () Bool)

(declare-fun lt!338920 () (_ BitVec 64))

(assert (=> b!760692 (= c!83429 (= lt!338920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760692 (= e!424047 e!424048)))

(declare-fun b!760693 () Bool)

(declare-fun e!424049 () SeekEntryResult!7747)

(assert (=> b!760693 (= e!424049 e!424047)))

(declare-fun c!83428 () Bool)

(assert (=> b!760693 (= c!83428 (= lt!338920 (select (arr!20147 a!3186) j!159)))))

(declare-fun lt!338919 () SeekEntryResult!7747)

(declare-fun d!100571 () Bool)

(assert (=> d!100571 (and (or (is-Undefined!7747 lt!338919) (not (is-Found!7747 lt!338919)) (and (bvsge (index!33357 lt!338919) #b00000000000000000000000000000000) (bvslt (index!33357 lt!338919) (size!20568 a!3186)))) (or (is-Undefined!7747 lt!338919) (is-Found!7747 lt!338919) (not (is-MissingVacant!7747 lt!338919)) (not (= (index!33359 lt!338919) resIntermediateIndex!5)) (and (bvsge (index!33359 lt!338919) #b00000000000000000000000000000000) (bvslt (index!33359 lt!338919) (size!20568 a!3186)))) (or (is-Undefined!7747 lt!338919) (ite (is-Found!7747 lt!338919) (= (select (arr!20147 a!3186) (index!33357 lt!338919)) (select (arr!20147 a!3186) j!159)) (and (is-MissingVacant!7747 lt!338919) (= (index!33359 lt!338919) resIntermediateIndex!5) (= (select (arr!20147 a!3186) (index!33359 lt!338919)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100571 (= lt!338919 e!424049)))

(declare-fun c!83430 () Bool)

(assert (=> d!100571 (= c!83430 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100571 (= lt!338920 (select (arr!20147 a!3186) index!1321))))

(assert (=> d!100571 (validMask!0 mask!3328)))

(assert (=> d!100571 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338919)))

(declare-fun b!760694 () Bool)

(assert (=> b!760694 (= e!424049 Undefined!7747)))

(assert (= (and d!100571 c!83430) b!760694))

(assert (= (and d!100571 (not c!83430)) b!760693))

(assert (= (and b!760693 c!83428) b!760690))

(assert (= (and b!760693 (not c!83428)) b!760692))

(assert (= (and b!760692 c!83429) b!760689))

(assert (= (and b!760692 (not c!83429)) b!760691))

(assert (=> b!760691 m!707669))

(assert (=> b!760691 m!707669))

(assert (=> b!760691 m!707505))

(declare-fun m!707773 () Bool)

(assert (=> b!760691 m!707773))

(declare-fun m!707775 () Bool)

(assert (=> d!100571 m!707775))

(declare-fun m!707777 () Bool)

(assert (=> d!100571 m!707777))

(assert (=> d!100571 m!707715))

(assert (=> d!100571 m!707539))

(assert (=> b!760335 d!100571))

(declare-fun d!100579 () Bool)

(assert (=> d!100579 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!65960 d!100579))

(declare-fun d!100591 () Bool)

(assert (=> d!100591 (= (array_inv!15943 a!3186) (bvsge (size!20568 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!65960 d!100591))

(declare-fun d!100593 () Bool)

(declare-fun res!514612 () Bool)

(declare-fun e!424078 () Bool)

(assert (=> d!100593 (=> res!514612 e!424078)))

(assert (=> d!100593 (= res!514612 (= (select (arr!20147 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!100593 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!424078)))

(declare-fun b!760739 () Bool)

(declare-fun e!424079 () Bool)

(assert (=> b!760739 (= e!424078 e!424079)))

(declare-fun res!514613 () Bool)

(assert (=> b!760739 (=> (not res!514613) (not e!424079))))

(assert (=> b!760739 (= res!514613 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20568 a!3186)))))

(declare-fun b!760740 () Bool)

(assert (=> b!760740 (= e!424079 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100593 (not res!514612)) b!760739))

(assert (= (and b!760739 res!514613) b!760740))

(assert (=> d!100593 m!707751))

(declare-fun m!707819 () Bool)

(assert (=> b!760740 m!707819))

(assert (=> b!760339 d!100593))

(declare-fun b!760751 () Bool)

(declare-fun e!424089 () Bool)

(declare-fun contains!4068 (List!14149 (_ BitVec 64)) Bool)

(assert (=> b!760751 (= e!424089 (contains!4068 Nil!14146 (select (arr!20147 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760752 () Bool)

(declare-fun e!424091 () Bool)

(declare-fun call!34953 () Bool)

(assert (=> b!760752 (= e!424091 call!34953)))

(declare-fun b!760753 () Bool)

(declare-fun e!424090 () Bool)

(assert (=> b!760753 (= e!424090 e!424091)))

(declare-fun c!83449 () Bool)

(assert (=> b!760753 (= c!83449 (validKeyInArray!0 (select (arr!20147 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34950 () Bool)

(assert (=> bm!34950 (= call!34953 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83449 (Cons!14145 (select (arr!20147 a!3186) #b00000000000000000000000000000000) Nil!14146) Nil!14146)))))

(declare-fun b!760755 () Bool)

(declare-fun e!424088 () Bool)

(assert (=> b!760755 (= e!424088 e!424090)))

(declare-fun res!514622 () Bool)

(assert (=> b!760755 (=> (not res!514622) (not e!424090))))

(assert (=> b!760755 (= res!514622 (not e!424089))))

(declare-fun res!514620 () Bool)

(assert (=> b!760755 (=> (not res!514620) (not e!424089))))

(assert (=> b!760755 (= res!514620 (validKeyInArray!0 (select (arr!20147 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!760754 () Bool)

(assert (=> b!760754 (= e!424091 call!34953)))

(declare-fun d!100595 () Bool)

(declare-fun res!514621 () Bool)

(assert (=> d!100595 (=> res!514621 e!424088)))

(assert (=> d!100595 (= res!514621 (bvsge #b00000000000000000000000000000000 (size!20568 a!3186)))))

(assert (=> d!100595 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14146) e!424088)))

(assert (= (and d!100595 (not res!514621)) b!760755))

(assert (= (and b!760755 res!514620) b!760751))

(assert (= (and b!760755 res!514622) b!760753))

(assert (= (and b!760753 c!83449) b!760752))

(assert (= (and b!760753 (not c!83449)) b!760754))

(assert (= (or b!760752 b!760754) bm!34950))

(assert (=> b!760751 m!707751))

(assert (=> b!760751 m!707751))

(declare-fun m!707821 () Bool)

(assert (=> b!760751 m!707821))

(assert (=> b!760753 m!707751))

(assert (=> b!760753 m!707751))

(assert (=> b!760753 m!707753))

(assert (=> bm!34950 m!707751))

(declare-fun m!707823 () Bool)

(assert (=> bm!34950 m!707823))

(assert (=> b!760755 m!707751))

(assert (=> b!760755 m!707751))

(assert (=> b!760755 m!707753))

(assert (=> b!760328 d!100595))

(declare-fun d!100597 () Bool)

(assert (=> d!100597 (= (validKeyInArray!0 (select (arr!20147 a!3186) j!159)) (and (not (= (select (arr!20147 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20147 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760338 d!100597))

(declare-fun b!760756 () Bool)

(declare-fun e!424093 () SeekEntryResult!7747)

(assert (=> b!760756 (= e!424093 (MissingVacant!7747 resIntermediateIndex!5))))

(declare-fun b!760757 () Bool)

(declare-fun e!424092 () SeekEntryResult!7747)

(assert (=> b!760757 (= e!424092 (Found!7747 resIntermediateIndex!5))))

(declare-fun b!760758 () Bool)

(assert (=> b!760758 (= e!424093 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20147 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!760759 () Bool)

(declare-fun c!83451 () Bool)

(declare-fun lt!338939 () (_ BitVec 64))

(assert (=> b!760759 (= c!83451 (= lt!338939 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!760759 (= e!424092 e!424093)))

(declare-fun b!760760 () Bool)

(declare-fun e!424094 () SeekEntryResult!7747)

(assert (=> b!760760 (= e!424094 e!424092)))

(declare-fun c!83450 () Bool)

(assert (=> b!760760 (= c!83450 (= lt!338939 (select (arr!20147 a!3186) j!159)))))

(declare-fun lt!338938 () SeekEntryResult!7747)

(declare-fun d!100599 () Bool)

(assert (=> d!100599 (and (or (is-Undefined!7747 lt!338938) (not (is-Found!7747 lt!338938)) (and (bvsge (index!33357 lt!338938) #b00000000000000000000000000000000) (bvslt (index!33357 lt!338938) (size!20568 a!3186)))) (or (is-Undefined!7747 lt!338938) (is-Found!7747 lt!338938) (not (is-MissingVacant!7747 lt!338938)) (not (= (index!33359 lt!338938) resIntermediateIndex!5)) (and (bvsge (index!33359 lt!338938) #b00000000000000000000000000000000) (bvslt (index!33359 lt!338938) (size!20568 a!3186)))) (or (is-Undefined!7747 lt!338938) (ite (is-Found!7747 lt!338938) (= (select (arr!20147 a!3186) (index!33357 lt!338938)) (select (arr!20147 a!3186) j!159)) (and (is-MissingVacant!7747 lt!338938) (= (index!33359 lt!338938) resIntermediateIndex!5) (= (select (arr!20147 a!3186) (index!33359 lt!338938)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100599 (= lt!338938 e!424094)))

(declare-fun c!83452 () Bool)

(assert (=> d!100599 (= c!83452 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!100599 (= lt!338939 (select (arr!20147 a!3186) resIntermediateIndex!5))))

(assert (=> d!100599 (validMask!0 mask!3328)))

(assert (=> d!100599 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20147 a!3186) j!159) a!3186 mask!3328) lt!338938)))

(declare-fun b!760761 () Bool)

(assert (=> b!760761 (= e!424094 Undefined!7747)))

(assert (= (and d!100599 c!83452) b!760761))

(assert (= (and d!100599 (not c!83452)) b!760760))

(assert (= (and b!760760 c!83450) b!760757))

(assert (= (and b!760760 (not c!83450)) b!760759))

(assert (= (and b!760759 c!83451) b!760756))

(assert (= (and b!760759 (not c!83451)) b!760758))

(declare-fun m!707825 () Bool)

(assert (=> b!760758 m!707825))

(assert (=> b!760758 m!707825))

(assert (=> b!760758 m!707505))

(declare-fun m!707827 () Bool)

(assert (=> b!760758 m!707827))

(declare-fun m!707829 () Bool)

(assert (=> d!100599 m!707829))

(declare-fun m!707831 () Bool)

(assert (=> d!100599 m!707831))

(assert (=> d!100599 m!707527))

(assert (=> d!100599 m!707539))

(assert (=> b!760337 d!100599))

(push 1)

(assert (not bm!34946))

(assert (not d!100599))

(assert (not d!100547))

(assert (not b!760665))

(assert (not b!760653))

(assert (not b!760600))

(assert (not b!760592))

(assert (not d!100545))

(assert (not b!760755))

(assert (not d!100531))

(assert (not b!760667))

(assert (not b!760691))

(assert (not d!100541))

(assert (not d!100513))

(assert (not d!100561))

(assert (not d!100499))

(assert (not bm!34950))

(assert (not b!760562))

(assert (not d!100571))

(assert (not b!760758))

(assert (not bm!34943))

(assert (not b!760456))

(assert (not b!760751))

(assert (not b!760753))

(assert (not b!760607))

(assert (not b!760740))

(assert (not b!760655))

(assert (not b!760571))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

