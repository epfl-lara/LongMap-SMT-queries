; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50324 () Bool)

(assert start!50324)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!317843 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!550592 () Bool)

(declare-datatypes ((array!34720 0))(
  ( (array!34721 (arr!16674 (Array (_ BitVec 32) (_ BitVec 64))) (size!17038 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34720)

(declare-datatypes ((SeekEntryResult!5123 0))(
  ( (MissingZero!5123 (index!22719 (_ BitVec 32))) (Found!5123 (index!22720 (_ BitVec 32))) (Intermediate!5123 (undefined!5935 Bool) (index!22721 (_ BitVec 32)) (x!51651 (_ BitVec 32))) (Undefined!5123) (MissingVacant!5123 (index!22722 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34720 (_ BitVec 32)) SeekEntryResult!5123)

(assert (=> b!550592 (= e!317843 (= (seekEntryOrOpen!0 (select (arr!16674 a!3118) j!142) a!3118 mask!3119) (Found!5123 j!142)))))

(declare-fun b!550593 () Bool)

(declare-fun res!343561 () Bool)

(declare-fun e!317841 () Bool)

(assert (=> b!550593 (=> (not res!343561) (not e!317841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550593 (= res!343561 (validKeyInArray!0 (select (arr!16674 a!3118) j!142)))))

(declare-fun b!550594 () Bool)

(declare-fun e!317842 () Bool)

(assert (=> b!550594 (= e!317841 e!317842)))

(declare-fun res!343559 () Bool)

(assert (=> b!550594 (=> (not res!343559) (not e!317842))))

(declare-fun lt!250582 () SeekEntryResult!5123)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550594 (= res!343559 (or (= lt!250582 (MissingZero!5123 i!1132)) (= lt!250582 (MissingVacant!5123 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!550594 (= lt!250582 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!343557 () Bool)

(assert (=> start!50324 (=> (not res!343557) (not e!317841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50324 (= res!343557 (validMask!0 mask!3119))))

(assert (=> start!50324 e!317841))

(assert (=> start!50324 true))

(declare-fun array_inv!12470 (array!34720) Bool)

(assert (=> start!50324 (array_inv!12470 a!3118)))

(declare-fun b!550595 () Bool)

(declare-fun res!343556 () Bool)

(assert (=> b!550595 (=> (not res!343556) (not e!317842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34720 (_ BitVec 32)) Bool)

(assert (=> b!550595 (= res!343556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550596 () Bool)

(declare-fun res!343555 () Bool)

(assert (=> b!550596 (=> (not res!343555) (not e!317841))))

(assert (=> b!550596 (= res!343555 (validKeyInArray!0 k!1914))))

(declare-fun b!550597 () Bool)

(declare-fun res!343554 () Bool)

(assert (=> b!550597 (=> (not res!343554) (not e!317842))))

(declare-datatypes ((List!10754 0))(
  ( (Nil!10751) (Cons!10750 (h!11726 (_ BitVec 64)) (t!16982 List!10754)) )
))
(declare-fun arrayNoDuplicates!0 (array!34720 (_ BitVec 32) List!10754) Bool)

(assert (=> b!550597 (= res!343554 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10751))))

(declare-fun b!550598 () Bool)

(declare-fun res!343562 () Bool)

(assert (=> b!550598 (=> (not res!343562) (not e!317841))))

(declare-fun arrayContainsKey!0 (array!34720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550598 (= res!343562 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550599 () Bool)

(assert (=> b!550599 (= e!317842 (not true))))

(assert (=> b!550599 e!317843))

(declare-fun res!343558 () Bool)

(assert (=> b!550599 (=> (not res!343558) (not e!317843))))

(assert (=> b!550599 (= res!343558 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17020 0))(
  ( (Unit!17021) )
))
(declare-fun lt!250581 () Unit!17020)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34720 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17020)

(assert (=> b!550599 (= lt!250581 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550600 () Bool)

(declare-fun res!343553 () Bool)

(assert (=> b!550600 (=> (not res!343553) (not e!317842))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34720 (_ BitVec 32)) SeekEntryResult!5123)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550600 (= res!343553 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16674 a!3118) j!142) mask!3119) (select (arr!16674 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16674 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16674 a!3118) i!1132 k!1914) j!142) (array!34721 (store (arr!16674 a!3118) i!1132 k!1914) (size!17038 a!3118)) mask!3119)))))

(declare-fun b!550601 () Bool)

(declare-fun res!343560 () Bool)

(assert (=> b!550601 (=> (not res!343560) (not e!317841))))

(assert (=> b!550601 (= res!343560 (and (= (size!17038 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17038 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17038 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50324 res!343557) b!550601))

(assert (= (and b!550601 res!343560) b!550593))

(assert (= (and b!550593 res!343561) b!550596))

(assert (= (and b!550596 res!343555) b!550598))

(assert (= (and b!550598 res!343562) b!550594))

(assert (= (and b!550594 res!343559) b!550595))

(assert (= (and b!550595 res!343556) b!550597))

(assert (= (and b!550597 res!343554) b!550600))

(assert (= (and b!550600 res!343553) b!550599))

(assert (= (and b!550599 res!343558) b!550592))

(declare-fun m!527553 () Bool)

(assert (=> b!550598 m!527553))

(declare-fun m!527555 () Bool)

(assert (=> b!550595 m!527555))

(declare-fun m!527557 () Bool)

(assert (=> b!550596 m!527557))

(declare-fun m!527559 () Bool)

(assert (=> b!550592 m!527559))

(assert (=> b!550592 m!527559))

(declare-fun m!527561 () Bool)

(assert (=> b!550592 m!527561))

(declare-fun m!527563 () Bool)

(assert (=> b!550594 m!527563))

(declare-fun m!527565 () Bool)

(assert (=> start!50324 m!527565))

(declare-fun m!527567 () Bool)

(assert (=> start!50324 m!527567))

(assert (=> b!550600 m!527559))

(declare-fun m!527569 () Bool)

(assert (=> b!550600 m!527569))

(assert (=> b!550600 m!527559))

(declare-fun m!527571 () Bool)

(assert (=> b!550600 m!527571))

(declare-fun m!527573 () Bool)

(assert (=> b!550600 m!527573))

(assert (=> b!550600 m!527571))

(declare-fun m!527575 () Bool)

(assert (=> b!550600 m!527575))

(assert (=> b!550600 m!527569))

(assert (=> b!550600 m!527559))

(declare-fun m!527577 () Bool)

(assert (=> b!550600 m!527577))

(declare-fun m!527579 () Bool)

(assert (=> b!550600 m!527579))

(assert (=> b!550600 m!527571))

(assert (=> b!550600 m!527573))

(declare-fun m!527581 () Bool)

(assert (=> b!550599 m!527581))

(declare-fun m!527583 () Bool)

(assert (=> b!550599 m!527583))

(assert (=> b!550593 m!527559))

(assert (=> b!550593 m!527559))

(declare-fun m!527585 () Bool)

(assert (=> b!550593 m!527585))

(declare-fun m!527587 () Bool)

(assert (=> b!550597 m!527587))

(push 1)

