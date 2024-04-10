; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50788 () Bool)

(assert start!50788)

(declare-fun b!555630 () Bool)

(declare-fun e!320223 () Bool)

(assert (=> b!555630 (= e!320223 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5265 0))(
  ( (MissingZero!5265 (index!23287 (_ BitVec 32))) (Found!5265 (index!23288 (_ BitVec 32))) (Intermediate!5265 (undefined!6077 Bool) (index!23289 (_ BitVec 32)) (x!52187 (_ BitVec 32))) (Undefined!5265) (MissingVacant!5265 (index!23290 (_ BitVec 32))) )
))
(declare-fun lt!252544 () SeekEntryResult!5265)

(declare-fun lt!252542 () SeekEntryResult!5265)

(declare-datatypes ((array!35013 0))(
  ( (array!35014 (arr!16816 (Array (_ BitVec 32) (_ BitVec 64))) (size!17180 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35013)

(get-info :version)

(assert (=> b!555630 (and (= lt!252542 (Found!5265 j!142)) (or (undefined!6077 lt!252544) (not ((_ is Intermediate!5265) lt!252544)) (= (select (arr!16816 a!3118) (index!23289 lt!252544)) (select (arr!16816 a!3118) j!142)) (not (= (select (arr!16816 a!3118) (index!23289 lt!252544)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252542 (MissingZero!5265 (index!23289 lt!252544)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35013 (_ BitVec 32)) SeekEntryResult!5265)

(assert (=> b!555630 (= lt!252542 (seekEntryOrOpen!0 (select (arr!16816 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35013 (_ BitVec 32)) Bool)

(assert (=> b!555630 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17304 0))(
  ( (Unit!17305) )
))
(declare-fun lt!252545 () Unit!17304)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17304)

(assert (=> b!555630 (= lt!252545 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555631 () Bool)

(declare-fun res!348043 () Bool)

(declare-fun e!320221 () Bool)

(assert (=> b!555631 (=> (not res!348043) (not e!320221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555631 (= res!348043 (validKeyInArray!0 (select (arr!16816 a!3118) j!142)))))

(declare-fun b!555632 () Bool)

(declare-fun res!348042 () Bool)

(declare-fun e!320222 () Bool)

(assert (=> b!555632 (=> (not res!348042) (not e!320222))))

(declare-datatypes ((List!10896 0))(
  ( (Nil!10893) (Cons!10892 (h!11877 (_ BitVec 64)) (t!17124 List!10896)) )
))
(declare-fun arrayNoDuplicates!0 (array!35013 (_ BitVec 32) List!10896) Bool)

(assert (=> b!555632 (= res!348042 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10893))))

(declare-fun b!555633 () Bool)

(assert (=> b!555633 (= e!320221 e!320222)))

(declare-fun res!348047 () Bool)

(assert (=> b!555633 (=> (not res!348047) (not e!320222))))

(declare-fun lt!252546 () SeekEntryResult!5265)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555633 (= res!348047 (or (= lt!252546 (MissingZero!5265 i!1132)) (= lt!252546 (MissingVacant!5265 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!555633 (= lt!252546 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555634 () Bool)

(assert (=> b!555634 (= e!320222 e!320223)))

(declare-fun res!348046 () Bool)

(assert (=> b!555634 (=> (not res!348046) (not e!320223))))

(declare-fun lt!252547 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35013 (_ BitVec 32)) SeekEntryResult!5265)

(assert (=> b!555634 (= res!348046 (= lt!252544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252547 (select (store (arr!16816 a!3118) i!1132 k0!1914) j!142) (array!35014 (store (arr!16816 a!3118) i!1132 k0!1914) (size!17180 a!3118)) mask!3119)))))

(declare-fun lt!252543 () (_ BitVec 32))

(assert (=> b!555634 (= lt!252544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252543 (select (arr!16816 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555634 (= lt!252547 (toIndex!0 (select (store (arr!16816 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!555634 (= lt!252543 (toIndex!0 (select (arr!16816 a!3118) j!142) mask!3119))))

(declare-fun b!555636 () Bool)

(declare-fun res!348050 () Bool)

(assert (=> b!555636 (=> (not res!348050) (not e!320221))))

(declare-fun arrayContainsKey!0 (array!35013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555636 (= res!348050 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555637 () Bool)

(declare-fun res!348044 () Bool)

(assert (=> b!555637 (=> (not res!348044) (not e!320221))))

(assert (=> b!555637 (= res!348044 (and (= (size!17180 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17180 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17180 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555638 () Bool)

(declare-fun res!348048 () Bool)

(assert (=> b!555638 (=> (not res!348048) (not e!320221))))

(assert (=> b!555638 (= res!348048 (validKeyInArray!0 k0!1914))))

(declare-fun res!348049 () Bool)

(assert (=> start!50788 (=> (not res!348049) (not e!320221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50788 (= res!348049 (validMask!0 mask!3119))))

(assert (=> start!50788 e!320221))

(assert (=> start!50788 true))

(declare-fun array_inv!12612 (array!35013) Bool)

(assert (=> start!50788 (array_inv!12612 a!3118)))

(declare-fun b!555635 () Bool)

(declare-fun res!348045 () Bool)

(assert (=> b!555635 (=> (not res!348045) (not e!320222))))

(assert (=> b!555635 (= res!348045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50788 res!348049) b!555637))

(assert (= (and b!555637 res!348044) b!555631))

(assert (= (and b!555631 res!348043) b!555638))

(assert (= (and b!555638 res!348048) b!555636))

(assert (= (and b!555636 res!348050) b!555633))

(assert (= (and b!555633 res!348047) b!555635))

(assert (= (and b!555635 res!348045) b!555632))

(assert (= (and b!555632 res!348042) b!555634))

(assert (= (and b!555634 res!348046) b!555630))

(declare-fun m!533393 () Bool)

(assert (=> b!555635 m!533393))

(declare-fun m!533395 () Bool)

(assert (=> b!555633 m!533395))

(declare-fun m!533397 () Bool)

(assert (=> b!555638 m!533397))

(declare-fun m!533399 () Bool)

(assert (=> b!555630 m!533399))

(declare-fun m!533401 () Bool)

(assert (=> b!555630 m!533401))

(declare-fun m!533403 () Bool)

(assert (=> b!555630 m!533403))

(declare-fun m!533405 () Bool)

(assert (=> b!555630 m!533405))

(assert (=> b!555630 m!533401))

(declare-fun m!533407 () Bool)

(assert (=> b!555630 m!533407))

(declare-fun m!533409 () Bool)

(assert (=> b!555632 m!533409))

(assert (=> b!555631 m!533401))

(assert (=> b!555631 m!533401))

(declare-fun m!533411 () Bool)

(assert (=> b!555631 m!533411))

(assert (=> b!555634 m!533401))

(declare-fun m!533413 () Bool)

(assert (=> b!555634 m!533413))

(assert (=> b!555634 m!533401))

(declare-fun m!533415 () Bool)

(assert (=> b!555634 m!533415))

(declare-fun m!533417 () Bool)

(assert (=> b!555634 m!533417))

(assert (=> b!555634 m!533401))

(declare-fun m!533419 () Bool)

(assert (=> b!555634 m!533419))

(assert (=> b!555634 m!533415))

(declare-fun m!533421 () Bool)

(assert (=> b!555634 m!533421))

(assert (=> b!555634 m!533415))

(declare-fun m!533423 () Bool)

(assert (=> b!555634 m!533423))

(declare-fun m!533425 () Bool)

(assert (=> b!555636 m!533425))

(declare-fun m!533427 () Bool)

(assert (=> start!50788 m!533427))

(declare-fun m!533429 () Bool)

(assert (=> start!50788 m!533429))

(check-sat (not b!555630) (not b!555631) (not b!555636) (not b!555632) (not start!50788) (not b!555633) (not b!555635) (not b!555638) (not b!555634))
(check-sat)
