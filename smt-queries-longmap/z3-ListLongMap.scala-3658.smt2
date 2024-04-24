; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50550 () Bool)

(assert start!50550)

(declare-fun b!552274 () Bool)

(declare-fun res!344773 () Bool)

(declare-fun e!318714 () Bool)

(assert (=> b!552274 (=> (not res!344773) (not e!318714))))

(declare-datatypes ((array!34779 0))(
  ( (array!34780 (arr!16699 (Array (_ BitVec 32) (_ BitVec 64))) (size!17063 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34779)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552274 (= res!344773 (validKeyInArray!0 (select (arr!16699 a!3118) j!142)))))

(declare-fun b!552275 () Bool)

(declare-fun e!318711 () Bool)

(assert (=> b!552275 (= e!318714 e!318711)))

(declare-fun res!344766 () Bool)

(assert (=> b!552275 (=> (not res!344766) (not e!318711))))

(declare-datatypes ((SeekEntryResult!5104 0))(
  ( (MissingZero!5104 (index!22643 (_ BitVec 32))) (Found!5104 (index!22644 (_ BitVec 32))) (Intermediate!5104 (undefined!5916 Bool) (index!22645 (_ BitVec 32)) (x!51727 (_ BitVec 32))) (Undefined!5104) (MissingVacant!5104 (index!22646 (_ BitVec 32))) )
))
(declare-fun lt!251140 () SeekEntryResult!5104)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552275 (= res!344766 (or (= lt!251140 (MissingZero!5104 i!1132)) (= lt!251140 (MissingVacant!5104 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34779 (_ BitVec 32)) SeekEntryResult!5104)

(assert (=> b!552275 (= lt!251140 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552276 () Bool)

(assert (=> b!552276 (= e!318711 (not true))))

(declare-fun e!318712 () Bool)

(assert (=> b!552276 e!318712))

(declare-fun res!344767 () Bool)

(assert (=> b!552276 (=> (not res!344767) (not e!318712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34779 (_ BitVec 32)) Bool)

(assert (=> b!552276 (= res!344767 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17053 0))(
  ( (Unit!17054) )
))
(declare-fun lt!251139 () Unit!17053)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17053)

(assert (=> b!552276 (= lt!251139 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552277 () Bool)

(declare-fun res!344769 () Bool)

(assert (=> b!552277 (=> (not res!344769) (not e!318714))))

(assert (=> b!552277 (= res!344769 (and (= (size!17063 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17063 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17063 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!344771 () Bool)

(assert (=> start!50550 (=> (not res!344771) (not e!318714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50550 (= res!344771 (validMask!0 mask!3119))))

(assert (=> start!50550 e!318714))

(assert (=> start!50550 true))

(declare-fun array_inv!12558 (array!34779) Bool)

(assert (=> start!50550 (array_inv!12558 a!3118)))

(declare-fun b!552278 () Bool)

(declare-fun res!344770 () Bool)

(assert (=> b!552278 (=> (not res!344770) (not e!318711))))

(assert (=> b!552278 (= res!344770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552279 () Bool)

(declare-fun res!344764 () Bool)

(assert (=> b!552279 (=> (not res!344764) (not e!318711))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34779 (_ BitVec 32)) SeekEntryResult!5104)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552279 (= res!344764 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16699 a!3118) j!142) mask!3119) (select (arr!16699 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16699 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16699 a!3118) i!1132 k0!1914) j!142) (array!34780 (store (arr!16699 a!3118) i!1132 k0!1914) (size!17063 a!3118)) mask!3119)))))

(declare-fun b!552280 () Bool)

(declare-fun res!344772 () Bool)

(assert (=> b!552280 (=> (not res!344772) (not e!318714))))

(declare-fun arrayContainsKey!0 (array!34779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552280 (= res!344772 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552281 () Bool)

(assert (=> b!552281 (= e!318712 (= (seekEntryOrOpen!0 (select (arr!16699 a!3118) j!142) a!3118 mask!3119) (Found!5104 j!142)))))

(declare-fun b!552282 () Bool)

(declare-fun res!344768 () Bool)

(assert (=> b!552282 (=> (not res!344768) (not e!318714))))

(assert (=> b!552282 (= res!344768 (validKeyInArray!0 k0!1914))))

(declare-fun b!552283 () Bool)

(declare-fun res!344765 () Bool)

(assert (=> b!552283 (=> (not res!344765) (not e!318711))))

(declare-datatypes ((List!10686 0))(
  ( (Nil!10683) (Cons!10682 (h!11667 (_ BitVec 64)) (t!16906 List!10686)) )
))
(declare-fun arrayNoDuplicates!0 (array!34779 (_ BitVec 32) List!10686) Bool)

(assert (=> b!552283 (= res!344765 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10683))))

(assert (= (and start!50550 res!344771) b!552277))

(assert (= (and b!552277 res!344769) b!552274))

(assert (= (and b!552274 res!344773) b!552282))

(assert (= (and b!552282 res!344768) b!552280))

(assert (= (and b!552280 res!344772) b!552275))

(assert (= (and b!552275 res!344766) b!552278))

(assert (= (and b!552278 res!344770) b!552283))

(assert (= (and b!552283 res!344765) b!552279))

(assert (= (and b!552279 res!344764) b!552276))

(assert (= (and b!552276 res!344767) b!552281))

(declare-fun m!529373 () Bool)

(assert (=> b!552275 m!529373))

(declare-fun m!529375 () Bool)

(assert (=> b!552279 m!529375))

(declare-fun m!529377 () Bool)

(assert (=> b!552279 m!529377))

(assert (=> b!552279 m!529375))

(declare-fun m!529379 () Bool)

(assert (=> b!552279 m!529379))

(declare-fun m!529381 () Bool)

(assert (=> b!552279 m!529381))

(assert (=> b!552279 m!529379))

(declare-fun m!529383 () Bool)

(assert (=> b!552279 m!529383))

(assert (=> b!552279 m!529377))

(assert (=> b!552279 m!529375))

(declare-fun m!529385 () Bool)

(assert (=> b!552279 m!529385))

(declare-fun m!529387 () Bool)

(assert (=> b!552279 m!529387))

(assert (=> b!552279 m!529379))

(assert (=> b!552279 m!529381))

(assert (=> b!552281 m!529375))

(assert (=> b!552281 m!529375))

(declare-fun m!529389 () Bool)

(assert (=> b!552281 m!529389))

(declare-fun m!529391 () Bool)

(assert (=> b!552282 m!529391))

(declare-fun m!529393 () Bool)

(assert (=> start!50550 m!529393))

(declare-fun m!529395 () Bool)

(assert (=> start!50550 m!529395))

(declare-fun m!529397 () Bool)

(assert (=> b!552276 m!529397))

(declare-fun m!529399 () Bool)

(assert (=> b!552276 m!529399))

(declare-fun m!529401 () Bool)

(assert (=> b!552283 m!529401))

(declare-fun m!529403 () Bool)

(assert (=> b!552278 m!529403))

(assert (=> b!552274 m!529375))

(assert (=> b!552274 m!529375))

(declare-fun m!529405 () Bool)

(assert (=> b!552274 m!529405))

(declare-fun m!529407 () Bool)

(assert (=> b!552280 m!529407))

(check-sat (not b!552282) (not b!552283) (not b!552281) (not b!552279) (not start!50550) (not b!552274) (not b!552276) (not b!552278) (not b!552275) (not b!552280))
(check-sat)
