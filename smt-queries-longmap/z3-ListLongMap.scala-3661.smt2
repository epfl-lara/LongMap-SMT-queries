; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50584 () Bool)

(assert start!50584)

(declare-fun b!552670 () Bool)

(declare-fun res!345083 () Bool)

(declare-fun e!318907 () Bool)

(assert (=> b!552670 (=> (not res!345083) (not e!318907))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552670 (= res!345083 (validKeyInArray!0 k0!1914))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!318909 () Bool)

(declare-fun b!552671 () Bool)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34809 0))(
  ( (array!34810 (arr!16714 (Array (_ BitVec 32) (_ BitVec 64))) (size!17078 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34809)

(assert (=> b!552671 (= e!318909 (validKeyInArray!0 (select (store (arr!16714 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun b!552672 () Bool)

(declare-fun res!345086 () Bool)

(declare-fun e!318908 () Bool)

(assert (=> b!552672 (=> (not res!345086) (not e!318908))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34809 (_ BitVec 32)) Bool)

(assert (=> b!552672 (= res!345086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552673 () Bool)

(declare-fun e!318911 () Bool)

(declare-datatypes ((SeekEntryResult!5163 0))(
  ( (MissingZero!5163 (index!22879 (_ BitVec 32))) (Found!5163 (index!22880 (_ BitVec 32))) (Intermediate!5163 (undefined!5975 Bool) (index!22881 (_ BitVec 32)) (x!51813 (_ BitVec 32))) (Undefined!5163) (MissingVacant!5163 (index!22882 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34809 (_ BitVec 32)) SeekEntryResult!5163)

(assert (=> b!552673 (= e!318911 (= (seekEntryOrOpen!0 (select (arr!16714 a!3118) j!142) a!3118 mask!3119) (Found!5163 j!142)))))

(declare-fun b!552674 () Bool)

(declare-fun e!318912 () Bool)

(assert (=> b!552674 (= e!318912 (not e!318909))))

(declare-fun res!345085 () Bool)

(assert (=> b!552674 (=> res!345085 e!318909)))

(declare-fun lt!251246 () (_ BitVec 32))

(assert (=> b!552674 (= res!345085 (or (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt lt!251246 #b00000000000000000000000000000000) (bvsge lt!251246 (bvadd #b00000000000000000000000000000001 mask!3119))))))

(assert (=> b!552674 e!318911))

(declare-fun res!345082 () Bool)

(assert (=> b!552674 (=> (not res!345082) (not e!318911))))

(assert (=> b!552674 (= res!345082 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17100 0))(
  ( (Unit!17101) )
))
(declare-fun lt!251247 () Unit!17100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17100)

(assert (=> b!552674 (= lt!251247 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!345084 () Bool)

(assert (=> start!50584 (=> (not res!345084) (not e!318907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50584 (= res!345084 (validMask!0 mask!3119))))

(assert (=> start!50584 e!318907))

(assert (=> start!50584 true))

(declare-fun array_inv!12510 (array!34809) Bool)

(assert (=> start!50584 (array_inv!12510 a!3118)))

(declare-fun b!552675 () Bool)

(declare-fun res!345089 () Bool)

(assert (=> b!552675 (=> (not res!345089) (not e!318907))))

(assert (=> b!552675 (= res!345089 (and (= (size!17078 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17078 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17078 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552676 () Bool)

(declare-fun res!345087 () Bool)

(assert (=> b!552676 (=> (not res!345087) (not e!318907))))

(assert (=> b!552676 (= res!345087 (validKeyInArray!0 (select (arr!16714 a!3118) j!142)))))

(declare-fun b!552677 () Bool)

(declare-fun res!345092 () Bool)

(assert (=> b!552677 (=> (not res!345092) (not e!318907))))

(declare-fun arrayContainsKey!0 (array!34809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552677 (= res!345092 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552678 () Bool)

(assert (=> b!552678 (= e!318908 e!318912)))

(declare-fun res!345088 () Bool)

(assert (=> b!552678 (=> (not res!345088) (not e!318912))))

(declare-fun lt!251248 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34809 (_ BitVec 32)) SeekEntryResult!5163)

(assert (=> b!552678 (= res!345088 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251248 (select (arr!16714 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251246 (select (store (arr!16714 a!3118) i!1132 k0!1914) j!142) (array!34810 (store (arr!16714 a!3118) i!1132 k0!1914) (size!17078 a!3118)) mask!3119)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552678 (= lt!251246 (toIndex!0 (select (store (arr!16714 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!552678 (= lt!251248 (toIndex!0 (select (arr!16714 a!3118) j!142) mask!3119))))

(declare-fun b!552679 () Bool)

(assert (=> b!552679 (= e!318907 e!318908)))

(declare-fun res!345090 () Bool)

(assert (=> b!552679 (=> (not res!345090) (not e!318908))))

(declare-fun lt!251245 () SeekEntryResult!5163)

(assert (=> b!552679 (= res!345090 (or (= lt!251245 (MissingZero!5163 i!1132)) (= lt!251245 (MissingVacant!5163 i!1132))))))

(assert (=> b!552679 (= lt!251245 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552680 () Bool)

(declare-fun res!345091 () Bool)

(assert (=> b!552680 (=> (not res!345091) (not e!318908))))

(declare-datatypes ((List!10794 0))(
  ( (Nil!10791) (Cons!10790 (h!11775 (_ BitVec 64)) (t!17022 List!10794)) )
))
(declare-fun arrayNoDuplicates!0 (array!34809 (_ BitVec 32) List!10794) Bool)

(assert (=> b!552680 (= res!345091 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10791))))

(assert (= (and start!50584 res!345084) b!552675))

(assert (= (and b!552675 res!345089) b!552676))

(assert (= (and b!552676 res!345087) b!552670))

(assert (= (and b!552670 res!345083) b!552677))

(assert (= (and b!552677 res!345092) b!552679))

(assert (= (and b!552679 res!345090) b!552672))

(assert (= (and b!552672 res!345086) b!552680))

(assert (= (and b!552680 res!345091) b!552678))

(assert (= (and b!552678 res!345088) b!552674))

(assert (= (and b!552674 res!345082) b!552673))

(assert (= (and b!552674 (not res!345085)) b!552671))

(declare-fun m!529601 () Bool)

(assert (=> b!552678 m!529601))

(declare-fun m!529603 () Bool)

(assert (=> b!552678 m!529603))

(declare-fun m!529605 () Bool)

(assert (=> b!552678 m!529605))

(declare-fun m!529607 () Bool)

(assert (=> b!552678 m!529607))

(assert (=> b!552678 m!529605))

(assert (=> b!552678 m!529601))

(declare-fun m!529609 () Bool)

(assert (=> b!552678 m!529609))

(assert (=> b!552678 m!529605))

(declare-fun m!529611 () Bool)

(assert (=> b!552678 m!529611))

(assert (=> b!552678 m!529601))

(declare-fun m!529613 () Bool)

(assert (=> b!552678 m!529613))

(declare-fun m!529615 () Bool)

(assert (=> b!552680 m!529615))

(assert (=> b!552671 m!529609))

(assert (=> b!552671 m!529601))

(assert (=> b!552671 m!529601))

(declare-fun m!529617 () Bool)

(assert (=> b!552671 m!529617))

(declare-fun m!529619 () Bool)

(assert (=> b!552672 m!529619))

(declare-fun m!529621 () Bool)

(assert (=> b!552679 m!529621))

(declare-fun m!529623 () Bool)

(assert (=> b!552670 m!529623))

(assert (=> b!552673 m!529605))

(assert (=> b!552673 m!529605))

(declare-fun m!529625 () Bool)

(assert (=> b!552673 m!529625))

(declare-fun m!529627 () Bool)

(assert (=> b!552677 m!529627))

(assert (=> b!552676 m!529605))

(assert (=> b!552676 m!529605))

(declare-fun m!529629 () Bool)

(assert (=> b!552676 m!529629))

(declare-fun m!529631 () Bool)

(assert (=> b!552674 m!529631))

(declare-fun m!529633 () Bool)

(assert (=> b!552674 m!529633))

(declare-fun m!529635 () Bool)

(assert (=> start!50584 m!529635))

(declare-fun m!529637 () Bool)

(assert (=> start!50584 m!529637))

(check-sat (not b!552676) (not b!552678) (not b!552672) (not start!50584) (not b!552670) (not b!552677) (not b!552680) (not b!552674) (not b!552671) (not b!552673) (not b!552679))
(check-sat)
