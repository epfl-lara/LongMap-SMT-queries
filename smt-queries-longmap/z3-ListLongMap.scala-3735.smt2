; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51406 () Bool)

(assert start!51406)

(declare-fun b!561608 () Bool)

(declare-fun res!352770 () Bool)

(declare-fun e!323626 () Bool)

(assert (=> b!561608 (=> (not res!352770) (not e!323626))))

(declare-datatypes ((array!35271 0))(
  ( (array!35272 (arr!16936 (Array (_ BitVec 32) (_ BitVec 64))) (size!17300 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35271)

(declare-datatypes ((List!11016 0))(
  ( (Nil!11013) (Cons!11012 (h!12015 (_ BitVec 64)) (t!17244 List!11016)) )
))
(declare-fun arrayNoDuplicates!0 (array!35271 (_ BitVec 32) List!11016) Bool)

(assert (=> b!561608 (= res!352770 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11013))))

(declare-fun b!561609 () Bool)

(declare-fun res!352762 () Bool)

(declare-fun e!323628 () Bool)

(assert (=> b!561609 (=> (not res!352762) (not e!323628))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561609 (= res!352762 (validKeyInArray!0 (select (arr!16936 a!3118) j!142)))))

(declare-fun b!561610 () Bool)

(declare-fun res!352764 () Bool)

(assert (=> b!561610 (=> (not res!352764) (not e!323628))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561610 (= res!352764 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561611 () Bool)

(declare-fun e!323624 () Bool)

(declare-fun e!323629 () Bool)

(assert (=> b!561611 (= e!323624 e!323629)))

(declare-fun res!352772 () Bool)

(assert (=> b!561611 (=> res!352772 e!323629)))

(declare-fun lt!255627 () (_ BitVec 64))

(assert (=> b!561611 (= res!352772 (or (= lt!255627 (select (arr!16936 a!3118) j!142)) (= lt!255627 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5385 0))(
  ( (MissingZero!5385 (index!23767 (_ BitVec 32))) (Found!5385 (index!23768 (_ BitVec 32))) (Intermediate!5385 (undefined!6197 Bool) (index!23769 (_ BitVec 32)) (x!52672 (_ BitVec 32))) (Undefined!5385) (MissingVacant!5385 (index!23770 (_ BitVec 32))) )
))
(declare-fun lt!255634 () SeekEntryResult!5385)

(assert (=> b!561611 (= lt!255627 (select (arr!16936 a!3118) (index!23769 lt!255634)))))

(declare-fun b!561612 () Bool)

(declare-fun res!352769 () Bool)

(assert (=> b!561612 (=> (not res!352769) (not e!323628))))

(assert (=> b!561612 (= res!352769 (validKeyInArray!0 k0!1914))))

(declare-fun b!561613 () Bool)

(declare-fun e!323625 () Bool)

(assert (=> b!561613 (= e!323626 e!323625)))

(declare-fun res!352771 () Bool)

(assert (=> b!561613 (=> (not res!352771) (not e!323625))))

(declare-fun lt!255630 () array!35271)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!255632 () (_ BitVec 32))

(declare-fun lt!255631 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35271 (_ BitVec 32)) SeekEntryResult!5385)

(assert (=> b!561613 (= res!352771 (= lt!255634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255632 lt!255631 lt!255630 mask!3119)))))

(declare-fun lt!255628 () (_ BitVec 32))

(assert (=> b!561613 (= lt!255634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255628 (select (arr!16936 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561613 (= lt!255632 (toIndex!0 lt!255631 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561613 (= lt!255631 (select (store (arr!16936 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561613 (= lt!255628 (toIndex!0 (select (arr!16936 a!3118) j!142) mask!3119))))

(assert (=> b!561613 (= lt!255630 (array!35272 (store (arr!16936 a!3118) i!1132 k0!1914) (size!17300 a!3118)))))

(declare-fun e!323627 () Bool)

(declare-fun b!561614 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35271 (_ BitVec 32)) SeekEntryResult!5385)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35271 (_ BitVec 32)) SeekEntryResult!5385)

(assert (=> b!561614 (= e!323627 (= (seekEntryOrOpen!0 lt!255631 lt!255630 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52672 lt!255634) (index!23769 lt!255634) (index!23769 lt!255634) lt!255631 lt!255630 mask!3119)))))

(declare-fun b!561615 () Bool)

(declare-fun res!352763 () Bool)

(assert (=> b!561615 (=> (not res!352763) (not e!323626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35271 (_ BitVec 32)) Bool)

(assert (=> b!561615 (= res!352763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!352765 () Bool)

(assert (=> start!51406 (=> (not res!352765) (not e!323628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51406 (= res!352765 (validMask!0 mask!3119))))

(assert (=> start!51406 e!323628))

(assert (=> start!51406 true))

(declare-fun array_inv!12732 (array!35271) Bool)

(assert (=> start!51406 (array_inv!12732 a!3118)))

(declare-fun b!561616 () Bool)

(declare-fun e!323630 () Bool)

(assert (=> b!561616 (= e!323630 e!323624)))

(declare-fun res!352767 () Bool)

(assert (=> b!561616 (=> res!352767 e!323624)))

(get-info :version)

(assert (=> b!561616 (= res!352767 (or (undefined!6197 lt!255634) (not ((_ is Intermediate!5385) lt!255634))))))

(declare-fun b!561617 () Bool)

(assert (=> b!561617 (= e!323628 e!323626)))

(declare-fun res!352760 () Bool)

(assert (=> b!561617 (=> (not res!352760) (not e!323626))))

(declare-fun lt!255633 () SeekEntryResult!5385)

(assert (=> b!561617 (= res!352760 (or (= lt!255633 (MissingZero!5385 i!1132)) (= lt!255633 (MissingVacant!5385 i!1132))))))

(assert (=> b!561617 (= lt!255633 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561618 () Bool)

(assert (=> b!561618 (= e!323625 (not true))))

(assert (=> b!561618 e!323630))

(declare-fun res!352768 () Bool)

(assert (=> b!561618 (=> (not res!352768) (not e!323630))))

(declare-fun lt!255629 () SeekEntryResult!5385)

(assert (=> b!561618 (= res!352768 (= lt!255629 (Found!5385 j!142)))))

(assert (=> b!561618 (= lt!255629 (seekEntryOrOpen!0 (select (arr!16936 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561618 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17544 0))(
  ( (Unit!17545) )
))
(declare-fun lt!255626 () Unit!17544)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17544)

(assert (=> b!561618 (= lt!255626 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561619 () Bool)

(declare-fun res!352761 () Bool)

(assert (=> b!561619 (=> (not res!352761) (not e!323628))))

(assert (=> b!561619 (= res!352761 (and (= (size!17300 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17300 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17300 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561620 () Bool)

(assert (=> b!561620 (= e!323629 e!323627)))

(declare-fun res!352766 () Bool)

(assert (=> b!561620 (=> (not res!352766) (not e!323627))))

(assert (=> b!561620 (= res!352766 (= lt!255629 (seekKeyOrZeroReturnVacant!0 (x!52672 lt!255634) (index!23769 lt!255634) (index!23769 lt!255634) (select (arr!16936 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!51406 res!352765) b!561619))

(assert (= (and b!561619 res!352761) b!561609))

(assert (= (and b!561609 res!352762) b!561612))

(assert (= (and b!561612 res!352769) b!561610))

(assert (= (and b!561610 res!352764) b!561617))

(assert (= (and b!561617 res!352760) b!561615))

(assert (= (and b!561615 res!352763) b!561608))

(assert (= (and b!561608 res!352770) b!561613))

(assert (= (and b!561613 res!352771) b!561618))

(assert (= (and b!561618 res!352768) b!561616))

(assert (= (and b!561616 (not res!352767)) b!561611))

(assert (= (and b!561611 (not res!352772)) b!561620))

(assert (= (and b!561620 res!352766) b!561614))

(declare-fun m!539525 () Bool)

(assert (=> b!561609 m!539525))

(assert (=> b!561609 m!539525))

(declare-fun m!539527 () Bool)

(assert (=> b!561609 m!539527))

(declare-fun m!539529 () Bool)

(assert (=> b!561610 m!539529))

(declare-fun m!539531 () Bool)

(assert (=> b!561612 m!539531))

(declare-fun m!539533 () Bool)

(assert (=> b!561608 m!539533))

(assert (=> b!561611 m!539525))

(declare-fun m!539535 () Bool)

(assert (=> b!561611 m!539535))

(assert (=> b!561618 m!539525))

(assert (=> b!561618 m!539525))

(declare-fun m!539537 () Bool)

(assert (=> b!561618 m!539537))

(declare-fun m!539539 () Bool)

(assert (=> b!561618 m!539539))

(declare-fun m!539541 () Bool)

(assert (=> b!561618 m!539541))

(declare-fun m!539543 () Bool)

(assert (=> start!51406 m!539543))

(declare-fun m!539545 () Bool)

(assert (=> start!51406 m!539545))

(declare-fun m!539547 () Bool)

(assert (=> b!561617 m!539547))

(assert (=> b!561613 m!539525))

(declare-fun m!539549 () Bool)

(assert (=> b!561613 m!539549))

(assert (=> b!561613 m!539525))

(declare-fun m!539551 () Bool)

(assert (=> b!561613 m!539551))

(declare-fun m!539553 () Bool)

(assert (=> b!561613 m!539553))

(assert (=> b!561613 m!539525))

(declare-fun m!539555 () Bool)

(assert (=> b!561613 m!539555))

(declare-fun m!539557 () Bool)

(assert (=> b!561613 m!539557))

(declare-fun m!539559 () Bool)

(assert (=> b!561613 m!539559))

(assert (=> b!561620 m!539525))

(assert (=> b!561620 m!539525))

(declare-fun m!539561 () Bool)

(assert (=> b!561620 m!539561))

(declare-fun m!539563 () Bool)

(assert (=> b!561615 m!539563))

(declare-fun m!539565 () Bool)

(assert (=> b!561614 m!539565))

(declare-fun m!539567 () Bool)

(assert (=> b!561614 m!539567))

(check-sat (not b!561618) (not b!561609) (not start!51406) (not b!561613) (not b!561608) (not b!561620) (not b!561614) (not b!561612) (not b!561617) (not b!561610) (not b!561615))
(check-sat)
