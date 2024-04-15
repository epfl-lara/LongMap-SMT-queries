; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52184 () Bool)

(assert start!52184)

(declare-fun b!569536 () Bool)

(declare-fun res!359697 () Bool)

(declare-fun e!327567 () Bool)

(assert (=> b!569536 (=> (not res!359697) (not e!327567))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569536 (= res!359697 (validKeyInArray!0 k0!1914))))

(declare-fun b!569537 () Bool)

(declare-fun e!327568 () Bool)

(assert (=> b!569537 (= e!327567 e!327568)))

(declare-fun res!359702 () Bool)

(assert (=> b!569537 (=> (not res!359702) (not e!327568))))

(declare-datatypes ((SeekEntryResult!5596 0))(
  ( (MissingZero!5596 (index!24611 (_ BitVec 32))) (Found!5596 (index!24612 (_ BitVec 32))) (Intermediate!5596 (undefined!6408 Bool) (index!24613 (_ BitVec 32)) (x!53490 (_ BitVec 32))) (Undefined!5596) (MissingVacant!5596 (index!24614 (_ BitVec 32))) )
))
(declare-fun lt!259546 () SeekEntryResult!5596)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569537 (= res!359702 (or (= lt!259546 (MissingZero!5596 i!1132)) (= lt!259546 (MissingVacant!5596 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35716 0))(
  ( (array!35717 (arr!17150 (Array (_ BitVec 32) (_ BitVec 64))) (size!17515 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35716)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35716 (_ BitVec 32)) SeekEntryResult!5596)

(assert (=> b!569537 (= lt!259546 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569538 () Bool)

(declare-fun res!359698 () Bool)

(assert (=> b!569538 (=> (not res!359698) (not e!327567))))

(declare-fun arrayContainsKey!0 (array!35716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569538 (= res!359698 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569539 () Bool)

(declare-fun res!359701 () Bool)

(assert (=> b!569539 (=> (not res!359701) (not e!327568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35716 (_ BitVec 32)) Bool)

(assert (=> b!569539 (= res!359701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!359700 () Bool)

(assert (=> start!52184 (=> (not res!359700) (not e!327567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52184 (= res!359700 (validMask!0 mask!3119))))

(assert (=> start!52184 e!327567))

(assert (=> start!52184 true))

(declare-fun array_inv!13033 (array!35716) Bool)

(assert (=> start!52184 (array_inv!13033 a!3118)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!327570 () Bool)

(declare-fun b!569540 () Bool)

(assert (=> b!569540 (= e!327570 (= (seekEntryOrOpen!0 (select (arr!17150 a!3118) j!142) a!3118 mask!3119) (Found!5596 j!142)))))

(declare-fun b!569541 () Bool)

(declare-fun res!359703 () Bool)

(assert (=> b!569541 (=> (not res!359703) (not e!327567))))

(assert (=> b!569541 (= res!359703 (and (= (size!17515 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17515 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17515 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569542 () Bool)

(declare-fun res!359705 () Bool)

(assert (=> b!569542 (=> (not res!359705) (not e!327568))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35716 (_ BitVec 32)) SeekEntryResult!5596)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569542 (= res!359705 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17150 a!3118) j!142) mask!3119) (select (arr!17150 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17150 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17150 a!3118) i!1132 k0!1914) j!142) (array!35717 (store (arr!17150 a!3118) i!1132 k0!1914) (size!17515 a!3118)) mask!3119)))))

(declare-fun b!569543 () Bool)

(assert (=> b!569543 (= e!327568 (not true))))

(assert (=> b!569543 e!327570))

(declare-fun res!359696 () Bool)

(assert (=> b!569543 (=> (not res!359696) (not e!327570))))

(assert (=> b!569543 (= res!359696 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17880 0))(
  ( (Unit!17881) )
))
(declare-fun lt!259545 () Unit!17880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35716 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17880)

(assert (=> b!569543 (= lt!259545 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569544 () Bool)

(declare-fun res!359704 () Bool)

(assert (=> b!569544 (=> (not res!359704) (not e!327567))))

(assert (=> b!569544 (= res!359704 (validKeyInArray!0 (select (arr!17150 a!3118) j!142)))))

(declare-fun b!569545 () Bool)

(declare-fun res!359699 () Bool)

(assert (=> b!569545 (=> (not res!359699) (not e!327568))))

(declare-datatypes ((List!11269 0))(
  ( (Nil!11266) (Cons!11265 (h!12286 (_ BitVec 64)) (t!17488 List!11269)) )
))
(declare-fun arrayNoDuplicates!0 (array!35716 (_ BitVec 32) List!11269) Bool)

(assert (=> b!569545 (= res!359699 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11266))))

(assert (= (and start!52184 res!359700) b!569541))

(assert (= (and b!569541 res!359703) b!569544))

(assert (= (and b!569544 res!359704) b!569536))

(assert (= (and b!569536 res!359697) b!569538))

(assert (= (and b!569538 res!359698) b!569537))

(assert (= (and b!569537 res!359702) b!569539))

(assert (= (and b!569539 res!359701) b!569545))

(assert (= (and b!569545 res!359699) b!569542))

(assert (= (and b!569542 res!359705) b!569543))

(assert (= (and b!569543 res!359696) b!569540))

(declare-fun m!547913 () Bool)

(assert (=> b!569539 m!547913))

(declare-fun m!547915 () Bool)

(assert (=> b!569537 m!547915))

(declare-fun m!547917 () Bool)

(assert (=> b!569540 m!547917))

(assert (=> b!569540 m!547917))

(declare-fun m!547919 () Bool)

(assert (=> b!569540 m!547919))

(declare-fun m!547921 () Bool)

(assert (=> start!52184 m!547921))

(declare-fun m!547923 () Bool)

(assert (=> start!52184 m!547923))

(declare-fun m!547925 () Bool)

(assert (=> b!569538 m!547925))

(assert (=> b!569544 m!547917))

(assert (=> b!569544 m!547917))

(declare-fun m!547927 () Bool)

(assert (=> b!569544 m!547927))

(declare-fun m!547929 () Bool)

(assert (=> b!569545 m!547929))

(assert (=> b!569542 m!547917))

(declare-fun m!547931 () Bool)

(assert (=> b!569542 m!547931))

(assert (=> b!569542 m!547917))

(declare-fun m!547933 () Bool)

(assert (=> b!569542 m!547933))

(declare-fun m!547935 () Bool)

(assert (=> b!569542 m!547935))

(assert (=> b!569542 m!547933))

(declare-fun m!547937 () Bool)

(assert (=> b!569542 m!547937))

(assert (=> b!569542 m!547931))

(assert (=> b!569542 m!547917))

(declare-fun m!547939 () Bool)

(assert (=> b!569542 m!547939))

(declare-fun m!547941 () Bool)

(assert (=> b!569542 m!547941))

(assert (=> b!569542 m!547933))

(assert (=> b!569542 m!547935))

(declare-fun m!547943 () Bool)

(assert (=> b!569543 m!547943))

(declare-fun m!547945 () Bool)

(assert (=> b!569543 m!547945))

(declare-fun m!547947 () Bool)

(assert (=> b!569536 m!547947))

(check-sat (not b!569537) (not b!569543) (not b!569544) (not b!569538) (not b!569545) (not b!569542) (not b!569536) (not b!569539) (not b!569540) (not start!52184))
(check-sat)
