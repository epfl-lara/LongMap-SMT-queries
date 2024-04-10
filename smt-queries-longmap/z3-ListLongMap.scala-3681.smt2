; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50704 () Bool)

(assert start!50704)

(declare-fun b!554492 () Bool)

(declare-fun res!346912 () Bool)

(declare-fun e!319719 () Bool)

(assert (=> b!554492 (=> (not res!346912) (not e!319719))))

(declare-datatypes ((array!34929 0))(
  ( (array!34930 (arr!16774 (Array (_ BitVec 32) (_ BitVec 64))) (size!17138 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34929)

(declare-datatypes ((List!10854 0))(
  ( (Nil!10851) (Cons!10850 (h!11835 (_ BitVec 64)) (t!17082 List!10854)) )
))
(declare-fun arrayNoDuplicates!0 (array!34929 (_ BitVec 32) List!10854) Bool)

(assert (=> b!554492 (= res!346912 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10851))))

(declare-fun res!346911 () Bool)

(declare-fun e!319717 () Bool)

(assert (=> start!50704 (=> (not res!346911) (not e!319717))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50704 (= res!346911 (validMask!0 mask!3119))))

(assert (=> start!50704 e!319717))

(assert (=> start!50704 true))

(declare-fun array_inv!12570 (array!34929) Bool)

(assert (=> start!50704 (array_inv!12570 a!3118)))

(declare-fun b!554493 () Bool)

(assert (=> b!554493 (= e!319719 (not true))))

(declare-fun e!319716 () Bool)

(assert (=> b!554493 e!319716))

(declare-fun res!346904 () Bool)

(assert (=> b!554493 (=> (not res!346904) (not e!319716))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34929 (_ BitVec 32)) Bool)

(assert (=> b!554493 (= res!346904 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17220 0))(
  ( (Unit!17221) )
))
(declare-fun lt!251803 () Unit!17220)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17220)

(assert (=> b!554493 (= lt!251803 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554494 () Bool)

(declare-fun res!346906 () Bool)

(assert (=> b!554494 (=> (not res!346906) (not e!319717))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554494 (= res!346906 (and (= (size!17138 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17138 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17138 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554495 () Bool)

(declare-fun res!346910 () Bool)

(assert (=> b!554495 (=> (not res!346910) (not e!319717))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554495 (= res!346910 (validKeyInArray!0 k0!1914))))

(declare-fun b!554496 () Bool)

(declare-fun res!346913 () Bool)

(assert (=> b!554496 (=> (not res!346913) (not e!319719))))

(declare-datatypes ((SeekEntryResult!5223 0))(
  ( (MissingZero!5223 (index!23119 (_ BitVec 32))) (Found!5223 (index!23120 (_ BitVec 32))) (Intermediate!5223 (undefined!6035 Bool) (index!23121 (_ BitVec 32)) (x!52033 (_ BitVec 32))) (Undefined!5223) (MissingVacant!5223 (index!23122 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34929 (_ BitVec 32)) SeekEntryResult!5223)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554496 (= res!346913 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16774 a!3118) j!142) mask!3119) (select (arr!16774 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16774 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16774 a!3118) i!1132 k0!1914) j!142) (array!34930 (store (arr!16774 a!3118) i!1132 k0!1914) (size!17138 a!3118)) mask!3119)))))

(declare-fun b!554497 () Bool)

(assert (=> b!554497 (= e!319717 e!319719)))

(declare-fun res!346908 () Bool)

(assert (=> b!554497 (=> (not res!346908) (not e!319719))))

(declare-fun lt!251802 () SeekEntryResult!5223)

(assert (=> b!554497 (= res!346908 (or (= lt!251802 (MissingZero!5223 i!1132)) (= lt!251802 (MissingVacant!5223 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34929 (_ BitVec 32)) SeekEntryResult!5223)

(assert (=> b!554497 (= lt!251802 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554498 () Bool)

(declare-fun res!346905 () Bool)

(assert (=> b!554498 (=> (not res!346905) (not e!319717))))

(assert (=> b!554498 (= res!346905 (validKeyInArray!0 (select (arr!16774 a!3118) j!142)))))

(declare-fun b!554499 () Bool)

(declare-fun res!346907 () Bool)

(assert (=> b!554499 (=> (not res!346907) (not e!319719))))

(assert (=> b!554499 (= res!346907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554500 () Bool)

(assert (=> b!554500 (= e!319716 (= (seekEntryOrOpen!0 (select (arr!16774 a!3118) j!142) a!3118 mask!3119) (Found!5223 j!142)))))

(declare-fun b!554501 () Bool)

(declare-fun res!346909 () Bool)

(assert (=> b!554501 (=> (not res!346909) (not e!319717))))

(declare-fun arrayContainsKey!0 (array!34929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554501 (= res!346909 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50704 res!346911) b!554494))

(assert (= (and b!554494 res!346906) b!554498))

(assert (= (and b!554498 res!346905) b!554495))

(assert (= (and b!554495 res!346910) b!554501))

(assert (= (and b!554501 res!346909) b!554497))

(assert (= (and b!554497 res!346908) b!554499))

(assert (= (and b!554499 res!346907) b!554492))

(assert (= (and b!554492 res!346912) b!554496))

(assert (= (and b!554496 res!346913) b!554493))

(assert (= (and b!554493 res!346904) b!554500))

(declare-fun m!531801 () Bool)

(assert (=> b!554498 m!531801))

(assert (=> b!554498 m!531801))

(declare-fun m!531803 () Bool)

(assert (=> b!554498 m!531803))

(assert (=> b!554500 m!531801))

(assert (=> b!554500 m!531801))

(declare-fun m!531805 () Bool)

(assert (=> b!554500 m!531805))

(declare-fun m!531807 () Bool)

(assert (=> start!50704 m!531807))

(declare-fun m!531809 () Bool)

(assert (=> start!50704 m!531809))

(declare-fun m!531811 () Bool)

(assert (=> b!554492 m!531811))

(declare-fun m!531813 () Bool)

(assert (=> b!554495 m!531813))

(declare-fun m!531815 () Bool)

(assert (=> b!554497 m!531815))

(declare-fun m!531817 () Bool)

(assert (=> b!554501 m!531817))

(declare-fun m!531819 () Bool)

(assert (=> b!554493 m!531819))

(declare-fun m!531821 () Bool)

(assert (=> b!554493 m!531821))

(assert (=> b!554496 m!531801))

(declare-fun m!531823 () Bool)

(assert (=> b!554496 m!531823))

(assert (=> b!554496 m!531801))

(declare-fun m!531825 () Bool)

(assert (=> b!554496 m!531825))

(declare-fun m!531827 () Bool)

(assert (=> b!554496 m!531827))

(assert (=> b!554496 m!531825))

(declare-fun m!531829 () Bool)

(assert (=> b!554496 m!531829))

(assert (=> b!554496 m!531823))

(assert (=> b!554496 m!531801))

(declare-fun m!531831 () Bool)

(assert (=> b!554496 m!531831))

(declare-fun m!531833 () Bool)

(assert (=> b!554496 m!531833))

(assert (=> b!554496 m!531825))

(assert (=> b!554496 m!531827))

(declare-fun m!531835 () Bool)

(assert (=> b!554499 m!531835))

(check-sat (not b!554495) (not b!554500) (not b!554492) (not b!554493) (not b!554501) (not b!554499) (not b!554498) (not start!50704) (not b!554496) (not b!554497))
(check-sat)
