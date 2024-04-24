; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52224 () Bool)

(assert start!52224)

(declare-fun b!569762 () Bool)

(declare-fun res!359677 () Bool)

(declare-fun e!327765 () Bool)

(assert (=> b!569762 (=> (not res!359677) (not e!327765))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569762 (= res!359677 (validKeyInArray!0 k0!1914))))

(declare-fun b!569763 () Bool)

(declare-fun res!359682 () Bool)

(assert (=> b!569763 (=> (not res!359682) (not e!327765))))

(declare-datatypes ((array!35694 0))(
  ( (array!35695 (arr!17137 (Array (_ BitVec 32) (_ BitVec 64))) (size!17501 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35694)

(declare-fun arrayContainsKey!0 (array!35694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569763 (= res!359682 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569764 () Bool)

(declare-fun res!359683 () Bool)

(declare-fun e!327764 () Bool)

(assert (=> b!569764 (=> (not res!359683) (not e!327764))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35694 (_ BitVec 32)) Bool)

(assert (=> b!569764 (= res!359683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569765 () Bool)

(declare-fun e!327762 () Bool)

(assert (=> b!569765 (= e!327762 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5542 0))(
  ( (MissingZero!5542 (index!24395 (_ BitVec 32))) (Found!5542 (index!24396 (_ BitVec 32))) (Intermediate!5542 (undefined!6354 Bool) (index!24397 (_ BitVec 32)) (x!53420 (_ BitVec 32))) (Undefined!5542) (MissingVacant!5542 (index!24398 (_ BitVec 32))) )
))
(declare-fun lt!259741 () SeekEntryResult!5542)

(declare-fun lt!259740 () SeekEntryResult!5542)

(get-info :version)

(assert (=> b!569765 (and (= lt!259741 (Found!5542 j!142)) (or (undefined!6354 lt!259740) (not ((_ is Intermediate!5542) lt!259740)) (= (select (arr!17137 a!3118) (index!24397 lt!259740)) (select (arr!17137 a!3118) j!142)) (not (= (select (arr!17137 a!3118) (index!24397 lt!259740)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259741 (MissingZero!5542 (index!24397 lt!259740)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35694 (_ BitVec 32)) SeekEntryResult!5542)

(assert (=> b!569765 (= lt!259741 (seekEntryOrOpen!0 (select (arr!17137 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569765 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17857 0))(
  ( (Unit!17858) )
))
(declare-fun lt!259736 () Unit!17857)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17857)

(assert (=> b!569765 (= lt!259736 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569766 () Bool)

(assert (=> b!569766 (= e!327764 e!327762)))

(declare-fun res!359676 () Bool)

(assert (=> b!569766 (=> (not res!359676) (not e!327762))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!259737 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35694 (_ BitVec 32)) SeekEntryResult!5542)

(assert (=> b!569766 (= res!359676 (= lt!259740 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259737 (select (store (arr!17137 a!3118) i!1132 k0!1914) j!142) (array!35695 (store (arr!17137 a!3118) i!1132 k0!1914) (size!17501 a!3118)) mask!3119)))))

(declare-fun lt!259739 () (_ BitVec 32))

(assert (=> b!569766 (= lt!259740 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259739 (select (arr!17137 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569766 (= lt!259737 (toIndex!0 (select (store (arr!17137 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569766 (= lt!259739 (toIndex!0 (select (arr!17137 a!3118) j!142) mask!3119))))

(declare-fun res!359681 () Bool)

(assert (=> start!52224 (=> (not res!359681) (not e!327765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52224 (= res!359681 (validMask!0 mask!3119))))

(assert (=> start!52224 e!327765))

(assert (=> start!52224 true))

(declare-fun array_inv!12996 (array!35694) Bool)

(assert (=> start!52224 (array_inv!12996 a!3118)))

(declare-fun b!569767 () Bool)

(declare-fun res!359675 () Bool)

(assert (=> b!569767 (=> (not res!359675) (not e!327765))))

(assert (=> b!569767 (= res!359675 (validKeyInArray!0 (select (arr!17137 a!3118) j!142)))))

(declare-fun b!569768 () Bool)

(assert (=> b!569768 (= e!327765 e!327764)))

(declare-fun res!359680 () Bool)

(assert (=> b!569768 (=> (not res!359680) (not e!327764))))

(declare-fun lt!259738 () SeekEntryResult!5542)

(assert (=> b!569768 (= res!359680 (or (= lt!259738 (MissingZero!5542 i!1132)) (= lt!259738 (MissingVacant!5542 i!1132))))))

(assert (=> b!569768 (= lt!259738 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569769 () Bool)

(declare-fun res!359678 () Bool)

(assert (=> b!569769 (=> (not res!359678) (not e!327764))))

(declare-datatypes ((List!11124 0))(
  ( (Nil!11121) (Cons!11120 (h!12144 (_ BitVec 64)) (t!17344 List!11124)) )
))
(declare-fun arrayNoDuplicates!0 (array!35694 (_ BitVec 32) List!11124) Bool)

(assert (=> b!569769 (= res!359678 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11121))))

(declare-fun b!569770 () Bool)

(declare-fun res!359679 () Bool)

(assert (=> b!569770 (=> (not res!359679) (not e!327765))))

(assert (=> b!569770 (= res!359679 (and (= (size!17501 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17501 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17501 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52224 res!359681) b!569770))

(assert (= (and b!569770 res!359679) b!569767))

(assert (= (and b!569767 res!359675) b!569762))

(assert (= (and b!569762 res!359677) b!569763))

(assert (= (and b!569763 res!359682) b!569768))

(assert (= (and b!569768 res!359680) b!569764))

(assert (= (and b!569764 res!359683) b!569769))

(assert (= (and b!569769 res!359678) b!569766))

(assert (= (and b!569766 res!359676) b!569765))

(declare-fun m!548681 () Bool)

(assert (=> b!569762 m!548681))

(declare-fun m!548683 () Bool)

(assert (=> b!569764 m!548683))

(declare-fun m!548685 () Bool)

(assert (=> b!569766 m!548685))

(declare-fun m!548687 () Bool)

(assert (=> b!569766 m!548687))

(assert (=> b!569766 m!548685))

(declare-fun m!548689 () Bool)

(assert (=> b!569766 m!548689))

(assert (=> b!569766 m!548689))

(declare-fun m!548691 () Bool)

(assert (=> b!569766 m!548691))

(assert (=> b!569766 m!548689))

(declare-fun m!548693 () Bool)

(assert (=> b!569766 m!548693))

(assert (=> b!569766 m!548685))

(declare-fun m!548695 () Bool)

(assert (=> b!569766 m!548695))

(declare-fun m!548697 () Bool)

(assert (=> b!569766 m!548697))

(declare-fun m!548699 () Bool)

(assert (=> b!569765 m!548699))

(assert (=> b!569765 m!548685))

(declare-fun m!548701 () Bool)

(assert (=> b!569765 m!548701))

(declare-fun m!548703 () Bool)

(assert (=> b!569765 m!548703))

(assert (=> b!569765 m!548685))

(declare-fun m!548705 () Bool)

(assert (=> b!569765 m!548705))

(declare-fun m!548707 () Bool)

(assert (=> b!569768 m!548707))

(declare-fun m!548709 () Bool)

(assert (=> b!569763 m!548709))

(declare-fun m!548711 () Bool)

(assert (=> b!569769 m!548711))

(declare-fun m!548713 () Bool)

(assert (=> start!52224 m!548713))

(declare-fun m!548715 () Bool)

(assert (=> start!52224 m!548715))

(assert (=> b!569767 m!548685))

(assert (=> b!569767 m!548685))

(declare-fun m!548717 () Bool)

(assert (=> b!569767 m!548717))

(check-sat (not b!569765) (not b!569762) (not b!569767) (not b!569766) (not b!569769) (not start!52224) (not b!569764) (not b!569768) (not b!569763))
(check-sat)
