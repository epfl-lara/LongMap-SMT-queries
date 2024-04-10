; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50224 () Bool)

(assert start!50224)

(declare-fun b!549745 () Bool)

(declare-fun res!342890 () Bool)

(declare-fun e!317455 () Bool)

(assert (=> b!549745 (=> (not res!342890) (not e!317455))))

(declare-datatypes ((array!34677 0))(
  ( (array!34678 (arr!16654 (Array (_ BitVec 32) (_ BitVec 64))) (size!17018 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34677)

(declare-datatypes ((List!10734 0))(
  ( (Nil!10731) (Cons!10730 (h!11703 (_ BitVec 64)) (t!16962 List!10734)) )
))
(declare-fun arrayNoDuplicates!0 (array!34677 (_ BitVec 32) List!10734) Bool)

(assert (=> b!549745 (= res!342890 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10731))))

(declare-fun b!549747 () Bool)

(declare-fun e!317456 () Bool)

(assert (=> b!549747 (= e!317456 e!317455)))

(declare-fun res!342891 () Bool)

(assert (=> b!549747 (=> (not res!342891) (not e!317455))))

(declare-datatypes ((SeekEntryResult!5103 0))(
  ( (MissingZero!5103 (index!22639 (_ BitVec 32))) (Found!5103 (index!22640 (_ BitVec 32))) (Intermediate!5103 (undefined!5915 Bool) (index!22641 (_ BitVec 32)) (x!51569 (_ BitVec 32))) (Undefined!5103) (MissingVacant!5103 (index!22642 (_ BitVec 32))) )
))
(declare-fun lt!250321 () SeekEntryResult!5103)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549747 (= res!342891 (or (= lt!250321 (MissingZero!5103 i!1132)) (= lt!250321 (MissingVacant!5103 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34677 (_ BitVec 32)) SeekEntryResult!5103)

(assert (=> b!549747 (= lt!250321 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!549748 () Bool)

(declare-fun res!342893 () Bool)

(assert (=> b!549748 (=> (not res!342893) (not e!317456))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!549748 (= res!342893 (and (= (size!17018 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17018 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17018 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549749 () Bool)

(declare-fun res!342896 () Bool)

(assert (=> b!549749 (=> (not res!342896) (not e!317455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34677 (_ BitVec 32)) Bool)

(assert (=> b!549749 (= res!342896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549750 () Bool)

(assert (=> b!549750 (= e!317455 false)))

(declare-fun lt!250323 () (_ BitVec 32))

(declare-fun lt!250324 () SeekEntryResult!5103)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34677 (_ BitVec 32)) SeekEntryResult!5103)

(assert (=> b!549750 (= lt!250324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250323 (select (store (arr!16654 a!3118) i!1132 k0!1914) j!142) (array!34678 (store (arr!16654 a!3118) i!1132 k0!1914) (size!17018 a!3118)) mask!3119))))

(declare-fun lt!250320 () SeekEntryResult!5103)

(declare-fun lt!250322 () (_ BitVec 32))

(assert (=> b!549750 (= lt!250320 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250322 (select (arr!16654 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549750 (= lt!250323 (toIndex!0 (select (store (arr!16654 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!549750 (= lt!250322 (toIndex!0 (select (arr!16654 a!3118) j!142) mask!3119))))

(declare-fun b!549746 () Bool)

(declare-fun res!342894 () Bool)

(assert (=> b!549746 (=> (not res!342894) (not e!317456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549746 (= res!342894 (validKeyInArray!0 (select (arr!16654 a!3118) j!142)))))

(declare-fun res!342889 () Bool)

(assert (=> start!50224 (=> (not res!342889) (not e!317456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50224 (= res!342889 (validMask!0 mask!3119))))

(assert (=> start!50224 e!317456))

(assert (=> start!50224 true))

(declare-fun array_inv!12450 (array!34677) Bool)

(assert (=> start!50224 (array_inv!12450 a!3118)))

(declare-fun b!549751 () Bool)

(declare-fun res!342892 () Bool)

(assert (=> b!549751 (=> (not res!342892) (not e!317456))))

(declare-fun arrayContainsKey!0 (array!34677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549751 (= res!342892 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549752 () Bool)

(declare-fun res!342895 () Bool)

(assert (=> b!549752 (=> (not res!342895) (not e!317456))))

(assert (=> b!549752 (= res!342895 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50224 res!342889) b!549748))

(assert (= (and b!549748 res!342893) b!549746))

(assert (= (and b!549746 res!342894) b!549752))

(assert (= (and b!549752 res!342895) b!549751))

(assert (= (and b!549751 res!342892) b!549747))

(assert (= (and b!549747 res!342891) b!549749))

(assert (= (and b!549749 res!342896) b!549745))

(assert (= (and b!549745 res!342890) b!549750))

(declare-fun m!526671 () Bool)

(assert (=> b!549749 m!526671))

(declare-fun m!526673 () Bool)

(assert (=> start!50224 m!526673))

(declare-fun m!526675 () Bool)

(assert (=> start!50224 m!526675))

(declare-fun m!526677 () Bool)

(assert (=> b!549751 m!526677))

(declare-fun m!526679 () Bool)

(assert (=> b!549752 m!526679))

(declare-fun m!526681 () Bool)

(assert (=> b!549750 m!526681))

(declare-fun m!526683 () Bool)

(assert (=> b!549750 m!526683))

(assert (=> b!549750 m!526681))

(declare-fun m!526685 () Bool)

(assert (=> b!549750 m!526685))

(assert (=> b!549750 m!526685))

(declare-fun m!526687 () Bool)

(assert (=> b!549750 m!526687))

(assert (=> b!549750 m!526681))

(declare-fun m!526689 () Bool)

(assert (=> b!549750 m!526689))

(declare-fun m!526691 () Bool)

(assert (=> b!549750 m!526691))

(assert (=> b!549750 m!526685))

(declare-fun m!526693 () Bool)

(assert (=> b!549750 m!526693))

(assert (=> b!549746 m!526681))

(assert (=> b!549746 m!526681))

(declare-fun m!526695 () Bool)

(assert (=> b!549746 m!526695))

(declare-fun m!526697 () Bool)

(assert (=> b!549747 m!526697))

(declare-fun m!526699 () Bool)

(assert (=> b!549745 m!526699))

(check-sat (not b!549750) (not b!549751) (not b!549745) (not b!549746) (not b!549747) (not b!549749) (not b!549752) (not start!50224))
(check-sat)
