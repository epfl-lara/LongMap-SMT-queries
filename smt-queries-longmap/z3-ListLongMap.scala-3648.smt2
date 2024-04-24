; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50370 () Bool)

(assert start!50370)

(declare-fun b!550792 () Bool)

(declare-fun res!343655 () Bool)

(declare-fun e!317972 () Bool)

(assert (=> b!550792 (=> (not res!343655) (not e!317972))))

(declare-datatypes ((array!34713 0))(
  ( (array!34714 (arr!16669 (Array (_ BitVec 32) (_ BitVec 64))) (size!17033 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34713)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34713 (_ BitVec 32)) Bool)

(assert (=> b!550792 (= res!343655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550793 () Bool)

(declare-fun res!343654 () Bool)

(declare-fun e!317973 () Bool)

(assert (=> b!550793 (=> (not res!343654) (not e!317973))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550793 (= res!343654 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550794 () Bool)

(declare-fun res!343652 () Bool)

(assert (=> b!550794 (=> (not res!343652) (not e!317972))))

(declare-datatypes ((List!10656 0))(
  ( (Nil!10653) (Cons!10652 (h!11631 (_ BitVec 64)) (t!16876 List!10656)) )
))
(declare-fun arrayNoDuplicates!0 (array!34713 (_ BitVec 32) List!10656) Bool)

(assert (=> b!550794 (= res!343652 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10653))))

(declare-fun b!550795 () Bool)

(declare-fun res!343651 () Bool)

(assert (=> b!550795 (=> (not res!343651) (not e!317972))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5074 0))(
  ( (MissingZero!5074 (index!22523 (_ BitVec 32))) (Found!5074 (index!22524 (_ BitVec 32))) (Intermediate!5074 (undefined!5886 Bool) (index!22525 (_ BitVec 32)) (x!51605 (_ BitVec 32))) (Undefined!5074) (MissingVacant!5074 (index!22526 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34713 (_ BitVec 32)) SeekEntryResult!5074)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550795 (= res!343651 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16669 a!3118) j!142) mask!3119) (select (arr!16669 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16669 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16669 a!3118) i!1132 k0!1914) j!142) (array!34714 (store (arr!16669 a!3118) i!1132 k0!1914) (size!17033 a!3118)) mask!3119)))))

(declare-fun b!550796 () Bool)

(declare-fun res!343648 () Bool)

(assert (=> b!550796 (=> (not res!343648) (not e!317973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550796 (= res!343648 (validKeyInArray!0 (select (arr!16669 a!3118) j!142)))))

(declare-fun e!317970 () Bool)

(declare-fun b!550797 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34713 (_ BitVec 32)) SeekEntryResult!5074)

(assert (=> b!550797 (= e!317970 (= (seekEntryOrOpen!0 (select (arr!16669 a!3118) j!142) a!3118 mask!3119) (Found!5074 j!142)))))

(declare-fun res!343657 () Bool)

(assert (=> start!50370 (=> (not res!343657) (not e!317973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50370 (= res!343657 (validMask!0 mask!3119))))

(assert (=> start!50370 e!317973))

(assert (=> start!50370 true))

(declare-fun array_inv!12528 (array!34713) Bool)

(assert (=> start!50370 (array_inv!12528 a!3118)))

(declare-fun b!550798 () Bool)

(declare-fun res!343656 () Bool)

(assert (=> b!550798 (=> (not res!343656) (not e!317973))))

(assert (=> b!550798 (= res!343656 (and (= (size!17033 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17033 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17033 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550799 () Bool)

(assert (=> b!550799 (= e!317972 (not true))))

(assert (=> b!550799 e!317970))

(declare-fun res!343649 () Bool)

(assert (=> b!550799 (=> (not res!343649) (not e!317970))))

(assert (=> b!550799 (= res!343649 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!16993 0))(
  ( (Unit!16994) )
))
(declare-fun lt!250693 () Unit!16993)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16993)

(assert (=> b!550799 (= lt!250693 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550800 () Bool)

(declare-fun res!343653 () Bool)

(assert (=> b!550800 (=> (not res!343653) (not e!317973))))

(assert (=> b!550800 (= res!343653 (validKeyInArray!0 k0!1914))))

(declare-fun b!550801 () Bool)

(assert (=> b!550801 (= e!317973 e!317972)))

(declare-fun res!343650 () Bool)

(assert (=> b!550801 (=> (not res!343650) (not e!317972))))

(declare-fun lt!250692 () SeekEntryResult!5074)

(assert (=> b!550801 (= res!343650 (or (= lt!250692 (MissingZero!5074 i!1132)) (= lt!250692 (MissingVacant!5074 i!1132))))))

(assert (=> b!550801 (= lt!250692 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50370 res!343657) b!550798))

(assert (= (and b!550798 res!343656) b!550796))

(assert (= (and b!550796 res!343648) b!550800))

(assert (= (and b!550800 res!343653) b!550793))

(assert (= (and b!550793 res!343654) b!550801))

(assert (= (and b!550801 res!343650) b!550792))

(assert (= (and b!550792 res!343655) b!550794))

(assert (= (and b!550794 res!343652) b!550795))

(assert (= (and b!550795 res!343651) b!550799))

(assert (= (and b!550799 res!343649) b!550797))

(declare-fun m!527891 () Bool)

(assert (=> b!550795 m!527891))

(declare-fun m!527893 () Bool)

(assert (=> b!550795 m!527893))

(assert (=> b!550795 m!527891))

(declare-fun m!527895 () Bool)

(assert (=> b!550795 m!527895))

(declare-fun m!527897 () Bool)

(assert (=> b!550795 m!527897))

(assert (=> b!550795 m!527895))

(declare-fun m!527899 () Bool)

(assert (=> b!550795 m!527899))

(assert (=> b!550795 m!527893))

(assert (=> b!550795 m!527891))

(declare-fun m!527901 () Bool)

(assert (=> b!550795 m!527901))

(declare-fun m!527903 () Bool)

(assert (=> b!550795 m!527903))

(assert (=> b!550795 m!527895))

(assert (=> b!550795 m!527897))

(declare-fun m!527905 () Bool)

(assert (=> b!550794 m!527905))

(declare-fun m!527907 () Bool)

(assert (=> b!550801 m!527907))

(declare-fun m!527909 () Bool)

(assert (=> b!550792 m!527909))

(assert (=> b!550796 m!527891))

(assert (=> b!550796 m!527891))

(declare-fun m!527911 () Bool)

(assert (=> b!550796 m!527911))

(declare-fun m!527913 () Bool)

(assert (=> start!50370 m!527913))

(declare-fun m!527915 () Bool)

(assert (=> start!50370 m!527915))

(declare-fun m!527917 () Bool)

(assert (=> b!550800 m!527917))

(assert (=> b!550797 m!527891))

(assert (=> b!550797 m!527891))

(declare-fun m!527919 () Bool)

(assert (=> b!550797 m!527919))

(declare-fun m!527921 () Bool)

(assert (=> b!550793 m!527921))

(declare-fun m!527923 () Bool)

(assert (=> b!550799 m!527923))

(declare-fun m!527925 () Bool)

(assert (=> b!550799 m!527925))

(check-sat (not b!550793) (not b!550801) (not b!550800) (not start!50370) (not b!550797) (not b!550796) (not b!550795) (not b!550794) (not b!550792) (not b!550799))
(check-sat)
