; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51792 () Bool)

(assert start!51792)

(declare-fun b!566383 () Bool)

(declare-fun res!357256 () Bool)

(declare-fun e!325989 () Bool)

(assert (=> b!566383 (=> (not res!357256) (not e!325989))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35547 0))(
  ( (array!35548 (arr!17071 (Array (_ BitVec 32) (_ BitVec 64))) (size!17435 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35547)

(assert (=> b!566383 (= res!357256 (and (= (size!17435 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17435 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17435 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!357255 () Bool)

(assert (=> start!51792 (=> (not res!357255) (not e!325989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51792 (= res!357255 (validMask!0 mask!3119))))

(assert (=> start!51792 e!325989))

(assert (=> start!51792 true))

(declare-fun array_inv!12930 (array!35547) Bool)

(assert (=> start!51792 (array_inv!12930 a!3118)))

(declare-fun b!566384 () Bool)

(declare-fun e!325987 () Bool)

(declare-datatypes ((SeekEntryResult!5476 0))(
  ( (MissingZero!5476 (index!24131 (_ BitVec 32))) (Found!5476 (index!24132 (_ BitVec 32))) (Intermediate!5476 (undefined!6288 Bool) (index!24133 (_ BitVec 32)) (x!53148 (_ BitVec 32))) (Undefined!5476) (MissingVacant!5476 (index!24134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35547 (_ BitVec 32)) SeekEntryResult!5476)

(assert (=> b!566384 (= e!325987 (= (seekEntryOrOpen!0 (select (arr!17071 a!3118) j!142) a!3118 mask!3119) (Found!5476 j!142)))))

(declare-fun b!566385 () Bool)

(declare-fun res!357247 () Bool)

(declare-fun e!325988 () Bool)

(assert (=> b!566385 (=> (not res!357247) (not e!325988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35547 (_ BitVec 32)) Bool)

(assert (=> b!566385 (= res!357247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566386 () Bool)

(declare-fun res!357249 () Bool)

(assert (=> b!566386 (=> (not res!357249) (not e!325989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566386 (= res!357249 (validKeyInArray!0 (select (arr!17071 a!3118) j!142)))))

(declare-fun b!566387 () Bool)

(declare-fun res!357254 () Bool)

(assert (=> b!566387 (=> (not res!357254) (not e!325988))))

(declare-datatypes ((List!11058 0))(
  ( (Nil!11055) (Cons!11054 (h!12063 (_ BitVec 64)) (t!17278 List!11058)) )
))
(declare-fun arrayNoDuplicates!0 (array!35547 (_ BitVec 32) List!11058) Bool)

(assert (=> b!566387 (= res!357254 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11055))))

(declare-fun b!566388 () Bool)

(assert (=> b!566388 (= e!325988 (not true))))

(assert (=> b!566388 e!325987))

(declare-fun res!357248 () Bool)

(assert (=> b!566388 (=> (not res!357248) (not e!325987))))

(assert (=> b!566388 (= res!357248 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17725 0))(
  ( (Unit!17726) )
))
(declare-fun lt!258148 () Unit!17725)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35547 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17725)

(assert (=> b!566388 (= lt!258148 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566389 () Bool)

(declare-fun res!357253 () Bool)

(assert (=> b!566389 (=> (not res!357253) (not e!325989))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!566389 (= res!357253 (validKeyInArray!0 k0!1914))))

(declare-fun b!566390 () Bool)

(declare-fun res!357250 () Bool)

(assert (=> b!566390 (=> (not res!357250) (not e!325989))))

(declare-fun arrayContainsKey!0 (array!35547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566390 (= res!357250 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566391 () Bool)

(assert (=> b!566391 (= e!325989 e!325988)))

(declare-fun res!357252 () Bool)

(assert (=> b!566391 (=> (not res!357252) (not e!325988))))

(declare-fun lt!258147 () SeekEntryResult!5476)

(assert (=> b!566391 (= res!357252 (or (= lt!258147 (MissingZero!5476 i!1132)) (= lt!258147 (MissingVacant!5476 i!1132))))))

(assert (=> b!566391 (= lt!258147 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!566392 () Bool)

(declare-fun res!357251 () Bool)

(assert (=> b!566392 (=> (not res!357251) (not e!325988))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35547 (_ BitVec 32)) SeekEntryResult!5476)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566392 (= res!357251 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17071 a!3118) j!142) mask!3119) (select (arr!17071 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17071 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17071 a!3118) i!1132 k0!1914) j!142) (array!35548 (store (arr!17071 a!3118) i!1132 k0!1914) (size!17435 a!3118)) mask!3119)))))

(assert (= (and start!51792 res!357255) b!566383))

(assert (= (and b!566383 res!357256) b!566386))

(assert (= (and b!566386 res!357249) b!566389))

(assert (= (and b!566389 res!357253) b!566390))

(assert (= (and b!566390 res!357250) b!566391))

(assert (= (and b!566391 res!357252) b!566385))

(assert (= (and b!566385 res!357247) b!566387))

(assert (= (and b!566387 res!357254) b!566392))

(assert (= (and b!566392 res!357251) b!566388))

(assert (= (and b!566388 res!357248) b!566384))

(declare-fun m!545129 () Bool)

(assert (=> b!566390 m!545129))

(declare-fun m!545131 () Bool)

(assert (=> b!566389 m!545131))

(declare-fun m!545133 () Bool)

(assert (=> start!51792 m!545133))

(declare-fun m!545135 () Bool)

(assert (=> start!51792 m!545135))

(declare-fun m!545137 () Bool)

(assert (=> b!566391 m!545137))

(declare-fun m!545139 () Bool)

(assert (=> b!566388 m!545139))

(declare-fun m!545141 () Bool)

(assert (=> b!566388 m!545141))

(declare-fun m!545143 () Bool)

(assert (=> b!566392 m!545143))

(declare-fun m!545145 () Bool)

(assert (=> b!566392 m!545145))

(assert (=> b!566392 m!545143))

(declare-fun m!545147 () Bool)

(assert (=> b!566392 m!545147))

(declare-fun m!545149 () Bool)

(assert (=> b!566392 m!545149))

(assert (=> b!566392 m!545147))

(declare-fun m!545151 () Bool)

(assert (=> b!566392 m!545151))

(assert (=> b!566392 m!545145))

(assert (=> b!566392 m!545143))

(declare-fun m!545153 () Bool)

(assert (=> b!566392 m!545153))

(declare-fun m!545155 () Bool)

(assert (=> b!566392 m!545155))

(assert (=> b!566392 m!545147))

(assert (=> b!566392 m!545149))

(declare-fun m!545157 () Bool)

(assert (=> b!566385 m!545157))

(declare-fun m!545159 () Bool)

(assert (=> b!566387 m!545159))

(assert (=> b!566386 m!545143))

(assert (=> b!566386 m!545143))

(declare-fun m!545161 () Bool)

(assert (=> b!566386 m!545161))

(assert (=> b!566384 m!545143))

(assert (=> b!566384 m!545143))

(declare-fun m!545163 () Bool)

(assert (=> b!566384 m!545163))

(check-sat (not b!566384) (not b!566387) (not b!566388) (not b!566386) (not b!566390) (not b!566391) (not b!566389) (not start!51792) (not b!566385) (not b!566392))
(check-sat)
