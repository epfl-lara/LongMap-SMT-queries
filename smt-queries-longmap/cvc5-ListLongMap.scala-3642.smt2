; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50228 () Bool)

(assert start!50228)

(declare-fun b!549795 () Bool)

(declare-fun res!342946 () Bool)

(declare-fun e!317473 () Bool)

(assert (=> b!549795 (=> (not res!342946) (not e!317473))))

(declare-datatypes ((array!34681 0))(
  ( (array!34682 (arr!16656 (Array (_ BitVec 32) (_ BitVec 64))) (size!17020 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34681)

(declare-datatypes ((List!10736 0))(
  ( (Nil!10733) (Cons!10732 (h!11705 (_ BitVec 64)) (t!16964 List!10736)) )
))
(declare-fun arrayNoDuplicates!0 (array!34681 (_ BitVec 32) List!10736) Bool)

(assert (=> b!549795 (= res!342946 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10733))))

(declare-fun b!549796 () Bool)

(declare-fun e!317474 () Bool)

(assert (=> b!549796 (= e!317474 e!317473)))

(declare-fun res!342940 () Bool)

(assert (=> b!549796 (=> (not res!342940) (not e!317473))))

(declare-datatypes ((SeekEntryResult!5105 0))(
  ( (MissingZero!5105 (index!22647 (_ BitVec 32))) (Found!5105 (index!22648 (_ BitVec 32))) (Intermediate!5105 (undefined!5917 Bool) (index!22649 (_ BitVec 32)) (x!51579 (_ BitVec 32))) (Undefined!5105) (MissingVacant!5105 (index!22650 (_ BitVec 32))) )
))
(declare-fun lt!250345 () SeekEntryResult!5105)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549796 (= res!342940 (or (= lt!250345 (MissingZero!5105 i!1132)) (= lt!250345 (MissingVacant!5105 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34681 (_ BitVec 32)) SeekEntryResult!5105)

(assert (=> b!549796 (= lt!250345 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549797 () Bool)

(assert (=> b!549797 (= e!317473 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34681 (_ BitVec 32)) Bool)

(assert (=> b!549797 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!16984 0))(
  ( (Unit!16985) )
))
(declare-fun lt!250344 () Unit!16984)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16984)

(assert (=> b!549797 (= lt!250344 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!549798 () Bool)

(declare-fun res!342947 () Bool)

(assert (=> b!549798 (=> (not res!342947) (not e!317474))))

(declare-fun arrayContainsKey!0 (array!34681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549798 (= res!342947 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549799 () Bool)

(declare-fun res!342941 () Bool)

(assert (=> b!549799 (=> (not res!342941) (not e!317474))))

(assert (=> b!549799 (= res!342941 (and (= (size!17020 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17020 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17020 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549800 () Bool)

(declare-fun res!342944 () Bool)

(assert (=> b!549800 (=> (not res!342944) (not e!317473))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34681 (_ BitVec 32)) SeekEntryResult!5105)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549800 (= res!342944 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16656 a!3118) j!142) mask!3119) (select (arr!16656 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16656 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16656 a!3118) i!1132 k!1914) j!142) (array!34682 (store (arr!16656 a!3118) i!1132 k!1914) (size!17020 a!3118)) mask!3119)))))

(declare-fun b!549801 () Bool)

(declare-fun res!342942 () Bool)

(assert (=> b!549801 (=> (not res!342942) (not e!317474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549801 (= res!342942 (validKeyInArray!0 k!1914))))

(declare-fun res!342939 () Bool)

(assert (=> start!50228 (=> (not res!342939) (not e!317474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50228 (= res!342939 (validMask!0 mask!3119))))

(assert (=> start!50228 e!317474))

(assert (=> start!50228 true))

(declare-fun array_inv!12452 (array!34681) Bool)

(assert (=> start!50228 (array_inv!12452 a!3118)))

(declare-fun b!549802 () Bool)

(declare-fun res!342943 () Bool)

(assert (=> b!549802 (=> (not res!342943) (not e!317473))))

(assert (=> b!549802 (= res!342943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549803 () Bool)

(declare-fun res!342945 () Bool)

(assert (=> b!549803 (=> (not res!342945) (not e!317474))))

(assert (=> b!549803 (= res!342945 (validKeyInArray!0 (select (arr!16656 a!3118) j!142)))))

(assert (= (and start!50228 res!342939) b!549799))

(assert (= (and b!549799 res!342941) b!549803))

(assert (= (and b!549803 res!342945) b!549801))

(assert (= (and b!549801 res!342942) b!549798))

(assert (= (and b!549798 res!342947) b!549796))

(assert (= (and b!549796 res!342940) b!549802))

(assert (= (and b!549802 res!342943) b!549795))

(assert (= (and b!549795 res!342946) b!549800))

(assert (= (and b!549800 res!342944) b!549797))

(declare-fun m!526731 () Bool)

(assert (=> b!549798 m!526731))

(declare-fun m!526733 () Bool)

(assert (=> b!549795 m!526733))

(declare-fun m!526735 () Bool)

(assert (=> start!50228 m!526735))

(declare-fun m!526737 () Bool)

(assert (=> start!50228 m!526737))

(declare-fun m!526739 () Bool)

(assert (=> b!549803 m!526739))

(assert (=> b!549803 m!526739))

(declare-fun m!526741 () Bool)

(assert (=> b!549803 m!526741))

(declare-fun m!526743 () Bool)

(assert (=> b!549802 m!526743))

(declare-fun m!526745 () Bool)

(assert (=> b!549801 m!526745))

(declare-fun m!526747 () Bool)

(assert (=> b!549797 m!526747))

(declare-fun m!526749 () Bool)

(assert (=> b!549797 m!526749))

(declare-fun m!526751 () Bool)

(assert (=> b!549796 m!526751))

(assert (=> b!549800 m!526739))

(declare-fun m!526753 () Bool)

(assert (=> b!549800 m!526753))

(assert (=> b!549800 m!526739))

(declare-fun m!526755 () Bool)

(assert (=> b!549800 m!526755))

(declare-fun m!526757 () Bool)

(assert (=> b!549800 m!526757))

(assert (=> b!549800 m!526755))

(declare-fun m!526759 () Bool)

(assert (=> b!549800 m!526759))

(assert (=> b!549800 m!526753))

(assert (=> b!549800 m!526739))

(declare-fun m!526761 () Bool)

(assert (=> b!549800 m!526761))

(declare-fun m!526763 () Bool)

(assert (=> b!549800 m!526763))

(assert (=> b!549800 m!526755))

(assert (=> b!549800 m!526757))

(push 1)

