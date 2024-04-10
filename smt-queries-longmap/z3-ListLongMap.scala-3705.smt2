; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50848 () Bool)

(assert start!50848)

(declare-fun res!348916 () Bool)

(declare-fun e!320601 () Bool)

(assert (=> start!50848 (=> (not res!348916) (not e!320601))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50848 (= res!348916 (validMask!0 mask!3119))))

(assert (=> start!50848 e!320601))

(assert (=> start!50848 true))

(declare-datatypes ((array!35073 0))(
  ( (array!35074 (arr!16846 (Array (_ BitVec 32) (_ BitVec 64))) (size!17210 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35073)

(declare-fun array_inv!12642 (array!35073) Bool)

(assert (=> start!50848 (array_inv!12642 a!3118)))

(declare-fun b!556499 () Bool)

(declare-fun res!348911 () Bool)

(assert (=> b!556499 (=> (not res!348911) (not e!320601))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556499 (= res!348911 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556500 () Bool)

(declare-fun res!348920 () Bool)

(declare-fun e!320599 () Bool)

(assert (=> b!556500 (=> (not res!348920) (not e!320599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35073 (_ BitVec 32)) Bool)

(assert (=> b!556500 (= res!348920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556501 () Bool)

(assert (=> b!556501 (= e!320599 (not true))))

(declare-fun e!320600 () Bool)

(assert (=> b!556501 e!320600))

(declare-fun res!348918 () Bool)

(assert (=> b!556501 (=> (not res!348918) (not e!320600))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!556501 (= res!348918 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17364 0))(
  ( (Unit!17365) )
))
(declare-fun lt!252900 () Unit!17364)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35073 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17364)

(assert (=> b!556501 (= lt!252900 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556502 () Bool)

(declare-fun res!348913 () Bool)

(assert (=> b!556502 (=> (not res!348913) (not e!320601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556502 (= res!348913 (validKeyInArray!0 k0!1914))))

(declare-fun b!556503 () Bool)

(declare-fun res!348919 () Bool)

(assert (=> b!556503 (=> (not res!348919) (not e!320599))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5295 0))(
  ( (MissingZero!5295 (index!23407 (_ BitVec 32))) (Found!5295 (index!23408 (_ BitVec 32))) (Intermediate!5295 (undefined!6107 Bool) (index!23409 (_ BitVec 32)) (x!52297 (_ BitVec 32))) (Undefined!5295) (MissingVacant!5295 (index!23410 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35073 (_ BitVec 32)) SeekEntryResult!5295)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556503 (= res!348919 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16846 a!3118) j!142) mask!3119) (select (arr!16846 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16846 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16846 a!3118) i!1132 k0!1914) j!142) (array!35074 (store (arr!16846 a!3118) i!1132 k0!1914) (size!17210 a!3118)) mask!3119)))))

(declare-fun b!556504 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35073 (_ BitVec 32)) SeekEntryResult!5295)

(assert (=> b!556504 (= e!320600 (= (seekEntryOrOpen!0 (select (arr!16846 a!3118) j!142) a!3118 mask!3119) (Found!5295 j!142)))))

(declare-fun b!556505 () Bool)

(declare-fun res!348917 () Bool)

(assert (=> b!556505 (=> (not res!348917) (not e!320601))))

(assert (=> b!556505 (= res!348917 (and (= (size!17210 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17210 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17210 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556506 () Bool)

(declare-fun res!348912 () Bool)

(assert (=> b!556506 (=> (not res!348912) (not e!320601))))

(assert (=> b!556506 (= res!348912 (validKeyInArray!0 (select (arr!16846 a!3118) j!142)))))

(declare-fun b!556507 () Bool)

(declare-fun res!348915 () Bool)

(assert (=> b!556507 (=> (not res!348915) (not e!320599))))

(declare-datatypes ((List!10926 0))(
  ( (Nil!10923) (Cons!10922 (h!11907 (_ BitVec 64)) (t!17154 List!10926)) )
))
(declare-fun arrayNoDuplicates!0 (array!35073 (_ BitVec 32) List!10926) Bool)

(assert (=> b!556507 (= res!348915 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10923))))

(declare-fun b!556508 () Bool)

(assert (=> b!556508 (= e!320601 e!320599)))

(declare-fun res!348914 () Bool)

(assert (=> b!556508 (=> (not res!348914) (not e!320599))))

(declare-fun lt!252901 () SeekEntryResult!5295)

(assert (=> b!556508 (= res!348914 (or (= lt!252901 (MissingZero!5295 i!1132)) (= lt!252901 (MissingVacant!5295 i!1132))))))

(assert (=> b!556508 (= lt!252901 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50848 res!348916) b!556505))

(assert (= (and b!556505 res!348917) b!556506))

(assert (= (and b!556506 res!348912) b!556502))

(assert (= (and b!556502 res!348913) b!556499))

(assert (= (and b!556499 res!348911) b!556508))

(assert (= (and b!556508 res!348914) b!556500))

(assert (= (and b!556500 res!348920) b!556507))

(assert (= (and b!556507 res!348915) b!556503))

(assert (= (and b!556503 res!348919) b!556501))

(assert (= (and b!556501 res!348918) b!556504))

(declare-fun m!534507 () Bool)

(assert (=> b!556501 m!534507))

(declare-fun m!534509 () Bool)

(assert (=> b!556501 m!534509))

(declare-fun m!534511 () Bool)

(assert (=> b!556499 m!534511))

(declare-fun m!534513 () Bool)

(assert (=> b!556507 m!534513))

(declare-fun m!534515 () Bool)

(assert (=> b!556504 m!534515))

(assert (=> b!556504 m!534515))

(declare-fun m!534517 () Bool)

(assert (=> b!556504 m!534517))

(declare-fun m!534519 () Bool)

(assert (=> b!556508 m!534519))

(declare-fun m!534521 () Bool)

(assert (=> b!556500 m!534521))

(assert (=> b!556503 m!534515))

(declare-fun m!534523 () Bool)

(assert (=> b!556503 m!534523))

(assert (=> b!556503 m!534515))

(declare-fun m!534525 () Bool)

(assert (=> b!556503 m!534525))

(declare-fun m!534527 () Bool)

(assert (=> b!556503 m!534527))

(assert (=> b!556503 m!534525))

(declare-fun m!534529 () Bool)

(assert (=> b!556503 m!534529))

(assert (=> b!556503 m!534523))

(assert (=> b!556503 m!534515))

(declare-fun m!534531 () Bool)

(assert (=> b!556503 m!534531))

(declare-fun m!534533 () Bool)

(assert (=> b!556503 m!534533))

(assert (=> b!556503 m!534525))

(assert (=> b!556503 m!534527))

(declare-fun m!534535 () Bool)

(assert (=> b!556502 m!534535))

(declare-fun m!534537 () Bool)

(assert (=> start!50848 m!534537))

(declare-fun m!534539 () Bool)

(assert (=> start!50848 m!534539))

(assert (=> b!556506 m!534515))

(assert (=> b!556506 m!534515))

(declare-fun m!534541 () Bool)

(assert (=> b!556506 m!534541))

(check-sat (not b!556504) (not b!556507) (not start!50848) (not b!556503) (not b!556508) (not b!556501) (not b!556502) (not b!556500) (not b!556506) (not b!556499))
(check-sat)
