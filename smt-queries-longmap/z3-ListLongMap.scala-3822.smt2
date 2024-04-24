; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52464 () Bool)

(assert start!52464)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35808 0))(
  ( (array!35809 (arr!17191 (Array (_ BitVec 32) (_ BitVec 64))) (size!17555 (_ BitVec 32))) )
))
(declare-fun lt!261127 () array!35808)

(declare-datatypes ((SeekEntryResult!5596 0))(
  ( (MissingZero!5596 (index!24611 (_ BitVec 32))) (Found!5596 (index!24612 (_ BitVec 32))) (Intermediate!5596 (undefined!6408 Bool) (index!24613 (_ BitVec 32)) (x!53636 (_ BitVec 32))) (Undefined!5596) (MissingVacant!5596 (index!24614 (_ BitVec 32))) )
))
(declare-fun lt!261130 () SeekEntryResult!5596)

(declare-fun lt!261125 () (_ BitVec 64))

(declare-fun e!329204 () Bool)

(declare-fun b!572314 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35808 (_ BitVec 32)) SeekEntryResult!5596)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35808 (_ BitVec 32)) SeekEntryResult!5596)

(assert (=> b!572314 (= e!329204 (= (seekEntryOrOpen!0 lt!261125 lt!261127 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53636 lt!261130) (index!24613 lt!261130) (index!24613 lt!261130) lt!261125 lt!261127 mask!3119)))))

(declare-fun b!572315 () Bool)

(declare-fun e!329205 () Bool)

(declare-fun e!329209 () Bool)

(assert (=> b!572315 (= e!329205 e!329209)))

(declare-fun res!361717 () Bool)

(assert (=> b!572315 (=> (not res!361717) (not e!329209))))

(declare-fun lt!261124 () SeekEntryResult!5596)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572315 (= res!361717 (or (= lt!261124 (MissingZero!5596 i!1132)) (= lt!261124 (MissingVacant!5596 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun a!3118 () array!35808)

(assert (=> b!572315 (= lt!261124 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572316 () Bool)

(declare-fun res!361720 () Bool)

(assert (=> b!572316 (=> (not res!361720) (not e!329205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572316 (= res!361720 (validKeyInArray!0 k0!1914))))

(declare-fun b!572317 () Bool)

(declare-fun e!329208 () Bool)

(assert (=> b!572317 (= e!329209 e!329208)))

(declare-fun res!361719 () Bool)

(assert (=> b!572317 (=> (not res!361719) (not e!329208))))

(declare-fun lt!261122 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35808 (_ BitVec 32)) SeekEntryResult!5596)

(assert (=> b!572317 (= res!361719 (= lt!261130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261122 lt!261125 lt!261127 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!261123 () (_ BitVec 32))

(assert (=> b!572317 (= lt!261130 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261123 (select (arr!17191 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572317 (= lt!261122 (toIndex!0 lt!261125 mask!3119))))

(assert (=> b!572317 (= lt!261125 (select (store (arr!17191 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572317 (= lt!261123 (toIndex!0 (select (arr!17191 a!3118) j!142) mask!3119))))

(assert (=> b!572317 (= lt!261127 (array!35809 (store (arr!17191 a!3118) i!1132 k0!1914) (size!17555 a!3118)))))

(declare-fun b!572318 () Bool)

(declare-fun res!361721 () Bool)

(assert (=> b!572318 (=> (not res!361721) (not e!329205))))

(declare-fun arrayContainsKey!0 (array!35808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572318 (= res!361721 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572319 () Bool)

(declare-fun res!361728 () Bool)

(assert (=> b!572319 (=> (not res!361728) (not e!329209))))

(declare-datatypes ((List!11178 0))(
  ( (Nil!11175) (Cons!11174 (h!12204 (_ BitVec 64)) (t!17398 List!11178)) )
))
(declare-fun arrayNoDuplicates!0 (array!35808 (_ BitVec 32) List!11178) Bool)

(assert (=> b!572319 (= res!361728 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11175))))

(declare-fun b!572320 () Bool)

(declare-fun e!329207 () Bool)

(assert (=> b!572320 (= e!329207 e!329204)))

(declare-fun res!361727 () Bool)

(assert (=> b!572320 (=> (not res!361727) (not e!329204))))

(declare-fun lt!261128 () SeekEntryResult!5596)

(assert (=> b!572320 (= res!361727 (= lt!261128 (seekKeyOrZeroReturnVacant!0 (x!53636 lt!261130) (index!24613 lt!261130) (index!24613 lt!261130) (select (arr!17191 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!361723 () Bool)

(assert (=> start!52464 (=> (not res!361723) (not e!329205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52464 (= res!361723 (validMask!0 mask!3119))))

(assert (=> start!52464 e!329205))

(assert (=> start!52464 true))

(declare-fun array_inv!13050 (array!35808) Bool)

(assert (=> start!52464 (array_inv!13050 a!3118)))

(declare-fun b!572321 () Bool)

(assert (=> b!572321 (= e!329208 (not true))))

(declare-fun e!329206 () Bool)

(assert (=> b!572321 e!329206))

(declare-fun res!361722 () Bool)

(assert (=> b!572321 (=> (not res!361722) (not e!329206))))

(assert (=> b!572321 (= res!361722 (= lt!261128 (Found!5596 j!142)))))

(assert (=> b!572321 (= lt!261128 (seekEntryOrOpen!0 (select (arr!17191 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35808 (_ BitVec 32)) Bool)

(assert (=> b!572321 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17965 0))(
  ( (Unit!17966) )
))
(declare-fun lt!261126 () Unit!17965)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17965)

(assert (=> b!572321 (= lt!261126 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572322 () Bool)

(declare-fun res!361726 () Bool)

(assert (=> b!572322 (=> (not res!361726) (not e!329205))))

(assert (=> b!572322 (= res!361726 (validKeyInArray!0 (select (arr!17191 a!3118) j!142)))))

(declare-fun b!572323 () Bool)

(declare-fun res!361725 () Bool)

(assert (=> b!572323 (=> (not res!361725) (not e!329209))))

(assert (=> b!572323 (= res!361725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572324 () Bool)

(declare-fun e!329210 () Bool)

(assert (=> b!572324 (= e!329210 e!329207)))

(declare-fun res!361729 () Bool)

(assert (=> b!572324 (=> res!361729 e!329207)))

(declare-fun lt!261129 () (_ BitVec 64))

(assert (=> b!572324 (= res!361729 (or (= lt!261129 (select (arr!17191 a!3118) j!142)) (= lt!261129 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572324 (= lt!261129 (select (arr!17191 a!3118) (index!24613 lt!261130)))))

(declare-fun b!572325 () Bool)

(declare-fun res!361724 () Bool)

(assert (=> b!572325 (=> (not res!361724) (not e!329205))))

(assert (=> b!572325 (= res!361724 (and (= (size!17555 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17555 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17555 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572326 () Bool)

(assert (=> b!572326 (= e!329206 e!329210)))

(declare-fun res!361718 () Bool)

(assert (=> b!572326 (=> res!361718 e!329210)))

(get-info :version)

(assert (=> b!572326 (= res!361718 (or (undefined!6408 lt!261130) (not ((_ is Intermediate!5596) lt!261130))))))

(assert (= (and start!52464 res!361723) b!572325))

(assert (= (and b!572325 res!361724) b!572322))

(assert (= (and b!572322 res!361726) b!572316))

(assert (= (and b!572316 res!361720) b!572318))

(assert (= (and b!572318 res!361721) b!572315))

(assert (= (and b!572315 res!361717) b!572323))

(assert (= (and b!572323 res!361725) b!572319))

(assert (= (and b!572319 res!361728) b!572317))

(assert (= (and b!572317 res!361719) b!572321))

(assert (= (and b!572321 res!361722) b!572326))

(assert (= (and b!572326 (not res!361718)) b!572324))

(assert (= (and b!572324 (not res!361729)) b!572320))

(assert (= (and b!572320 res!361727) b!572314))

(declare-fun m!551387 () Bool)

(assert (=> b!572314 m!551387))

(declare-fun m!551389 () Bool)

(assert (=> b!572314 m!551389))

(declare-fun m!551391 () Bool)

(assert (=> b!572323 m!551391))

(declare-fun m!551393 () Bool)

(assert (=> b!572324 m!551393))

(declare-fun m!551395 () Bool)

(assert (=> b!572324 m!551395))

(declare-fun m!551397 () Bool)

(assert (=> start!52464 m!551397))

(declare-fun m!551399 () Bool)

(assert (=> start!52464 m!551399))

(declare-fun m!551401 () Bool)

(assert (=> b!572315 m!551401))

(declare-fun m!551403 () Bool)

(assert (=> b!572318 m!551403))

(declare-fun m!551405 () Bool)

(assert (=> b!572316 m!551405))

(assert (=> b!572320 m!551393))

(assert (=> b!572320 m!551393))

(declare-fun m!551407 () Bool)

(assert (=> b!572320 m!551407))

(assert (=> b!572322 m!551393))

(assert (=> b!572322 m!551393))

(declare-fun m!551409 () Bool)

(assert (=> b!572322 m!551409))

(declare-fun m!551411 () Bool)

(assert (=> b!572319 m!551411))

(assert (=> b!572321 m!551393))

(assert (=> b!572321 m!551393))

(declare-fun m!551413 () Bool)

(assert (=> b!572321 m!551413))

(declare-fun m!551415 () Bool)

(assert (=> b!572321 m!551415))

(declare-fun m!551417 () Bool)

(assert (=> b!572321 m!551417))

(assert (=> b!572317 m!551393))

(declare-fun m!551419 () Bool)

(assert (=> b!572317 m!551419))

(assert (=> b!572317 m!551393))

(declare-fun m!551421 () Bool)

(assert (=> b!572317 m!551421))

(declare-fun m!551423 () Bool)

(assert (=> b!572317 m!551423))

(declare-fun m!551425 () Bool)

(assert (=> b!572317 m!551425))

(assert (=> b!572317 m!551393))

(declare-fun m!551427 () Bool)

(assert (=> b!572317 m!551427))

(declare-fun m!551429 () Bool)

(assert (=> b!572317 m!551429))

(check-sat (not b!572319) (not b!572314) (not b!572318) (not b!572315) (not start!52464) (not b!572323) (not b!572322) (not b!572316) (not b!572317) (not b!572321) (not b!572320))
(check-sat)
