; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51730 () Bool)

(assert start!51730)

(declare-fun b!565943 () Bool)

(declare-fun e!325764 () Bool)

(declare-fun e!325763 () Bool)

(assert (=> b!565943 (= e!325764 e!325763)))

(declare-fun res!356921 () Bool)

(assert (=> b!565943 (=> (not res!356921) (not e!325763))))

(declare-datatypes ((SeekEntryResult!5517 0))(
  ( (MissingZero!5517 (index!24295 (_ BitVec 32))) (Found!5517 (index!24296 (_ BitVec 32))) (Intermediate!5517 (undefined!6329 Bool) (index!24297 (_ BitVec 32)) (x!53162 (_ BitVec 32))) (Undefined!5517) (MissingVacant!5517 (index!24298 (_ BitVec 32))) )
))
(declare-fun lt!257988 () SeekEntryResult!5517)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565943 (= res!356921 (or (= lt!257988 (MissingZero!5517 i!1132)) (= lt!257988 (MissingVacant!5517 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35538 0))(
  ( (array!35539 (arr!17068 (Array (_ BitVec 32) (_ BitVec 64))) (size!17432 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35538)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35538 (_ BitVec 32)) SeekEntryResult!5517)

(assert (=> b!565943 (= lt!257988 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565944 () Bool)

(declare-fun res!356912 () Bool)

(assert (=> b!565944 (=> (not res!356912) (not e!325764))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!565944 (= res!356912 (and (= (size!17432 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17432 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17432 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565945 () Bool)

(assert (=> b!565945 (= e!325763 (not true))))

(declare-fun e!325762 () Bool)

(assert (=> b!565945 e!325762))

(declare-fun res!356914 () Bool)

(assert (=> b!565945 (=> (not res!356914) (not e!325762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35538 (_ BitVec 32)) Bool)

(assert (=> b!565945 (= res!356914 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17736 0))(
  ( (Unit!17737) )
))
(declare-fun lt!257989 () Unit!17736)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17736)

(assert (=> b!565945 (= lt!257989 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!356916 () Bool)

(assert (=> start!51730 (=> (not res!356916) (not e!325764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51730 (= res!356916 (validMask!0 mask!3119))))

(assert (=> start!51730 e!325764))

(assert (=> start!51730 true))

(declare-fun array_inv!12864 (array!35538) Bool)

(assert (=> start!51730 (array_inv!12864 a!3118)))

(declare-fun b!565946 () Bool)

(declare-fun res!356917 () Bool)

(assert (=> b!565946 (=> (not res!356917) (not e!325764))))

(declare-fun arrayContainsKey!0 (array!35538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565946 (= res!356917 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565947 () Bool)

(declare-fun res!356915 () Bool)

(assert (=> b!565947 (=> (not res!356915) (not e!325763))))

(declare-datatypes ((List!11148 0))(
  ( (Nil!11145) (Cons!11144 (h!12150 (_ BitVec 64)) (t!17376 List!11148)) )
))
(declare-fun arrayNoDuplicates!0 (array!35538 (_ BitVec 32) List!11148) Bool)

(assert (=> b!565947 (= res!356915 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11145))))

(declare-fun b!565948 () Bool)

(declare-fun res!356919 () Bool)

(assert (=> b!565948 (=> (not res!356919) (not e!325764))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565948 (= res!356919 (validKeyInArray!0 k0!1914))))

(declare-fun b!565949 () Bool)

(declare-fun res!356913 () Bool)

(assert (=> b!565949 (=> (not res!356913) (not e!325763))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35538 (_ BitVec 32)) SeekEntryResult!5517)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565949 (= res!356913 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17068 a!3118) j!142) mask!3119) (select (arr!17068 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17068 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17068 a!3118) i!1132 k0!1914) j!142) (array!35539 (store (arr!17068 a!3118) i!1132 k0!1914) (size!17432 a!3118)) mask!3119)))))

(declare-fun b!565950 () Bool)

(declare-fun res!356918 () Bool)

(assert (=> b!565950 (=> (not res!356918) (not e!325764))))

(assert (=> b!565950 (= res!356918 (validKeyInArray!0 (select (arr!17068 a!3118) j!142)))))

(declare-fun b!565951 () Bool)

(assert (=> b!565951 (= e!325762 (= (seekEntryOrOpen!0 (select (arr!17068 a!3118) j!142) a!3118 mask!3119) (Found!5517 j!142)))))

(declare-fun b!565952 () Bool)

(declare-fun res!356920 () Bool)

(assert (=> b!565952 (=> (not res!356920) (not e!325763))))

(assert (=> b!565952 (= res!356920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51730 res!356916) b!565944))

(assert (= (and b!565944 res!356912) b!565950))

(assert (= (and b!565950 res!356918) b!565948))

(assert (= (and b!565948 res!356919) b!565946))

(assert (= (and b!565946 res!356917) b!565943))

(assert (= (and b!565943 res!356921) b!565952))

(assert (= (and b!565952 res!356920) b!565947))

(assert (= (and b!565947 res!356915) b!565949))

(assert (= (and b!565949 res!356913) b!565945))

(assert (= (and b!565945 res!356914) b!565951))

(declare-fun m!544503 () Bool)

(assert (=> b!565943 m!544503))

(declare-fun m!544505 () Bool)

(assert (=> b!565950 m!544505))

(assert (=> b!565950 m!544505))

(declare-fun m!544507 () Bool)

(assert (=> b!565950 m!544507))

(declare-fun m!544509 () Bool)

(assert (=> start!51730 m!544509))

(declare-fun m!544511 () Bool)

(assert (=> start!51730 m!544511))

(declare-fun m!544513 () Bool)

(assert (=> b!565945 m!544513))

(declare-fun m!544515 () Bool)

(assert (=> b!565945 m!544515))

(declare-fun m!544517 () Bool)

(assert (=> b!565947 m!544517))

(assert (=> b!565949 m!544505))

(declare-fun m!544519 () Bool)

(assert (=> b!565949 m!544519))

(assert (=> b!565949 m!544505))

(declare-fun m!544521 () Bool)

(assert (=> b!565949 m!544521))

(declare-fun m!544523 () Bool)

(assert (=> b!565949 m!544523))

(assert (=> b!565949 m!544521))

(declare-fun m!544525 () Bool)

(assert (=> b!565949 m!544525))

(assert (=> b!565949 m!544519))

(assert (=> b!565949 m!544505))

(declare-fun m!544527 () Bool)

(assert (=> b!565949 m!544527))

(declare-fun m!544529 () Bool)

(assert (=> b!565949 m!544529))

(assert (=> b!565949 m!544521))

(assert (=> b!565949 m!544523))

(declare-fun m!544531 () Bool)

(assert (=> b!565946 m!544531))

(declare-fun m!544533 () Bool)

(assert (=> b!565948 m!544533))

(declare-fun m!544535 () Bool)

(assert (=> b!565952 m!544535))

(assert (=> b!565951 m!544505))

(assert (=> b!565951 m!544505))

(declare-fun m!544537 () Bool)

(assert (=> b!565951 m!544537))

(check-sat (not b!565943) (not b!565949) (not b!565950) (not b!565945) (not b!565951) (not b!565946) (not start!51730) (not b!565947) (not b!565952) (not b!565948))
(check-sat)
