; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50588 () Bool)

(assert start!50588)

(declare-fun b!552735 () Bool)

(declare-fun e!318940 () Bool)

(declare-fun e!318939 () Bool)

(assert (=> b!552735 (= e!318940 e!318939)))

(declare-fun res!345155 () Bool)

(assert (=> b!552735 (=> (not res!345155) (not e!318939))))

(declare-datatypes ((SeekEntryResult!5165 0))(
  ( (MissingZero!5165 (index!22887 (_ BitVec 32))) (Found!5165 (index!22888 (_ BitVec 32))) (Intermediate!5165 (undefined!5977 Bool) (index!22889 (_ BitVec 32)) (x!51823 (_ BitVec 32))) (Undefined!5165) (MissingVacant!5165 (index!22890 (_ BitVec 32))) )
))
(declare-fun lt!251265 () SeekEntryResult!5165)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552735 (= res!345155 (or (= lt!251265 (MissingZero!5165 i!1132)) (= lt!251265 (MissingVacant!5165 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34813 0))(
  ( (array!34814 (arr!16716 (Array (_ BitVec 32) (_ BitVec 64))) (size!17080 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34813)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34813 (_ BitVec 32)) SeekEntryResult!5165)

(assert (=> b!552735 (= lt!251265 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!552736 () Bool)

(declare-fun res!345153 () Bool)

(assert (=> b!552736 (=> (not res!345153) (not e!318940))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!552736 (= res!345153 (and (= (size!17080 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17080 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17080 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552737 () Bool)

(declare-fun res!345150 () Bool)

(assert (=> b!552737 (=> (not res!345150) (not e!318940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552737 (= res!345150 (validKeyInArray!0 k!1914))))

(declare-fun b!552738 () Bool)

(declare-fun res!345152 () Bool)

(assert (=> b!552738 (=> (not res!345152) (not e!318939))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34813 (_ BitVec 32)) SeekEntryResult!5165)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552738 (= res!345152 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16716 a!3118) j!142) mask!3119) (select (arr!16716 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16716 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16716 a!3118) i!1132 k!1914) j!142) (array!34814 (store (arr!16716 a!3118) i!1132 k!1914) (size!17080 a!3118)) mask!3119)))))

(declare-fun b!552739 () Bool)

(declare-fun res!345148 () Bool)

(assert (=> b!552739 (=> (not res!345148) (not e!318939))))

(declare-datatypes ((List!10796 0))(
  ( (Nil!10793) (Cons!10792 (h!11777 (_ BitVec 64)) (t!17024 List!10796)) )
))
(declare-fun arrayNoDuplicates!0 (array!34813 (_ BitVec 32) List!10796) Bool)

(assert (=> b!552739 (= res!345148 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10793))))

(declare-fun b!552734 () Bool)

(declare-fun res!345154 () Bool)

(assert (=> b!552734 (=> (not res!345154) (not e!318940))))

(assert (=> b!552734 (= res!345154 (validKeyInArray!0 (select (arr!16716 a!3118) j!142)))))

(declare-fun res!345149 () Bool)

(assert (=> start!50588 (=> (not res!345149) (not e!318940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50588 (= res!345149 (validMask!0 mask!3119))))

(assert (=> start!50588 e!318940))

(assert (=> start!50588 true))

(declare-fun array_inv!12512 (array!34813) Bool)

(assert (=> start!50588 (array_inv!12512 a!3118)))

(declare-fun b!552740 () Bool)

(declare-fun res!345151 () Bool)

(assert (=> b!552740 (=> (not res!345151) (not e!318940))))

(declare-fun arrayContainsKey!0 (array!34813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552740 (= res!345151 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552741 () Bool)

(declare-fun res!345146 () Bool)

(assert (=> b!552741 (=> (not res!345146) (not e!318939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34813 (_ BitVec 32)) Bool)

(assert (=> b!552741 (= res!345146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552742 () Bool)

(assert (=> b!552742 (= e!318939 (not true))))

(declare-fun e!318941 () Bool)

(assert (=> b!552742 e!318941))

(declare-fun res!345147 () Bool)

(assert (=> b!552742 (=> (not res!345147) (not e!318941))))

(assert (=> b!552742 (= res!345147 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17104 0))(
  ( (Unit!17105) )
))
(declare-fun lt!251266 () Unit!17104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17104)

(assert (=> b!552742 (= lt!251266 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552743 () Bool)

(assert (=> b!552743 (= e!318941 (= (seekEntryOrOpen!0 (select (arr!16716 a!3118) j!142) a!3118 mask!3119) (Found!5165 j!142)))))

(assert (= (and start!50588 res!345149) b!552736))

(assert (= (and b!552736 res!345153) b!552734))

(assert (= (and b!552734 res!345154) b!552737))

(assert (= (and b!552737 res!345150) b!552740))

(assert (= (and b!552740 res!345151) b!552735))

(assert (= (and b!552735 res!345155) b!552741))

(assert (= (and b!552741 res!345146) b!552739))

(assert (= (and b!552739 res!345148) b!552738))

(assert (= (and b!552738 res!345152) b!552742))

(assert (= (and b!552742 res!345147) b!552743))

(declare-fun m!529677 () Bool)

(assert (=> b!552740 m!529677))

(declare-fun m!529679 () Bool)

(assert (=> start!50588 m!529679))

(declare-fun m!529681 () Bool)

(assert (=> start!50588 m!529681))

(declare-fun m!529683 () Bool)

(assert (=> b!552743 m!529683))

(assert (=> b!552743 m!529683))

(declare-fun m!529685 () Bool)

(assert (=> b!552743 m!529685))

(declare-fun m!529687 () Bool)

(assert (=> b!552737 m!529687))

(declare-fun m!529689 () Bool)

(assert (=> b!552742 m!529689))

(declare-fun m!529691 () Bool)

(assert (=> b!552742 m!529691))

(declare-fun m!529693 () Bool)

(assert (=> b!552741 m!529693))

(assert (=> b!552738 m!529683))

(declare-fun m!529695 () Bool)

(assert (=> b!552738 m!529695))

(assert (=> b!552738 m!529683))

(declare-fun m!529697 () Bool)

(assert (=> b!552738 m!529697))

(declare-fun m!529699 () Bool)

(assert (=> b!552738 m!529699))

(assert (=> b!552738 m!529697))

(declare-fun m!529701 () Bool)

(assert (=> b!552738 m!529701))

(assert (=> b!552738 m!529695))

(assert (=> b!552738 m!529683))

(declare-fun m!529703 () Bool)

(assert (=> b!552738 m!529703))

(declare-fun m!529705 () Bool)

(assert (=> b!552738 m!529705))

(assert (=> b!552738 m!529697))

(assert (=> b!552738 m!529699))

(declare-fun m!529707 () Bool)

(assert (=> b!552735 m!529707))

(declare-fun m!529709 () Bool)

(assert (=> b!552739 m!529709))

(assert (=> b!552734 m!529683))

(assert (=> b!552734 m!529683))

(declare-fun m!529711 () Bool)

(assert (=> b!552734 m!529711))

(push 1)

