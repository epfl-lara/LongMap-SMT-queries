; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51100 () Bool)

(assert start!51100)

(declare-fun b!558520 () Bool)

(declare-fun e!321747 () Bool)

(declare-fun e!321744 () Bool)

(assert (=> b!558520 (= e!321747 e!321744)))

(declare-fun res!350385 () Bool)

(assert (=> b!558520 (=> (not res!350385) (not e!321744))))

(declare-datatypes ((SeekEntryResult!5331 0))(
  ( (MissingZero!5331 (index!23551 (_ BitVec 32))) (Found!5331 (index!23552 (_ BitVec 32))) (Intermediate!5331 (undefined!6143 Bool) (index!23553 (_ BitVec 32)) (x!52447 (_ BitVec 32))) (Undefined!5331) (MissingVacant!5331 (index!23554 (_ BitVec 32))) )
))
(declare-fun lt!253823 () SeekEntryResult!5331)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558520 (= res!350385 (or (= lt!253823 (MissingZero!5331 i!1132)) (= lt!253823 (MissingVacant!5331 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35154 0))(
  ( (array!35155 (arr!16882 (Array (_ BitVec 32) (_ BitVec 64))) (size!17246 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35154)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35154 (_ BitVec 32)) SeekEntryResult!5331)

(assert (=> b!558520 (= lt!253823 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!350393 () Bool)

(assert (=> start!51100 (=> (not res!350393) (not e!321747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51100 (= res!350393 (validMask!0 mask!3119))))

(assert (=> start!51100 e!321747))

(assert (=> start!51100 true))

(declare-fun array_inv!12678 (array!35154) Bool)

(assert (=> start!51100 (array_inv!12678 a!3118)))

(declare-fun lt!253825 () SeekEntryResult!5331)

(declare-fun e!321742 () Bool)

(declare-fun lt!253824 () SeekEntryResult!5331)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!558521 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35154 (_ BitVec 32)) SeekEntryResult!5331)

(assert (=> b!558521 (= e!321742 (= lt!253824 (seekKeyOrZeroReturnVacant!0 (x!52447 lt!253825) (index!23553 lt!253825) (index!23553 lt!253825) (select (arr!16882 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558522 () Bool)

(declare-fun e!321746 () Bool)

(assert (=> b!558522 (= e!321746 (not true))))

(declare-fun e!321745 () Bool)

(assert (=> b!558522 e!321745))

(declare-fun res!350383 () Bool)

(assert (=> b!558522 (=> (not res!350383) (not e!321745))))

(assert (=> b!558522 (= res!350383 (= lt!253824 (Found!5331 j!142)))))

(assert (=> b!558522 (= lt!253824 (seekEntryOrOpen!0 (select (arr!16882 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35154 (_ BitVec 32)) Bool)

(assert (=> b!558522 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17436 0))(
  ( (Unit!17437) )
))
(declare-fun lt!253821 () Unit!17436)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17436)

(assert (=> b!558522 (= lt!253821 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558523 () Bool)

(assert (=> b!558523 (= e!321744 e!321746)))

(declare-fun res!350390 () Bool)

(assert (=> b!558523 (=> (not res!350390) (not e!321746))))

(declare-fun lt!253820 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35154 (_ BitVec 32)) SeekEntryResult!5331)

(assert (=> b!558523 (= res!350390 (= lt!253825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253820 (select (store (arr!16882 a!3118) i!1132 k0!1914) j!142) (array!35155 (store (arr!16882 a!3118) i!1132 k0!1914) (size!17246 a!3118)) mask!3119)))))

(declare-fun lt!253822 () (_ BitVec 32))

(assert (=> b!558523 (= lt!253825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253822 (select (arr!16882 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558523 (= lt!253820 (toIndex!0 (select (store (arr!16882 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558523 (= lt!253822 (toIndex!0 (select (arr!16882 a!3118) j!142) mask!3119))))

(declare-fun b!558524 () Bool)

(declare-fun res!350384 () Bool)

(assert (=> b!558524 (=> (not res!350384) (not e!321747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558524 (= res!350384 (validKeyInArray!0 (select (arr!16882 a!3118) j!142)))))

(declare-fun b!558525 () Bool)

(declare-fun res!350392 () Bool)

(assert (=> b!558525 (=> (not res!350392) (not e!321744))))

(assert (=> b!558525 (= res!350392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558526 () Bool)

(declare-fun res!350391 () Bool)

(assert (=> b!558526 (=> (not res!350391) (not e!321747))))

(assert (=> b!558526 (= res!350391 (and (= (size!17246 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17246 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17246 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558527 () Bool)

(declare-fun res!350386 () Bool)

(assert (=> b!558527 (=> (not res!350386) (not e!321744))))

(declare-datatypes ((List!10962 0))(
  ( (Nil!10959) (Cons!10958 (h!11952 (_ BitVec 64)) (t!17190 List!10962)) )
))
(declare-fun arrayNoDuplicates!0 (array!35154 (_ BitVec 32) List!10962) Bool)

(assert (=> b!558527 (= res!350386 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10959))))

(declare-fun b!558528 () Bool)

(declare-fun res!350388 () Bool)

(assert (=> b!558528 (=> (not res!350388) (not e!321747))))

(declare-fun arrayContainsKey!0 (array!35154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558528 (= res!350388 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558529 () Bool)

(declare-fun res!350387 () Bool)

(assert (=> b!558529 (=> (not res!350387) (not e!321747))))

(assert (=> b!558529 (= res!350387 (validKeyInArray!0 k0!1914))))

(declare-fun b!558530 () Bool)

(assert (=> b!558530 (= e!321745 e!321742)))

(declare-fun res!350389 () Bool)

(assert (=> b!558530 (=> res!350389 e!321742)))

(get-info :version)

(assert (=> b!558530 (= res!350389 (or (undefined!6143 lt!253825) (not ((_ is Intermediate!5331) lt!253825)) (= (select (arr!16882 a!3118) (index!23553 lt!253825)) (select (arr!16882 a!3118) j!142)) (= (select (arr!16882 a!3118) (index!23553 lt!253825)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!51100 res!350393) b!558526))

(assert (= (and b!558526 res!350391) b!558524))

(assert (= (and b!558524 res!350384) b!558529))

(assert (= (and b!558529 res!350387) b!558528))

(assert (= (and b!558528 res!350388) b!558520))

(assert (= (and b!558520 res!350385) b!558525))

(assert (= (and b!558525 res!350392) b!558527))

(assert (= (and b!558527 res!350386) b!558523))

(assert (= (and b!558523 res!350390) b!558522))

(assert (= (and b!558522 res!350383) b!558530))

(assert (= (and b!558530 (not res!350389)) b!558521))

(declare-fun m!536515 () Bool)

(assert (=> b!558523 m!536515))

(declare-fun m!536517 () Bool)

(assert (=> b!558523 m!536517))

(assert (=> b!558523 m!536515))

(declare-fun m!536519 () Bool)

(assert (=> b!558523 m!536519))

(assert (=> b!558523 m!536515))

(declare-fun m!536521 () Bool)

(assert (=> b!558523 m!536521))

(declare-fun m!536523 () Bool)

(assert (=> b!558523 m!536523))

(assert (=> b!558523 m!536519))

(declare-fun m!536525 () Bool)

(assert (=> b!558523 m!536525))

(assert (=> b!558523 m!536519))

(declare-fun m!536527 () Bool)

(assert (=> b!558523 m!536527))

(assert (=> b!558522 m!536515))

(assert (=> b!558522 m!536515))

(declare-fun m!536529 () Bool)

(assert (=> b!558522 m!536529))

(declare-fun m!536531 () Bool)

(assert (=> b!558522 m!536531))

(declare-fun m!536533 () Bool)

(assert (=> b!558522 m!536533))

(declare-fun m!536535 () Bool)

(assert (=> b!558528 m!536535))

(declare-fun m!536537 () Bool)

(assert (=> b!558520 m!536537))

(declare-fun m!536539 () Bool)

(assert (=> b!558530 m!536539))

(assert (=> b!558530 m!536515))

(declare-fun m!536541 () Bool)

(assert (=> start!51100 m!536541))

(declare-fun m!536543 () Bool)

(assert (=> start!51100 m!536543))

(assert (=> b!558524 m!536515))

(assert (=> b!558524 m!536515))

(declare-fun m!536545 () Bool)

(assert (=> b!558524 m!536545))

(declare-fun m!536547 () Bool)

(assert (=> b!558525 m!536547))

(declare-fun m!536549 () Bool)

(assert (=> b!558529 m!536549))

(assert (=> b!558521 m!536515))

(assert (=> b!558521 m!536515))

(declare-fun m!536551 () Bool)

(assert (=> b!558521 m!536551))

(declare-fun m!536553 () Bool)

(assert (=> b!558527 m!536553))

(check-sat (not b!558529) (not b!558524) (not b!558523) (not b!558528) (not b!558520) (not b!558527) (not b!558522) (not b!558521) (not start!51100) (not b!558525))
(check-sat)
