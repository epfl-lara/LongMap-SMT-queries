; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51738 () Bool)

(assert start!51738)

(declare-fun b!565573 () Bool)

(declare-fun res!356446 () Bool)

(declare-fun e!325665 () Bool)

(assert (=> b!565573 (=> (not res!356446) (not e!325665))))

(declare-datatypes ((array!35493 0))(
  ( (array!35494 (arr!17044 (Array (_ BitVec 32) (_ BitVec 64))) (size!17408 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35493)

(declare-datatypes ((List!11031 0))(
  ( (Nil!11028) (Cons!11027 (h!12036 (_ BitVec 64)) (t!17251 List!11031)) )
))
(declare-fun arrayNoDuplicates!0 (array!35493 (_ BitVec 32) List!11031) Bool)

(assert (=> b!565573 (= res!356446 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11028))))

(declare-fun b!565574 () Bool)

(declare-fun res!356439 () Bool)

(assert (=> b!565574 (=> (not res!356439) (not e!325665))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5449 0))(
  ( (MissingZero!5449 (index!24023 (_ BitVec 32))) (Found!5449 (index!24024 (_ BitVec 32))) (Intermediate!5449 (undefined!6261 Bool) (index!24025 (_ BitVec 32)) (x!53049 (_ BitVec 32))) (Undefined!5449) (MissingVacant!5449 (index!24026 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35493 (_ BitVec 32)) SeekEntryResult!5449)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565574 (= res!356439 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17044 a!3118) j!142) mask!3119) (select (arr!17044 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17044 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17044 a!3118) i!1132 k0!1914) j!142) (array!35494 (store (arr!17044 a!3118) i!1132 k0!1914) (size!17408 a!3118)) mask!3119)))))

(declare-fun res!356440 () Bool)

(declare-fun e!325662 () Bool)

(assert (=> start!51738 (=> (not res!356440) (not e!325662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51738 (= res!356440 (validMask!0 mask!3119))))

(assert (=> start!51738 e!325662))

(assert (=> start!51738 true))

(declare-fun array_inv!12903 (array!35493) Bool)

(assert (=> start!51738 (array_inv!12903 a!3118)))

(declare-fun b!565575 () Bool)

(assert (=> b!565575 (= e!325662 e!325665)))

(declare-fun res!356444 () Bool)

(assert (=> b!565575 (=> (not res!356444) (not e!325665))))

(declare-fun lt!257985 () SeekEntryResult!5449)

(assert (=> b!565575 (= res!356444 (or (= lt!257985 (MissingZero!5449 i!1132)) (= lt!257985 (MissingVacant!5449 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35493 (_ BitVec 32)) SeekEntryResult!5449)

(assert (=> b!565575 (= lt!257985 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565576 () Bool)

(declare-fun res!356437 () Bool)

(assert (=> b!565576 (=> (not res!356437) (not e!325662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565576 (= res!356437 (validKeyInArray!0 k0!1914))))

(declare-fun b!565577 () Bool)

(assert (=> b!565577 (= e!325665 (not true))))

(declare-fun e!325663 () Bool)

(assert (=> b!565577 e!325663))

(declare-fun res!356441 () Bool)

(assert (=> b!565577 (=> (not res!356441) (not e!325663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35493 (_ BitVec 32)) Bool)

(assert (=> b!565577 (= res!356441 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17671 0))(
  ( (Unit!17672) )
))
(declare-fun lt!257986 () Unit!17671)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17671)

(assert (=> b!565577 (= lt!257986 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565578 () Bool)

(declare-fun res!356438 () Bool)

(assert (=> b!565578 (=> (not res!356438) (not e!325662))))

(assert (=> b!565578 (= res!356438 (validKeyInArray!0 (select (arr!17044 a!3118) j!142)))))

(declare-fun b!565579 () Bool)

(assert (=> b!565579 (= e!325663 (= (seekEntryOrOpen!0 (select (arr!17044 a!3118) j!142) a!3118 mask!3119) (Found!5449 j!142)))))

(declare-fun b!565580 () Bool)

(declare-fun res!356442 () Bool)

(assert (=> b!565580 (=> (not res!356442) (not e!325662))))

(assert (=> b!565580 (= res!356442 (and (= (size!17408 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17408 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17408 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565581 () Bool)

(declare-fun res!356443 () Bool)

(assert (=> b!565581 (=> (not res!356443) (not e!325662))))

(declare-fun arrayContainsKey!0 (array!35493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565581 (= res!356443 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565582 () Bool)

(declare-fun res!356445 () Bool)

(assert (=> b!565582 (=> (not res!356445) (not e!325665))))

(assert (=> b!565582 (= res!356445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51738 res!356440) b!565580))

(assert (= (and b!565580 res!356442) b!565578))

(assert (= (and b!565578 res!356438) b!565576))

(assert (= (and b!565576 res!356437) b!565581))

(assert (= (and b!565581 res!356443) b!565575))

(assert (= (and b!565575 res!356444) b!565582))

(assert (= (and b!565582 res!356445) b!565573))

(assert (= (and b!565573 res!356446) b!565574))

(assert (= (and b!565574 res!356439) b!565577))

(assert (= (and b!565577 res!356441) b!565579))

(declare-fun m!544157 () Bool)

(assert (=> b!565573 m!544157))

(declare-fun m!544159 () Bool)

(assert (=> b!565578 m!544159))

(assert (=> b!565578 m!544159))

(declare-fun m!544161 () Bool)

(assert (=> b!565578 m!544161))

(declare-fun m!544163 () Bool)

(assert (=> start!51738 m!544163))

(declare-fun m!544165 () Bool)

(assert (=> start!51738 m!544165))

(assert (=> b!565574 m!544159))

(declare-fun m!544167 () Bool)

(assert (=> b!565574 m!544167))

(assert (=> b!565574 m!544159))

(declare-fun m!544169 () Bool)

(assert (=> b!565574 m!544169))

(declare-fun m!544171 () Bool)

(assert (=> b!565574 m!544171))

(assert (=> b!565574 m!544169))

(declare-fun m!544173 () Bool)

(assert (=> b!565574 m!544173))

(assert (=> b!565574 m!544167))

(assert (=> b!565574 m!544159))

(declare-fun m!544175 () Bool)

(assert (=> b!565574 m!544175))

(declare-fun m!544177 () Bool)

(assert (=> b!565574 m!544177))

(assert (=> b!565574 m!544169))

(assert (=> b!565574 m!544171))

(declare-fun m!544179 () Bool)

(assert (=> b!565582 m!544179))

(declare-fun m!544181 () Bool)

(assert (=> b!565575 m!544181))

(declare-fun m!544183 () Bool)

(assert (=> b!565576 m!544183))

(declare-fun m!544185 () Bool)

(assert (=> b!565577 m!544185))

(declare-fun m!544187 () Bool)

(assert (=> b!565577 m!544187))

(declare-fun m!544189 () Bool)

(assert (=> b!565581 m!544189))

(assert (=> b!565579 m!544159))

(assert (=> b!565579 m!544159))

(declare-fun m!544191 () Bool)

(assert (=> b!565579 m!544191))

(check-sat (not b!565582) (not b!565578) (not b!565579) (not start!51738) (not b!565574) (not b!565577) (not b!565575) (not b!565573) (not b!565576) (not b!565581))
(check-sat)
