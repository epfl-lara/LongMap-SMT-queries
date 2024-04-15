; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50654 () Bool)

(assert start!50654)

(declare-fun b!553643 () Bool)

(declare-fun res!346201 () Bool)

(declare-fun e!319281 () Bool)

(assert (=> b!553643 (=> (not res!346201) (not e!319281))))

(declare-datatypes ((array!34888 0))(
  ( (array!34889 (arr!16754 (Array (_ BitVec 32) (_ BitVec 64))) (size!17119 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34888)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34888 (_ BitVec 32)) Bool)

(assert (=> b!553643 (= res!346201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5200 0))(
  ( (MissingZero!5200 (index!23027 (_ BitVec 32))) (Found!5200 (index!23028 (_ BitVec 32))) (Intermediate!5200 (undefined!6012 Bool) (index!23029 (_ BitVec 32)) (x!51957 (_ BitVec 32))) (Undefined!5200) (MissingVacant!5200 (index!23030 (_ BitVec 32))) )
))
(declare-fun lt!251382 () SeekEntryResult!5200)

(declare-fun b!553644 () Bool)

(declare-fun e!319282 () Bool)

(get-info :version)

(assert (=> b!553644 (= e!319282 (not (or (not ((_ is Intermediate!5200) lt!251382)) (undefined!6012 lt!251382) (not (= (select (arr!16754 a!3118) (index!23029 lt!251382)) (select (arr!16754 a!3118) j!142))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!319280 () Bool)

(assert (=> b!553644 e!319280))

(declare-fun res!346200 () Bool)

(assert (=> b!553644 (=> (not res!346200) (not e!319280))))

(assert (=> b!553644 (= res!346200 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17160 0))(
  ( (Unit!17161) )
))
(declare-fun lt!251383 () Unit!17160)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17160)

(assert (=> b!553644 (= lt!251383 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553645 () Bool)

(declare-fun res!346202 () Bool)

(declare-fun e!319283 () Bool)

(assert (=> b!553645 (=> (not res!346202) (not e!319283))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553645 (= res!346202 (validKeyInArray!0 k0!1914))))

(declare-fun b!553646 () Bool)

(assert (=> b!553646 (= e!319281 e!319282)))

(declare-fun res!346196 () Bool)

(assert (=> b!553646 (=> (not res!346196) (not e!319282))))

(declare-fun lt!251381 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34888 (_ BitVec 32)) SeekEntryResult!5200)

(assert (=> b!553646 (= res!346196 (= lt!251382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251381 (select (store (arr!16754 a!3118) i!1132 k0!1914) j!142) (array!34889 (store (arr!16754 a!3118) i!1132 k0!1914) (size!17119 a!3118)) mask!3119)))))

(declare-fun lt!251380 () (_ BitVec 32))

(assert (=> b!553646 (= lt!251382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251380 (select (arr!16754 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553646 (= lt!251381 (toIndex!0 (select (store (arr!16754 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!553646 (= lt!251380 (toIndex!0 (select (arr!16754 a!3118) j!142) mask!3119))))

(declare-fun b!553647 () Bool)

(declare-fun res!346204 () Bool)

(assert (=> b!553647 (=> (not res!346204) (not e!319283))))

(assert (=> b!553647 (= res!346204 (validKeyInArray!0 (select (arr!16754 a!3118) j!142)))))

(declare-fun b!553648 () Bool)

(declare-fun res!346205 () Bool)

(assert (=> b!553648 (=> (not res!346205) (not e!319283))))

(declare-fun arrayContainsKey!0 (array!34888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553648 (= res!346205 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553649 () Bool)

(declare-fun res!346197 () Bool)

(assert (=> b!553649 (=> (not res!346197) (not e!319283))))

(assert (=> b!553649 (= res!346197 (and (= (size!17119 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17119 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17119 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553650 () Bool)

(declare-fun res!346198 () Bool)

(assert (=> b!553650 (=> (not res!346198) (not e!319281))))

(declare-datatypes ((List!10873 0))(
  ( (Nil!10870) (Cons!10869 (h!11854 (_ BitVec 64)) (t!17092 List!10873)) )
))
(declare-fun arrayNoDuplicates!0 (array!34888 (_ BitVec 32) List!10873) Bool)

(assert (=> b!553650 (= res!346198 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10870))))

(declare-fun b!553651 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34888 (_ BitVec 32)) SeekEntryResult!5200)

(assert (=> b!553651 (= e!319280 (= (seekEntryOrOpen!0 (select (arr!16754 a!3118) j!142) a!3118 mask!3119) (Found!5200 j!142)))))

(declare-fun res!346199 () Bool)

(assert (=> start!50654 (=> (not res!346199) (not e!319283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50654 (= res!346199 (validMask!0 mask!3119))))

(assert (=> start!50654 e!319283))

(assert (=> start!50654 true))

(declare-fun array_inv!12637 (array!34888) Bool)

(assert (=> start!50654 (array_inv!12637 a!3118)))

(declare-fun b!553642 () Bool)

(assert (=> b!553642 (= e!319283 e!319281)))

(declare-fun res!346203 () Bool)

(assert (=> b!553642 (=> (not res!346203) (not e!319281))))

(declare-fun lt!251379 () SeekEntryResult!5200)

(assert (=> b!553642 (= res!346203 (or (= lt!251379 (MissingZero!5200 i!1132)) (= lt!251379 (MissingVacant!5200 i!1132))))))

(assert (=> b!553642 (= lt!251379 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50654 res!346199) b!553649))

(assert (= (and b!553649 res!346197) b!553647))

(assert (= (and b!553647 res!346204) b!553645))

(assert (= (and b!553645 res!346202) b!553648))

(assert (= (and b!553648 res!346205) b!553642))

(assert (= (and b!553642 res!346203) b!553643))

(assert (= (and b!553643 res!346201) b!553650))

(assert (= (and b!553650 res!346198) b!553646))

(assert (= (and b!553646 res!346196) b!553644))

(assert (= (and b!553644 res!346200) b!553651))

(declare-fun m!530321 () Bool)

(assert (=> b!553647 m!530321))

(assert (=> b!553647 m!530321))

(declare-fun m!530323 () Bool)

(assert (=> b!553647 m!530323))

(declare-fun m!530325 () Bool)

(assert (=> b!553650 m!530325))

(assert (=> b!553646 m!530321))

(declare-fun m!530327 () Bool)

(assert (=> b!553646 m!530327))

(assert (=> b!553646 m!530321))

(declare-fun m!530329 () Bool)

(assert (=> b!553646 m!530329))

(assert (=> b!553646 m!530321))

(declare-fun m!530331 () Bool)

(assert (=> b!553646 m!530331))

(assert (=> b!553646 m!530331))

(declare-fun m!530333 () Bool)

(assert (=> b!553646 m!530333))

(declare-fun m!530335 () Bool)

(assert (=> b!553646 m!530335))

(assert (=> b!553646 m!530331))

(declare-fun m!530337 () Bool)

(assert (=> b!553646 m!530337))

(declare-fun m!530339 () Bool)

(assert (=> b!553643 m!530339))

(declare-fun m!530341 () Bool)

(assert (=> start!50654 m!530341))

(declare-fun m!530343 () Bool)

(assert (=> start!50654 m!530343))

(declare-fun m!530345 () Bool)

(assert (=> b!553645 m!530345))

(declare-fun m!530347 () Bool)

(assert (=> b!553644 m!530347))

(assert (=> b!553644 m!530321))

(declare-fun m!530349 () Bool)

(assert (=> b!553644 m!530349))

(declare-fun m!530351 () Bool)

(assert (=> b!553644 m!530351))

(declare-fun m!530353 () Bool)

(assert (=> b!553648 m!530353))

(assert (=> b!553651 m!530321))

(assert (=> b!553651 m!530321))

(declare-fun m!530355 () Bool)

(assert (=> b!553651 m!530355))

(declare-fun m!530357 () Bool)

(assert (=> b!553642 m!530357))

(check-sat (not b!553644) (not b!553642) (not b!553648) (not b!553645) (not b!553651) (not start!50654) (not b!553650) (not b!553643) (not b!553647) (not b!553646))
(check-sat)
