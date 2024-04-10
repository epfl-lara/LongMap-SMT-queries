; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51400 () Bool)

(assert start!51400)

(declare-fun res!352651 () Bool)

(declare-fun e!323557 () Bool)

(assert (=> start!51400 (=> (not res!352651) (not e!323557))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51400 (= res!352651 (validMask!0 mask!3119))))

(assert (=> start!51400 e!323557))

(assert (=> start!51400 true))

(declare-datatypes ((array!35265 0))(
  ( (array!35266 (arr!16933 (Array (_ BitVec 32) (_ BitVec 64))) (size!17297 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35265)

(declare-fun array_inv!12729 (array!35265) Bool)

(assert (=> start!51400 (array_inv!12729 a!3118)))

(declare-fun b!561491 () Bool)

(declare-fun e!323556 () Bool)

(declare-fun e!323552 () Bool)

(assert (=> b!561491 (= e!323556 e!323552)))

(declare-fun res!352650 () Bool)

(assert (=> b!561491 (=> res!352650 e!323552)))

(declare-datatypes ((SeekEntryResult!5382 0))(
  ( (MissingZero!5382 (index!23755 (_ BitVec 32))) (Found!5382 (index!23756 (_ BitVec 32))) (Intermediate!5382 (undefined!6194 Bool) (index!23757 (_ BitVec 32)) (x!52661 (_ BitVec 32))) (Undefined!5382) (MissingVacant!5382 (index!23758 (_ BitVec 32))) )
))
(declare-fun lt!255553 () SeekEntryResult!5382)

(get-info :version)

(assert (=> b!561491 (= res!352650 (or (undefined!6194 lt!255553) (not ((_ is Intermediate!5382) lt!255553))))))

(declare-fun b!561492 () Bool)

(declare-fun res!352643 () Bool)

(declare-fun e!323553 () Bool)

(assert (=> b!561492 (=> (not res!352643) (not e!323553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35265 (_ BitVec 32)) Bool)

(assert (=> b!561492 (= res!352643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561493 () Bool)

(declare-fun e!323559 () Bool)

(declare-fun e!323555 () Bool)

(assert (=> b!561493 (= e!323559 e!323555)))

(declare-fun res!352653 () Bool)

(assert (=> b!561493 (=> (not res!352653) (not e!323555))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255552 () SeekEntryResult!5382)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35265 (_ BitVec 32)) SeekEntryResult!5382)

(assert (=> b!561493 (= res!352653 (= lt!255552 (seekKeyOrZeroReturnVacant!0 (x!52661 lt!255553) (index!23757 lt!255553) (index!23757 lt!255553) (select (arr!16933 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561494 () Bool)

(assert (=> b!561494 (= e!323557 e!323553)))

(declare-fun res!352648 () Bool)

(assert (=> b!561494 (=> (not res!352648) (not e!323553))))

(declare-fun lt!255550 () SeekEntryResult!5382)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561494 (= res!352648 (or (= lt!255550 (MissingZero!5382 i!1132)) (= lt!255550 (MissingVacant!5382 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35265 (_ BitVec 32)) SeekEntryResult!5382)

(assert (=> b!561494 (= lt!255550 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561495 () Bool)

(declare-fun res!352645 () Bool)

(assert (=> b!561495 (=> (not res!352645) (not e!323553))))

(declare-datatypes ((List!11013 0))(
  ( (Nil!11010) (Cons!11009 (h!12012 (_ BitVec 64)) (t!17241 List!11013)) )
))
(declare-fun arrayNoDuplicates!0 (array!35265 (_ BitVec 32) List!11013) Bool)

(assert (=> b!561495 (= res!352645 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11010))))

(declare-fun b!561496 () Bool)

(declare-fun res!352647 () Bool)

(assert (=> b!561496 (=> (not res!352647) (not e!323557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561496 (= res!352647 (validKeyInArray!0 k0!1914))))

(declare-fun b!561497 () Bool)

(declare-fun res!352646 () Bool)

(assert (=> b!561497 (=> (not res!352646) (not e!323557))))

(declare-fun arrayContainsKey!0 (array!35265 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561497 (= res!352646 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561498 () Bool)

(assert (=> b!561498 (= e!323552 e!323559)))

(declare-fun res!352652 () Bool)

(assert (=> b!561498 (=> res!352652 e!323559)))

(declare-fun lt!255545 () (_ BitVec 64))

(assert (=> b!561498 (= res!352652 (or (= lt!255545 (select (arr!16933 a!3118) j!142)) (= lt!255545 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561498 (= lt!255545 (select (arr!16933 a!3118) (index!23757 lt!255553)))))

(declare-fun lt!255547 () array!35265)

(declare-fun b!561499 () Bool)

(declare-fun lt!255549 () (_ BitVec 64))

(assert (=> b!561499 (= e!323555 (= (seekEntryOrOpen!0 lt!255549 lt!255547 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52661 lt!255553) (index!23757 lt!255553) (index!23757 lt!255553) lt!255549 lt!255547 mask!3119)))))

(declare-fun b!561500 () Bool)

(declare-fun e!323558 () Bool)

(assert (=> b!561500 (= e!323553 e!323558)))

(declare-fun res!352654 () Bool)

(assert (=> b!561500 (=> (not res!352654) (not e!323558))))

(declare-fun lt!255548 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35265 (_ BitVec 32)) SeekEntryResult!5382)

(assert (=> b!561500 (= res!352654 (= lt!255553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255548 lt!255549 lt!255547 mask!3119)))))

(declare-fun lt!255551 () (_ BitVec 32))

(assert (=> b!561500 (= lt!255553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255551 (select (arr!16933 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561500 (= lt!255548 (toIndex!0 lt!255549 mask!3119))))

(assert (=> b!561500 (= lt!255549 (select (store (arr!16933 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561500 (= lt!255551 (toIndex!0 (select (arr!16933 a!3118) j!142) mask!3119))))

(assert (=> b!561500 (= lt!255547 (array!35266 (store (arr!16933 a!3118) i!1132 k0!1914) (size!17297 a!3118)))))

(declare-fun b!561501 () Bool)

(assert (=> b!561501 (= e!323558 (not true))))

(assert (=> b!561501 e!323556))

(declare-fun res!352644 () Bool)

(assert (=> b!561501 (=> (not res!352644) (not e!323556))))

(assert (=> b!561501 (= res!352644 (= lt!255552 (Found!5382 j!142)))))

(assert (=> b!561501 (= lt!255552 (seekEntryOrOpen!0 (select (arr!16933 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561501 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17538 0))(
  ( (Unit!17539) )
))
(declare-fun lt!255546 () Unit!17538)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17538)

(assert (=> b!561501 (= lt!255546 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561502 () Bool)

(declare-fun res!352655 () Bool)

(assert (=> b!561502 (=> (not res!352655) (not e!323557))))

(assert (=> b!561502 (= res!352655 (validKeyInArray!0 (select (arr!16933 a!3118) j!142)))))

(declare-fun b!561503 () Bool)

(declare-fun res!352649 () Bool)

(assert (=> b!561503 (=> (not res!352649) (not e!323557))))

(assert (=> b!561503 (= res!352649 (and (= (size!17297 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17297 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17297 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51400 res!352651) b!561503))

(assert (= (and b!561503 res!352649) b!561502))

(assert (= (and b!561502 res!352655) b!561496))

(assert (= (and b!561496 res!352647) b!561497))

(assert (= (and b!561497 res!352646) b!561494))

(assert (= (and b!561494 res!352648) b!561492))

(assert (= (and b!561492 res!352643) b!561495))

(assert (= (and b!561495 res!352645) b!561500))

(assert (= (and b!561500 res!352654) b!561501))

(assert (= (and b!561501 res!352644) b!561491))

(assert (= (and b!561491 (not res!352650)) b!561498))

(assert (= (and b!561498 (not res!352652)) b!561493))

(assert (= (and b!561493 res!352653) b!561499))

(declare-fun m!539393 () Bool)

(assert (=> b!561501 m!539393))

(assert (=> b!561501 m!539393))

(declare-fun m!539395 () Bool)

(assert (=> b!561501 m!539395))

(declare-fun m!539397 () Bool)

(assert (=> b!561501 m!539397))

(declare-fun m!539399 () Bool)

(assert (=> b!561501 m!539399))

(declare-fun m!539401 () Bool)

(assert (=> b!561496 m!539401))

(declare-fun m!539403 () Bool)

(assert (=> start!51400 m!539403))

(declare-fun m!539405 () Bool)

(assert (=> start!51400 m!539405))

(declare-fun m!539407 () Bool)

(assert (=> b!561497 m!539407))

(assert (=> b!561493 m!539393))

(assert (=> b!561493 m!539393))

(declare-fun m!539409 () Bool)

(assert (=> b!561493 m!539409))

(declare-fun m!539411 () Bool)

(assert (=> b!561499 m!539411))

(declare-fun m!539413 () Bool)

(assert (=> b!561499 m!539413))

(assert (=> b!561502 m!539393))

(assert (=> b!561502 m!539393))

(declare-fun m!539415 () Bool)

(assert (=> b!561502 m!539415))

(declare-fun m!539417 () Bool)

(assert (=> b!561494 m!539417))

(declare-fun m!539419 () Bool)

(assert (=> b!561492 m!539419))

(assert (=> b!561498 m!539393))

(declare-fun m!539421 () Bool)

(assert (=> b!561498 m!539421))

(assert (=> b!561500 m!539393))

(declare-fun m!539423 () Bool)

(assert (=> b!561500 m!539423))

(assert (=> b!561500 m!539393))

(declare-fun m!539425 () Bool)

(assert (=> b!561500 m!539425))

(declare-fun m!539427 () Bool)

(assert (=> b!561500 m!539427))

(declare-fun m!539429 () Bool)

(assert (=> b!561500 m!539429))

(declare-fun m!539431 () Bool)

(assert (=> b!561500 m!539431))

(declare-fun m!539433 () Bool)

(assert (=> b!561500 m!539433))

(assert (=> b!561500 m!539393))

(declare-fun m!539435 () Bool)

(assert (=> b!561495 m!539435))

(check-sat (not b!561501) (not b!561493) (not b!561497) (not b!561502) (not b!561494) (not b!561500) (not start!51400) (not b!561496) (not b!561492) (not b!561495) (not b!561499))
(check-sat)
