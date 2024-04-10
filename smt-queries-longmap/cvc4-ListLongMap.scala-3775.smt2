; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51708 () Bool)

(assert start!51708)

(declare-fun b!565613 () Bool)

(declare-fun res!356586 () Bool)

(declare-fun e!325630 () Bool)

(assert (=> b!565613 (=> (not res!356586) (not e!325630))))

(declare-datatypes ((array!35516 0))(
  ( (array!35517 (arr!17057 (Array (_ BitVec 32) (_ BitVec 64))) (size!17421 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35516)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35516 (_ BitVec 32)) Bool)

(assert (=> b!565613 (= res!356586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565614 () Bool)

(declare-fun res!356590 () Bool)

(assert (=> b!565614 (=> (not res!356590) (not e!325630))))

(declare-datatypes ((List!11137 0))(
  ( (Nil!11134) (Cons!11133 (h!12139 (_ BitVec 64)) (t!17365 List!11137)) )
))
(declare-fun arrayNoDuplicates!0 (array!35516 (_ BitVec 32) List!11137) Bool)

(assert (=> b!565614 (= res!356590 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11134))))

(declare-fun b!565615 () Bool)

(declare-fun res!356582 () Bool)

(declare-fun e!325631 () Bool)

(assert (=> b!565615 (=> (not res!356582) (not e!325631))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565615 (= res!356582 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565616 () Bool)

(declare-fun res!356589 () Bool)

(assert (=> b!565616 (=> (not res!356589) (not e!325630))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5506 0))(
  ( (MissingZero!5506 (index!24251 (_ BitVec 32))) (Found!5506 (index!24252 (_ BitVec 32))) (Intermediate!5506 (undefined!6318 Bool) (index!24253 (_ BitVec 32)) (x!53119 (_ BitVec 32))) (Undefined!5506) (MissingVacant!5506 (index!24254 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35516 (_ BitVec 32)) SeekEntryResult!5506)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565616 (= res!356589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17057 a!3118) j!142) mask!3119) (select (arr!17057 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17057 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17057 a!3118) i!1132 k!1914) j!142) (array!35517 (store (arr!17057 a!3118) i!1132 k!1914) (size!17421 a!3118)) mask!3119)))))

(declare-fun e!325629 () Bool)

(declare-fun b!565617 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35516 (_ BitVec 32)) SeekEntryResult!5506)

(assert (=> b!565617 (= e!325629 (= (seekEntryOrOpen!0 (select (arr!17057 a!3118) j!142) a!3118 mask!3119) (Found!5506 j!142)))))

(declare-fun res!356583 () Bool)

(assert (=> start!51708 (=> (not res!356583) (not e!325631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51708 (= res!356583 (validMask!0 mask!3119))))

(assert (=> start!51708 e!325631))

(assert (=> start!51708 true))

(declare-fun array_inv!12853 (array!35516) Bool)

(assert (=> start!51708 (array_inv!12853 a!3118)))

(declare-fun b!565618 () Bool)

(assert (=> b!565618 (= e!325631 e!325630)))

(declare-fun res!356587 () Bool)

(assert (=> b!565618 (=> (not res!356587) (not e!325630))))

(declare-fun lt!257923 () SeekEntryResult!5506)

(assert (=> b!565618 (= res!356587 (or (= lt!257923 (MissingZero!5506 i!1132)) (= lt!257923 (MissingVacant!5506 i!1132))))))

(assert (=> b!565618 (= lt!257923 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!565619 () Bool)

(assert (=> b!565619 (= e!325630 (not true))))

(assert (=> b!565619 e!325629))

(declare-fun res!356588 () Bool)

(assert (=> b!565619 (=> (not res!356588) (not e!325629))))

(assert (=> b!565619 (= res!356588 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17714 0))(
  ( (Unit!17715) )
))
(declare-fun lt!257922 () Unit!17714)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35516 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17714)

(assert (=> b!565619 (= lt!257922 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565620 () Bool)

(declare-fun res!356591 () Bool)

(assert (=> b!565620 (=> (not res!356591) (not e!325631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565620 (= res!356591 (validKeyInArray!0 k!1914))))

(declare-fun b!565621 () Bool)

(declare-fun res!356585 () Bool)

(assert (=> b!565621 (=> (not res!356585) (not e!325631))))

(assert (=> b!565621 (= res!356585 (validKeyInArray!0 (select (arr!17057 a!3118) j!142)))))

(declare-fun b!565622 () Bool)

(declare-fun res!356584 () Bool)

(assert (=> b!565622 (=> (not res!356584) (not e!325631))))

(assert (=> b!565622 (= res!356584 (and (= (size!17421 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17421 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17421 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51708 res!356583) b!565622))

(assert (= (and b!565622 res!356584) b!565621))

(assert (= (and b!565621 res!356585) b!565620))

(assert (= (and b!565620 res!356591) b!565615))

(assert (= (and b!565615 res!356582) b!565618))

(assert (= (and b!565618 res!356587) b!565613))

(assert (= (and b!565613 res!356586) b!565614))

(assert (= (and b!565614 res!356590) b!565616))

(assert (= (and b!565616 res!356589) b!565619))

(assert (= (and b!565619 res!356588) b!565617))

(declare-fun m!544107 () Bool)

(assert (=> b!565615 m!544107))

(declare-fun m!544109 () Bool)

(assert (=> b!565617 m!544109))

(assert (=> b!565617 m!544109))

(declare-fun m!544111 () Bool)

(assert (=> b!565617 m!544111))

(declare-fun m!544113 () Bool)

(assert (=> b!565613 m!544113))

(declare-fun m!544115 () Bool)

(assert (=> b!565620 m!544115))

(assert (=> b!565621 m!544109))

(assert (=> b!565621 m!544109))

(declare-fun m!544117 () Bool)

(assert (=> b!565621 m!544117))

(declare-fun m!544119 () Bool)

(assert (=> b!565618 m!544119))

(declare-fun m!544121 () Bool)

(assert (=> b!565614 m!544121))

(assert (=> b!565616 m!544109))

(declare-fun m!544123 () Bool)

(assert (=> b!565616 m!544123))

(assert (=> b!565616 m!544109))

(declare-fun m!544125 () Bool)

(assert (=> b!565616 m!544125))

(declare-fun m!544127 () Bool)

(assert (=> b!565616 m!544127))

(assert (=> b!565616 m!544125))

(declare-fun m!544129 () Bool)

(assert (=> b!565616 m!544129))

(assert (=> b!565616 m!544123))

(assert (=> b!565616 m!544109))

(declare-fun m!544131 () Bool)

(assert (=> b!565616 m!544131))

(declare-fun m!544133 () Bool)

(assert (=> b!565616 m!544133))

(assert (=> b!565616 m!544125))

(assert (=> b!565616 m!544127))

(declare-fun m!544135 () Bool)

(assert (=> b!565619 m!544135))

(declare-fun m!544137 () Bool)

(assert (=> b!565619 m!544137))

(declare-fun m!544139 () Bool)

(assert (=> start!51708 m!544139))

(declare-fun m!544141 () Bool)

(assert (=> start!51708 m!544141))

(push 1)

