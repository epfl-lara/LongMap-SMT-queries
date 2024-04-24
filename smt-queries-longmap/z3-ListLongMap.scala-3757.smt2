; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51582 () Bool)

(assert start!51582)

(declare-fun b!564087 () Bool)

(declare-fun e!325014 () Bool)

(declare-fun e!325012 () Bool)

(assert (=> b!564087 (= e!325014 e!325012)))

(declare-fun res!355135 () Bool)

(assert (=> b!564087 (=> (not res!355135) (not e!325012))))

(declare-datatypes ((SeekEntryResult!5401 0))(
  ( (MissingZero!5401 (index!23831 (_ BitVec 32))) (Found!5401 (index!23832 (_ BitVec 32))) (Intermediate!5401 (undefined!6213 Bool) (index!23833 (_ BitVec 32)) (x!52867 (_ BitVec 32))) (Undefined!5401) (MissingVacant!5401 (index!23834 (_ BitVec 32))) )
))
(declare-fun lt!257478 () SeekEntryResult!5401)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564087 (= res!355135 (or (= lt!257478 (MissingZero!5401 i!1132)) (= lt!257478 (MissingVacant!5401 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35394 0))(
  ( (array!35395 (arr!16996 (Array (_ BitVec 32) (_ BitVec 64))) (size!17360 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35394)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35394 (_ BitVec 32)) SeekEntryResult!5401)

(assert (=> b!564087 (= lt!257478 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564088 () Bool)

(declare-fun res!355137 () Bool)

(assert (=> b!564088 (=> (not res!355137) (not e!325012))))

(declare-datatypes ((List!10983 0))(
  ( (Nil!10980) (Cons!10979 (h!11985 (_ BitVec 64)) (t!17203 List!10983)) )
))
(declare-fun arrayNoDuplicates!0 (array!35394 (_ BitVec 32) List!10983) Bool)

(assert (=> b!564088 (= res!355137 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10980))))

(declare-fun b!564089 () Bool)

(declare-fun e!325015 () Bool)

(assert (=> b!564089 (= e!325012 e!325015)))

(declare-fun res!355134 () Bool)

(assert (=> b!564089 (=> (not res!355134) (not e!325015))))

(declare-fun lt!257479 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!257480 () SeekEntryResult!5401)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35394 (_ BitVec 32)) SeekEntryResult!5401)

(assert (=> b!564089 (= res!355134 (= lt!257480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257479 (select (store (arr!16996 a!3118) i!1132 k0!1914) j!142) (array!35395 (store (arr!16996 a!3118) i!1132 k0!1914) (size!17360 a!3118)) mask!3119)))))

(declare-fun lt!257481 () (_ BitVec 32))

(assert (=> b!564089 (= lt!257480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257481 (select (arr!16996 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564089 (= lt!257479 (toIndex!0 (select (store (arr!16996 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!564089 (= lt!257481 (toIndex!0 (select (arr!16996 a!3118) j!142) mask!3119))))

(declare-fun b!564090 () Bool)

(declare-fun e!325013 () Bool)

(assert (=> b!564090 (= e!325013 (= (seekEntryOrOpen!0 (select (arr!16996 a!3118) j!142) a!3118 mask!3119) (Found!5401 j!142)))))

(declare-fun b!564091 () Bool)

(declare-fun res!355138 () Bool)

(assert (=> b!564091 (=> (not res!355138) (not e!325014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564091 (= res!355138 (validKeyInArray!0 k0!1914))))

(declare-fun b!564092 () Bool)

(declare-fun e!325017 () Bool)

(assert (=> b!564092 (= e!325015 (not e!325017))))

(declare-fun res!355142 () Bool)

(assert (=> b!564092 (=> res!355142 e!325017)))

(declare-fun lt!257482 () Bool)

(assert (=> b!564092 (= res!355142 (or (and (not lt!257482) (undefined!6213 lt!257480)) (and (not lt!257482) (not (undefined!6213 lt!257480))) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!564092 (= lt!257482 (not ((_ is Intermediate!5401) lt!257480)))))

(assert (=> b!564092 e!325013))

(declare-fun res!355140 () Bool)

(assert (=> b!564092 (=> (not res!355140) (not e!325013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35394 (_ BitVec 32)) Bool)

(assert (=> b!564092 (= res!355140 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17647 0))(
  ( (Unit!17648) )
))
(declare-fun lt!257477 () Unit!17647)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17647)

(assert (=> b!564092 (= lt!257477 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!564093 () Bool)

(declare-fun res!355139 () Bool)

(assert (=> b!564093 (=> (not res!355139) (not e!325014))))

(declare-fun arrayContainsKey!0 (array!35394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564093 (= res!355139 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564094 () Bool)

(declare-fun res!355141 () Bool)

(assert (=> b!564094 (=> (not res!355141) (not e!325014))))

(assert (=> b!564094 (= res!355141 (validKeyInArray!0 (select (arr!16996 a!3118) j!142)))))

(declare-fun res!355136 () Bool)

(assert (=> start!51582 (=> (not res!355136) (not e!325014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51582 (= res!355136 (validMask!0 mask!3119))))

(assert (=> start!51582 e!325014))

(assert (=> start!51582 true))

(declare-fun array_inv!12855 (array!35394) Bool)

(assert (=> start!51582 (array_inv!12855 a!3118)))

(declare-fun b!564095 () Bool)

(declare-fun res!355143 () Bool)

(assert (=> b!564095 (=> (not res!355143) (not e!325012))))

(assert (=> b!564095 (= res!355143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564096 () Bool)

(assert (=> b!564096 (= e!325017 (validKeyInArray!0 (select (store (arr!16996 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun b!564097 () Bool)

(declare-fun res!355144 () Bool)

(assert (=> b!564097 (=> (not res!355144) (not e!325014))))

(assert (=> b!564097 (= res!355144 (and (= (size!17360 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17360 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17360 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51582 res!355136) b!564097))

(assert (= (and b!564097 res!355144) b!564094))

(assert (= (and b!564094 res!355141) b!564091))

(assert (= (and b!564091 res!355138) b!564093))

(assert (= (and b!564093 res!355139) b!564087))

(assert (= (and b!564087 res!355135) b!564095))

(assert (= (and b!564095 res!355143) b!564088))

(assert (= (and b!564088 res!355137) b!564089))

(assert (= (and b!564089 res!355134) b!564092))

(assert (= (and b!564092 res!355140) b!564090))

(assert (= (and b!564092 (not res!355142)) b!564096))

(declare-fun m!542657 () Bool)

(assert (=> b!564087 m!542657))

(declare-fun m!542659 () Bool)

(assert (=> b!564092 m!542659))

(declare-fun m!542661 () Bool)

(assert (=> b!564092 m!542661))

(declare-fun m!542663 () Bool)

(assert (=> b!564094 m!542663))

(assert (=> b!564094 m!542663))

(declare-fun m!542665 () Bool)

(assert (=> b!564094 m!542665))

(declare-fun m!542667 () Bool)

(assert (=> b!564088 m!542667))

(declare-fun m!542669 () Bool)

(assert (=> b!564096 m!542669))

(declare-fun m!542671 () Bool)

(assert (=> b!564096 m!542671))

(assert (=> b!564096 m!542671))

(declare-fun m!542673 () Bool)

(assert (=> b!564096 m!542673))

(declare-fun m!542675 () Bool)

(assert (=> start!51582 m!542675))

(declare-fun m!542677 () Bool)

(assert (=> start!51582 m!542677))

(declare-fun m!542679 () Bool)

(assert (=> b!564091 m!542679))

(declare-fun m!542681 () Bool)

(assert (=> b!564095 m!542681))

(declare-fun m!542683 () Bool)

(assert (=> b!564093 m!542683))

(assert (=> b!564090 m!542663))

(assert (=> b!564090 m!542663))

(declare-fun m!542685 () Bool)

(assert (=> b!564090 m!542685))

(assert (=> b!564089 m!542663))

(declare-fun m!542687 () Bool)

(assert (=> b!564089 m!542687))

(assert (=> b!564089 m!542671))

(declare-fun m!542689 () Bool)

(assert (=> b!564089 m!542689))

(assert (=> b!564089 m!542663))

(declare-fun m!542691 () Bool)

(assert (=> b!564089 m!542691))

(assert (=> b!564089 m!542663))

(assert (=> b!564089 m!542671))

(assert (=> b!564089 m!542669))

(assert (=> b!564089 m!542671))

(declare-fun m!542693 () Bool)

(assert (=> b!564089 m!542693))

(check-sat (not start!51582) (not b!564095) (not b!564091) (not b!564087) (not b!564089) (not b!564093) (not b!564096) (not b!564094) (not b!564088) (not b!564090) (not b!564092))
(check-sat)
