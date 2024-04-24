; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51450 () Bool)

(assert start!51450)

(declare-datatypes ((array!35262 0))(
  ( (array!35263 (arr!16930 (Array (_ BitVec 32) (_ BitVec 64))) (size!17294 (_ BitVec 32))) )
))
(declare-fun lt!255716 () array!35262)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!323730 () Bool)

(declare-fun b!561769 () Bool)

(declare-fun lt!255713 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5335 0))(
  ( (MissingZero!5335 (index!23567 (_ BitVec 32))) (Found!5335 (index!23568 (_ BitVec 32))) (Intermediate!5335 (undefined!6147 Bool) (index!23569 (_ BitVec 32)) (x!52625 (_ BitVec 32))) (Undefined!5335) (MissingVacant!5335 (index!23570 (_ BitVec 32))) )
))
(declare-fun lt!255712 () SeekEntryResult!5335)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35262 (_ BitVec 32)) SeekEntryResult!5335)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35262 (_ BitVec 32)) SeekEntryResult!5335)

(assert (=> b!561769 (= e!323730 (= (seekEntryOrOpen!0 lt!255713 lt!255716 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52625 lt!255712) (index!23569 lt!255712) (index!23569 lt!255712) lt!255713 lt!255716 mask!3119)))))

(declare-fun b!561770 () Bool)

(declare-fun e!323731 () Bool)

(declare-fun e!323736 () Bool)

(assert (=> b!561770 (= e!323731 e!323736)))

(declare-fun res!352828 () Bool)

(assert (=> b!561770 (=> (not res!352828) (not e!323736))))

(declare-fun lt!255718 () SeekEntryResult!5335)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561770 (= res!352828 (or (= lt!255718 (MissingZero!5335 i!1132)) (= lt!255718 (MissingVacant!5335 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun a!3118 () array!35262)

(assert (=> b!561770 (= lt!255718 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561771 () Bool)

(declare-fun res!352823 () Bool)

(assert (=> b!561771 (=> (not res!352823) (not e!323731))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561771 (= res!352823 (validKeyInArray!0 k0!1914))))

(declare-fun b!561772 () Bool)

(declare-fun res!352827 () Bool)

(assert (=> b!561772 (=> (not res!352827) (not e!323731))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!561772 (= res!352827 (validKeyInArray!0 (select (arr!16930 a!3118) j!142)))))

(declare-fun b!561773 () Bool)

(declare-fun e!323729 () Bool)

(assert (=> b!561773 (= e!323736 e!323729)))

(declare-fun res!352822 () Bool)

(assert (=> b!561773 (=> (not res!352822) (not e!323729))))

(declare-fun lt!255711 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35262 (_ BitVec 32)) SeekEntryResult!5335)

(assert (=> b!561773 (= res!352822 (= lt!255712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255711 lt!255713 lt!255716 mask!3119)))))

(declare-fun lt!255715 () (_ BitVec 32))

(assert (=> b!561773 (= lt!255712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255715 (select (arr!16930 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561773 (= lt!255711 (toIndex!0 lt!255713 mask!3119))))

(assert (=> b!561773 (= lt!255713 (select (store (arr!16930 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561773 (= lt!255715 (toIndex!0 (select (arr!16930 a!3118) j!142) mask!3119))))

(assert (=> b!561773 (= lt!255716 (array!35263 (store (arr!16930 a!3118) i!1132 k0!1914) (size!17294 a!3118)))))

(declare-fun res!352817 () Bool)

(assert (=> start!51450 (=> (not res!352817) (not e!323731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51450 (= res!352817 (validMask!0 mask!3119))))

(assert (=> start!51450 e!323731))

(assert (=> start!51450 true))

(declare-fun array_inv!12789 (array!35262) Bool)

(assert (=> start!51450 (array_inv!12789 a!3118)))

(declare-fun b!561774 () Bool)

(declare-fun res!352816 () Bool)

(assert (=> b!561774 (=> (not res!352816) (not e!323731))))

(assert (=> b!561774 (= res!352816 (and (= (size!17294 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17294 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17294 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561775 () Bool)

(declare-fun res!352818 () Bool)

(assert (=> b!561775 (=> (not res!352818) (not e!323736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35262 (_ BitVec 32)) Bool)

(assert (=> b!561775 (= res!352818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561776 () Bool)

(declare-fun e!323735 () Bool)

(assert (=> b!561776 (= e!323735 e!323730)))

(declare-fun res!352826 () Bool)

(assert (=> b!561776 (=> (not res!352826) (not e!323730))))

(declare-fun lt!255710 () SeekEntryResult!5335)

(assert (=> b!561776 (= res!352826 (= lt!255710 (seekKeyOrZeroReturnVacant!0 (x!52625 lt!255712) (index!23569 lt!255712) (index!23569 lt!255712) (select (arr!16930 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561777 () Bool)

(declare-fun res!352825 () Bool)

(assert (=> b!561777 (=> (not res!352825) (not e!323731))))

(declare-fun arrayContainsKey!0 (array!35262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561777 (= res!352825 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561778 () Bool)

(declare-fun e!323733 () Bool)

(declare-fun e!323732 () Bool)

(assert (=> b!561778 (= e!323733 e!323732)))

(declare-fun res!352820 () Bool)

(assert (=> b!561778 (=> res!352820 e!323732)))

(get-info :version)

(assert (=> b!561778 (= res!352820 (or (undefined!6147 lt!255712) (not ((_ is Intermediate!5335) lt!255712))))))

(declare-fun b!561779 () Bool)

(declare-fun res!352824 () Bool)

(assert (=> b!561779 (=> (not res!352824) (not e!323736))))

(declare-datatypes ((List!10917 0))(
  ( (Nil!10914) (Cons!10913 (h!11919 (_ BitVec 64)) (t!17137 List!10917)) )
))
(declare-fun arrayNoDuplicates!0 (array!35262 (_ BitVec 32) List!10917) Bool)

(assert (=> b!561779 (= res!352824 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10914))))

(declare-fun b!561780 () Bool)

(assert (=> b!561780 (= e!323729 (not true))))

(assert (=> b!561780 e!323733))

(declare-fun res!352819 () Bool)

(assert (=> b!561780 (=> (not res!352819) (not e!323733))))

(assert (=> b!561780 (= res!352819 (= lt!255710 (Found!5335 j!142)))))

(assert (=> b!561780 (= lt!255710 (seekEntryOrOpen!0 (select (arr!16930 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561780 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17515 0))(
  ( (Unit!17516) )
))
(declare-fun lt!255717 () Unit!17515)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17515)

(assert (=> b!561780 (= lt!255717 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561781 () Bool)

(assert (=> b!561781 (= e!323732 e!323735)))

(declare-fun res!352821 () Bool)

(assert (=> b!561781 (=> res!352821 e!323735)))

(declare-fun lt!255714 () (_ BitVec 64))

(assert (=> b!561781 (= res!352821 (or (= lt!255714 (select (arr!16930 a!3118) j!142)) (= lt!255714 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561781 (= lt!255714 (select (arr!16930 a!3118) (index!23569 lt!255712)))))

(assert (= (and start!51450 res!352817) b!561774))

(assert (= (and b!561774 res!352816) b!561772))

(assert (= (and b!561772 res!352827) b!561771))

(assert (= (and b!561771 res!352823) b!561777))

(assert (= (and b!561777 res!352825) b!561770))

(assert (= (and b!561770 res!352828) b!561775))

(assert (= (and b!561775 res!352818) b!561779))

(assert (= (and b!561779 res!352824) b!561773))

(assert (= (and b!561773 res!352822) b!561780))

(assert (= (and b!561780 res!352819) b!561778))

(assert (= (and b!561778 (not res!352820)) b!561781))

(assert (= (and b!561781 (not res!352821)) b!561776))

(assert (= (and b!561776 res!352826) b!561769))

(declare-fun m!539819 () Bool)

(assert (=> b!561772 m!539819))

(assert (=> b!561772 m!539819))

(declare-fun m!539821 () Bool)

(assert (=> b!561772 m!539821))

(assert (=> b!561780 m!539819))

(assert (=> b!561780 m!539819))

(declare-fun m!539823 () Bool)

(assert (=> b!561780 m!539823))

(declare-fun m!539825 () Bool)

(assert (=> b!561780 m!539825))

(declare-fun m!539827 () Bool)

(assert (=> b!561780 m!539827))

(declare-fun m!539829 () Bool)

(assert (=> b!561775 m!539829))

(assert (=> b!561776 m!539819))

(assert (=> b!561776 m!539819))

(declare-fun m!539831 () Bool)

(assert (=> b!561776 m!539831))

(declare-fun m!539833 () Bool)

(assert (=> start!51450 m!539833))

(declare-fun m!539835 () Bool)

(assert (=> start!51450 m!539835))

(declare-fun m!539837 () Bool)

(assert (=> b!561779 m!539837))

(assert (=> b!561773 m!539819))

(declare-fun m!539839 () Bool)

(assert (=> b!561773 m!539839))

(assert (=> b!561773 m!539819))

(declare-fun m!539841 () Bool)

(assert (=> b!561773 m!539841))

(declare-fun m!539843 () Bool)

(assert (=> b!561773 m!539843))

(assert (=> b!561773 m!539819))

(declare-fun m!539845 () Bool)

(assert (=> b!561773 m!539845))

(declare-fun m!539847 () Bool)

(assert (=> b!561773 m!539847))

(declare-fun m!539849 () Bool)

(assert (=> b!561773 m!539849))

(declare-fun m!539851 () Bool)

(assert (=> b!561770 m!539851))

(declare-fun m!539853 () Bool)

(assert (=> b!561769 m!539853))

(declare-fun m!539855 () Bool)

(assert (=> b!561769 m!539855))

(assert (=> b!561781 m!539819))

(declare-fun m!539857 () Bool)

(assert (=> b!561781 m!539857))

(declare-fun m!539859 () Bool)

(assert (=> b!561777 m!539859))

(declare-fun m!539861 () Bool)

(assert (=> b!561771 m!539861))

(check-sat (not b!561779) (not b!561773) (not start!51450) (not b!561776) (not b!561777) (not b!561775) (not b!561780) (not b!561772) (not b!561769) (not b!561771) (not b!561770))
(check-sat)
