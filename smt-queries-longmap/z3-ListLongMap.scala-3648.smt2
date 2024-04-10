; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50326 () Bool)

(assert start!50326)

(declare-fun b!550622 () Bool)

(declare-fun res!343590 () Bool)

(declare-fun e!317855 () Bool)

(assert (=> b!550622 (=> (not res!343590) (not e!317855))))

(declare-datatypes ((array!34722 0))(
  ( (array!34723 (arr!16675 (Array (_ BitVec 32) (_ BitVec 64))) (size!17039 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34722)

(declare-datatypes ((List!10755 0))(
  ( (Nil!10752) (Cons!10751 (h!11727 (_ BitVec 64)) (t!16983 List!10755)) )
))
(declare-fun arrayNoDuplicates!0 (array!34722 (_ BitVec 32) List!10755) Bool)

(assert (=> b!550622 (= res!343590 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10752))))

(declare-fun b!550623 () Bool)

(declare-fun res!343584 () Bool)

(declare-fun e!317856 () Bool)

(assert (=> b!550623 (=> (not res!343584) (not e!317856))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550623 (= res!343584 (validKeyInArray!0 (select (arr!16675 a!3118) j!142)))))

(declare-fun b!550624 () Bool)

(assert (=> b!550624 (= e!317855 (not true))))

(declare-fun e!317854 () Bool)

(assert (=> b!550624 e!317854))

(declare-fun res!343586 () Bool)

(assert (=> b!550624 (=> (not res!343586) (not e!317854))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34722 (_ BitVec 32)) Bool)

(assert (=> b!550624 (= res!343586 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17022 0))(
  ( (Unit!17023) )
))
(declare-fun lt!250587 () Unit!17022)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17022)

(assert (=> b!550624 (= lt!250587 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550625 () Bool)

(declare-fun res!343589 () Bool)

(assert (=> b!550625 (=> (not res!343589) (not e!317856))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550625 (= res!343589 (and (= (size!17039 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17039 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17039 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550626 () Bool)

(declare-fun res!343583 () Bool)

(assert (=> b!550626 (=> (not res!343583) (not e!317856))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550626 (= res!343583 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550627 () Bool)

(declare-fun res!343585 () Bool)

(assert (=> b!550627 (=> (not res!343585) (not e!317855))))

(assert (=> b!550627 (= res!343585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550628 () Bool)

(declare-fun res!343587 () Bool)

(assert (=> b!550628 (=> (not res!343587) (not e!317856))))

(assert (=> b!550628 (= res!343587 (validKeyInArray!0 k0!1914))))

(declare-fun b!550629 () Bool)

(assert (=> b!550629 (= e!317856 e!317855)))

(declare-fun res!343588 () Bool)

(assert (=> b!550629 (=> (not res!343588) (not e!317855))))

(declare-datatypes ((SeekEntryResult!5124 0))(
  ( (MissingZero!5124 (index!22723 (_ BitVec 32))) (Found!5124 (index!22724 (_ BitVec 32))) (Intermediate!5124 (undefined!5936 Bool) (index!22725 (_ BitVec 32)) (x!51652 (_ BitVec 32))) (Undefined!5124) (MissingVacant!5124 (index!22726 (_ BitVec 32))) )
))
(declare-fun lt!250588 () SeekEntryResult!5124)

(assert (=> b!550629 (= res!343588 (or (= lt!250588 (MissingZero!5124 i!1132)) (= lt!250588 (MissingVacant!5124 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34722 (_ BitVec 32)) SeekEntryResult!5124)

(assert (=> b!550629 (= lt!250588 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!550630 () Bool)

(assert (=> b!550630 (= e!317854 (= (seekEntryOrOpen!0 (select (arr!16675 a!3118) j!142) a!3118 mask!3119) (Found!5124 j!142)))))

(declare-fun res!343591 () Bool)

(assert (=> start!50326 (=> (not res!343591) (not e!317856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50326 (= res!343591 (validMask!0 mask!3119))))

(assert (=> start!50326 e!317856))

(assert (=> start!50326 true))

(declare-fun array_inv!12471 (array!34722) Bool)

(assert (=> start!50326 (array_inv!12471 a!3118)))

(declare-fun b!550631 () Bool)

(declare-fun res!343592 () Bool)

(assert (=> b!550631 (=> (not res!343592) (not e!317855))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34722 (_ BitVec 32)) SeekEntryResult!5124)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550631 (= res!343592 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16675 a!3118) j!142) mask!3119) (select (arr!16675 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16675 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16675 a!3118) i!1132 k0!1914) j!142) (array!34723 (store (arr!16675 a!3118) i!1132 k0!1914) (size!17039 a!3118)) mask!3119)))))

(assert (= (and start!50326 res!343591) b!550625))

(assert (= (and b!550625 res!343589) b!550623))

(assert (= (and b!550623 res!343584) b!550628))

(assert (= (and b!550628 res!343587) b!550626))

(assert (= (and b!550626 res!343583) b!550629))

(assert (= (and b!550629 res!343588) b!550627))

(assert (= (and b!550627 res!343585) b!550622))

(assert (= (and b!550622 res!343590) b!550631))

(assert (= (and b!550631 res!343592) b!550624))

(assert (= (and b!550624 res!343586) b!550630))

(declare-fun m!527589 () Bool)

(assert (=> b!550626 m!527589))

(declare-fun m!527591 () Bool)

(assert (=> b!550622 m!527591))

(declare-fun m!527593 () Bool)

(assert (=> b!550629 m!527593))

(declare-fun m!527595 () Bool)

(assert (=> b!550630 m!527595))

(assert (=> b!550630 m!527595))

(declare-fun m!527597 () Bool)

(assert (=> b!550630 m!527597))

(declare-fun m!527599 () Bool)

(assert (=> b!550627 m!527599))

(declare-fun m!527601 () Bool)

(assert (=> start!50326 m!527601))

(declare-fun m!527603 () Bool)

(assert (=> start!50326 m!527603))

(assert (=> b!550631 m!527595))

(declare-fun m!527605 () Bool)

(assert (=> b!550631 m!527605))

(assert (=> b!550631 m!527595))

(declare-fun m!527607 () Bool)

(assert (=> b!550631 m!527607))

(declare-fun m!527609 () Bool)

(assert (=> b!550631 m!527609))

(assert (=> b!550631 m!527607))

(declare-fun m!527611 () Bool)

(assert (=> b!550631 m!527611))

(assert (=> b!550631 m!527605))

(assert (=> b!550631 m!527595))

(declare-fun m!527613 () Bool)

(assert (=> b!550631 m!527613))

(declare-fun m!527615 () Bool)

(assert (=> b!550631 m!527615))

(assert (=> b!550631 m!527607))

(assert (=> b!550631 m!527609))

(declare-fun m!527617 () Bool)

(assert (=> b!550628 m!527617))

(declare-fun m!527619 () Bool)

(assert (=> b!550624 m!527619))

(declare-fun m!527621 () Bool)

(assert (=> b!550624 m!527621))

(assert (=> b!550623 m!527595))

(assert (=> b!550623 m!527595))

(declare-fun m!527623 () Bool)

(assert (=> b!550623 m!527623))

(check-sat (not b!550622) (not start!50326) (not b!550627) (not b!550623) (not b!550628) (not b!550626) (not b!550631) (not b!550629) (not b!550624) (not b!550630))
(check-sat)
