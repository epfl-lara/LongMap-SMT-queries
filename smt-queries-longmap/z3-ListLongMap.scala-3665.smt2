; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50594 () Bool)

(assert start!50594)

(declare-fun b!552733 () Bool)

(declare-fun res!345290 () Bool)

(declare-fun e!318882 () Bool)

(assert (=> b!552733 (=> (not res!345290) (not e!318882))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34828 0))(
  ( (array!34829 (arr!16724 (Array (_ BitVec 32) (_ BitVec 64))) (size!17089 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34828)

(declare-datatypes ((SeekEntryResult!5170 0))(
  ( (MissingZero!5170 (index!22907 (_ BitVec 32))) (Found!5170 (index!22908 (_ BitVec 32))) (Intermediate!5170 (undefined!5982 Bool) (index!22909 (_ BitVec 32)) (x!51847 (_ BitVec 32))) (Undefined!5170) (MissingVacant!5170 (index!22910 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34828 (_ BitVec 32)) SeekEntryResult!5170)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552733 (= res!345290 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16724 a!3118) j!142) mask!3119) (select (arr!16724 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16724 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16724 a!3118) i!1132 k0!1914) j!142) (array!34829 (store (arr!16724 a!3118) i!1132 k0!1914) (size!17089 a!3118)) mask!3119)))))

(declare-fun b!552734 () Bool)

(declare-fun res!345293 () Bool)

(assert (=> b!552734 (=> (not res!345293) (not e!318882))))

(declare-datatypes ((List!10843 0))(
  ( (Nil!10840) (Cons!10839 (h!11824 (_ BitVec 64)) (t!17062 List!10843)) )
))
(declare-fun arrayNoDuplicates!0 (array!34828 (_ BitVec 32) List!10843) Bool)

(assert (=> b!552734 (= res!345293 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10840))))

(declare-fun b!552735 () Bool)

(declare-fun res!345287 () Bool)

(declare-fun e!318885 () Bool)

(assert (=> b!552735 (=> (not res!345287) (not e!318885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552735 (= res!345287 (validKeyInArray!0 k0!1914))))

(declare-fun e!318884 () Bool)

(declare-fun b!552736 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34828 (_ BitVec 32)) SeekEntryResult!5170)

(assert (=> b!552736 (= e!318884 (= (seekEntryOrOpen!0 (select (arr!16724 a!3118) j!142) a!3118 mask!3119) (Found!5170 j!142)))))

(declare-fun b!552737 () Bool)

(declare-fun res!345289 () Bool)

(assert (=> b!552737 (=> (not res!345289) (not e!318885))))

(assert (=> b!552737 (= res!345289 (and (= (size!17089 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17089 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17089 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552738 () Bool)

(declare-fun res!345288 () Bool)

(assert (=> b!552738 (=> (not res!345288) (not e!318885))))

(declare-fun arrayContainsKey!0 (array!34828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552738 (= res!345288 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552739 () Bool)

(declare-fun res!345292 () Bool)

(assert (=> b!552739 (=> (not res!345292) (not e!318882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34828 (_ BitVec 32)) Bool)

(assert (=> b!552739 (= res!345292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552740 () Bool)

(assert (=> b!552740 (= e!318885 e!318882)))

(declare-fun res!345291 () Bool)

(assert (=> b!552740 (=> (not res!345291) (not e!318882))))

(declare-fun lt!251112 () SeekEntryResult!5170)

(assert (=> b!552740 (= res!345291 (or (= lt!251112 (MissingZero!5170 i!1132)) (= lt!251112 (MissingVacant!5170 i!1132))))))

(assert (=> b!552740 (= lt!251112 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!345295 () Bool)

(assert (=> start!50594 (=> (not res!345295) (not e!318885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50594 (= res!345295 (validMask!0 mask!3119))))

(assert (=> start!50594 e!318885))

(assert (=> start!50594 true))

(declare-fun array_inv!12607 (array!34828) Bool)

(assert (=> start!50594 (array_inv!12607 a!3118)))

(declare-fun b!552741 () Bool)

(assert (=> b!552741 (= e!318882 (not true))))

(assert (=> b!552741 e!318884))

(declare-fun res!345294 () Bool)

(assert (=> b!552741 (=> (not res!345294) (not e!318884))))

(assert (=> b!552741 (= res!345294 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17100 0))(
  ( (Unit!17101) )
))
(declare-fun lt!251113 () Unit!17100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17100)

(assert (=> b!552741 (= lt!251113 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552742 () Bool)

(declare-fun res!345296 () Bool)

(assert (=> b!552742 (=> (not res!345296) (not e!318885))))

(assert (=> b!552742 (= res!345296 (validKeyInArray!0 (select (arr!16724 a!3118) j!142)))))

(assert (= (and start!50594 res!345295) b!552737))

(assert (= (and b!552737 res!345289) b!552742))

(assert (= (and b!552742 res!345296) b!552735))

(assert (= (and b!552735 res!345287) b!552738))

(assert (= (and b!552738 res!345288) b!552740))

(assert (= (and b!552740 res!345291) b!552739))

(assert (= (and b!552739 res!345292) b!552734))

(assert (= (and b!552734 res!345293) b!552733))

(assert (= (and b!552733 res!345290) b!552741))

(assert (= (and b!552741 res!345294) b!552736))

(declare-fun m!529229 () Bool)

(assert (=> b!552736 m!529229))

(assert (=> b!552736 m!529229))

(declare-fun m!529231 () Bool)

(assert (=> b!552736 m!529231))

(declare-fun m!529233 () Bool)

(assert (=> b!552734 m!529233))

(assert (=> b!552733 m!529229))

(declare-fun m!529235 () Bool)

(assert (=> b!552733 m!529235))

(assert (=> b!552733 m!529229))

(declare-fun m!529237 () Bool)

(assert (=> b!552733 m!529237))

(declare-fun m!529239 () Bool)

(assert (=> b!552733 m!529239))

(assert (=> b!552733 m!529237))

(declare-fun m!529241 () Bool)

(assert (=> b!552733 m!529241))

(assert (=> b!552733 m!529235))

(assert (=> b!552733 m!529229))

(declare-fun m!529243 () Bool)

(assert (=> b!552733 m!529243))

(declare-fun m!529245 () Bool)

(assert (=> b!552733 m!529245))

(assert (=> b!552733 m!529237))

(assert (=> b!552733 m!529239))

(declare-fun m!529247 () Bool)

(assert (=> start!50594 m!529247))

(declare-fun m!529249 () Bool)

(assert (=> start!50594 m!529249))

(declare-fun m!529251 () Bool)

(assert (=> b!552740 m!529251))

(declare-fun m!529253 () Bool)

(assert (=> b!552739 m!529253))

(assert (=> b!552742 m!529229))

(assert (=> b!552742 m!529229))

(declare-fun m!529255 () Bool)

(assert (=> b!552742 m!529255))

(declare-fun m!529257 () Bool)

(assert (=> b!552741 m!529257))

(declare-fun m!529259 () Bool)

(assert (=> b!552741 m!529259))

(declare-fun m!529261 () Bool)

(assert (=> b!552735 m!529261))

(declare-fun m!529263 () Bool)

(assert (=> b!552738 m!529263))

(check-sat (not b!552738) (not b!552735) (not b!552739) (not start!50594) (not b!552741) (not b!552736) (not b!552740) (not b!552733) (not b!552734) (not b!552742))
(check-sat)
