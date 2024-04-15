; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51332 () Bool)

(assert start!51332)

(declare-fun b!560128 () Bool)

(declare-fun res!351432 () Bool)

(declare-fun e!322706 () Bool)

(assert (=> b!560128 (=> (not res!351432) (not e!322706))))

(declare-datatypes ((array!35206 0))(
  ( (array!35207 (arr!16904 (Array (_ BitVec 32) (_ BitVec 64))) (size!17269 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35206)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35206 (_ BitVec 32)) Bool)

(assert (=> b!560128 (= res!351432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560129 () Bool)

(declare-fun res!351425 () Bool)

(assert (=> b!560129 (=> (not res!351425) (not e!322706))))

(declare-datatypes ((List!11023 0))(
  ( (Nil!11020) (Cons!11019 (h!12022 (_ BitVec 64)) (t!17242 List!11023)) )
))
(declare-fun arrayNoDuplicates!0 (array!35206 (_ BitVec 32) List!11023) Bool)

(assert (=> b!560129 (= res!351425 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11020))))

(declare-fun b!560130 () Bool)

(declare-fun e!322711 () Bool)

(declare-fun e!322709 () Bool)

(assert (=> b!560130 (= e!322711 e!322709)))

(declare-fun res!351430 () Bool)

(assert (=> b!560130 (=> (not res!351430) (not e!322709))))

(declare-datatypes ((SeekEntryResult!5350 0))(
  ( (MissingZero!5350 (index!23627 (_ BitVec 32))) (Found!5350 (index!23628 (_ BitVec 32))) (Intermediate!5350 (undefined!6162 Bool) (index!23629 (_ BitVec 32)) (x!52552 (_ BitVec 32))) (Undefined!5350) (MissingVacant!5350 (index!23630 (_ BitVec 32))) )
))
(declare-fun lt!254555 () SeekEntryResult!5350)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!254560 () SeekEntryResult!5350)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35206 (_ BitVec 32)) SeekEntryResult!5350)

(assert (=> b!560130 (= res!351430 (= lt!254555 (seekKeyOrZeroReturnVacant!0 (x!52552 lt!254560) (index!23629 lt!254560) (index!23629 lt!254560) (select (arr!16904 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560131 () Bool)

(declare-fun res!351422 () Bool)

(declare-fun e!322708 () Bool)

(assert (=> b!560131 (=> (not res!351422) (not e!322708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560131 (= res!351422 (validKeyInArray!0 (select (arr!16904 a!3118) j!142)))))

(declare-fun b!560132 () Bool)

(declare-fun e!322710 () Bool)

(assert (=> b!560132 (= e!322706 e!322710)))

(declare-fun res!351427 () Bool)

(assert (=> b!560132 (=> (not res!351427) (not e!322710))))

(declare-fun lt!254562 () (_ BitVec 64))

(declare-fun lt!254556 () array!35206)

(declare-fun lt!254563 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35206 (_ BitVec 32)) SeekEntryResult!5350)

(assert (=> b!560132 (= res!351427 (= lt!254560 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254563 lt!254562 lt!254556 mask!3119)))))

(declare-fun lt!254561 () (_ BitVec 32))

(assert (=> b!560132 (= lt!254560 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254561 (select (arr!16904 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560132 (= lt!254563 (toIndex!0 lt!254562 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560132 (= lt!254562 (select (store (arr!16904 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560132 (= lt!254561 (toIndex!0 (select (arr!16904 a!3118) j!142) mask!3119))))

(assert (=> b!560132 (= lt!254556 (array!35207 (store (arr!16904 a!3118) i!1132 k0!1914) (size!17269 a!3118)))))

(declare-fun b!560133 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35206 (_ BitVec 32)) SeekEntryResult!5350)

(assert (=> b!560133 (= e!322709 (= (seekEntryOrOpen!0 lt!254562 lt!254556 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52552 lt!254560) (index!23629 lt!254560) (index!23629 lt!254560) lt!254562 lt!254556 mask!3119)))))

(declare-fun b!560134 () Bool)

(assert (=> b!560134 (= e!322710 (not true))))

(declare-fun e!322707 () Bool)

(assert (=> b!560134 e!322707))

(declare-fun res!351424 () Bool)

(assert (=> b!560134 (=> (not res!351424) (not e!322707))))

(assert (=> b!560134 (= res!351424 (= lt!254555 (Found!5350 j!142)))))

(assert (=> b!560134 (= lt!254555 (seekEntryOrOpen!0 (select (arr!16904 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560134 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17460 0))(
  ( (Unit!17461) )
))
(declare-fun lt!254559 () Unit!17460)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17460)

(assert (=> b!560134 (= lt!254559 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!351423 () Bool)

(assert (=> start!51332 (=> (not res!351423) (not e!322708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51332 (= res!351423 (validMask!0 mask!3119))))

(assert (=> start!51332 e!322708))

(assert (=> start!51332 true))

(declare-fun array_inv!12787 (array!35206) Bool)

(assert (=> start!51332 (array_inv!12787 a!3118)))

(declare-fun b!560135 () Bool)

(declare-fun e!322713 () Bool)

(assert (=> b!560135 (= e!322707 e!322713)))

(declare-fun res!351433 () Bool)

(assert (=> b!560135 (=> res!351433 e!322713)))

(get-info :version)

(assert (=> b!560135 (= res!351433 (or (undefined!6162 lt!254560) (not ((_ is Intermediate!5350) lt!254560))))))

(declare-fun b!560136 () Bool)

(declare-fun res!351431 () Bool)

(assert (=> b!560136 (=> (not res!351431) (not e!322708))))

(assert (=> b!560136 (= res!351431 (and (= (size!17269 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17269 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17269 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560137 () Bool)

(declare-fun res!351426 () Bool)

(assert (=> b!560137 (=> (not res!351426) (not e!322708))))

(assert (=> b!560137 (= res!351426 (validKeyInArray!0 k0!1914))))

(declare-fun b!560138 () Bool)

(assert (=> b!560138 (= e!322708 e!322706)))

(declare-fun res!351428 () Bool)

(assert (=> b!560138 (=> (not res!351428) (not e!322706))))

(declare-fun lt!254557 () SeekEntryResult!5350)

(assert (=> b!560138 (= res!351428 (or (= lt!254557 (MissingZero!5350 i!1132)) (= lt!254557 (MissingVacant!5350 i!1132))))))

(assert (=> b!560138 (= lt!254557 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!560139 () Bool)

(assert (=> b!560139 (= e!322713 e!322711)))

(declare-fun res!351429 () Bool)

(assert (=> b!560139 (=> res!351429 e!322711)))

(declare-fun lt!254558 () (_ BitVec 64))

(assert (=> b!560139 (= res!351429 (or (= lt!254558 (select (arr!16904 a!3118) j!142)) (= lt!254558 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560139 (= lt!254558 (select (arr!16904 a!3118) (index!23629 lt!254560)))))

(declare-fun b!560140 () Bool)

(declare-fun res!351434 () Bool)

(assert (=> b!560140 (=> (not res!351434) (not e!322708))))

(declare-fun arrayContainsKey!0 (array!35206 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560140 (= res!351434 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51332 res!351423) b!560136))

(assert (= (and b!560136 res!351431) b!560131))

(assert (= (and b!560131 res!351422) b!560137))

(assert (= (and b!560137 res!351426) b!560140))

(assert (= (and b!560140 res!351434) b!560138))

(assert (= (and b!560138 res!351428) b!560128))

(assert (= (and b!560128 res!351432) b!560129))

(assert (= (and b!560129 res!351425) b!560132))

(assert (= (and b!560132 res!351427) b!560134))

(assert (= (and b!560134 res!351424) b!560135))

(assert (= (and b!560135 (not res!351433)) b!560139))

(assert (= (and b!560139 (not res!351429)) b!560130))

(assert (= (and b!560130 res!351430) b!560133))

(declare-fun m!537389 () Bool)

(assert (=> b!560137 m!537389))

(declare-fun m!537391 () Bool)

(assert (=> b!560139 m!537391))

(declare-fun m!537393 () Bool)

(assert (=> b!560139 m!537393))

(assert (=> b!560134 m!537391))

(assert (=> b!560134 m!537391))

(declare-fun m!537395 () Bool)

(assert (=> b!560134 m!537395))

(declare-fun m!537397 () Bool)

(assert (=> b!560134 m!537397))

(declare-fun m!537399 () Bool)

(assert (=> b!560134 m!537399))

(declare-fun m!537401 () Bool)

(assert (=> b!560128 m!537401))

(declare-fun m!537403 () Bool)

(assert (=> b!560138 m!537403))

(declare-fun m!537405 () Bool)

(assert (=> b!560140 m!537405))

(assert (=> b!560131 m!537391))

(assert (=> b!560131 m!537391))

(declare-fun m!537407 () Bool)

(assert (=> b!560131 m!537407))

(declare-fun m!537409 () Bool)

(assert (=> b!560129 m!537409))

(assert (=> b!560132 m!537391))

(declare-fun m!537411 () Bool)

(assert (=> b!560132 m!537411))

(assert (=> b!560132 m!537391))

(declare-fun m!537413 () Bool)

(assert (=> b!560132 m!537413))

(declare-fun m!537415 () Bool)

(assert (=> b!560132 m!537415))

(declare-fun m!537417 () Bool)

(assert (=> b!560132 m!537417))

(declare-fun m!537419 () Bool)

(assert (=> b!560132 m!537419))

(assert (=> b!560132 m!537391))

(declare-fun m!537421 () Bool)

(assert (=> b!560132 m!537421))

(declare-fun m!537423 () Bool)

(assert (=> start!51332 m!537423))

(declare-fun m!537425 () Bool)

(assert (=> start!51332 m!537425))

(assert (=> b!560130 m!537391))

(assert (=> b!560130 m!537391))

(declare-fun m!537427 () Bool)

(assert (=> b!560130 m!537427))

(declare-fun m!537429 () Bool)

(assert (=> b!560133 m!537429))

(declare-fun m!537431 () Bool)

(assert (=> b!560133 m!537431))

(check-sat (not b!560132) (not b!560128) (not b!560131) (not b!560138) (not b!560137) (not b!560130) (not b!560133) (not b!560129) (not b!560140) (not start!51332) (not b!560134))
(check-sat)
