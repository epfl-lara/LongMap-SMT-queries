; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51710 () Bool)

(assert start!51710)

(declare-fun b!565552 () Bool)

(declare-fun res!356669 () Bool)

(declare-fun e!325541 () Bool)

(assert (=> b!565552 (=> (not res!356669) (not e!325541))))

(declare-datatypes ((array!35527 0))(
  ( (array!35528 (arr!17063 (Array (_ BitVec 32) (_ BitVec 64))) (size!17428 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35527)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35527 (_ BitVec 32)) Bool)

(assert (=> b!565552 (= res!356669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!356668 () Bool)

(declare-fun e!325539 () Bool)

(assert (=> start!51710 (=> (not res!356668) (not e!325539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51710 (= res!356668 (validMask!0 mask!3119))))

(assert (=> start!51710 e!325539))

(assert (=> start!51710 true))

(declare-fun array_inv!12946 (array!35527) Bool)

(assert (=> start!51710 (array_inv!12946 a!3118)))

(declare-fun b!565553 () Bool)

(declare-fun res!356665 () Bool)

(assert (=> b!565553 (=> (not res!356665) (not e!325541))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5509 0))(
  ( (MissingZero!5509 (index!24263 (_ BitVec 32))) (Found!5509 (index!24264 (_ BitVec 32))) (Intermediate!5509 (undefined!6321 Bool) (index!24265 (_ BitVec 32)) (x!53141 (_ BitVec 32))) (Undefined!5509) (MissingVacant!5509 (index!24266 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35527 (_ BitVec 32)) SeekEntryResult!5509)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565553 (= res!356665 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17063 a!3118) j!142) mask!3119) (select (arr!17063 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17063 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17063 a!3118) i!1132 k0!1914) j!142) (array!35528 (store (arr!17063 a!3118) i!1132 k0!1914) (size!17428 a!3118)) mask!3119)))))

(declare-fun b!565554 () Bool)

(declare-fun res!356670 () Bool)

(assert (=> b!565554 (=> (not res!356670) (not e!325541))))

(declare-datatypes ((List!11182 0))(
  ( (Nil!11179) (Cons!11178 (h!12184 (_ BitVec 64)) (t!17401 List!11182)) )
))
(declare-fun arrayNoDuplicates!0 (array!35527 (_ BitVec 32) List!11182) Bool)

(assert (=> b!565554 (= res!356670 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11179))))

(declare-fun e!325540 () Bool)

(declare-fun b!565555 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35527 (_ BitVec 32)) SeekEntryResult!5509)

(assert (=> b!565555 (= e!325540 (= (seekEntryOrOpen!0 (select (arr!17063 a!3118) j!142) a!3118 mask!3119) (Found!5509 j!142)))))

(declare-fun b!565556 () Bool)

(declare-fun res!356672 () Bool)

(assert (=> b!565556 (=> (not res!356672) (not e!325539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565556 (= res!356672 (validKeyInArray!0 k0!1914))))

(declare-fun b!565557 () Bool)

(declare-fun res!356664 () Bool)

(assert (=> b!565557 (=> (not res!356664) (not e!325539))))

(assert (=> b!565557 (= res!356664 (and (= (size!17428 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17428 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17428 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565558 () Bool)

(declare-fun res!356663 () Bool)

(assert (=> b!565558 (=> (not res!356663) (not e!325539))))

(declare-fun arrayContainsKey!0 (array!35527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565558 (= res!356663 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565559 () Bool)

(declare-fun res!356671 () Bool)

(assert (=> b!565559 (=> (not res!356671) (not e!325539))))

(assert (=> b!565559 (= res!356671 (validKeyInArray!0 (select (arr!17063 a!3118) j!142)))))

(declare-fun b!565560 () Bool)

(assert (=> b!565560 (= e!325539 e!325541)))

(declare-fun res!356666 () Bool)

(assert (=> b!565560 (=> (not res!356666) (not e!325541))))

(declare-fun lt!257730 () SeekEntryResult!5509)

(assert (=> b!565560 (= res!356666 (or (= lt!257730 (MissingZero!5509 i!1132)) (= lt!257730 (MissingVacant!5509 i!1132))))))

(assert (=> b!565560 (= lt!257730 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565561 () Bool)

(assert (=> b!565561 (= e!325541 (not true))))

(assert (=> b!565561 e!325540))

(declare-fun res!356667 () Bool)

(assert (=> b!565561 (=> (not res!356667) (not e!325540))))

(assert (=> b!565561 (= res!356667 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17706 0))(
  ( (Unit!17707) )
))
(declare-fun lt!257731 () Unit!17706)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17706)

(assert (=> b!565561 (= lt!257731 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51710 res!356668) b!565557))

(assert (= (and b!565557 res!356664) b!565559))

(assert (= (and b!565559 res!356671) b!565556))

(assert (= (and b!565556 res!356672) b!565558))

(assert (= (and b!565558 res!356663) b!565560))

(assert (= (and b!565560 res!356666) b!565552))

(assert (= (and b!565552 res!356669) b!565554))

(assert (= (and b!565554 res!356670) b!565553))

(assert (= (and b!565553 res!356665) b!565561))

(assert (= (and b!565561 res!356667) b!565555))

(declare-fun m!543587 () Bool)

(assert (=> b!565552 m!543587))

(declare-fun m!543589 () Bool)

(assert (=> b!565560 m!543589))

(declare-fun m!543591 () Bool)

(assert (=> b!565556 m!543591))

(declare-fun m!543593 () Bool)

(assert (=> b!565553 m!543593))

(declare-fun m!543595 () Bool)

(assert (=> b!565553 m!543595))

(assert (=> b!565553 m!543593))

(declare-fun m!543597 () Bool)

(assert (=> b!565553 m!543597))

(declare-fun m!543599 () Bool)

(assert (=> b!565553 m!543599))

(assert (=> b!565553 m!543597))

(declare-fun m!543601 () Bool)

(assert (=> b!565553 m!543601))

(assert (=> b!565553 m!543595))

(assert (=> b!565553 m!543593))

(declare-fun m!543603 () Bool)

(assert (=> b!565553 m!543603))

(declare-fun m!543605 () Bool)

(assert (=> b!565553 m!543605))

(assert (=> b!565553 m!543597))

(assert (=> b!565553 m!543599))

(declare-fun m!543607 () Bool)

(assert (=> b!565558 m!543607))

(declare-fun m!543609 () Bool)

(assert (=> b!565554 m!543609))

(assert (=> b!565559 m!543593))

(assert (=> b!565559 m!543593))

(declare-fun m!543611 () Bool)

(assert (=> b!565559 m!543611))

(declare-fun m!543613 () Bool)

(assert (=> start!51710 m!543613))

(declare-fun m!543615 () Bool)

(assert (=> start!51710 m!543615))

(assert (=> b!565555 m!543593))

(assert (=> b!565555 m!543593))

(declare-fun m!543617 () Bool)

(assert (=> b!565555 m!543617))

(declare-fun m!543619 () Bool)

(assert (=> b!565561 m!543619))

(declare-fun m!543621 () Bool)

(assert (=> b!565561 m!543621))

(check-sat (not b!565553) (not b!565556) (not start!51710) (not b!565559) (not b!565554) (not b!565560) (not b!565552) (not b!565555) (not b!565558) (not b!565561))
(check-sat)
