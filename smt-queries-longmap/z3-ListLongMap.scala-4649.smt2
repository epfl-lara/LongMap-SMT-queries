; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64794 () Bool)

(assert start!64794)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41113 0))(
  ( (array!41114 (arr!19672 (Array (_ BitVec 32) (_ BitVec 64))) (size!20092 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41113)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!729485 () Bool)

(declare-fun e!408393 () Bool)

(declare-datatypes ((SeekEntryResult!7228 0))(
  ( (MissingZero!7228 (index!31280 (_ BitVec 32))) (Found!7228 (index!31281 (_ BitVec 32))) (Intermediate!7228 (undefined!8040 Bool) (index!31282 (_ BitVec 32)) (x!62430 (_ BitVec 32))) (Undefined!7228) (MissingVacant!7228 (index!31283 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41113 (_ BitVec 32)) SeekEntryResult!7228)

(assert (=> b!729485 (= e!408393 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19672 a!3186) j!159) a!3186 mask!3328) (Found!7228 j!159)))))

(declare-fun b!729486 () Bool)

(declare-fun e!408395 () Bool)

(assert (=> b!729486 (= e!408395 true)))

(declare-fun lt!323132 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729486 (= lt!323132 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!729487 () Bool)

(declare-fun e!408399 () Bool)

(declare-fun e!408398 () Bool)

(assert (=> b!729487 (= e!408399 e!408398)))

(declare-fun res!489536 () Bool)

(assert (=> b!729487 (=> (not res!489536) (not e!408398))))

(declare-fun lt!323129 () SeekEntryResult!7228)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41113 (_ BitVec 32)) SeekEntryResult!7228)

(assert (=> b!729487 (= res!489536 (= (seekEntryOrOpen!0 (select (arr!19672 a!3186) j!159) a!3186 mask!3328) lt!323129))))

(assert (=> b!729487 (= lt!323129 (Found!7228 j!159))))

(declare-fun b!729488 () Bool)

(declare-fun e!408396 () Bool)

(assert (=> b!729488 (= e!408396 (not e!408395))))

(declare-fun res!489532 () Bool)

(assert (=> b!729488 (=> res!489532 e!408395)))

(declare-fun lt!323127 () SeekEntryResult!7228)

(get-info :version)

(assert (=> b!729488 (= res!489532 (or (not ((_ is Intermediate!7228) lt!323127)) (bvsge x!1131 (x!62430 lt!323127))))))

(assert (=> b!729488 e!408399))

(declare-fun res!489540 () Bool)

(assert (=> b!729488 (=> (not res!489540) (not e!408399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41113 (_ BitVec 32)) Bool)

(assert (=> b!729488 (= res!489540 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24853 0))(
  ( (Unit!24854) )
))
(declare-fun lt!323130 () Unit!24853)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41113 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24853)

(assert (=> b!729488 (= lt!323130 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729489 () Bool)

(declare-fun e!408397 () Bool)

(assert (=> b!729489 (= e!408397 e!408396)))

(declare-fun res!489530 () Bool)

(assert (=> b!729489 (=> (not res!489530) (not e!408396))))

(declare-fun lt!323128 () SeekEntryResult!7228)

(assert (=> b!729489 (= res!489530 (= lt!323128 lt!323127))))

(declare-fun lt!323126 () array!41113)

(declare-fun lt!323125 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41113 (_ BitVec 32)) SeekEntryResult!7228)

(assert (=> b!729489 (= lt!323127 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323125 lt!323126 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729489 (= lt!323128 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323125 mask!3328) lt!323125 lt!323126 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!729489 (= lt!323125 (select (store (arr!19672 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729489 (= lt!323126 (array!41114 (store (arr!19672 a!3186) i!1173 k0!2102) (size!20092 a!3186)))))

(declare-fun b!729490 () Bool)

(declare-fun e!408391 () Bool)

(assert (=> b!729490 (= e!408391 e!408397)))

(declare-fun res!489538 () Bool)

(assert (=> b!729490 (=> (not res!489538) (not e!408397))))

(declare-fun lt!323131 () SeekEntryResult!7228)

(assert (=> b!729490 (= res!489538 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19672 a!3186) j!159) mask!3328) (select (arr!19672 a!3186) j!159) a!3186 mask!3328) lt!323131))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729490 (= lt!323131 (Intermediate!7228 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729491 () Bool)

(declare-fun e!408392 () Bool)

(assert (=> b!729491 (= e!408392 e!408391)))

(declare-fun res!489534 () Bool)

(assert (=> b!729491 (=> (not res!489534) (not e!408391))))

(declare-fun lt!323133 () SeekEntryResult!7228)

(assert (=> b!729491 (= res!489534 (or (= lt!323133 (MissingZero!7228 i!1173)) (= lt!323133 (MissingVacant!7228 i!1173))))))

(assert (=> b!729491 (= lt!323133 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!729492 () Bool)

(declare-fun res!489527 () Bool)

(assert (=> b!729492 (=> (not res!489527) (not e!408397))))

(assert (=> b!729492 (= res!489527 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19672 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!489539 () Bool)

(assert (=> start!64794 (=> (not res!489539) (not e!408392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64794 (= res!489539 (validMask!0 mask!3328))))

(assert (=> start!64794 e!408392))

(assert (=> start!64794 true))

(declare-fun array_inv!15531 (array!41113) Bool)

(assert (=> start!64794 (array_inv!15531 a!3186)))

(declare-fun b!729493 () Bool)

(declare-fun res!489537 () Bool)

(assert (=> b!729493 (=> (not res!489537) (not e!408397))))

(assert (=> b!729493 (= res!489537 e!408393)))

(declare-fun c!80357 () Bool)

(assert (=> b!729493 (= c!80357 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729494 () Bool)

(declare-fun res!489528 () Bool)

(assert (=> b!729494 (=> (not res!489528) (not e!408391))))

(assert (=> b!729494 (= res!489528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729495 () Bool)

(assert (=> b!729495 (= e!408398 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19672 a!3186) j!159) a!3186 mask!3328) lt!323129))))

(declare-fun b!729496 () Bool)

(declare-fun res!489529 () Bool)

(assert (=> b!729496 (=> (not res!489529) (not e!408391))))

(declare-datatypes ((List!13581 0))(
  ( (Nil!13578) (Cons!13577 (h!14643 (_ BitVec 64)) (t!19888 List!13581)) )
))
(declare-fun arrayNoDuplicates!0 (array!41113 (_ BitVec 32) List!13581) Bool)

(assert (=> b!729496 (= res!489529 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13578))))

(declare-fun b!729497 () Bool)

(declare-fun res!489541 () Bool)

(assert (=> b!729497 (=> (not res!489541) (not e!408392))))

(assert (=> b!729497 (= res!489541 (and (= (size!20092 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20092 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20092 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729498 () Bool)

(declare-fun res!489531 () Bool)

(assert (=> b!729498 (=> (not res!489531) (not e!408391))))

(assert (=> b!729498 (= res!489531 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20092 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20092 a!3186))))))

(declare-fun b!729499 () Bool)

(declare-fun res!489533 () Bool)

(assert (=> b!729499 (=> (not res!489533) (not e!408392))))

(declare-fun arrayContainsKey!0 (array!41113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729499 (= res!489533 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729500 () Bool)

(assert (=> b!729500 (= e!408393 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19672 a!3186) j!159) a!3186 mask!3328) lt!323131))))

(declare-fun b!729501 () Bool)

(declare-fun res!489526 () Bool)

(assert (=> b!729501 (=> (not res!489526) (not e!408392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729501 (= res!489526 (validKeyInArray!0 (select (arr!19672 a!3186) j!159)))))

(declare-fun b!729502 () Bool)

(declare-fun res!489535 () Bool)

(assert (=> b!729502 (=> (not res!489535) (not e!408392))))

(assert (=> b!729502 (= res!489535 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64794 res!489539) b!729497))

(assert (= (and b!729497 res!489541) b!729501))

(assert (= (and b!729501 res!489526) b!729502))

(assert (= (and b!729502 res!489535) b!729499))

(assert (= (and b!729499 res!489533) b!729491))

(assert (= (and b!729491 res!489534) b!729494))

(assert (= (and b!729494 res!489528) b!729496))

(assert (= (and b!729496 res!489529) b!729498))

(assert (= (and b!729498 res!489531) b!729490))

(assert (= (and b!729490 res!489538) b!729492))

(assert (= (and b!729492 res!489527) b!729493))

(assert (= (and b!729493 c!80357) b!729500))

(assert (= (and b!729493 (not c!80357)) b!729485))

(assert (= (and b!729493 res!489537) b!729489))

(assert (= (and b!729489 res!489530) b!729488))

(assert (= (and b!729488 res!489540) b!729487))

(assert (= (and b!729487 res!489536) b!729495))

(assert (= (and b!729488 (not res!489532)) b!729486))

(declare-fun m!683595 () Bool)

(assert (=> b!729496 m!683595))

(declare-fun m!683597 () Bool)

(assert (=> b!729488 m!683597))

(declare-fun m!683599 () Bool)

(assert (=> b!729488 m!683599))

(declare-fun m!683601 () Bool)

(assert (=> b!729500 m!683601))

(assert (=> b!729500 m!683601))

(declare-fun m!683603 () Bool)

(assert (=> b!729500 m!683603))

(assert (=> b!729490 m!683601))

(assert (=> b!729490 m!683601))

(declare-fun m!683605 () Bool)

(assert (=> b!729490 m!683605))

(assert (=> b!729490 m!683605))

(assert (=> b!729490 m!683601))

(declare-fun m!683607 () Bool)

(assert (=> b!729490 m!683607))

(declare-fun m!683609 () Bool)

(assert (=> b!729486 m!683609))

(declare-fun m!683611 () Bool)

(assert (=> b!729489 m!683611))

(declare-fun m!683613 () Bool)

(assert (=> b!729489 m!683613))

(declare-fun m!683615 () Bool)

(assert (=> b!729489 m!683615))

(declare-fun m!683617 () Bool)

(assert (=> b!729489 m!683617))

(assert (=> b!729489 m!683611))

(declare-fun m!683619 () Bool)

(assert (=> b!729489 m!683619))

(assert (=> b!729487 m!683601))

(assert (=> b!729487 m!683601))

(declare-fun m!683621 () Bool)

(assert (=> b!729487 m!683621))

(declare-fun m!683623 () Bool)

(assert (=> b!729494 m!683623))

(assert (=> b!729485 m!683601))

(assert (=> b!729485 m!683601))

(declare-fun m!683625 () Bool)

(assert (=> b!729485 m!683625))

(assert (=> b!729501 m!683601))

(assert (=> b!729501 m!683601))

(declare-fun m!683627 () Bool)

(assert (=> b!729501 m!683627))

(declare-fun m!683629 () Bool)

(assert (=> b!729502 m!683629))

(declare-fun m!683631 () Bool)

(assert (=> start!64794 m!683631))

(declare-fun m!683633 () Bool)

(assert (=> start!64794 m!683633))

(assert (=> b!729495 m!683601))

(assert (=> b!729495 m!683601))

(declare-fun m!683635 () Bool)

(assert (=> b!729495 m!683635))

(declare-fun m!683637 () Bool)

(assert (=> b!729491 m!683637))

(declare-fun m!683639 () Bool)

(assert (=> b!729499 m!683639))

(declare-fun m!683641 () Bool)

(assert (=> b!729492 m!683641))

(check-sat (not b!729495) (not b!729489) (not b!729488) (not b!729485) (not start!64794) (not b!729501) (not b!729502) (not b!729490) (not b!729496) (not b!729494) (not b!729486) (not b!729491) (not b!729500) (not b!729499) (not b!729487))
(check-sat)
