; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66832 () Bool)

(assert start!66832)

(declare-fun b!771356 () Bool)

(declare-fun e!429417 () Bool)

(declare-fun e!429415 () Bool)

(assert (=> b!771356 (= e!429417 e!429415)))

(declare-fun res!521885 () Bool)

(assert (=> b!771356 (=> (not res!521885) (not e!429415))))

(declare-datatypes ((SeekEntryResult!7897 0))(
  ( (MissingZero!7897 (index!33956 (_ BitVec 32))) (Found!7897 (index!33957 (_ BitVec 32))) (Intermediate!7897 (undefined!8709 Bool) (index!33958 (_ BitVec 32)) (x!64876 (_ BitVec 32))) (Undefined!7897) (MissingVacant!7897 (index!33959 (_ BitVec 32))) )
))
(declare-fun lt!343404 () SeekEntryResult!7897)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!771356 (= res!521885 (or (= lt!343404 (MissingZero!7897 i!1173)) (= lt!343404 (MissingVacant!7897 i!1173))))))

(declare-datatypes ((array!42394 0))(
  ( (array!42395 (arr!20297 (Array (_ BitVec 32) (_ BitVec 64))) (size!20718 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42394)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42394 (_ BitVec 32)) SeekEntryResult!7897)

(assert (=> b!771356 (= lt!343404 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!771357 () Bool)

(declare-fun res!521895 () Bool)

(assert (=> b!771357 (=> (not res!521895) (not e!429417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771357 (= res!521895 (validKeyInArray!0 k!2102))))

(declare-fun b!771358 () Bool)

(declare-fun res!521897 () Bool)

(declare-fun e!429413 () Bool)

(assert (=> b!771358 (=> (not res!521897) (not e!429413))))

(declare-fun e!429419 () Bool)

(assert (=> b!771358 (= res!521897 e!429419)))

(declare-fun c!85132 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!771358 (= c!85132 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!771359 () Bool)

(declare-datatypes ((Unit!26602 0))(
  ( (Unit!26603) )
))
(declare-fun e!429412 () Unit!26602)

(declare-fun Unit!26604 () Unit!26602)

(assert (=> b!771359 (= e!429412 Unit!26604)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!343400 () SeekEntryResult!7897)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42394 (_ BitVec 32)) SeekEntryResult!7897)

(assert (=> b!771359 (= lt!343400 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20297 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343401 () (_ BitVec 32))

(assert (=> b!771359 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343401 resIntermediateIndex!5 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) (Found!7897 j!159))))

(declare-fun b!771360 () Bool)

(declare-fun e!429416 () Bool)

(declare-fun e!429418 () Bool)

(assert (=> b!771360 (= e!429416 (not e!429418))))

(declare-fun res!521888 () Bool)

(assert (=> b!771360 (=> res!521888 e!429418)))

(declare-fun lt!343399 () SeekEntryResult!7897)

(assert (=> b!771360 (= res!521888 (or (not (is-Intermediate!7897 lt!343399)) (bvsge x!1131 (x!64876 lt!343399))))))

(declare-fun e!429411 () Bool)

(assert (=> b!771360 e!429411))

(declare-fun res!521892 () Bool)

(assert (=> b!771360 (=> (not res!521892) (not e!429411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42394 (_ BitVec 32)) Bool)

(assert (=> b!771360 (= res!521892 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343407 () Unit!26602)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26602)

(assert (=> b!771360 (= lt!343407 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!771361 () Bool)

(assert (=> b!771361 (= e!429419 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) (Found!7897 j!159)))))

(declare-fun b!771362 () Bool)

(declare-fun res!521886 () Bool)

(assert (=> b!771362 (=> (not res!521886) (not e!429413))))

(assert (=> b!771362 (= res!521886 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20297 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771363 () Bool)

(assert (=> b!771363 (= e!429413 e!429416)))

(declare-fun res!521891 () Bool)

(assert (=> b!771363 (=> (not res!521891) (not e!429416))))

(declare-fun lt!343406 () SeekEntryResult!7897)

(assert (=> b!771363 (= res!521891 (= lt!343406 lt!343399))))

(declare-fun lt!343405 () array!42394)

(declare-fun lt!343409 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42394 (_ BitVec 32)) SeekEntryResult!7897)

(assert (=> b!771363 (= lt!343399 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343409 lt!343405 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771363 (= lt!343406 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343409 mask!3328) lt!343409 lt!343405 mask!3328))))

(assert (=> b!771363 (= lt!343409 (select (store (arr!20297 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!771363 (= lt!343405 (array!42395 (store (arr!20297 a!3186) i!1173 k!2102) (size!20718 a!3186)))))

(declare-fun res!521896 () Bool)

(assert (=> start!66832 (=> (not res!521896) (not e!429417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66832 (= res!521896 (validMask!0 mask!3328))))

(assert (=> start!66832 e!429417))

(assert (=> start!66832 true))

(declare-fun array_inv!16093 (array!42394) Bool)

(assert (=> start!66832 (array_inv!16093 a!3186)))

(declare-fun b!771364 () Bool)

(declare-fun res!521887 () Bool)

(assert (=> b!771364 (=> (not res!521887) (not e!429415))))

(assert (=> b!771364 (= res!521887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!771365 () Bool)

(declare-fun e!429414 () Bool)

(assert (=> b!771365 (= e!429411 e!429414)))

(declare-fun res!521893 () Bool)

(assert (=> b!771365 (=> (not res!521893) (not e!429414))))

(declare-fun lt!343408 () SeekEntryResult!7897)

(assert (=> b!771365 (= res!521893 (= (seekEntryOrOpen!0 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343408))))

(assert (=> b!771365 (= lt!343408 (Found!7897 j!159))))

(declare-fun b!771366 () Bool)

(declare-fun res!521894 () Bool)

(assert (=> b!771366 (=> (not res!521894) (not e!429415))))

(declare-datatypes ((List!14299 0))(
  ( (Nil!14296) (Cons!14295 (h!15394 (_ BitVec 64)) (t!20614 List!14299)) )
))
(declare-fun arrayNoDuplicates!0 (array!42394 (_ BitVec 32) List!14299) Bool)

(assert (=> b!771366 (= res!521894 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14296))))

(declare-fun lt!343402 () SeekEntryResult!7897)

(declare-fun b!771367 () Bool)

(assert (=> b!771367 (= e!429419 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343402))))

(declare-fun b!771368 () Bool)

(assert (=> b!771368 (= e!429414 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343408))))

(declare-fun b!771369 () Bool)

(assert (=> b!771369 (= e!429418 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!343403 () Unit!26602)

(assert (=> b!771369 (= lt!343403 e!429412)))

(declare-fun c!85131 () Bool)

(assert (=> b!771369 (= c!85131 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771369 (= lt!343401 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!771370 () Bool)

(declare-fun res!521900 () Bool)

(assert (=> b!771370 (=> (not res!521900) (not e!429415))))

(assert (=> b!771370 (= res!521900 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20718 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20718 a!3186))))))

(declare-fun b!771371 () Bool)

(assert (=> b!771371 (= e!429415 e!429413)))

(declare-fun res!521890 () Bool)

(assert (=> b!771371 (=> (not res!521890) (not e!429413))))

(assert (=> b!771371 (= res!521890 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20297 a!3186) j!159) mask!3328) (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343402))))

(assert (=> b!771371 (= lt!343402 (Intermediate!7897 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771372 () Bool)

(declare-fun Unit!26605 () Unit!26602)

(assert (=> b!771372 (= e!429412 Unit!26605)))

(assert (=> b!771372 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343401 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343402)))

(declare-fun b!771373 () Bool)

(declare-fun res!521889 () Bool)

(assert (=> b!771373 (=> (not res!521889) (not e!429417))))

(declare-fun arrayContainsKey!0 (array!42394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771373 (= res!521889 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!771374 () Bool)

(declare-fun res!521899 () Bool)

(assert (=> b!771374 (=> (not res!521899) (not e!429417))))

(assert (=> b!771374 (= res!521899 (validKeyInArray!0 (select (arr!20297 a!3186) j!159)))))

(declare-fun b!771375 () Bool)

(declare-fun res!521898 () Bool)

(assert (=> b!771375 (=> (not res!521898) (not e!429417))))

(assert (=> b!771375 (= res!521898 (and (= (size!20718 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20718 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20718 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66832 res!521896) b!771375))

(assert (= (and b!771375 res!521898) b!771374))

(assert (= (and b!771374 res!521899) b!771357))

(assert (= (and b!771357 res!521895) b!771373))

(assert (= (and b!771373 res!521889) b!771356))

(assert (= (and b!771356 res!521885) b!771364))

(assert (= (and b!771364 res!521887) b!771366))

(assert (= (and b!771366 res!521894) b!771370))

(assert (= (and b!771370 res!521900) b!771371))

(assert (= (and b!771371 res!521890) b!771362))

(assert (= (and b!771362 res!521886) b!771358))

(assert (= (and b!771358 c!85132) b!771367))

(assert (= (and b!771358 (not c!85132)) b!771361))

(assert (= (and b!771358 res!521897) b!771363))

(assert (= (and b!771363 res!521891) b!771360))

(assert (= (and b!771360 res!521892) b!771365))

(assert (= (and b!771365 res!521893) b!771368))

(assert (= (and b!771360 (not res!521888)) b!771369))

(assert (= (and b!771369 c!85131) b!771372))

(assert (= (and b!771369 (not c!85131)) b!771359))

(declare-fun m!716515 () Bool)

(assert (=> b!771368 m!716515))

(assert (=> b!771368 m!716515))

(declare-fun m!716517 () Bool)

(assert (=> b!771368 m!716517))

(assert (=> b!771365 m!716515))

(assert (=> b!771365 m!716515))

(declare-fun m!716519 () Bool)

(assert (=> b!771365 m!716519))

(assert (=> b!771372 m!716515))

(assert (=> b!771372 m!716515))

(declare-fun m!716521 () Bool)

(assert (=> b!771372 m!716521))

(declare-fun m!716523 () Bool)

(assert (=> b!771356 m!716523))

(declare-fun m!716525 () Bool)

(assert (=> b!771366 m!716525))

(declare-fun m!716527 () Bool)

(assert (=> b!771369 m!716527))

(assert (=> b!771371 m!716515))

(assert (=> b!771371 m!716515))

(declare-fun m!716529 () Bool)

(assert (=> b!771371 m!716529))

(assert (=> b!771371 m!716529))

(assert (=> b!771371 m!716515))

(declare-fun m!716531 () Bool)

(assert (=> b!771371 m!716531))

(declare-fun m!716533 () Bool)

(assert (=> b!771363 m!716533))

(declare-fun m!716535 () Bool)

(assert (=> b!771363 m!716535))

(declare-fun m!716537 () Bool)

(assert (=> b!771363 m!716537))

(declare-fun m!716539 () Bool)

(assert (=> b!771363 m!716539))

(assert (=> b!771363 m!716539))

(declare-fun m!716541 () Bool)

(assert (=> b!771363 m!716541))

(declare-fun m!716543 () Bool)

(assert (=> b!771362 m!716543))

(assert (=> b!771361 m!716515))

(assert (=> b!771361 m!716515))

(declare-fun m!716545 () Bool)

(assert (=> b!771361 m!716545))

(declare-fun m!716547 () Bool)

(assert (=> b!771357 m!716547))

(declare-fun m!716549 () Bool)

(assert (=> b!771360 m!716549))

(declare-fun m!716551 () Bool)

(assert (=> b!771360 m!716551))

(assert (=> b!771374 m!716515))

(assert (=> b!771374 m!716515))

(declare-fun m!716553 () Bool)

(assert (=> b!771374 m!716553))

(declare-fun m!716555 () Bool)

(assert (=> b!771364 m!716555))

(declare-fun m!716557 () Bool)

(assert (=> b!771373 m!716557))

(declare-fun m!716559 () Bool)

(assert (=> start!66832 m!716559))

(declare-fun m!716561 () Bool)

(assert (=> start!66832 m!716561))

(assert (=> b!771367 m!716515))

(assert (=> b!771367 m!716515))

(declare-fun m!716563 () Bool)

(assert (=> b!771367 m!716563))

(assert (=> b!771359 m!716515))

(assert (=> b!771359 m!716515))

(assert (=> b!771359 m!716545))

(assert (=> b!771359 m!716515))

(declare-fun m!716565 () Bool)

(assert (=> b!771359 m!716565))

(push 1)

(assert (not start!66832))

(assert (not b!771356))

(assert (not b!771366))

(assert (not b!771368))

(assert (not b!771363))

(assert (not b!771374))

(assert (not b!771369))

(assert (not b!771361))

(assert (not b!771364))

(assert (not b!771360))

(assert (not b!771357))

(assert (not b!771359))

(assert (not b!771372))

(assert (not b!771365))

(assert (not b!771373))

(assert (not b!771371))

(assert (not b!771367))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!343455 () SeekEntryResult!7897)

(declare-fun d!101707 () Bool)

(assert (=> d!101707 (and (or (is-Undefined!7897 lt!343455) (not (is-Found!7897 lt!343455)) (and (bvsge (index!33957 lt!343455) #b00000000000000000000000000000000) (bvslt (index!33957 lt!343455) (size!20718 a!3186)))) (or (is-Undefined!7897 lt!343455) (is-Found!7897 lt!343455) (not (is-MissingVacant!7897 lt!343455)) (not (= (index!33959 lt!343455) resIntermediateIndex!5)) (and (bvsge (index!33959 lt!343455) #b00000000000000000000000000000000) (bvslt (index!33959 lt!343455) (size!20718 a!3186)))) (or (is-Undefined!7897 lt!343455) (ite (is-Found!7897 lt!343455) (= (select (arr!20297 a!3186) (index!33957 lt!343455)) (select (arr!20297 a!3186) j!159)) (and (is-MissingVacant!7897 lt!343455) (= (index!33959 lt!343455) resIntermediateIndex!5) (= (select (arr!20297 a!3186) (index!33959 lt!343455)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!429499 () SeekEntryResult!7897)

(assert (=> d!101707 (= lt!343455 e!429499)))

(declare-fun c!85182 () Bool)

(assert (=> d!101707 (= c!85182 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!343454 () (_ BitVec 64))

(assert (=> d!101707 (= lt!343454 (select (arr!20297 a!3186) index!1321))))

(assert (=> d!101707 (validMask!0 mask!3328)))

(assert (=> d!101707 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343455)))

(declare-fun b!771511 () Bool)

(declare-fun e!429498 () SeekEntryResult!7897)

(assert (=> b!771511 (= e!429498 (Found!7897 index!1321))))

(declare-fun b!771512 () Bool)

(assert (=> b!771512 (= e!429499 e!429498)))

(declare-fun c!85183 () Bool)

(assert (=> b!771512 (= c!85183 (= lt!343454 (select (arr!20297 a!3186) j!159)))))

(declare-fun e!429497 () SeekEntryResult!7897)

(declare-fun b!771513 () Bool)

(assert (=> b!771513 (= e!429497 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20297 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771514 () Bool)

(assert (=> b!771514 (= e!429497 (MissingVacant!7897 resIntermediateIndex!5))))

(declare-fun b!771515 () Bool)

(declare-fun c!85181 () Bool)

(assert (=> b!771515 (= c!85181 (= lt!343454 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771515 (= e!429498 e!429497)))

(declare-fun b!771516 () Bool)

(assert (=> b!771516 (= e!429499 Undefined!7897)))

(assert (= (and d!101707 c!85182) b!771516))

(assert (= (and d!101707 (not c!85182)) b!771512))

(assert (= (and b!771512 c!85183) b!771511))

(assert (= (and b!771512 (not c!85183)) b!771515))

(assert (= (and b!771515 c!85181) b!771514))

(assert (= (and b!771515 (not c!85181)) b!771513))

(declare-fun m!716633 () Bool)

(assert (=> d!101707 m!716633))

(declare-fun m!716635 () Bool)

(assert (=> d!101707 m!716635))

(declare-fun m!716637 () Bool)

(assert (=> d!101707 m!716637))

(assert (=> d!101707 m!716559))

(assert (=> b!771513 m!716527))

(assert (=> b!771513 m!716527))

(assert (=> b!771513 m!716515))

(declare-fun m!716639 () Bool)

(assert (=> b!771513 m!716639))

(assert (=> b!771359 d!101707))

(declare-fun d!101725 () Bool)

(declare-fun lt!343457 () SeekEntryResult!7897)

(assert (=> d!101725 (and (or (is-Undefined!7897 lt!343457) (not (is-Found!7897 lt!343457)) (and (bvsge (index!33957 lt!343457) #b00000000000000000000000000000000) (bvslt (index!33957 lt!343457) (size!20718 a!3186)))) (or (is-Undefined!7897 lt!343457) (is-Found!7897 lt!343457) (not (is-MissingVacant!7897 lt!343457)) (not (= (index!33959 lt!343457) resIntermediateIndex!5)) (and (bvsge (index!33959 lt!343457) #b00000000000000000000000000000000) (bvslt (index!33959 lt!343457) (size!20718 a!3186)))) (or (is-Undefined!7897 lt!343457) (ite (is-Found!7897 lt!343457) (= (select (arr!20297 a!3186) (index!33957 lt!343457)) (select (arr!20297 a!3186) j!159)) (and (is-MissingVacant!7897 lt!343457) (= (index!33959 lt!343457) resIntermediateIndex!5) (= (select (arr!20297 a!3186) (index!33959 lt!343457)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!429502 () SeekEntryResult!7897)

(assert (=> d!101725 (= lt!343457 e!429502)))

(declare-fun c!85185 () Bool)

(assert (=> d!101725 (= c!85185 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!343456 () (_ BitVec 64))

(assert (=> d!101725 (= lt!343456 (select (arr!20297 a!3186) lt!343401))))

(assert (=> d!101725 (validMask!0 mask!3328)))

(assert (=> d!101725 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343401 resIntermediateIndex!5 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343457)))

(declare-fun b!771517 () Bool)

(declare-fun e!429501 () SeekEntryResult!7897)

(assert (=> b!771517 (= e!429501 (Found!7897 lt!343401))))

(declare-fun b!771518 () Bool)

(assert (=> b!771518 (= e!429502 e!429501)))

(declare-fun c!85186 () Bool)

(assert (=> b!771518 (= c!85186 (= lt!343456 (select (arr!20297 a!3186) j!159)))))

(declare-fun e!429500 () SeekEntryResult!7897)

(declare-fun b!771519 () Bool)

(assert (=> b!771519 (= e!429500 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343401 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20297 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771520 () Bool)

(assert (=> b!771520 (= e!429500 (MissingVacant!7897 resIntermediateIndex!5))))

(declare-fun b!771521 () Bool)

(declare-fun c!85184 () Bool)

(assert (=> b!771521 (= c!85184 (= lt!343456 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771521 (= e!429501 e!429500)))

(declare-fun b!771522 () Bool)

(assert (=> b!771522 (= e!429502 Undefined!7897)))

(assert (= (and d!101725 c!85185) b!771522))

(assert (= (and d!101725 (not c!85185)) b!771518))

(assert (= (and b!771518 c!85186) b!771517))

(assert (= (and b!771518 (not c!85186)) b!771521))

(assert (= (and b!771521 c!85184) b!771520))

(assert (= (and b!771521 (not c!85184)) b!771519))

(declare-fun m!716641 () Bool)

(assert (=> d!101725 m!716641))

(declare-fun m!716643 () Bool)

(assert (=> d!101725 m!716643))

(declare-fun m!716645 () Bool)

(assert (=> d!101725 m!716645))

(assert (=> d!101725 m!716559))

(declare-fun m!716647 () Bool)

(assert (=> b!771519 m!716647))

(assert (=> b!771519 m!716647))

(assert (=> b!771519 m!716515))

(declare-fun m!716649 () Bool)

(assert (=> b!771519 m!716649))

(assert (=> b!771359 d!101725))

(declare-fun lt!343459 () SeekEntryResult!7897)

(declare-fun d!101727 () Bool)

(assert (=> d!101727 (and (or (is-Undefined!7897 lt!343459) (not (is-Found!7897 lt!343459)) (and (bvsge (index!33957 lt!343459) #b00000000000000000000000000000000) (bvslt (index!33957 lt!343459) (size!20718 a!3186)))) (or (is-Undefined!7897 lt!343459) (is-Found!7897 lt!343459) (not (is-MissingVacant!7897 lt!343459)) (not (= (index!33959 lt!343459) resIntermediateIndex!5)) (and (bvsge (index!33959 lt!343459) #b00000000000000000000000000000000) (bvslt (index!33959 lt!343459) (size!20718 a!3186)))) (or (is-Undefined!7897 lt!343459) (ite (is-Found!7897 lt!343459) (= (select (arr!20297 a!3186) (index!33957 lt!343459)) (select (arr!20297 a!3186) j!159)) (and (is-MissingVacant!7897 lt!343459) (= (index!33959 lt!343459) resIntermediateIndex!5) (= (select (arr!20297 a!3186) (index!33959 lt!343459)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!429505 () SeekEntryResult!7897)

(assert (=> d!101727 (= lt!343459 e!429505)))

(declare-fun c!85188 () Bool)

(assert (=> d!101727 (= c!85188 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!343458 () (_ BitVec 64))

(assert (=> d!101727 (= lt!343458 (select (arr!20297 a!3186) resIntermediateIndex!5))))

(assert (=> d!101727 (validMask!0 mask!3328)))

(assert (=> d!101727 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343459)))

(declare-fun b!771523 () Bool)

(declare-fun e!429504 () SeekEntryResult!7897)

(assert (=> b!771523 (= e!429504 (Found!7897 resIntermediateIndex!5))))

(declare-fun b!771524 () Bool)

(assert (=> b!771524 (= e!429505 e!429504)))

(declare-fun c!85189 () Bool)

(assert (=> b!771524 (= c!85189 (= lt!343458 (select (arr!20297 a!3186) j!159)))))

(declare-fun e!429503 () SeekEntryResult!7897)

(declare-fun b!771525 () Bool)

(assert (=> b!771525 (= e!429503 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20297 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!771526 () Bool)

(assert (=> b!771526 (= e!429503 (MissingVacant!7897 resIntermediateIndex!5))))

(declare-fun b!771527 () Bool)

(declare-fun c!85187 () Bool)

(assert (=> b!771527 (= c!85187 (= lt!343458 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771527 (= e!429504 e!429503)))

(declare-fun b!771528 () Bool)

(assert (=> b!771528 (= e!429505 Undefined!7897)))

(assert (= (and d!101727 c!85188) b!771528))

(assert (= (and d!101727 (not c!85188)) b!771524))

(assert (= (and b!771524 c!85189) b!771523))

(assert (= (and b!771524 (not c!85189)) b!771527))

(assert (= (and b!771527 c!85187) b!771526))

(assert (= (and b!771527 (not c!85187)) b!771525))

(declare-fun m!716651 () Bool)

(assert (=> d!101727 m!716651))

(declare-fun m!716653 () Bool)

(assert (=> d!101727 m!716653))

(assert (=> d!101727 m!716543))

(assert (=> d!101727 m!716559))

(declare-fun m!716655 () Bool)

(assert (=> b!771525 m!716655))

(assert (=> b!771525 m!716655))

(assert (=> b!771525 m!716515))

(declare-fun m!716657 () Bool)

(assert (=> b!771525 m!716657))

(assert (=> b!771368 d!101727))

(declare-fun d!101729 () Bool)

(assert (=> d!101729 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!771357 d!101729))

(declare-fun d!101731 () Bool)

(assert (=> d!101731 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66832 d!101731))

(declare-fun d!101739 () Bool)

(assert (=> d!101739 (= (array_inv!16093 a!3186) (bvsge (size!20718 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66832 d!101739))

(declare-fun d!101741 () Bool)

(declare-fun lt!343487 () (_ BitVec 32))

(assert (=> d!101741 (and (bvsge lt!343487 #b00000000000000000000000000000000) (bvslt lt!343487 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101741 (= lt!343487 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101741 (validMask!0 mask!3328)))

(assert (=> d!101741 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!343487)))

(declare-fun bs!21590 () Bool)

(assert (= bs!21590 d!101741))

(declare-fun m!716689 () Bool)

(assert (=> bs!21590 m!716689))

(assert (=> bs!21590 m!716559))

(assert (=> b!771369 d!101741))

(assert (=> b!771361 d!101707))

(declare-fun b!771668 () Bool)

(declare-fun e!429597 () Bool)

(declare-fun e!429596 () Bool)

(assert (=> b!771668 (= e!429597 e!429596)))

(declare-fun res!521989 () Bool)

(declare-fun lt!343524 () SeekEntryResult!7897)

(assert (=> b!771668 (= res!521989 (and (is-Intermediate!7897 lt!343524) (not (undefined!8709 lt!343524)) (bvslt (x!64876 lt!343524) #b01111111111111111111111111111110) (bvsge (x!64876 lt!343524) #b00000000000000000000000000000000) (bvsge (x!64876 lt!343524) #b00000000000000000000000000000000)))))

(assert (=> b!771668 (=> (not res!521989) (not e!429596))))

(declare-fun b!771669 () Bool)

(declare-fun e!429598 () SeekEntryResult!7897)

(declare-fun e!429595 () SeekEntryResult!7897)

(assert (=> b!771669 (= e!429598 e!429595)))

(declare-fun c!85236 () Bool)

(declare-fun lt!343523 () (_ BitVec 64))

(assert (=> b!771669 (= c!85236 (or (= lt!343523 (select (arr!20297 a!3186) j!159)) (= (bvadd lt!343523 lt!343523) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771670 () Bool)

(assert (=> b!771670 (= e!429595 (Intermediate!7897 false (toIndex!0 (select (arr!20297 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!771671 () Bool)

(assert (=> b!771671 (and (bvsge (index!33958 lt!343524) #b00000000000000000000000000000000) (bvslt (index!33958 lt!343524) (size!20718 a!3186)))))

(declare-fun e!429599 () Bool)

(assert (=> b!771671 (= e!429599 (= (select (arr!20297 a!3186) (index!33958 lt!343524)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771672 () Bool)

(assert (=> b!771672 (= e!429595 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20297 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20297 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101745 () Bool)

(assert (=> d!101745 e!429597))

(declare-fun c!85237 () Bool)

(assert (=> d!101745 (= c!85237 (and (is-Intermediate!7897 lt!343524) (undefined!8709 lt!343524)))))

(assert (=> d!101745 (= lt!343524 e!429598)))

(declare-fun c!85238 () Bool)

(assert (=> d!101745 (= c!85238 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101745 (= lt!343523 (select (arr!20297 a!3186) (toIndex!0 (select (arr!20297 a!3186) j!159) mask!3328)))))

(assert (=> d!101745 (validMask!0 mask!3328)))

(assert (=> d!101745 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20297 a!3186) j!159) mask!3328) (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343524)))

(declare-fun b!771673 () Bool)

(assert (=> b!771673 (= e!429598 (Intermediate!7897 true (toIndex!0 (select (arr!20297 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!771674 () Bool)

(assert (=> b!771674 (and (bvsge (index!33958 lt!343524) #b00000000000000000000000000000000) (bvslt (index!33958 lt!343524) (size!20718 a!3186)))))

(declare-fun res!521990 () Bool)

(assert (=> b!771674 (= res!521990 (= (select (arr!20297 a!3186) (index!33958 lt!343524)) (select (arr!20297 a!3186) j!159)))))

(assert (=> b!771674 (=> res!521990 e!429599)))

(assert (=> b!771674 (= e!429596 e!429599)))

(declare-fun b!771675 () Bool)

(assert (=> b!771675 (and (bvsge (index!33958 lt!343524) #b00000000000000000000000000000000) (bvslt (index!33958 lt!343524) (size!20718 a!3186)))))

(declare-fun res!521991 () Bool)

(assert (=> b!771675 (= res!521991 (= (select (arr!20297 a!3186) (index!33958 lt!343524)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771675 (=> res!521991 e!429599)))

(declare-fun b!771676 () Bool)

(assert (=> b!771676 (= e!429597 (bvsge (x!64876 lt!343524) #b01111111111111111111111111111110))))

(assert (= (and d!101745 c!85238) b!771673))

(assert (= (and d!101745 (not c!85238)) b!771669))

(assert (= (and b!771669 c!85236) b!771670))

(assert (= (and b!771669 (not c!85236)) b!771672))

(assert (= (and d!101745 c!85237) b!771676))

(assert (= (and d!101745 (not c!85237)) b!771668))

(assert (= (and b!771668 res!521989) b!771674))

(assert (= (and b!771674 (not res!521990)) b!771675))

(assert (= (and b!771675 (not res!521991)) b!771671))

(declare-fun m!716743 () Bool)

(assert (=> b!771671 m!716743))

(assert (=> d!101745 m!716529))

(declare-fun m!716745 () Bool)

(assert (=> d!101745 m!716745))

(assert (=> d!101745 m!716559))

(assert (=> b!771674 m!716743))

(assert (=> b!771675 m!716743))

(assert (=> b!771672 m!716529))

(declare-fun m!716747 () Bool)

(assert (=> b!771672 m!716747))

(assert (=> b!771672 m!716747))

(assert (=> b!771672 m!716515))

(declare-fun m!716749 () Bool)

(assert (=> b!771672 m!716749))

(assert (=> b!771371 d!101745))

(declare-fun d!101771 () Bool)

(declare-fun lt!343530 () (_ BitVec 32))

(declare-fun lt!343529 () (_ BitVec 32))

(assert (=> d!101771 (= lt!343530 (bvmul (bvxor lt!343529 (bvlshr lt!343529 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101771 (= lt!343529 ((_ extract 31 0) (bvand (bvxor (select (arr!20297 a!3186) j!159) (bvlshr (select (arr!20297 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101771 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!521992 (let ((h!15397 ((_ extract 31 0) (bvand (bvxor (select (arr!20297 a!3186) j!159) (bvlshr (select (arr!20297 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64887 (bvmul (bvxor h!15397 (bvlshr h!15397 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64887 (bvlshr x!64887 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!521992 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!521992 #b00000000000000000000000000000000))))))

(assert (=> d!101771 (= (toIndex!0 (select (arr!20297 a!3186) j!159) mask!3328) (bvand (bvxor lt!343530 (bvlshr lt!343530 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!771371 d!101771))

(declare-fun b!771701 () Bool)

(declare-fun e!429616 () Bool)

(declare-fun call!35126 () Bool)

(assert (=> b!771701 (= e!429616 call!35126)))

(declare-fun b!771702 () Bool)

(declare-fun e!429617 () Bool)

(assert (=> b!771702 (= e!429617 e!429616)))

(declare-fun lt!343551 () (_ BitVec 64))

(assert (=> b!771702 (= lt!343551 (select (arr!20297 a!3186) j!159))))

(declare-fun lt!343549 () Unit!26602)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42394 (_ BitVec 64) (_ BitVec 32)) Unit!26602)

(assert (=> b!771702 (= lt!343549 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343551 j!159))))

(assert (=> b!771702 (arrayContainsKey!0 a!3186 lt!343551 #b00000000000000000000000000000000)))

(declare-fun lt!343550 () Unit!26602)

(assert (=> b!771702 (= lt!343550 lt!343549)))

(declare-fun res!522000 () Bool)

(assert (=> b!771702 (= res!522000 (= (seekEntryOrOpen!0 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) (Found!7897 j!159)))))

(assert (=> b!771702 (=> (not res!522000) (not e!429616))))

(declare-fun b!771704 () Bool)

(assert (=> b!771704 (= e!429617 call!35126)))

(declare-fun bm!35123 () Bool)

(assert (=> bm!35123 (= call!35126 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101773 () Bool)

(declare-fun res!521999 () Bool)

(declare-fun e!429615 () Bool)

(assert (=> d!101773 (=> res!521999 e!429615)))

(assert (=> d!101773 (= res!521999 (bvsge j!159 (size!20718 a!3186)))))

(assert (=> d!101773 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!429615)))

(declare-fun b!771703 () Bool)

(assert (=> b!771703 (= e!429615 e!429617)))

(declare-fun c!85248 () Bool)

(assert (=> b!771703 (= c!85248 (validKeyInArray!0 (select (arr!20297 a!3186) j!159)))))

(assert (= (and d!101773 (not res!521999)) b!771703))

(assert (= (and b!771703 c!85248) b!771702))

(assert (= (and b!771703 (not c!85248)) b!771704))

(assert (= (and b!771702 res!522000) b!771701))

(assert (= (or b!771701 b!771704) bm!35123))

(assert (=> b!771702 m!716515))

(declare-fun m!716783 () Bool)

(assert (=> b!771702 m!716783))

(declare-fun m!716785 () Bool)

(assert (=> b!771702 m!716785))

(assert (=> b!771702 m!716515))

(assert (=> b!771702 m!716519))

(declare-fun m!716787 () Bool)

(assert (=> bm!35123 m!716787))

(assert (=> b!771703 m!716515))

(assert (=> b!771703 m!716515))

(assert (=> b!771703 m!716553))

(assert (=> b!771360 d!101773))

(declare-fun d!101789 () Bool)

(assert (=> d!101789 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!343554 () Unit!26602)

(declare-fun choose!38 (array!42394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26602)

(assert (=> d!101789 (= lt!343554 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101789 (validMask!0 mask!3328)))

(assert (=> d!101789 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!343554)))

(declare-fun bs!21594 () Bool)

(assert (= bs!21594 d!101789))

(assert (=> bs!21594 m!716549))

(declare-fun m!716789 () Bool)

(assert (=> bs!21594 m!716789))

(assert (=> bs!21594 m!716559))

(assert (=> b!771360 d!101789))

(declare-fun b!771705 () Bool)

(declare-fun e!429620 () Bool)

(declare-fun e!429619 () Bool)

(assert (=> b!771705 (= e!429620 e!429619)))

(declare-fun res!522001 () Bool)

(declare-fun lt!343556 () SeekEntryResult!7897)

(assert (=> b!771705 (= res!522001 (and (is-Intermediate!7897 lt!343556) (not (undefined!8709 lt!343556)) (bvslt (x!64876 lt!343556) #b01111111111111111111111111111110) (bvsge (x!64876 lt!343556) #b00000000000000000000000000000000) (bvsge (x!64876 lt!343556) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!771705 (=> (not res!522001) (not e!429619))))

(declare-fun b!771706 () Bool)

(declare-fun e!429621 () SeekEntryResult!7897)

(declare-fun e!429618 () SeekEntryResult!7897)

(assert (=> b!771706 (= e!429621 e!429618)))

(declare-fun lt!343555 () (_ BitVec 64))

(declare-fun c!85249 () Bool)

(assert (=> b!771706 (= c!85249 (or (= lt!343555 (select (arr!20297 a!3186) j!159)) (= (bvadd lt!343555 lt!343555) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771707 () Bool)

(assert (=> b!771707 (= e!429618 (Intermediate!7897 false lt!343401 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!771708 () Bool)

(assert (=> b!771708 (and (bvsge (index!33958 lt!343556) #b00000000000000000000000000000000) (bvslt (index!33958 lt!343556) (size!20718 a!3186)))))

(declare-fun e!429622 () Bool)

(assert (=> b!771708 (= e!429622 (= (select (arr!20297 a!3186) (index!33958 lt!343556)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771709 () Bool)

(assert (=> b!771709 (= e!429618 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343401 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20297 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!101791 () Bool)

(assert (=> d!101791 e!429620))

(declare-fun c!85250 () Bool)

(assert (=> d!101791 (= c!85250 (and (is-Intermediate!7897 lt!343556) (undefined!8709 lt!343556)))))

(assert (=> d!101791 (= lt!343556 e!429621)))

(declare-fun c!85251 () Bool)

(assert (=> d!101791 (= c!85251 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101791 (= lt!343555 (select (arr!20297 a!3186) lt!343401))))

(assert (=> d!101791 (validMask!0 mask!3328)))

(assert (=> d!101791 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343401 (select (arr!20297 a!3186) j!159) a!3186 mask!3328) lt!343556)))

(declare-fun b!771710 () Bool)

(assert (=> b!771710 (= e!429621 (Intermediate!7897 true lt!343401 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!771711 () Bool)

(assert (=> b!771711 (and (bvsge (index!33958 lt!343556) #b00000000000000000000000000000000) (bvslt (index!33958 lt!343556) (size!20718 a!3186)))))

(declare-fun res!522002 () Bool)

(assert (=> b!771711 (= res!522002 (= (select (arr!20297 a!3186) (index!33958 lt!343556)) (select (arr!20297 a!3186) j!159)))))

(assert (=> b!771711 (=> res!522002 e!429622)))

(assert (=> b!771711 (= e!429619 e!429622)))

(declare-fun b!771712 () Bool)

(assert (=> b!771712 (and (bvsge (index!33958 lt!343556) #b00000000000000000000000000000000) (bvslt (index!33958 lt!343556) (size!20718 a!3186)))))

(declare-fun res!522003 () Bool)

(assert (=> b!771712 (= res!522003 (= (select (arr!20297 a!3186) (index!33958 lt!343556)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771712 (=> res!522003 e!429622)))

(declare-fun b!771713 () Bool)

(assert (=> b!771713 (= e!429620 (bvsge (x!64876 lt!343556) #b01111111111111111111111111111110))))

(assert (= (and d!101791 c!85251) b!771710))

(assert (= (and d!101791 (not c!85251)) b!771706))

(assert (= (and b!771706 c!85249) b!771707))

(assert (= (and b!771706 (not c!85249)) b!771709))

(assert (= (and d!101791 c!85250) b!771713))

(assert (= (and d!101791 (not c!85250)) b!771705))

(assert (= (and b!771705 res!522001) b!771711))

(assert (= (and b!771711 (not res!522002)) b!771712))

(assert (= (and b!771712 (not res!522003)) b!771708))

(declare-fun m!716791 () Bool)

(assert (=> b!771708 m!716791))

(assert (=> d!101791 m!716645))

(assert (=> d!101791 m!716559))

(assert (=> b!771711 m!716791))

(assert (=> b!771712 m!716791))

(assert (=> b!771709 m!716647))

(assert (=> b!771709 m!716647))

(assert (=> b!771709 m!716515))

(declare-fun m!716793 () Bool)

(assert (=> b!771709 m!716793))

(assert (=> b!771372 d!101791))

(declare-fun d!101793 () Bool)

(assert (=> d!101793 (= (validKeyInArray!0 (select (arr!20297 a!3186) j!159)) (and (not (= (select (arr!20297 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20297 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!771374 d!101793))

(declare-fun b!771714 () Bool)

(declare-fun e!429624 () Bool)

(declare-fun call!35127 () Bool)

(assert (=> b!771714 (= e!429624 call!35127)))

(declare-fun b!771715 () Bool)

(declare-fun e!429625 () Bool)

(assert (=> b!771715 (= e!429625 e!429624)))

(declare-fun lt!343559 () (_ BitVec 64))

(assert (=> b!771715 (= lt!343559 (select (arr!20297 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!343557 () Unit!26602)

(assert (=> b!771715 (= lt!343557 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343559 #b00000000000000000000000000000000))))

(assert (=> b!771715 (arrayContainsKey!0 a!3186 lt!343559 #b00000000000000000000000000000000)))

(declare-fun lt!343558 () Unit!26602)

(assert (=> b!771715 (= lt!343558 lt!343557)))

(declare-fun res!522005 () Bool)

(assert (=> b!771715 (= res!522005 (= (seekEntryOrOpen!0 (select (arr!20297 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7897 #b00000000000000000000000000000000)))))

(assert (=> b!771715 (=> (not res!522005) (not e!429624))))

(declare-fun b!771717 () Bool)

(assert (=> b!771717 (= e!429625 call!35127)))

(declare-fun bm!35124 () Bool)

(assert (=> bm!35124 (= call!35127 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!101795 () Bool)

(declare-fun res!522004 () Bool)

(declare-fun e!429623 () Bool)

(assert (=> d!101795 (=> res!522004 e!429623)))

(assert (=> d!101795 (= res!522004 (bvsge #b00000000000000000000000000000000 (size!20718 a!3186)))))

(assert (=> d!101795 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!429623)))

(declare-fun b!771716 () Bool)

(assert (=> b!771716 (= e!429623 e!429625)))

(declare-fun c!85252 () Bool)

(assert (=> b!771716 (= c!85252 (validKeyInArray!0 (select (arr!20297 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101795 (not res!522004)) b!771716))

(assert (= (and b!771716 c!85252) b!771715))

(assert (= (and b!771716 (not c!85252)) b!771717))

(assert (= (and b!771715 res!522005) b!771714))

(assert (= (or b!771714 b!771717) bm!35124))

(declare-fun m!716795 () Bool)

(assert (=> b!771715 m!716795))

(declare-fun m!716797 () Bool)

(assert (=> b!771715 m!716797))

(declare-fun m!716799 () Bool)

(assert (=> b!771715 m!716799))

(assert (=> b!771715 m!716795))

(declare-fun m!716801 () Bool)

(assert (=> b!771715 m!716801))

(declare-fun m!716803 () Bool)

(assert (=> bm!35124 m!716803))

(assert (=> b!771716 m!716795))

(assert (=> b!771716 m!716795))

(declare-fun m!716805 () Bool)

(assert (=> b!771716 m!716805))

(assert (=> b!771364 d!101795))

(declare-fun d!101797 () Bool)

(declare-fun res!522010 () Bool)

(declare-fun e!429630 () Bool)

(assert (=> d!101797 (=> res!522010 e!429630)))

(assert (=> d!101797 (= res!522010 (= (select (arr!20297 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!101797 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!429630)))

(declare-fun b!771722 () Bool)

(declare-fun e!429631 () Bool)

(assert (=> b!771722 (= e!429630 e!429631)))

(declare-fun res!522011 () Bool)

(assert (=> b!771722 (=> (not res!522011) (not e!429631))))

(assert (=> b!771722 (= res!522011 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20718 a!3186)))))

(declare-fun b!771723 () Bool)

(assert (=> b!771723 (= e!429631 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101797 (not res!522010)) b!771722))

(assert (= (and b!771722 res!522011) b!771723))

(assert (=> d!101797 m!716795))

(declare-fun m!716807 () Bool)

(assert (=> b!771723 m!716807))

(assert (=> b!771373 d!101797))

(declare-fun b!771724 () Bool)

(declare-fun e!429634 () Bool)

(declare-fun e!429633 () Bool)

(assert (=> b!771724 (= e!429634 e!429633)))

(declare-fun res!522012 () Bool)

(declare-fun lt!343561 () SeekEntryResult!7897)

(assert (=> b!771724 (= res!522012 (and (is-Intermediate!7897 lt!343561) (not (undefined!8709 lt!343561)) (bvslt (x!64876 lt!343561) #b01111111111111111111111111111110) (bvsge (x!64876 lt!343561) #b00000000000000000000000000000000) (bvsge (x!64876 lt!343561) x!1131)))))

(assert (=> b!771724 (=> (not res!522012) (not e!429633))))

(declare-fun b!771725 () Bool)

(declare-fun e!429635 () SeekEntryResult!7897)

(declare-fun e!429632 () SeekEntryResult!7897)

(assert (=> b!771725 (= e!429635 e!429632)))

(declare-fun c!85253 () Bool)

(declare-fun lt!343560 () (_ BitVec 64))

(assert (=> b!771725 (= c!85253 (or (= lt!343560 lt!343409) (= (bvadd lt!343560 lt!343560) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771726 () Bool)

(assert (=> b!771726 (= e!429632 (Intermediate!7897 false index!1321 x!1131))))

(declare-fun b!771727 () Bool)

(assert (=> b!771727 (and (bvsge (index!33958 lt!343561) #b00000000000000000000000000000000) (bvslt (index!33958 lt!343561) (size!20718 lt!343405)))))

(declare-fun e!429636 () Bool)

(assert (=> b!771727 (= e!429636 (= (select (arr!20297 lt!343405) (index!33958 lt!343561)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771728 () Bool)

(assert (=> b!771728 (= e!429632 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!343409 lt!343405 mask!3328))))

(declare-fun d!101799 () Bool)

(assert (=> d!101799 e!429634))

(declare-fun c!85254 () Bool)

(assert (=> d!101799 (= c!85254 (and (is-Intermediate!7897 lt!343561) (undefined!8709 lt!343561)))))

(assert (=> d!101799 (= lt!343561 e!429635)))

(declare-fun c!85255 () Bool)

(assert (=> d!101799 (= c!85255 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101799 (= lt!343560 (select (arr!20297 lt!343405) index!1321))))

(assert (=> d!101799 (validMask!0 mask!3328)))

(assert (=> d!101799 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343409 lt!343405 mask!3328) lt!343561)))

(declare-fun b!771729 () Bool)

(assert (=> b!771729 (= e!429635 (Intermediate!7897 true index!1321 x!1131))))

(declare-fun b!771730 () Bool)

(assert (=> b!771730 (and (bvsge (index!33958 lt!343561) #b00000000000000000000000000000000) (bvslt (index!33958 lt!343561) (size!20718 lt!343405)))))

(declare-fun res!522013 () Bool)

(assert (=> b!771730 (= res!522013 (= (select (arr!20297 lt!343405) (index!33958 lt!343561)) lt!343409))))

(assert (=> b!771730 (=> res!522013 e!429636)))

(assert (=> b!771730 (= e!429633 e!429636)))

(declare-fun b!771731 () Bool)

(assert (=> b!771731 (and (bvsge (index!33958 lt!343561) #b00000000000000000000000000000000) (bvslt (index!33958 lt!343561) (size!20718 lt!343405)))))

(declare-fun res!522014 () Bool)

(assert (=> b!771731 (= res!522014 (= (select (arr!20297 lt!343405) (index!33958 lt!343561)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771731 (=> res!522014 e!429636)))

(declare-fun b!771732 () Bool)

(assert (=> b!771732 (= e!429634 (bvsge (x!64876 lt!343561) #b01111111111111111111111111111110))))

(assert (= (and d!101799 c!85255) b!771729))

(assert (= (and d!101799 (not c!85255)) b!771725))

(assert (= (and b!771725 c!85253) b!771726))

(assert (= (and b!771725 (not c!85253)) b!771728))

(assert (= (and d!101799 c!85254) b!771732))

(assert (= (and d!101799 (not c!85254)) b!771724))

(assert (= (and b!771724 res!522012) b!771730))

(assert (= (and b!771730 (not res!522013)) b!771731))

(assert (= (and b!771731 (not res!522014)) b!771727))

(declare-fun m!716809 () Bool)

(assert (=> b!771727 m!716809))

(declare-fun m!716811 () Bool)

(assert (=> d!101799 m!716811))

(assert (=> d!101799 m!716559))

(assert (=> b!771730 m!716809))

(assert (=> b!771731 m!716809))

(assert (=> b!771728 m!716527))

(assert (=> b!771728 m!716527))

(declare-fun m!716813 () Bool)

(assert (=> b!771728 m!716813))

(assert (=> b!771363 d!101799))

(declare-fun b!771745 () Bool)

(declare-fun e!429645 () Bool)

(declare-fun e!429644 () Bool)

(assert (=> b!771745 (= e!429645 e!429644)))

(declare-fun res!522015 () Bool)

(declare-fun lt!343567 () SeekEntryResult!7897)

(assert (=> b!771745 (= res!522015 (and (is-Intermediate!7897 lt!343567) (not (undefined!8709 lt!343567)) (bvslt (x!64876 lt!343567) #b01111111111111111111111111111110) (bvsge (x!64876 lt!343567) #b00000000000000000000000000000000) (bvsge (x!64876 lt!343567) #b00000000000000000000000000000000)))))

(assert (=> b!771745 (=> (not res!522015) (not e!429644))))

(declare-fun b!771746 () Bool)

(declare-fun e!429646 () SeekEntryResult!7897)

(declare-fun e!429643 () SeekEntryResult!7897)

(assert (=> b!771746 (= e!429646 e!429643)))

(declare-fun c!85262 () Bool)

(declare-fun lt!343566 () (_ BitVec 64))

(assert (=> b!771746 (= c!85262 (or (= lt!343566 lt!343409) (= (bvadd lt!343566 lt!343566) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771747 () Bool)

(assert (=> b!771747 (= e!429643 (Intermediate!7897 false (toIndex!0 lt!343409 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!771748 () Bool)

(assert (=> b!771748 (and (bvsge (index!33958 lt!343567) #b00000000000000000000000000000000) (bvslt (index!33958 lt!343567) (size!20718 lt!343405)))))

(declare-fun e!429647 () Bool)

(assert (=> b!771748 (= e!429647 (= (select (arr!20297 lt!343405) (index!33958 lt!343567)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!771749 () Bool)

(assert (=> b!771749 (= e!429643 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!343409 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!343409 lt!343405 mask!3328))))

(declare-fun d!101801 () Bool)

(assert (=> d!101801 e!429645))

(declare-fun c!85263 () Bool)

(assert (=> d!101801 (= c!85263 (and (is-Intermediate!7897 lt!343567) (undefined!8709 lt!343567)))))

(assert (=> d!101801 (= lt!343567 e!429646)))

(declare-fun c!85264 () Bool)

(assert (=> d!101801 (= c!85264 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!101801 (= lt!343566 (select (arr!20297 lt!343405) (toIndex!0 lt!343409 mask!3328)))))

(assert (=> d!101801 (validMask!0 mask!3328)))

(assert (=> d!101801 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343409 mask!3328) lt!343409 lt!343405 mask!3328) lt!343567)))

(declare-fun b!771750 () Bool)

(assert (=> b!771750 (= e!429646 (Intermediate!7897 true (toIndex!0 lt!343409 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!771751 () Bool)

(assert (=> b!771751 (and (bvsge (index!33958 lt!343567) #b00000000000000000000000000000000) (bvslt (index!33958 lt!343567) (size!20718 lt!343405)))))

(declare-fun res!522016 () Bool)

(assert (=> b!771751 (= res!522016 (= (select (arr!20297 lt!343405) (index!33958 lt!343567)) lt!343409))))

(assert (=> b!771751 (=> res!522016 e!429647)))

(assert (=> b!771751 (= e!429644 e!429647)))

(declare-fun b!771752 () Bool)

(assert (=> b!771752 (and (bvsge (index!33958 lt!343567) #b00000000000000000000000000000000) (bvslt (index!33958 lt!343567) (size!20718 lt!343405)))))

(declare-fun res!522017 () Bool)

(assert (=> b!771752 (= res!522017 (= (select (arr!20297 lt!343405) (index!33958 lt!343567)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!771752 (=> res!522017 e!429647)))

(declare-fun b!771753 () Bool)

(assert (=> b!771753 (= e!429645 (bvsge (x!64876 lt!343567) #b01111111111111111111111111111110))))

(assert (= (and d!101801 c!85264) b!771750))

(assert (= (and d!101801 (not c!85264)) b!771746))

(assert (= (and b!771746 c!85262) b!771747))

(assert (= (and b!771746 (not c!85262)) b!771749))

(assert (= (and d!101801 c!85263) b!771753))

(assert (= (and d!101801 (not c!85263)) b!771745))

(assert (= (and b!771745 res!522015) b!771751))

(assert (= (and b!771751 (not res!522016)) b!771752))

(assert (= (and b!771752 (not res!522017)) b!771748))

(declare-fun m!716815 () Bool)

(assert (=> b!771748 m!716815))

(assert (=> d!101801 m!716539))

(declare-fun m!716817 () Bool)

(assert (=> d!101801 m!716817))

(assert (=> d!101801 m!716559))

(assert (=> b!771751 m!716815))

(assert (=> b!771752 m!716815))

(assert (=> b!771749 m!716539))

(declare-fun m!716819 () Bool)

(assert (=> b!771749 m!716819))

(assert (=> b!771749 m!716819))

(declare-fun m!716821 () Bool)

(assert (=> b!771749 m!716821))

(assert (=> b!771363 d!101801))

(declare-fun d!101803 () Bool)

(declare-fun lt!343569 () (_ BitVec 32))

(declare-fun lt!343568 () (_ BitVec 32))

(assert (=> d!101803 (= lt!343569 (bvmul (bvxor lt!343568 (bvlshr lt!343568 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101803 (= lt!343568 ((_ extract 31 0) (bvand (bvxor lt!343409 (bvlshr lt!343409 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101803 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!521992 (let ((h!15397 ((_ extract 31 0) (bvand (bvxor lt!343409 (bvlshr lt!343409 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64887 (bvmul (bvxor h!15397 (bvlshr h!15397 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64887 (bvlshr x!64887 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!521992 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!521992 #b00000000000000000000000000000000))))))

(assert (=> d!101803 (= (toIndex!0 lt!343409 mask!3328) (bvand (bvxor lt!343569 (bvlshr lt!343569 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!771363 d!101803))

(declare-fun b!771802 () Bool)

(declare-fun e!429673 () SeekEntryResult!7897)

(assert (=> b!771802 (= e!429673 Undefined!7897)))

(declare-fun b!771803 () Bool)

(declare-fun e!429675 () SeekEntryResult!7897)

(assert (=> b!771803 (= e!429673 e!429675)))

(declare-fun lt!343590 () (_ BitVec 64))

(declare-fun lt!343589 () SeekEntryResult!7897)

(assert (=> b!771803 (= lt!343590 (select (arr!20297 a!3186) (index!33958 lt!343589)))))

(declare-fun c!85287 () Bool)

(assert (=> b!771803 (= c!85287 (= lt!343590 k!2102))))

(declare-fun b!771804 () Bool)

(declare-fun c!85286 () Bool)

(assert (=> b!771804 (= c!85286 (= lt!343590 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!429674 () SeekEntryResult!7897)

(assert (=> b!771804 (= e!429675 e!429674)))

(declare-fun d!101805 () Bool)

(declare-fun lt!343588 () SeekEntryResult!7897)

(assert (=> d!101805 (and (or (is-Undefined!7897 lt!343588) (not (is-Found!7897 lt!343588)) (and (bvsge (index!33957 lt!343588) #b00000000000000000000000000000000) (bvslt (index!33957 lt!343588) (size!20718 a!3186)))) (or (is-Undefined!7897 lt!343588) (is-Found!7897 lt!343588) (not (is-MissingZero!7897 lt!343588)) (and (bvsge (index!33956 lt!343588) #b00000000000000000000000000000000) (bvslt (index!33956 lt!343588) (size!20718 a!3186)))) (or (is-Undefined!7897 lt!343588) (is-Found!7897 lt!343588) (is-MissingZero!7897 lt!343588) (not (is-MissingVacant!7897 lt!343588)) (and (bvsge (index!33959 lt!343588) #b00000000000000000000000000000000) (bvslt (index!33959 lt!343588) (size!20718 a!3186)))) (or (is-Undefined!7897 lt!343588) (ite (is-Found!7897 lt!343588) (= (select (arr!20297 a!3186) (index!33957 lt!343588)) k!2102) (ite (is-MissingZero!7897 lt!343588) (= (select (arr!20297 a!3186) (index!33956 lt!343588)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7897 lt!343588) (= (select (arr!20297 a!3186) (index!33959 lt!343588)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101805 (= lt!343588 e!429673)))

(declare-fun c!85288 () Bool)

(assert (=> d!101805 (= c!85288 (and (is-Intermediate!7897 lt!343589) (undefined!8709 lt!343589)))))

(assert (=> d!101805 (= lt!343589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!101805 (validMask!0 mask!3328)))

(assert (=> d!101805 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!343588)))

(declare-fun b!771805 () Bool)

(assert (=> b!771805 (= e!429675 (Found!7897 (index!33958 lt!343589)))))

(declare-fun b!771806 () Bool)

(assert (=> b!771806 (= e!429674 (seekKeyOrZeroReturnVacant!0 (x!64876 lt!343589) (index!33958 lt!343589) (index!33958 lt!343589) k!2102 a!3186 mask!3328))))

(declare-fun b!771807 () Bool)

(assert (=> b!771807 (= e!429674 (MissingZero!7897 (index!33958 lt!343589)))))

(assert (= (and d!101805 c!85288) b!771802))

(assert (= (and d!101805 (not c!85288)) b!771803))

(assert (= (and b!771803 c!85287) b!771805))

(assert (= (and b!771803 (not c!85287)) b!771804))

(assert (= (and b!771804 c!85286) b!771807))

(assert (= (and b!771804 (not c!85286)) b!771806))

