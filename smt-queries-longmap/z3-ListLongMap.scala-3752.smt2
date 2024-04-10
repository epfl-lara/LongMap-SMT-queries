; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51508 () Bool)

(assert start!51508)

(declare-fun b!563465 () Bool)

(declare-fun res!354623 () Bool)

(declare-fun e!324704 () Bool)

(assert (=> b!563465 (=> (not res!354623) (not e!324704))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35373 0))(
  ( (array!35374 (arr!16987 (Array (_ BitVec 32) (_ BitVec 64))) (size!17351 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35373)

(assert (=> b!563465 (= res!354623 (and (= (size!17351 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17351 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17351 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563466 () Bool)

(declare-fun res!354626 () Bool)

(assert (=> b!563466 (=> (not res!354626) (not e!324704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563466 (= res!354626 (validKeyInArray!0 (select (arr!16987 a!3118) j!142)))))

(declare-fun res!354618 () Bool)

(assert (=> start!51508 (=> (not res!354618) (not e!324704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51508 (= res!354618 (validMask!0 mask!3119))))

(assert (=> start!51508 e!324704))

(assert (=> start!51508 true))

(declare-fun array_inv!12783 (array!35373) Bool)

(assert (=> start!51508 (array_inv!12783 a!3118)))

(declare-fun b!563467 () Bool)

(declare-fun res!354620 () Bool)

(declare-fun e!324705 () Bool)

(assert (=> b!563467 (=> (not res!354620) (not e!324705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35373 (_ BitVec 32)) Bool)

(assert (=> b!563467 (= res!354620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563468 () Bool)

(assert (=> b!563468 (= e!324704 e!324705)))

(declare-fun res!354624 () Bool)

(assert (=> b!563468 (=> (not res!354624) (not e!324705))))

(declare-datatypes ((SeekEntryResult!5436 0))(
  ( (MissingZero!5436 (index!23971 (_ BitVec 32))) (Found!5436 (index!23972 (_ BitVec 32))) (Intermediate!5436 (undefined!6248 Bool) (index!23973 (_ BitVec 32)) (x!52859 (_ BitVec 32))) (Undefined!5436) (MissingVacant!5436 (index!23974 (_ BitVec 32))) )
))
(declare-fun lt!257238 () SeekEntryResult!5436)

(assert (=> b!563468 (= res!354624 (or (= lt!257238 (MissingZero!5436 i!1132)) (= lt!257238 (MissingVacant!5436 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35373 (_ BitVec 32)) SeekEntryResult!5436)

(assert (=> b!563468 (= lt!257238 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563469 () Bool)

(declare-fun res!354617 () Bool)

(assert (=> b!563469 (=> (not res!354617) (not e!324704))))

(declare-fun arrayContainsKey!0 (array!35373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563469 (= res!354617 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563470 () Bool)

(declare-fun res!354625 () Bool)

(assert (=> b!563470 (=> (not res!354625) (not e!324705))))

(declare-datatypes ((List!11067 0))(
  ( (Nil!11064) (Cons!11063 (h!12066 (_ BitVec 64)) (t!17295 List!11067)) )
))
(declare-fun arrayNoDuplicates!0 (array!35373 (_ BitVec 32) List!11067) Bool)

(assert (=> b!563470 (= res!354625 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11064))))

(declare-fun b!563471 () Bool)

(declare-fun res!354621 () Bool)

(assert (=> b!563471 (=> (not res!354621) (not e!324704))))

(assert (=> b!563471 (= res!354621 (validKeyInArray!0 k0!1914))))

(declare-fun b!563472 () Bool)

(declare-fun res!354619 () Bool)

(assert (=> b!563472 (=> (not res!354619) (not e!324705))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35373 (_ BitVec 32)) SeekEntryResult!5436)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563472 (= res!354619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16987 a!3118) j!142) mask!3119) (select (arr!16987 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16987 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16987 a!3118) i!1132 k0!1914) j!142) (array!35374 (store (arr!16987 a!3118) i!1132 k0!1914) (size!17351 a!3118)) mask!3119)))))

(declare-fun b!563473 () Bool)

(assert (=> b!563473 (= e!324705 (not true))))

(declare-fun e!324703 () Bool)

(assert (=> b!563473 e!324703))

(declare-fun res!354622 () Bool)

(assert (=> b!563473 (=> (not res!354622) (not e!324703))))

(assert (=> b!563473 (= res!354622 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17646 0))(
  ( (Unit!17647) )
))
(declare-fun lt!257239 () Unit!17646)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35373 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17646)

(assert (=> b!563473 (= lt!257239 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563474 () Bool)

(assert (=> b!563474 (= e!324703 (= (seekEntryOrOpen!0 (select (arr!16987 a!3118) j!142) a!3118 mask!3119) (Found!5436 j!142)))))

(assert (= (and start!51508 res!354618) b!563465))

(assert (= (and b!563465 res!354623) b!563466))

(assert (= (and b!563466 res!354626) b!563471))

(assert (= (and b!563471 res!354621) b!563469))

(assert (= (and b!563469 res!354617) b!563468))

(assert (= (and b!563468 res!354624) b!563467))

(assert (= (and b!563467 res!354620) b!563470))

(assert (= (and b!563470 res!354625) b!563472))

(assert (= (and b!563472 res!354619) b!563473))

(assert (= (and b!563473 res!354622) b!563474))

(declare-fun m!541815 () Bool)

(assert (=> b!563467 m!541815))

(declare-fun m!541817 () Bool)

(assert (=> b!563472 m!541817))

(declare-fun m!541819 () Bool)

(assert (=> b!563472 m!541819))

(assert (=> b!563472 m!541817))

(declare-fun m!541821 () Bool)

(assert (=> b!563472 m!541821))

(declare-fun m!541823 () Bool)

(assert (=> b!563472 m!541823))

(assert (=> b!563472 m!541821))

(declare-fun m!541825 () Bool)

(assert (=> b!563472 m!541825))

(assert (=> b!563472 m!541819))

(assert (=> b!563472 m!541817))

(declare-fun m!541827 () Bool)

(assert (=> b!563472 m!541827))

(declare-fun m!541829 () Bool)

(assert (=> b!563472 m!541829))

(assert (=> b!563472 m!541821))

(assert (=> b!563472 m!541823))

(assert (=> b!563474 m!541817))

(assert (=> b!563474 m!541817))

(declare-fun m!541831 () Bool)

(assert (=> b!563474 m!541831))

(declare-fun m!541833 () Bool)

(assert (=> b!563473 m!541833))

(declare-fun m!541835 () Bool)

(assert (=> b!563473 m!541835))

(assert (=> b!563466 m!541817))

(assert (=> b!563466 m!541817))

(declare-fun m!541837 () Bool)

(assert (=> b!563466 m!541837))

(declare-fun m!541839 () Bool)

(assert (=> b!563471 m!541839))

(declare-fun m!541841 () Bool)

(assert (=> b!563470 m!541841))

(declare-fun m!541843 () Bool)

(assert (=> b!563468 m!541843))

(declare-fun m!541845 () Bool)

(assert (=> start!51508 m!541845))

(declare-fun m!541847 () Bool)

(assert (=> start!51508 m!541847))

(declare-fun m!541849 () Bool)

(assert (=> b!563469 m!541849))

(check-sat (not b!563472) (not b!563466) (not b!563469) (not b!563470) (not start!51508) (not b!563473) (not b!563471) (not b!563474) (not b!563468) (not b!563467))
(check-sat)
