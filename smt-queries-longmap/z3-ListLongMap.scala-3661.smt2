; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50570 () Bool)

(assert start!50570)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!552366 () Bool)

(declare-fun e!318717 () Bool)

(declare-datatypes ((array!34804 0))(
  ( (array!34805 (arr!16712 (Array (_ BitVec 32) (_ BitVec 64))) (size!17077 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34804)

(declare-datatypes ((SeekEntryResult!5158 0))(
  ( (MissingZero!5158 (index!22859 (_ BitVec 32))) (Found!5158 (index!22860 (_ BitVec 32))) (Intermediate!5158 (undefined!5970 Bool) (index!22861 (_ BitVec 32)) (x!51803 (_ BitVec 32))) (Undefined!5158) (MissingVacant!5158 (index!22862 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34804 (_ BitVec 32)) SeekEntryResult!5158)

(assert (=> b!552366 (= e!318717 (= (seekEntryOrOpen!0 (select (arr!16712 a!3118) j!142) a!3118 mask!3119) (Found!5158 j!142)))))

(declare-fun res!344925 () Bool)

(declare-fun e!318720 () Bool)

(assert (=> start!50570 (=> (not res!344925) (not e!318720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50570 (= res!344925 (validMask!0 mask!3119))))

(assert (=> start!50570 e!318720))

(assert (=> start!50570 true))

(declare-fun array_inv!12595 (array!34804) Bool)

(assert (=> start!50570 (array_inv!12595 a!3118)))

(declare-fun b!552367 () Bool)

(declare-fun e!318715 () Bool)

(declare-fun e!318719 () Bool)

(assert (=> b!552367 (= e!318715 e!318719)))

(declare-fun res!344920 () Bool)

(assert (=> b!552367 (=> (not res!344920) (not e!318719))))

(declare-fun lt!251001 () (_ BitVec 32))

(declare-fun lt!250999 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34804 (_ BitVec 32)) SeekEntryResult!5158)

(assert (=> b!552367 (= res!344920 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251001 (select (arr!16712 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250999 (select (store (arr!16712 a!3118) i!1132 k0!1914) j!142) (array!34805 (store (arr!16712 a!3118) i!1132 k0!1914) (size!17077 a!3118)) mask!3119)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552367 (= lt!250999 (toIndex!0 (select (store (arr!16712 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!552367 (= lt!251001 (toIndex!0 (select (arr!16712 a!3118) j!142) mask!3119))))

(declare-fun e!318718 () Bool)

(declare-fun b!552368 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552368 (= e!318718 (validKeyInArray!0 (select (store (arr!16712 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun b!552369 () Bool)

(declare-fun res!344929 () Bool)

(assert (=> b!552369 (=> (not res!344929) (not e!318720))))

(declare-fun arrayContainsKey!0 (array!34804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552369 (= res!344929 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552370 () Bool)

(declare-fun res!344926 () Bool)

(assert (=> b!552370 (=> (not res!344926) (not e!318720))))

(assert (=> b!552370 (= res!344926 (validKeyInArray!0 k0!1914))))

(declare-fun b!552371 () Bool)

(assert (=> b!552371 (= e!318719 (not e!318718))))

(declare-fun res!344930 () Bool)

(assert (=> b!552371 (=> res!344930 e!318718)))

(assert (=> b!552371 (= res!344930 (or (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt lt!250999 #b00000000000000000000000000000000) (bvsge lt!250999 (bvadd #b00000000000000000000000000000001 mask!3119))))))

(assert (=> b!552371 e!318717))

(declare-fun res!344924 () Bool)

(assert (=> b!552371 (=> (not res!344924) (not e!318717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34804 (_ BitVec 32)) Bool)

(assert (=> b!552371 (= res!344924 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17076 0))(
  ( (Unit!17077) )
))
(declare-fun lt!251000 () Unit!17076)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34804 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17076)

(assert (=> b!552371 (= lt!251000 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552372 () Bool)

(assert (=> b!552372 (= e!318720 e!318715)))

(declare-fun res!344927 () Bool)

(assert (=> b!552372 (=> (not res!344927) (not e!318715))))

(declare-fun lt!251002 () SeekEntryResult!5158)

(assert (=> b!552372 (= res!344927 (or (= lt!251002 (MissingZero!5158 i!1132)) (= lt!251002 (MissingVacant!5158 i!1132))))))

(assert (=> b!552372 (= lt!251002 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552373 () Bool)

(declare-fun res!344923 () Bool)

(assert (=> b!552373 (=> (not res!344923) (not e!318720))))

(assert (=> b!552373 (= res!344923 (and (= (size!17077 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17077 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17077 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552374 () Bool)

(declare-fun res!344921 () Bool)

(assert (=> b!552374 (=> (not res!344921) (not e!318720))))

(assert (=> b!552374 (= res!344921 (validKeyInArray!0 (select (arr!16712 a!3118) j!142)))))

(declare-fun b!552375 () Bool)

(declare-fun res!344928 () Bool)

(assert (=> b!552375 (=> (not res!344928) (not e!318715))))

(assert (=> b!552375 (= res!344928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552376 () Bool)

(declare-fun res!344922 () Bool)

(assert (=> b!552376 (=> (not res!344922) (not e!318715))))

(declare-datatypes ((List!10831 0))(
  ( (Nil!10828) (Cons!10827 (h!11812 (_ BitVec 64)) (t!17050 List!10831)) )
))
(declare-fun arrayNoDuplicates!0 (array!34804 (_ BitVec 32) List!10831) Bool)

(assert (=> b!552376 (= res!344922 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10828))))

(assert (= (and start!50570 res!344925) b!552373))

(assert (= (and b!552373 res!344923) b!552374))

(assert (= (and b!552374 res!344921) b!552370))

(assert (= (and b!552370 res!344926) b!552369))

(assert (= (and b!552369 res!344929) b!552372))

(assert (= (and b!552372 res!344927) b!552375))

(assert (= (and b!552375 res!344928) b!552376))

(assert (= (and b!552376 res!344922) b!552367))

(assert (= (and b!552367 res!344920) b!552371))

(assert (= (and b!552371 res!344924) b!552366))

(assert (= (and b!552371 (not res!344930)) b!552368))

(declare-fun m!528791 () Bool)

(assert (=> b!552374 m!528791))

(assert (=> b!552374 m!528791))

(declare-fun m!528793 () Bool)

(assert (=> b!552374 m!528793))

(assert (=> b!552367 m!528791))

(declare-fun m!528795 () Bool)

(assert (=> b!552367 m!528795))

(declare-fun m!528797 () Bool)

(assert (=> b!552367 m!528797))

(declare-fun m!528799 () Bool)

(assert (=> b!552367 m!528799))

(assert (=> b!552367 m!528791))

(assert (=> b!552367 m!528797))

(assert (=> b!552367 m!528791))

(declare-fun m!528801 () Bool)

(assert (=> b!552367 m!528801))

(declare-fun m!528803 () Bool)

(assert (=> b!552367 m!528803))

(assert (=> b!552367 m!528797))

(declare-fun m!528805 () Bool)

(assert (=> b!552367 m!528805))

(declare-fun m!528807 () Bool)

(assert (=> b!552376 m!528807))

(declare-fun m!528809 () Bool)

(assert (=> b!552372 m!528809))

(assert (=> b!552366 m!528791))

(assert (=> b!552366 m!528791))

(declare-fun m!528811 () Bool)

(assert (=> b!552366 m!528811))

(assert (=> b!552368 m!528803))

(assert (=> b!552368 m!528797))

(assert (=> b!552368 m!528797))

(declare-fun m!528813 () Bool)

(assert (=> b!552368 m!528813))

(declare-fun m!528815 () Bool)

(assert (=> b!552369 m!528815))

(declare-fun m!528817 () Bool)

(assert (=> start!50570 m!528817))

(declare-fun m!528819 () Bool)

(assert (=> start!50570 m!528819))

(declare-fun m!528821 () Bool)

(assert (=> b!552370 m!528821))

(declare-fun m!528823 () Bool)

(assert (=> b!552375 m!528823))

(declare-fun m!528825 () Bool)

(assert (=> b!552371 m!528825))

(declare-fun m!528827 () Bool)

(assert (=> b!552371 m!528827))

(check-sat (not b!552376) (not b!552368) (not b!552371) (not b!552374) (not b!552369) (not b!552366) (not b!552370) (not b!552367) (not b!552372) (not start!50570) (not b!552375))
(check-sat)
