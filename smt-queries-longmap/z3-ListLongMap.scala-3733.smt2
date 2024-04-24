; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51438 () Bool)

(assert start!51438)

(declare-fun b!561535 () Bool)

(declare-fun res!352592 () Bool)

(declare-fun e!323588 () Bool)

(assert (=> b!561535 (=> (not res!352592) (not e!323588))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35250 0))(
  ( (array!35251 (arr!16924 (Array (_ BitVec 32) (_ BitVec 64))) (size!17288 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35250)

(assert (=> b!561535 (= res!352592 (and (= (size!17288 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17288 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17288 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561536 () Bool)

(declare-fun res!352586 () Bool)

(assert (=> b!561536 (=> (not res!352586) (not e!323588))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561536 (= res!352586 (validKeyInArray!0 k0!1914))))

(declare-fun b!561537 () Bool)

(declare-fun e!323592 () Bool)

(assert (=> b!561537 (= e!323588 e!323592)))

(declare-fun res!352583 () Bool)

(assert (=> b!561537 (=> (not res!352583) (not e!323592))))

(declare-datatypes ((SeekEntryResult!5329 0))(
  ( (MissingZero!5329 (index!23543 (_ BitVec 32))) (Found!5329 (index!23544 (_ BitVec 32))) (Intermediate!5329 (undefined!6141 Bool) (index!23545 (_ BitVec 32)) (x!52603 (_ BitVec 32))) (Undefined!5329) (MissingVacant!5329 (index!23546 (_ BitVec 32))) )
))
(declare-fun lt!255549 () SeekEntryResult!5329)

(assert (=> b!561537 (= res!352583 (or (= lt!255549 (MissingZero!5329 i!1132)) (= lt!255549 (MissingVacant!5329 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35250 (_ BitVec 32)) SeekEntryResult!5329)

(assert (=> b!561537 (= lt!255549 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561538 () Bool)

(declare-fun res!352584 () Bool)

(assert (=> b!561538 (=> (not res!352584) (not e!323588))))

(assert (=> b!561538 (= res!352584 (validKeyInArray!0 (select (arr!16924 a!3118) j!142)))))

(declare-fun b!561539 () Bool)

(declare-fun e!323585 () Bool)

(assert (=> b!561539 (= e!323585 (not true))))

(declare-fun e!323586 () Bool)

(assert (=> b!561539 e!323586))

(declare-fun res!352588 () Bool)

(assert (=> b!561539 (=> (not res!352588) (not e!323586))))

(declare-fun lt!255548 () SeekEntryResult!5329)

(assert (=> b!561539 (= res!352588 (= lt!255548 (Found!5329 j!142)))))

(assert (=> b!561539 (= lt!255548 (seekEntryOrOpen!0 (select (arr!16924 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35250 (_ BitVec 32)) Bool)

(assert (=> b!561539 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17503 0))(
  ( (Unit!17504) )
))
(declare-fun lt!255551 () Unit!17503)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17503)

(assert (=> b!561539 (= lt!255551 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561540 () Bool)

(declare-fun e!323591 () Bool)

(declare-fun e!323589 () Bool)

(assert (=> b!561540 (= e!323591 e!323589)))

(declare-fun res!352590 () Bool)

(assert (=> b!561540 (=> (not res!352590) (not e!323589))))

(declare-fun lt!255550 () SeekEntryResult!5329)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35250 (_ BitVec 32)) SeekEntryResult!5329)

(assert (=> b!561540 (= res!352590 (= lt!255548 (seekKeyOrZeroReturnVacant!0 (x!52603 lt!255550) (index!23545 lt!255550) (index!23545 lt!255550) (select (arr!16924 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561541 () Bool)

(assert (=> b!561541 (= e!323592 e!323585)))

(declare-fun res!352591 () Bool)

(assert (=> b!561541 (=> (not res!352591) (not e!323585))))

(declare-fun lt!255555 () (_ BitVec 64))

(declare-fun lt!255556 () array!35250)

(declare-fun lt!255554 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35250 (_ BitVec 32)) SeekEntryResult!5329)

(assert (=> b!561541 (= res!352591 (= lt!255550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255554 lt!255555 lt!255556 mask!3119)))))

(declare-fun lt!255553 () (_ BitVec 32))

(assert (=> b!561541 (= lt!255550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255553 (select (arr!16924 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561541 (= lt!255554 (toIndex!0 lt!255555 mask!3119))))

(assert (=> b!561541 (= lt!255555 (select (store (arr!16924 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561541 (= lt!255553 (toIndex!0 (select (arr!16924 a!3118) j!142) mask!3119))))

(assert (=> b!561541 (= lt!255556 (array!35251 (store (arr!16924 a!3118) i!1132 k0!1914) (size!17288 a!3118)))))

(declare-fun b!561542 () Bool)

(declare-fun e!323590 () Bool)

(assert (=> b!561542 (= e!323586 e!323590)))

(declare-fun res!352582 () Bool)

(assert (=> b!561542 (=> res!352582 e!323590)))

(get-info :version)

(assert (=> b!561542 (= res!352582 (or (undefined!6141 lt!255550) (not ((_ is Intermediate!5329) lt!255550))))))

(declare-fun b!561543 () Bool)

(assert (=> b!561543 (= e!323590 e!323591)))

(declare-fun res!352587 () Bool)

(assert (=> b!561543 (=> res!352587 e!323591)))

(declare-fun lt!255552 () (_ BitVec 64))

(assert (=> b!561543 (= res!352587 (or (= lt!255552 (select (arr!16924 a!3118) j!142)) (= lt!255552 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561543 (= lt!255552 (select (arr!16924 a!3118) (index!23545 lt!255550)))))

(declare-fun res!352593 () Bool)

(assert (=> start!51438 (=> (not res!352593) (not e!323588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51438 (= res!352593 (validMask!0 mask!3119))))

(assert (=> start!51438 e!323588))

(assert (=> start!51438 true))

(declare-fun array_inv!12783 (array!35250) Bool)

(assert (=> start!51438 (array_inv!12783 a!3118)))

(declare-fun b!561544 () Bool)

(assert (=> b!561544 (= e!323589 (= (seekEntryOrOpen!0 lt!255555 lt!255556 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52603 lt!255550) (index!23545 lt!255550) (index!23545 lt!255550) lt!255555 lt!255556 mask!3119)))))

(declare-fun b!561545 () Bool)

(declare-fun res!352589 () Bool)

(assert (=> b!561545 (=> (not res!352589) (not e!323592))))

(declare-datatypes ((List!10911 0))(
  ( (Nil!10908) (Cons!10907 (h!11913 (_ BitVec 64)) (t!17131 List!10911)) )
))
(declare-fun arrayNoDuplicates!0 (array!35250 (_ BitVec 32) List!10911) Bool)

(assert (=> b!561545 (= res!352589 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10908))))

(declare-fun b!561546 () Bool)

(declare-fun res!352585 () Bool)

(assert (=> b!561546 (=> (not res!352585) (not e!323592))))

(assert (=> b!561546 (= res!352585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561547 () Bool)

(declare-fun res!352594 () Bool)

(assert (=> b!561547 (=> (not res!352594) (not e!323588))))

(declare-fun arrayContainsKey!0 (array!35250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561547 (= res!352594 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51438 res!352593) b!561535))

(assert (= (and b!561535 res!352592) b!561538))

(assert (= (and b!561538 res!352584) b!561536))

(assert (= (and b!561536 res!352586) b!561547))

(assert (= (and b!561547 res!352594) b!561537))

(assert (= (and b!561537 res!352583) b!561546))

(assert (= (and b!561546 res!352585) b!561545))

(assert (= (and b!561545 res!352589) b!561541))

(assert (= (and b!561541 res!352591) b!561539))

(assert (= (and b!561539 res!352588) b!561542))

(assert (= (and b!561542 (not res!352582)) b!561543))

(assert (= (and b!561543 (not res!352587)) b!561540))

(assert (= (and b!561540 res!352590) b!561544))

(declare-fun m!539555 () Bool)

(assert (=> start!51438 m!539555))

(declare-fun m!539557 () Bool)

(assert (=> start!51438 m!539557))

(declare-fun m!539559 () Bool)

(assert (=> b!561539 m!539559))

(assert (=> b!561539 m!539559))

(declare-fun m!539561 () Bool)

(assert (=> b!561539 m!539561))

(declare-fun m!539563 () Bool)

(assert (=> b!561539 m!539563))

(declare-fun m!539565 () Bool)

(assert (=> b!561539 m!539565))

(assert (=> b!561538 m!539559))

(assert (=> b!561538 m!539559))

(declare-fun m!539567 () Bool)

(assert (=> b!561538 m!539567))

(declare-fun m!539569 () Bool)

(assert (=> b!561544 m!539569))

(declare-fun m!539571 () Bool)

(assert (=> b!561544 m!539571))

(assert (=> b!561543 m!539559))

(declare-fun m!539573 () Bool)

(assert (=> b!561543 m!539573))

(declare-fun m!539575 () Bool)

(assert (=> b!561546 m!539575))

(declare-fun m!539577 () Bool)

(assert (=> b!561547 m!539577))

(declare-fun m!539579 () Bool)

(assert (=> b!561537 m!539579))

(declare-fun m!539581 () Bool)

(assert (=> b!561545 m!539581))

(assert (=> b!561541 m!539559))

(declare-fun m!539583 () Bool)

(assert (=> b!561541 m!539583))

(declare-fun m!539585 () Bool)

(assert (=> b!561541 m!539585))

(assert (=> b!561541 m!539559))

(declare-fun m!539587 () Bool)

(assert (=> b!561541 m!539587))

(assert (=> b!561541 m!539559))

(declare-fun m!539589 () Bool)

(assert (=> b!561541 m!539589))

(declare-fun m!539591 () Bool)

(assert (=> b!561541 m!539591))

(declare-fun m!539593 () Bool)

(assert (=> b!561541 m!539593))

(assert (=> b!561540 m!539559))

(assert (=> b!561540 m!539559))

(declare-fun m!539595 () Bool)

(assert (=> b!561540 m!539595))

(declare-fun m!539597 () Bool)

(assert (=> b!561536 m!539597))

(check-sat (not b!561541) (not b!561544) (not b!561539) (not b!561540) (not b!561546) (not start!51438) (not b!561547) (not b!561545) (not b!561537) (not b!561538) (not b!561536))
(check-sat)
