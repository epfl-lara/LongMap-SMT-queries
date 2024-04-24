; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51768 () Bool)

(assert start!51768)

(declare-fun b!566023 () Bool)

(declare-fun res!356890 () Bool)

(declare-fun e!325845 () Bool)

(assert (=> b!566023 (=> (not res!356890) (not e!325845))))

(declare-datatypes ((array!35523 0))(
  ( (array!35524 (arr!17059 (Array (_ BitVec 32) (_ BitVec 64))) (size!17423 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35523)

(declare-datatypes ((List!11046 0))(
  ( (Nil!11043) (Cons!11042 (h!12051 (_ BitVec 64)) (t!17266 List!11046)) )
))
(declare-fun arrayNoDuplicates!0 (array!35523 (_ BitVec 32) List!11046) Bool)

(assert (=> b!566023 (= res!356890 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11043))))

(declare-fun b!566024 () Bool)

(declare-fun res!356889 () Bool)

(declare-fun e!325842 () Bool)

(assert (=> b!566024 (=> (not res!356889) (not e!325842))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566024 (= res!356889 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!356888 () Bool)

(assert (=> start!51768 (=> (not res!356888) (not e!325842))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51768 (= res!356888 (validMask!0 mask!3119))))

(assert (=> start!51768 e!325842))

(assert (=> start!51768 true))

(declare-fun array_inv!12918 (array!35523) Bool)

(assert (=> start!51768 (array_inv!12918 a!3118)))

(declare-fun b!566025 () Bool)

(declare-fun res!356892 () Bool)

(assert (=> b!566025 (=> (not res!356892) (not e!325845))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5464 0))(
  ( (MissingZero!5464 (index!24083 (_ BitVec 32))) (Found!5464 (index!24084 (_ BitVec 32))) (Intermediate!5464 (undefined!6276 Bool) (index!24085 (_ BitVec 32)) (x!53104 (_ BitVec 32))) (Undefined!5464) (MissingVacant!5464 (index!24086 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35523 (_ BitVec 32)) SeekEntryResult!5464)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566025 (= res!356892 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17059 a!3118) j!142) mask!3119) (select (arr!17059 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17059 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17059 a!3118) i!1132 k0!1914) j!142) (array!35524 (store (arr!17059 a!3118) i!1132 k0!1914) (size!17423 a!3118)) mask!3119)))))

(declare-fun e!325844 () Bool)

(declare-fun b!566026 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35523 (_ BitVec 32)) SeekEntryResult!5464)

(assert (=> b!566026 (= e!325844 (= (seekEntryOrOpen!0 (select (arr!17059 a!3118) j!142) a!3118 mask!3119) (Found!5464 j!142)))))

(declare-fun b!566027 () Bool)

(declare-fun res!356893 () Bool)

(assert (=> b!566027 (=> (not res!356893) (not e!325842))))

(assert (=> b!566027 (= res!356893 (and (= (size!17423 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17423 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17423 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566028 () Bool)

(declare-fun res!356894 () Bool)

(assert (=> b!566028 (=> (not res!356894) (not e!325842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566028 (= res!356894 (validKeyInArray!0 k0!1914))))

(declare-fun b!566029 () Bool)

(declare-fun res!356896 () Bool)

(assert (=> b!566029 (=> (not res!356896) (not e!325842))))

(assert (=> b!566029 (= res!356896 (validKeyInArray!0 (select (arr!17059 a!3118) j!142)))))

(declare-fun b!566030 () Bool)

(assert (=> b!566030 (= e!325842 e!325845)))

(declare-fun res!356891 () Bool)

(assert (=> b!566030 (=> (not res!356891) (not e!325845))))

(declare-fun lt!258075 () SeekEntryResult!5464)

(assert (=> b!566030 (= res!356891 (or (= lt!258075 (MissingZero!5464 i!1132)) (= lt!258075 (MissingVacant!5464 i!1132))))))

(assert (=> b!566030 (= lt!258075 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!566031 () Bool)

(assert (=> b!566031 (= e!325845 (not true))))

(assert (=> b!566031 e!325844))

(declare-fun res!356887 () Bool)

(assert (=> b!566031 (=> (not res!356887) (not e!325844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35523 (_ BitVec 32)) Bool)

(assert (=> b!566031 (= res!356887 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17701 0))(
  ( (Unit!17702) )
))
(declare-fun lt!258076 () Unit!17701)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17701)

(assert (=> b!566031 (= lt!258076 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566032 () Bool)

(declare-fun res!356895 () Bool)

(assert (=> b!566032 (=> (not res!356895) (not e!325845))))

(assert (=> b!566032 (= res!356895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51768 res!356888) b!566027))

(assert (= (and b!566027 res!356893) b!566029))

(assert (= (and b!566029 res!356896) b!566028))

(assert (= (and b!566028 res!356894) b!566024))

(assert (= (and b!566024 res!356889) b!566030))

(assert (= (and b!566030 res!356891) b!566032))

(assert (= (and b!566032 res!356895) b!566023))

(assert (= (and b!566023 res!356890) b!566025))

(assert (= (and b!566025 res!356892) b!566031))

(assert (= (and b!566031 res!356887) b!566026))

(declare-fun m!544697 () Bool)

(assert (=> b!566028 m!544697))

(declare-fun m!544699 () Bool)

(assert (=> b!566023 m!544699))

(declare-fun m!544701 () Bool)

(assert (=> start!51768 m!544701))

(declare-fun m!544703 () Bool)

(assert (=> start!51768 m!544703))

(declare-fun m!544705 () Bool)

(assert (=> b!566030 m!544705))

(declare-fun m!544707 () Bool)

(assert (=> b!566031 m!544707))

(declare-fun m!544709 () Bool)

(assert (=> b!566031 m!544709))

(declare-fun m!544711 () Bool)

(assert (=> b!566029 m!544711))

(assert (=> b!566029 m!544711))

(declare-fun m!544713 () Bool)

(assert (=> b!566029 m!544713))

(assert (=> b!566026 m!544711))

(assert (=> b!566026 m!544711))

(declare-fun m!544715 () Bool)

(assert (=> b!566026 m!544715))

(declare-fun m!544717 () Bool)

(assert (=> b!566024 m!544717))

(assert (=> b!566025 m!544711))

(declare-fun m!544719 () Bool)

(assert (=> b!566025 m!544719))

(assert (=> b!566025 m!544711))

(declare-fun m!544721 () Bool)

(assert (=> b!566025 m!544721))

(declare-fun m!544723 () Bool)

(assert (=> b!566025 m!544723))

(assert (=> b!566025 m!544721))

(declare-fun m!544725 () Bool)

(assert (=> b!566025 m!544725))

(assert (=> b!566025 m!544719))

(assert (=> b!566025 m!544711))

(declare-fun m!544727 () Bool)

(assert (=> b!566025 m!544727))

(declare-fun m!544729 () Bool)

(assert (=> b!566025 m!544729))

(assert (=> b!566025 m!544721))

(assert (=> b!566025 m!544723))

(declare-fun m!544731 () Bool)

(assert (=> b!566032 m!544731))

(check-sat (not b!566030) (not b!566025) (not b!566023) (not b!566028) (not b!566026) (not b!566032) (not b!566029) (not b!566031) (not b!566024) (not start!51768))
(check-sat)
