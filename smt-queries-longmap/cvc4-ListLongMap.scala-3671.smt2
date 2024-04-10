; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50646 () Bool)

(assert start!50646)

(declare-fun b!553613 () Bool)

(declare-fun res!346032 () Bool)

(declare-fun e!319333 () Bool)

(assert (=> b!553613 (=> (not res!346032) (not e!319333))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34871 0))(
  ( (array!34872 (arr!16745 (Array (_ BitVec 32) (_ BitVec 64))) (size!17109 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34871)

(assert (=> b!553613 (= res!346032 (and (= (size!17109 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17109 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17109 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553614 () Bool)

(declare-fun res!346026 () Bool)

(declare-fun e!319332 () Bool)

(assert (=> b!553614 (=> (not res!346026) (not e!319332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34871 (_ BitVec 32)) Bool)

(assert (=> b!553614 (= res!346026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!346028 () Bool)

(assert (=> start!50646 (=> (not res!346028) (not e!319333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50646 (= res!346028 (validMask!0 mask!3119))))

(assert (=> start!50646 e!319333))

(assert (=> start!50646 true))

(declare-fun array_inv!12541 (array!34871) Bool)

(assert (=> start!50646 (array_inv!12541 a!3118)))

(declare-fun e!319334 () Bool)

(declare-fun b!553615 () Bool)

(declare-datatypes ((SeekEntryResult!5194 0))(
  ( (MissingZero!5194 (index!23003 (_ BitVec 32))) (Found!5194 (index!23004 (_ BitVec 32))) (Intermediate!5194 (undefined!6006 Bool) (index!23005 (_ BitVec 32)) (x!51924 (_ BitVec 32))) (Undefined!5194) (MissingVacant!5194 (index!23006 (_ BitVec 32))) )
))
(declare-fun lt!251548 () SeekEntryResult!5194)

(assert (=> b!553615 (= e!319334 (not (or (not (is-Intermediate!5194 lt!251548)) (undefined!6006 lt!251548) (not (= (select (arr!16745 a!3118) (index!23005 lt!251548)) (select (arr!16745 a!3118) j!142))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!319335 () Bool)

(assert (=> b!553615 e!319335))

(declare-fun res!346030 () Bool)

(assert (=> b!553615 (=> (not res!346030) (not e!319335))))

(assert (=> b!553615 (= res!346030 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17162 0))(
  ( (Unit!17163) )
))
(declare-fun lt!251545 () Unit!17162)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34871 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17162)

(assert (=> b!553615 (= lt!251545 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553616 () Bool)

(declare-fun res!346025 () Bool)

(assert (=> b!553616 (=> (not res!346025) (not e!319333))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553616 (= res!346025 (validKeyInArray!0 k!1914))))

(declare-fun b!553617 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34871 (_ BitVec 32)) SeekEntryResult!5194)

(assert (=> b!553617 (= e!319335 (= (seekEntryOrOpen!0 (select (arr!16745 a!3118) j!142) a!3118 mask!3119) (Found!5194 j!142)))))

(declare-fun b!553618 () Bool)

(declare-fun res!346027 () Bool)

(assert (=> b!553618 (=> (not res!346027) (not e!319333))))

(assert (=> b!553618 (= res!346027 (validKeyInArray!0 (select (arr!16745 a!3118) j!142)))))

(declare-fun b!553619 () Bool)

(assert (=> b!553619 (= e!319332 e!319334)))

(declare-fun res!346033 () Bool)

(assert (=> b!553619 (=> (not res!346033) (not e!319334))))

(declare-fun lt!251546 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34871 (_ BitVec 32)) SeekEntryResult!5194)

(assert (=> b!553619 (= res!346033 (= lt!251548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251546 (select (store (arr!16745 a!3118) i!1132 k!1914) j!142) (array!34872 (store (arr!16745 a!3118) i!1132 k!1914) (size!17109 a!3118)) mask!3119)))))

(declare-fun lt!251547 () (_ BitVec 32))

(assert (=> b!553619 (= lt!251548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251547 (select (arr!16745 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553619 (= lt!251546 (toIndex!0 (select (store (arr!16745 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!553619 (= lt!251547 (toIndex!0 (select (arr!16745 a!3118) j!142) mask!3119))))

(declare-fun b!553620 () Bool)

(assert (=> b!553620 (= e!319333 e!319332)))

(declare-fun res!346034 () Bool)

(assert (=> b!553620 (=> (not res!346034) (not e!319332))))

(declare-fun lt!251544 () SeekEntryResult!5194)

(assert (=> b!553620 (= res!346034 (or (= lt!251544 (MissingZero!5194 i!1132)) (= lt!251544 (MissingVacant!5194 i!1132))))))

(assert (=> b!553620 (= lt!251544 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553621 () Bool)

(declare-fun res!346029 () Bool)

(assert (=> b!553621 (=> (not res!346029) (not e!319332))))

(declare-datatypes ((List!10825 0))(
  ( (Nil!10822) (Cons!10821 (h!11806 (_ BitVec 64)) (t!17053 List!10825)) )
))
(declare-fun arrayNoDuplicates!0 (array!34871 (_ BitVec 32) List!10825) Bool)

(assert (=> b!553621 (= res!346029 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10822))))

(declare-fun b!553622 () Bool)

(declare-fun res!346031 () Bool)

(assert (=> b!553622 (=> (not res!346031) (not e!319333))))

(declare-fun arrayContainsKey!0 (array!34871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553622 (= res!346031 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50646 res!346028) b!553613))

(assert (= (and b!553613 res!346032) b!553618))

(assert (= (and b!553618 res!346027) b!553616))

(assert (= (and b!553616 res!346025) b!553622))

(assert (= (and b!553622 res!346031) b!553620))

(assert (= (and b!553620 res!346034) b!553614))

(assert (= (and b!553614 res!346026) b!553621))

(assert (= (and b!553621 res!346029) b!553619))

(assert (= (and b!553619 res!346033) b!553615))

(assert (= (and b!553615 res!346030) b!553617))

(declare-fun m!530731 () Bool)

(assert (=> b!553619 m!530731))

(declare-fun m!530733 () Bool)

(assert (=> b!553619 m!530733))

(assert (=> b!553619 m!530731))

(assert (=> b!553619 m!530731))

(declare-fun m!530735 () Bool)

(assert (=> b!553619 m!530735))

(declare-fun m!530737 () Bool)

(assert (=> b!553619 m!530737))

(assert (=> b!553619 m!530737))

(declare-fun m!530739 () Bool)

(assert (=> b!553619 m!530739))

(declare-fun m!530741 () Bool)

(assert (=> b!553619 m!530741))

(assert (=> b!553619 m!530737))

(declare-fun m!530743 () Bool)

(assert (=> b!553619 m!530743))

(declare-fun m!530745 () Bool)

(assert (=> b!553621 m!530745))

(declare-fun m!530747 () Bool)

(assert (=> b!553615 m!530747))

(assert (=> b!553615 m!530731))

(declare-fun m!530749 () Bool)

(assert (=> b!553615 m!530749))

(declare-fun m!530751 () Bool)

(assert (=> b!553615 m!530751))

(assert (=> b!553618 m!530731))

(assert (=> b!553618 m!530731))

(declare-fun m!530753 () Bool)

(assert (=> b!553618 m!530753))

(declare-fun m!530755 () Bool)

(assert (=> start!50646 m!530755))

(declare-fun m!530757 () Bool)

(assert (=> start!50646 m!530757))

(declare-fun m!530759 () Bool)

(assert (=> b!553622 m!530759))

(declare-fun m!530761 () Bool)

(assert (=> b!553616 m!530761))

(assert (=> b!553617 m!530731))

(assert (=> b!553617 m!530731))

(declare-fun m!530763 () Bool)

(assert (=> b!553617 m!530763))

(declare-fun m!530765 () Bool)

(assert (=> b!553620 m!530765))

(declare-fun m!530767 () Bool)

(assert (=> b!553614 m!530767))

(push 1)

(assert (not b!553622))

(assert (not b!553618))

