; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51586 () Bool)

(assert start!51586)

(declare-fun b!564490 () Bool)

(declare-fun e!325139 () Bool)

(assert (=> b!564490 (= e!325139 false)))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35451 0))(
  ( (array!35452 (arr!17026 (Array (_ BitVec 32) (_ BitVec 64))) (size!17390 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35451)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!257544 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564490 (= lt!257544 (toIndex!0 (select (store (arr!17026 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!564491 () Bool)

(declare-fun e!325140 () Bool)

(assert (=> b!564491 (= e!325140 e!325139)))

(declare-fun res!355642 () Bool)

(assert (=> b!564491 (=> (not res!355642) (not e!325139))))

(declare-datatypes ((SeekEntryResult!5475 0))(
  ( (MissingZero!5475 (index!24127 (_ BitVec 32))) (Found!5475 (index!24128 (_ BitVec 32))) (Intermediate!5475 (undefined!6287 Bool) (index!24129 (_ BitVec 32)) (x!53002 (_ BitVec 32))) (Undefined!5475) (MissingVacant!5475 (index!24130 (_ BitVec 32))) )
))
(declare-fun lt!257545 () SeekEntryResult!5475)

(assert (=> b!564491 (= res!355642 (or (= lt!257545 (MissingZero!5475 i!1132)) (= lt!257545 (MissingVacant!5475 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35451 (_ BitVec 32)) SeekEntryResult!5475)

(assert (=> b!564491 (= lt!257545 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564492 () Bool)

(declare-fun res!355647 () Bool)

(assert (=> b!564492 (=> (not res!355647) (not e!325140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564492 (= res!355647 (validKeyInArray!0 (select (arr!17026 a!3118) j!142)))))

(declare-fun b!564493 () Bool)

(declare-fun res!355648 () Bool)

(assert (=> b!564493 (=> (not res!355648) (not e!325139))))

(declare-datatypes ((List!11106 0))(
  ( (Nil!11103) (Cons!11102 (h!12105 (_ BitVec 64)) (t!17334 List!11106)) )
))
(declare-fun arrayNoDuplicates!0 (array!35451 (_ BitVec 32) List!11106) Bool)

(assert (=> b!564493 (= res!355648 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11103))))

(declare-fun b!564494 () Bool)

(declare-fun res!355646 () Bool)

(assert (=> b!564494 (=> (not res!355646) (not e!325140))))

(assert (=> b!564494 (= res!355646 (validKeyInArray!0 k0!1914))))

(declare-fun b!564496 () Bool)

(declare-fun res!355643 () Bool)

(assert (=> b!564496 (=> (not res!355643) (not e!325140))))

(assert (=> b!564496 (= res!355643 (and (= (size!17390 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17390 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17390 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564497 () Bool)

(declare-fun res!355644 () Bool)

(assert (=> b!564497 (=> (not res!355644) (not e!325140))))

(declare-fun arrayContainsKey!0 (array!35451 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564497 (= res!355644 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564495 () Bool)

(declare-fun res!355645 () Bool)

(assert (=> b!564495 (=> (not res!355645) (not e!325139))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35451 (_ BitVec 32)) Bool)

(assert (=> b!564495 (= res!355645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!355649 () Bool)

(assert (=> start!51586 (=> (not res!355649) (not e!325140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51586 (= res!355649 (validMask!0 mask!3119))))

(assert (=> start!51586 e!325140))

(assert (=> start!51586 true))

(declare-fun array_inv!12822 (array!35451) Bool)

(assert (=> start!51586 (array_inv!12822 a!3118)))

(assert (= (and start!51586 res!355649) b!564496))

(assert (= (and b!564496 res!355643) b!564492))

(assert (= (and b!564492 res!355647) b!564494))

(assert (= (and b!564494 res!355646) b!564497))

(assert (= (and b!564497 res!355644) b!564491))

(assert (= (and b!564491 res!355642) b!564495))

(assert (= (and b!564495 res!355645) b!564493))

(assert (= (and b!564493 res!355648) b!564490))

(declare-fun m!542913 () Bool)

(assert (=> b!564497 m!542913))

(declare-fun m!542915 () Bool)

(assert (=> b!564490 m!542915))

(declare-fun m!542917 () Bool)

(assert (=> b!564490 m!542917))

(assert (=> b!564490 m!542917))

(declare-fun m!542919 () Bool)

(assert (=> b!564490 m!542919))

(declare-fun m!542921 () Bool)

(assert (=> b!564491 m!542921))

(declare-fun m!542923 () Bool)

(assert (=> start!51586 m!542923))

(declare-fun m!542925 () Bool)

(assert (=> start!51586 m!542925))

(declare-fun m!542927 () Bool)

(assert (=> b!564492 m!542927))

(assert (=> b!564492 m!542927))

(declare-fun m!542929 () Bool)

(assert (=> b!564492 m!542929))

(declare-fun m!542931 () Bool)

(assert (=> b!564495 m!542931))

(declare-fun m!542933 () Bool)

(assert (=> b!564493 m!542933))

(declare-fun m!542935 () Bool)

(assert (=> b!564494 m!542935))

(check-sat (not b!564495) (not b!564492) (not b!564493) (not b!564490) (not b!564497) (not b!564494) (not b!564491) (not start!51586))
(check-sat)
