; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51742 () Bool)

(assert start!51742)

(declare-fun b!566123 () Bool)

(declare-fun res!357095 () Bool)

(declare-fun e!325834 () Bool)

(assert (=> b!566123 (=> (not res!357095) (not e!325834))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35550 0))(
  ( (array!35551 (arr!17074 (Array (_ BitVec 32) (_ BitVec 64))) (size!17438 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35550)

(declare-datatypes ((SeekEntryResult!5523 0))(
  ( (MissingZero!5523 (index!24319 (_ BitVec 32))) (Found!5523 (index!24320 (_ BitVec 32))) (Intermediate!5523 (undefined!6335 Bool) (index!24321 (_ BitVec 32)) (x!53184 (_ BitVec 32))) (Undefined!5523) (MissingVacant!5523 (index!24322 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35550 (_ BitVec 32)) SeekEntryResult!5523)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566123 (= res!357095 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17074 a!3118) j!142) mask!3119) (select (arr!17074 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17074 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17074 a!3118) i!1132 k0!1914) j!142) (array!35551 (store (arr!17074 a!3118) i!1132 k0!1914) (size!17438 a!3118)) mask!3119)))))

(declare-fun b!566124 () Bool)

(declare-fun e!325833 () Bool)

(assert (=> b!566124 (= e!325833 e!325834)))

(declare-fun res!357093 () Bool)

(assert (=> b!566124 (=> (not res!357093) (not e!325834))))

(declare-fun lt!258024 () SeekEntryResult!5523)

(assert (=> b!566124 (= res!357093 (or (= lt!258024 (MissingZero!5523 i!1132)) (= lt!258024 (MissingVacant!5523 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35550 (_ BitVec 32)) SeekEntryResult!5523)

(assert (=> b!566124 (= lt!258024 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!566125 () Bool)

(declare-fun res!357100 () Bool)

(assert (=> b!566125 (=> (not res!357100) (not e!325834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35550 (_ BitVec 32)) Bool)

(assert (=> b!566125 (= res!357100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566126 () Bool)

(declare-fun res!357094 () Bool)

(assert (=> b!566126 (=> (not res!357094) (not e!325833))))

(assert (=> b!566126 (= res!357094 (and (= (size!17438 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17438 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17438 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566127 () Bool)

(declare-fun res!357098 () Bool)

(assert (=> b!566127 (=> (not res!357098) (not e!325833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566127 (= res!357098 (validKeyInArray!0 k0!1914))))

(declare-fun b!566128 () Bool)

(declare-fun res!357096 () Bool)

(assert (=> b!566128 (=> (not res!357096) (not e!325833))))

(assert (=> b!566128 (= res!357096 (validKeyInArray!0 (select (arr!17074 a!3118) j!142)))))

(declare-fun b!566129 () Bool)

(declare-fun e!325836 () Bool)

(assert (=> b!566129 (= e!325836 (= (seekEntryOrOpen!0 (select (arr!17074 a!3118) j!142) a!3118 mask!3119) (Found!5523 j!142)))))

(declare-fun b!566131 () Bool)

(declare-fun res!357097 () Bool)

(assert (=> b!566131 (=> (not res!357097) (not e!325834))))

(declare-datatypes ((List!11154 0))(
  ( (Nil!11151) (Cons!11150 (h!12156 (_ BitVec 64)) (t!17382 List!11154)) )
))
(declare-fun arrayNoDuplicates!0 (array!35550 (_ BitVec 32) List!11154) Bool)

(assert (=> b!566131 (= res!357097 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11151))))

(declare-fun b!566132 () Bool)

(assert (=> b!566132 (= e!325834 (not true))))

(assert (=> b!566132 e!325836))

(declare-fun res!357099 () Bool)

(assert (=> b!566132 (=> (not res!357099) (not e!325836))))

(assert (=> b!566132 (= res!357099 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17748 0))(
  ( (Unit!17749) )
))
(declare-fun lt!258025 () Unit!17748)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17748)

(assert (=> b!566132 (= lt!258025 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566130 () Bool)

(declare-fun res!357092 () Bool)

(assert (=> b!566130 (=> (not res!357092) (not e!325833))))

(declare-fun arrayContainsKey!0 (array!35550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566130 (= res!357092 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!357101 () Bool)

(assert (=> start!51742 (=> (not res!357101) (not e!325833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51742 (= res!357101 (validMask!0 mask!3119))))

(assert (=> start!51742 e!325833))

(assert (=> start!51742 true))

(declare-fun array_inv!12870 (array!35550) Bool)

(assert (=> start!51742 (array_inv!12870 a!3118)))

(assert (= (and start!51742 res!357101) b!566126))

(assert (= (and b!566126 res!357094) b!566128))

(assert (= (and b!566128 res!357096) b!566127))

(assert (= (and b!566127 res!357098) b!566130))

(assert (= (and b!566130 res!357092) b!566124))

(assert (= (and b!566124 res!357093) b!566125))

(assert (= (and b!566125 res!357100) b!566131))

(assert (= (and b!566131 res!357097) b!566123))

(assert (= (and b!566123 res!357095) b!566132))

(assert (= (and b!566132 res!357099) b!566129))

(declare-fun m!544719 () Bool)

(assert (=> b!566132 m!544719))

(declare-fun m!544721 () Bool)

(assert (=> b!566132 m!544721))

(declare-fun m!544723 () Bool)

(assert (=> b!566129 m!544723))

(assert (=> b!566129 m!544723))

(declare-fun m!544725 () Bool)

(assert (=> b!566129 m!544725))

(assert (=> b!566128 m!544723))

(assert (=> b!566128 m!544723))

(declare-fun m!544727 () Bool)

(assert (=> b!566128 m!544727))

(declare-fun m!544729 () Bool)

(assert (=> b!566127 m!544729))

(assert (=> b!566123 m!544723))

(declare-fun m!544731 () Bool)

(assert (=> b!566123 m!544731))

(assert (=> b!566123 m!544723))

(declare-fun m!544733 () Bool)

(assert (=> b!566123 m!544733))

(declare-fun m!544735 () Bool)

(assert (=> b!566123 m!544735))

(assert (=> b!566123 m!544733))

(declare-fun m!544737 () Bool)

(assert (=> b!566123 m!544737))

(assert (=> b!566123 m!544731))

(assert (=> b!566123 m!544723))

(declare-fun m!544739 () Bool)

(assert (=> b!566123 m!544739))

(declare-fun m!544741 () Bool)

(assert (=> b!566123 m!544741))

(assert (=> b!566123 m!544733))

(assert (=> b!566123 m!544735))

(declare-fun m!544743 () Bool)

(assert (=> b!566125 m!544743))

(declare-fun m!544745 () Bool)

(assert (=> b!566124 m!544745))

(declare-fun m!544747 () Bool)

(assert (=> b!566131 m!544747))

(declare-fun m!544749 () Bool)

(assert (=> b!566130 m!544749))

(declare-fun m!544751 () Bool)

(assert (=> start!51742 m!544751))

(declare-fun m!544753 () Bool)

(assert (=> start!51742 m!544753))

(check-sat (not start!51742) (not b!566125) (not b!566123) (not b!566130) (not b!566124) (not b!566132) (not b!566131) (not b!566127) (not b!566129) (not b!566128))
(check-sat)
