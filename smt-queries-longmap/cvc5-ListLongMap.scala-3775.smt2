; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51704 () Bool)

(assert start!51704)

(declare-fun b!565553 () Bool)

(declare-fun res!356529 () Bool)

(declare-fun e!325608 () Bool)

(assert (=> b!565553 (=> (not res!356529) (not e!325608))))

(declare-datatypes ((array!35512 0))(
  ( (array!35513 (arr!17055 (Array (_ BitVec 32) (_ BitVec 64))) (size!17419 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35512)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35512 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565553 (= res!356529 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565554 () Bool)

(declare-fun res!356528 () Bool)

(assert (=> b!565554 (=> (not res!356528) (not e!325608))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565554 (= res!356528 (and (= (size!17419 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17419 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17419 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565555 () Bool)

(declare-fun res!356530 () Bool)

(declare-fun e!325605 () Bool)

(assert (=> b!565555 (=> (not res!356530) (not e!325605))))

(declare-datatypes ((SeekEntryResult!5504 0))(
  ( (MissingZero!5504 (index!24243 (_ BitVec 32))) (Found!5504 (index!24244 (_ BitVec 32))) (Intermediate!5504 (undefined!6316 Bool) (index!24245 (_ BitVec 32)) (x!53117 (_ BitVec 32))) (Undefined!5504) (MissingVacant!5504 (index!24246 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35512 (_ BitVec 32)) SeekEntryResult!5504)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565555 (= res!356530 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17055 a!3118) j!142) mask!3119) (select (arr!17055 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17055 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17055 a!3118) i!1132 k!1914) j!142) (array!35513 (store (arr!17055 a!3118) i!1132 k!1914) (size!17419 a!3118)) mask!3119)))))

(declare-fun b!565556 () Bool)

(assert (=> b!565556 (= e!325605 (not true))))

(declare-fun e!325606 () Bool)

(assert (=> b!565556 e!325606))

(declare-fun res!356524 () Bool)

(assert (=> b!565556 (=> (not res!356524) (not e!325606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35512 (_ BitVec 32)) Bool)

(assert (=> b!565556 (= res!356524 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17710 0))(
  ( (Unit!17711) )
))
(declare-fun lt!257910 () Unit!17710)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35512 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17710)

(assert (=> b!565556 (= lt!257910 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!356526 () Bool)

(assert (=> start!51704 (=> (not res!356526) (not e!325608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51704 (= res!356526 (validMask!0 mask!3119))))

(assert (=> start!51704 e!325608))

(assert (=> start!51704 true))

(declare-fun array_inv!12851 (array!35512) Bool)

(assert (=> start!51704 (array_inv!12851 a!3118)))

(declare-fun b!565557 () Bool)

(declare-fun res!356531 () Bool)

(assert (=> b!565557 (=> (not res!356531) (not e!325605))))

(assert (=> b!565557 (= res!356531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565558 () Bool)

(declare-fun res!356523 () Bool)

(assert (=> b!565558 (=> (not res!356523) (not e!325605))))

(declare-datatypes ((List!11135 0))(
  ( (Nil!11132) (Cons!11131 (h!12137 (_ BitVec 64)) (t!17363 List!11135)) )
))
(declare-fun arrayNoDuplicates!0 (array!35512 (_ BitVec 32) List!11135) Bool)

(assert (=> b!565558 (= res!356523 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11132))))

(declare-fun b!565559 () Bool)

(declare-fun res!356525 () Bool)

(assert (=> b!565559 (=> (not res!356525) (not e!325608))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565559 (= res!356525 (validKeyInArray!0 (select (arr!17055 a!3118) j!142)))))

(declare-fun b!565560 () Bool)

(declare-fun res!356527 () Bool)

(assert (=> b!565560 (=> (not res!356527) (not e!325608))))

(assert (=> b!565560 (= res!356527 (validKeyInArray!0 k!1914))))

(declare-fun b!565561 () Bool)

(assert (=> b!565561 (= e!325608 e!325605)))

(declare-fun res!356522 () Bool)

(assert (=> b!565561 (=> (not res!356522) (not e!325605))))

(declare-fun lt!257911 () SeekEntryResult!5504)

(assert (=> b!565561 (= res!356522 (or (= lt!257911 (MissingZero!5504 i!1132)) (= lt!257911 (MissingVacant!5504 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35512 (_ BitVec 32)) SeekEntryResult!5504)

(assert (=> b!565561 (= lt!257911 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!565562 () Bool)

(assert (=> b!565562 (= e!325606 (= (seekEntryOrOpen!0 (select (arr!17055 a!3118) j!142) a!3118 mask!3119) (Found!5504 j!142)))))

(assert (= (and start!51704 res!356526) b!565554))

(assert (= (and b!565554 res!356528) b!565559))

(assert (= (and b!565559 res!356525) b!565560))

(assert (= (and b!565560 res!356527) b!565553))

(assert (= (and b!565553 res!356529) b!565561))

(assert (= (and b!565561 res!356522) b!565557))

(assert (= (and b!565557 res!356531) b!565558))

(assert (= (and b!565558 res!356523) b!565555))

(assert (= (and b!565555 res!356530) b!565556))

(assert (= (and b!565556 res!356524) b!565562))

(declare-fun m!544035 () Bool)

(assert (=> b!565562 m!544035))

(assert (=> b!565562 m!544035))

(declare-fun m!544037 () Bool)

(assert (=> b!565562 m!544037))

(declare-fun m!544039 () Bool)

(assert (=> b!565558 m!544039))

(declare-fun m!544041 () Bool)

(assert (=> b!565553 m!544041))

(declare-fun m!544043 () Bool)

(assert (=> b!565561 m!544043))

(declare-fun m!544045 () Bool)

(assert (=> start!51704 m!544045))

(declare-fun m!544047 () Bool)

(assert (=> start!51704 m!544047))

(assert (=> b!565555 m!544035))

(declare-fun m!544049 () Bool)

(assert (=> b!565555 m!544049))

(assert (=> b!565555 m!544035))

(declare-fun m!544051 () Bool)

(assert (=> b!565555 m!544051))

(declare-fun m!544053 () Bool)

(assert (=> b!565555 m!544053))

(assert (=> b!565555 m!544051))

(declare-fun m!544055 () Bool)

(assert (=> b!565555 m!544055))

(assert (=> b!565555 m!544049))

(assert (=> b!565555 m!544035))

(declare-fun m!544057 () Bool)

(assert (=> b!565555 m!544057))

(declare-fun m!544059 () Bool)

(assert (=> b!565555 m!544059))

(assert (=> b!565555 m!544051))

(assert (=> b!565555 m!544053))

(declare-fun m!544061 () Bool)

(assert (=> b!565560 m!544061))

(declare-fun m!544063 () Bool)

(assert (=> b!565557 m!544063))

(declare-fun m!544065 () Bool)

(assert (=> b!565556 m!544065))

(declare-fun m!544067 () Bool)

(assert (=> b!565556 m!544067))

(assert (=> b!565559 m!544035))

(assert (=> b!565559 m!544035))

(declare-fun m!544069 () Bool)

(assert (=> b!565559 m!544069))

(push 1)

