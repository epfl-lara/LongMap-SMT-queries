; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52186 () Bool)

(assert start!52186)

(declare-fun b!569670 () Bool)

(declare-fun res!359689 () Bool)

(declare-fun e!327684 () Bool)

(assert (=> b!569670 (=> (not res!359689) (not e!327684))))

(declare-datatypes ((array!35709 0))(
  ( (array!35710 (arr!17146 (Array (_ BitVec 32) (_ BitVec 64))) (size!17510 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35709)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35709 (_ BitVec 32)) Bool)

(assert (=> b!569670 (= res!359689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!359691 () Bool)

(declare-fun e!327681 () Bool)

(assert (=> start!52186 (=> (not res!359691) (not e!327681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52186 (= res!359691 (validMask!0 mask!3119))))

(assert (=> start!52186 e!327681))

(assert (=> start!52186 true))

(declare-fun array_inv!12942 (array!35709) Bool)

(assert (=> start!52186 (array_inv!12942 a!3118)))

(declare-fun b!569671 () Bool)

(declare-fun e!327682 () Bool)

(assert (=> b!569671 (= e!327682 (not true))))

(declare-datatypes ((SeekEntryResult!5595 0))(
  ( (MissingZero!5595 (index!24607 (_ BitVec 32))) (Found!5595 (index!24608 (_ BitVec 32))) (Intermediate!5595 (undefined!6407 Bool) (index!24609 (_ BitVec 32)) (x!53478 (_ BitVec 32))) (Undefined!5595) (MissingVacant!5595 (index!24610 (_ BitVec 32))) )
))
(declare-fun lt!259697 () SeekEntryResult!5595)

(declare-fun lt!259702 () SeekEntryResult!5595)

(declare-fun j!142 () (_ BitVec 32))

(get-info :version)

(assert (=> b!569671 (and (= lt!259702 (Found!5595 j!142)) (or (undefined!6407 lt!259697) (not ((_ is Intermediate!5595) lt!259697)) (= (select (arr!17146 a!3118) (index!24609 lt!259697)) (select (arr!17146 a!3118) j!142)) (not (= (select (arr!17146 a!3118) (index!24609 lt!259697)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259702 (MissingZero!5595 (index!24609 lt!259697)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35709 (_ BitVec 32)) SeekEntryResult!5595)

(assert (=> b!569671 (= lt!259702 (seekEntryOrOpen!0 (select (arr!17146 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569671 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17892 0))(
  ( (Unit!17893) )
))
(declare-fun lt!259701 () Unit!17892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17892)

(assert (=> b!569671 (= lt!259701 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569672 () Bool)

(assert (=> b!569672 (= e!327681 e!327684)))

(declare-fun res!359692 () Bool)

(assert (=> b!569672 (=> (not res!359692) (not e!327684))))

(declare-fun lt!259698 () SeekEntryResult!5595)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569672 (= res!359692 (or (= lt!259698 (MissingZero!5595 i!1132)) (= lt!259698 (MissingVacant!5595 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!569672 (= lt!259698 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569673 () Bool)

(declare-fun res!359695 () Bool)

(assert (=> b!569673 (=> (not res!359695) (not e!327684))))

(declare-datatypes ((List!11226 0))(
  ( (Nil!11223) (Cons!11222 (h!12243 (_ BitVec 64)) (t!17454 List!11226)) )
))
(declare-fun arrayNoDuplicates!0 (array!35709 (_ BitVec 32) List!11226) Bool)

(assert (=> b!569673 (= res!359695 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11223))))

(declare-fun b!569674 () Bool)

(declare-fun res!359696 () Bool)

(assert (=> b!569674 (=> (not res!359696) (not e!327681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569674 (= res!359696 (validKeyInArray!0 k0!1914))))

(declare-fun b!569675 () Bool)

(declare-fun res!359690 () Bool)

(assert (=> b!569675 (=> (not res!359690) (not e!327681))))

(assert (=> b!569675 (= res!359690 (validKeyInArray!0 (select (arr!17146 a!3118) j!142)))))

(declare-fun b!569676 () Bool)

(declare-fun res!359688 () Bool)

(assert (=> b!569676 (=> (not res!359688) (not e!327681))))

(declare-fun arrayContainsKey!0 (array!35709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569676 (= res!359688 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569677 () Bool)

(assert (=> b!569677 (= e!327684 e!327682)))

(declare-fun res!359693 () Bool)

(assert (=> b!569677 (=> (not res!359693) (not e!327682))))

(declare-fun lt!259699 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35709 (_ BitVec 32)) SeekEntryResult!5595)

(assert (=> b!569677 (= res!359693 (= lt!259697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259699 (select (store (arr!17146 a!3118) i!1132 k0!1914) j!142) (array!35710 (store (arr!17146 a!3118) i!1132 k0!1914) (size!17510 a!3118)) mask!3119)))))

(declare-fun lt!259700 () (_ BitVec 32))

(assert (=> b!569677 (= lt!259697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259700 (select (arr!17146 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569677 (= lt!259699 (toIndex!0 (select (store (arr!17146 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569677 (= lt!259700 (toIndex!0 (select (arr!17146 a!3118) j!142) mask!3119))))

(declare-fun b!569678 () Bool)

(declare-fun res!359694 () Bool)

(assert (=> b!569678 (=> (not res!359694) (not e!327681))))

(assert (=> b!569678 (= res!359694 (and (= (size!17510 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17510 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17510 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52186 res!359691) b!569678))

(assert (= (and b!569678 res!359694) b!569675))

(assert (= (and b!569675 res!359690) b!569674))

(assert (= (and b!569674 res!359696) b!569676))

(assert (= (and b!569676 res!359688) b!569672))

(assert (= (and b!569672 res!359692) b!569670))

(assert (= (and b!569670 res!359689) b!569673))

(assert (= (and b!569673 res!359695) b!569677))

(assert (= (and b!569677 res!359693) b!569671))

(declare-fun m!548495 () Bool)

(assert (=> start!52186 m!548495))

(declare-fun m!548497 () Bool)

(assert (=> start!52186 m!548497))

(declare-fun m!548499 () Bool)

(assert (=> b!569671 m!548499))

(declare-fun m!548501 () Bool)

(assert (=> b!569671 m!548501))

(declare-fun m!548503 () Bool)

(assert (=> b!569671 m!548503))

(declare-fun m!548505 () Bool)

(assert (=> b!569671 m!548505))

(assert (=> b!569671 m!548499))

(declare-fun m!548507 () Bool)

(assert (=> b!569671 m!548507))

(assert (=> b!569677 m!548499))

(declare-fun m!548509 () Bool)

(assert (=> b!569677 m!548509))

(assert (=> b!569677 m!548499))

(assert (=> b!569677 m!548499))

(declare-fun m!548511 () Bool)

(assert (=> b!569677 m!548511))

(declare-fun m!548513 () Bool)

(assert (=> b!569677 m!548513))

(declare-fun m!548515 () Bool)

(assert (=> b!569677 m!548515))

(assert (=> b!569677 m!548513))

(declare-fun m!548517 () Bool)

(assert (=> b!569677 m!548517))

(assert (=> b!569677 m!548513))

(declare-fun m!548519 () Bool)

(assert (=> b!569677 m!548519))

(assert (=> b!569675 m!548499))

(assert (=> b!569675 m!548499))

(declare-fun m!548521 () Bool)

(assert (=> b!569675 m!548521))

(declare-fun m!548523 () Bool)

(assert (=> b!569676 m!548523))

(declare-fun m!548525 () Bool)

(assert (=> b!569672 m!548525))

(declare-fun m!548527 () Bool)

(assert (=> b!569674 m!548527))

(declare-fun m!548529 () Bool)

(assert (=> b!569673 m!548529))

(declare-fun m!548531 () Bool)

(assert (=> b!569670 m!548531))

(check-sat (not start!52186) (not b!569677) (not b!569671) (not b!569674) (not b!569675) (not b!569672) (not b!569673) (not b!569676) (not b!569670))
(check-sat)
