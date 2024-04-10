; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50836 () Bool)

(assert start!50836)

(declare-fun b!556319 () Bool)

(declare-fun res!348733 () Bool)

(declare-fun e!320520 () Bool)

(assert (=> b!556319 (=> (not res!348733) (not e!320520))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35061 0))(
  ( (array!35062 (arr!16840 (Array (_ BitVec 32) (_ BitVec 64))) (size!17204 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35061)

(declare-datatypes ((SeekEntryResult!5289 0))(
  ( (MissingZero!5289 (index!23383 (_ BitVec 32))) (Found!5289 (index!23384 (_ BitVec 32))) (Intermediate!5289 (undefined!6101 Bool) (index!23385 (_ BitVec 32)) (x!52275 (_ BitVec 32))) (Undefined!5289) (MissingVacant!5289 (index!23386 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35061 (_ BitVec 32)) SeekEntryResult!5289)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556319 (= res!348733 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16840 a!3118) j!142) mask!3119) (select (arr!16840 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16840 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16840 a!3118) i!1132 k0!1914) j!142) (array!35062 (store (arr!16840 a!3118) i!1132 k0!1914) (size!17204 a!3118)) mask!3119)))))

(declare-fun b!556320 () Bool)

(declare-fun res!348732 () Bool)

(declare-fun e!320519 () Bool)

(assert (=> b!556320 (=> (not res!348732) (not e!320519))))

(assert (=> b!556320 (= res!348732 (and (= (size!17204 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17204 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17204 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556321 () Bool)

(declare-fun e!320518 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35061 (_ BitVec 32)) SeekEntryResult!5289)

(assert (=> b!556321 (= e!320518 (= (seekEntryOrOpen!0 (select (arr!16840 a!3118) j!142) a!3118 mask!3119) (Found!5289 j!142)))))

(declare-fun b!556322 () Bool)

(declare-fun res!348737 () Bool)

(assert (=> b!556322 (=> (not res!348737) (not e!320520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35061 (_ BitVec 32)) Bool)

(assert (=> b!556322 (= res!348737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556323 () Bool)

(declare-fun res!348736 () Bool)

(assert (=> b!556323 (=> (not res!348736) (not e!320519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556323 (= res!348736 (validKeyInArray!0 k0!1914))))

(declare-fun res!348734 () Bool)

(assert (=> start!50836 (=> (not res!348734) (not e!320519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50836 (= res!348734 (validMask!0 mask!3119))))

(assert (=> start!50836 e!320519))

(assert (=> start!50836 true))

(declare-fun array_inv!12636 (array!35061) Bool)

(assert (=> start!50836 (array_inv!12636 a!3118)))

(declare-fun b!556324 () Bool)

(assert (=> b!556324 (= e!320520 (not true))))

(assert (=> b!556324 e!320518))

(declare-fun res!348739 () Bool)

(assert (=> b!556324 (=> (not res!348739) (not e!320518))))

(assert (=> b!556324 (= res!348739 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17352 0))(
  ( (Unit!17353) )
))
(declare-fun lt!252838 () Unit!17352)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35061 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17352)

(assert (=> b!556324 (= lt!252838 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556325 () Bool)

(assert (=> b!556325 (= e!320519 e!320520)))

(declare-fun res!348731 () Bool)

(assert (=> b!556325 (=> (not res!348731) (not e!320520))))

(declare-fun lt!252837 () SeekEntryResult!5289)

(assert (=> b!556325 (= res!348731 (or (= lt!252837 (MissingZero!5289 i!1132)) (= lt!252837 (MissingVacant!5289 i!1132))))))

(assert (=> b!556325 (= lt!252837 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556326 () Bool)

(declare-fun res!348738 () Bool)

(assert (=> b!556326 (=> (not res!348738) (not e!320519))))

(declare-fun arrayContainsKey!0 (array!35061 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556326 (= res!348738 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556327 () Bool)

(declare-fun res!348740 () Bool)

(assert (=> b!556327 (=> (not res!348740) (not e!320520))))

(declare-datatypes ((List!10920 0))(
  ( (Nil!10917) (Cons!10916 (h!11901 (_ BitVec 64)) (t!17148 List!10920)) )
))
(declare-fun arrayNoDuplicates!0 (array!35061 (_ BitVec 32) List!10920) Bool)

(assert (=> b!556327 (= res!348740 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10917))))

(declare-fun b!556328 () Bool)

(declare-fun res!348735 () Bool)

(assert (=> b!556328 (=> (not res!348735) (not e!320519))))

(assert (=> b!556328 (= res!348735 (validKeyInArray!0 (select (arr!16840 a!3118) j!142)))))

(assert (= (and start!50836 res!348734) b!556320))

(assert (= (and b!556320 res!348732) b!556328))

(assert (= (and b!556328 res!348735) b!556323))

(assert (= (and b!556323 res!348736) b!556326))

(assert (= (and b!556326 res!348738) b!556325))

(assert (= (and b!556325 res!348731) b!556322))

(assert (= (and b!556322 res!348737) b!556327))

(assert (= (and b!556327 res!348740) b!556319))

(assert (= (and b!556319 res!348733) b!556324))

(assert (= (and b!556324 res!348739) b!556321))

(declare-fun m!534285 () Bool)

(assert (=> start!50836 m!534285))

(declare-fun m!534287 () Bool)

(assert (=> start!50836 m!534287))

(declare-fun m!534289 () Bool)

(assert (=> b!556322 m!534289))

(declare-fun m!534291 () Bool)

(assert (=> b!556321 m!534291))

(assert (=> b!556321 m!534291))

(declare-fun m!534293 () Bool)

(assert (=> b!556321 m!534293))

(declare-fun m!534295 () Bool)

(assert (=> b!556324 m!534295))

(declare-fun m!534297 () Bool)

(assert (=> b!556324 m!534297))

(assert (=> b!556328 m!534291))

(assert (=> b!556328 m!534291))

(declare-fun m!534299 () Bool)

(assert (=> b!556328 m!534299))

(declare-fun m!534301 () Bool)

(assert (=> b!556325 m!534301))

(declare-fun m!534303 () Bool)

(assert (=> b!556326 m!534303))

(declare-fun m!534305 () Bool)

(assert (=> b!556323 m!534305))

(assert (=> b!556319 m!534291))

(declare-fun m!534307 () Bool)

(assert (=> b!556319 m!534307))

(assert (=> b!556319 m!534291))

(declare-fun m!534309 () Bool)

(assert (=> b!556319 m!534309))

(declare-fun m!534311 () Bool)

(assert (=> b!556319 m!534311))

(assert (=> b!556319 m!534309))

(declare-fun m!534313 () Bool)

(assert (=> b!556319 m!534313))

(assert (=> b!556319 m!534307))

(assert (=> b!556319 m!534291))

(declare-fun m!534315 () Bool)

(assert (=> b!556319 m!534315))

(declare-fun m!534317 () Bool)

(assert (=> b!556319 m!534317))

(assert (=> b!556319 m!534309))

(assert (=> b!556319 m!534311))

(declare-fun m!534319 () Bool)

(assert (=> b!556327 m!534319))

(check-sat (not b!556324) (not b!556327) (not b!556325) (not b!556322) (not b!556328) (not b!556321) (not b!556319) (not b!556323) (not b!556326) (not start!50836))
(check-sat)
