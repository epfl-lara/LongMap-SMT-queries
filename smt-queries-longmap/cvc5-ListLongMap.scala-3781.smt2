; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51740 () Bool)

(assert start!51740)

(declare-fun b!566093 () Bool)

(declare-fun e!325823 () Bool)

(assert (=> b!566093 (= e!325823 (not true))))

(declare-fun e!325824 () Bool)

(assert (=> b!566093 e!325824))

(declare-fun res!357070 () Bool)

(assert (=> b!566093 (=> (not res!357070) (not e!325824))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35548 0))(
  ( (array!35549 (arr!17073 (Array (_ BitVec 32) (_ BitVec 64))) (size!17437 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35548)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35548 (_ BitVec 32)) Bool)

(assert (=> b!566093 (= res!357070 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17746 0))(
  ( (Unit!17747) )
))
(declare-fun lt!258019 () Unit!17746)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17746)

(assert (=> b!566093 (= lt!258019 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566094 () Bool)

(declare-fun res!357068 () Bool)

(declare-fun e!325822 () Bool)

(assert (=> b!566094 (=> (not res!357068) (not e!325822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566094 (= res!357068 (validKeyInArray!0 (select (arr!17073 a!3118) j!142)))))

(declare-fun b!566095 () Bool)

(declare-fun res!357065 () Bool)

(assert (=> b!566095 (=> (not res!357065) (not e!325823))))

(assert (=> b!566095 (= res!357065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!357069 () Bool)

(assert (=> start!51740 (=> (not res!357069) (not e!325822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51740 (= res!357069 (validMask!0 mask!3119))))

(assert (=> start!51740 e!325822))

(assert (=> start!51740 true))

(declare-fun array_inv!12869 (array!35548) Bool)

(assert (=> start!51740 (array_inv!12869 a!3118)))

(declare-fun b!566096 () Bool)

(declare-fun res!357071 () Bool)

(assert (=> b!566096 (=> (not res!357071) (not e!325822))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!566096 (= res!357071 (validKeyInArray!0 k!1914))))

(declare-fun b!566097 () Bool)

(declare-fun res!357063 () Bool)

(assert (=> b!566097 (=> (not res!357063) (not e!325823))))

(declare-datatypes ((List!11153 0))(
  ( (Nil!11150) (Cons!11149 (h!12155 (_ BitVec 64)) (t!17381 List!11153)) )
))
(declare-fun arrayNoDuplicates!0 (array!35548 (_ BitVec 32) List!11153) Bool)

(assert (=> b!566097 (= res!357063 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11150))))

(declare-fun b!566098 () Bool)

(declare-datatypes ((SeekEntryResult!5522 0))(
  ( (MissingZero!5522 (index!24315 (_ BitVec 32))) (Found!5522 (index!24316 (_ BitVec 32))) (Intermediate!5522 (undefined!6334 Bool) (index!24317 (_ BitVec 32)) (x!53183 (_ BitVec 32))) (Undefined!5522) (MissingVacant!5522 (index!24318 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35548 (_ BitVec 32)) SeekEntryResult!5522)

(assert (=> b!566098 (= e!325824 (= (seekEntryOrOpen!0 (select (arr!17073 a!3118) j!142) a!3118 mask!3119) (Found!5522 j!142)))))

(declare-fun b!566099 () Bool)

(declare-fun res!357066 () Bool)

(assert (=> b!566099 (=> (not res!357066) (not e!325823))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35548 (_ BitVec 32)) SeekEntryResult!5522)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566099 (= res!357066 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17073 a!3118) j!142) mask!3119) (select (arr!17073 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17073 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17073 a!3118) i!1132 k!1914) j!142) (array!35549 (store (arr!17073 a!3118) i!1132 k!1914) (size!17437 a!3118)) mask!3119)))))

(declare-fun b!566100 () Bool)

(declare-fun res!357067 () Bool)

(assert (=> b!566100 (=> (not res!357067) (not e!325822))))

(declare-fun arrayContainsKey!0 (array!35548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566100 (= res!357067 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566101 () Bool)

(assert (=> b!566101 (= e!325822 e!325823)))

(declare-fun res!357064 () Bool)

(assert (=> b!566101 (=> (not res!357064) (not e!325823))))

(declare-fun lt!258018 () SeekEntryResult!5522)

(assert (=> b!566101 (= res!357064 (or (= lt!258018 (MissingZero!5522 i!1132)) (= lt!258018 (MissingVacant!5522 i!1132))))))

(assert (=> b!566101 (= lt!258018 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!566102 () Bool)

(declare-fun res!357062 () Bool)

(assert (=> b!566102 (=> (not res!357062) (not e!325822))))

(assert (=> b!566102 (= res!357062 (and (= (size!17437 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17437 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17437 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51740 res!357069) b!566102))

(assert (= (and b!566102 res!357062) b!566094))

(assert (= (and b!566094 res!357068) b!566096))

(assert (= (and b!566096 res!357071) b!566100))

(assert (= (and b!566100 res!357067) b!566101))

(assert (= (and b!566101 res!357064) b!566095))

(assert (= (and b!566095 res!357065) b!566097))

(assert (= (and b!566097 res!357063) b!566099))

(assert (= (and b!566099 res!357066) b!566093))

(assert (= (and b!566093 res!357070) b!566098))

(declare-fun m!544683 () Bool)

(assert (=> b!566101 m!544683))

(declare-fun m!544685 () Bool)

(assert (=> b!566093 m!544685))

(declare-fun m!544687 () Bool)

(assert (=> b!566093 m!544687))

(declare-fun m!544689 () Bool)

(assert (=> b!566096 m!544689))

(declare-fun m!544691 () Bool)

(assert (=> b!566094 m!544691))

(assert (=> b!566094 m!544691))

(declare-fun m!544693 () Bool)

(assert (=> b!566094 m!544693))

(declare-fun m!544695 () Bool)

(assert (=> b!566100 m!544695))

(declare-fun m!544697 () Bool)

(assert (=> b!566097 m!544697))

(assert (=> b!566098 m!544691))

(assert (=> b!566098 m!544691))

(declare-fun m!544699 () Bool)

(assert (=> b!566098 m!544699))

(declare-fun m!544701 () Bool)

(assert (=> b!566095 m!544701))

(declare-fun m!544703 () Bool)

(assert (=> start!51740 m!544703))

(declare-fun m!544705 () Bool)

(assert (=> start!51740 m!544705))

(assert (=> b!566099 m!544691))

(declare-fun m!544707 () Bool)

(assert (=> b!566099 m!544707))

(assert (=> b!566099 m!544691))

(declare-fun m!544709 () Bool)

(assert (=> b!566099 m!544709))

(declare-fun m!544711 () Bool)

(assert (=> b!566099 m!544711))

(assert (=> b!566099 m!544709))

(declare-fun m!544713 () Bool)

(assert (=> b!566099 m!544713))

(assert (=> b!566099 m!544707))

(assert (=> b!566099 m!544691))

(declare-fun m!544715 () Bool)

(assert (=> b!566099 m!544715))

(declare-fun m!544717 () Bool)

(assert (=> b!566099 m!544717))

(assert (=> b!566099 m!544709))

(assert (=> b!566099 m!544711))

(push 1)

