; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51432 () Bool)

(assert start!51432)

(declare-fun b!561418 () Bool)

(declare-fun e!323516 () Bool)

(assert (=> b!561418 (= e!323516 (not true))))

(declare-fun e!323519 () Bool)

(assert (=> b!561418 e!323519))

(declare-fun res!352469 () Bool)

(assert (=> b!561418 (=> (not res!352469) (not e!323519))))

(declare-datatypes ((SeekEntryResult!5326 0))(
  ( (MissingZero!5326 (index!23531 (_ BitVec 32))) (Found!5326 (index!23532 (_ BitVec 32))) (Intermediate!5326 (undefined!6138 Bool) (index!23533 (_ BitVec 32)) (x!52592 (_ BitVec 32))) (Undefined!5326) (MissingVacant!5326 (index!23534 (_ BitVec 32))) )
))
(declare-fun lt!255471 () SeekEntryResult!5326)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!561418 (= res!352469 (= lt!255471 (Found!5326 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35244 0))(
  ( (array!35245 (arr!16921 (Array (_ BitVec 32) (_ BitVec 64))) (size!17285 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35244)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35244 (_ BitVec 32)) SeekEntryResult!5326)

(assert (=> b!561418 (= lt!255471 (seekEntryOrOpen!0 (select (arr!16921 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35244 (_ BitVec 32)) Bool)

(assert (=> b!561418 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17497 0))(
  ( (Unit!17498) )
))
(declare-fun lt!255472 () Unit!17497)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17497)

(assert (=> b!561418 (= lt!255472 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!352472 () Bool)

(declare-fun e!323513 () Bool)

(assert (=> start!51432 (=> (not res!352472) (not e!323513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51432 (= res!352472 (validMask!0 mask!3119))))

(assert (=> start!51432 e!323513))

(assert (=> start!51432 true))

(declare-fun array_inv!12780 (array!35244) Bool)

(assert (=> start!51432 (array_inv!12780 a!3118)))

(declare-fun b!561419 () Bool)

(declare-fun res!352476 () Bool)

(assert (=> b!561419 (=> (not res!352476) (not e!323513))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35244 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561419 (= res!352476 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561420 () Bool)

(declare-fun e!323515 () Bool)

(assert (=> b!561420 (= e!323513 e!323515)))

(declare-fun res!352468 () Bool)

(assert (=> b!561420 (=> (not res!352468) (not e!323515))))

(declare-fun lt!255469 () SeekEntryResult!5326)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561420 (= res!352468 (or (= lt!255469 (MissingZero!5326 i!1132)) (= lt!255469 (MissingVacant!5326 i!1132))))))

(assert (=> b!561420 (= lt!255469 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561421 () Bool)

(declare-fun res!352473 () Bool)

(assert (=> b!561421 (=> (not res!352473) (not e!323515))))

(declare-datatypes ((List!10908 0))(
  ( (Nil!10905) (Cons!10904 (h!11910 (_ BitVec 64)) (t!17128 List!10908)) )
))
(declare-fun arrayNoDuplicates!0 (array!35244 (_ BitVec 32) List!10908) Bool)

(assert (=> b!561421 (= res!352473 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10905))))

(declare-fun b!561422 () Bool)

(declare-fun res!352477 () Bool)

(assert (=> b!561422 (=> (not res!352477) (not e!323513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561422 (= res!352477 (validKeyInArray!0 k0!1914))))

(declare-fun b!561423 () Bool)

(declare-fun e!323518 () Bool)

(declare-fun e!323514 () Bool)

(assert (=> b!561423 (= e!323518 e!323514)))

(declare-fun res!352467 () Bool)

(assert (=> b!561423 (=> res!352467 e!323514)))

(declare-fun lt!255473 () (_ BitVec 64))

(assert (=> b!561423 (= res!352467 (or (= lt!255473 (select (arr!16921 a!3118) j!142)) (= lt!255473 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!255474 () SeekEntryResult!5326)

(assert (=> b!561423 (= lt!255473 (select (arr!16921 a!3118) (index!23533 lt!255474)))))

(declare-fun b!561424 () Bool)

(declare-fun res!352471 () Bool)

(assert (=> b!561424 (=> (not res!352471) (not e!323513))))

(assert (=> b!561424 (= res!352471 (validKeyInArray!0 (select (arr!16921 a!3118) j!142)))))

(declare-fun b!561425 () Bool)

(declare-fun res!352466 () Bool)

(assert (=> b!561425 (=> (not res!352466) (not e!323515))))

(assert (=> b!561425 (= res!352466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561426 () Bool)

(declare-fun e!323517 () Bool)

(assert (=> b!561426 (= e!323514 e!323517)))

(declare-fun res!352470 () Bool)

(assert (=> b!561426 (=> (not res!352470) (not e!323517))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35244 (_ BitVec 32)) SeekEntryResult!5326)

(assert (=> b!561426 (= res!352470 (= lt!255471 (seekKeyOrZeroReturnVacant!0 (x!52592 lt!255474) (index!23533 lt!255474) (index!23533 lt!255474) (select (arr!16921 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561427 () Bool)

(assert (=> b!561427 (= e!323515 e!323516)))

(declare-fun res!352475 () Bool)

(assert (=> b!561427 (=> (not res!352475) (not e!323516))))

(declare-fun lt!255470 () array!35244)

(declare-fun lt!255468 () (_ BitVec 64))

(declare-fun lt!255475 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35244 (_ BitVec 32)) SeekEntryResult!5326)

(assert (=> b!561427 (= res!352475 (= lt!255474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255475 lt!255468 lt!255470 mask!3119)))))

(declare-fun lt!255467 () (_ BitVec 32))

(assert (=> b!561427 (= lt!255474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255467 (select (arr!16921 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561427 (= lt!255475 (toIndex!0 lt!255468 mask!3119))))

(assert (=> b!561427 (= lt!255468 (select (store (arr!16921 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561427 (= lt!255467 (toIndex!0 (select (arr!16921 a!3118) j!142) mask!3119))))

(assert (=> b!561427 (= lt!255470 (array!35245 (store (arr!16921 a!3118) i!1132 k0!1914) (size!17285 a!3118)))))

(declare-fun b!561428 () Bool)

(assert (=> b!561428 (= e!323519 e!323518)))

(declare-fun res!352474 () Bool)

(assert (=> b!561428 (=> res!352474 e!323518)))

(get-info :version)

(assert (=> b!561428 (= res!352474 (or (undefined!6138 lt!255474) (not ((_ is Intermediate!5326) lt!255474))))))

(declare-fun b!561429 () Bool)

(assert (=> b!561429 (= e!323517 (= (seekEntryOrOpen!0 lt!255468 lt!255470 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52592 lt!255474) (index!23533 lt!255474) (index!23533 lt!255474) lt!255468 lt!255470 mask!3119)))))

(declare-fun b!561430 () Bool)

(declare-fun res!352465 () Bool)

(assert (=> b!561430 (=> (not res!352465) (not e!323513))))

(assert (=> b!561430 (= res!352465 (and (= (size!17285 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17285 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17285 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51432 res!352472) b!561430))

(assert (= (and b!561430 res!352465) b!561424))

(assert (= (and b!561424 res!352471) b!561422))

(assert (= (and b!561422 res!352477) b!561419))

(assert (= (and b!561419 res!352476) b!561420))

(assert (= (and b!561420 res!352468) b!561425))

(assert (= (and b!561425 res!352466) b!561421))

(assert (= (and b!561421 res!352473) b!561427))

(assert (= (and b!561427 res!352475) b!561418))

(assert (= (and b!561418 res!352469) b!561428))

(assert (= (and b!561428 (not res!352474)) b!561423))

(assert (= (and b!561423 (not res!352467)) b!561426))

(assert (= (and b!561426 res!352470) b!561429))

(declare-fun m!539423 () Bool)

(assert (=> b!561426 m!539423))

(assert (=> b!561426 m!539423))

(declare-fun m!539425 () Bool)

(assert (=> b!561426 m!539425))

(assert (=> b!561418 m!539423))

(assert (=> b!561418 m!539423))

(declare-fun m!539427 () Bool)

(assert (=> b!561418 m!539427))

(declare-fun m!539429 () Bool)

(assert (=> b!561418 m!539429))

(declare-fun m!539431 () Bool)

(assert (=> b!561418 m!539431))

(declare-fun m!539433 () Bool)

(assert (=> b!561422 m!539433))

(declare-fun m!539435 () Bool)

(assert (=> b!561419 m!539435))

(assert (=> b!561423 m!539423))

(declare-fun m!539437 () Bool)

(assert (=> b!561423 m!539437))

(assert (=> b!561427 m!539423))

(declare-fun m!539439 () Bool)

(assert (=> b!561427 m!539439))

(declare-fun m!539441 () Bool)

(assert (=> b!561427 m!539441))

(assert (=> b!561427 m!539423))

(declare-fun m!539443 () Bool)

(assert (=> b!561427 m!539443))

(declare-fun m!539445 () Bool)

(assert (=> b!561427 m!539445))

(declare-fun m!539447 () Bool)

(assert (=> b!561427 m!539447))

(assert (=> b!561427 m!539423))

(declare-fun m!539449 () Bool)

(assert (=> b!561427 m!539449))

(declare-fun m!539451 () Bool)

(assert (=> b!561429 m!539451))

(declare-fun m!539453 () Bool)

(assert (=> b!561429 m!539453))

(declare-fun m!539455 () Bool)

(assert (=> b!561420 m!539455))

(declare-fun m!539457 () Bool)

(assert (=> b!561425 m!539457))

(declare-fun m!539459 () Bool)

(assert (=> b!561421 m!539459))

(declare-fun m!539461 () Bool)

(assert (=> start!51432 m!539461))

(declare-fun m!539463 () Bool)

(assert (=> start!51432 m!539463))

(assert (=> b!561424 m!539423))

(assert (=> b!561424 m!539423))

(declare-fun m!539465 () Bool)

(assert (=> b!561424 m!539465))

(check-sat (not b!561426) (not b!561419) (not b!561425) (not b!561418) (not b!561424) (not b!561429) (not b!561427) (not b!561422) (not start!51432) (not b!561420) (not b!561421))
(check-sat)
