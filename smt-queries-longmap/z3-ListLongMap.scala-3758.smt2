; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51544 () Bool)

(assert start!51544)

(declare-fun b!564014 () Bool)

(declare-fun res!355166 () Bool)

(declare-fun e!324948 () Bool)

(assert (=> b!564014 (=> (not res!355166) (not e!324948))))

(declare-datatypes ((array!35409 0))(
  ( (array!35410 (arr!17005 (Array (_ BitVec 32) (_ BitVec 64))) (size!17369 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35409)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564014 (= res!355166 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun e!324945 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!564015 () Bool)

(declare-datatypes ((SeekEntryResult!5454 0))(
  ( (MissingZero!5454 (index!24043 (_ BitVec 32))) (Found!5454 (index!24044 (_ BitVec 32))) (Intermediate!5454 (undefined!6266 Bool) (index!24045 (_ BitVec 32)) (x!52925 (_ BitVec 32))) (Undefined!5454) (MissingVacant!5454 (index!24046 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35409 (_ BitVec 32)) SeekEntryResult!5454)

(assert (=> b!564015 (= e!324945 (= (seekEntryOrOpen!0 (select (arr!17005 a!3118) j!142) a!3118 mask!3119) (Found!5454 j!142)))))

(declare-fun b!564016 () Bool)

(declare-fun res!355173 () Bool)

(assert (=> b!564016 (=> (not res!355173) (not e!324948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564016 (= res!355173 (validKeyInArray!0 k0!1914))))

(declare-fun b!564017 () Bool)

(declare-fun res!355169 () Bool)

(declare-fun e!324946 () Bool)

(assert (=> b!564017 (=> (not res!355169) (not e!324946))))

(declare-datatypes ((List!11085 0))(
  ( (Nil!11082) (Cons!11081 (h!12084 (_ BitVec 64)) (t!17313 List!11085)) )
))
(declare-fun arrayNoDuplicates!0 (array!35409 (_ BitVec 32) List!11085) Bool)

(assert (=> b!564017 (= res!355169 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11082))))

(declare-fun b!564018 () Bool)

(declare-fun res!355171 () Bool)

(assert (=> b!564018 (=> (not res!355171) (not e!324946))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35409 (_ BitVec 32)) SeekEntryResult!5454)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564018 (= res!355171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17005 a!3118) j!142) mask!3119) (select (arr!17005 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17005 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17005 a!3118) i!1132 k0!1914) j!142) (array!35410 (store (arr!17005 a!3118) i!1132 k0!1914) (size!17369 a!3118)) mask!3119)))))

(declare-fun b!564019 () Bool)

(declare-fun res!355172 () Bool)

(assert (=> b!564019 (=> (not res!355172) (not e!324948))))

(assert (=> b!564019 (= res!355172 (and (= (size!17369 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17369 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17369 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564020 () Bool)

(assert (=> b!564020 (= e!324948 e!324946)))

(declare-fun res!355168 () Bool)

(assert (=> b!564020 (=> (not res!355168) (not e!324946))))

(declare-fun lt!257418 () SeekEntryResult!5454)

(assert (=> b!564020 (= res!355168 (or (= lt!257418 (MissingZero!5454 i!1132)) (= lt!257418 (MissingVacant!5454 i!1132))))))

(assert (=> b!564020 (= lt!257418 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564021 () Bool)

(assert (=> b!564021 (= e!324946 (not true))))

(assert (=> b!564021 e!324945))

(declare-fun res!355170 () Bool)

(assert (=> b!564021 (=> (not res!355170) (not e!324945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35409 (_ BitVec 32)) Bool)

(assert (=> b!564021 (= res!355170 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17682 0))(
  ( (Unit!17683) )
))
(declare-fun lt!257419 () Unit!17682)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35409 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17682)

(assert (=> b!564021 (= lt!257419 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!564023 () Bool)

(declare-fun res!355175 () Bool)

(assert (=> b!564023 (=> (not res!355175) (not e!324948))))

(assert (=> b!564023 (= res!355175 (validKeyInArray!0 (select (arr!17005 a!3118) j!142)))))

(declare-fun res!355174 () Bool)

(assert (=> start!51544 (=> (not res!355174) (not e!324948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51544 (= res!355174 (validMask!0 mask!3119))))

(assert (=> start!51544 e!324948))

(assert (=> start!51544 true))

(declare-fun array_inv!12801 (array!35409) Bool)

(assert (=> start!51544 (array_inv!12801 a!3118)))

(declare-fun b!564022 () Bool)

(declare-fun res!355167 () Bool)

(assert (=> b!564022 (=> (not res!355167) (not e!324946))))

(assert (=> b!564022 (= res!355167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51544 res!355174) b!564019))

(assert (= (and b!564019 res!355172) b!564023))

(assert (= (and b!564023 res!355175) b!564016))

(assert (= (and b!564016 res!355173) b!564014))

(assert (= (and b!564014 res!355166) b!564020))

(assert (= (and b!564020 res!355168) b!564022))

(assert (= (and b!564022 res!355167) b!564017))

(assert (= (and b!564017 res!355169) b!564018))

(assert (= (and b!564018 res!355171) b!564021))

(assert (= (and b!564021 res!355170) b!564015))

(declare-fun m!542469 () Bool)

(assert (=> b!564022 m!542469))

(declare-fun m!542471 () Bool)

(assert (=> b!564020 m!542471))

(declare-fun m!542473 () Bool)

(assert (=> b!564014 m!542473))

(declare-fun m!542475 () Bool)

(assert (=> b!564023 m!542475))

(assert (=> b!564023 m!542475))

(declare-fun m!542477 () Bool)

(assert (=> b!564023 m!542477))

(declare-fun m!542479 () Bool)

(assert (=> start!51544 m!542479))

(declare-fun m!542481 () Bool)

(assert (=> start!51544 m!542481))

(declare-fun m!542483 () Bool)

(assert (=> b!564016 m!542483))

(assert (=> b!564018 m!542475))

(declare-fun m!542485 () Bool)

(assert (=> b!564018 m!542485))

(assert (=> b!564018 m!542475))

(declare-fun m!542487 () Bool)

(assert (=> b!564018 m!542487))

(declare-fun m!542489 () Bool)

(assert (=> b!564018 m!542489))

(assert (=> b!564018 m!542487))

(declare-fun m!542491 () Bool)

(assert (=> b!564018 m!542491))

(assert (=> b!564018 m!542485))

(assert (=> b!564018 m!542475))

(declare-fun m!542493 () Bool)

(assert (=> b!564018 m!542493))

(declare-fun m!542495 () Bool)

(assert (=> b!564018 m!542495))

(assert (=> b!564018 m!542487))

(assert (=> b!564018 m!542489))

(declare-fun m!542497 () Bool)

(assert (=> b!564021 m!542497))

(declare-fun m!542499 () Bool)

(assert (=> b!564021 m!542499))

(assert (=> b!564015 m!542475))

(assert (=> b!564015 m!542475))

(declare-fun m!542501 () Bool)

(assert (=> b!564015 m!542501))

(declare-fun m!542503 () Bool)

(assert (=> b!564017 m!542503))

(check-sat (not b!564018) (not b!564022) (not b!564016) (not b!564023) (not b!564017) (not start!51544) (not b!564014) (not b!564015) (not b!564021) (not b!564020))
(check-sat)
