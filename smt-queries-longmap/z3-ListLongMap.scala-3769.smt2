; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51596 () Bool)

(assert start!51596)

(declare-fun b!564494 () Bool)

(declare-fun res!355788 () Bool)

(declare-fun e!325065 () Bool)

(assert (=> b!564494 (=> (not res!355788) (not e!325065))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35470 0))(
  ( (array!35471 (arr!17036 (Array (_ BitVec 32) (_ BitVec 64))) (size!17401 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35470)

(declare-datatypes ((SeekEntryResult!5482 0))(
  ( (MissingZero!5482 (index!24155 (_ BitVec 32))) (Found!5482 (index!24156 (_ BitVec 32))) (Intermediate!5482 (undefined!6294 Bool) (index!24157 (_ BitVec 32)) (x!53036 (_ BitVec 32))) (Undefined!5482) (MissingVacant!5482 (index!24158 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35470 (_ BitVec 32)) SeekEntryResult!5482)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564494 (= res!355788 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17036 a!3118) j!142) mask!3119) (select (arr!17036 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17036 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17036 a!3118) i!1132 k0!1914) j!142) (array!35471 (store (arr!17036 a!3118) i!1132 k0!1914) (size!17401 a!3118)) mask!3119)))))

(declare-fun b!564495 () Bool)

(declare-fun e!325063 () Bool)

(assert (=> b!564495 (= e!325063 e!325065)))

(declare-fun res!355796 () Bool)

(assert (=> b!564495 (=> (not res!355796) (not e!325065))))

(declare-fun lt!257419 () SeekEntryResult!5482)

(assert (=> b!564495 (= res!355796 (or (= lt!257419 (MissingZero!5482 i!1132)) (= lt!257419 (MissingVacant!5482 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35470 (_ BitVec 32)) SeekEntryResult!5482)

(assert (=> b!564495 (= lt!257419 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564496 () Bool)

(declare-fun res!355791 () Bool)

(assert (=> b!564496 (=> (not res!355791) (not e!325063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564496 (= res!355791 (validKeyInArray!0 (select (arr!17036 a!3118) j!142)))))

(declare-fun b!564497 () Bool)

(declare-fun res!355794 () Bool)

(assert (=> b!564497 (=> (not res!355794) (not e!325063))))

(declare-fun arrayContainsKey!0 (array!35470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564497 (= res!355794 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564498 () Bool)

(declare-fun res!355789 () Bool)

(assert (=> b!564498 (=> (not res!355789) (not e!325063))))

(assert (=> b!564498 (= res!355789 (and (= (size!17401 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17401 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17401 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564500 () Bool)

(declare-fun res!355793 () Bool)

(assert (=> b!564500 (=> (not res!355793) (not e!325063))))

(assert (=> b!564500 (= res!355793 (validKeyInArray!0 k0!1914))))

(declare-fun b!564501 () Bool)

(assert (=> b!564501 (= e!325065 (and (bvsle #b00000000000000000000000000000000 (size!17401 a!3118)) (bvsgt j!142 (size!17401 a!3118))))))

(declare-fun b!564502 () Bool)

(declare-fun res!355795 () Bool)

(assert (=> b!564502 (=> (not res!355795) (not e!325065))))

(declare-datatypes ((List!11155 0))(
  ( (Nil!11152) (Cons!11151 (h!12154 (_ BitVec 64)) (t!17374 List!11155)) )
))
(declare-fun arrayNoDuplicates!0 (array!35470 (_ BitVec 32) List!11155) Bool)

(assert (=> b!564502 (= res!355795 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11152))))

(declare-fun b!564499 () Bool)

(declare-fun res!355790 () Bool)

(assert (=> b!564499 (=> (not res!355790) (not e!325065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35470 (_ BitVec 32)) Bool)

(assert (=> b!564499 (= res!355790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!355792 () Bool)

(assert (=> start!51596 (=> (not res!355792) (not e!325063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51596 (= res!355792 (validMask!0 mask!3119))))

(assert (=> start!51596 e!325063))

(assert (=> start!51596 true))

(declare-fun array_inv!12919 (array!35470) Bool)

(assert (=> start!51596 (array_inv!12919 a!3118)))

(assert (= (and start!51596 res!355792) b!564498))

(assert (= (and b!564498 res!355789) b!564496))

(assert (= (and b!564496 res!355791) b!564500))

(assert (= (and b!564500 res!355793) b!564497))

(assert (= (and b!564497 res!355794) b!564495))

(assert (= (and b!564495 res!355796) b!564499))

(assert (= (and b!564499 res!355790) b!564502))

(assert (= (and b!564502 res!355795) b!564494))

(assert (= (and b!564494 res!355788) b!564501))

(declare-fun m!542459 () Bool)

(assert (=> b!564496 m!542459))

(assert (=> b!564496 m!542459))

(declare-fun m!542461 () Bool)

(assert (=> b!564496 m!542461))

(assert (=> b!564494 m!542459))

(declare-fun m!542463 () Bool)

(assert (=> b!564494 m!542463))

(assert (=> b!564494 m!542459))

(declare-fun m!542465 () Bool)

(assert (=> b!564494 m!542465))

(declare-fun m!542467 () Bool)

(assert (=> b!564494 m!542467))

(assert (=> b!564494 m!542465))

(declare-fun m!542469 () Bool)

(assert (=> b!564494 m!542469))

(assert (=> b!564494 m!542463))

(assert (=> b!564494 m!542459))

(declare-fun m!542471 () Bool)

(assert (=> b!564494 m!542471))

(declare-fun m!542473 () Bool)

(assert (=> b!564494 m!542473))

(assert (=> b!564494 m!542465))

(assert (=> b!564494 m!542467))

(declare-fun m!542475 () Bool)

(assert (=> b!564500 m!542475))

(declare-fun m!542477 () Bool)

(assert (=> b!564502 m!542477))

(declare-fun m!542479 () Bool)

(assert (=> b!564497 m!542479))

(declare-fun m!542481 () Bool)

(assert (=> b!564499 m!542481))

(declare-fun m!542483 () Bool)

(assert (=> start!51596 m!542483))

(declare-fun m!542485 () Bool)

(assert (=> start!51596 m!542485))

(declare-fun m!542487 () Bool)

(assert (=> b!564495 m!542487))

(check-sat (not b!564500) (not b!564495) (not b!564497) (not start!51596) (not b!564499) (not b!564494) (not b!564502) (not b!564496))
(check-sat)
