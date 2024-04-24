; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50742 () Bool)

(assert start!50742)

(declare-fun res!346882 () Bool)

(declare-fun e!319797 () Bool)

(assert (=> start!50742 (=> (not res!346882) (not e!319797))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50742 (= res!346882 (validMask!0 mask!3119))))

(assert (=> start!50742 e!319797))

(assert (=> start!50742 true))

(declare-datatypes ((array!34914 0))(
  ( (array!34915 (arr!16765 (Array (_ BitVec 32) (_ BitVec 64))) (size!17129 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34914)

(declare-fun array_inv!12624 (array!34914) Bool)

(assert (=> start!50742 (array_inv!12624 a!3118)))

(declare-fun b!554572 () Bool)

(declare-fun e!319800 () Bool)

(assert (=> b!554572 (= e!319797 e!319800)))

(declare-fun res!346887 () Bool)

(assert (=> b!554572 (=> (not res!346887) (not e!319800))))

(declare-datatypes ((SeekEntryResult!5170 0))(
  ( (MissingZero!5170 (index!22907 (_ BitVec 32))) (Found!5170 (index!22908 (_ BitVec 32))) (Intermediate!5170 (undefined!5982 Bool) (index!22909 (_ BitVec 32)) (x!51975 (_ BitVec 32))) (Undefined!5170) (MissingVacant!5170 (index!22910 (_ BitVec 32))) )
))
(declare-fun lt!251890 () SeekEntryResult!5170)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554572 (= res!346887 (or (= lt!251890 (MissingZero!5170 i!1132)) (= lt!251890 (MissingVacant!5170 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34914 (_ BitVec 32)) SeekEntryResult!5170)

(assert (=> b!554572 (= lt!251890 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!554573 () Bool)

(declare-fun e!319799 () Bool)

(assert (=> b!554573 (= e!319799 (= (seekEntryOrOpen!0 (select (arr!16765 a!3118) j!142) a!3118 mask!3119) (Found!5170 j!142)))))

(declare-fun b!554574 () Bool)

(declare-fun res!346884 () Bool)

(assert (=> b!554574 (=> (not res!346884) (not e!319797))))

(assert (=> b!554574 (= res!346884 (and (= (size!17129 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17129 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17129 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554575 () Bool)

(declare-fun res!346883 () Bool)

(assert (=> b!554575 (=> (not res!346883) (not e!319800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34914 (_ BitVec 32)) Bool)

(assert (=> b!554575 (= res!346883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554576 () Bool)

(assert (=> b!554576 (= e!319800 (not true))))

(assert (=> b!554576 e!319799))

(declare-fun res!346879 () Bool)

(assert (=> b!554576 (=> (not res!346879) (not e!319799))))

(assert (=> b!554576 (= res!346879 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17185 0))(
  ( (Unit!17186) )
))
(declare-fun lt!251889 () Unit!17185)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17185)

(assert (=> b!554576 (= lt!251889 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554577 () Bool)

(declare-fun res!346888 () Bool)

(assert (=> b!554577 (=> (not res!346888) (not e!319800))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34914 (_ BitVec 32)) SeekEntryResult!5170)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554577 (= res!346888 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16765 a!3118) j!142) mask!3119) (select (arr!16765 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16765 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16765 a!3118) i!1132 k0!1914) j!142) (array!34915 (store (arr!16765 a!3118) i!1132 k0!1914) (size!17129 a!3118)) mask!3119)))))

(declare-fun b!554578 () Bool)

(declare-fun res!346881 () Bool)

(assert (=> b!554578 (=> (not res!346881) (not e!319797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554578 (= res!346881 (validKeyInArray!0 k0!1914))))

(declare-fun b!554579 () Bool)

(declare-fun res!346886 () Bool)

(assert (=> b!554579 (=> (not res!346886) (not e!319800))))

(declare-datatypes ((List!10752 0))(
  ( (Nil!10749) (Cons!10748 (h!11736 (_ BitVec 64)) (t!16972 List!10752)) )
))
(declare-fun arrayNoDuplicates!0 (array!34914 (_ BitVec 32) List!10752) Bool)

(assert (=> b!554579 (= res!346886 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10749))))

(declare-fun b!554580 () Bool)

(declare-fun res!346885 () Bool)

(assert (=> b!554580 (=> (not res!346885) (not e!319797))))

(assert (=> b!554580 (= res!346885 (validKeyInArray!0 (select (arr!16765 a!3118) j!142)))))

(declare-fun b!554581 () Bool)

(declare-fun res!346880 () Bool)

(assert (=> b!554581 (=> (not res!346880) (not e!319797))))

(declare-fun arrayContainsKey!0 (array!34914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554581 (= res!346880 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50742 res!346882) b!554574))

(assert (= (and b!554574 res!346884) b!554580))

(assert (= (and b!554580 res!346885) b!554578))

(assert (= (and b!554578 res!346881) b!554581))

(assert (= (and b!554581 res!346880) b!554572))

(assert (= (and b!554572 res!346887) b!554575))

(assert (= (and b!554575 res!346883) b!554579))

(assert (= (and b!554579 res!346886) b!554577))

(assert (= (and b!554577 res!346888) b!554576))

(assert (= (and b!554576 res!346879) b!554573))

(declare-fun m!531995 () Bool)

(assert (=> start!50742 m!531995))

(declare-fun m!531997 () Bool)

(assert (=> start!50742 m!531997))

(declare-fun m!531999 () Bool)

(assert (=> b!554577 m!531999))

(declare-fun m!532001 () Bool)

(assert (=> b!554577 m!532001))

(assert (=> b!554577 m!531999))

(declare-fun m!532003 () Bool)

(assert (=> b!554577 m!532003))

(declare-fun m!532005 () Bool)

(assert (=> b!554577 m!532005))

(assert (=> b!554577 m!532003))

(declare-fun m!532007 () Bool)

(assert (=> b!554577 m!532007))

(assert (=> b!554577 m!532001))

(assert (=> b!554577 m!531999))

(declare-fun m!532009 () Bool)

(assert (=> b!554577 m!532009))

(declare-fun m!532011 () Bool)

(assert (=> b!554577 m!532011))

(assert (=> b!554577 m!532003))

(assert (=> b!554577 m!532005))

(declare-fun m!532013 () Bool)

(assert (=> b!554572 m!532013))

(declare-fun m!532015 () Bool)

(assert (=> b!554576 m!532015))

(declare-fun m!532017 () Bool)

(assert (=> b!554576 m!532017))

(declare-fun m!532019 () Bool)

(assert (=> b!554575 m!532019))

(assert (=> b!554573 m!531999))

(assert (=> b!554573 m!531999))

(declare-fun m!532021 () Bool)

(assert (=> b!554573 m!532021))

(declare-fun m!532023 () Bool)

(assert (=> b!554581 m!532023))

(declare-fun m!532025 () Bool)

(assert (=> b!554578 m!532025))

(declare-fun m!532027 () Bool)

(assert (=> b!554579 m!532027))

(assert (=> b!554580 m!531999))

(assert (=> b!554580 m!531999))

(declare-fun m!532029 () Bool)

(assert (=> b!554580 m!532029))

(check-sat (not b!554581) (not b!554576) (not start!50742) (not b!554577) (not b!554575) (not b!554579) (not b!554572) (not b!554580) (not b!554573) (not b!554578))
(check-sat)
