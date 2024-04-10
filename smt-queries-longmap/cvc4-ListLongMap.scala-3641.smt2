; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50226 () Bool)

(assert start!50226)

(declare-fun b!549769 () Bool)

(declare-fun res!342919 () Bool)

(declare-fun e!317465 () Bool)

(assert (=> b!549769 (=> (not res!342919) (not e!317465))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34679 0))(
  ( (array!34680 (arr!16655 (Array (_ BitVec 32) (_ BitVec 64))) (size!17019 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34679)

(assert (=> b!549769 (= res!342919 (and (= (size!17019 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17019 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17019 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549770 () Bool)

(declare-fun res!342915 () Bool)

(declare-fun e!317464 () Bool)

(assert (=> b!549770 (=> (not res!342915) (not e!317464))))

(declare-datatypes ((List!10735 0))(
  ( (Nil!10732) (Cons!10731 (h!11704 (_ BitVec 64)) (t!16963 List!10735)) )
))
(declare-fun arrayNoDuplicates!0 (array!34679 (_ BitVec 32) List!10735) Bool)

(assert (=> b!549770 (= res!342915 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10732))))

(declare-fun b!549771 () Bool)

(declare-fun res!342917 () Bool)

(assert (=> b!549771 (=> (not res!342917) (not e!317464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34679 (_ BitVec 32)) Bool)

(assert (=> b!549771 (= res!342917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549772 () Bool)

(assert (=> b!549772 (= e!317465 e!317464)))

(declare-fun res!342914 () Bool)

(assert (=> b!549772 (=> (not res!342914) (not e!317464))))

(declare-datatypes ((SeekEntryResult!5104 0))(
  ( (MissingZero!5104 (index!22643 (_ BitVec 32))) (Found!5104 (index!22644 (_ BitVec 32))) (Intermediate!5104 (undefined!5916 Bool) (index!22645 (_ BitVec 32)) (x!51570 (_ BitVec 32))) (Undefined!5104) (MissingVacant!5104 (index!22646 (_ BitVec 32))) )
))
(declare-fun lt!250338 () SeekEntryResult!5104)

(assert (=> b!549772 (= res!342914 (or (= lt!250338 (MissingZero!5104 i!1132)) (= lt!250338 (MissingVacant!5104 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34679 (_ BitVec 32)) SeekEntryResult!5104)

(assert (=> b!549772 (= lt!250338 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!342920 () Bool)

(assert (=> start!50226 (=> (not res!342920) (not e!317465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50226 (= res!342920 (validMask!0 mask!3119))))

(assert (=> start!50226 e!317465))

(assert (=> start!50226 true))

(declare-fun array_inv!12451 (array!34679) Bool)

(assert (=> start!50226 (array_inv!12451 a!3118)))

(declare-fun b!549773 () Bool)

(declare-fun res!342913 () Bool)

(assert (=> b!549773 (=> (not res!342913) (not e!317465))))

(declare-fun arrayContainsKey!0 (array!34679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549773 (= res!342913 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549774 () Bool)

(declare-fun res!342918 () Bool)

(assert (=> b!549774 (=> (not res!342918) (not e!317465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549774 (= res!342918 (validKeyInArray!0 k!1914))))

(declare-fun b!549775 () Bool)

(declare-fun res!342916 () Bool)

(assert (=> b!549775 (=> (not res!342916) (not e!317465))))

(assert (=> b!549775 (= res!342916 (validKeyInArray!0 (select (arr!16655 a!3118) j!142)))))

(declare-fun b!549776 () Bool)

(assert (=> b!549776 (= e!317464 false)))

(declare-fun lt!250337 () SeekEntryResult!5104)

(declare-fun lt!250336 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34679 (_ BitVec 32)) SeekEntryResult!5104)

(assert (=> b!549776 (= lt!250337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250336 (select (store (arr!16655 a!3118) i!1132 k!1914) j!142) (array!34680 (store (arr!16655 a!3118) i!1132 k!1914) (size!17019 a!3118)) mask!3119))))

(declare-fun lt!250339 () SeekEntryResult!5104)

(declare-fun lt!250335 () (_ BitVec 32))

(assert (=> b!549776 (= lt!250339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250335 (select (arr!16655 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549776 (= lt!250336 (toIndex!0 (select (store (arr!16655 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!549776 (= lt!250335 (toIndex!0 (select (arr!16655 a!3118) j!142) mask!3119))))

(assert (= (and start!50226 res!342920) b!549769))

(assert (= (and b!549769 res!342919) b!549775))

(assert (= (and b!549775 res!342916) b!549774))

(assert (= (and b!549774 res!342918) b!549773))

(assert (= (and b!549773 res!342913) b!549772))

(assert (= (and b!549772 res!342914) b!549771))

(assert (= (and b!549771 res!342917) b!549770))

(assert (= (and b!549770 res!342915) b!549776))

(declare-fun m!526701 () Bool)

(assert (=> b!549772 m!526701))

(declare-fun m!526703 () Bool)

(assert (=> b!549774 m!526703))

(declare-fun m!526705 () Bool)

(assert (=> b!549771 m!526705))

(declare-fun m!526707 () Bool)

(assert (=> b!549776 m!526707))

(declare-fun m!526709 () Bool)

(assert (=> b!549776 m!526709))

(assert (=> b!549776 m!526707))

(declare-fun m!526711 () Bool)

(assert (=> b!549776 m!526711))

(declare-fun m!526713 () Bool)

(assert (=> b!549776 m!526713))

(declare-fun m!526715 () Bool)

(assert (=> b!549776 m!526715))

(assert (=> b!549776 m!526707))

(assert (=> b!549776 m!526713))

(declare-fun m!526717 () Bool)

(assert (=> b!549776 m!526717))

(assert (=> b!549776 m!526713))

(declare-fun m!526719 () Bool)

(assert (=> b!549776 m!526719))

(declare-fun m!526721 () Bool)

(assert (=> b!549773 m!526721))

(declare-fun m!526723 () Bool)

(assert (=> start!50226 m!526723))

(declare-fun m!526725 () Bool)

(assert (=> start!50226 m!526725))

(assert (=> b!549775 m!526707))

(assert (=> b!549775 m!526707))

(declare-fun m!526727 () Bool)

(assert (=> b!549775 m!526727))

(declare-fun m!526729 () Bool)

(assert (=> b!549770 m!526729))

(push 1)

(assert (not b!549771))

