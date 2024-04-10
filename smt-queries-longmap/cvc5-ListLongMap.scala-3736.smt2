; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51410 () Bool)

(assert start!51410)

(declare-fun b!561686 () Bool)

(declare-fun e!323677 () Bool)

(declare-fun e!323674 () Bool)

(assert (=> b!561686 (= e!323677 e!323674)))

(declare-fun res!352838 () Bool)

(assert (=> b!561686 (=> res!352838 e!323674)))

(declare-datatypes ((SeekEntryResult!5387 0))(
  ( (MissingZero!5387 (index!23775 (_ BitVec 32))) (Found!5387 (index!23776 (_ BitVec 32))) (Intermediate!5387 (undefined!6199 Bool) (index!23777 (_ BitVec 32)) (x!52682 (_ BitVec 32))) (Undefined!5387) (MissingVacant!5387 (index!23778 (_ BitVec 32))) )
))
(declare-fun lt!255685 () SeekEntryResult!5387)

(assert (=> b!561686 (= res!352838 (or (undefined!6199 lt!255685) (not (is-Intermediate!5387 lt!255685))))))

(declare-fun b!561687 () Bool)

(declare-fun res!352839 () Bool)

(declare-fun e!323676 () Bool)

(assert (=> b!561687 (=> (not res!352839) (not e!323676))))

(declare-datatypes ((array!35275 0))(
  ( (array!35276 (arr!16938 (Array (_ BitVec 32) (_ BitVec 64))) (size!17302 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35275)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561687 (= res!352839 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561688 () Bool)

(declare-fun res!352844 () Bool)

(assert (=> b!561688 (=> (not res!352844) (not e!323676))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561688 (= res!352844 (and (= (size!17302 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17302 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17302 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561689 () Bool)

(declare-fun e!323679 () Bool)

(assert (=> b!561689 (= e!323679 (not true))))

(assert (=> b!561689 e!323677))

(declare-fun res!352846 () Bool)

(assert (=> b!561689 (=> (not res!352846) (not e!323677))))

(declare-fun lt!255682 () SeekEntryResult!5387)

(assert (=> b!561689 (= res!352846 (= lt!255682 (Found!5387 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35275 (_ BitVec 32)) SeekEntryResult!5387)

(assert (=> b!561689 (= lt!255682 (seekEntryOrOpen!0 (select (arr!16938 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35275 (_ BitVec 32)) Bool)

(assert (=> b!561689 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17548 0))(
  ( (Unit!17549) )
))
(declare-fun lt!255687 () Unit!17548)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35275 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17548)

(assert (=> b!561689 (= lt!255687 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561690 () Bool)

(declare-fun lt!255686 () array!35275)

(declare-fun e!323678 () Bool)

(declare-fun lt!255683 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35275 (_ BitVec 32)) SeekEntryResult!5387)

(assert (=> b!561690 (= e!323678 (= (seekEntryOrOpen!0 lt!255683 lt!255686 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52682 lt!255685) (index!23777 lt!255685) (index!23777 lt!255685) lt!255683 lt!255686 mask!3119)))))

(declare-fun b!561691 () Bool)

(declare-fun e!323673 () Bool)

(assert (=> b!561691 (= e!323676 e!323673)))

(declare-fun res!352849 () Bool)

(assert (=> b!561691 (=> (not res!352849) (not e!323673))))

(declare-fun lt!255681 () SeekEntryResult!5387)

(assert (=> b!561691 (= res!352849 (or (= lt!255681 (MissingZero!5387 i!1132)) (= lt!255681 (MissingVacant!5387 i!1132))))))

(assert (=> b!561691 (= lt!255681 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!561692 () Bool)

(declare-fun e!323675 () Bool)

(assert (=> b!561692 (= e!323674 e!323675)))

(declare-fun res!352847 () Bool)

(assert (=> b!561692 (=> res!352847 e!323675)))

(declare-fun lt!255680 () (_ BitVec 64))

(assert (=> b!561692 (= res!352847 (or (= lt!255680 (select (arr!16938 a!3118) j!142)) (= lt!255680 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561692 (= lt!255680 (select (arr!16938 a!3118) (index!23777 lt!255685)))))

(declare-fun b!561693 () Bool)

(assert (=> b!561693 (= e!323673 e!323679)))

(declare-fun res!352840 () Bool)

(assert (=> b!561693 (=> (not res!352840) (not e!323679))))

(declare-fun lt!255688 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35275 (_ BitVec 32)) SeekEntryResult!5387)

(assert (=> b!561693 (= res!352840 (= lt!255685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255688 lt!255683 lt!255686 mask!3119)))))

(declare-fun lt!255684 () (_ BitVec 32))

(assert (=> b!561693 (= lt!255685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255684 (select (arr!16938 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561693 (= lt!255688 (toIndex!0 lt!255683 mask!3119))))

(assert (=> b!561693 (= lt!255683 (select (store (arr!16938 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!561693 (= lt!255684 (toIndex!0 (select (arr!16938 a!3118) j!142) mask!3119))))

(assert (=> b!561693 (= lt!255686 (array!35276 (store (arr!16938 a!3118) i!1132 k!1914) (size!17302 a!3118)))))

(declare-fun b!561694 () Bool)

(declare-fun res!352850 () Bool)

(assert (=> b!561694 (=> (not res!352850) (not e!323676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561694 (= res!352850 (validKeyInArray!0 k!1914))))

(declare-fun res!352845 () Bool)

(assert (=> start!51410 (=> (not res!352845) (not e!323676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51410 (= res!352845 (validMask!0 mask!3119))))

(assert (=> start!51410 e!323676))

(assert (=> start!51410 true))

(declare-fun array_inv!12734 (array!35275) Bool)

(assert (=> start!51410 (array_inv!12734 a!3118)))

(declare-fun b!561695 () Bool)

(declare-fun res!352842 () Bool)

(assert (=> b!561695 (=> (not res!352842) (not e!323676))))

(assert (=> b!561695 (= res!352842 (validKeyInArray!0 (select (arr!16938 a!3118) j!142)))))

(declare-fun b!561696 () Bool)

(declare-fun res!352848 () Bool)

(assert (=> b!561696 (=> (not res!352848) (not e!323673))))

(declare-datatypes ((List!11018 0))(
  ( (Nil!11015) (Cons!11014 (h!12017 (_ BitVec 64)) (t!17246 List!11018)) )
))
(declare-fun arrayNoDuplicates!0 (array!35275 (_ BitVec 32) List!11018) Bool)

(assert (=> b!561696 (= res!352848 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11015))))

(declare-fun b!561697 () Bool)

(assert (=> b!561697 (= e!323675 e!323678)))

(declare-fun res!352843 () Bool)

(assert (=> b!561697 (=> (not res!352843) (not e!323678))))

(assert (=> b!561697 (= res!352843 (= lt!255682 (seekKeyOrZeroReturnVacant!0 (x!52682 lt!255685) (index!23777 lt!255685) (index!23777 lt!255685) (select (arr!16938 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561698 () Bool)

(declare-fun res!352841 () Bool)

(assert (=> b!561698 (=> (not res!352841) (not e!323673))))

(assert (=> b!561698 (= res!352841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51410 res!352845) b!561688))

(assert (= (and b!561688 res!352844) b!561695))

(assert (= (and b!561695 res!352842) b!561694))

(assert (= (and b!561694 res!352850) b!561687))

(assert (= (and b!561687 res!352839) b!561691))

(assert (= (and b!561691 res!352849) b!561698))

(assert (= (and b!561698 res!352841) b!561696))

(assert (= (and b!561696 res!352848) b!561693))

(assert (= (and b!561693 res!352840) b!561689))

(assert (= (and b!561689 res!352846) b!561686))

(assert (= (and b!561686 (not res!352838)) b!561692))

(assert (= (and b!561692 (not res!352847)) b!561697))

(assert (= (and b!561697 res!352843) b!561690))

(declare-fun m!539613 () Bool)

(assert (=> b!561696 m!539613))

(declare-fun m!539615 () Bool)

(assert (=> b!561690 m!539615))

(declare-fun m!539617 () Bool)

(assert (=> b!561690 m!539617))

(declare-fun m!539619 () Bool)

(assert (=> b!561694 m!539619))

(declare-fun m!539621 () Bool)

(assert (=> start!51410 m!539621))

(declare-fun m!539623 () Bool)

(assert (=> start!51410 m!539623))

(declare-fun m!539625 () Bool)

(assert (=> b!561687 m!539625))

(declare-fun m!539627 () Bool)

(assert (=> b!561692 m!539627))

(declare-fun m!539629 () Bool)

(assert (=> b!561692 m!539629))

(assert (=> b!561697 m!539627))

(assert (=> b!561697 m!539627))

(declare-fun m!539631 () Bool)

(assert (=> b!561697 m!539631))

(assert (=> b!561695 m!539627))

(assert (=> b!561695 m!539627))

(declare-fun m!539633 () Bool)

(assert (=> b!561695 m!539633))

(assert (=> b!561689 m!539627))

(assert (=> b!561689 m!539627))

(declare-fun m!539635 () Bool)

(assert (=> b!561689 m!539635))

(declare-fun m!539637 () Bool)

(assert (=> b!561689 m!539637))

(declare-fun m!539639 () Bool)

(assert (=> b!561689 m!539639))

(declare-fun m!539641 () Bool)

(assert (=> b!561691 m!539641))

(assert (=> b!561693 m!539627))

(declare-fun m!539643 () Bool)

(assert (=> b!561693 m!539643))

(declare-fun m!539645 () Bool)

(assert (=> b!561693 m!539645))

(assert (=> b!561693 m!539627))

(assert (=> b!561693 m!539627))

(declare-fun m!539647 () Bool)

(assert (=> b!561693 m!539647))

(declare-fun m!539649 () Bool)

(assert (=> b!561693 m!539649))

(declare-fun m!539651 () Bool)

(assert (=> b!561693 m!539651))

(declare-fun m!539653 () Bool)

(assert (=> b!561693 m!539653))

(declare-fun m!539655 () Bool)

(assert (=> b!561698 m!539655))

(push 1)

