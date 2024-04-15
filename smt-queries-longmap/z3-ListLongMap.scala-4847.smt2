; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66758 () Bool)

(assert start!66758)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42339 0))(
  ( (array!42340 (arr!20270 (Array (_ BitVec 32) (_ BitVec 64))) (size!20691 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42339)

(declare-fun e!428484 () Bool)

(declare-fun b!769546 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7867 0))(
  ( (MissingZero!7867 (index!33836 (_ BitVec 32))) (Found!7867 (index!33837 (_ BitVec 32))) (Intermediate!7867 (undefined!8679 Bool) (index!33838 (_ BitVec 32)) (x!64777 (_ BitVec 32))) (Undefined!7867) (MissingVacant!7867 (index!33839 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42339 (_ BitVec 32)) SeekEntryResult!7867)

(assert (=> b!769546 (= e!428484 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20270 a!3186) j!159) a!3186 mask!3328) (Found!7867 j!159)))))

(declare-fun b!769547 () Bool)

(declare-fun res!520537 () Bool)

(declare-fun e!428476 () Bool)

(assert (=> b!769547 (=> (not res!520537) (not e!428476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769547 (= res!520537 (validKeyInArray!0 (select (arr!20270 a!3186) j!159)))))

(declare-fun b!769548 () Bool)

(declare-fun e!428480 () Bool)

(declare-fun e!428482 () Bool)

(assert (=> b!769548 (= e!428480 e!428482)))

(declare-fun res!520542 () Bool)

(assert (=> b!769548 (=> (not res!520542) (not e!428482))))

(declare-fun lt!342305 () SeekEntryResult!7867)

(declare-fun lt!342310 () SeekEntryResult!7867)

(assert (=> b!769548 (= res!520542 (= lt!342305 lt!342310))))

(declare-fun lt!342307 () (_ BitVec 64))

(declare-fun lt!342301 () array!42339)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42339 (_ BitVec 32)) SeekEntryResult!7867)

(assert (=> b!769548 (= lt!342310 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342307 lt!342301 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769548 (= lt!342305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342307 mask!3328) lt!342307 lt!342301 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!769548 (= lt!342307 (select (store (arr!20270 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!769548 (= lt!342301 (array!42340 (store (arr!20270 a!3186) i!1173 k0!2102) (size!20691 a!3186)))))

(declare-fun b!769549 () Bool)

(declare-fun e!428483 () Bool)

(assert (=> b!769549 (= e!428483 e!428480)))

(declare-fun res!520530 () Bool)

(assert (=> b!769549 (=> (not res!520530) (not e!428480))))

(declare-fun lt!342308 () SeekEntryResult!7867)

(assert (=> b!769549 (= res!520530 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20270 a!3186) j!159) mask!3328) (select (arr!20270 a!3186) j!159) a!3186 mask!3328) lt!342308))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!769549 (= lt!342308 (Intermediate!7867 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769550 () Bool)

(declare-fun lt!342306 () SeekEntryResult!7867)

(declare-fun e!428485 () Bool)

(assert (=> b!769550 (= e!428485 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20270 a!3186) j!159) a!3186 mask!3328) lt!342306))))

(declare-fun b!769551 () Bool)

(declare-fun res!520528 () Bool)

(assert (=> b!769551 (=> (not res!520528) (not e!428483))))

(declare-datatypes ((List!14311 0))(
  ( (Nil!14308) (Cons!14307 (h!15406 (_ BitVec 64)) (t!20617 List!14311)) )
))
(declare-fun arrayNoDuplicates!0 (array!42339 (_ BitVec 32) List!14311) Bool)

(assert (=> b!769551 (= res!520528 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14308))))

(declare-fun b!769552 () Bool)

(assert (=> b!769552 (= e!428476 e!428483)))

(declare-fun res!520532 () Bool)

(assert (=> b!769552 (=> (not res!520532) (not e!428483))))

(declare-fun lt!342309 () SeekEntryResult!7867)

(assert (=> b!769552 (= res!520532 (or (= lt!342309 (MissingZero!7867 i!1173)) (= lt!342309 (MissingVacant!7867 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42339 (_ BitVec 32)) SeekEntryResult!7867)

(assert (=> b!769552 (= lt!342309 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!769553 () Bool)

(declare-fun e!428481 () Bool)

(assert (=> b!769553 (= e!428482 (not e!428481))))

(declare-fun res!520535 () Bool)

(assert (=> b!769553 (=> res!520535 e!428481)))

(get-info :version)

(assert (=> b!769553 (= res!520535 (or (not ((_ is Intermediate!7867) lt!342310)) (bvsge x!1131 (x!64777 lt!342310))))))

(declare-fun e!428478 () Bool)

(assert (=> b!769553 e!428478))

(declare-fun res!520539 () Bool)

(assert (=> b!769553 (=> (not res!520539) (not e!428478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42339 (_ BitVec 32)) Bool)

(assert (=> b!769553 (= res!520539 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26462 0))(
  ( (Unit!26463) )
))
(declare-fun lt!342303 () Unit!26462)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42339 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26462)

(assert (=> b!769553 (= lt!342303 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769554 () Bool)

(assert (=> b!769554 (= e!428484 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20270 a!3186) j!159) a!3186 mask!3328) lt!342308))))

(declare-fun b!769555 () Bool)

(declare-fun e!428477 () Unit!26462)

(declare-fun Unit!26464 () Unit!26462)

(assert (=> b!769555 (= e!428477 Unit!26464)))

(declare-fun lt!342304 () (_ BitVec 32))

(assert (=> b!769555 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342304 (select (arr!20270 a!3186) j!159) a!3186 mask!3328) lt!342308)))

(declare-fun b!769556 () Bool)

(declare-fun res!520534 () Bool)

(assert (=> b!769556 (=> (not res!520534) (not e!428476))))

(declare-fun arrayContainsKey!0 (array!42339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769556 (= res!520534 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769557 () Bool)

(declare-fun res!520538 () Bool)

(assert (=> b!769557 (=> (not res!520538) (not e!428476))))

(assert (=> b!769557 (= res!520538 (and (= (size!20691 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20691 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20691 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769558 () Bool)

(declare-fun res!520527 () Bool)

(assert (=> b!769558 (=> (not res!520527) (not e!428480))))

(assert (=> b!769558 (= res!520527 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20270 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769559 () Bool)

(assert (=> b!769559 (= e!428481 true)))

(declare-fun lt!342311 () Unit!26462)

(assert (=> b!769559 (= lt!342311 e!428477)))

(declare-fun c!84906 () Bool)

(assert (=> b!769559 (= c!84906 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769559 (= lt!342304 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769560 () Bool)

(declare-fun res!520541 () Bool)

(assert (=> b!769560 (=> (not res!520541) (not e!428480))))

(assert (=> b!769560 (= res!520541 e!428484)))

(declare-fun c!84905 () Bool)

(assert (=> b!769560 (= c!84905 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!520531 () Bool)

(assert (=> start!66758 (=> (not res!520531) (not e!428476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66758 (= res!520531 (validMask!0 mask!3328))))

(assert (=> start!66758 e!428476))

(assert (=> start!66758 true))

(declare-fun array_inv!16153 (array!42339) Bool)

(assert (=> start!66758 (array_inv!16153 a!3186)))

(declare-fun b!769561 () Bool)

(assert (=> b!769561 (= e!428478 e!428485)))

(declare-fun res!520533 () Bool)

(assert (=> b!769561 (=> (not res!520533) (not e!428485))))

(assert (=> b!769561 (= res!520533 (= (seekEntryOrOpen!0 (select (arr!20270 a!3186) j!159) a!3186 mask!3328) lt!342306))))

(assert (=> b!769561 (= lt!342306 (Found!7867 j!159))))

(declare-fun b!769562 () Bool)

(declare-fun res!520536 () Bool)

(assert (=> b!769562 (=> (not res!520536) (not e!428483))))

(assert (=> b!769562 (= res!520536 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20691 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20691 a!3186))))))

(declare-fun b!769563 () Bool)

(declare-fun Unit!26465 () Unit!26462)

(assert (=> b!769563 (= e!428477 Unit!26465)))

(declare-fun lt!342302 () SeekEntryResult!7867)

(assert (=> b!769563 (= lt!342302 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20270 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769563 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342304 resIntermediateIndex!5 (select (arr!20270 a!3186) j!159) a!3186 mask!3328) (Found!7867 j!159))))

(declare-fun b!769564 () Bool)

(declare-fun res!520540 () Bool)

(assert (=> b!769564 (=> (not res!520540) (not e!428476))))

(assert (=> b!769564 (= res!520540 (validKeyInArray!0 k0!2102))))

(declare-fun b!769565 () Bool)

(declare-fun res!520529 () Bool)

(assert (=> b!769565 (=> (not res!520529) (not e!428483))))

(assert (=> b!769565 (= res!520529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!66758 res!520531) b!769557))

(assert (= (and b!769557 res!520538) b!769547))

(assert (= (and b!769547 res!520537) b!769564))

(assert (= (and b!769564 res!520540) b!769556))

(assert (= (and b!769556 res!520534) b!769552))

(assert (= (and b!769552 res!520532) b!769565))

(assert (= (and b!769565 res!520529) b!769551))

(assert (= (and b!769551 res!520528) b!769562))

(assert (= (and b!769562 res!520536) b!769549))

(assert (= (and b!769549 res!520530) b!769558))

(assert (= (and b!769558 res!520527) b!769560))

(assert (= (and b!769560 c!84905) b!769554))

(assert (= (and b!769560 (not c!84905)) b!769546))

(assert (= (and b!769560 res!520541) b!769548))

(assert (= (and b!769548 res!520542) b!769553))

(assert (= (and b!769553 res!520539) b!769561))

(assert (= (and b!769561 res!520533) b!769550))

(assert (= (and b!769553 (not res!520535)) b!769559))

(assert (= (and b!769559 c!84906) b!769555))

(assert (= (and b!769559 (not c!84906)) b!769563))

(declare-fun m!714405 () Bool)

(assert (=> b!769559 m!714405))

(declare-fun m!714407 () Bool)

(assert (=> b!769553 m!714407))

(declare-fun m!714409 () Bool)

(assert (=> b!769553 m!714409))

(declare-fun m!714411 () Bool)

(assert (=> b!769555 m!714411))

(assert (=> b!769555 m!714411))

(declare-fun m!714413 () Bool)

(assert (=> b!769555 m!714413))

(declare-fun m!714415 () Bool)

(assert (=> b!769551 m!714415))

(declare-fun m!714417 () Bool)

(assert (=> b!769556 m!714417))

(declare-fun m!714419 () Bool)

(assert (=> b!769564 m!714419))

(declare-fun m!714421 () Bool)

(assert (=> b!769565 m!714421))

(declare-fun m!714423 () Bool)

(assert (=> b!769552 m!714423))

(assert (=> b!769563 m!714411))

(assert (=> b!769563 m!714411))

(declare-fun m!714425 () Bool)

(assert (=> b!769563 m!714425))

(assert (=> b!769563 m!714411))

(declare-fun m!714427 () Bool)

(assert (=> b!769563 m!714427))

(declare-fun m!714429 () Bool)

(assert (=> start!66758 m!714429))

(declare-fun m!714431 () Bool)

(assert (=> start!66758 m!714431))

(assert (=> b!769550 m!714411))

(assert (=> b!769550 m!714411))

(declare-fun m!714433 () Bool)

(assert (=> b!769550 m!714433))

(assert (=> b!769549 m!714411))

(assert (=> b!769549 m!714411))

(declare-fun m!714435 () Bool)

(assert (=> b!769549 m!714435))

(assert (=> b!769549 m!714435))

(assert (=> b!769549 m!714411))

(declare-fun m!714437 () Bool)

(assert (=> b!769549 m!714437))

(declare-fun m!714439 () Bool)

(assert (=> b!769548 m!714439))

(declare-fun m!714441 () Bool)

(assert (=> b!769548 m!714441))

(declare-fun m!714443 () Bool)

(assert (=> b!769548 m!714443))

(declare-fun m!714445 () Bool)

(assert (=> b!769548 m!714445))

(assert (=> b!769548 m!714439))

(declare-fun m!714447 () Bool)

(assert (=> b!769548 m!714447))

(assert (=> b!769546 m!714411))

(assert (=> b!769546 m!714411))

(assert (=> b!769546 m!714425))

(declare-fun m!714449 () Bool)

(assert (=> b!769558 m!714449))

(assert (=> b!769561 m!714411))

(assert (=> b!769561 m!714411))

(declare-fun m!714451 () Bool)

(assert (=> b!769561 m!714451))

(assert (=> b!769554 m!714411))

(assert (=> b!769554 m!714411))

(declare-fun m!714453 () Bool)

(assert (=> b!769554 m!714453))

(assert (=> b!769547 m!714411))

(assert (=> b!769547 m!714411))

(declare-fun m!714455 () Bool)

(assert (=> b!769547 m!714455))

(check-sat (not b!769552) (not b!769559) (not start!66758) (not b!769564) (not b!769561) (not b!769547) (not b!769565) (not b!769551) (not b!769556) (not b!769548) (not b!769550) (not b!769549) (not b!769563) (not b!769555) (not b!769546) (not b!769553) (not b!769554))
(check-sat)
