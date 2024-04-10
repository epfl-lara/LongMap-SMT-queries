; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51518 () Bool)

(assert start!51518)

(declare-fun b!563615 () Bool)

(declare-fun res!354776 () Bool)

(declare-fun e!324763 () Bool)

(assert (=> b!563615 (=> (not res!354776) (not e!324763))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35383 0))(
  ( (array!35384 (arr!16992 (Array (_ BitVec 32) (_ BitVec 64))) (size!17356 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35383)

(declare-datatypes ((SeekEntryResult!5441 0))(
  ( (MissingZero!5441 (index!23991 (_ BitVec 32))) (Found!5441 (index!23992 (_ BitVec 32))) (Intermediate!5441 (undefined!6253 Bool) (index!23993 (_ BitVec 32)) (x!52880 (_ BitVec 32))) (Undefined!5441) (MissingVacant!5441 (index!23994 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35383 (_ BitVec 32)) SeekEntryResult!5441)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563615 (= res!354776 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16992 a!3118) j!142) mask!3119) (select (arr!16992 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16992 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16992 a!3118) i!1132 k!1914) j!142) (array!35384 (store (arr!16992 a!3118) i!1132 k!1914) (size!17356 a!3118)) mask!3119)))))

(declare-fun b!563616 () Bool)

(declare-fun res!354769 () Bool)

(declare-fun e!324764 () Bool)

(assert (=> b!563616 (=> (not res!354769) (not e!324764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563616 (= res!354769 (validKeyInArray!0 (select (arr!16992 a!3118) j!142)))))

(declare-fun b!563617 () Bool)

(declare-fun res!354774 () Bool)

(assert (=> b!563617 (=> (not res!354774) (not e!324764))))

(assert (=> b!563617 (= res!354774 (validKeyInArray!0 k!1914))))

(declare-fun b!563618 () Bool)

(assert (=> b!563618 (= e!324764 e!324763)))

(declare-fun res!354768 () Bool)

(assert (=> b!563618 (=> (not res!354768) (not e!324763))))

(declare-fun lt!257269 () SeekEntryResult!5441)

(assert (=> b!563618 (= res!354768 (or (= lt!257269 (MissingZero!5441 i!1132)) (= lt!257269 (MissingVacant!5441 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35383 (_ BitVec 32)) SeekEntryResult!5441)

(assert (=> b!563618 (= lt!257269 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563619 () Bool)

(declare-fun res!354770 () Bool)

(assert (=> b!563619 (=> (not res!354770) (not e!324764))))

(assert (=> b!563619 (= res!354770 (and (= (size!17356 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17356 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17356 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563620 () Bool)

(declare-fun res!354772 () Bool)

(assert (=> b!563620 (=> (not res!354772) (not e!324764))))

(declare-fun arrayContainsKey!0 (array!35383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563620 (= res!354772 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun e!324765 () Bool)

(declare-fun b!563621 () Bool)

(assert (=> b!563621 (= e!324765 (= (seekEntryOrOpen!0 (select (arr!16992 a!3118) j!142) a!3118 mask!3119) (Found!5441 j!142)))))

(declare-fun b!563622 () Bool)

(assert (=> b!563622 (= e!324763 (not true))))

(assert (=> b!563622 e!324765))

(declare-fun res!354775 () Bool)

(assert (=> b!563622 (=> (not res!354775) (not e!324765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35383 (_ BitVec 32)) Bool)

(assert (=> b!563622 (= res!354775 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17656 0))(
  ( (Unit!17657) )
))
(declare-fun lt!257268 () Unit!17656)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35383 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17656)

(assert (=> b!563622 (= lt!257268 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563623 () Bool)

(declare-fun res!354767 () Bool)

(assert (=> b!563623 (=> (not res!354767) (not e!324763))))

(declare-datatypes ((List!11072 0))(
  ( (Nil!11069) (Cons!11068 (h!12071 (_ BitVec 64)) (t!17300 List!11072)) )
))
(declare-fun arrayNoDuplicates!0 (array!35383 (_ BitVec 32) List!11072) Bool)

(assert (=> b!563623 (= res!354767 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11069))))

(declare-fun res!354771 () Bool)

(assert (=> start!51518 (=> (not res!354771) (not e!324764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51518 (= res!354771 (validMask!0 mask!3119))))

(assert (=> start!51518 e!324764))

(assert (=> start!51518 true))

(declare-fun array_inv!12788 (array!35383) Bool)

(assert (=> start!51518 (array_inv!12788 a!3118)))

(declare-fun b!563624 () Bool)

(declare-fun res!354773 () Bool)

(assert (=> b!563624 (=> (not res!354773) (not e!324763))))

(assert (=> b!563624 (= res!354773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51518 res!354771) b!563619))

(assert (= (and b!563619 res!354770) b!563616))

(assert (= (and b!563616 res!354769) b!563617))

(assert (= (and b!563617 res!354774) b!563620))

(assert (= (and b!563620 res!354772) b!563618))

(assert (= (and b!563618 res!354768) b!563624))

(assert (= (and b!563624 res!354773) b!563623))

(assert (= (and b!563623 res!354767) b!563615))

(assert (= (and b!563615 res!354776) b!563622))

(assert (= (and b!563622 res!354775) b!563621))

(declare-fun m!541995 () Bool)

(assert (=> b!563618 m!541995))

(declare-fun m!541997 () Bool)

(assert (=> b!563623 m!541997))

(declare-fun m!541999 () Bool)

(assert (=> b!563624 m!541999))

(declare-fun m!542001 () Bool)

(assert (=> b!563616 m!542001))

(assert (=> b!563616 m!542001))

(declare-fun m!542003 () Bool)

(assert (=> b!563616 m!542003))

(declare-fun m!542005 () Bool)

(assert (=> b!563620 m!542005))

(declare-fun m!542007 () Bool)

(assert (=> b!563617 m!542007))

(declare-fun m!542009 () Bool)

(assert (=> start!51518 m!542009))

(declare-fun m!542011 () Bool)

(assert (=> start!51518 m!542011))

(assert (=> b!563621 m!542001))

(assert (=> b!563621 m!542001))

(declare-fun m!542013 () Bool)

(assert (=> b!563621 m!542013))

(assert (=> b!563615 m!542001))

(declare-fun m!542015 () Bool)

(assert (=> b!563615 m!542015))

(assert (=> b!563615 m!542001))

(declare-fun m!542017 () Bool)

(assert (=> b!563615 m!542017))

(declare-fun m!542019 () Bool)

(assert (=> b!563615 m!542019))

(assert (=> b!563615 m!542017))

(declare-fun m!542021 () Bool)

(assert (=> b!563615 m!542021))

(assert (=> b!563615 m!542015))

(assert (=> b!563615 m!542001))

(declare-fun m!542023 () Bool)

(assert (=> b!563615 m!542023))

(declare-fun m!542025 () Bool)

(assert (=> b!563615 m!542025))

(assert (=> b!563615 m!542017))

(assert (=> b!563615 m!542019))

(declare-fun m!542027 () Bool)

(assert (=> b!563622 m!542027))

(declare-fun m!542029 () Bool)

(assert (=> b!563622 m!542029))

(push 1)

