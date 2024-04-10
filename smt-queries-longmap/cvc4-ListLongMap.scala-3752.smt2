; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51510 () Bool)

(assert start!51510)

(declare-fun b!563495 () Bool)

(declare-fun res!354653 () Bool)

(declare-fun e!324715 () Bool)

(assert (=> b!563495 (=> (not res!354653) (not e!324715))))

(declare-datatypes ((array!35375 0))(
  ( (array!35376 (arr!16988 (Array (_ BitVec 32) (_ BitVec 64))) (size!17352 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35375)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563495 (= res!354653 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563496 () Bool)

(declare-fun res!354656 () Bool)

(declare-fun e!324714 () Bool)

(assert (=> b!563496 (=> (not res!354656) (not e!324714))))

(declare-datatypes ((List!11068 0))(
  ( (Nil!11065) (Cons!11064 (h!12067 (_ BitVec 64)) (t!17296 List!11068)) )
))
(declare-fun arrayNoDuplicates!0 (array!35375 (_ BitVec 32) List!11068) Bool)

(assert (=> b!563496 (= res!354656 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11065))))

(declare-fun b!563497 () Bool)

(assert (=> b!563497 (= e!324715 e!324714)))

(declare-fun res!354654 () Bool)

(assert (=> b!563497 (=> (not res!354654) (not e!324714))))

(declare-datatypes ((SeekEntryResult!5437 0))(
  ( (MissingZero!5437 (index!23975 (_ BitVec 32))) (Found!5437 (index!23976 (_ BitVec 32))) (Intermediate!5437 (undefined!6249 Bool) (index!23977 (_ BitVec 32)) (x!52860 (_ BitVec 32))) (Undefined!5437) (MissingVacant!5437 (index!23978 (_ BitVec 32))) )
))
(declare-fun lt!257244 () SeekEntryResult!5437)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563497 (= res!354654 (or (= lt!257244 (MissingZero!5437 i!1132)) (= lt!257244 (MissingVacant!5437 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35375 (_ BitVec 32)) SeekEntryResult!5437)

(assert (=> b!563497 (= lt!257244 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!563498 () Bool)

(declare-fun res!354650 () Bool)

(assert (=> b!563498 (=> (not res!354650) (not e!324715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563498 (= res!354650 (validKeyInArray!0 k!1914))))

(declare-fun b!563499 () Bool)

(declare-fun res!354648 () Bool)

(assert (=> b!563499 (=> (not res!354648) (not e!324714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35375 (_ BitVec 32)) Bool)

(assert (=> b!563499 (= res!354648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563501 () Bool)

(declare-fun res!354652 () Bool)

(assert (=> b!563501 (=> (not res!354652) (not e!324715))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!563501 (= res!354652 (validKeyInArray!0 (select (arr!16988 a!3118) j!142)))))

(declare-fun b!563502 () Bool)

(assert (=> b!563502 (= e!324714 (not true))))

(declare-fun e!324716 () Bool)

(assert (=> b!563502 e!324716))

(declare-fun res!354651 () Bool)

(assert (=> b!563502 (=> (not res!354651) (not e!324716))))

(assert (=> b!563502 (= res!354651 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17648 0))(
  ( (Unit!17649) )
))
(declare-fun lt!257245 () Unit!17648)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35375 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17648)

(assert (=> b!563502 (= lt!257245 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563503 () Bool)

(declare-fun res!354649 () Bool)

(assert (=> b!563503 (=> (not res!354649) (not e!324715))))

(assert (=> b!563503 (= res!354649 (and (= (size!17352 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17352 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17352 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563504 () Bool)

(assert (=> b!563504 (= e!324716 (= (seekEntryOrOpen!0 (select (arr!16988 a!3118) j!142) a!3118 mask!3119) (Found!5437 j!142)))))

(declare-fun res!354655 () Bool)

(assert (=> start!51510 (=> (not res!354655) (not e!324715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51510 (= res!354655 (validMask!0 mask!3119))))

(assert (=> start!51510 e!324715))

(assert (=> start!51510 true))

(declare-fun array_inv!12784 (array!35375) Bool)

(assert (=> start!51510 (array_inv!12784 a!3118)))

(declare-fun b!563500 () Bool)

(declare-fun res!354647 () Bool)

(assert (=> b!563500 (=> (not res!354647) (not e!324714))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35375 (_ BitVec 32)) SeekEntryResult!5437)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563500 (= res!354647 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16988 a!3118) j!142) mask!3119) (select (arr!16988 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16988 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16988 a!3118) i!1132 k!1914) j!142) (array!35376 (store (arr!16988 a!3118) i!1132 k!1914) (size!17352 a!3118)) mask!3119)))))

(assert (= (and start!51510 res!354655) b!563503))

(assert (= (and b!563503 res!354649) b!563501))

(assert (= (and b!563501 res!354652) b!563498))

(assert (= (and b!563498 res!354650) b!563495))

(assert (= (and b!563495 res!354653) b!563497))

(assert (= (and b!563497 res!354654) b!563499))

(assert (= (and b!563499 res!354648) b!563496))

(assert (= (and b!563496 res!354656) b!563500))

(assert (= (and b!563500 res!354647) b!563502))

(assert (= (and b!563502 res!354651) b!563504))

(declare-fun m!541851 () Bool)

(assert (=> b!563495 m!541851))

(declare-fun m!541853 () Bool)

(assert (=> b!563499 m!541853))

(declare-fun m!541855 () Bool)

(assert (=> b!563504 m!541855))

(assert (=> b!563504 m!541855))

(declare-fun m!541857 () Bool)

(assert (=> b!563504 m!541857))

(assert (=> b!563501 m!541855))

(assert (=> b!563501 m!541855))

(declare-fun m!541859 () Bool)

(assert (=> b!563501 m!541859))

(declare-fun m!541861 () Bool)

(assert (=> b!563497 m!541861))

(declare-fun m!541863 () Bool)

(assert (=> start!51510 m!541863))

(declare-fun m!541865 () Bool)

(assert (=> start!51510 m!541865))

(declare-fun m!541867 () Bool)

(assert (=> b!563496 m!541867))

(declare-fun m!541869 () Bool)

(assert (=> b!563498 m!541869))

(declare-fun m!541871 () Bool)

(assert (=> b!563502 m!541871))

(declare-fun m!541873 () Bool)

(assert (=> b!563502 m!541873))

(assert (=> b!563500 m!541855))

(declare-fun m!541875 () Bool)

(assert (=> b!563500 m!541875))

(assert (=> b!563500 m!541855))

(declare-fun m!541877 () Bool)

(assert (=> b!563500 m!541877))

(declare-fun m!541879 () Bool)

(assert (=> b!563500 m!541879))

(assert (=> b!563500 m!541877))

(declare-fun m!541881 () Bool)

(assert (=> b!563500 m!541881))

(assert (=> b!563500 m!541875))

(assert (=> b!563500 m!541855))

(declare-fun m!541883 () Bool)

(assert (=> b!563500 m!541883))

(declare-fun m!541885 () Bool)

(assert (=> b!563500 m!541885))

(assert (=> b!563500 m!541877))

(assert (=> b!563500 m!541879))

(push 1)

