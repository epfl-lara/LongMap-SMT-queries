; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50618 () Bool)

(assert start!50618)

(declare-fun b!553095 () Bool)

(declare-fun e!319041 () Bool)

(declare-fun e!319044 () Bool)

(assert (=> b!553095 (= e!319041 e!319044)))

(declare-fun res!345654 () Bool)

(assert (=> b!553095 (=> (not res!345654) (not e!319044))))

(declare-datatypes ((SeekEntryResult!5182 0))(
  ( (MissingZero!5182 (index!22955 (_ BitVec 32))) (Found!5182 (index!22956 (_ BitVec 32))) (Intermediate!5182 (undefined!5994 Bool) (index!22957 (_ BitVec 32)) (x!51891 (_ BitVec 32))) (Undefined!5182) (MissingVacant!5182 (index!22958 (_ BitVec 32))) )
))
(declare-fun lt!251220 () SeekEntryResult!5182)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553095 (= res!345654 (or (= lt!251220 (MissingZero!5182 i!1132)) (= lt!251220 (MissingVacant!5182 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34852 0))(
  ( (array!34853 (arr!16736 (Array (_ BitVec 32) (_ BitVec 64))) (size!17101 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34852)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34852 (_ BitVec 32)) SeekEntryResult!5182)

(assert (=> b!553095 (= lt!251220 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!319042 () Bool)

(declare-fun b!553096 () Bool)

(assert (=> b!553096 (= e!319042 (= (seekEntryOrOpen!0 (select (arr!16736 a!3118) j!142) a!3118 mask!3119) (Found!5182 j!142)))))

(declare-fun b!553097 () Bool)

(declare-fun res!345655 () Bool)

(assert (=> b!553097 (=> (not res!345655) (not e!319044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34852 (_ BitVec 32)) Bool)

(assert (=> b!553097 (= res!345655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553098 () Bool)

(declare-fun res!345653 () Bool)

(assert (=> b!553098 (=> (not res!345653) (not e!319041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553098 (= res!345653 (validKeyInArray!0 (select (arr!16736 a!3118) j!142)))))

(declare-fun b!553099 () Bool)

(declare-fun res!345657 () Bool)

(assert (=> b!553099 (=> (not res!345657) (not e!319041))))

(assert (=> b!553099 (= res!345657 (validKeyInArray!0 k0!1914))))

(declare-fun res!345651 () Bool)

(assert (=> start!50618 (=> (not res!345651) (not e!319041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50618 (= res!345651 (validMask!0 mask!3119))))

(assert (=> start!50618 e!319041))

(assert (=> start!50618 true))

(declare-fun array_inv!12619 (array!34852) Bool)

(assert (=> start!50618 (array_inv!12619 a!3118)))

(declare-fun b!553100 () Bool)

(declare-fun e!319040 () Bool)

(assert (=> b!553100 (= e!319040 (validKeyInArray!0 (select (store (arr!16736 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun b!553101 () Bool)

(declare-fun e!319039 () Bool)

(assert (=> b!553101 (= e!319044 e!319039)))

(declare-fun res!345652 () Bool)

(assert (=> b!553101 (=> (not res!345652) (not e!319039))))

(declare-fun lt!251217 () SeekEntryResult!5182)

(declare-fun lt!251218 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34852 (_ BitVec 32)) SeekEntryResult!5182)

(assert (=> b!553101 (= res!345652 (= lt!251217 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251218 (select (store (arr!16736 a!3118) i!1132 k0!1914) j!142) (array!34853 (store (arr!16736 a!3118) i!1132 k0!1914) (size!17101 a!3118)) mask!3119)))))

(declare-fun lt!251221 () (_ BitVec 32))

(assert (=> b!553101 (= lt!251217 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251221 (select (arr!16736 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553101 (= lt!251218 (toIndex!0 (select (store (arr!16736 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!553101 (= lt!251221 (toIndex!0 (select (arr!16736 a!3118) j!142) mask!3119))))

(declare-fun b!553102 () Bool)

(declare-fun res!345656 () Bool)

(assert (=> b!553102 (=> (not res!345656) (not e!319041))))

(declare-fun arrayContainsKey!0 (array!34852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553102 (= res!345656 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553103 () Bool)

(declare-fun res!345650 () Bool)

(assert (=> b!553103 (=> (not res!345650) (not e!319041))))

(assert (=> b!553103 (= res!345650 (and (= (size!17101 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17101 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17101 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553104 () Bool)

(declare-fun res!345658 () Bool)

(assert (=> b!553104 (=> (not res!345658) (not e!319044))))

(declare-datatypes ((List!10855 0))(
  ( (Nil!10852) (Cons!10851 (h!11836 (_ BitVec 64)) (t!17074 List!10855)) )
))
(declare-fun arrayNoDuplicates!0 (array!34852 (_ BitVec 32) List!10855) Bool)

(assert (=> b!553104 (= res!345658 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10852))))

(declare-fun b!553105 () Bool)

(assert (=> b!553105 (= e!319039 (not e!319040))))

(declare-fun res!345649 () Bool)

(assert (=> b!553105 (=> res!345649 e!319040)))

(get-info :version)

(assert (=> b!553105 (= res!345649 (or (not ((_ is Intermediate!5182) lt!251217)) (not (undefined!5994 lt!251217)) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!553105 e!319042))

(declare-fun res!345659 () Bool)

(assert (=> b!553105 (=> (not res!345659) (not e!319042))))

(assert (=> b!553105 (= res!345659 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17124 0))(
  ( (Unit!17125) )
))
(declare-fun lt!251219 () Unit!17124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17124)

(assert (=> b!553105 (= lt!251219 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50618 res!345651) b!553103))

(assert (= (and b!553103 res!345650) b!553098))

(assert (= (and b!553098 res!345653) b!553099))

(assert (= (and b!553099 res!345657) b!553102))

(assert (= (and b!553102 res!345656) b!553095))

(assert (= (and b!553095 res!345654) b!553097))

(assert (= (and b!553097 res!345655) b!553104))

(assert (= (and b!553104 res!345658) b!553101))

(assert (= (and b!553101 res!345652) b!553105))

(assert (= (and b!553105 res!345659) b!553096))

(assert (= (and b!553105 (not res!345649)) b!553100))

(declare-fun m!529661 () Bool)

(assert (=> b!553105 m!529661))

(declare-fun m!529663 () Bool)

(assert (=> b!553105 m!529663))

(declare-fun m!529665 () Bool)

(assert (=> b!553100 m!529665))

(declare-fun m!529667 () Bool)

(assert (=> b!553100 m!529667))

(assert (=> b!553100 m!529667))

(declare-fun m!529669 () Bool)

(assert (=> b!553100 m!529669))

(declare-fun m!529671 () Bool)

(assert (=> b!553102 m!529671))

(declare-fun m!529673 () Bool)

(assert (=> b!553097 m!529673))

(declare-fun m!529675 () Bool)

(assert (=> b!553095 m!529675))

(declare-fun m!529677 () Bool)

(assert (=> start!50618 m!529677))

(declare-fun m!529679 () Bool)

(assert (=> start!50618 m!529679))

(declare-fun m!529681 () Bool)

(assert (=> b!553101 m!529681))

(declare-fun m!529683 () Bool)

(assert (=> b!553101 m!529683))

(assert (=> b!553101 m!529681))

(assert (=> b!553101 m!529667))

(assert (=> b!553101 m!529667))

(declare-fun m!529685 () Bool)

(assert (=> b!553101 m!529685))

(assert (=> b!553101 m!529667))

(declare-fun m!529687 () Bool)

(assert (=> b!553101 m!529687))

(assert (=> b!553101 m!529665))

(assert (=> b!553101 m!529681))

(declare-fun m!529689 () Bool)

(assert (=> b!553101 m!529689))

(assert (=> b!553096 m!529681))

(assert (=> b!553096 m!529681))

(declare-fun m!529691 () Bool)

(assert (=> b!553096 m!529691))

(assert (=> b!553098 m!529681))

(assert (=> b!553098 m!529681))

(declare-fun m!529693 () Bool)

(assert (=> b!553098 m!529693))

(declare-fun m!529695 () Bool)

(assert (=> b!553104 m!529695))

(declare-fun m!529697 () Bool)

(assert (=> b!553099 m!529697))

(check-sat (not b!553097) (not b!553096) (not b!553104) (not b!553102) (not b!553099) (not b!553095) (not b!553098) (not b!553100) (not b!553101) (not b!553105) (not start!50618))
(check-sat)
