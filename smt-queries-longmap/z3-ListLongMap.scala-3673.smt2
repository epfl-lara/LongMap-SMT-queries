; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50642 () Bool)

(assert start!50642)

(declare-fun b!553462 () Bool)

(declare-fun res!346018 () Bool)

(declare-fun e!319206 () Bool)

(assert (=> b!553462 (=> (not res!346018) (not e!319206))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34876 0))(
  ( (array!34877 (arr!16748 (Array (_ BitVec 32) (_ BitVec 64))) (size!17113 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34876)

(declare-datatypes ((SeekEntryResult!5194 0))(
  ( (MissingZero!5194 (index!23003 (_ BitVec 32))) (Found!5194 (index!23004 (_ BitVec 32))) (Intermediate!5194 (undefined!6006 Bool) (index!23005 (_ BitVec 32)) (x!51935 (_ BitVec 32))) (Undefined!5194) (MissingVacant!5194 (index!23006 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34876 (_ BitVec 32)) SeekEntryResult!5194)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553462 (= res!346018 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16748 a!3118) j!142) mask!3119) (select (arr!16748 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16748 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16748 a!3118) i!1132 k0!1914) j!142) (array!34877 (store (arr!16748 a!3118) i!1132 k0!1914) (size!17113 a!3118)) mask!3119)))))

(declare-fun b!553463 () Bool)

(assert (=> b!553463 (= e!319206 (not true))))

(declare-fun e!319208 () Bool)

(assert (=> b!553463 e!319208))

(declare-fun res!346020 () Bool)

(assert (=> b!553463 (=> (not res!346020) (not e!319208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34876 (_ BitVec 32)) Bool)

(assert (=> b!553463 (= res!346020 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17148 0))(
  ( (Unit!17149) )
))
(declare-fun lt!251337 () Unit!17148)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17148)

(assert (=> b!553463 (= lt!251337 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553464 () Bool)

(declare-fun res!346017 () Bool)

(declare-fun e!319209 () Bool)

(assert (=> b!553464 (=> (not res!346017) (not e!319209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553464 (= res!346017 (validKeyInArray!0 (select (arr!16748 a!3118) j!142)))))

(declare-fun res!346024 () Bool)

(assert (=> start!50642 (=> (not res!346024) (not e!319209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50642 (= res!346024 (validMask!0 mask!3119))))

(assert (=> start!50642 e!319209))

(assert (=> start!50642 true))

(declare-fun array_inv!12631 (array!34876) Bool)

(assert (=> start!50642 (array_inv!12631 a!3118)))

(declare-fun b!553465 () Bool)

(assert (=> b!553465 (= e!319209 e!319206)))

(declare-fun res!346016 () Bool)

(assert (=> b!553465 (=> (not res!346016) (not e!319206))))

(declare-fun lt!251338 () SeekEntryResult!5194)

(assert (=> b!553465 (= res!346016 (or (= lt!251338 (MissingZero!5194 i!1132)) (= lt!251338 (MissingVacant!5194 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34876 (_ BitVec 32)) SeekEntryResult!5194)

(assert (=> b!553465 (= lt!251338 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553466 () Bool)

(declare-fun res!346021 () Bool)

(assert (=> b!553466 (=> (not res!346021) (not e!319206))))

(declare-datatypes ((List!10867 0))(
  ( (Nil!10864) (Cons!10863 (h!11848 (_ BitVec 64)) (t!17086 List!10867)) )
))
(declare-fun arrayNoDuplicates!0 (array!34876 (_ BitVec 32) List!10867) Bool)

(assert (=> b!553466 (= res!346021 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10864))))

(declare-fun b!553467 () Bool)

(declare-fun res!346025 () Bool)

(assert (=> b!553467 (=> (not res!346025) (not e!319209))))

(assert (=> b!553467 (= res!346025 (and (= (size!17113 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17113 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17113 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553468 () Bool)

(assert (=> b!553468 (= e!319208 (= (seekEntryOrOpen!0 (select (arr!16748 a!3118) j!142) a!3118 mask!3119) (Found!5194 j!142)))))

(declare-fun b!553469 () Bool)

(declare-fun res!346022 () Bool)

(assert (=> b!553469 (=> (not res!346022) (not e!319206))))

(assert (=> b!553469 (= res!346022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553470 () Bool)

(declare-fun res!346023 () Bool)

(assert (=> b!553470 (=> (not res!346023) (not e!319209))))

(declare-fun arrayContainsKey!0 (array!34876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553470 (= res!346023 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553471 () Bool)

(declare-fun res!346019 () Bool)

(assert (=> b!553471 (=> (not res!346019) (not e!319209))))

(assert (=> b!553471 (= res!346019 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50642 res!346024) b!553467))

(assert (= (and b!553467 res!346025) b!553464))

(assert (= (and b!553464 res!346017) b!553471))

(assert (= (and b!553471 res!346019) b!553470))

(assert (= (and b!553470 res!346023) b!553465))

(assert (= (and b!553465 res!346016) b!553469))

(assert (= (and b!553469 res!346022) b!553466))

(assert (= (and b!553466 res!346021) b!553462))

(assert (= (and b!553462 res!346018) b!553463))

(assert (= (and b!553463 res!346020) b!553468))

(declare-fun m!530105 () Bool)

(assert (=> b!553465 m!530105))

(declare-fun m!530107 () Bool)

(assert (=> b!553466 m!530107))

(declare-fun m!530109 () Bool)

(assert (=> b!553469 m!530109))

(declare-fun m!530111 () Bool)

(assert (=> b!553471 m!530111))

(declare-fun m!530113 () Bool)

(assert (=> b!553470 m!530113))

(declare-fun m!530115 () Bool)

(assert (=> b!553462 m!530115))

(declare-fun m!530117 () Bool)

(assert (=> b!553462 m!530117))

(assert (=> b!553462 m!530115))

(declare-fun m!530119 () Bool)

(assert (=> b!553462 m!530119))

(declare-fun m!530121 () Bool)

(assert (=> b!553462 m!530121))

(assert (=> b!553462 m!530119))

(declare-fun m!530123 () Bool)

(assert (=> b!553462 m!530123))

(assert (=> b!553462 m!530117))

(assert (=> b!553462 m!530115))

(declare-fun m!530125 () Bool)

(assert (=> b!553462 m!530125))

(declare-fun m!530127 () Bool)

(assert (=> b!553462 m!530127))

(assert (=> b!553462 m!530119))

(assert (=> b!553462 m!530121))

(assert (=> b!553464 m!530115))

(assert (=> b!553464 m!530115))

(declare-fun m!530129 () Bool)

(assert (=> b!553464 m!530129))

(declare-fun m!530131 () Bool)

(assert (=> start!50642 m!530131))

(declare-fun m!530133 () Bool)

(assert (=> start!50642 m!530133))

(assert (=> b!553468 m!530115))

(assert (=> b!553468 m!530115))

(declare-fun m!530135 () Bool)

(assert (=> b!553468 m!530135))

(declare-fun m!530137 () Bool)

(assert (=> b!553463 m!530137))

(declare-fun m!530139 () Bool)

(assert (=> b!553463 m!530139))

(check-sat (not b!553464) (not b!553468) (not b!553469) (not b!553466) (not b!553462) (not b!553463) (not b!553470) (not b!553471) (not b!553465) (not start!50642))
(check-sat)
