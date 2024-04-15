; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50612 () Bool)

(assert start!50612)

(declare-fun b!553003 () Bool)

(declare-fun e!319000 () Bool)

(assert (=> b!553003 (= e!319000 (not true))))

(declare-fun e!318999 () Bool)

(assert (=> b!553003 e!318999))

(declare-fun res!345566 () Bool)

(assert (=> b!553003 (=> (not res!345566) (not e!318999))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34846 0))(
  ( (array!34847 (arr!16733 (Array (_ BitVec 32) (_ BitVec 64))) (size!17098 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34846)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34846 (_ BitVec 32)) Bool)

(assert (=> b!553003 (= res!345566 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17118 0))(
  ( (Unit!17119) )
))
(declare-fun lt!251194 () Unit!17118)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17118)

(assert (=> b!553003 (= lt!251194 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553004 () Bool)

(declare-fun e!319002 () Bool)

(assert (=> b!553004 (= e!319002 e!319000)))

(declare-fun res!345559 () Bool)

(assert (=> b!553004 (=> (not res!345559) (not e!319000))))

(declare-datatypes ((SeekEntryResult!5179 0))(
  ( (MissingZero!5179 (index!22943 (_ BitVec 32))) (Found!5179 (index!22944 (_ BitVec 32))) (Intermediate!5179 (undefined!5991 Bool) (index!22945 (_ BitVec 32)) (x!51880 (_ BitVec 32))) (Undefined!5179) (MissingVacant!5179 (index!22946 (_ BitVec 32))) )
))
(declare-fun lt!251193 () SeekEntryResult!5179)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553004 (= res!345559 (or (= lt!251193 (MissingZero!5179 i!1132)) (= lt!251193 (MissingVacant!5179 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34846 (_ BitVec 32)) SeekEntryResult!5179)

(assert (=> b!553004 (= lt!251193 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553005 () Bool)

(assert (=> b!553005 (= e!318999 (= (seekEntryOrOpen!0 (select (arr!16733 a!3118) j!142) a!3118 mask!3119) (Found!5179 j!142)))))

(declare-fun b!553006 () Bool)

(declare-fun res!345564 () Bool)

(assert (=> b!553006 (=> (not res!345564) (not e!319000))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34846 (_ BitVec 32)) SeekEntryResult!5179)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553006 (= res!345564 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16733 a!3118) j!142) mask!3119) (select (arr!16733 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16733 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16733 a!3118) i!1132 k0!1914) j!142) (array!34847 (store (arr!16733 a!3118) i!1132 k0!1914) (size!17098 a!3118)) mask!3119)))))

(declare-fun b!553007 () Bool)

(declare-fun res!345561 () Bool)

(assert (=> b!553007 (=> (not res!345561) (not e!319002))))

(assert (=> b!553007 (= res!345561 (and (= (size!17098 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17098 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17098 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553008 () Bool)

(declare-fun res!345560 () Bool)

(assert (=> b!553008 (=> (not res!345560) (not e!319000))))

(assert (=> b!553008 (= res!345560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553009 () Bool)

(declare-fun res!345557 () Bool)

(assert (=> b!553009 (=> (not res!345557) (not e!319002))))

(declare-fun arrayContainsKey!0 (array!34846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553009 (= res!345557 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!345562 () Bool)

(assert (=> start!50612 (=> (not res!345562) (not e!319002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50612 (= res!345562 (validMask!0 mask!3119))))

(assert (=> start!50612 e!319002))

(assert (=> start!50612 true))

(declare-fun array_inv!12616 (array!34846) Bool)

(assert (=> start!50612 (array_inv!12616 a!3118)))

(declare-fun b!553010 () Bool)

(declare-fun res!345565 () Bool)

(assert (=> b!553010 (=> (not res!345565) (not e!319002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553010 (= res!345565 (validKeyInArray!0 (select (arr!16733 a!3118) j!142)))))

(declare-fun b!553011 () Bool)

(declare-fun res!345563 () Bool)

(assert (=> b!553011 (=> (not res!345563) (not e!319000))))

(declare-datatypes ((List!10852 0))(
  ( (Nil!10849) (Cons!10848 (h!11833 (_ BitVec 64)) (t!17071 List!10852)) )
))
(declare-fun arrayNoDuplicates!0 (array!34846 (_ BitVec 32) List!10852) Bool)

(assert (=> b!553011 (= res!345563 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10849))))

(declare-fun b!553012 () Bool)

(declare-fun res!345558 () Bool)

(assert (=> b!553012 (=> (not res!345558) (not e!319002))))

(assert (=> b!553012 (= res!345558 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50612 res!345562) b!553007))

(assert (= (and b!553007 res!345561) b!553010))

(assert (= (and b!553010 res!345565) b!553012))

(assert (= (and b!553012 res!345558) b!553009))

(assert (= (and b!553009 res!345557) b!553004))

(assert (= (and b!553004 res!345559) b!553008))

(assert (= (and b!553008 res!345560) b!553011))

(assert (= (and b!553011 res!345563) b!553006))

(assert (= (and b!553006 res!345564) b!553003))

(assert (= (and b!553003 res!345566) b!553005))

(declare-fun m!529553 () Bool)

(assert (=> b!553010 m!529553))

(assert (=> b!553010 m!529553))

(declare-fun m!529555 () Bool)

(assert (=> b!553010 m!529555))

(declare-fun m!529557 () Bool)

(assert (=> b!553012 m!529557))

(assert (=> b!553005 m!529553))

(assert (=> b!553005 m!529553))

(declare-fun m!529559 () Bool)

(assert (=> b!553005 m!529559))

(declare-fun m!529561 () Bool)

(assert (=> b!553004 m!529561))

(declare-fun m!529563 () Bool)

(assert (=> b!553003 m!529563))

(declare-fun m!529565 () Bool)

(assert (=> b!553003 m!529565))

(declare-fun m!529567 () Bool)

(assert (=> b!553011 m!529567))

(declare-fun m!529569 () Bool)

(assert (=> b!553008 m!529569))

(declare-fun m!529571 () Bool)

(assert (=> b!553009 m!529571))

(assert (=> b!553006 m!529553))

(declare-fun m!529573 () Bool)

(assert (=> b!553006 m!529573))

(assert (=> b!553006 m!529553))

(declare-fun m!529575 () Bool)

(assert (=> b!553006 m!529575))

(declare-fun m!529577 () Bool)

(assert (=> b!553006 m!529577))

(assert (=> b!553006 m!529575))

(declare-fun m!529579 () Bool)

(assert (=> b!553006 m!529579))

(assert (=> b!553006 m!529573))

(assert (=> b!553006 m!529553))

(declare-fun m!529581 () Bool)

(assert (=> b!553006 m!529581))

(declare-fun m!529583 () Bool)

(assert (=> b!553006 m!529583))

(assert (=> b!553006 m!529575))

(assert (=> b!553006 m!529577))

(declare-fun m!529585 () Bool)

(assert (=> start!50612 m!529585))

(declare-fun m!529587 () Bool)

(assert (=> start!50612 m!529587))

(check-sat (not b!553004) (not b!553006) (not b!553003) (not b!553005) (not b!553011) (not b!553009) (not start!50612) (not b!553008) (not b!553010) (not b!553012))
(check-sat)
