; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51602 () Bool)

(assert start!51602)

(declare-fun b!564573 () Bool)

(declare-fun res!355872 () Bool)

(declare-fun e!325091 () Bool)

(assert (=> b!564573 (=> (not res!355872) (not e!325091))))

(declare-datatypes ((array!35476 0))(
  ( (array!35477 (arr!17039 (Array (_ BitVec 32) (_ BitVec 64))) (size!17404 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35476)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564573 (= res!355872 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564574 () Bool)

(declare-fun res!355873 () Bool)

(declare-fun e!325090 () Bool)

(assert (=> b!564574 (=> (not res!355873) (not e!325090))))

(declare-datatypes ((List!11158 0))(
  ( (Nil!11155) (Cons!11154 (h!12157 (_ BitVec 64)) (t!17377 List!11158)) )
))
(declare-fun arrayNoDuplicates!0 (array!35476 (_ BitVec 32) List!11158) Bool)

(assert (=> b!564574 (= res!355873 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11155))))

(declare-fun b!564575 () Bool)

(declare-fun res!355868 () Bool)

(assert (=> b!564575 (=> (not res!355868) (not e!325091))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564575 (= res!355868 (and (= (size!17404 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17404 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17404 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!355867 () Bool)

(assert (=> start!51602 (=> (not res!355867) (not e!325091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51602 (= res!355867 (validMask!0 mask!3119))))

(assert (=> start!51602 e!325091))

(assert (=> start!51602 true))

(declare-fun array_inv!12922 (array!35476) Bool)

(assert (=> start!51602 (array_inv!12922 a!3118)))

(declare-fun b!564576 () Bool)

(assert (=> b!564576 (= e!325090 false)))

(declare-datatypes ((SeekEntryResult!5485 0))(
  ( (MissingZero!5485 (index!24167 (_ BitVec 32))) (Found!5485 (index!24168 (_ BitVec 32))) (Intermediate!5485 (undefined!6297 Bool) (index!24169 (_ BitVec 32)) (x!53047 (_ BitVec 32))) (Undefined!5485) (MissingVacant!5485 (index!24170 (_ BitVec 32))) )
))
(declare-fun lt!257440 () SeekEntryResult!5485)

(declare-fun lt!257439 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35476 (_ BitVec 32)) SeekEntryResult!5485)

(assert (=> b!564576 (= lt!257440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257439 (select (store (arr!17039 a!3118) i!1132 k0!1914) j!142) (array!35477 (store (arr!17039 a!3118) i!1132 k0!1914) (size!17404 a!3118)) mask!3119))))

(declare-fun lt!257437 () (_ BitVec 32))

(declare-fun lt!257436 () SeekEntryResult!5485)

(assert (=> b!564576 (= lt!257436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257437 (select (arr!17039 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564576 (= lt!257439 (toIndex!0 (select (store (arr!17039 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!564576 (= lt!257437 (toIndex!0 (select (arr!17039 a!3118) j!142) mask!3119))))

(declare-fun b!564577 () Bool)

(declare-fun res!355869 () Bool)

(assert (=> b!564577 (=> (not res!355869) (not e!325090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35476 (_ BitVec 32)) Bool)

(assert (=> b!564577 (= res!355869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564578 () Bool)

(declare-fun res!355874 () Bool)

(assert (=> b!564578 (=> (not res!355874) (not e!325091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564578 (= res!355874 (validKeyInArray!0 (select (arr!17039 a!3118) j!142)))))

(declare-fun b!564579 () Bool)

(assert (=> b!564579 (= e!325091 e!325090)))

(declare-fun res!355871 () Bool)

(assert (=> b!564579 (=> (not res!355871) (not e!325090))))

(declare-fun lt!257438 () SeekEntryResult!5485)

(assert (=> b!564579 (= res!355871 (or (= lt!257438 (MissingZero!5485 i!1132)) (= lt!257438 (MissingVacant!5485 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35476 (_ BitVec 32)) SeekEntryResult!5485)

(assert (=> b!564579 (= lt!257438 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564580 () Bool)

(declare-fun res!355870 () Bool)

(assert (=> b!564580 (=> (not res!355870) (not e!325091))))

(assert (=> b!564580 (= res!355870 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51602 res!355867) b!564575))

(assert (= (and b!564575 res!355868) b!564578))

(assert (= (and b!564578 res!355874) b!564580))

(assert (= (and b!564580 res!355870) b!564573))

(assert (= (and b!564573 res!355872) b!564579))

(assert (= (and b!564579 res!355871) b!564577))

(assert (= (and b!564577 res!355869) b!564574))

(assert (= (and b!564574 res!355873) b!564576))

(declare-fun m!542549 () Bool)

(assert (=> b!564576 m!542549))

(declare-fun m!542551 () Bool)

(assert (=> b!564576 m!542551))

(declare-fun m!542553 () Bool)

(assert (=> b!564576 m!542553))

(assert (=> b!564576 m!542549))

(declare-fun m!542555 () Bool)

(assert (=> b!564576 m!542555))

(declare-fun m!542557 () Bool)

(assert (=> b!564576 m!542557))

(assert (=> b!564576 m!542553))

(declare-fun m!542559 () Bool)

(assert (=> b!564576 m!542559))

(assert (=> b!564576 m!542553))

(declare-fun m!542561 () Bool)

(assert (=> b!564576 m!542561))

(assert (=> b!564576 m!542549))

(declare-fun m!542563 () Bool)

(assert (=> b!564579 m!542563))

(declare-fun m!542565 () Bool)

(assert (=> b!564573 m!542565))

(declare-fun m!542567 () Bool)

(assert (=> b!564580 m!542567))

(assert (=> b!564578 m!542549))

(assert (=> b!564578 m!542549))

(declare-fun m!542569 () Bool)

(assert (=> b!564578 m!542569))

(declare-fun m!542571 () Bool)

(assert (=> b!564577 m!542571))

(declare-fun m!542573 () Bool)

(assert (=> b!564574 m!542573))

(declare-fun m!542575 () Bool)

(assert (=> start!51602 m!542575))

(declare-fun m!542577 () Bool)

(assert (=> start!51602 m!542577))

(check-sat (not b!564580) (not start!51602) (not b!564576) (not b!564578) (not b!564577) (not b!564574) (not b!564579) (not b!564573))
(check-sat)
