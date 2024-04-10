; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52190 () Bool)

(assert start!52190)

(declare-fun b!569724 () Bool)

(declare-fun res!359742 () Bool)

(declare-fun e!327706 () Bool)

(assert (=> b!569724 (=> (not res!359742) (not e!327706))))

(declare-datatypes ((array!35713 0))(
  ( (array!35714 (arr!17148 (Array (_ BitVec 32) (_ BitVec 64))) (size!17512 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35713)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569724 (= res!359742 (validKeyInArray!0 (select (arr!17148 a!3118) j!142)))))

(declare-fun b!569725 () Bool)

(declare-fun e!327708 () Bool)

(assert (=> b!569725 (= e!327706 e!327708)))

(declare-fun res!359748 () Bool)

(assert (=> b!569725 (=> (not res!359748) (not e!327708))))

(declare-datatypes ((SeekEntryResult!5597 0))(
  ( (MissingZero!5597 (index!24615 (_ BitVec 32))) (Found!5597 (index!24616 (_ BitVec 32))) (Intermediate!5597 (undefined!6409 Bool) (index!24617 (_ BitVec 32)) (x!53488 (_ BitVec 32))) (Undefined!5597) (MissingVacant!5597 (index!24618 (_ BitVec 32))) )
))
(declare-fun lt!259736 () SeekEntryResult!5597)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569725 (= res!359748 (or (= lt!259736 (MissingZero!5597 i!1132)) (= lt!259736 (MissingVacant!5597 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35713 (_ BitVec 32)) SeekEntryResult!5597)

(assert (=> b!569725 (= lt!259736 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569726 () Bool)

(declare-fun res!359744 () Bool)

(assert (=> b!569726 (=> (not res!359744) (not e!327708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35713 (_ BitVec 32)) Bool)

(assert (=> b!569726 (= res!359744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569727 () Bool)

(declare-fun res!359747 () Bool)

(assert (=> b!569727 (=> (not res!359747) (not e!327706))))

(declare-fun arrayContainsKey!0 (array!35713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569727 (= res!359747 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569728 () Bool)

(declare-fun e!327707 () Bool)

(assert (=> b!569728 (= e!327707 (not true))))

(declare-fun lt!259737 () SeekEntryResult!5597)

(declare-fun lt!259733 () SeekEntryResult!5597)

(assert (=> b!569728 (and (= lt!259737 (Found!5597 j!142)) (or (undefined!6409 lt!259733) (not (is-Intermediate!5597 lt!259733)) (= (select (arr!17148 a!3118) (index!24617 lt!259733)) (select (arr!17148 a!3118) j!142)) (not (= (select (arr!17148 a!3118) (index!24617 lt!259733)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259737 (MissingZero!5597 (index!24617 lt!259733)))))))

(assert (=> b!569728 (= lt!259737 (seekEntryOrOpen!0 (select (arr!17148 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569728 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17896 0))(
  ( (Unit!17897) )
))
(declare-fun lt!259738 () Unit!17896)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17896)

(assert (=> b!569728 (= lt!259738 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569729 () Bool)

(declare-fun res!359749 () Bool)

(assert (=> b!569729 (=> (not res!359749) (not e!327708))))

(declare-datatypes ((List!11228 0))(
  ( (Nil!11225) (Cons!11224 (h!12245 (_ BitVec 64)) (t!17456 List!11228)) )
))
(declare-fun arrayNoDuplicates!0 (array!35713 (_ BitVec 32) List!11228) Bool)

(assert (=> b!569729 (= res!359749 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11225))))

(declare-fun res!359746 () Bool)

(assert (=> start!52190 (=> (not res!359746) (not e!327706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52190 (= res!359746 (validMask!0 mask!3119))))

(assert (=> start!52190 e!327706))

(assert (=> start!52190 true))

(declare-fun array_inv!12944 (array!35713) Bool)

(assert (=> start!52190 (array_inv!12944 a!3118)))

(declare-fun b!569730 () Bool)

(declare-fun res!359745 () Bool)

(assert (=> b!569730 (=> (not res!359745) (not e!327706))))

(assert (=> b!569730 (= res!359745 (validKeyInArray!0 k!1914))))

(declare-fun b!569731 () Bool)

(declare-fun res!359750 () Bool)

(assert (=> b!569731 (=> (not res!359750) (not e!327706))))

(assert (=> b!569731 (= res!359750 (and (= (size!17512 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17512 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17512 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569732 () Bool)

(assert (=> b!569732 (= e!327708 e!327707)))

(declare-fun res!359743 () Bool)

(assert (=> b!569732 (=> (not res!359743) (not e!327707))))

(declare-fun lt!259735 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35713 (_ BitVec 32)) SeekEntryResult!5597)

(assert (=> b!569732 (= res!359743 (= lt!259733 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259735 (select (store (arr!17148 a!3118) i!1132 k!1914) j!142) (array!35714 (store (arr!17148 a!3118) i!1132 k!1914) (size!17512 a!3118)) mask!3119)))))

(declare-fun lt!259734 () (_ BitVec 32))

(assert (=> b!569732 (= lt!259733 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259734 (select (arr!17148 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569732 (= lt!259735 (toIndex!0 (select (store (arr!17148 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569732 (= lt!259734 (toIndex!0 (select (arr!17148 a!3118) j!142) mask!3119))))

(assert (= (and start!52190 res!359746) b!569731))

(assert (= (and b!569731 res!359750) b!569724))

(assert (= (and b!569724 res!359742) b!569730))

(assert (= (and b!569730 res!359745) b!569727))

(assert (= (and b!569727 res!359747) b!569725))

(assert (= (and b!569725 res!359748) b!569726))

(assert (= (and b!569726 res!359744) b!569729))

(assert (= (and b!569729 res!359749) b!569732))

(assert (= (and b!569732 res!359743) b!569728))

(declare-fun m!548571 () Bool)

(assert (=> b!569724 m!548571))

(assert (=> b!569724 m!548571))

(declare-fun m!548573 () Bool)

(assert (=> b!569724 m!548573))

(declare-fun m!548575 () Bool)

(assert (=> b!569729 m!548575))

(declare-fun m!548577 () Bool)

(assert (=> b!569726 m!548577))

(declare-fun m!548579 () Bool)

(assert (=> b!569725 m!548579))

(declare-fun m!548581 () Bool)

(assert (=> b!569730 m!548581))

(assert (=> b!569728 m!548571))

(declare-fun m!548583 () Bool)

(assert (=> b!569728 m!548583))

(declare-fun m!548585 () Bool)

(assert (=> b!569728 m!548585))

(assert (=> b!569728 m!548571))

(declare-fun m!548587 () Bool)

(assert (=> b!569728 m!548587))

(declare-fun m!548589 () Bool)

(assert (=> b!569728 m!548589))

(declare-fun m!548591 () Bool)

(assert (=> start!52190 m!548591))

(declare-fun m!548593 () Bool)

(assert (=> start!52190 m!548593))

(assert (=> b!569732 m!548571))

(declare-fun m!548595 () Bool)

(assert (=> b!569732 m!548595))

(declare-fun m!548597 () Bool)

(assert (=> b!569732 m!548597))

(declare-fun m!548599 () Bool)

(assert (=> b!569732 m!548599))

(assert (=> b!569732 m!548571))

(assert (=> b!569732 m!548597))

(declare-fun m!548601 () Bool)

(assert (=> b!569732 m!548601))

(assert (=> b!569732 m!548571))

(declare-fun m!548603 () Bool)

(assert (=> b!569732 m!548603))

(assert (=> b!569732 m!548597))

(declare-fun m!548605 () Bool)

(assert (=> b!569732 m!548605))

(declare-fun m!548607 () Bool)

(assert (=> b!569727 m!548607))

(push 1)

