; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50638 () Bool)

(assert start!50638)

(declare-fun b!553493 () Bool)

(declare-fun res!345905 () Bool)

(declare-fun e!319278 () Bool)

(assert (=> b!553493 (=> (not res!345905) (not e!319278))))

(declare-datatypes ((array!34863 0))(
  ( (array!34864 (arr!16741 (Array (_ BitVec 32) (_ BitVec 64))) (size!17105 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34863)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553493 (= res!345905 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553494 () Bool)

(declare-fun res!345911 () Bool)

(assert (=> b!553494 (=> (not res!345911) (not e!319278))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553494 (= res!345911 (and (= (size!17105 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17105 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17105 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553495 () Bool)

(declare-fun res!345908 () Bool)

(declare-fun e!319277 () Bool)

(assert (=> b!553495 (=> (not res!345908) (not e!319277))))

(declare-datatypes ((SeekEntryResult!5190 0))(
  ( (MissingZero!5190 (index!22987 (_ BitVec 32))) (Found!5190 (index!22988 (_ BitVec 32))) (Intermediate!5190 (undefined!6002 Bool) (index!22989 (_ BitVec 32)) (x!51912 (_ BitVec 32))) (Undefined!5190) (MissingVacant!5190 (index!22990 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34863 (_ BitVec 32)) SeekEntryResult!5190)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553495 (= res!345908 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16741 a!3118) j!142) mask!3119) (select (arr!16741 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16741 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16741 a!3118) i!1132 k0!1914) j!142) (array!34864 (store (arr!16741 a!3118) i!1132 k0!1914) (size!17105 a!3118)) mask!3119)))))

(declare-fun b!553497 () Bool)

(declare-fun res!345912 () Bool)

(assert (=> b!553497 (=> (not res!345912) (not e!319278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553497 (= res!345912 (validKeyInArray!0 (select (arr!16741 a!3118) j!142)))))

(declare-fun b!553498 () Bool)

(declare-fun res!345914 () Bool)

(assert (=> b!553498 (=> (not res!345914) (not e!319277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34863 (_ BitVec 32)) Bool)

(assert (=> b!553498 (= res!345914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553496 () Bool)

(declare-fun res!345910 () Bool)

(assert (=> b!553496 (=> (not res!345910) (not e!319277))))

(declare-datatypes ((List!10821 0))(
  ( (Nil!10818) (Cons!10817 (h!11802 (_ BitVec 64)) (t!17049 List!10821)) )
))
(declare-fun arrayNoDuplicates!0 (array!34863 (_ BitVec 32) List!10821) Bool)

(assert (=> b!553496 (= res!345910 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10818))))

(declare-fun res!345909 () Bool)

(assert (=> start!50638 (=> (not res!345909) (not e!319278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50638 (= res!345909 (validMask!0 mask!3119))))

(assert (=> start!50638 e!319278))

(assert (=> start!50638 true))

(declare-fun array_inv!12537 (array!34863) Bool)

(assert (=> start!50638 (array_inv!12537 a!3118)))

(declare-fun b!553499 () Bool)

(assert (=> b!553499 (= e!319277 (not true))))

(declare-fun e!319275 () Bool)

(assert (=> b!553499 e!319275))

(declare-fun res!345913 () Bool)

(assert (=> b!553499 (=> (not res!345913) (not e!319275))))

(assert (=> b!553499 (= res!345913 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17154 0))(
  ( (Unit!17155) )
))
(declare-fun lt!251497 () Unit!17154)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34863 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17154)

(assert (=> b!553499 (= lt!251497 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553500 () Bool)

(assert (=> b!553500 (= e!319278 e!319277)))

(declare-fun res!345906 () Bool)

(assert (=> b!553500 (=> (not res!345906) (not e!319277))))

(declare-fun lt!251496 () SeekEntryResult!5190)

(assert (=> b!553500 (= res!345906 (or (= lt!251496 (MissingZero!5190 i!1132)) (= lt!251496 (MissingVacant!5190 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34863 (_ BitVec 32)) SeekEntryResult!5190)

(assert (=> b!553500 (= lt!251496 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553501 () Bool)

(declare-fun res!345907 () Bool)

(assert (=> b!553501 (=> (not res!345907) (not e!319278))))

(assert (=> b!553501 (= res!345907 (validKeyInArray!0 k0!1914))))

(declare-fun b!553502 () Bool)

(assert (=> b!553502 (= e!319275 (= (seekEntryOrOpen!0 (select (arr!16741 a!3118) j!142) a!3118 mask!3119) (Found!5190 j!142)))))

(assert (= (and start!50638 res!345909) b!553494))

(assert (= (and b!553494 res!345911) b!553497))

(assert (= (and b!553497 res!345912) b!553501))

(assert (= (and b!553501 res!345907) b!553493))

(assert (= (and b!553493 res!345905) b!553500))

(assert (= (and b!553500 res!345906) b!553498))

(assert (= (and b!553498 res!345914) b!553496))

(assert (= (and b!553496 res!345910) b!553495))

(assert (= (and b!553495 res!345908) b!553499))

(assert (= (and b!553499 res!345913) b!553502))

(declare-fun m!530583 () Bool)

(assert (=> b!553499 m!530583))

(declare-fun m!530585 () Bool)

(assert (=> b!553499 m!530585))

(declare-fun m!530587 () Bool)

(assert (=> b!553501 m!530587))

(declare-fun m!530589 () Bool)

(assert (=> start!50638 m!530589))

(declare-fun m!530591 () Bool)

(assert (=> start!50638 m!530591))

(declare-fun m!530593 () Bool)

(assert (=> b!553498 m!530593))

(declare-fun m!530595 () Bool)

(assert (=> b!553496 m!530595))

(declare-fun m!530597 () Bool)

(assert (=> b!553495 m!530597))

(declare-fun m!530599 () Bool)

(assert (=> b!553495 m!530599))

(assert (=> b!553495 m!530597))

(declare-fun m!530601 () Bool)

(assert (=> b!553495 m!530601))

(declare-fun m!530603 () Bool)

(assert (=> b!553495 m!530603))

(assert (=> b!553495 m!530601))

(declare-fun m!530605 () Bool)

(assert (=> b!553495 m!530605))

(assert (=> b!553495 m!530599))

(assert (=> b!553495 m!530597))

(declare-fun m!530607 () Bool)

(assert (=> b!553495 m!530607))

(declare-fun m!530609 () Bool)

(assert (=> b!553495 m!530609))

(assert (=> b!553495 m!530601))

(assert (=> b!553495 m!530603))

(assert (=> b!553502 m!530597))

(assert (=> b!553502 m!530597))

(declare-fun m!530611 () Bool)

(assert (=> b!553502 m!530611))

(declare-fun m!530613 () Bool)

(assert (=> b!553493 m!530613))

(declare-fun m!530615 () Bool)

(assert (=> b!553500 m!530615))

(assert (=> b!553497 m!530597))

(assert (=> b!553497 m!530597))

(declare-fun m!530617 () Bool)

(assert (=> b!553497 m!530617))

(check-sat (not b!553499) (not b!553493) (not b!553496) (not b!553500) (not b!553501) (not b!553502) (not b!553498) (not start!50638) (not b!553495) (not b!553497))
(check-sat)
