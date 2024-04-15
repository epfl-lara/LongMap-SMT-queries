; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50696 () Bool)

(assert start!50696)

(declare-fun b!554279 () Bool)

(declare-fun e!319568 () Bool)

(declare-fun e!319567 () Bool)

(assert (=> b!554279 (= e!319568 e!319567)))

(declare-fun res!346837 () Bool)

(assert (=> b!554279 (=> (not res!346837) (not e!319567))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!251588 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34930 0))(
  ( (array!34931 (arr!16775 (Array (_ BitVec 32) (_ BitVec 64))) (size!17140 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34930)

(declare-datatypes ((SeekEntryResult!5221 0))(
  ( (MissingZero!5221 (index!23111 (_ BitVec 32))) (Found!5221 (index!23112 (_ BitVec 32))) (Intermediate!5221 (undefined!6033 Bool) (index!23113 (_ BitVec 32)) (x!52034 (_ BitVec 32))) (Undefined!5221) (MissingVacant!5221 (index!23114 (_ BitVec 32))) )
))
(declare-fun lt!251589 () SeekEntryResult!5221)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34930 (_ BitVec 32)) SeekEntryResult!5221)

(assert (=> b!554279 (= res!346837 (= lt!251589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251588 (select (store (arr!16775 a!3118) i!1132 k0!1914) j!142) (array!34931 (store (arr!16775 a!3118) i!1132 k0!1914) (size!17140 a!3118)) mask!3119)))))

(declare-fun lt!251592 () (_ BitVec 32))

(assert (=> b!554279 (= lt!251589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251592 (select (arr!16775 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554279 (= lt!251588 (toIndex!0 (select (store (arr!16775 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554279 (= lt!251592 (toIndex!0 (select (arr!16775 a!3118) j!142) mask!3119))))

(declare-fun b!554280 () Bool)

(declare-fun res!346833 () Bool)

(assert (=> b!554280 (=> (not res!346833) (not e!319568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34930 (_ BitVec 32)) Bool)

(assert (=> b!554280 (= res!346833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!346839 () Bool)

(declare-fun e!319569 () Bool)

(assert (=> start!50696 (=> (not res!346839) (not e!319569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50696 (= res!346839 (validMask!0 mask!3119))))

(assert (=> start!50696 e!319569))

(assert (=> start!50696 true))

(declare-fun array_inv!12658 (array!34930) Bool)

(assert (=> start!50696 (array_inv!12658 a!3118)))

(declare-fun b!554281 () Bool)

(declare-fun res!346836 () Bool)

(assert (=> b!554281 (=> (not res!346836) (not e!319569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554281 (= res!346836 (validKeyInArray!0 (select (arr!16775 a!3118) j!142)))))

(declare-fun b!554282 () Bool)

(declare-fun res!346838 () Bool)

(assert (=> b!554282 (=> (not res!346838) (not e!319569))))

(declare-fun arrayContainsKey!0 (array!34930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554282 (= res!346838 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554283 () Bool)

(declare-fun res!346840 () Bool)

(assert (=> b!554283 (=> (not res!346840) (not e!319568))))

(declare-datatypes ((List!10894 0))(
  ( (Nil!10891) (Cons!10890 (h!11875 (_ BitVec 64)) (t!17113 List!10894)) )
))
(declare-fun arrayNoDuplicates!0 (array!34930 (_ BitVec 32) List!10894) Bool)

(assert (=> b!554283 (= res!346840 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10891))))

(declare-fun b!554284 () Bool)

(declare-fun res!346834 () Bool)

(assert (=> b!554284 (=> (not res!346834) (not e!319569))))

(assert (=> b!554284 (= res!346834 (and (= (size!17140 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17140 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17140 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554285 () Bool)

(assert (=> b!554285 (= e!319569 e!319568)))

(declare-fun res!346835 () Bool)

(assert (=> b!554285 (=> (not res!346835) (not e!319568))))

(declare-fun lt!251593 () SeekEntryResult!5221)

(assert (=> b!554285 (= res!346835 (or (= lt!251593 (MissingZero!5221 i!1132)) (= lt!251593 (MissingVacant!5221 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34930 (_ BitVec 32)) SeekEntryResult!5221)

(assert (=> b!554285 (= lt!251593 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554286 () Bool)

(assert (=> b!554286 (= e!319567 (not true))))

(declare-fun lt!251590 () SeekEntryResult!5221)

(get-info :version)

(assert (=> b!554286 (and (= lt!251590 (Found!5221 j!142)) (or (undefined!6033 lt!251589) (not ((_ is Intermediate!5221) lt!251589)) (= (select (arr!16775 a!3118) (index!23113 lt!251589)) (select (arr!16775 a!3118) j!142)) (not (= (select (arr!16775 a!3118) (index!23113 lt!251589)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251590 (MissingZero!5221 (index!23113 lt!251589)))))))

(assert (=> b!554286 (= lt!251590 (seekEntryOrOpen!0 (select (arr!16775 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554286 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17202 0))(
  ( (Unit!17203) )
))
(declare-fun lt!251591 () Unit!17202)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17202)

(assert (=> b!554286 (= lt!251591 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554287 () Bool)

(declare-fun res!346841 () Bool)

(assert (=> b!554287 (=> (not res!346841) (not e!319569))))

(assert (=> b!554287 (= res!346841 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50696 res!346839) b!554284))

(assert (= (and b!554284 res!346834) b!554281))

(assert (= (and b!554281 res!346836) b!554287))

(assert (= (and b!554287 res!346841) b!554282))

(assert (= (and b!554282 res!346838) b!554285))

(assert (= (and b!554285 res!346835) b!554280))

(assert (= (and b!554280 res!346833) b!554283))

(assert (= (and b!554283 res!346840) b!554279))

(assert (= (and b!554279 res!346837) b!554286))

(declare-fun m!531101 () Bool)

(assert (=> start!50696 m!531101))

(declare-fun m!531103 () Bool)

(assert (=> start!50696 m!531103))

(declare-fun m!531105 () Bool)

(assert (=> b!554283 m!531105))

(declare-fun m!531107 () Bool)

(assert (=> b!554280 m!531107))

(declare-fun m!531109 () Bool)

(assert (=> b!554282 m!531109))

(declare-fun m!531111 () Bool)

(assert (=> b!554279 m!531111))

(declare-fun m!531113 () Bool)

(assert (=> b!554279 m!531113))

(assert (=> b!554279 m!531111))

(assert (=> b!554279 m!531111))

(declare-fun m!531115 () Bool)

(assert (=> b!554279 m!531115))

(declare-fun m!531117 () Bool)

(assert (=> b!554279 m!531117))

(assert (=> b!554279 m!531117))

(declare-fun m!531119 () Bool)

(assert (=> b!554279 m!531119))

(declare-fun m!531121 () Bool)

(assert (=> b!554279 m!531121))

(assert (=> b!554279 m!531117))

(declare-fun m!531123 () Bool)

(assert (=> b!554279 m!531123))

(declare-fun m!531125 () Bool)

(assert (=> b!554287 m!531125))

(assert (=> b!554281 m!531111))

(assert (=> b!554281 m!531111))

(declare-fun m!531127 () Bool)

(assert (=> b!554281 m!531127))

(declare-fun m!531129 () Bool)

(assert (=> b!554285 m!531129))

(assert (=> b!554286 m!531111))

(declare-fun m!531131 () Bool)

(assert (=> b!554286 m!531131))

(declare-fun m!531133 () Bool)

(assert (=> b!554286 m!531133))

(declare-fun m!531135 () Bool)

(assert (=> b!554286 m!531135))

(assert (=> b!554286 m!531111))

(declare-fun m!531137 () Bool)

(assert (=> b!554286 m!531137))

(check-sat (not b!554280) (not b!554279) (not b!554285) (not b!554282) (not b!554281) (not b!554287) (not b!554283) (not start!50696) (not b!554286))
(check-sat)
