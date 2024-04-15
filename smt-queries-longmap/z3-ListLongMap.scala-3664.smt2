; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50588 () Bool)

(assert start!50588)

(declare-fun b!552643 () Bool)

(declare-fun res!345206 () Bool)

(declare-fun e!318848 () Bool)

(assert (=> b!552643 (=> (not res!345206) (not e!318848))))

(declare-datatypes ((array!34822 0))(
  ( (array!34823 (arr!16721 (Array (_ BitVec 32) (_ BitVec 64))) (size!17086 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34822)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34822 (_ BitVec 32)) Bool)

(assert (=> b!552643 (= res!345206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552644 () Bool)

(declare-fun res!345203 () Bool)

(assert (=> b!552644 (=> (not res!345203) (not e!318848))))

(declare-datatypes ((List!10840 0))(
  ( (Nil!10837) (Cons!10836 (h!11821 (_ BitVec 64)) (t!17059 List!10840)) )
))
(declare-fun arrayNoDuplicates!0 (array!34822 (_ BitVec 32) List!10840) Bool)

(assert (=> b!552644 (= res!345203 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10837))))

(declare-fun res!345197 () Bool)

(declare-fun e!318846 () Bool)

(assert (=> start!50588 (=> (not res!345197) (not e!318846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50588 (= res!345197 (validMask!0 mask!3119))))

(assert (=> start!50588 e!318846))

(assert (=> start!50588 true))

(declare-fun array_inv!12604 (array!34822) Bool)

(assert (=> start!50588 (array_inv!12604 a!3118)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!318847 () Bool)

(declare-fun b!552645 () Bool)

(declare-datatypes ((SeekEntryResult!5167 0))(
  ( (MissingZero!5167 (index!22895 (_ BitVec 32))) (Found!5167 (index!22896 (_ BitVec 32))) (Intermediate!5167 (undefined!5979 Bool) (index!22897 (_ BitVec 32)) (x!51836 (_ BitVec 32))) (Undefined!5167) (MissingVacant!5167 (index!22898 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34822 (_ BitVec 32)) SeekEntryResult!5167)

(assert (=> b!552645 (= e!318847 (= (seekEntryOrOpen!0 (select (arr!16721 a!3118) j!142) a!3118 mask!3119) (Found!5167 j!142)))))

(declare-fun b!552646 () Bool)

(assert (=> b!552646 (= e!318846 e!318848)))

(declare-fun res!345199 () Bool)

(assert (=> b!552646 (=> (not res!345199) (not e!318848))))

(declare-fun lt!251095 () SeekEntryResult!5167)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552646 (= res!345199 (or (= lt!251095 (MissingZero!5167 i!1132)) (= lt!251095 (MissingVacant!5167 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!552646 (= lt!251095 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552647 () Bool)

(declare-fun res!345200 () Bool)

(assert (=> b!552647 (=> (not res!345200) (not e!318846))))

(assert (=> b!552647 (= res!345200 (and (= (size!17086 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17086 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17086 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552648 () Bool)

(assert (=> b!552648 (= e!318848 (not true))))

(assert (=> b!552648 e!318847))

(declare-fun res!345205 () Bool)

(assert (=> b!552648 (=> (not res!345205) (not e!318847))))

(assert (=> b!552648 (= res!345205 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17094 0))(
  ( (Unit!17095) )
))
(declare-fun lt!251094 () Unit!17094)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34822 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17094)

(assert (=> b!552648 (= lt!251094 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552649 () Bool)

(declare-fun res!345202 () Bool)

(assert (=> b!552649 (=> (not res!345202) (not e!318846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552649 (= res!345202 (validKeyInArray!0 (select (arr!16721 a!3118) j!142)))))

(declare-fun b!552650 () Bool)

(declare-fun res!345201 () Bool)

(assert (=> b!552650 (=> (not res!345201) (not e!318848))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34822 (_ BitVec 32)) SeekEntryResult!5167)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552650 (= res!345201 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16721 a!3118) j!142) mask!3119) (select (arr!16721 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16721 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16721 a!3118) i!1132 k0!1914) j!142) (array!34823 (store (arr!16721 a!3118) i!1132 k0!1914) (size!17086 a!3118)) mask!3119)))))

(declare-fun b!552651 () Bool)

(declare-fun res!345198 () Bool)

(assert (=> b!552651 (=> (not res!345198) (not e!318846))))

(declare-fun arrayContainsKey!0 (array!34822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552651 (= res!345198 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552652 () Bool)

(declare-fun res!345204 () Bool)

(assert (=> b!552652 (=> (not res!345204) (not e!318846))))

(assert (=> b!552652 (= res!345204 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50588 res!345197) b!552647))

(assert (= (and b!552647 res!345200) b!552649))

(assert (= (and b!552649 res!345202) b!552652))

(assert (= (and b!552652 res!345204) b!552651))

(assert (= (and b!552651 res!345198) b!552646))

(assert (= (and b!552646 res!345199) b!552643))

(assert (= (and b!552643 res!345206) b!552644))

(assert (= (and b!552644 res!345203) b!552650))

(assert (= (and b!552650 res!345201) b!552648))

(assert (= (and b!552648 res!345205) b!552645))

(declare-fun m!529121 () Bool)

(assert (=> b!552651 m!529121))

(declare-fun m!529123 () Bool)

(assert (=> b!552644 m!529123))

(declare-fun m!529125 () Bool)

(assert (=> b!552648 m!529125))

(declare-fun m!529127 () Bool)

(assert (=> b!552648 m!529127))

(declare-fun m!529129 () Bool)

(assert (=> b!552645 m!529129))

(assert (=> b!552645 m!529129))

(declare-fun m!529131 () Bool)

(assert (=> b!552645 m!529131))

(declare-fun m!529133 () Bool)

(assert (=> b!552643 m!529133))

(declare-fun m!529135 () Bool)

(assert (=> start!50588 m!529135))

(declare-fun m!529137 () Bool)

(assert (=> start!50588 m!529137))

(declare-fun m!529139 () Bool)

(assert (=> b!552652 m!529139))

(declare-fun m!529141 () Bool)

(assert (=> b!552646 m!529141))

(assert (=> b!552649 m!529129))

(assert (=> b!552649 m!529129))

(declare-fun m!529143 () Bool)

(assert (=> b!552649 m!529143))

(assert (=> b!552650 m!529129))

(declare-fun m!529145 () Bool)

(assert (=> b!552650 m!529145))

(assert (=> b!552650 m!529129))

(declare-fun m!529147 () Bool)

(assert (=> b!552650 m!529147))

(declare-fun m!529149 () Bool)

(assert (=> b!552650 m!529149))

(assert (=> b!552650 m!529147))

(declare-fun m!529151 () Bool)

(assert (=> b!552650 m!529151))

(assert (=> b!552650 m!529145))

(assert (=> b!552650 m!529129))

(declare-fun m!529153 () Bool)

(assert (=> b!552650 m!529153))

(declare-fun m!529155 () Bool)

(assert (=> b!552650 m!529155))

(assert (=> b!552650 m!529147))

(assert (=> b!552650 m!529149))

(check-sat (not b!552643) (not b!552650) (not b!552651) (not b!552644) (not b!552646) (not start!50588) (not b!552648) (not b!552652) (not b!552645) (not b!552649))
(check-sat)
