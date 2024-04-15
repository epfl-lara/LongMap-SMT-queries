; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51704 () Bool)

(assert start!51704)

(declare-fun b!565462 () Bool)

(declare-fun res!356579 () Bool)

(declare-fun e!325505 () Bool)

(assert (=> b!565462 (=> (not res!356579) (not e!325505))))

(declare-datatypes ((array!35521 0))(
  ( (array!35522 (arr!17060 (Array (_ BitVec 32) (_ BitVec 64))) (size!17425 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35521)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565462 (= res!356579 (validKeyInArray!0 (select (arr!17060 a!3118) j!142)))))

(declare-fun res!356581 () Bool)

(assert (=> start!51704 (=> (not res!356581) (not e!325505))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51704 (= res!356581 (validMask!0 mask!3119))))

(assert (=> start!51704 e!325505))

(assert (=> start!51704 true))

(declare-fun array_inv!12943 (array!35521) Bool)

(assert (=> start!51704 (array_inv!12943 a!3118)))

(declare-fun b!565463 () Bool)

(declare-fun e!325504 () Bool)

(assert (=> b!565463 (= e!325505 e!325504)))

(declare-fun res!356580 () Bool)

(assert (=> b!565463 (=> (not res!356580) (not e!325504))))

(declare-datatypes ((SeekEntryResult!5506 0))(
  ( (MissingZero!5506 (index!24251 (_ BitVec 32))) (Found!5506 (index!24252 (_ BitVec 32))) (Intermediate!5506 (undefined!6318 Bool) (index!24253 (_ BitVec 32)) (x!53130 (_ BitVec 32))) (Undefined!5506) (MissingVacant!5506 (index!24254 (_ BitVec 32))) )
))
(declare-fun lt!257713 () SeekEntryResult!5506)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565463 (= res!356580 (or (= lt!257713 (MissingZero!5506 i!1132)) (= lt!257713 (MissingVacant!5506 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35521 (_ BitVec 32)) SeekEntryResult!5506)

(assert (=> b!565463 (= lt!257713 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565464 () Bool)

(declare-fun res!356575 () Bool)

(assert (=> b!565464 (=> (not res!356575) (not e!325504))))

(declare-datatypes ((List!11179 0))(
  ( (Nil!11176) (Cons!11175 (h!12181 (_ BitVec 64)) (t!17398 List!11179)) )
))
(declare-fun arrayNoDuplicates!0 (array!35521 (_ BitVec 32) List!11179) Bool)

(assert (=> b!565464 (= res!356575 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11176))))

(declare-fun b!565465 () Bool)

(assert (=> b!565465 (= e!325504 (not true))))

(declare-fun e!325503 () Bool)

(assert (=> b!565465 e!325503))

(declare-fun res!356574 () Bool)

(assert (=> b!565465 (=> (not res!356574) (not e!325503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35521 (_ BitVec 32)) Bool)

(assert (=> b!565465 (= res!356574 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17700 0))(
  ( (Unit!17701) )
))
(declare-fun lt!257712 () Unit!17700)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17700)

(assert (=> b!565465 (= lt!257712 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565466 () Bool)

(assert (=> b!565466 (= e!325503 (= (seekEntryOrOpen!0 (select (arr!17060 a!3118) j!142) a!3118 mask!3119) (Found!5506 j!142)))))

(declare-fun b!565467 () Bool)

(declare-fun res!356576 () Bool)

(assert (=> b!565467 (=> (not res!356576) (not e!325504))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35521 (_ BitVec 32)) SeekEntryResult!5506)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565467 (= res!356576 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17060 a!3118) j!142) mask!3119) (select (arr!17060 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17060 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17060 a!3118) i!1132 k0!1914) j!142) (array!35522 (store (arr!17060 a!3118) i!1132 k0!1914) (size!17425 a!3118)) mask!3119)))))

(declare-fun b!565468 () Bool)

(declare-fun res!356577 () Bool)

(assert (=> b!565468 (=> (not res!356577) (not e!325504))))

(assert (=> b!565468 (= res!356577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565469 () Bool)

(declare-fun res!356582 () Bool)

(assert (=> b!565469 (=> (not res!356582) (not e!325505))))

(assert (=> b!565469 (= res!356582 (and (= (size!17425 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17425 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17425 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565470 () Bool)

(declare-fun res!356578 () Bool)

(assert (=> b!565470 (=> (not res!356578) (not e!325505))))

(declare-fun arrayContainsKey!0 (array!35521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565470 (= res!356578 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565471 () Bool)

(declare-fun res!356573 () Bool)

(assert (=> b!565471 (=> (not res!356573) (not e!325505))))

(assert (=> b!565471 (= res!356573 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51704 res!356581) b!565469))

(assert (= (and b!565469 res!356582) b!565462))

(assert (= (and b!565462 res!356579) b!565471))

(assert (= (and b!565471 res!356573) b!565470))

(assert (= (and b!565470 res!356578) b!565463))

(assert (= (and b!565463 res!356580) b!565468))

(assert (= (and b!565468 res!356577) b!565464))

(assert (= (and b!565464 res!356575) b!565467))

(assert (= (and b!565467 res!356576) b!565465))

(assert (= (and b!565465 res!356574) b!565466))

(declare-fun m!543479 () Bool)

(assert (=> b!565465 m!543479))

(declare-fun m!543481 () Bool)

(assert (=> b!565465 m!543481))

(declare-fun m!543483 () Bool)

(assert (=> b!565464 m!543483))

(declare-fun m!543485 () Bool)

(assert (=> b!565467 m!543485))

(declare-fun m!543487 () Bool)

(assert (=> b!565467 m!543487))

(assert (=> b!565467 m!543485))

(declare-fun m!543489 () Bool)

(assert (=> b!565467 m!543489))

(declare-fun m!543491 () Bool)

(assert (=> b!565467 m!543491))

(assert (=> b!565467 m!543489))

(declare-fun m!543493 () Bool)

(assert (=> b!565467 m!543493))

(assert (=> b!565467 m!543487))

(assert (=> b!565467 m!543485))

(declare-fun m!543495 () Bool)

(assert (=> b!565467 m!543495))

(declare-fun m!543497 () Bool)

(assert (=> b!565467 m!543497))

(assert (=> b!565467 m!543489))

(assert (=> b!565467 m!543491))

(assert (=> b!565466 m!543485))

(assert (=> b!565466 m!543485))

(declare-fun m!543499 () Bool)

(assert (=> b!565466 m!543499))

(declare-fun m!543501 () Bool)

(assert (=> b!565471 m!543501))

(declare-fun m!543503 () Bool)

(assert (=> b!565468 m!543503))

(declare-fun m!543505 () Bool)

(assert (=> b!565470 m!543505))

(declare-fun m!543507 () Bool)

(assert (=> b!565463 m!543507))

(assert (=> b!565462 m!543485))

(assert (=> b!565462 m!543485))

(declare-fun m!543509 () Bool)

(assert (=> b!565462 m!543509))

(declare-fun m!543511 () Bool)

(assert (=> start!51704 m!543511))

(declare-fun m!543513 () Bool)

(assert (=> start!51704 m!543513))

(check-sat (not b!565464) (not b!565466) (not b!565465) (not b!565470) (not b!565468) (not b!565467) (not b!565471) (not b!565463) (not b!565462) (not start!51704))
(check-sat)
