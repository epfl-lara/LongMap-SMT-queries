; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52212 () Bool)

(assert start!52212)

(declare-fun b!569600 () Bool)

(declare-fun e!327690 () Bool)

(declare-fun e!327693 () Bool)

(assert (=> b!569600 (= e!327690 e!327693)))

(declare-fun res!359513 () Bool)

(assert (=> b!569600 (=> (not res!359513) (not e!327693))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!259631 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5536 0))(
  ( (MissingZero!5536 (index!24371 (_ BitVec 32))) (Found!5536 (index!24372 (_ BitVec 32))) (Intermediate!5536 (undefined!6348 Bool) (index!24373 (_ BitVec 32)) (x!53398 (_ BitVec 32))) (Undefined!5536) (MissingVacant!5536 (index!24374 (_ BitVec 32))) )
))
(declare-fun lt!259632 () SeekEntryResult!5536)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35682 0))(
  ( (array!35683 (arr!17131 (Array (_ BitVec 32) (_ BitVec 64))) (size!17495 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35682)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35682 (_ BitVec 32)) SeekEntryResult!5536)

(assert (=> b!569600 (= res!359513 (= lt!259632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259631 (select (store (arr!17131 a!3118) i!1132 k0!1914) j!142) (array!35683 (store (arr!17131 a!3118) i!1132 k0!1914) (size!17495 a!3118)) mask!3119)))))

(declare-fun lt!259628 () (_ BitVec 32))

(assert (=> b!569600 (= lt!259632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259628 (select (arr!17131 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569600 (= lt!259631 (toIndex!0 (select (store (arr!17131 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569600 (= lt!259628 (toIndex!0 (select (arr!17131 a!3118) j!142) mask!3119))))

(declare-fun b!569601 () Bool)

(declare-fun res!359518 () Bool)

(declare-fun e!327692 () Bool)

(assert (=> b!569601 (=> (not res!359518) (not e!327692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569601 (= res!359518 (validKeyInArray!0 (select (arr!17131 a!3118) j!142)))))

(declare-fun res!359519 () Bool)

(assert (=> start!52212 (=> (not res!359519) (not e!327692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52212 (= res!359519 (validMask!0 mask!3119))))

(assert (=> start!52212 e!327692))

(assert (=> start!52212 true))

(declare-fun array_inv!12990 (array!35682) Bool)

(assert (=> start!52212 (array_inv!12990 a!3118)))

(declare-fun b!569602 () Bool)

(declare-fun res!359517 () Bool)

(assert (=> b!569602 (=> (not res!359517) (not e!327692))))

(declare-fun arrayContainsKey!0 (array!35682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569602 (= res!359517 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569603 () Bool)

(declare-fun res!359516 () Bool)

(assert (=> b!569603 (=> (not res!359516) (not e!327692))))

(assert (=> b!569603 (= res!359516 (and (= (size!17495 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17495 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17495 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569604 () Bool)

(declare-fun res!359515 () Bool)

(assert (=> b!569604 (=> (not res!359515) (not e!327690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35682 (_ BitVec 32)) Bool)

(assert (=> b!569604 (= res!359515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569605 () Bool)

(declare-fun res!359514 () Bool)

(assert (=> b!569605 (=> (not res!359514) (not e!327690))))

(declare-datatypes ((List!11118 0))(
  ( (Nil!11115) (Cons!11114 (h!12138 (_ BitVec 64)) (t!17338 List!11118)) )
))
(declare-fun arrayNoDuplicates!0 (array!35682 (_ BitVec 32) List!11118) Bool)

(assert (=> b!569605 (= res!359514 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11115))))

(declare-fun b!569606 () Bool)

(assert (=> b!569606 (= e!327692 e!327690)))

(declare-fun res!359520 () Bool)

(assert (=> b!569606 (=> (not res!359520) (not e!327690))))

(declare-fun lt!259633 () SeekEntryResult!5536)

(assert (=> b!569606 (= res!359520 (or (= lt!259633 (MissingZero!5536 i!1132)) (= lt!259633 (MissingVacant!5536 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35682 (_ BitVec 32)) SeekEntryResult!5536)

(assert (=> b!569606 (= lt!259633 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569607 () Bool)

(assert (=> b!569607 (= e!327693 (not true))))

(declare-fun lt!259629 () SeekEntryResult!5536)

(get-info :version)

(assert (=> b!569607 (and (= lt!259629 (Found!5536 j!142)) (or (undefined!6348 lt!259632) (not ((_ is Intermediate!5536) lt!259632)) (= (select (arr!17131 a!3118) (index!24373 lt!259632)) (select (arr!17131 a!3118) j!142)) (not (= (select (arr!17131 a!3118) (index!24373 lt!259632)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259629 (MissingZero!5536 (index!24373 lt!259632)))))))

(assert (=> b!569607 (= lt!259629 (seekEntryOrOpen!0 (select (arr!17131 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569607 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17845 0))(
  ( (Unit!17846) )
))
(declare-fun lt!259630 () Unit!17845)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17845)

(assert (=> b!569607 (= lt!259630 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569608 () Bool)

(declare-fun res!359521 () Bool)

(assert (=> b!569608 (=> (not res!359521) (not e!327692))))

(assert (=> b!569608 (= res!359521 (validKeyInArray!0 k0!1914))))

(assert (= (and start!52212 res!359519) b!569603))

(assert (= (and b!569603 res!359516) b!569601))

(assert (= (and b!569601 res!359518) b!569608))

(assert (= (and b!569608 res!359521) b!569602))

(assert (= (and b!569602 res!359517) b!569606))

(assert (= (and b!569606 res!359520) b!569604))

(assert (= (and b!569604 res!359515) b!569605))

(assert (= (and b!569605 res!359514) b!569600))

(assert (= (and b!569600 res!359513) b!569607))

(declare-fun m!548453 () Bool)

(assert (=> b!569602 m!548453))

(declare-fun m!548455 () Bool)

(assert (=> b!569601 m!548455))

(assert (=> b!569601 m!548455))

(declare-fun m!548457 () Bool)

(assert (=> b!569601 m!548457))

(declare-fun m!548459 () Bool)

(assert (=> start!52212 m!548459))

(declare-fun m!548461 () Bool)

(assert (=> start!52212 m!548461))

(declare-fun m!548463 () Bool)

(assert (=> b!569605 m!548463))

(declare-fun m!548465 () Bool)

(assert (=> b!569607 m!548465))

(assert (=> b!569607 m!548455))

(declare-fun m!548467 () Bool)

(assert (=> b!569607 m!548467))

(declare-fun m!548469 () Bool)

(assert (=> b!569607 m!548469))

(assert (=> b!569607 m!548455))

(declare-fun m!548471 () Bool)

(assert (=> b!569607 m!548471))

(declare-fun m!548473 () Bool)

(assert (=> b!569606 m!548473))

(declare-fun m!548475 () Bool)

(assert (=> b!569604 m!548475))

(declare-fun m!548477 () Bool)

(assert (=> b!569608 m!548477))

(assert (=> b!569600 m!548455))

(declare-fun m!548479 () Bool)

(assert (=> b!569600 m!548479))

(assert (=> b!569600 m!548455))

(declare-fun m!548481 () Bool)

(assert (=> b!569600 m!548481))

(declare-fun m!548483 () Bool)

(assert (=> b!569600 m!548483))

(assert (=> b!569600 m!548455))

(declare-fun m!548485 () Bool)

(assert (=> b!569600 m!548485))

(assert (=> b!569600 m!548481))

(declare-fun m!548487 () Bool)

(assert (=> b!569600 m!548487))

(assert (=> b!569600 m!548481))

(declare-fun m!548489 () Bool)

(assert (=> b!569600 m!548489))

(check-sat (not b!569605) (not b!569600) (not b!569604) (not b!569606) (not start!52212) (not b!569608) (not b!569601) (not b!569607) (not b!569602))
(check-sat)
