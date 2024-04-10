; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50412 () Bool)

(assert start!50412)

(declare-fun b!551303 () Bool)

(declare-fun res!344086 () Bool)

(declare-fun e!318207 () Bool)

(assert (=> b!551303 (=> (not res!344086) (not e!318207))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34751 0))(
  ( (array!34752 (arr!16688 (Array (_ BitVec 32) (_ BitVec 64))) (size!17052 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34751)

(declare-datatypes ((SeekEntryResult!5137 0))(
  ( (MissingZero!5137 (index!22775 (_ BitVec 32))) (Found!5137 (index!22776 (_ BitVec 32))) (Intermediate!5137 (undefined!5949 Bool) (index!22777 (_ BitVec 32)) (x!51703 (_ BitVec 32))) (Undefined!5137) (MissingVacant!5137 (index!22778 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34751 (_ BitVec 32)) SeekEntryResult!5137)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551303 (= res!344086 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16688 a!3118) j!142) mask!3119) (select (arr!16688 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16688 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16688 a!3118) i!1132 k!1914) j!142) (array!34752 (store (arr!16688 a!3118) i!1132 k!1914) (size!17052 a!3118)) mask!3119)))))

(declare-fun b!551304 () Bool)

(declare-fun res!344088 () Bool)

(declare-fun e!318206 () Bool)

(assert (=> b!551304 (=> (not res!344088) (not e!318206))))

(declare-fun arrayContainsKey!0 (array!34751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551304 (= res!344088 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551305 () Bool)

(declare-fun res!344083 () Bool)

(assert (=> b!551305 (=> (not res!344083) (not e!318206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551305 (= res!344083 (validKeyInArray!0 k!1914))))

(declare-fun b!551306 () Bool)

(declare-fun e!318204 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34751 (_ BitVec 32)) SeekEntryResult!5137)

(assert (=> b!551306 (= e!318204 (= (seekEntryOrOpen!0 (select (arr!16688 a!3118) j!142) a!3118 mask!3119) (Found!5137 j!142)))))

(declare-fun b!551308 () Bool)

(declare-fun res!344090 () Bool)

(assert (=> b!551308 (=> (not res!344090) (not e!318207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34751 (_ BitVec 32)) Bool)

(assert (=> b!551308 (= res!344090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551309 () Bool)

(assert (=> b!551309 (= e!318207 (not true))))

(assert (=> b!551309 e!318204))

(declare-fun res!344082 () Bool)

(assert (=> b!551309 (=> (not res!344082) (not e!318204))))

(assert (=> b!551309 (= res!344082 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17048 0))(
  ( (Unit!17049) )
))
(declare-fun lt!250804 () Unit!17048)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17048)

(assert (=> b!551309 (= lt!250804 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551310 () Bool)

(assert (=> b!551310 (= e!318206 e!318207)))

(declare-fun res!344089 () Bool)

(assert (=> b!551310 (=> (not res!344089) (not e!318207))))

(declare-fun lt!250803 () SeekEntryResult!5137)

(assert (=> b!551310 (= res!344089 (or (= lt!250803 (MissingZero!5137 i!1132)) (= lt!250803 (MissingVacant!5137 i!1132))))))

(assert (=> b!551310 (= lt!250803 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!551311 () Bool)

(declare-fun res!344084 () Bool)

(assert (=> b!551311 (=> (not res!344084) (not e!318206))))

(assert (=> b!551311 (= res!344084 (and (= (size!17052 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17052 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17052 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551312 () Bool)

(declare-fun res!344081 () Bool)

(assert (=> b!551312 (=> (not res!344081) (not e!318206))))

(assert (=> b!551312 (= res!344081 (validKeyInArray!0 (select (arr!16688 a!3118) j!142)))))

(declare-fun b!551307 () Bool)

(declare-fun res!344087 () Bool)

(assert (=> b!551307 (=> (not res!344087) (not e!318207))))

(declare-datatypes ((List!10768 0))(
  ( (Nil!10765) (Cons!10764 (h!11743 (_ BitVec 64)) (t!16996 List!10768)) )
))
(declare-fun arrayNoDuplicates!0 (array!34751 (_ BitVec 32) List!10768) Bool)

(assert (=> b!551307 (= res!344087 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10765))))

(declare-fun res!344085 () Bool)

(assert (=> start!50412 (=> (not res!344085) (not e!318206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50412 (= res!344085 (validMask!0 mask!3119))))

(assert (=> start!50412 e!318206))

(assert (=> start!50412 true))

(declare-fun array_inv!12484 (array!34751) Bool)

(assert (=> start!50412 (array_inv!12484 a!3118)))

(assert (= (and start!50412 res!344085) b!551311))

(assert (= (and b!551311 res!344084) b!551312))

(assert (= (and b!551312 res!344081) b!551305))

(assert (= (and b!551305 res!344083) b!551304))

(assert (= (and b!551304 res!344088) b!551310))

(assert (= (and b!551310 res!344089) b!551308))

(assert (= (and b!551308 res!344090) b!551307))

(assert (= (and b!551307 res!344087) b!551303))

(assert (= (and b!551303 res!344086) b!551309))

(assert (= (and b!551309 res!344082) b!551306))

(declare-fun m!528261 () Bool)

(assert (=> b!551308 m!528261))

(declare-fun m!528263 () Bool)

(assert (=> b!551304 m!528263))

(declare-fun m!528265 () Bool)

(assert (=> b!551312 m!528265))

(assert (=> b!551312 m!528265))

(declare-fun m!528267 () Bool)

(assert (=> b!551312 m!528267))

(declare-fun m!528269 () Bool)

(assert (=> b!551309 m!528269))

(declare-fun m!528271 () Bool)

(assert (=> b!551309 m!528271))

(assert (=> b!551303 m!528265))

(declare-fun m!528273 () Bool)

(assert (=> b!551303 m!528273))

(assert (=> b!551303 m!528265))

(declare-fun m!528275 () Bool)

(assert (=> b!551303 m!528275))

(declare-fun m!528277 () Bool)

(assert (=> b!551303 m!528277))

(assert (=> b!551303 m!528275))

(declare-fun m!528279 () Bool)

(assert (=> b!551303 m!528279))

(assert (=> b!551303 m!528273))

(assert (=> b!551303 m!528265))

(declare-fun m!528281 () Bool)

(assert (=> b!551303 m!528281))

(declare-fun m!528283 () Bool)

(assert (=> b!551303 m!528283))

(assert (=> b!551303 m!528275))

(assert (=> b!551303 m!528277))

(declare-fun m!528285 () Bool)

(assert (=> b!551307 m!528285))

(declare-fun m!528287 () Bool)

(assert (=> b!551305 m!528287))

(declare-fun m!528289 () Bool)

(assert (=> start!50412 m!528289))

(declare-fun m!528291 () Bool)

(assert (=> start!50412 m!528291))

(assert (=> b!551306 m!528265))

(assert (=> b!551306 m!528265))

(declare-fun m!528293 () Bool)

(assert (=> b!551306 m!528293))

(declare-fun m!528295 () Bool)

(assert (=> b!551310 m!528295))

(push 1)

