; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50466 () Bool)

(assert start!50466)

(declare-fun b!551623 () Bool)

(declare-fun res!344296 () Bool)

(declare-fun e!318381 () Bool)

(assert (=> b!551623 (=> (not res!344296) (not e!318381))))

(declare-datatypes ((array!34752 0))(
  ( (array!34753 (arr!16687 (Array (_ BitVec 32) (_ BitVec 64))) (size!17051 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34752)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34752 (_ BitVec 32)) Bool)

(assert (=> b!551623 (= res!344296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551624 () Bool)

(declare-fun res!344305 () Bool)

(declare-fun e!318384 () Bool)

(assert (=> b!551624 (=> (not res!344305) (not e!318384))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551624 (= res!344305 (validKeyInArray!0 k0!1914))))

(declare-fun res!344299 () Bool)

(assert (=> start!50466 (=> (not res!344299) (not e!318384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50466 (= res!344299 (validMask!0 mask!3119))))

(assert (=> start!50466 e!318384))

(assert (=> start!50466 true))

(declare-fun array_inv!12546 (array!34752) Bool)

(assert (=> start!50466 (array_inv!12546 a!3118)))

(declare-fun b!551625 () Bool)

(declare-fun res!344297 () Bool)

(assert (=> b!551625 (=> (not res!344297) (not e!318381))))

(declare-datatypes ((List!10674 0))(
  ( (Nil!10671) (Cons!10670 (h!11652 (_ BitVec 64)) (t!16894 List!10674)) )
))
(declare-fun arrayNoDuplicates!0 (array!34752 (_ BitVec 32) List!10674) Bool)

(assert (=> b!551625 (= res!344297 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10671))))

(declare-fun b!551626 () Bool)

(declare-fun res!344298 () Bool)

(assert (=> b!551626 (=> (not res!344298) (not e!318381))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5092 0))(
  ( (MissingZero!5092 (index!22595 (_ BitVec 32))) (Found!5092 (index!22596 (_ BitVec 32))) (Intermediate!5092 (undefined!5904 Bool) (index!22597 (_ BitVec 32)) (x!51677 (_ BitVec 32))) (Undefined!5092) (MissingVacant!5092 (index!22598 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34752 (_ BitVec 32)) SeekEntryResult!5092)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551626 (= res!344298 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16687 a!3118) j!142) mask!3119) (select (arr!16687 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16687 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16687 a!3118) i!1132 k0!1914) j!142) (array!34753 (store (arr!16687 a!3118) i!1132 k0!1914) (size!17051 a!3118)) mask!3119)))))

(declare-fun b!551627 () Bool)

(declare-fun res!344302 () Bool)

(assert (=> b!551627 (=> (not res!344302) (not e!318384))))

(assert (=> b!551627 (= res!344302 (validKeyInArray!0 (select (arr!16687 a!3118) j!142)))))

(declare-fun b!551628 () Bool)

(declare-fun res!344303 () Bool)

(assert (=> b!551628 (=> (not res!344303) (not e!318384))))

(assert (=> b!551628 (= res!344303 (and (= (size!17051 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17051 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17051 a!3118)) (not (= i!1132 j!142))))))

(declare-fun e!318382 () Bool)

(declare-fun b!551629 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34752 (_ BitVec 32)) SeekEntryResult!5092)

(assert (=> b!551629 (= e!318382 (= (seekEntryOrOpen!0 (select (arr!16687 a!3118) j!142) a!3118 mask!3119) (Found!5092 j!142)))))

(declare-fun b!551630 () Bool)

(assert (=> b!551630 (= e!318381 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!551630 e!318382))

(declare-fun res!344300 () Bool)

(assert (=> b!551630 (=> (not res!344300) (not e!318382))))

(assert (=> b!551630 (= res!344300 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17029 0))(
  ( (Unit!17030) )
))
(declare-fun lt!250939 () Unit!17029)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34752 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17029)

(assert (=> b!551630 (= lt!250939 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551631 () Bool)

(declare-fun res!344301 () Bool)

(assert (=> b!551631 (=> (not res!344301) (not e!318384))))

(declare-fun arrayContainsKey!0 (array!34752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551631 (= res!344301 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551632 () Bool)

(assert (=> b!551632 (= e!318384 e!318381)))

(declare-fun res!344304 () Bool)

(assert (=> b!551632 (=> (not res!344304) (not e!318381))))

(declare-fun lt!250938 () SeekEntryResult!5092)

(assert (=> b!551632 (= res!344304 (or (= lt!250938 (MissingZero!5092 i!1132)) (= lt!250938 (MissingVacant!5092 i!1132))))))

(assert (=> b!551632 (= lt!250938 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50466 res!344299) b!551628))

(assert (= (and b!551628 res!344303) b!551627))

(assert (= (and b!551627 res!344302) b!551624))

(assert (= (and b!551624 res!344305) b!551631))

(assert (= (and b!551631 res!344301) b!551632))

(assert (= (and b!551632 res!344304) b!551623))

(assert (= (and b!551623 res!344296) b!551625))

(assert (= (and b!551625 res!344297) b!551626))

(assert (= (and b!551626 res!344298) b!551630))

(assert (= (and b!551630 res!344300) b!551629))

(declare-fun m!528743 () Bool)

(assert (=> start!50466 m!528743))

(declare-fun m!528745 () Bool)

(assert (=> start!50466 m!528745))

(declare-fun m!528747 () Bool)

(assert (=> b!551629 m!528747))

(assert (=> b!551629 m!528747))

(declare-fun m!528749 () Bool)

(assert (=> b!551629 m!528749))

(declare-fun m!528751 () Bool)

(assert (=> b!551625 m!528751))

(declare-fun m!528753 () Bool)

(assert (=> b!551631 m!528753))

(declare-fun m!528755 () Bool)

(assert (=> b!551624 m!528755))

(assert (=> b!551626 m!528747))

(declare-fun m!528757 () Bool)

(assert (=> b!551626 m!528757))

(assert (=> b!551626 m!528747))

(declare-fun m!528759 () Bool)

(assert (=> b!551626 m!528759))

(declare-fun m!528761 () Bool)

(assert (=> b!551626 m!528761))

(assert (=> b!551626 m!528759))

(declare-fun m!528763 () Bool)

(assert (=> b!551626 m!528763))

(assert (=> b!551626 m!528757))

(assert (=> b!551626 m!528747))

(declare-fun m!528765 () Bool)

(assert (=> b!551626 m!528765))

(declare-fun m!528767 () Bool)

(assert (=> b!551626 m!528767))

(assert (=> b!551626 m!528759))

(assert (=> b!551626 m!528761))

(declare-fun m!528769 () Bool)

(assert (=> b!551630 m!528769))

(declare-fun m!528771 () Bool)

(assert (=> b!551630 m!528771))

(assert (=> b!551627 m!528747))

(assert (=> b!551627 m!528747))

(declare-fun m!528773 () Bool)

(assert (=> b!551627 m!528773))

(declare-fun m!528775 () Bool)

(assert (=> b!551632 m!528775))

(declare-fun m!528777 () Bool)

(assert (=> b!551623 m!528777))

(check-sat (not b!551631) (not b!551630) (not b!551625) (not b!551627) (not b!551624) (not b!551629) (not b!551632) (not start!50466) (not b!551623) (not b!551626))
(check-sat)
